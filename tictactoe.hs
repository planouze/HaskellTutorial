import Text.Read

main = do
  let table = [[show (x*3+1), show (x*3+2), show (x*3+3)] | x <- [2, 1..0]]
  doRound table "X" "O"

doRound table curPlayerChar otherPlayerChar = do -- Have both players do their turns
  newTable <- playTurn curPlayerChar table
  let endStatus = checkEnd newTable
  print endStatus
  if endStatus == -1 -- We have a winner!
    then do
      display newTable
      putStrLn ("Congratulations player " ++ curPlayerChar ++ " you are the winner!")
    else if endStatus == 0 -- We are out of moves!
      then do
        display newTable
        putStrLn "All moves have been exhausted; it's a tie!"
        else -- No winner, still moves available, next player's turn!
          doRound newTable otherPlayerChar curPlayerChar

checkEnd table = do
  -- Check the rows
  let rowsMax = maximum [(if row !! 0 == row !! 1 then 1 else 0) + (if row !! 0 == row !! 2 then 1 else 0) | row <- table]
  if rowsMax == 2
    then -1
    else do -- Check the columns
      let colsMax = maximum [(if ((table !! 0) !! x) == ((table !! 1) !! x) then 1 else 0) + (if ((table !! 0) !! x) == ((table !! 2) !! x) then 1 else 0) | x <- [0..2]]
      if colsMax == 2
        then -1
        else do -- Check the diagonals
          let diagMax = maximum [(if ((table !! 0) !! 0) == ((table !! 1) !! 1) then 1 else 0) + (if ((table !! 0) !! 0) == ((table !! 2) !! 2) then 1 else 0), (if ((table !! 0) !! 2) == ((table !! 1) !! 1) then 1 else 0) + (if ((table !! 0) !! 2) == ((table !! 2) !! 0) then 1 else 0)]
          if diagMax == 2
            then -1
            else do -- There is currently no winner, but maybe there are no moves left either
              let board1D = table !! 0 ++ table !! 1 ++ table !! 2
              maximum [ maybe 0 id (readMaybe x :: Maybe Int) | x <- board1D]
playTurn playerChar table = do
  display table
  putStrLn ("It is player " ++ playerChar ++ "'s turn.")
  putStr "Where would you like to play? "
  maybeMove <- getLine
  let move = (maybe 0 id (readMaybe maybeMove :: Maybe Int))
  if elem move [1..9]
    then do
      let row = 2 - (div (move - 1) 3)
      let col = mod (move - 1) 3
      -- Now that we have the position of the move in the lists
      -- check that the position is not already used
      if (maybe 0 id (readMaybe ((table !! row) !! col) :: Maybe Int)) > 0
        then do -- The position is empty so lets apply our move
          return (doMove row col playerChar table)
        else do -- The position is already played
          putStrLn ("\n\n\n\n\n\n\n\nThe location " ++ maybeMove ++ " is already controlled by player " ++ ((table !! row) !! col))
          playTurn playerChar table
    else do -- If its not a valid choice then ask again
      putStrLn ("\n\n\n\n\n\n\n\n'" ++ maybeMove ++ "' is not a valid location")
      playTurn playerChar table

doMove row col playerChar table = do
  let (beforeRow, wantedRow:afterRow) = splitAt row table
  let (beforeCol, wantedCol:afterCol) = splitAt col wantedRow
  (beforeRow ++ (beforeCol ++ playerChar:afterCol):afterRow)

display table = do
  putStrLn (surround "\n +---+---+---+ \n" [surround " | " x | x <- table])

surround buf list = do
  if (null list)
    then do
    buf
    else do
      buf ++ head list ++ surround buf (tail list)
