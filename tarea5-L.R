# tarea 5
install.packages("climatol", dependencies = T)
library(climatol)
setwd("C:/Users/ERICK/OneDrive/Documentos/Nueva carpeta/programación")


# NIVEL 1


#1. Generar un diagrama de Walter y Lieth con la data de datcli,
# este debe llevar de título “Estación Campo  de Marte”, 
#a una altitud de 80 msnm durante el año 2017, con los meses simbolizados por números. 
#Las  temperaturas deberán visualizarse de color verde; las precipitaciones, en naranja; 
#los meses de congelación  segura, en azul y los de congelación probable, en celeste. 
#No trazar una línea suplementaria de  precipitación. 
data("datcli")
View(datcli)


diagwl(datcli, "Estación campo de Marte",80, "2017", mlab="xd", pcol = "orange", tcol = "green",
       pfcol="light blue", sfcol = "blue", shem=FALSE, p3line = F)




#2. Recrea minuciosamente el siguiente diagrama de la rosa de los vientos (pista: col=rainbow(8)). 
data("windfr")
View(windfr)
rosavent(windfr,fnum = 3,fint = 4,flab = 1,ang = 3*pi/8,col = rainbow(8),uni = "km/s")

#NIVEL 2

#3. Convertir la data diaria de tmax en una data de medias mensuales. 
#Posteriormente, homogeneizar dichos  datos mensuales con una normalización por estandarización y 
#gráficos de medias anuales y correcciones  aplicadas en el análisis exploratorio de datos (utilizar dos decimales). 


data(tmax)
write.table(dat,'tmax_2001-2003.dat', row.names = F, col.names = F)
write.table(est.c,'tmax_2001-2003.est', row.names = F, col.names = F)

#Convertimos el database (.dat) diario a mensual:

dd2m('tmax',2001,2003, ndec=2,valm=2)
tmax_m<-read.table('tmax-m_2001-2003.dat', header=FALSE)

homogen('tmax',2001,2003,nm=0, std=3,ndec=2,gp=3,expl=TRUE)


#4. Recortar la data mensual de Ptest desde 1965 hasta 2005. Homogeneizar dicha data mediante clústers  o 
#áreas rectangulares, con un ancho de superposición de 0, mediante una estandarización y 
#con gráficos  de totales anuales en el análisis exploratorio de datos. 
#Mostrar las medias de las series homogeneizadas  en un archivo Excel que, además, mencione los totales anuales y 
#los datos de la latitud, longitud y nombre  de cada estación (utilizar dos decimales).

data(Ptest)


write.table(dat,"Ptest_1951-2010.dat", row.names=F, col.names=F)
write.table(est.c, "Ptest_1951-2010.est", row.names=F, col.names=F)
#Recortamos el database (.dat) de 2001-2003 a 2002-2003:
datsubset("Ptest", 1951, 2010, 1965, 2005, 1)
read.table("Ptest_1951-2010.dat")







#NIVEL 3

#5. Con la data homogenizada del ejercicio anterior (si no se ha realizado, iniciar homogeneizando tal cual  
#se menciona en el ejercicio 4) 
#plotear un gráfico de calor con las medias de precipitación mensual de  acuerdo con la latitud y longitud, 
#este debe abarcar desde el punto 2.1°E 39.1°N hasta el punto 3.5°E  40°N, 
#con una separación de 0.001 entre líneas. Además, debe tener un título principal y 
#etiquetado en  ambos ejes. Adicionalmente, plotear un mapa de la zona del mundo en cuestión encima


