---
title       : Introduction à la classification (2)
subtitle    :  Distances, Similaritées, Dissimilaritées
author      : Elisabeth Morand-Bénédicte Garnier
job         : SMS

framework   : io2012      # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}

hitheme     : zenburn 


widgets     : [bootstrap, shiny, interactive,mathjax,quiz]           # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides

---








## Donnees
Pour réaliser les calculs à la main, on travaille sur le petit jeu de donnéees.

> - Variables quantitatives

> Dans le cas des variables quantitatives, pour les donnéees avec les mains on
calcule la distance à partir des variables : longueur poids et largeur
Le premier individu sera alors :
x1 = (2, 10.3, 6)

> - Variables qualitatives

> Dans le cas des variables qualitatives, on calcule la distance à partir des
variables : couleurs et région
Le premier individu sera alors :
x1 = (jaune, 1)

---

## Définition : Distance

Soit E un ensemble d’objets. Une distance $$ d :  E \times  E \rightarrow R^{+} $$
vériﬁe les propriétés suivantes

>- propriété de symétrie :
$\forall x_i, x'_i\in E, d(x_i,x'_i)=d(x'_i,x_i)$


>- propriété de séparation :
$$d(xi , x'_i)=0 \Leftrightarrow x_i=x'_i$$

>- inégalité triangulaire :
$$\forall x_i, x'_i, y \in E, d(x_i,x'_i) \leq d(x'_i,y) + d(y,x_i)$$


---

## Distances ; Dissimilarités

- distance
- similarité
- dissimilarité obtenue à partir d’une similarité par : 1-similarité

Les dissimilarités peuvent ne pas vériﬁer l’inégalité triangulaire voire la
propriété de séparation

---

## Variables quantitatives 



### Distance classique

- distance euclidienne classique
- distance de Manhattan
- distance de Minkowsky


---

## Distance Euclidienne



La distance euclidienne au carré se calcule par 
$$d^2_{ii'}=\sum_{j=1}^p(x_{ij}-x_{i'j})^2$$

Dans le cas des données avec les mains on calcule la distance euclidienne à partir des variables :
\alert{longueur poids et  largeur}

La distance entre le premier individu ($x_1=(2,10.3,6)$) et le troisième ($x_3=(4,12,3)$) individu 
vaut 

$$ \sqrt\left\((2-4)^2+(10.3-12)^2+(6-3)^2\right\)=3.986 $$

---

## Exemple de calcul

Plus généralement on peut calculer une matrice de distance contenant les
distances 2 à 2. Cette matrice est symétrique et sa diagonale vaut 0

<!-- html table generated in R 3.3.2 by xtable 1.8-2 package -->
<!-- Wed Feb 08 09:30:00 2017 -->
<table border=1>
<tr> <th>  </th> <th> X1 </th> <th> X2 </th> <th> X3 </th> <th> X4 </th> <th> X5 </th> <th> X6 </th>  </tr>
  <tr> <td align="right"> 1 </td> <td align="right"> 0.00 </td> <td align="right"> 1.49 </td> <td align="right"> 3.99 </td> <td align="right"> 2.84 </td> <td align="right"> 5.70 </td> <td align="right"> 6.77 </td> </tr>
  <tr> <td align="right"> 2 </td> <td align="right"> 1.49 </td> <td align="right"> 0.00 </td> <td align="right"> 2.89 </td> <td align="right"> 2.64 </td> <td align="right"> 5.02 </td> <td align="right"> 5.76 </td> </tr>
  <tr> <td align="right"> 3 </td> <td align="right"> 3.99 </td> <td align="right"> 2.89 </td> <td align="right"> 0.00 </td> <td align="right"> 2.24 </td> <td align="right"> 2.45 </td> <td align="right"> 2.87 </td> </tr>
  <tr> <td align="right"> 4 </td> <td align="right"> 2.84 </td> <td align="right"> 2.64 </td> <td align="right"> 2.24 </td> <td align="right"> 0.00 </td> <td align="right"> 3.00 </td> <td align="right"> 4.39 </td> </tr>
  <tr> <td align="right"> 5 </td> <td align="right"> 5.70 </td> <td align="right"> 5.02 </td> <td align="right"> 2.45 </td> <td align="right"> 3.00 </td> <td align="right"> 0.00 </td> <td align="right"> 1.80 </td> </tr>
  <tr> <td align="right"> 6 </td> <td align="right"> 6.77 </td> <td align="right"> 5.76 </td> <td align="right"> 2.87 </td> <td align="right"> 4.39 </td> <td align="right"> 1.80 </td> <td align="right"> 0.00 </td> </tr>
   </table>



---


## Distance de Manhattan

### Distance de Manhattan
$d_{ii'}=\sum_{j=1}^p \|x_{ij}-x_{i'j}\|$



### Exemple de calcul


La distance entre le premier individu ($x_1=(2,10.3,6)$) et le troisième ($x_3=(4,12,3)$) individu 
vaut 

$$(\|2-4\|+\|10.3-12\|+\|6-3\|=6.7$$


**Avantage** : pas de carré donc effet des points atypiques moins fort

---

## Matrice de distance : manhattan

##      1   2   3   4   5    6
## 1  0.0 2.1 6.7 4.3 8.7 11.2
## 2  2.1 0.0 4.6 4.4 7.4  9.1
## 3  6.7 4.6 0.0 3.0 4.0  4.5
## 4  4.3 4.4 3.0 0.0 5.0  7.5
## 5  8.7 7.4 4.0 5.0 0.0  2.5
## 6 11.2 9.1 4.5 7.5 2.5  0.0



---

## Matrice de distance : Minkowsky

La distance euclidienne et la distance de Manhattan sont deux cas
particuliers de la distance de Minkowsky

$d_{ii'} = d(x_i , x_i' ) =$
$\{\sum_i=1^p \alpha_j |x_{ij}-x_{i'j}|^ \lambda\}^{\frac{1}{\lambda}$


- Distance euclidienne : $\lambda = 2$, $\alpha_j  = 1$,    $\forall j$
- Distance de Manahttan : $\lambda = 1$, $\alpha_j  = 1$,    $\forall j$
- Distance euclidienne sur donnée centrée reduite : 
$\lambda=2$, $\alpha_j=\frac{1}{s_j^2}$ avec $s_j=\sqrt{\frac{1}{n}\sum_{1=1}^n(x_{ij}-\bar{x_j})^2}$

---

## Similarités

$$s_{cos}(i,i')=\frac{x_i'x_{i'}}{\|x_i\| \|x_{i'}\|}$$

exemple de calcul :
La distance entre le premier individu ($x_1=(2,10.3,6)$) et le troisième ($x_3=(4,12,3)$) individu 
vaut :
$$x_i'x_{i'}=2*4+10.3*12+3*6=149.6$$
$$\|x_i\|=\sqrt{2^2+10.3^2+6^2}=12.0877$$
$$\|x_{i'} \|=\sqrt{4^2+12^2+3^2}=13$$


---

## Exemple de matrice de similarité et dissimilarité

##      1    2    3    4    5
## 2 0.99                    
## 3 0.95 0.97               
## 4 0.97 0.98 0.99          
## 5 0.90 0.92 0.98 0.97     
## 6 0.87 0.91 0.98 0.96 0.99



##      1    2    3    4    5
## 2 0.01                    
## 3 0.05 0.03               
## 4 0.03 0.02 0.01          
## 5 0.10 0.08 0.02 0.03     
## 6 0.13 0.09 0.02 0.04 0.01


--- 



## Représentation suivant les distances 
Différentes distances induisent différents liens entre les individus. Dans le cas des variables continues si on représente "à plat" les individus en fonction de la matrice des distance on obtient :



[cliquer ici](output.html)
---

## Variables qualitatives

1. Variables qualitatives ordinales
2. Fréquences
3. Données Binaires

---

## Données ordinales

On remplace les valeurs par leur rang $r_{ij}$ j variants de 1 à $k_j$ le nombre de valeurs distinctes de la variable j. 

On utilise ensuite la transformation $z_{ij}=\frac{r_{ij}-1}{k_j-1}$

$z_j$ varient alors de 0 à 1

---
## Fréquences : Exemple-rappel

Exemple : enquête 1972, CREDOC

Attitude des femmes à l'égard du travail des femmes; 1724 enquêtées; On sort 2 questions.
"La famille idéale est celle où" 
et "Activité de famille convenant le mieux à une mère de famille"



  |                                            | foyer        | mi temps	   | plein temps |

 |-------------------                         |--------------|---------------|--------------|
	
 |   Les deux conjoints travaillent également  |   13	         | 142	       | 106	|
    
|Le mari a un métier  plus absorbant  que celui de sa femme | 30	 | 408	 | 117	|

|Seul le mari travaille	| 241	 | 573	| 94	|



La distance du  $\chi^2$  s'obtient par  
$$d^2(i_1,i_2)=\sum_{j=1}^J \frac{(\frac{x_{i_1j}}{x_{i_1} \bullet}-\frac{x_{i_2j}}{x_{i_2}\bullet})^2}{x{.j}}$$

avec 

$X_{i_1\bullet}=\sum_{j=1} ^J X_{i_1 j}$

$X_{\bullet j}=\sum_{i=1} ^I X_{i j}$



 soit les données :
 
 

|                   | foyer        | mi temps     | plein temps | $x_{i\bullet}$|
|-------------------|--------------|--------------|-------------|-------------|
|A                  |   13         | 142	        | 106	        |  261        |
|B                  |   30         | 408          | 117	        |  555        |	
|A                  |   241         | 573          | 94	        |  908        |
|$X_{\bullet j}$    |   284         | 1123          | 317	        |  1724        |
 

  
  Distance au carré du $\chi^2$ entre A et B :

$$\dfrac{1}{284} \left (\dfrac{13}{261}-\dfrac{30}{555}\right)^2+ \dfrac{1}{1123}\left(\dfrac{142}{261}-\dfrac{408}{555}\right)^2+ \dfrac{1}{317}\left(\dfrac{106}{261}-\dfrac{117}{555}\right)^2$$


Dans un premier temps on ramène le tableau de contingence à un tableau de ``probabilités''

- $f_{ij}=\frac{x_{ij}}{n}$ est la probabilité de posséder à la fois la modalité i de la variable 1 et la modalité j de la variable 2
- $f_{i \bullet} =\sum_{j=1}^J f_{ij} \qquad  f_{ \bullet j}=\sum_{i=1}^I f_{ij}  \qquad f_{\bullet \bullet}=\sum_{i,j} f_{ij}=1$

---

## Fréquences

Pour les données de fréquences, on calcule une distance du $\chi^2$
$$d^2(i_1,i_2) =\sum_j \dfrac{1}{f_{\bullet j}} \left(\dfrac{f_{i_1j}}{f_{ i_1 \bullet}}-
\dfrac{f_{i_2j}}{f_{ i_2 \bullet}}\right)^2  $$

Cette distance est un cas particulier de la distance générale de Minkowski

---

## Données Binaires



|        |          |sujet i   |               |
|--------|--------  |--------   |------         |
|        |      1   | 2	        |	              |
|   1    | $p_{11}$ |$p_{12}$   |$p_{1\bullet}$ |   
|sujet i' |         |           |               |
| 2       | p_{21}  | $p_{22}$  |p_{2\bullet}   |             
|         |p_{\bullet 1}  |p_{\bullet 2} | p |


  Ce tableau permet de calculer le nombre de concordances pc=p11+p22 et les discordantes pd=p12+p21
  
`> L'indice de Jacquard
$$  S_J(i,i')=\frac{p_{11}}{p_{11}+p_d}$$

---

## Données nominales 

Soit on transforme en indicatrice et :

- calcul des distances dans le cas binaire
- distance du chi deux


On calcule la distance en fonction du nombre m de modalités communes : dii'=p-m/p 

---

## Données mixtes
On transforme toutes les variables en variable qualitatives, puis on met tout sous forme d'indicatrice
(tableau disjonctif complet) et on applique la distance du $\chi^2$

Soit on fait une somme pondérée des distances en utilisant la bonne distance au bon moment!

---

## Conclusion

Il existe une grande diversité de distances qui peuvent rapprocher ou éloigner les points différemment.

## * Similarity measures:
## Braun-Blanquet, Chi-squared, correlation, cosine, Cramer, Dice,
## eDice, eJaccard, Fager, Faith, Gower, Hamman, Jaccard,
## Kulczynski1, Kulczynski2, Michael, Mountford, Mozley, Ochiai,
## Pearson, Phi, Phi-squared, Russel, simple matching, Simpson,
## Stiles, Tanimoto, Tschuprow, Yule, Yule2
## 
## * Distance measures:
## Bhjattacharyya, Bray, Canberra, Chord, divergence, Euclidean,
## fJaccard, Geodesic, Hellinger, Kullback, Levenshtein, Mahalanobis,
## Manhattan, Minkowski, Podani, Soergel, supremum, Wave, Whittaker


---



