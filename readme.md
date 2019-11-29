Haskell Tutorial
================

Comment Commencer?
------------------
- Allez à la page officielle de Haskell et téléchargez la bonne version pour votre système.
	- https://www.haskell.org/platform/
- Complétez l’installation de la plateforme Haskell.
- Assurez vous d'avoir un éditeur de code tel que notepad++.
Voilà, tous les outils nécessaire pour commencer son pret à être utilisés !
Notez que les exemples de la première section seront réalisés avec le compilateur en ligne Haskell, disponible à l’adresse suivante : https://www.tutorialspoint.com/compile_haskell_online.php. La seconde partie sera par contre réalisée localement.

Introduction
------------------------------------
Le présent tutoriel vise à expliquer les particularités, l’utilité et le fonctionnement de la programmation fonctionnelle.
Pour ce faire, l’étude sera découpé en deux grandes sections. La première vise à donner un aperçu de la technologie ainsi que d’apporter des connaissances basiques sur la programmation avec Haskell.
La seconde partie sera une application plus concrète, où le lecteur sera amené à créer un petit jeu de tic tac toe avec les connaissances acquises dans la première section.
Il est assumé ici que le lecteur dispose de connaissances de base en matières de programmation.

Qu’est ce que la programmation fonctionnelle ?
------------------------------------
La programmation fonctionnelle est un paradigme de programmation, c’est à dire une manière de voir la programmation
où on considère le calcul en tant qu’évaluation de fonctions mathématiques et non comme une modification de variables existantes ;
les mutations de données ne sont pas supportées.
Exemple 1 : fonction non fonctionnelle vs fonction fonctionnelle (python) :
fonction non fonctionnelle :
```
a = 0
def increment():
    global a
    a += 1
```

fonction fonctionnelle :
```
def increment(a):
    return a + 1
```

Avec du code fonctionnel la valeur de sortie d’une fonction dépend uniquement de ses arguments.
Passer un même argument produit donc toujours le même résultat ;
on élimine les effets secondaire (side effects), ce qui rend en général un programme plus facilement compréhensible et surtout qui facilite la mise en place de tests unitaires.
C’est en contraste avec la manière plus traditionnelle de programmer, dite impérative,
où en plus des arguments l’état global du programme peut influencer sur la valeur de retour.

Les caractéristiques principales des langages fonctionnels
------------------------------------
- Les langages fonctionnels sont pensés pour effectuer les calculs avec des fonctions mathématiques qui utilisent les expressions conditionnelles et la récursion.
- La programmation fonctionnelle supporte le principe de fonctions d’ordre supérieur, c’est à dire une fonction capable de prendre en paramètre une autre fonction, ou de renvoyer une fonction en résultat.
- La programmation fonctionnelle supporte l'évaluation paresseuse (lazy evaluation), où l'évaluation d'un paramètre de fonction ne se fait pas avant que ça ne soit nécessaire, et le résultat, une fois calculé, est préservé pour une utilisation ultérieure.
- Un langage fonctionnel ne supporte pas les boucles, comme les if, for, ou switch.
- Comme en programmation orientée objet, la programmation fonctionnelle supporte les principes d’encapsulation, d’abstraction, d’héritage et de polymorphisme.

Les avantages de la programmation fonctionnelle
------------------------------------
- Comme la programmation supprime les effets secondaires, il est possible d’écrire du code 100% bug free.
- De part sa nature, la programmation fonctionnelle permet de faciliter la programmation parallèle.
- Les programmes fonctionnels consistent en unités indépendantes qui peuvent rouler de manière concurrente. Ultimement, cela offre une meilleure efficacité.
- La programmation fonctionnelle supporte les fonctions imbriquées.
- La programmation fonctionnelle supporte les évaluations paresseuses avec des constructeurs fonctionnels paresseux, comme les Lazy Lists, Lazy Maps, etc.

Le problème avec la programmation fonctionnelle est qu’elle requiert plus de mémoire. Comme il n’y a pas de variables, il faut créer de nouveaux objets à chaque fois qu’on veut effectuer une action.

Programmation avec Haskell
------------------------------------
Maintenant que nous savons ce qu’est la programmation fonctionnelle, il est temps de passer aux choses sérieuses !
Nous allons voir ici les bases de la programmation avec Haskell.

Les opérations
------------------------------------
Nous allons voir ici les différentes opérations utilisable avec Haskell. Comme la plupart des langages, Haskell supporte les opérations de base comme l’addition, la soustraction, la multiplication, etc…

Addition :
Le code ci dessous montre comment opérer une addition :
```
main = do
   let var1 = 2
   let var2 = 3
   putStrLn "The addition of the two numbers is:"
   print(var1 + var2)
```

Il est important de noter que l’indentation joue un rôle important avec Haskell. Si on écrit :
```
main = do
   let var1 = 2
let var2 = 3
   putStrLn "The addition of the two numbers is:"
   print(var1 + var2)
```
le code renvoie une erreure.

Soustraction :
Le code fonctionne de la même manière que pour une addition, il faut simplement changer le signe de l’opération :
```
main = do
   let var1 = 10
   let var2 = 6
   putStrLn "The Subtraction of the two numbers is:"
   print(var1 - var2)
```

Multiplication :
Encore une fois, le code fonctionne de la même manière :
```
main = do
   let var1 = 2
   let var2 = 3
   putStrLn "The Multiplication of the Two Numbers is:"
   print(var1 * var2)
```

Division :
```
Toujours pareil, la division :
main = do
   let var1 = 12
   let var2 = 3
   putStrLn "The Division of the Two Numbers is:"
   print(var1/var2)
```

Séquence ou Range :
Les opérations précédentes sont très basiques, mais Haskell dispose d’une opération spéciale : la Séquence (appelée aussi Range).
Cet opérateur permet d’utiliser la suite de caractère “..”  quand on déclare une liste ayant une séquence dans ses valeurs.
Par exemple, si on veut afficher les valeurs de 1 à 10, on peut utiliser un séquence en tapant quelque chose comme print [1..10].
De la même manière, on peut afficher toutes le lettres de l’alphabet en utilisant [a..z].
Le code qui suit affiche les chiffres de 1 à 10 :
```
Toujours pareil, la division :
main = do
   print [1..10]
```

L’output est le suivant :
[1,2,3,4,5,6,7,8,9,10]

Les types et les classes de type
------------------------
Comme tous les langages fonctionnels, Haskell est fortement typé. Chaque déclaration est considérée comme un expression mathématique, et c’est la catégorie de cette expression que l’on appelle “type”.
Une classe de type peut être vue comme un ensemble de types similaires.

Le type int :
Comme on peut s’en douter, le type int représente les entiers. Il comporte tous les chiffres entier entre -2147483647 et 2147483647. Voici un exemple de code utilisant le type int :
```
fType :: Int -> Int -> Int
fType x y = x*x + y*y
main = print (fType 2 4)
```

Ici, on déclare que la fonction fType() prend deux int et retourne un int. On obtient le résultat “20” si on exécute le code.
Notez qu’il existe le type Integer, différent de Int, qui peut représenter n’importe quelle valeur entière sans limite de taille.

Le type float :
Ce type fonctionne comme le type float de n’importe quel autre langage. Voici un exemple de code :
```
fType :: Float -> Float -> Float
fType x y = x*x + y*y
main = print (fType 2.5 3.8)
```

Notez qu’il existe aussi le type Double, qui est un float avec une plus grande précision.

Le type bool :
Bien sûr, il s’agit du type booléen. Un exemple :
```
main = do  
   let x = True

   if x == False
      then putStrLn "X matches with Bool Type"
   else putStrLn "X is not a Bool Type"
```

Je profite de l’exemple pour glisser un petit mot sur les conditions. Haskell support les if… else, avec autant de if que voulu avant le else.
Notez que l’opérateur “==” signifie l’équivalence, et à l’opposé l’opérateur “/=” signifie la non équivalence.

Le type char :
Le type char représente un caractère. Un exemple :
```
fType :: Char-> Char
fType x = 'K'
main = do  
   let x = 'v'
   print (fType x)
```

Ici, le programme retourne tout le temps K.

Classe de type EQ :
EQ est une classe de type qui permet de tester équivalence d’une expression. Toutes les types mentionnés plus haut sont membre de EQ.
A chaque fois que l’on fait un test d’égalité, on fait en réalité un appel à la classe EQ. Exemple :
```
main = do
   if 8 /= 8
      then putStrLn "The values are not Equal"
   else putStrLn "The values are Equal"
```

Classe de type Ord :
Comme son nom peut le suggérer, la classe Ord offre la possibilité d’ordonner des valeurs. Tous les types vus plus hauts font partie de cette Classe. Ord est appelée en utilisant les opérateurs ">", "<", "<=", ">=", "compare".
Exemple :
```
main = print (4 <= 2)
```

Ici, le code vérifie si 4 est inférieur à deux et retourne affiche “True” si c’est vrai et “False” si c’est faux.

Show :
Show est un peu particulier ; il permet d’afficher un argument sous forme de string, peut importe l’argument qui est passé en paramètre.
Exemple :
```
main = print (show [1..10])
```

Ici, on affiche la liste des chiffres allant de 1 à 10 sous forme d’une string.

Read :
Read fait la même chose que Show, mais n’affiche pas le résultat. Dans l’exemple suivant, on utilise Read pour lire la valeur d’une string et la convertir en un int :
```
main = print (readInt "12" * 3)
readInt :: String -> Int
readInt = read
```

Enum :
Enum est un autre moyen de faire des séquences ou pour ordonner des valeurs. On y accède avec les commandes Succ, Pred, Bool, Char, etc… Le code suivant montre le chiffre suivant 12 :
```
main = print (succ 12)
```

Le résultat est 13.

Bounded :
Cette classe comprend tous les types ayant des limites de taille, comme int. Le code suivant affiche le maximum et le minimum d’un int :
```
main = do
   print (maxBound :: Int)
   print (minBound :: Int)
```

Vous pouvez essayer de trouver la limite de char, float et bool.

Num :
Ce type est utilisé pour les opérations numériques. Les types comme int, float et double en font partie. Regardez l’output du code suivant :
```
main = do
   print(2 :: Int)  
   print(2 :: Float)
```
Integral :
Integral peut être considérée comme une sous classe de Num. Num contient tous les types qui sont des chiffres, alors que Integral comporte seulement ceux avec des nombres, à savoir int et integer.

Floating :
Exactement le même fonctionnement que Integral mais pour les chiffres à virgule, à savoir float et double.

Classe de type personnalisée :
Haskell offre la possibilité à l’usager de créer ses propres classes de type. Dans l’exemple suivant, on créé un type et on l’utilise :
```
data Area = Circle Float Float Float  
surface :: Area -> Float   
surface (Circle _ _ r) = pi * r ^ 2   
main = print (surface $ Circle 10 20 10 )
```

Ici, on a créé un nouveau type appelé Area. Ce type comporte trois variables, chacune de type float. Ensuite, on utilise ce type pour calculer l’aire d’un cercle. “surface” est une fonction qui prend Area en entrée et produit un float en sortie. Notez qu’on effectue le calcul avec le troisième paramètre de Cirle.
Le mot “data” est un mot clé permettant de définir ou nouveau type de donnée, une nouvelle classe. Notez qu’une classe personnalisée doit toujours commencer par une lettre capitale.

Les fonctions :
Les fonctions ont un rôle majeur avec Haskell puisqu’il s’agit d’un langage fonctionnel. Comme pour les autres langages, Haskell a sa propre façon de déclarer et de définir les fonctions.
La déclaration de la fonction comporte le nom de la fonction, la liste de ses arguments et le type de son output.
La définition de la fonction est l’emplacement où vous définissez la fonction.
Prenons un exemple avec un fonction faisant une addition :
```
add :: Integer -> Integer -> Integer   --function declaration
add x y =  x + y                       --function definition

main = do
   putStrLn "The addition of the two numbers is:"  
   print(add 2 5)    --calling a function
```

Les liste compréhension :
C’est un aspect assez important d’Haskell, et qui sera utilisé dans la seconde partie de ce tutoriel. Le principe est d’effectuer des actions sur les données d’une liste et de stocker les résultats dans une nouvelle liste. Par exemple, si l’on souhaite accéder aux à chaque élément d’une liste de int et de multiplier ces éléments par deux, on pourrait le faire avec une list comprehension :
```
[x*2 | x <- [1..10]]
```
l’output est le suivant :
```
[2,4,6,8,10,12,14,16,18,20]
```

Il est possible de rajouter des conditions. Les conditions (ou prédictions) viennent à la fin de la déclaration de la liste, et en sont séparé par un virgule. Disons que l’on veut seulement les éléments qui, une fois doublés, sont plus grand que 12 :
```
[x*2 | x <- [1..10], x*2 >= 12]
```  
On obtient l’output suivant :
```
[12,14,16,18,20]
```

Un dernier exemple, un peu plus compliqué. Imaginons que l’on veut remplacer chaque nombre impair d’une liste inférieur à 10 par “BOOM!”, et chaque élément impair plus grand que 10 par “BANG!”, le tout à l’intérieur d’une fonction :
```
boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]   
boomBangs [7..13]
```
On obtient le résultat :
```
["BOOM!","BOOM!","BANG!","BANG!"]
```

Notez qu’il est possible d’avoir plusieurs conditions :
```
[ x | x <- [10..20], x /= 13, x /= 15, x /= 19]
```



Techniquement, vous avez maintenant assez de connaissances pour attaquer la seconde partie de ce tutoriel. Cependant, nous n’avons fait que survoler Haskell et la programmation fonctionnelle, et j’aimerais discuter de quelques principes avant de conclure cette partie.

Les techniques pour faciliter le code :
Actuellement, nous avons vu comment écrire une fonction avec Haskell. Mais il existe beaucoup de méthodes afin de simplifier le travail du programmeur. Pour n’en citer que quelque unes, on a le Pattern Matching, les Guards, ou encore le principe de récursion.
Ce sont des fonctionnalité de Haskell qui permettent d’effectuer des action précises. Pour plus d’information, je vous suggère de consulter la page suivante, où vous trouverez de plus amples informations : https://www.tutorialspoint.com/haskell/haskell_functions.htm.

Un autre aspect dont j’aimerais parler est le principe de composition de fonction. Il s’agit d’utiliser l’output d’un fonction comme input d’une autre.
Ce principe peut être utilisé par n’importe quelle paire de fonction, tant que le type d’output de la première est le même que l’input de la seconde. Il faut simplement utiliser un point (.) pour implémenter une composition de fonction. Regardez l’exemple suivant :
```
eveno :: Int -> Bool
noto  :: Bool -> String

eveno x = if x `rem` 2 == 0
   then True
else False
noto x = if x == True
   then "This is an even Number"
else "This is an ODD number"

main = do
   putStrLn "Example of Haskell Function composition"
   print ((noto.eveno)(16))
```

Dans le main, on appelle simultanément deux fonctions, noto et eveno. Le compilateur va d’abord appeler la fonction eveno() avec l’argument 16. Ensuite, l’output de eveno servira d’input à la fonction noto().

Finalement, j’aimerais conclure cette partie en discutant des input et output avec Haskell.
Il est possible de demander à l’utilisateur de rentrer des données dans le terminal, de la manière suivante :
```
main = do
putStrLn "Comment vous appelez vous ?"
name <- getLine
putStrLn $ "Bonjour " ++ name
```

L’utilisateur se verra demander d’entrer son nom. Si il tape Bob, l’output sera le suivant :
```
Comment vous appelez vous ?
Bonjour Bob
```

Il est également possible de lire des fichier avec Haskell. Créons par exemple un fichier “test.txt” dans lequel on écrit “Fabio est tellement un bon professeur !” Le code suivant permet de lire ce fichier et d’afficher ce qu’il contient :
```
main = do  
   let file = "test.txt"
   contents <- readFile file
   putStrLn contents  
```

Félicitations ! Vous êtes arrivé à la fin de la première partie. Vous avez maintenant les connaissances minimales pour comprendre ce qui sera effectué à la section suivante. Il vous faudra certainement réfléchir avant de bien tout saisir, mais je suis persuadé que vous y arriverez.
En cas de besoin, voici un lien vers la documentation officielle d’Haskell pour plus d’information : https://www.haskell.org/documentation/. Je vous invite aussi à visiter le site suivant, qui à grandement aidé à l’élaboration de ce tutoriel :
https://www.tutorialspoint.com/haskell/index.htm. Bien évidemment, Internet regorge d’information aussi à ce sujet si vous avez des questions. Bonne continuation !



Deuxième partie : l'élaboration du Tic Tac Toe
------------------------

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
Ce que cette ligne représente dans des termes plus simple est que pour chaque x entre 2 et 0 on construit une list ``[show (x*3+1), show (x*3+2), show (x*3+3)]`` et on l'ajoute à la liste parent. Ici les ``show`` sont utilisés pour que les chiffres résultants des formules deviennent des caractères.

La fonction surround crée une chaîne de caractères de telle sorte que la chaîne ``buf`` se retrouve avant et après chaque élément de ``list`` sans répétition de ``buf``

La fonction display crée la chaîne représentant un tableau entier en utilisant ``\n +---+---+---+ \n`` autour de chaque ligne du tableau et `` | `` autour de chaque élément de chaque ligne pour donner le résultat suivant:

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
Maintenant que nous sommes capable de voir une représentation visuelle du tableau de jeu il est temps d'ajouter les fonctions de input. Ces fonctions vont prendre l'input du joueur et créer un nouveau tableau que nous allons ensuite montrer au deuxième joueur à son tour; pour l'instant nous allons seulement nous assurer d'être capable de prendre les inputs d'un joueur, le game loop va venir à l'étape 3.

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
au lieu de ``display table`` pour que notre programme utilise ses nouvelles fonctionnalités. Le ``<-`` est pour indiquer que playTurn fait des actions de IO et donc que le retour de cette fonction doit être calculé au lieu d'être mit/pris en cache.

La fonction play Turn est celle qui va prendre l'input du joueur, faire la validation pour être sur que la sélection du joueur est bel et bien une sélection valide et si elle l'est va ensuite lancer la fonction doMove pour appliquer la sélection sur le tableau.

Dans play Turn nous voyons plusieurs fonction de IO, telle que ``putStr``, ``putStrLn``, ``getLine`` en plus des ``Maybe``. ``putStr`` est exactement comme ``putStrLn`` mais n'envoie pas à la prochaine ligne après son affichage à l'écran. ``getLine`` lit bien assurément une ligne de texte écrite dans le terminal, mais ici nous utilisons pas directement sa valeur. La raison étant que nous avons besoins de connaître quel était le chiffre entre et pas sa représentation en caractères, voici donc ou les ``Maybe`` entre en jeu. Ils sont un type de variable qui peuvent représenter soit le type assigner (``Int`` dans ce cas ci) ou rien. La façon d'extraire l'information d'un ``Maybe`` est avec la fonction ``maybe`` avec la valeur à utiliser si la ``Maybe`` est vide, une fonction à utiliser sur la valeur si elle est valide(ici id qui retourne simplement la valeur sans modification) et le ``Maybe`` lui-même.

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
Les list comprehension utilisées ici ont l'air plutôt effrayantes mais leurs logique est plutôt simple à un haut niveau.

La base de tous les list comprehension utilisé est comme suit: Si on compte le nombre d'élément dans une ligne qui est égale au premier élément alors nous savons combien d'élément dans la ligne sont du même joueur. Puisque notre jeu de tic tac toe se jouer sur un tableau 3x3 alors il nous faut 2 elément pareille au premier pour dire que la ligne est entièrement contrôlé par le même joueur. Donc si nous vérifions ce compte pour chaque ligne du tableau nous savons si le joueur qui a fait la dernière action a gagner.

``rossMax`` est défini comme le maximum de la liste des compte pour chaque ligne du tableau. POur le calculer nous prenons chaque ligne séparément et nous comptons le nombre d'élément pareil au premier de la ligne.

``colMax`` est légèrement plus complex que ``rossMax`` puisque nous ne pouvons pas extraire une colonne à la fois, donc nous devons accéder à chaque ligne et ensuite à la colonne désirée pour faire le compte.

``digiMax`` est très similaire à ``col sMax``, nous ne pouvons pas extraire les diagonales donc nous devons manuellement accéder au ligne et ensuite aux colonnes qui nous intéresse.

Etape 6 - Trouver un ami
------------------------
C'est très bien de tester un jeu seule mais beaucoup plus plaisant de joueur contre un véritable adversaire, donc tout ce qu'il reste à faire c'est de vous trouver un ami avec qui jouer!
