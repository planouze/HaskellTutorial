Haskell Tutorial
================

Comment Commencer?
------------------
- Allez à la page officielle de Haskell et téléchargez la bonne version pour votre système.
	- https://www.haskell.org/platform/
- Complétez l’installation de la plateforme Haskell.
- Assurez vous d'avoir un éditeur de code tel que notepad++.
Voilà, tous les outils nécessaire pour commencer son pret à être utilisés !

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

Comme la programmation supprime les effets secondaires, il est possible d’écrire du code 100% bug free.
De part sa nature, la programmation fonctionnelle permet de faciliter la programmation parallèle.
Les programmes fonctionnels consistent en unités indépendantes qui peuvent rouler de manière concurrente. Ultimement, cela offre une meilleure efficacité.
La programmation fonctionnelle supporte les fonctions imbriquées.
La programmation fonctionnelle supporte les évaluations paresseuses avec des constructeurs fonctionnels paresseux, comme les Lazy Lists, Lazy Maps, etc.

------------------------------------

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