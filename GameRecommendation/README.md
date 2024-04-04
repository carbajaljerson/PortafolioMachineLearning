![GitHub repo size](https://img.shields.io/github/repo-size/scottydocs/README-template.md)
![GitHub contributors](https://img.shields.io/github/contributors/scottydocs/README-template.md)
![GitHub stars](https://img.shields.io/github/stars/scottydocs/README-template.md?style=social)

## Introducción

En este proyecto, se llevó a cabo un análisis exploratorio de datos (EDA) utilizando un conjunto de datos de videojuegos, y reseñas de la plataforma Steam, se incluyó la transformación de variables, el cálculo de estadísticas descriptivas, la elaboración de tablas de frecuencia y gráficos apropiados (histogramas, diagramas de cajas, diagrama de sectores, diagramas de barras, nube de palabras, etc.). Además, se desarrolló un modelo de recomendación basado en la similitud del coseno para recomendar videojuegos a los usuarios, así como un modelo de series de tiempo para predecir el precio final de los videojuegos.

## Datos
Este proyecto cuenta con 2 archivos:

* **games.csv**  es un dataset que contiene datos de los videojuegos sobre calificaciones, precios, plataformas, descuentos, ratings, valoraciones, fecha de lanzamiento

* **recommendations.csv** es un dataset que representa una relación de muchos a muchos entre una entidad de juego y una entidad de usuario contiene datos como la cantidad de horas jugadas por los usuarios, etc.

## **DESARROLLO DEL PROYECTO ** :

## Análisis Exploratorio de Datos (EDA)**

Una vez que se realizó la etapa de ETL y con los datos limpios, es tiempo de revisar las relaciones que existen entre las variables de los datasets, encontrar si hay presencia de outliers o anomalías (que no tienen que ser errores necesariamente), y verificar si hay algún patrón que sirva en un análisis posterior.


**Modelo de Aprendizaje Atomático**:

Una vez que se concluyó con la etapa del EDA, que permite comprender los datos que tenemos, es tiempo de desarrollar nuestro modelo de Machine Learning para crear un modelo de predicción, para ello se elaboro un modelo que tiene una relación ítem-ítem, donde se toma un item y se busca la similitud de ese ítem con el resto, y se obtiene como salida los videojuegos similares es así que en la función desarrollada se deberá de ingresar el id del videjuego y se tendrá como resultado una lista de 5 juegos recomendados en base a la aplicación de la similitud del coseno.


**Predicción de Precios de Videojuegos**

Se construyó un modelo de series de tiempo para predecir el precio final de los videojuegos. El modelo toma en cuenta los precios históricos y las fechas de lanzamiento para hacer predicciones sobre los precios futuros para los siguientes 3 años.

**Este repositorio incluye:**

+ Un análisis exploratorio de datos (EDA)<br>
+ Modelo de Recomendacion<br>
+ Modelo de Series de Tiempo<br>

## Detalles adicionales del proyecto

Aquí se adjuntan recursos relacionados con el proyecto:

`Obtención de datos:` Los datos utilizados para este proyecto de análisis, estan en el siguiente [enlace de descarga](https://drive.google.com/drive/folders/10whQV6p9HlzL5iz3y23FFX8um5raGSg_?usp=sharing) 

![RStudio](https://img.shields.io/badge/RStudio-75AADB?style=for-the-badge&logo=RStudio&logoColor=white)
![Jupyter Notebook](https://img.shields.io/badge/jupyter-%23FA0F00.svg?style=for-the-badge&logo=jupyter&logoColor=white)
![R](https://img.shields.io/badge/R-276DC3?style=for-the-badge&logo=r&logoColor=white)
![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)