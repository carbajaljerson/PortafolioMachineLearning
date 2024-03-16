![GitHub repo size](https://img.shields.io/github/repo-size/scottydocs/README-template.md)
![GitHub contributors](https://img.shields.io/github/contributors/scottydocs/README-template.md)
![GitHub stars](https://img.shields.io/github/stars/scottydocs/README-template.md?style=social)

![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54) ![NumPy](https://img.shields.io/badge/numpy-%23013243.svg?style=for-the-badge&logo=numpy&logoColor=white) ![Pandas](https://img.shields.io/badge/pandas-%23150458.svg?style=for-the-badge&logo=pandas&logoColor=white) ![Plotly](https://img.shields.io/badge/Plotly-%233F4F75.svg?style=for-the-badge&logo=plotly&logoColor=white) ![scikit-learn](https://img.shields.io/badge/scikit--learn-%23F7931E.svg?style=for-the-badge&logo=scikit-learn&logoColor=white) ![Render](https://img.shields.io/badge/Render-%46E3B7.svg?style=for-the-badge&logo=render&logoColor=white) ![FastAPI](https://img.shields.io/badge/FastAPI-005571?style=for-the-badge&logo=fastapi)


# Proyecto Machine Learning Operations (MLOps)

## Introducción

El presente proyecto se desarolla bajo el perfil de un Data Engineer y Data Scientist, para la empresa Steam que es una plataforma de distribución digital de videojuegos desarrollada por Valve Corporation. Se cuenta con poca madurez de los datos y se solicita se desarrolle un Producto Mínimo Viable donde se contará con un servicio en la nube a través de una API así como con la implementación de dos modelos de Machine Learning, en base al género de un videojuego o a partir de un score o rating.


## Datos

Este proyecto cuenta con tres archivos JSON:

* **australian_user_reviews.json** es un dataset que contiene los id de usuarios los cuales por medio de sus reseñas realizan evaluaciones de los videojuegos, es esta columna importante para un análisis posterior que nos revelaría la satisfacción o el no agrado a través de emoticones o emojis siendo esto parte del procesamiento del lenguaje natural. 

* **australian_users_items.json** es un dataset que contiene los id de usuarios sobre los cuales se tiene como dato el tiempo acumulado de juego sobre un específico item.

* **output_steam_games.json** es un dataset en que se encuentran datos propios de los videojuegos, es decir su género, título, precio, descuento, empresa que lo desarrolló y score como los datos más significativos.

## **DESARROLLO DEL PROYECO ** :white_circle:

## **1. Etapa del proceso ETL** :

- Cargamos los archivos con extensión .json con las librerias de json y pandas.
- Luego se realizó el trabajo Extracción, Transformación y Carga (ETL)
- Se verificó que algunas columnas presentan valores de tipo arreglo como el caso de la columna 'genres' y se desanidaron. 
- Se realizaron diversas transformaciones dando formato a las fechas '%Y-%m-%d' a la columna 'posted' o reemplazar emojis y emoticones por texto en la columna
de reseñas de los juegos.
- Se eliminaron las columnas que no eran explicativas para el proyecto.
- Luego de las transformaciones y normalización de los datos se exportaron los archivos serializados para el consumo de la API.


## **2. Análisis Exploratorio de los Datos (EDA)**

Una vez que los datos están limpios, es tiempo de revisar las relaciones que existen entre las variables de los datasets, encontrar si hay presencia de outliers o anomalías (que no tienen que ser errores necesariamente), y verificar si hay algún patrón que sirva en un análisis posterior. Las nubes de palabras nos mostraran cuales son las palabras que se presentan con una mayor frecuencia, se deja la gráfica sobre la columna 'app_name'




<p align="center">
  <img src="src\image_01.png" height="450" weight="500">
</p>
El gráfico muestra los tres géneros más comunes en nuestro conjunto de datos. Cada barra representa la frecuencia con la que aparece un género específico en nuestros datos. Observamos que el género más frecuente es "Action", seguido por "Indie" y "Adventure". Este tipo de visualización nos ayuda a identificar las preferencias de géneros en la plataforma Steam.

</br></br>
<p align="center">
  <img src="src\image_02.png" height="400" weight="400">
</p>
El gráfico muestra los 10 principales editores en nuestro conjunto de datos. Este tipo de visualización nos ayuda a identificar los editores más dominantes en la industria de videojuegos el principal es "Valve", seguido por "Smartly Dressed Games" y "Bohemia Interactive". 

</br></br>
<p align="center">
  <img src="src\image_03.png" height="330" weight="400">
</p>
Esta visualización proporciona una rápida comprensión de la distribución de los 10 títulos de contenido más populares en la plataforma Steam.
Observamos que el título de contenido más frecuente es "Unturned", seguido por "Robocraft" y "Terraria". Las barras restantes muestran otros títulos de videojuegos que también tienen una frecuencia significativa en el conjunto de datos.
</br></br>
<p align="center">
  <img src="src\nube_app_name.png" height="320" weight="550" >
</p>

La nube de palabras muestra los nombres de las aplicaciones más comunes en nuestro conjunto de datos. El tamaño de cada palabra en la nube indica su frecuencia de aparición en la columna 'app_name'. Esta visualización nos ofrece una representación visual rápida y fácil de entender de las aplicaciones más populares en nuestro conjunto de datos, esto puede ser útil para identificar las tendencias respecto a los nombres de los videojuegos. 

## **3. Etapa de Desarrollo API** :

Se utilizó el framework FastAPI para la implementación de la API, y se crearon las siguientes funciones:

* **userdata**: Esta función recibe el 'user_id' y retorna la cantidad de dinero gastado por el usuario, el porcentaje de recomendación en base a la columna recommend y la cantidad de items asociadas al usuario.

* **countreviews**: Esta función recibe un rango de fechas para consultar la cantidad de usuarios que realizaron reviews en ese periodo, y el porcentaje de las recomendaciones en base a la columna recommend.

* **genre**: Esta función recibe el género del videojuego y devuelve el puesto del género de acuerdo al ranking que está basado en la cantidad de horas jugadas (columna PlayTimeForever).

* **userforgenre**: Esta función recibe el género de un videojuego y devuelve el top 5 de usuarios con más horas de juego en el género, mostrando el id de usuario y su url.

* **developer**: Esta función recibe el nombre de la empresa desarrolladora de videojuego y devuelve la cantidad de items así como el porcentaje de contenido Free por año respecto al total que desarrolla la empresa en consulta.

* **sentiment_analysis**: Esta función recibe el año de lanzamiento del videojuego y devuelve una lista con la cantidad de registros de reseñas de usuarios que se encuentren categorizados con un análisis de sentimiento, estas categorias son: Negativo, Neutral y Positivo.


**Modelo de Aprendizaje Atomático**:

Una vez que toda la data es consumible por la API, está lista para consumir por los departamentos de Analytics y Machine Learning, y nuestro EDA nos permite comprender los datos que tenemos, es tiempo de entrenar nuestro modelo de Machine Learning para crear un modelo de predicción. Para ello, existen dos propuestas de trabajo: En la primera, el modelo deberá tener una relación ítem-ítem, esto es se toma un item, en base a que tan similar es ese ítem al resto, y se recomiendan videojuegos similares para lo cual se deberá de ingresar el id del videjuego y se tendrá como resultado una lista de 5 juegos recomendados, se recomienda aplicar la similitud del coseno; la segunda propuesta aplica el filtro user-item, esto es tomar un usuario, se encuentran usuarios similares y se recomiendan ítems que a esos usuarios similares les gustaron para realizar esta propuesta se deberá de ingresar el id de usuario y la salida será una lista de 5 videojuegos que se le recomiendan a ese usuario.


* **recommendGame**: Esta función recibe el id del videojuego como parámetro y devuelve una lista de recomendación de 5 videojuegos similares al ingresado.

* **recommendUser**: Esta función recibe el id de usuario como parámetro y devuelve una lista con 5 videojuegos recomendados para dicho usuario.


**Desarrollo de los Modelos de predicción:**

Eln el primer modelo que tiene como input el id de videjuego y generar una lista de videojuegos se aplicó la Similitud del Coseno y Lineal Kernel obteniendo en esta última un menor tiempo de respuesta, es necesario indicar tras la comparación que ambas dieron los mismos resultados. El segundo modelo tiene como input el id de usuario y devuelve una lista de videojuegos, este método se basa únicamente en las interacciones pasadas que se han registrado entre usuarios y los videojuegos, para así generar nuevas recomendaciones.


**Este repositorio incluye:**

+ Un proceso ETL paso a paso<br/>
+ Un análisis exploratorio de datos (EDA)<br/>
+ Desarrollo de una API con el Framework FastApi<br/>
+ Implementación del Modelo de Machine Learning<br/>
+ Notebooks para la visualización de los procesos<br/>


## Detalles adicionales del proyecto

Aquí se muestra información adicional y recursos relacionados con el proyecto:

1. `Video explicativo:` Se ha creado un [video explicativo](https://drive.google.com/drive/folders/10zsRP-ydH-mOPX7VTS2Mqht0UxviPNiN?usp=sharing)  donde te muestro algunas funciones de mi proyecto con el uso de la API.

2. `Acceso a la API:` En el siguiente [enlace de la API](https://pi01-data-ft14-jcr.onrender.com/docs) podras encontrar las funciones de este proyecto.

3. `Obtención de datos:` Los datos utilizados para este proyecto de análisis, estan en el siguiente [enlace de descarga](https://drive.google.com/drive/folders/1HqBG2-sUkz_R3h1dZU5F2uAzpRn7BSpj) 
