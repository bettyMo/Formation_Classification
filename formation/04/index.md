---
title       : Introduction à la classification (4)
subtitle    : Description de la partition
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

##  Choix de la partition

1. Indice fondé sur la somme des carrés
2. Critère de Calinski
3. Graphique silhouette

---

## Somme des carrés

Indice valable pour les classifications ascendantes hierarchiques. 
On souhaite savoir si le saut de s à s-1 classes est "important ou pas"



-  R-Square (RSQ)
-  semi partial RSQ (SPRSQ)
-  Root Mean Square Standard deviation (RMSSTD)
-  cubic clustering criterion (CCC)
-  le pseudo F
-  le pseudo $T^2$

---


## Critère de Calinski


$CH(q) = \frac{trace(B_q )/(q − 1)}{trace(W_q )/(n − q)}$


-  $Wq = \sum_k=1q \sum_{ i \in C_k}(x_i-g_k)^T$ Variance intra classe pour un partitionnement en q classes

- $Bq = \sum_{k=1}^q n_k ∗(g_k − g) (g_k − g)^T$  Variance inter classe pour un partitionnement en q classes

- $x_i$ : vecteur du $i^e$ point de la classe k 
- $g_k$ = centre de gravité de la classe $C_k$
- g =  cente de gravité total
- $n_k$ = nombre d'éléments de la classe $C_k$

---


## Graphique silhouette

>- silhouette

Soit $x_i$ un des éléments à classer, soit C la classe à laquelle l'individu appartient :

- $a(x_i)$ est la dissimilarité moyenne entre $x_i$ et les autres éléments de sa classe. 

$$a(x_i)=\frac{1}{Card(C)-1} \sum_{\underset{i \neq j}{x_j \in C}}d(x_i,x_j)$$

-  $D(x_i,A)$ la dissimilarité moyenne entre $x_i$ et les élements  de la classe A.
$$D(x_i,A)=\frac{1}{Card(A)} \sum_{x_j \in A }d(x_i,x_j)$$

- B est la classe la plus voisine de C. C'est à dire B est la classe telle que

$$D(x_i,A)=b(x_i)=\underset{A \neq C}{min}\{D(x_i,A)\}$$

---

## Graphique silhouette II

<!-- html table generated in R 3.2.4 by xtable 1.8-2 package -->
<!-- Tue Feb 07 23:17:05 2017 -->
<table border=1>
<tr> <th>  </th> <th> A </th> <th> B </th> <th> C </th> <th> D </th> <th> E </th> <th> F </th>  </tr>
  <tr> <td align="right"> A </td> <td align="right"> 0.00 </td> <td align="right"> 1.49 </td> <td align="right"> 3.99 </td> <td align="right"> 2.84 </td> <td align="right"> 5.70 </td> <td align="right"> 6.77 </td> </tr>
  <tr> <td align="right"> B </td> <td align="right"> 1.49 </td> <td align="right"> 0.00 </td> <td align="right"> 2.89 </td> <td align="right"> 2.64 </td> <td align="right"> 5.02 </td> <td align="right"> 5.76 </td> </tr>
  <tr> <td align="right"> C </td> <td align="right"> 3.99 </td> <td align="right"> 2.89 </td> <td align="right"> 0.00 </td> <td align="right"> 2.24 </td> <td align="right"> 2.45 </td> <td align="right"> 2.87 </td> </tr>
  <tr> <td align="right"> D </td> <td align="right"> 2.84 </td> <td align="right"> 2.64 </td> <td align="right"> 2.24 </td> <td align="right"> 0.00 </td> <td align="right"> 3.00 </td> <td align="right"> 4.39 </td> </tr>
  <tr> <td align="right"> E </td> <td align="right"> 5.70 </td> <td align="right"> 5.02 </td> <td align="right"> 2.45 </td> <td align="right"> 3.00 </td> <td align="right"> 0.00 </td> <td align="right"> 1.80 </td> </tr>
  <tr> <td align="right"> F </td> <td align="right"> 6.77 </td> <td align="right"> 5.76 </td> <td align="right"> 2.87 </td> <td align="right"> 4.39 </td> <td align="right"> 1.80 </td> <td align="right"> 0.00 </td> </tr>
   </table>

On prend l'une des partitions obtenues par le critère du saut minimal: celle en 3 classes 

---

## Graphique silhouette III
<!-- html table generated in R 3.2.4 by xtable 1.8-2 package -->
<!-- Tue Feb 07 23:08:10 2017 -->
<table border=1>
<tr> <th>  </th> <th> Longueur </th> <th> Largeur </th> <th> Poids </th> <th> partition </th>  </tr>
  <tr> <td align="right"> 1 </td> <td align="right">   2 </td> <td align="right">   6 </td> <td align="right"> 10.30 </td> <td align="right">   1 </td> </tr>
  <tr> <td align="right"> 2 </td> <td align="right">   2 </td> <td align="right">   5 </td> <td align="right"> 11.40 </td> <td align="right">   1 </td> </tr>
  <tr> <td align="right"> 3 </td> <td align="right">   4 </td> <td align="right">   3 </td> <td align="right"> 12.00 </td> <td align="right">   2 </td> </tr>
  <tr> <td align="right"> 4 </td> <td align="right">   4 </td> <td align="right">   4 </td> <td align="right"> 10.00 </td> <td align="right">   2 </td> </tr>
  <tr> <td align="right"> 5 </td> <td align="right">   6 </td> <td align="right">   2 </td> <td align="right"> 11.00 </td> <td align="right">   3 </td> </tr>
  <tr> <td align="right"> 6 </td> <td align="right">   6 </td> <td align="right">   1 </td> <td align="right"> 12.50 </td> <td align="right">   3 </td> </tr>
   </table>


**Application numérique**

Ainsi pour l'individu A :

   - a(A)=1.486607
   - D(A,{C,D})=3.415259 et D(A,{E,F})=6.23
   - La classe la plus voisine de A après sa classe d'appartenance est {C,D}

---

## Qualité du classement

- **Largeur de la silhouette**

$$s(x_i)=\frac{b(x_i)-a(x_i)}{max{a(x_i);b(x_i)}}$$

$s(x_i)$ est compris en -1 et 1.


    - $s(x_i)$ proche de 1 : 
       $x_i$ est bien classé dans C
    - $s(x_i)$ proche de 0  : 
       $x_i$ est entre C, sa classe d'appartenance, et B la classe la plus proche de $x_i$
     - $s(x_i)$ proche de -1  : 
     $x_i$ est mal classé, plus proche de B que de C, sa classe d'appartenance.



Dans le cas de notre exemple le point A est pluôt bien classé s(A)=0.564716

---

## Indices de qualité et nombre de classes

- ** Qualité d'une partition **
Moyenne des silhouettes :
$Q(k)=\frac{1}{n}\sum_{r=1}^k  n_r \bar{s_r}$


--- 

## Graphique 

<img src="assets/fig/silhouettegraph, -1.png" title="plot of chunk silhouettegraph, " alt="plot of chunk silhouettegraph, " width=".5\linewidth" />
On retient le nombre de classes pour lequel l'indice de qualité est le meilleur

---


## Choix du nombre de classes

Il existe une multitude d'indicateurs, ainsi dans R un package en relève 30 et vous propose de les comparer.




---




## Description d'une classe

Principe (très simple) : Comparaison de moyenne ou proportion de variables à l’intérieur des classes, avec les valeurs générales sur l’ensemble des classes. 
Une valeur test peut ensuite être calculée pour désigner les variables les plus caractéristiques (Morineau)



- Variable continue :  tk=(xmoy(k)-xmoy)/xs(k) pour une variable X
      Plus  la valeur est forte ($ \leq 1,96 $ ) ,  plus  la var est caractéristique de la classe
    
---

## Variable nominale

On compare la modalité j dans la classe $X_k$ et dans l’ensemble de la population.

Soit nkj/nk = nj/n en cas d’indépendance,  avec 

    - nk :  nb d’individus de la classe k , 
    - nj  :nombre d’individus possedant la modalite j dans la population,
    - njk : nombre d’individus possedant la modalite j dans la classe.
    
On calcule la proba P($N \geq nkj$ ). Si faible, peu de chances d’avoir un tirage au hasard.


Equivalent : Mesurer l’écart entre la proportion dans la classe et dans la population en termes d’écart types. 
Valeur test : tk(N)=N-E(N)/sk(N), avec $E(N)=n_k \times n_j/n, et sk(n)^2=n_k*((n-n_k)/(n-1))*(n_j/n)*(1-(n_j/n))$
Valeur test supérieure à 1,96 :  Modalité caractéristique ds la classe / ensemble de la population


---



