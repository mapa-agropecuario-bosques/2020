#
# RASTERIZACIÓN DE CAPAS VECTORIALES
#

# NOTA:
# Este programa requiere de una cantidad considerable de RAM. Antes de 
# ejecutarlo, se recomienda
# - Cerrar programas que no se estén utilizando (ej. QGIS).
# - Reiniciar el contenedor Docker.


# Paquetes
library(here)
library(dplyr)
library(sf)
library(terra)


# Directorio de capas vectoriales
DIRECTORIO_CAPAS_VECTORIALES_ORIGINALES <- 
  here("datos", "originales", "vectoriales")

# Directorio de capas rasterizadas
DIRECTORIO_CAPAS_RASTERIZADAS <- 
  here("datos", "procesados", "rasterizados")

# Archivo vectorial de Costa Rica
ARCHIVO_VECTORIAL_COSTARICA <- 
  here(DIRECTORIO_CAPAS_VECTORIALES_ORIGINALES, "costarica.gpkg")

# Archivo vectorial de áreas silvestres protegidas (ASP)
ARCHIVO_VECTORIAL_ASP <- 
  here(DIRECTORIO_CAPAS_VECTORIALES_ORIGINALES, "areas-silvestres-protegidas.gpkg")
# Archivo raster de áreas silvestres protegidas (ASP)
ARCHIVO_RASTER_ASP <- 
  here(DIRECTORIO_CAPAS_RASTERIZADAS, "areas-silvestres-protegidas.tif")

# Archivo vectorial de patrimonio natural del estado (PNE)
ARCHIVO_VECTORIAL_PNE <- 
  here(DIRECTORIO_CAPAS_VECTORIALES_ORIGINALES, "patrimonio-natural-estado.gpkg")
# Archivo raster de patrimonio natural del estado (PNE)
ARCHIVO_RASTER_PNE <- 
  here(DIRECTORIO_CAPAS_RASTERIZADAS, "patrimonio-natural-estado.tif")

# Archivo vectorial de registro nacional de humedales (RNH)
ARCHIVO_VECTORIAL_RNH <- 
  here(DIRECTORIO_CAPAS_VECTORIALES_ORIGINALES, "registro-nacional-humedales.gpkg")
# Archivo raster de registro nacional de humedales (RNH)
ARCHIVO_RASTER_RNH <- 
  here(DIRECTORIO_CAPAS_RASTERIZADAS, "registro-nacional-humedales.tif")

# Archivo vectorial de cultivos
ARCHIVO_VECTORIAL_CULTIVOS <- 
  here(DIRECTORIO_CAPAS_VECTORIALES_ORIGINALES, "cultivos-2017.gpkg")
# Archivo raster de cultivos
ARCHIVO_RASTER_CULTIVOS <- 
  here(DIRECTORIO_CAPAS_RASTERIZADAS, "cultivos-2017.tif")

# Archivo vectorial de cultivo de piña
ARCHIVO_VECTORIAL_PINA <- 
  here(DIRECTORIO_CAPAS_VECTORIALES_ORIGINALES, "cultivo-pina-2019.gpkg")
# Archivo raster de cultivo de piña
ARCHIVO_RASTER_PINA <- 
  here(DIRECTORIO_CAPAS_RASTERIZADAS, "cultivo-pina-2019.tif")

# Archivo vectorial de cultivo de palma
ARCHIVO_VECTORIAL_PALMA <- 
  here(DIRECTORIO_CAPAS_VECTORIALES_ORIGINALES, "cultivo-palma-2019.gpkg")
# Archivo raster de cultivo de palma
ARCHIVO_RASTER_PALMA <- 
  here(DIRECTORIO_CAPAS_RASTERIZADAS, "cultivo-palma-2019.tif")

# Archivo vectorial de pastos 2019
ARCHIVO_VECTORIAL_PASTOS_2019 <- 
  here(DIRECTORIO_CAPAS_VECTORIALES_ORIGINALES, "cultivo-pastos-2019.gpkg")
# Archivo vectorial de pastos 2020
ARCHIVO_VECTORIAL_PASTOS_2020 <- 
  here(DIRECTORIO_CAPAS_VECTORIALES_ORIGINALES, "cultivo-pastos-2020.gpkg")
# Archivo raster de pastos
ARCHIVO_RASTER_PASTOS <- 
  here(DIRECTORIO_CAPAS_RASTERIZADAS, "cultivo-pastos-2019-2020.tif")

# Archivo vectorial de café 2017-2018
ARCHIVO_VECTORIAL_CAFE <- 
  here(DIRECTORIO_CAPAS_VECTORIALES_ORIGINALES, "cultivo-cafe-2017-2018.gpkg")
# Archivo raster de café 2017-2018
ARCHIVO_RASTER_CAFE <- 
  here(DIRECTORIO_CAPAS_RASTERIZADAS, "cultivo-cafe-2017-2018.tif")

# Archivo vectorial de banano
ARCHIVO_VECTORIAL_BANANO <- 
  here(DIRECTORIO_CAPAS_VECTORIALES_ORIGINALES, "fincas_Bananeras.shp")
# Archivo raster de banano
ARCHIVO_RASTER_BANANO <- 
  here(DIRECTORIO_CAPAS_RASTERIZADAS, "cultivo-banano.tif")

# Archivo vectorial de caña 2020
ARCHIVO_VECTORIAL_CANA_2020 <- 
  here(DIRECTORIO_CAPAS_VECTORIALES_ORIGINALES, "cultivo-cana-2020.gpkg")
# Archivo raster de caña 2020
ARCHIVO_RASTER_CANA_2020 <- 
  here(DIRECTORIO_CAPAS_RASTERIZADAS, "cultivo-cana-2020.tif")

# Archivo vectorial de cobertura forestal
ARCHIVO_VECTORIAL_COBERTURA_FORESTAL <- 
  here(DIRECTORIO_CAPAS_VECTORIALES_ORIGINALES, "Cobertura forestal 2021.shp")
# Archivo raster de cobertura forestal
ARCHIVO_RASTER_COBERTURA_FORESTAL <- 
  here(DIRECTORIO_CAPAS_RASTERIZADAS, "cobertura-forestal-2021.tif")


# Resolución de las capas raster (en metros)
RESOLUCION <- 10


# Códigos de las clases de cobertura
CODIGO_CULTIVOS <- 1
CODIGO_PINA <- 2
CODIGO_PALMA <- 3
CODIGO_PASTOS <- 4
CODIGO_CAFE <- 5
CODIGO_BANANO <- 6
CODIGO_CANA <- 7
CODIGO_FORESTAL <- 8
CODIGO_PNE <- 9
CODIGO_RNH <- 10
CODIGO_ASP <- 11


# COSTA RICA

cat("Rasterizando polígono del contorno de Costa Rica ...\n")

# Objeto sf de Costa Rica
costarica_sf <-
  st_read(ARCHIVO_VECTORIAL_COSTARICA, quiet = TRUE) |>
  st_make_valid()

# Recorte del objeto sf de Costa Rica
costarica_sf <- 
  costarica_sf |>
  st_crop(st_bbox(
    c(
      xmin = 280000, 
      ymin = 880000, 
      xmax = 660000, 
      ymax = 1250000
    ), 
    crs = st_crs(costarica_sf)
  ))


# Objeto raster de Costa Rica
costarica_terra <-
  rast(ext(vect(costarica_sf)), resolution = RESOLUCION)

# Asignación de CRS
crs(costarica_terra) <- "EPSG:5367"

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
gc()


# CULTIVOS

cat("Rasterizando datos de cultivos ...\n")

# Objeto sf de cultivos
capa_sf <-
  st_read(ARCHIVO_VECTORIAL_CULTIVOS, quiet = TRUE) |>
  st_make_valid()

# Objeto raster de cultivos
capa_terra <-
  rasterize(capa_sf, costarica_terra)

# Asignación de CRS
crs(capa_terra) <- "EPSG:5367"

# Recorte
capa_terra <-
  capa_terra |>
  crop(costarica_sf) |>
  mask(costarica_sf)

# Valor de las celdas
capa_terra <- ifel(!is.na(capa_terra), CODIGO_CULTIVOS, NA)

# Escritura
capa_terra |> writeRaster(
  ARCHIVO_RASTER_CULTIVOS,
  overwrite=TRUE
)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_sf)
rm(capa_terra)
gc()


# PIÑA

cat("Rasterizando datos de piña ...\n")

# Objeto sf de piña
capa_sf <-
  st_read(ARCHIVO_VECTORIAL_PINA, quiet = TRUE) |>
  st_make_valid()

# Objeto raster de piña
capa_terra <-
  rasterize(capa_sf, costarica_terra)

# Asignación de CRS
crs(capa_terra) <- "EPSG:5367"

# Recorte
capa_terra <-
  capa_terra |>
  crop(costarica_sf) |>
  mask(costarica_sf)

# Valor de las celdas
capa_terra <- ifel(!is.na(capa_terra), CODIGO_PINA, NA)

# Escritura
capa_terra |> writeRaster(
  ARCHIVO_RASTER_PINA,
  overwrite=TRUE
)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_sf)
rm(capa_terra)
gc()


# PALMA

cat("Rasterizando datos de palma ...\n")

# Objeto sf de palma
capa_sf <-
  st_read(ARCHIVO_VECTORIAL_PALMA, quiet = TRUE) |>
  st_make_valid()

# Objeto raster de palma
capa_terra <-
  rasterize(capa_sf, costarica_terra)

# Asignación de CRS
crs(capa_terra) <- "EPSG:5367"

# Recorte
capa_terra <-
  capa_terra |>
  crop(costarica_sf) |>
  mask(costarica_sf)

# Valor de las celdas
capa_terra <- ifel(!is.na(capa_terra), CODIGO_PALMA, NA)

# Escritura
capa_terra |> writeRaster(
  ARCHIVO_RASTER_PALMA,
  overwrite=TRUE
)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_sf)
rm(capa_terra)
gc()


# PASTOS

cat("Rasterizando datos de pastos ...\n")

# Objeto sf de pastos 2019
pastos_2019_sf <-
  st_read(ARCHIVO_VECTORIAL_PASTOS_2019, quiet = TRUE) |>
  st_make_valid()

# Objeto sf de pastos 2020
pastos_2020_sf <-
  st_read(ARCHIVO_VECTORIAL_PASTOS_2020, quiet = TRUE) |>
  st_make_valid()

# Objeto raster de pastos 2019
pastos_2019_terra <-
  rasterize(pastos_2019_sf, costarica_terra)

# Asignación de CRS
crs(pastos_2019_terra) <- "EPSG:5367"

# Recorte
pastos_2019_terra <-
  pastos_2019_terra |>
  crop(costarica_sf) |>
  mask(costarica_sf)

# Objeto raster de pastos 2020
pastos_2020_terra <-
  rasterize(pastos_2020_sf, costarica_terra)

# Asignación de CRS
crs(pastos_2020_terra) <- "EPSG:5367"

# Recorte
pastos_2020_terra <-
  pastos_2020_terra |>
  crop(costarica_sf) |>
  mask(costarica_sf)

# Unión
capa_terra <- merge(pastos_2020_terra, pastos_2019_terra, overwrite=TRUE)

# Valor de las celdas
capa_terra <- ifel(!is.na(capa_terra), CODIGO_PASTOS, NA)

# Escritura
capa_terra |> writeRaster(
  ARCHIVO_RASTER_PASTOS,
  overwrite=TRUE
)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(pastos_2019_sf)
rm(pastos_2020_sf)
rm(pastos_2019_terra)
rm(pastos_2020_terra)
rm(capa_sf)
rm(capa_terra)
gc()


# CAFÉ

cat("Rasterizando datos de café ...\n")

# Objeto sf de café
capa_sf <-
  st_read(ARCHIVO_VECTORIAL_CAFE, quiet = TRUE) |>
  st_make_valid()

# Objeto raster de café
capa_terra <-
  rasterize(capa_sf, costarica_terra)

# Asignación de CRS
crs(capa_terra) <- "EPSG:5367"

# Recorte
capa_terra <-
  capa_terra |>
  crop(costarica_sf) |>
  mask(costarica_sf)

# Valor de las celdas
capa_terra <- ifel(!is.na(capa_terra), CODIGO_CAFE, NA)

# Escritura
capa_terra |> writeRaster(
  ARCHIVO_RASTER_CAFE,
  overwrite=TRUE
)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_sf)
rm(capa_terra)
gc()


# BANANO

cat("Rasterizando datos de banano ...\n")

# Objeto sf de banano
capa_sf <-
  st_read(ARCHIVO_VECTORIAL_BANANO, quiet = TRUE) |>
  st_transform(5367) |>
  st_make_valid()

# Objeto raster de banano
capa_terra <-
  rasterize(capa_sf, costarica_terra)

# Asignación de CRS
crs(capa_terra) <- "EPSG:5367"

# Recorte
capa_terra <-
  capa_terra |>
  crop(costarica_sf) |>
  mask(costarica_sf)

# Valor de las celdas
capa_terra <- ifel(!is.na(capa_terra), CODIGO_BANANO, NA)

# Escritura
capa_terra |> writeRaster(
  ARCHIVO_RASTER_BANANO,
  overwrite=TRUE
)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_sf)
rm(capa_terra)
gc()


# CAÑA

cat("Rasterizando datos de caña ...\n")

# Objeto sf de caña
capa_sf <-
  st_read(ARCHIVO_VECTORIAL_CANA_2020, quiet = TRUE) |>
  st_transform(5367) |>
  st_make_valid()

# Objeto raster de banano
capa_terra <-
  rasterize(capa_sf, costarica_terra)

# Asignación de CRS
crs(capa_terra) <- "EPSG:5367"

# Recorte
capa_terra <-
  capa_terra |>
  crop(costarica_sf) |>
  mask(costarica_sf)

# Valor de las celdas
capa_terra <- ifel(!is.na(capa_terra), CODIGO_CANA, NA)

# Escritura
capa_terra |> writeRaster(
  ARCHIVO_RASTER_CANA_2020,
  overwrite=TRUE
)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_sf)
rm(capa_terra)
gc()


# COBERTURA FORESTAL

cat("Rasterizando datos de cobertura forestal ...\n")

# Objeto sf de cobertura forestal
capa_sf <-
  st_read(ARCHIVO_VECTORIAL_COBERTURA_FORESTAL, quiet = TRUE) |>
  st_transform(5367) |>
  st_make_valid()

# Objeto raster de cobertura forestal
capa_terra <-
  rasterize(capa_sf, costarica_terra)

# Asignación de CRS
crs(capa_terra) <- "EPSG:5367"

# Recorte
capa_terra <-
  capa_terra |>
  crop(costarica_sf) |>
  mask(costarica_sf)

# Valor de las celdas
capa_terra <- ifel(!is.na(capa_terra), CODIGO_FORESTAL, NA)

# Escritura
capa_terra |> writeRaster(
  ARCHIVO_RASTER_COBERTURA_FORESTAL,
  overwrite=TRUE
)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_sf)
rm(capa_terra)
gc()


# PATRIMO NATURAL DEL ESTADO (PNE)

cat("Rasterizando datos del Patrimonio Natural del Estado (PNE) ...\n")

# Objeto sf de PNE
capa_sf <-
  st_read(ARCHIVO_VECTORIAL_PNE, quiet = TRUE) |>
  st_transform(5367) |>
  st_make_valid()

# Objeto raster de PNE
capa_terra <-
  rasterize(capa_sf, costarica_terra)

# Asignación de CRS
crs(capa_terra) <- "EPSG:5367"

# Recorte
capa_terra <-
  capa_terra |>
  crop(costarica_sf) |>
  mask(costarica_sf)

# Valor de las celdas
capa_terra <- ifel(!is.na(capa_terra), CODIGO_PNE, NA)

# Escritura
capa_terra |> writeRaster(
  ARCHIVO_RASTER_PNE,
  overwrite=TRUE
)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_sf)
rm(capa_terra)
gc()


# REGISTRO NACIONAL DE HUMEDALES (RNH)

cat("Rasterizando datos del Registro Nacional de Humedales (RNH) ...\n")

# Objeto sf de RNH
capa_sf <-
  st_read(ARCHIVO_VECTORIAL_RNH, quiet = TRUE) |>
  st_transform(5367) |>
  st_make_valid()

# Objeto raster de RNH
capa_terra <-
  rasterize(capa_sf, costarica_terra)

# Asignación de CRS
crs(capa_terra) <- "EPSG:5367"

# Recorte
capa_terra <-
  capa_terra |>
  crop(costarica_sf) |>
  mask(costarica_sf)

# Valor de las celdas
capa_terra <- ifel(!is.na(capa_terra), CODIGO_RNH, NA)

# Escritura
capa_terra |> writeRaster(
  ARCHIVO_RASTER_RNH,
  overwrite=TRUE
)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_sf)
rm(capa_terra)
gc()


# ÁREAS SILVESTRES PROTEGIDAS (ASP)

cat("Rasterizando datos de Áreas Silvestres Protegidas (ASP) ...\n")

# Objeto sf de ASP
capa_sf <-
  st_read(ARCHIVO_VECTORIAL_ASP, quiet = TRUE) |>
  filter(cat_manejo == "Parque Nacional" | cat_manejo == "Reserva Biologica" | cat_manejo == "Monumento Natural") |>
  st_transform(5367) |>
  st_make_valid()

# Objeto raster de ASP
capa_terra <-
  rasterize(capa_sf, costarica_terra)

# Asignación de CRS
crs(capa_terra) <- "EPSG:5367"

# Recorte
capa_terra <-
  capa_terra |>
  crop(costarica_sf) |>
  mask(costarica_sf)

# Valor de las celdas
capa_terra <-
  ifel(!is.na(capa_terra), CODIGO_ASP, NA)

# Escritura
capa_terra |> writeRaster(
  ARCHIVO_RASTER_ASP,
  overwrite=TRUE
)

cat("Finalizado\n\n")

cat("FIN\n")
