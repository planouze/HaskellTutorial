import Text.Read

main = do
  let table = [[show (x*3+1), show (x*3+2), show (x*3+3)] | x <- [2, 1..0]]
  playTurn "x" table

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
          doMove row col playerChar table
        else do -- The position is already played
          putStrLn ("The location " ++ maybeMove ++ " is already controller by player " ++ ((table !! row) !! col))
          playTurn playerChar table
    else do -- If its not a valid choice then ask again
      putStrLn ("'" ++ maybeMove ++ "' is not a valid location")
      playTurn playerChar table

doMove row col playerChar table = do
  let (beforeRow, wantedRow:afterRow) = splitAt row table
  let (beforeCol, wantedCol:afterCol) = splitAt col wantedRow

  print (beforeRow ++ (beforeCol ++ playerChar:afterCol):afterRow)

display table = do
  putStrLn (surround "\n +---+---+---+ \n" [surround " | " x | x <- table])

surround buf list = do
  if (null list)
    then do
    buf
    else do
      buf ++ head list ++ surround buf (tail list)
