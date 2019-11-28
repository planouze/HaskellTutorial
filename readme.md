Haskell Tutorial
================

Comment Commencer?
------------------
- Allez à la page officiel de haskell et telecharger la bonne version pour votre système.
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
Le but de cette etape est tout simplement de montrer visuellement un tableau dans la console qui va representer le tableau de jeu.
Pour commencer nous allons cree le fichier ``tictactoe.hs`` et y mettre le code suivant
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

La fonction main va etre la fonction principale qui est appelle lors de lexecution du programme. La premiere ligne de la fonction main ici est plutot interessante puisquelle cree le tableau de base que notre jeu va utiliser
Ce que cette ligne represente dans des termes plus simple est que pour chaque x entre 2 et 0 on construit une list ``[show (x*3+1), show (x*3+2), show (x*3+3)]`` et on la rajoute a la liste parent. Ici les ``show`` sont utilise pour que les chiffre resultant des formules devienne des characteres.

La fonction surround cree une chaine de characteres de tel que la chaine ``buf`` se retrouve avant et apres chaque element de ``list`` sans repetition de ``buf``

La fonction display, elle cree la chaine representant un tableau entier en utilisant ``\n +---+---+---+ \n`` autour de chaque ligne du tableau et `` | `` autour de chaque element de chaque ligne pour donner le resultat suivant:

```
+---+---+---+
| 7 | 8 | 9 |
+---+---+---+
| 4 | 5 | 6 |
+---+---+---+
| 1 | 2 | 3 |
+---+---+---+
```
