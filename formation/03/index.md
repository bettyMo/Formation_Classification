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


On agrège à chaque étape les **2 éléements** les plus proches
L’idéee est d’agréeger au niveau individuel

Algorithme : On a n éléments à  classer

- On agrège les deux éléments les plus proches (distance minimale /similarité maximale!)
- il reste n-2 individus et un groupe de 2 individus soit n-1 éléements de 2 types (individus et
classe)
- parmi les n-1 éléements restants, on regroupe les deux plus proches
- etc.

Problème: on a la distance entre 2 individus mais il faut déﬁnir la
ressemblance entre un groupe de 2 ou plusieurs individus et un individu ou
celle entre deux groupes d’individus.


---
##Exemple avec la distance euclidienne I



