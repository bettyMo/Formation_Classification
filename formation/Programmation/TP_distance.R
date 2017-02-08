# Importer le jeu de données exemple 

tabtp <- read.delim("donnees/aveclesmains.txt", dec=",")

head(tabtp)

# Calculer une distance euclidienne


dist(tabtp[,c("Longueur","Largeur","Poids")])

# Calculer une distance de Manhattan

dist(tabtp[,c("Longueur","Largeur","Poids")],method="manhattan")


as.matrix(round(dist(tabtp[,c("Longueur","Largeur","Poids")],method="manhattan"),2))
# Note : par defaut, comme la matrice est symétrique, la fonction ne sort qu'un "moitiée" de matrice


# Calculer une distance
library(proxy)
library(xtable)
quantitatives<-tabtp[,c("Longueur","Largeur","Poids")]
mat<-(round(simil(quantitatives,method="cosine"),2))
mat





# Ensemble des distances possibles
summary(pr_DB)
pr_DB$get_entry("Jaccard")


?simil
# Un eautre distance

dist(quantitatives, method = "eJaccard")
pr_DB$get_entry("eJaccard")
pr_DB$get_entry("Chi-squared")


qualitatives<-tabtp[,c("Couleur","region")]


dist(qualitatives, method = "Gower")
dist(tabtp,method = "Gower")

# Comparer les representations 
library(ade4)
library(ggplot2)
quantitatives<-tabtp[,c("Longueur","Largeur","Poids")]
rownames(quantitatives)<-tabtp[,1]
manhattan<-dist(quantitatives,method="manhattan")
euclidienne<-dist(quantitatives)
cosine<-1-dist(quantitatives,method="cosine")

RepresentationDistMan<-cmdscale(manhattan)
RepresentationDistEuclid<-cmdscale(euclidienne)
RepresentationDistCosine<-cmdscale(cosine)

rownames(RepresentationDistMan)<-tabtp[,1]
rownames(RepresentationDistEuclid)<-tabtp[,1]
rownames(RepresentationDistCosine)<-tabtp[,1]

plot(RepresentationDistMan,xlab="x",ylab="y",type="n",asp=1)

text(RepresentationDistEuclid[,1:2],rownames(RepresentationDistEuclid))


rotation<-procuste(RepresentationDistMan, RepresentationDistEuclid,nf = 2,scale=F)$scorX
rotation2<-procuste(RepresentationDistCosine, RepresentationDistEuclid,nf = 2,scale=F)$scorX


plot(RepresentationDistEuclid,xlab="x",ylab="y",type="n",asp=1,xlim=c(-6,6),ylim=c(-2,2))
text(RepresentationDistEuclid[,1:2],rownames(RepresentationDistEuclid))
text(rotation,rownames(RepresentationDistMan),col=2)
text(rotation2*6,rownames(RepresentationDistMan),col=3)


Euclid<-data.frame(row.names(RepresentationDistEuclid),"euclid",RepresentationDistEuclid[,1:2])
colnames(Euclid)<-c("Points","Distance","X","y")
rotation<-data.frame(row.names(rotation),"Man",rotation)
colnames(rotation)<-c("Points","Distance","X","y")
rotation2<-data.frame(row.names(rotation2),"Cosine",rotation2*6)
colnames(rotation2)<-c("Points","Distance","X","y")


tab<-rbind(Euclid,rotation,rotation2)


p <- ggplot(tab, aes(X, y, color = Points, frame = Distance,size=10)) +
  geom_point() 
library(gganimate)

gganimate(p)

p <- ggplot(tab, aes(X, y, color = Distance, frame = Points,size=10)) +
  geom_point() 


gganimate(p)

# on essaye sur un autre jeu de donn�es 
tableau2 <- read.delim("donnees/dchetf.csv", dec=",")

# et sur les petits chiens