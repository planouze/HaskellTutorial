Haskell Tutorial
================

Comment Commencer?
------------------
- Allez à la page officiel de haskell et télécharger la bonne version pour votre système.
    - https://www.haskell.org/platform/
- Compléter l’installation de la plateforme Haskell.
- Sassurer davoir un éditeur de code tel que notepad++.
Voila, tout les outils necessaire pour commencer son pret a etre utilise.

Quel est le but de ce didacticielle?
------------------------------------
Notre but aujourd'hui va être de faire un implémentation du jeu de tic-tac-toe en haskell dans un terminal de texte.
Le jeu va etre tres simple, mais va aider à démontrer les technique utilisé pour la programmation fonctionnelle. Le jeu va se jouer en multijoueur local ou les deux joueur tour à tour vont entrer le chiffre correspondant à la case ou il désire jouer son pion sur un grille 3x3 ou la case en bas à gauche va être le 1 et la case en haut à droite le 9. L'addition d'un adversaire non joueur va être laissée comme exercice au lecteure.

Etape 1 - La base du jeu
------------------------
Le but de cette étape est tout simplement de montrer visuellement un tableau dans la console qui va représenter le tableau de jeu.
Pour commencer nous allons créer le fichier ``tictactoe.hs`` et y mettre le code suivant
```
main = do
  let table = [[show (x*3+1), show (x*3+2), show (x*3+3)] | x <- [2, 1..0]]
  display table

display table = do
  putStrLn (surround "\n +---+---+---+\n" [surround " | " x | x <- table])

surround buf list = do
  if (null list)
    then do
    buf
    else do
      buf ++ head list ++ surround buf (tail list)
```

La fonction main va être la fonction principale qui est appelé lors de l'exécution du programme. La première ligne de la fonction main ici est plutôt intéressante puisqu'elle crée le tableau de base que notre jeu va utiliser
Ce que cette ligne représente dans des termes plus simple est que pour chaque x entre 2 et 0 on construit une list ``[show (x*3+1), show (x*3+2), show (x*3+3)]`` et on l'ajoute à la liste parent. Ici les ``show`` sont utilisés pour que les chiffre résultant des formules deviennent des caractères.

La fonction surround crée une chaîne de caractères de tel que la chaîne ``buf`` se retrouve avant et après chaque élément de ``list`` sans répétition de ``buf``

La fonction display, elle crée la chaîne représentant un tableau entier en utilisant ``\n +---+---+---+ \n`` autour de chaque ligne du tableau et `` | `` autour de chaque élément de chaque ligne pour donner le résultat suivant:

```
+---+---+---+
| 7 | 8 | 9 |
+---+---+---+
| 4 | 5 | 6 |
+---+---+---+
| 1 | 2 | 3 |
+---+---+---+
```

Etape 2 - L'input du joueur
---------------------------
Maintenant que nous sommes capable de voir une représentation visuelle du tableau de jeu il est temps d'ajouter les fonctions de input. Ces fonctions vont prendre l'input du joueur et crée un nouveau tableau que nous allons ensuite montrer au deuxième joueur à son tour; pour l'instant nous allons seulement nous assurer d'être capable de prendre les inputs d'un joueur, le game loop va venir à l'étape 3.

Pour ce faire nous allons rajouter les fonctions suivante:
```
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
        then do -- The position is empty, so let's apply our move
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
  display (beforeRow ++ (beforeCol ++ playerChar:afterCol):afterRow)
```
Nous allons aussi modifier le main pour qu'il appelle
```
newTable <- playTurn "x" table
display table
```
au lieux de ``display table`` pour que notre programme utilise ses nouvelles fonctionnalités. Le ``<-`` est pour indiquer que playTurn fait des actions de IO et donc que le retour de cette fonction doit être calculé au lieux d'être mit/pris en cache.

La fonction play Turn est celle qui va prendre l'input du joueur, faire la validation pour être sur que la sélection du joueur est bel et bien une sélection valide et si elle l'est va ensuite lancer la fonction doMove pour appliquer la sélection sur le tableau.

Dans play Turn nous voyons plusieurs fonction de IO, tel que ``putStr``, ``putStrLn``, ``getLine`` en plus des ``Maybe``. ``putStr`` est exactement comme ``putStrLn`` mais n'en vois pas a la prochaine ligne après sont écrite à l'écran. ``getLine`` lit bien assurément une ligne de texte écrite dans le terminal, mais ici nous utilisons pas directement sa valeur. La raison étant que nous avons besoins de connaître quel était le chiffre entre et pas sa représentation en caractères, voici donc ou les ``Maybe`` entre en jeu. Ils sont un type de variable qui peuvent représenter soit le type assigner (``Int`` dans ce cas ci) ou rien. La façon d'extraire l'information d'un ``Maybe`` est avec la fonction ``maybe`` avec la valeur à utiliser si la ``Maybe`` est vide, une fonction a utiliser sur la valeur si elle est valide(ici id qui retourne simplement la valeur sans modification) et le ``Maybe`` lui-même.

Maintenant que nous avons la sélection du joueur nous vérifions que la sélection est bien un chiffre valide en vérifiant si il est bien dans le range spécifié avec ``elem move [1..9]`` (soit entre 1 et 9). Si la sélection est valide alors on calcule la ligne et la colonne dans le tableau  en gardant en compte que la ligne 0 est en fait [7,8,9]. Ensuite, on s'assure que la position sélectionnée n'est pas déjà prise en vérifiant si ``((table !! row) !! col)`` est un chiffre, si oui alors il est libre et on peut appeler ``doMove`` avec la colonne et la ligne calcule plus tôt.

Si pour quelquonc raison la sélection du joueur n'est pas valide alors nous lui indiquons à l'aide d'un message à l'écran et il refait une nouvelle sélection.

``doMove`` sépare les élément du table en quatre parti, les ligne avant celle qui va etre modifier, les ligne après, et de même pour les colonne de la ligne modifier. Ensuite, pour créer un nouveau tableau avec la sélection du joueur appliquer il suffit tout simplement de recréer la ligne avec les colonne avant, le nouvel élément et les colonne après; ensuite si on met les ligne avant, la version de la ligne et les ligne après nous avons un tableau de jeu complet.

Une particularité ici de l'appelle de doMove est la mention de ``return``, qui n'a jamais été nécessaire avant pour retourner une réponse; en Haskell ``return`` est une fonction et non un keyword du langage pour retourner une variable. Elle sert plutôt à 'élever' un type en sa contre parti IO, qui est nécessaire dans ce cas ci puisque la fonction play Turn fait des action de IO et donc sa réponse doit être de type IO.

Etape 3 - Le gameloop
---------------------
Jusqu'à présent nous avons un tableau de jeu et un joueur peut faire une action sur celui-ci, donc la prochaine chose à ajouter va être une façon que les joueur pose leurs actions tour à tour. Pour ce faire, nous allons ajouter la la fonction suivante:
```
doRound table curPlayerChar otherPlayerChar = do -- Have both players do their turns
  newTable <- playTurn curPlayerChar table
  doRound newTable otherPlayerChar curPlayerChar
```
et nous allons encore une fois modifier main pour utiliser cette nouvelle fonctionnalité.
```
main = do
  let table = [[show (x*3+1), show (x*3+2), show (x*3+3)] | x <- [2, 1..0]]
  doRound table "X" "O"
```

La logique ici est très simple: Le premier joueur (ici les X) joue son tour, nous gardons le résultat de son tour et nous lançons le tour du deuxième joueur en rappelant ``doRound`` avec les joueur inverse. La même séquence ce produit ensuite pour le deuxième joueur et ca revient au tour du premier.

Mais il nous manque quelque chose! La partie de finira jamais, donc nous devons ajouter cette logique a la prochaine étape.

Etape 4 - Fin de la partie
--------------------------
Pour pouvoir mettre fin à la partie, nous devons ajouter de la logique a doRound, pour qu'il retourne éventuellement. Nous allons donc modifier doRound comme suit:
```
doRound table curPlayerChar otherPlayerChar = do -- Have both players do their turns
  newTable <- playTurn curPlayerChar table
  let endStatus = checkEnd newTable
  if endStatus == -1 -- We have a winner!
    then do
      display newTable
      putStrLn ("Congratulations player " ++ curPlayerChar ++ " you are the winner!")
    else if endStatus == 0 -- We are out of moves!
      then do
        display newTable
        putStrLn "All moves have been exhausted; it's a tie!"
        else -- No winner, still moves available, the next player's turn!
          doRound newTable otherPlayerChar curPlayerChar
```
Nous utilisons une fonction ``checkEd`` bidons(que nous allons ajouter sous peu) mais en utilisant les information retourner par celle-ci pour pouvoir planifier le protocole de communication.

Dans ce cas ci, la logique est bâti autour du fait que checkEd nous retourne le nombre de case vide ou ``-1`` si il y a un gagnant. Nous indiquons à l'écran si il y a un gagnant ou si il n'y a plus de case libre et nous donnons le tour a l'autre joueur sinon.

Maintenant que les information de sortie valide de checkEd sont défini nous pouvons rajouter la fonction.
```
checkEnd table = do
  -- Check the rows
  let rowsMax = maximum [(if row !! 0 == row !! 1 then 1 else 0) + (if row !! 0 == row !! 2 then 1 else 0) | row <- table]
  if rowsMax == 2
    then -1
    else do -- Check the columns
      lT colsMax = maximum [(if ((table !! 0) !! x) == ((table !! 1) !! x) then 1 else 0) + (if ((table !! 0) !! x) == ((table !! 2) !! x) then 1 else 0) | x <- [0..2]]
      if colsMax == 2
        then -1
        else do -- Check the diagonals
          let diagMax = maximum [(if ((table !! 0) !! 0) == ((table !! 1) !! 1) then 1 else 0) + (if ((table !! 0) !! 0) == ((table !! 2) !! 2) then 1 else 0), (if ((table !! 0) !! 2) == ((table !! 1) !! 1) then 1 else 0) + (if ((table !! 0) !! 2) == ((table !! 2) !! 0) then 1 else 0)]
          if diagMax == 2
            then -1
            else do -- There is currently no winner, but maybe there are no moves left either
              let board 1D = table !! 0 ++ table !! 1 ++ table !! 2
              maximum [ maybe 0 id (readMaybe x :: Maybe Int) | x <- board1D]
```
Les list comprehension utilisé ici on l'aire plutôt effrayante mais leurs logique est plutôt simple à un haut niveau.

La base de tous les list comprehension utilisé est comme suit: Si on compte le nombre d'élément dans une ligne qui est égale au premier élément alors nous savons combien d'élément dans la ligne sont du même joueur. Puisque notre jeu de tic tac toe se jouer sur un tableau 3x3 alors il nous faut 2 elément pareille au premier pour dire que la ligne est entièrement contrôlé par le même joueur. Donc si nous vérifions ce compte pour chaque ligne du tableau nous savons si le joueur qui a fait la dernière action a gagner.

``rossMax`` est défini comme le maximum de la liste des compte pour chaque ligne du tableau. POur le calculer nous prenons chaque ligne séparément et nous comptons le nombre d'élément pareil au premier de la ligne.

``colMax`` est légèrement plus complex que ``rossMax`` puisque nous ne pouvons pas extraire une colonne à la fois, donc nous devons accéder à chaque ligne et ensuite à la colonne désirée pour faire le compte.

``digiMax`` est très similaire à ``col sMax``, nous ne pouvons pas extraire les diagonales donc nous devons manuellement accéder au ligne et ensuite aux colonnes qui nous intéresse.

Etape 6 - Trouver un ami
------------------------
C'est très bien de tester un jeu seule mais beaucoup plus plaisant de joueur contre un véritable adversaire, donc tout ce qu'il reste à faire c'est de vous trouver un ami avec qui jouer!
