---
title       : Introduction à la classification
subtitle    : 
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

## Objet d'étude

1. On travaille avec un tableau de donnéees ”classique” ; individus$\times$variables
Les lignes du tableau correspondent aux individus (enquêtés, ménages,
villes ...) pour lesquels on dispose de caractéristiques, les variables, qui
correspondent aux colonnes du tableau

2. On souhaite classer les individus


---

## Objectif d'une classification automatique

> Des classes

La classiﬁcation vise à construire des **classes**

Une classe va contenir des objets pris dans un ensemble (population ou
échantillon). Les objets d’une classe se ressemblent suivant certains
critères.

Pour classer il faut donc disposer d’objet à classer et de caractéristiques
sur ces objets permettant d’apprécier s’ils se ressemblent.

> Pourquoi réealiser une classiﬁcation :
 
> 
>  Pour obtenir des sous populations homogènes
>  Pour avoir une typologie des individus



---


## Classement et classification automatique

### Vocabulaire

### Partition
---

## Un peu de jargon

On s’intéresse ici à une classiﬁcation dite **non superviséee** c’est à dire que
l’on dispose d’éléments non classés que l’on veut regrouper en classes.

Il existe des méthodes dites de **classiﬁcation supervisée** c’est à dire que
l’on dispose d’"léments déjà classées (malade/non malade) et que l’on
souhaite classer un nouvel élément à partir d’autres informations.


---


 


## un peu de vocabulaire
La classiﬁcation ou classiﬁcation automatique est un terme généralement
employée en français. Les anglo-saxons l’utilisent aussi mais pour désigner
des techniques de classement (plutot inférentielles, proches de la
classiﬁcation supervisée)

- typologie ou analyse typologique
- clustering terme anglo saxon
- taxinomie
- segmentation est parfois employé dans le sens de classiﬁcation automatique
- reconnaissance de forme non supervisée
...

---

## Partition

- Une partition de classes
- Une partition comme une variable latente



---  

## Exemple





## Error in file(file, "rt"): cannot open the connection
% latex table generated in R 3.3.2 by xtable 1.8-2 package
% Wed Feb 08 09:53:52 2017
\begin{table}[ht]
\centering
\begin{tabular}{rlrrrlr}
  \hline
 & Nom & Longueur & Poids & Largeur & Couleur & Region \\ 
  \hline
1 & A &   2 & 10.30 &   6 & jaune &   1 \\ 
  2 & B &   2 & 11.40 &   5 & bleu &   1 \\ 
  3 & C &   4 & 12.00 &   3 & jaune &   2 \\ 
  4 & D &   4 & 10.00 &   4 & jaune &   1 \\ 
  5 & E &   6 & 11.00 &   2 & bleu &   2 \\ 
  6 & F &   6 & 12.50 &   1 & bleu &   2 \\ 
   \hline
\end{tabular}
\caption{Les données utilisées} 
\label{tabtp}
\end{table}


---

## Notation

- On va considérer l’ensemble des individus à classer comme l’ensemble des individus d’un
tableau : individus $\times variables

- Si on a P variables et si on note $x_i$  le vecteur contenant l’ensemble des valeurs prises pour
un individu ; $x_i$  est la ligne d’un tableau

- Les individus à classer sont donc des points $x_i$  de l’espace $R^P$. Chaque point ayant les
coordonnées $x_{ij}$ , j = 1, 2, . . . p


---

