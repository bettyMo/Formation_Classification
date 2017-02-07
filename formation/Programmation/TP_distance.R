# Importer le jeu de données exemple 

tabtp <- read.delim("donnees/aveclesmains.txt", dec=",")


# Calculer une distance euclidienne



# Calculer une distance de Manhattan

dist(tabtp[,c("Longueur","Largeur","Poids")],method="manhattan")


as.matrix(round(dist(tabtp[,c("Longueur","Largeur","Poids")],method="manhattan"),2))
# Note : par defaut, comme la matrice est symétrique, la fonction ne sort qu'un "moitiée" de matrice


# Calculer une distance