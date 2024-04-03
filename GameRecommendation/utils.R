function_valores_nulos <- function() {

  # Función para identificar valores faltantes 

  check_column <- function(col) {
    sum(is.na(col)  | trimws(as.character(col)) == "")
  }

  # Se aplica la función a todas las columnas del dataframe
  results <- lapply(df, check_column)

  longitud_nombre <- max(nchar(names(df)))

  # Resultados
  for (i in seq_along(results)) {
    nombre_columna <- str_pad(names(df)[i], width = longitud_nombre)
    cat(nombre_columna, ": ", results[[i]], "\n")
  }
  
}

graficar_histograma <- function(variables_numericas) {

  "
  Esta función crea histogramas para cada variable numérica en una lista dada, organizándolos en una matriz de 3 filas y 2 columnas. 
  Señala la densidad para visualizar la distribución de los datos, y la media para resaltar la ubicación central de la distribución.

  *La densidad ayuda a mostrar en dónde estan ubicados los valores que se concentran en el intervalo, además son mejores 
  que los histogramas para entender la forma de una distribución porque no dependen del número de barras usadas 
  "

	options(repr.plot.width=15, repr.plot.height=15)

	# Definición de colores personalizados
	hist_color <- "#4285F4"  # Color principal
	line_color <- "#EA4335"  # Color de líneas adicionales
	
	# Organización de los histogramas en una matriz de 3 filas y 2 columnas
	par(mfrow = c(3, 2))

	# Creación de histogramas para cada variable
	for (variable in variables_numericas) {

		hist(df[[variable]],
			 main = paste("Histograma de", variable),
			 xlab = variable,
			 col = hist_color,
			 border = "black",
			 cex.lab = 1.8,
			 cex.axis = 1.7,
			 cex.main = 1.7,
			 probability = TRUE  # Establecer para mostrar densidad
		)

		# Se añade línea de densidad
		lines(density(df[[variable]], adjust = 2), col = line_color, lwd = 2)

		# Se añade línea de media
		abline(v = median(df[[variable]]), col = line_color, lwd = 2, lty = 2)

		legend("top", legend = c("Densidad", "Mediana"), xpd = TRUE, inset = c(-0.4, 0),
		   col = c(line_color, line_color), lwd = c(2, 2), lty = c(1, 2), cex = 1.5,
		   box.lwd = 0.5,  y.intersp = 0.2, x.intersp = 0.4, yjust = 0, xjust = 0, bty = "n")
	}
	# Restaurar la configuración original de la disposición de los gráficos
	par(mfrow = c(1, 1))
}


hallar_outliers <- function(variable) {

  # Cálculo de los límites del rango intercuartílico (IQR)
  Q1 <- quantile(variable, 0.25)
  Q3 <- quantile(variable, 0.75)
  IQR_value <- Q3 - Q1

  # Cálculo de los límites para identificar outliers
  limite_inferior <- Q1 - 1.5 * IQR_value
  limite_superior <- Q3 + 1.5 * IQR_value

  # Identificación de outliers representan los valores atípicos
  outliers <- (variable < limite_inferior | variable > limite_superior)

  cat("Cantidad de Outliers:",sum(outliers),"\n")
  cat("Cantidad de Outliers por encima del límite superior: ",sum(variable > limite_superior),"\n")
  cat("Cantidad de Outliers por debajo del límite inferior: ",sum(variable < limite_inferior),"\n\n")
}


graficar_boxplot <- function(variable) {

  options(repr.plot.width=9, repr.plot.height=8)

  # Cálculo de cuartiles
  q1 <- quantile(variable, 0.25)
  q2 <- median(variable)
  q3 <- quantile(variable, 0.75)

  ancho_caja <- 3.5

  # Se crea un data frame para las etiquetas
  label_df <- data.frame(
    x = ancho_caja -1.,
    y = c(q1 + 2.5, q2 + 2.5, q3 + 2.5),
    label = c(paste("Q1:", round(q1, 2)),
              paste("Q2:", round(q2, 2)),
              paste("Q3:", round(q3, 2)))
  )
 
  # Gráfico de Boxplot con los cuartiles y etiquetas
  ggplot(df, aes(y = variable)) +
  geom_boxplot(fill = "skyblue", color = "black", width = ancho_caja, coef = 1.5 ) +
  geom_hline(yintercept = c(q1, q2, q3), color = "black", linetype = "dashed") +
  geom_text(data = label_df, aes(x = x, y = y, label = label), size = 5) +

  labs(title = "Boxplot de Positive Ratio", y = "Positive Ratio") +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 18),
    axis.text.y = element_text(size = 14),
    axis.title.y = element_text(size = 14),
    axis.text.x = element_blank(),
    axis.title.x = element_blank()
  )
}


graficar_factor <- function(vfactor, variable) {

options(repr.plot.width=9, repr.plot.height=8)

# Se crea un gráfico de barras para la distribución de juegos por categoría de precio
colores <- c("#4e79a7", "#f28e2b", "#e15759", "#76b7b2", "#59a14f","#516a1a")

ggplot(df, aes(x = vfactor , fill = vfactor)) +
  geom_bar(color = "white") +
  geom_text(stat = "count", aes(label = after_stat(count)), vjust = -0.5, size = 4) +
  labs(title = paste("Diagrama de Barras de", variable),
       x = variable,
       y = "Frecuencia",
       fill = variable) +
  scale_fill_manual(values = colores) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, size = 18),# Tamaño y posición del título en el centro 
        axis.text.x = element_text(size = 14),  # Tamaño del texto en el eje x
        axis.text.y = element_text(size = 14),  # Tamaño del texto en el eje y
        axis.title.x = element_text(size = 14), # Tamaño de la etiqueta del eje x
        axis.title.y = element_text(size = 14), # Tamaño de la etiqueta del eje y
        legend.title = element_text(size = 14), # Tamaño del título de la leyenda
        legend.text = element_text(size = 14))  # Tamaño del texto  de la leyenda
}


graficar_factor_intervalos <- function(intervalos, variable) {

  options(repr.plot.width=10, repr.plot.height=8)

  # Definición de colores
  colores <- c("#4e79a7", "#f28e2b", "#e15759", "#76b7b2", "#59a14f","#516a1a")

  # Se crea un dataframe con los datos
  df_ratio_grupos <- as.data.frame(table(intervalos))

  # Renombrado de las columnas
  names(df_ratio_grupos) <- c("Intervalos", "Frecuencia")

  # Se crea el gráfico de barras
  ggplot(df_ratio_grupos, aes(x = Intervalos, y = Frecuencia, fill = Intervalos)) +
    geom_bar(stat = "identity") +
	geom_text(aes(label = Frecuencia), vjust = -0.5, size = 4, stat = "identity") +
    labs(title = paste("Diagrama de Barras de", variable),
         x = variable,
         y = "Frecuencia") +
    scale_fill_manual(values = colores) +
    theme_minimal() +
    theme(plot.title = element_text(hjust = 0.5, size = 18),# Tamaño y posición del título en el centro 
          axis.text.x = element_text(size = 14),  # Tamaño del texto en el eje x
          axis.text.y = element_text(size = 14),  # Tamaño del texto en el eje y
          axis.title.x = element_text(size = 14), # Tamaño de la etiqueta del eje x
          axis.title.y = element_text(size = 14), # Tamaño de la etiqueta del eje y
          legend.title = element_text(size = 14), # Tamaño del título de la leyenda
          legend.text = element_text(size = 14)   # Tamaño del texto  de la leyenda
    )
}

lista_plataformas <- function() {
  lista <- list(win = table(df$win), mac = table(df$mac), linux = table(df$linux))
  return(lista)
}

graficar_barras_plataformas <- function() {

 options(repr.plot.width=14, repr.plot.height=13)

 lista <- lista_plataformas()
 df2 <- data.frame()

  # Se itera sobre la lista y se agregan filas al data frame
  for (plataforma in names(lista)) {
    for (valor in names(lista[[plataforma]])) {
      frecuencia <- lista[[plataforma]][[valor]]
      nueva_fila <- data.frame(plataforma = factor(plataforma), valor = factor(valor), frecuencia = frecuencia)
      df2 <- rbind(df2, nueva_fila)
    }
  }

  plataformas <- unique(df2$plataforma)

 
  # Creación de una lista para almacenar los gráficos
  plots <- list()

  # Se crea un bucle para generar un gráfico de barras por cada plataforma
  for (elemento in plataformas) {
  
    # Filtrar el data frame por la plataforma actual
    df_plataforma <- subset(df2, plataforma == elemento)
    
    # Creación del gráfico de barras
    p <- ggplot(data = df_plataforma, aes(x = valor, y = frecuencia, fill = valor)) +
      geom_bar(stat = "identity") +
      geom_text(aes(label = frecuencia), vjust = -0.5, size = 4.5) + # Agregar etiquetas de frecuencia
      labs(x = "Valor", y = "Frecuencia", fill = "Valor") +
      ggtitle(paste("Plataforma", toTitleCase(elemento))) +
      theme_minimal() +
      theme(plot.title = element_text(hjust = 0.5, size = 18), # Tamaño y posición del título en el centro 
        axis.text.x = element_text(size = 14),  # Tamaño del texto en el eje x
        axis.text.y = element_text(size = 14),  # Tamaño del texto en el eje y
        axis.title.x = element_text(size = 14), # Tamaño de la etiqueta del eje x
        axis.title.y = element_text(size = 14), # Tamaño de la etiqueta del eje y
        legend.title = element_text(size = 12), # Tamaño del título de la leyenda
        legend.text = element_text(size = 12))  # Tamaño del texto  de la leyenda
   
    # Se agrega el gráfico a la lista
    plots[[length(plots) + 1]] <- p
  }
  
  # Se organiza los gráficos en 2 filas y 2 columnas
  grid.arrange(grobs = plots, ncol = 2, nrow = 2)

}

graficar_pie_compatibilidad <- function() {

	lista <- lista_plataformas()
  
    # Cálculo del total de compatibilidad de videojuegos en las 3 Plataformas
	total <- lista[["win"]]["TRUE"] + lista[["mac"]]["TRUE"] + lista[["linux"]]["TRUE"]

	# Cálculo del porcentaje de compatibilidad de videojuegos para cada Plataforma
	porc_win <-  round((lista[["win"]]["TRUE"]/total)*100,2)
	porc_mac <-  round((lista[["mac"]]["TRUE"]/total)*100,2)
	porc_linux <-round((lista[["linux"]]["TRUE"]/total)*100,2)

	# Se crea el vector de porcentajes y nombres de las variables
	porcentajes <- c(porc_win, porc_mac, porc_linux)
	nombres <- c("Windows", "MacOS", "Linux")

	# Definición de colores para cada sección del gráfico
	colores <- c("#F8766D", "#00BA38", "#619CFF")
	
	options(repr.plot.width=8, repr.plot.height=6)
	pie(porcentajes, labels = paste(nombres, "(", porcentajes, "%)"), col = colores, main = "Porcentajes de Compatibilidad", cex.main = 1.5, cex = 1.2)
}

cosine_sim <- function(x, y) {

# Esta función calcula la similitud del coseno entre dos vectores x e y. 

  dot_product <- sum(x * y)
  magnitude_x <- sqrt(sum(x^2))
  magnitude_y <- sqrt(sum(y^2))

  if (magnitude_x == 0 || magnitude_y == 0) {
    return(0) # Evitar división por cero
  } else {
    return(dot_product / (magnitude_x * magnitude_y))
  }
}

recommend <- function(app_code,
                         mat = wide,
                         apps = app_data,
                         return_n = 5) {
						 
"
Esta función recibe el id del videojuego 'app_code' y calcula la similitud del coseno entre esa 
aplicación y todas las demás aplicaciones en una matriz finalmente se devuelve los 5 videojuegos
más similares junto con su título y la similitud del coseno.
"				

  # Se encuentra la columna correspondiente al videojuego
  app_col_index <- which(colnames(mat) == app_code)
  
  # apply(..., 2) permite iterar sobre las columnas de la matriz
  # Se define la función anónima para calcular la similitud del coseno
  # Se calcula la similitud del coseno para cada videojuego basado en el número de horas jugadas por los usuarios
 
  # Se calcula la similitud del coseno entre el vector de la app de interés (representada por mat[, app_col_index]) y 
  # el vector representado por y , que es la columna actual de mat (el proceso se repite para cada columna de mat)
  cos_sims <- apply(mat, 2,
                    FUN = function(y)
                      cosine_sim(mat[,app_col_index], y))
					  
  # Se crea un tibble con las similitudes del coseno y los IDs de los videojuegos

  result <- tibble(app_id = names(cos_sims), cos_sim = cos_sims) %>%
    filter(app_id != app_code)	# Eliminar la referencia propia
	
  result <- result %>%
	mutate(app_id = as.integer(app_id))
	
  result <- result %>%
    inner_join(apps, by = "app_id") %>%
    arrange(desc(cos_sim)) %>%	# Se ordena en orden descendente por similitud del coseno
    top_n(5, cos_sim) %>%		# Selección sw las 5 principales recomendaciones
    head(5) %>%					# Tomar solo las primeras 5 filas
	select(app_id, title) 

  return(result)
}

recommendGame <- function(app_code) {

	# Esta función prepara los datos y se realiza un proceso de limpieza y unión de datos, calcula las horas jugadas por videojuego para cada usuario, 
	# selecciona los 5 juegos más populares, convierte los datos para el cálculo de similitudes y finalmente devuelve las mejores recomendaciones de videojuegos
	
	# Selección de columnas relevantes de games y recommendations 
	games <- subset(df, select = c(app_id, title))
	recommendations  <- subset(df_recs, select = c(app_id,hours,user_id,review_id))

	# Unión de datos
	data <- left_join(games, recommendations, by = "app_id")
	data<- data[rowSums(is.na(data) | data == "" | trimws(data) == "") == 0, ]	# Elimina filas con valores NA o en blanco

	data <- data[!duplicated(data), ]	# Eliminar filas duplicadas
	data <- data[, -ncol(data)]			# Eliminar la última columna

	# Cálculo de las horas totales jugadas por usuario para cada videojuego
	all_data <- data %>%
	  group_by(user_id, title, app_id) %>%
	  summarise(hours = sum(hours,  na.rm = TRUE) , .groups = 'drop') %>%
	  ungroup()

	# Selección de los 50 juegos más populares basados en el total de horas jugadas
	top_apps <- all_data %>%
		group_by(app_id) %>%
		summarise(sum_hours = sum(hours), .groups = 'drop') %>%
		ungroup() %>%
		top_n(50, sum_hours) %>%
		distinct(app_id)
	
	all_data_top <- all_data %>%
	   inner_join(top_apps, by = "app_id")
	
	# Transformación del formato a ancho para el cálculo de similitudes
	wide <- all_data_top %>%
		ungroup() %>%
		distinct(user_id, app_id, hours) %>%
		spread(app_id, hours, fill = 0)
	  
	# Se convierte a matriz y se elimina la primera columna
	wide <- as.matrix(wide[,-1])

	app_data <- subset(df, select = c(app_id,title))
	
	recommend(app_code,mat = wide, apps = app_data, return_n = 5)
}

data_numerica <- function(){

	df_games <- df[, sapply(df, is.numeric)]
	df_recs <- df_recs[!duplicated(df_recs), ]	# Eliminar filas duplicadas
	
	df_recs  <- subset(df_recs, select = c(app_id,hours))

	# Cálculo de las horas totales jugadas para cada videojuego
	data_acum <- df_recs %>%
	  group_by(app_id) %>%
	  summarise(total_hours = sum(hours,  na.rm = TRUE) , .groups = 'drop') 
	  
	all_data <- df_games %>%
		left_join(data_acum, by = "app_id") %>%
		mutate(total_hours = coalesce(total_hours, 0))#%>%
		
	all_data <- all_data[, -which(names(all_data) == "app_id")]
	
	return(all_data)
}

