---
title       : Introduction à la classification (2)
subtitle    : 
author      : Elisabeth Morand-Bénédicte Garnier
job         : SMS

framework   : io2012      # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}

hitheme     : zenburn 


widgets     : [bootstrap, shiny, interactive,mathjax,quiz]           # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
ext_widgets: {rCharts: [libraries/nvd3]}
---


---  


# Deuxieme partie : Distances, Similaritées, Dissimilaritées

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
# Variables quantitatives 

---

## Distance classique

- distance euclidienne classique
- distance de Manhattan
- distance de Minkowsky


---
### Distance Euclidienne
- **Distance Eucliedienne**

La distance euclidienne au carré se calcule par 
$$d^2_{ii'}=\sum_{j=1}^p(x_{ij}-x_{i'j})^2$$

Dans le cas des données avec les mains on calcule la distance euclidienne à partir des variables :
\alert{longueur poids et  largeur}

La distance entre le premier individu ($x_1=(2,10.3,6)$) et le troisième ($x_3=(4,12,3)$) individu 
vaut 

$$\sqrt((2-4)^2+(10.3-12)^2+(6-3)^2)=3.986$$

---

## Exemple de calcul

Plus généralement on peut calculer une matrice de distance contenant les
distances 2 à 2. Cette matrice est symétrique et sa diagonale vaut 0


```
## % latex table generated in R 3.2.4 by xtable 1.8-2 package
## % Tue Feb 07 12:19:41 2017
## \begin{table}[ht]
## \centering
## \begin{tabular}{rrrrrrr}
##   \hline
##  & 1 & 2 & 3 & 4 & 5 & 6 \\ 
##   \hline
## 1 & 0.00 & 1.49 & 3.99 & 2.84 & 5.70 & 6.77 \\ 
##   2 & 1.49 & 0.00 & 2.89 & 2.64 & 5.02 & 5.76 \\ 
##   3 & 3.99 & 2.89 & 0.00 & 2.24 & 2.45 & 2.87 \\ 
##   4 & 2.84 & 2.64 & 2.24 & 0.00 & 3.00 & 4.39 \\ 
##   5 & 5.70 & 5.02 & 2.45 & 3.00 & 0.00 & 1.80 \\ 
##   6 & 6.77 & 5.76 & 2.87 & 4.39 & 1.80 & 0.00 \\ 
##    \hline
## \end{tabular}
## \end{table}
```


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

### Matrice de distance : manhattan


```
##      1   2   3   4   5    6
## 1  0.0 2.1 6.7 4.3 8.7 11.2
## 2  2.1 0.0 4.6 4.4 7.4  9.1
## 3  6.7 4.6 0.0 3.0 4.0  4.5
## 4  4.3 4.4 3.0 0.0 5.0  7.5
## 5  8.7 7.4 4.0 5.0 0.0  2.5
## 6 11.2 9.1 4.5 7.5 2.5  0.0
```


---

### Matrice de distance : Minkowsky

La distance euclidienne et la distance de Manhattan sont deux cas
particuliers de la distance de Minkowsky
$$ d_{ii'} = d(x_i , x_i' ) = \{\sum_i=1^p \alpha_j \|x_{ij}-x_{i'j}\|^\lambda}^{1/\lambda}$$




- Distance euclidienne : $\lambda = 2$, $\alpha_j  = 1$,    $\forall j$
- Distance de Manahttan : $\lambda = 1$, $\alpha_j  = 1$,    $\forall j$
- Distance euclidienne sur donn´ee centr´ee r´eduite : $\lambda = 1$, $\alpha_j  = \frac{1}{s^2_j}$
 s_j=\frac{1}{n}\sum_i=1^n \alpha_j (x_{ij}-\hat x_{j})^2)


