---
title       : Introduction à la classification (3)
subtitle    :  Algorithmes
author      : Elisabeth Morand-Bénédicte Garnier
job         : SMS

framework: deckjs
deckjs:
  theme: web-2.0
highlighter : highlight.js  # {highlight.js, prettify, highlight}

hitheme     : solarized_light 
widgets     : [bootstrap, shiny, interactive,mathjax,quiz]           # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
ext_widgets: {rCharts: [libraries/nvd3]}
---

## Principe


On agrège à chaque étape les **2 éléments** les plus proches
L’idée est d’agréger au niveau individuel

Algorithme : On a n éléments à  classer

- On agrège les deux éléments les plus proches (distance minimale /similarité maximale!)

> - il reste n-2 individus et un groupe de 2 individus soit n-1 éléments de 2 types (individus et
classe)

> - parmi les n-1 éléements restants, on regroupe les deux plus proches

> - etc.


> Problème:
 on a la distance entre 2 individus mais il faut déﬁnir 
la ressemblance entre un groupe d' individus et un individu 
ou celle entre deux groupes d’individus.


---

## Exemple avec la distance euclidienne I

         1        2        3        4        5        6
1 0.000000 1.486607 3.986226 2.844293 5.700000 6.770524
2 1.486607 0.000000 2.891366 2.638181 5.015974 5.762812
3 3.986226 2.891366 0.000000 2.236068 2.449490 2.872281
4 2.844293 2.638181 2.236068 0.000000 3.000000 4.387482
5 5.700000 5.015974 2.449490 3.000000 0.000000 1.802776
6 6.770524 5.762812 2.872281 4.387482 1.802776 0.000000



si on applique l’algorithme :
- Etape 1 : on regroupe A et B;  on appelle cet élément {A, B}
- Il reste 5 éléments C, D , E, F et {A, B}

---

## Exemple avec la distance euclidienne II
  - Parmi C D E et F il est facile de trouver comment les regrouper
  - Mais  C est plus proche de D (2.24) que de {A, B} ?
  - On considère que la distance entre {A, B} et C est le min de d(A,C) et d(C, B) soit 2.89.
  
Donc on reconstruit une matrice de distance


|     |A;B        | C         | D     | E  |
|-----|-----------|:---------:|------:|:----:|
|C    | 2.89      |           |       |    |
|D    | 2.64      |  2.24     |       |    |
| E   | 5.02      |  2.45     | 3.00  |    |
| F   | 5.76      | 2.87      | 4.39  |1.80|

- **Etape 2** On regroupe E et F

Il reste 4 éléments {A, B},{E, F } , C et D


---

## Exemple avec la distance euclidienne III

- pour la distance entre $\{A,B\}$,$\{E,F\}$ on cherche le minimum de la distance entre 1 point du premier groupe et un point du $2^e$ groupe soit min (d(A,E), d(A,F),d(B,E),d(B,F)) ici cela vaut 5.02. On doit alors reconstruire une matrice de distance 

    A; B    C         D
    
C	  2.89		
D	  2.64	  2.24	
E,F	5.02	  2.45	  3.00


- **Etape 3** On regroupe  C et D

---
## Exemple avec la distance euclidienne IV

-  il reste 3 éléments {A;B} et {E;F} et {C;D}
-  on reconstruit une matrice de distance

      | A; B |   C;D |
------|------| ------ |
C;D	  |2.64	|
E,F	  |5.02	|  2.45 |

- **Etape 4** : on regroupe C; D et E;F 
-  il reste 2 élements {A,B} {C,D,E,F}

---

## Critère du saut minimal


$$D_{diam}(h,h')=inf\{d(i,i'); i \in h i' \in h'\}$$

**single linkage**

---

## Resultats 
assets/fig/exempledendrogramme -1.pdf

---



## Terminologie

On obtient un arbre des partitions  appelé dendrogramme

- Individus initiaux = éléments terminaux de l’arbre
- N\oe uds = Classes issues de regroupements.
- Ainé-Benjamin = Deux éléments constitutifs d’un N\oe uds


Coupure de l’arbre : on obtient une partition.

---




##Variantes


> Critère du diamètre 
$$D_{diam}(h,h')=sup\{d(i,i'); i \in h i' \in h'\}$$

**Complete linkage** ; ici c'est la plus grande distance qui est utilisée

En pratique, ce critère n'est pas employé



> Critère de la moyenne 
Point $x_{i}$ de masse $m_{i}$ et point $x_{i'}$ de masse $m_{i'}$


$$D_{moy}(h,h')=\frac{1}{m_h m_{h'}}\sum_{i\in h, i' \in h'} \{m_i m_{i'}d(i,i')\} $$

**average linkage**

---


## Le critère de Ward 

> Ward, perte d'inertie minimale}
$$\Delta I_{min}= \frac{m_h m_{h'}} {m_h+m_{h'}} d^2(g_h,g_{h'})$$


- d distance euclidienne

- g centre de gravité

La partition obtenue à une étape n par rapport à l'étape n-1 consiste à regrouper deux classes telles que l'inertie inter classe soit maximum (que la classes soient très différentes entre elles).

---

## Limites

assets/fig/inconvenientsward-1.pdfassets/fig/inconvenientsward-2.pdf

---

## Avantages/inconvénients

### Avantages

1. Flexibilité sur le niveau de finesse de la classification
2. Tous types de distance et de similarité peuvent être utilisés


### Inconvénient 

1. Choix de la partition (coupure de l'arbre)
2. La partition à une étape dépend de celle de l'étape précédente
3. Tient peu compte des individus atypiques, classe toujours de même forme. Méthode peu adapté à l'analyse spatiale

---

## Classification non Hierarchique

1. kmeans
2. k-medoids

---

## Introduction 

Dans le cas des méthodes hierarchiques  on a vu que :

1.  la partition en k classes n'est pas optimale
2. une fois regroupé 2 éléments on ne revient pas en arrière


Une solution serait de réaliser toutes les partitions possibles, ensuite on choisi un critère de qualité et on prend la meilleur au sens de ce critère.

Le problème c'est que le nombre de partition possible peut devenir très vite gigantesque.

---

## Classification non hierachique ; partitionnement

L'objectif est d'obtenir la partition optimale pour un nombre de classes fixé.

Dans ces algorithmes on réaffecte progressivement les individus dans des classes afin de les améliorer.

On distingue deux types d'algorithme  de partitionnement par optimisation itérative :

1. les méthodes k-moyennes
2. les méthodes k-représentant (k-medoids)

---



## kmeans : Principe


1. Inititaliser en prenant k elements au hasard ; k premiers centres de classes
2. Affecter chaque élement à une classe ; celle du centre dont il est le plus proche
3. Recalculer les centres de ces classes nouvellement constituées ; on représente une classe par son centre. Le centre de la classe n'est généralement pas un des points à classer
4 .On répète 2 et 3 jusqu'à stabilisation des centres


Généralement, on emploit la distance euclidienne.

Les algorithmes varient fonction : du choix des centres de départ, le calcul des dissimilarités entre objets,le calcul des moyennes des classes et la prise en compte des données catégorielles ou mixtes.

Dans les logiciels on trouve : la méthode des centres mobiles Forgy(1965) , k-means (Mc Queen, 1967) et les nuées dynamiques(Diday,1971)

--- 



## Centre mobiles ; nuées dynamiques

- Centres mobiles : le centre des classes  est le barycentre calculé à chaque fin d'afectation de tous les individus 

- k-means = les barycentres des classes ne sont 
pas recalculés à la fin d'une étape mais chaque fois que l'on affecte un individu à une classe. L’algorithme est ainsi plus
rapide, mais l'ordre d'apparition des individus dans le fichier
n'est pas neutre. Il n'est pas rare d'adjoindre plusieurs départ à l'algorithme et plusieurs changement d'ordre du fichier


-  nuées dynamiques : Au lieu de prendre un seul représentant de la classe,
on utilise un noyau de points constitués
d’éléments représentatifs de la classe. Cela permet de corriger
l’influence d’éventuelles valeurs extrêmes sur le calcul du barycentre.

---

## k-medoids - Exemple de méthode : PAM

On choisi un représentant par classe. Ce représentant est censé être le plus au centre de la classe.

L'algorithme PAM est le suivant : à partir d'un ensemble de k représentants ($M_1, M_2...M_K$)
choisis parmi les n éléments à classer

1.  Sélection de un representant $M_t$ et un objet à classer $O_t$
2.  Calculer la qualité de la nouvelle partition si on inverse $M_t$ et $O_t$
3.  Echanger  $M_t$ et$ O_t$ si la partition est meilleure
4.  Retourner en 1 jusqu'à ce que la partition soit stable

 
Ce type d'opération ne peut être réalisé que pour des petits échantillons
 
---

## PAM sur le petit jeu de données

         1        2        3        4        5
2 1.486607                                    
3 3.986226 2.891366                           
4 2.844293 2.638181 2.236068                  
5 5.700000 5.015974 2.449490 3.000000         
6 6.770524 5.762812 2.872281 4.387482 1.802776


En théorie,on prend C et D pour lequels la somme des distances au carré aux autres points sont les plus basses

 $$(3.99^2+2.89^2+2.24^2+2.45^2+2.87^2)$$
 
---

## PAM sur le petit jeu de données II

Pour l'exemple on prend B et D : 
- B est le premier représentant 
- D le deuxième
   
$C_1^2=\{B*,A\}$
$C_2^2=\{D*,C,E,F\}$

Ici $$Q=\sum_{i\in C_1^2} d^2(i,R_1)+\sum_{i\in C_2^2} d^2(i,R_2)=2.22+33.29=35.5097$$
 
 On échange un representant , le B, par un non représentant pris au hasard, le C.
 
 $C_1^1=\{C*,E,F\}$
  $C_2^1=\{D*,A,B\}$
  
  Qualité de la partition $$Q(P)=\sum_{r=1}^k\sum_{i\in C_r} d^2(i,R_r)$$
  
  avec $R_r$ le représentant de la classe r.
  
 
  Ici $$Q=\sum_{i\in C_1^1} d^2(i,R_1)+\sum_{i\in C_2^1} d^2(i,R_2)=11.02+15.0352=26.0552$$
  
  On améliore. On prend cette nouvelle partition et on recommence.
  
---

## Classification floue

En classification classique(nette), un individu appartient à une et une seule classe. Il est donc parfois attribué à une classe alors que la différence avec une autre est infime

Une solution est d'estimer un niveau d'appartenance à chaque classe au cours de la construction de la typologie.
---







