#Vectores
#Creando mi primer vector
vector <- c(5,3,2,1)
#Funciones sobre vectores
#El valor mínimo del vector
min(vector)
#El valor máximo del vector
max(vector)
#El tamaño del vector
length(vector)
#Suma del vector
sum(vector)
#Multiplicación del vector
prod(vector)
#Rango (Devuelve el valor mínimo y máximo)
range(vector)
#La posición donde esta el valor mínimo
which.min(vector)
#La posición donde esta el valor mínimo
which.max(vector)
#Invierte un vector
rev(vector)

#Matrices
#Creando mi primera matriz 4x5
matriz1 <- matrix(data = 1:20, nrow = 4, ncol = 5, 
                  byrow = FALSE)
matriz1
#Si queremos que la matriz se llene por filas colocamos
#byrow= TRUE como argumento
matriz2 <- matrix(data = 1:20, nrow = 4, ncol = 5, 
                  byrow = TRUE)

matriz2
#Extraer elementos almacenados en la matriz
#Extraer valor almacenado en una celda.
matriz1[3,4]
#Extraer valor almacenado en una Columana.
matriz1[2,]
#Extraer valor almacenado en una fila.
matriz1[,5]
#Si queremos la matriz original sin las columnas 2 y 4
matriz[,-c(2,4)]
#Si queremos la matriz original sin la fila 1 y columna 3
matriz[-1,-3]

# Listas
# Una lista se crea con la función list(), y sirve para almacenar diferentes
# tipos de objetos de R.

# Crear una lista con: 
# (i) Un vector que contenga los numeros del 1 al 5
# (ii) Un vector que tenga las palabras de los colores de la bandera de Colombia
# (iii) Un vector con los numeros 21, 19 y 20
# (iv) Una lista con:
#     (i) Un vector con los numeros del 1 al 5 y del 10 al 15
#     (ii) Un vector con la palabras Feliz y Cumpleaños

lista<-list(1:5,
            c("Amarillo","Azul","Rojo"),
            c(21,19,20),
            list(c(5:10,11:15),
                 c("Feliz","Cumpleaños")))


### Ver la estructura del objeto lista
str(lista)

### Cambiar los nombres de los objetos en la lista
# Forma 1
lista<-list(a = 1:5,
            b = c("Amarillo","Azul","Rojo"),
            c = c(21,19,20),
            d = list(d1 = c(5:10,11:15),
                     d2 = c("Feliz","Cumpleaños")))

# Forma 2
names(lista)<-c("a","b","c","d")
names(lista$d)<-c("d1","d2")


### Selección de elementos 
# [] Extrae una sublista
lista[1]

# [[]] Extrae un único componente u objeto de la lista
lista[[1]]
lista[[4]][[1]]

# $ Extrae elementos de la lista por medio de su nombre
lista$a




#
# Data frame
#

# El data frame es la estructura fundamental para manipular conjuntos de datos en R.
# Es muy útil ya que a diferencia de la matriz, un data frame puede almacenar diferentes
# tipos de variable y a diferencia de una lista, el data frame es mucho más práctico. El
# data frame se crea con la función data.frame()

# El data frame está compuesto por filas que hacen referencia a la observación y las
# columnas que hacen referencia a las variables


### Creando un data frame
# Vector de nombres
nombre <- c("Maria","Daniel","Ana","Mario")

# Vector con edad
edad <- c(17,20,21,15)

# Vector lógico, mayoría de edad
mayor <- c(FALSE,TRUE,TRUE,FALSE)

#Crear un data frame
df <- data.frame(nombre,edad,mayor)
df


## Cambiar nombre de columnas
# Forma 1: Con la función names
names(df) <- c("Nombre","Edad","Mayor")

# Forma 2: Al momento de crear el data frame
df <- data.frame(Nombre = nombre, Edad = edad, Mayor = mayor)

# Ver estructura del data frame
str(df)


### Seleccionar elementos del data frame
# Seleccionar fila 4, columna 2
df[4,2]

# Seleccionar fila 4, columna 2 o de Edad
df[4,"Edad"]

# Seleccionar toda los datos de la observación 4
df[4,]

# Seleccionar todos los datos de la columna de Edad
df[,"Edad"]

# Crear un sub data frame
df[c(1,4),c("Nombre","Mayor")]


### Expandir data frame
## Añadir una columna o variable
# Forma 1: $
df$Peso<-c(50,72,65,55)

# Forma 2: [[]]
df[["Peso"]]<-c(50,72,65,55)

#Forma 3: cbind(),combine columns
Peso<-c(50,72,65,55)
cbind(df,Peso)

## Añadir una fila u observación
# Para agregar una observación con los datos de la persona no se puede crear un
# vector, ya que no puede contener diferentes tipos de elementos, por eso se
# debe crear un nuevo data frame con una sola observación

# Crear nueva observación como data frame
nuevaobs <- data.frame(Nombre = "Cristian",
                       Edad = 19,
                       Mayor = TRUE,
                       Peso = 68)

# Combinar data frames
df<-rbind(df,nuevaobs)


### Ordenar data frames
# Ordenar ascendente o descendentemente la variable edad
sort(df$Edad)

# Determinar posiciones del vector ordenado
pos<-order(df$Edad)

# Ordenar data frame de acuerdo a las posiciones
df[pos,]
df[c(4,1,5,2,3),]

# Ordenar data frame en orden descendente
df[order(df$Peso,decreasing = TRUE),]


#
# Funciones
#

#En una función tenemos 3 tipos de elementos:
# (i) input (o valores de entrada)
# (ii) Cuerpo: operaciones que han de realizarse
# (iii) Resultado (o valores de salida): la última expresión que se ejecuta

# mifuncion <- function(input1, input2, ...) {
#   cuerpo
#   resultado
# }

# Crear función para determinar el área de un circulo a partir de su radio
area_circulo <- function(r){
  Area <- pi*r^2
  return(Area)
}

# Hallar area del circulo de radio 5
area_circulo(5)

# Función con output como data frame 
area_circulo <- function(r){
  Area <- pi*r^2
  Circunferencia <-2*pi*r
  return(data.frame(Area = Area, Circunferencia = Circunferencia, r = r))
}

area_circulo(c(1,5,7))

# Función que devuelva un plot
grafico<-function(r){
  Area<-pi*r^2
  return(plot(r,Area))
}
grafico(1:5)



#
# Gráficos
#
install.packages("datasets")
library(datasets)
data(iris)
data<-iris
summary(data)

# hist()
hist(data$Petal.Length)
hist(data$Petal.Length,probability = T,)
hist(data$Petal.Length,probability = T,breaks = 4)
hist(data$Petal.Length, breaks = c(0,2,4,6,8,10),ylim = c(0,100))
hist(data$Petal.Length, breaks = seq(from=0,to=10,by=1), ylim = c(0,100),
     main = "Distribución de Edad",
     xlab = "Longitud del pétalo", 
     ylab = "Frecuencia",
     col = "green")


# plot()
plot(data$Petal.Length)
plot(data$Petal.Length,data$Petal.Width)
plot(data$Petal.Length,data$Petal.Width,xlab = "Longitud del pétalo",
     ylab = "Ancho del pétalo",main="Relación Longitud/Ancho",
     col="blue")

# boxplot()
boxplot(data$Petal.Length)
summary(data$Petal.Length)

boxplot(data$Petal.Length, ylab="Longitud", 
        main = "Diagrama de caja y bigote",
        col = "gold")

#Ejercicio 1
#Los datos que aparecen en el archivo turbina.csv
#representan el empuje de un motor de turbina (y) y
#seis variables de regresión candidatas: X1= velocidad
#de rotación primaria, X2= velocidad de rotación secundaria,
#X3=rapidez de flujo de combustible, x4=presión, 
#X5=temperatura de escape y X6=temperatura ambiente
#durante la prueba.
#Generemos el modelo con las variables significativas
# y verifiquemos los supuestos.

#Lectura de datos
datos <- read.csv(file="turbina.csv")
#Utilizamos el argumento sep para asignar los datos 
#a su columna correspondiente
datos <- read.csv(file="turbina.csv", sep = ";")
#Eliminamos la primera columna
datos <- datos[,-1]
#Resumen de los datos
summary(datos)
#Graficamos las variables para explorar su relación
pairs(datos)
#Para observar la correlación entre variables
#Correlación de las variables numéricas (matriz de correlación):
cormat<-cor(cbind(datos$y,datos$x1,datos$x2,datos$x3,datos$x4,
                  datos$x5, datos$x6))
cormat

#Para asignarle nombres a las columnas
colnames(cormat)<-c("y","x1","x2","x3","x4","x5","x6")
#Para colocarle nombre a las filas
row.names(cormat)<-c("y","x1","x2","x3","x4","x5","x6")
cormat
#Creando el modelo de regresión lineal múltiple
#Escribimos el modelo de la forma Y~X1+X2.. Xn
fit <- lm(formula = y~x1+x2+x3+x4+x5+x6, data = datos)
#Resumen del modelo
#Podemos estimar Bo
summary(fit)
#Nuevo modelo
fit <- lm(formula = y~0+x1+x2+x3+x4+x5+x6, data = datos)
summary(fit)
#Nuevo modelo
fit <- lm(formula = y~0+x1+x3+x4+x5+x6, data = datos)
summary(fit)
#Nuevo modelo
fit <- lm(formula = y~0+x1+x4+x5+x6, data = datos)
summary(fit)
#Y= 0+1.2095x1+ 4.8728x4+4.6082x5 -12.9932x6
#Análisis de varianza
anova(fit)
#Supuestos
par(mfrow=c(2,2))
plot(fit)
#NORMALIDAD
#Ho: Los residuos se distribuyen normalmente con media igual
#a cero y varianza estimada como s^2=720
#H1:Los residuos NO se distribuyen normalmente con media igual
#a cero y varianza estimada como s^2=720
shapiro.test(fit$residuals)
#INDEPENDECIA
#Ho: Los residuos son independientes.
#H1: Los residuos son dependientes.
library(car)
durbinWatsonTest(fit)
#HOMOCEDASTICIDAD
#Ho: Los residuos son Homocedasticos.
#H1: Los residuos son heterocedasticos.
ncvTest(fit1)
#b.	Encuentre el valor esperado e intervalos para el 
#empuje del motor cuando X1=2100, X2=20200, X3=29850, 
#X4=170,  X5=1589 y X6=100
#Creamos un nuevo objeto
newd<-data.frame(x1=2100,x2=20200,x3=29850,x4=170,x5=1589,
                 x6=100)
#Valor esperado
predict(fit,newdata = newd)
#Intervalo de confianza
predict(fit,newdata = newd, interval = "confidence") 
#Intervalo de predicción
predict(fit, newdata=newd, interval = "prediction")


