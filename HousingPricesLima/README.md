

![GitHub repo size](https://img.shields.io/github/repo-size/scottydocs/README-template.md)
![GitHub contributors](https://img.shields.io/github/contributors/scottydocs/README-template.md)
[![HitCount](https://hits.dwyl.com/dwyl/hits.svg)](https://github.com/carbajaljerson/PI02_SiniestrosViales_CABA/)
![GitHub stars](https://img.shields.io/github/stars/scottydocs/README-template.md?style=social)


# <h1 align="center">**`Precios de Viviendas en Lima`**</h1>

Bienvenidos a continuación se presenta el desarrollo del Proyecto Machine Learning 

## Introducción

El presente proyecto tiene como finalidad la elaboración de una aplicación que permita predecir el precio de las casas según ciertas características, este requerimiento es solicitado por la constructora ABC, que requiere estimar los precios para los compradores potenciales estableciendo precios competitivos en el mercado.

## Contexto Comercial:

El mercado de la construcción de viviendas en Lima, carece de un método eficiente para estimar y predecir los precios de las casas. Esta falta de información precisa, dificulta la toma de decisiones estratégicas para la empresa constructura ABC la cual requiere del conocimiento del mercado para establecer precios competitivos y garantizar un retorno de inversión.


## Definición de Ojetivos y requisitos del proyecto:

- Desarrollar una aplicación de Machine Learning, que utilice modelos predictivos para estimar los precios de las viviendas en función de diversas variables.
- Estimar Costos de Viviendas de manera precisa, proporcionando a la empresa una herramienta precisa y confiable para estimar los costos de viviendas, considerando factores como la ubicación, el tamaño, las comodidades y otros atributos relevantes.

## 📊 Alcance del Proyecto

El siguiente proyecto contiene los siguientes desarrollos:

- Extracción Transformación y Carga de la data
- Análisis Exploratorio de Datos
- Creación del Modelo Predictivo
- Despliegue de la aplicación

## Datos

Este proyecto se desarrolló en base al dataset denominado data.csv, que se encuentra en formato de Excel:


Los datos utilizados para este proyecto de análisis, estan en el siguiente [enlace de descarga](https://drive.google.com/drive/folders/155gdhdu0Jbts6t6P1BC5PRrdRLdDe5ZD?usp=sharing) 


## **DESARROLLO DEL PROYECTO ** 

## **1. Etapa del proceso ETL** :

- Carga del archivo con extensión .csv con la libreria pandas.
- Luego se realizó el trabajo ETL(Extracción, Transformación y Carga).
- Se realizaron diversas transformaciones cumpliéndose con la estandarización de los datos se analizaron nulos y duplicados, se eliminaron columnas redundantes, entre otras tareas como la normalizción de la Data.

**Descripción de columnas**
- Antiguedad: La edad del inmueble o el tiempo transcurrido desde su construcción.
- Anunciante: La entidad o individuo que publica el anuncio del inmueble.
- Balneario: Indica si el inmueble está ubicado en un balneario o cerca de uno.
- NroBanios: Número de baños en el inmueble.
- Nro_pisos: Número de pisos que tiene el inmueble.
- Cocheras: Número de espacios de Cocheras disponibles.

<details>
<summary>Ver descripción de las demás columnas</summary>

- Descripcion: Descripción detallada del inmueble.
- Direccion: Dirección física del inmueble.
- Dormitorios: Número de dormitorios en el inmueble.
- Estado de Inmueble: Condición actual del inmueble (aremodelar, bueno, excelente, regular y remodelado).
- Fecha_pub: Fecha en la que se publicó el anuncio.
- Luminosidad: Describe el grado de luz natural en el inmueble (luminoso, muy luminoso, poca luminosidad).
- Mascotas: Indica si se permiten mascotas en el inmueble.
- Precio: El precio de venta del inmueble.
- Tipo: El tipo de inmueble (por ejemplo, casa, departamento, etc.).
- TipoCochera: Especifica el tipo de cochera disponible (por ejemplo, cerrada, abierta, etc.).
- Ubicacion: Ubicación geográfica del inmueble (provincia y distrito).
- Uso_comercial: Indica si el inmueble puede utilizarse para fines comerciales.
- Uso_profesional: Indica si el inmueble es apto para uso profesional.
- latitud: Coordenada geográfica que especifica la latitud del inmueble.
- longitud: Coordenada geográfica que especifica la longitud del inmueble.
- Area_constr: Área construida del inmueble.
- Area_total: Área total del terreno en el que se encuentra el inmueble.
- Area_constr_m2: Área construida del inmueble expresada en metros cuadrados.
- Area_total_m2: Área total del terreno en metros cuadrados.
- Cuarto de servicio: Indica si el inmueble cuenta con un cuarto de servicio.
- Deposito: Indica si el inmueble incluye un espacio de depósito o almacenamiento.
- Terraza: Indica si el inmueble cuenta con una terraza.
- Kitchenette: Se refiere a una cocina pequeña y compacta, usualmente en un solo bloque.
- Sala de estar: Presencia de una sala de estar en el inmueble.
- Sotano: Indica si el inmueble tiene sótano.
- Patio: Presencia de un patio en el inmueble.
- Comedor diario: Indica si el inmueble tiene designado un ambiente para comidas diarias, aparte del comedor principal.
- Comedor: Presencia de un comedor en el inmueble.
- Banio de servicio: Indica si hay un baño destinado al personal de servicio.
- Jardanxadn Interno: Presencia de un jardín interno en el inmueble.
- Walking Closet: Indica si hay un armario grande que se puede recorrer.
- Escritorio: Indica si el inmueble cuenta con un escritorio en el espacio de oficina o estudio.
- Cocina: Presencia de una cocina en el inmueble.
- Banio independiente: Indica si el inmueble cuenta un baño que no está integrado a una habitación.
- Lavanderanxada: Indica si el inmueble cuenta con un espacio designado para lavandería.
- Balcon: Indica si el inmueble cuenta con un balcón.
- Sala: Presencia de una sala principal en el inmueble.
- Closet: Indica la presencia de closets o armarios para almacenamiento.
- Banio de visitas: Indica la presencia de un baño adicional destinado a visitas.
- Agua: Disponibilidad o características relacionadas con el suministro de agua.
- Guardiananxada: Servicio de vigilancia o seguridad, aunque el nombre parece estar codificado incorrectamente.
- Internet: Disponibilidad o características del servicio de internet en el inmueble.
- Luz: Disponibilidad del servicio eléctrico.
- Cable: Disponibilidad de servicios de televisión por cable.
- Servicio de Limpieza: Indica si hay servicios de limpieza disponibles.
- Conexion a gas: Presencia de instalaciones de gas natural o propano.
- Sistema de seguridad: Disponibilidad de sistemas de seguridad en el inmueble.
- Telefono: Disponibilidad del servicio telefónico.
- Areadeportiva: Presencia de áreas deportiva.
- Piscina: Indica si el inmueble cuenta con piscina.
- Solarium: Indica si el inmueble cuenta con un área designada como solarium.
- Sala de internet: Presencia de una sala dedicada a internet o un área de trabajo con conexión a internet.
- Sala de cine: Indica si hay una sala de cine o un área destinada para ver películas.
- Jardanxadn: Presencia de jardín.
- Parque interno: Indica si hay un parque o área verde dentro del complejo o propiedad.
- Guarderanxada: Servicio de guardería disponible, aunque el nombre parece estar codificado incorrectamente.
- anx81reas verdes: Presencia de áreas verdes en o cerca del inmueble, aunque el nombre parece estar codificado incorrectamente.
- Club House: Disponibilidad de un club house o área comunitaria.
- Hall de ingreso: Disponibilidad de área de recepción del inmueble.
- Areade BBQ: Presencia de un área designada para barbacoa o parrillada.
- Gimnasio: Indica si el inmueble cuenta con un gimnasio.
- Areade sauna: Presencia de una sauna en el inmueble.
- Juegos para ninios: Presencia de instalaciones destinadas para juegos infantiles.
- Ingreso independiente: Si el inmueble tiene una entrada independiente.
- Colegios cercanos: Si existe proximidad a colegios o escuelas.
- Cerca al mar: Indica si el inmueble está cerca del mar.
- Centros comerciales cercanos: Indica la proximidad a centros comerciales.
- Parques cercanos: Indica la cercanía a parques o áreas verdes.
- Acceso personas discapacidad: Indica la presencia de facilidades para personas con discapacidad.
- Frente al mar: Si el inmueble está ubicado frente al mar.
- Desagaue: Disponibilidad del sistema de desagüe.
- Jacuzzi: Presencia de jacuzzi en el inmueble.
- Chimenea: Si el inmueble cuenta con chimenea.
- Intercomunicador: Indica la disponibilidad de intercomunicador.
- Cerco Electrico: Presencia de un cerco eléctrico para seguridad.
- Parrilla: Disponibilidad de una parrilla o espacio para asados.
- Aire acondicionado: Disponibilidad de Sistema de aire acondicionado disponible.
- Amoblado: Indica si el inmueble se ofrece amoblado.
- Sauna: Presencia de una sauna.
- Calefaccion: Sistema de calefacción disponible.
- Equipado: Si el inmueble está equipado con electrodomésticos o muebles.
- Terma: Disponibilidad de terma o calentador de agua.
- Portero electrico: Sistema de portero eléctrico o control de acceso.
- Cocina con reposteros: Cocina equipada con armarios o almacenamiento.
- Distrito: El distrito en el que se encuentra el inmueble.
- Provincia: La provincia donde está ubicado el inmueble.


</details>

## **2. Análisis Exploratorio de los Datos (EDA)**

Una vez que los datos están limpios, es tiempo de revisar las relaciones que existen entre las variables del dataset, encontrar si hay presencia de outliers o anomalías (que no tienen que ser errores necesariamente), y se verifica si hay algún patrón o conocimiento que sirva en un análisis posterior que sería el modelo. 

<p align=center>
<img src="src\image01.png" height="400" weight="550">
<p>
<p align=center>
<img src="src\image02.png" height="200" weight="500">
<p>
<p align=center>
<img src="src\image03.png" height="400" weight="550">
<p>
<p align=center>
<img src="src\image04.png" height="330" weight="550">
<p>
<p align=center>
<img src="src\image05.png" height="350" weight="550">
<p>


## **3. Modelo Predictivo**

## **4. Despliegue de la Aplicación**

El despliegue de la Aplicacion se realizo a través de Streamlit 

## **5. Conclusiones**

Mis principales conclusiones son las siguientes:
 
✅ Se obtuvo un error alrededor del 30% 

## **6. Recomendaciones**

 
✅ Se considera importante en la mejora del modelo poder realizar un web Scraping de paginas donde se publican las ventas de inmuebles en Lima.

## 🛠 Tecnologías Utilizadas

![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)
![Jupyter Notebook](https://img.shields.io/badge/jupyter-%23FA0F00.svg?style=for-the-badge&logo=jupyter&logoColor=white)
![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)
![NumPy](https://img.shields.io/badge/numpy-%23013243.svg?style=for-the-badge&logo=numpy&logoColor=white)
![Pandas](https://img.shields.io/badge/pandas-%23150458.svg?style=for-the-badge&logo=pandas&logoColor=white)
![Matplotlib](https://img.shields.io/badge/Matplotlib-%23ffffff.svg?style=for-the-badge&logo=Matplotlib&logoColor=black)
![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)
