#
# REMUESTREO DE CAPAS RASTER
#


# PAQUETES
library(here)
library(sf)
library(terra)


# PARÁMETROS GENERALES

# Códigos actuales de las clases de cobertura
VALOR_REDD_BOSQUES_ACTUAL <- 1
VALOR_REDD_CULTIVOSANUALES_ACTUAL <- 2
VALOR_REDD_CULTIVOSPERMANENTES_ACTUAL <- 3
VALOR_REDD_PASTOS_ACTUAL <- 4
VALOR_REDD_AREASURBANAS_ACTUAL <- 5
VALOR_REDD_CUERPOSAGUA_ACTUAL <- 6
VALOR_REDD_PARAMOS_ACTUAL <- 7
VALOR_REDD_SUELOSDESNUDOS_ACTUAL <- 8
VALOR_REDD_SININFORMACION_ACTUAL <- 101

# Códigos nuevos de las clases de cobertura 
VALOR_REDD_SININFORMACION_NUEVO <- 109
VALOR_REDD_AREASURBANAS_NUEVO <- 108
VALOR_REDD_SUELOSDESNUDOS_NUEVO <- 107
VALOR_REDD_BOSQUES_NUEVO <- 106
VALOR_REDD_PARAMOS_NUEVO <- 105
VALOR_REDD_CULTIVOSPERMANENTES_NUEVO <- 104
VALOR_REDD_CULTIVOSANUALES_NUEVO <- 103
VALOR_REDD_PASTOS_NUEVO <- 102
VALOR_REDD_CUERPOSAGUA_NUEVO <- 101


# Directorio de capas vectoriales
DIRECTORIO_CAPAS_VECTORIALES_ORIGINALES <- 
  here("datos", "originales", "vectoriales")

# Directorio de capas raster
DIRECTORIO_CAPAS_RASTER_ORIGINALES <- 
  here("datos", "originales", "raster")

# Directorio de capas remuestreadas
DIRECTORIO_CAPAS_REMUESTREADAS <- 
  here("datos", "procesados", "remuestreados")


# Archivo vectorial de Costa Rica
ARCHIVO_VECTORIAL_COSTARICA <- 
  here(DIRECTORIO_CAPAS_VECTORIALES_ORIGINALES, "costarica.gpkg")

# Archivo raster de cobertura y uso de la tierra del proyecto REDD original
ARCHIVO_RASTER_REDD_COSTARICA_ORIGINAL <- 
  here(DIRECTORIO_CAPAS_RASTER_ORIGINALES, "MC21_RECLASIFICADO_IPCC_9_7_2024.tif")

# Archivo raster de cobertura y uso de la tierra del proyecto REDD remuestreado
ARCHIVO_RASTER_REDD_COSTARICA_REMUESTREADO <- 
  here(DIRECTORIO_CAPAS_REMUESTREADAS, "MC21_RECLASIFICADO_IPCC_9_7_2024_REMUESTREADO.tif")

# Archivos raster de capas REDD remuestreados
ARCHIVO_RASTER_REDD_SININFORMACION_REMUESTREADO <- 
  here(DIRECTORIO_CAPAS_REMUESTREADAS, "redd-sininformacion-2021.tif")
ARCHIVO_RASTER_REDD_AREASURBANAS_REMUESTREADO <- 
  here(DIRECTORIO_CAPAS_REMUESTREADAS, "redd-areasurbanas-2021.tif")
ARCHIVO_RASTER_REDD_SUELOSDESNUDOS_REMUESTREADO <- 
  here(DIRECTORIO_CAPAS_REMUESTREADAS, "redd-suelosdesnudos-2021.tif")
ARCHIVO_RASTER_REDD_BOSQUES_REMUESTREADO <- 
  here(DIRECTORIO_CAPAS_REMUESTREADAS, "redd-bosques-2021.tif")
ARCHIVO_RASTER_REDD_PARAMOS_REMUESTREADO <- 
  here(DIRECTORIO_CAPAS_REMUESTREADAS, "redd-paramos-2021.tif")
ARCHIVO_RASTER_REDD_CULTIVOSPERMANENTES_REMUESTREADO <- 
  here(DIRECTORIO_CAPAS_REMUESTREADAS, "redd-cultivospermanentes-2021.tif")
ARCHIVO_RASTER_REDD_CULTIVOSANUALES_REMUESTREADO <- 
  here(DIRECTORIO_CAPAS_REMUESTREADAS, "redd-cultivosanuales-2021.tif")
ARCHIVO_RASTER_REDD_PASTOS_REMUESTREADO <- 
  here(DIRECTORIO_CAPAS_REMUESTREADAS, "redd-pastos-2021.tif")
ARCHIVO_RASTER_REDD_CUERPOSAGUA_REMUESTREADO <- 
  here(DIRECTORIO_CAPAS_REMUESTREADAS, "redd-cuerposagua-2021.tif")


# Resolución de las capas raster (en metros)
RESOLUCION <- 10


# PROCESAMIENTO

# COSTA RICA

cat("0a Rasterizando polígono del contorno de Costa Rica ...\n")

# Objeto sf de Costa Rica
costarica_sf <-
  st_read(ARCHIVO_VECTORIAL_COSTARICA, quiet = TRUE) |>
  st_make_valid()

# Recorte del objeto sf de Costa Rica (para omitir la Isla del Coco)
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


# Objeto terra de REDD Costa Rica original

cat("0b Remuestreando datos de REDD Costa Rica ...\n")

capa_redd_costarica_original <-
  rast(ARCHIVO_RASTER_REDD_COSTARICA_ORIGINAL)

# Objeto terra de REDD Costa Rica remuestreado
capa_redd_costarica_remuestreada <-
  capa_redd_costarica_original |>
  resample(costarica_terra, method = "near")

# Recorte
capa_redd_costarica_remuestreada <-
  capa_redd_costarica_remuestreada |>
  crop(costarica_sf) |>
  mask(costarica_sf)

# Escritura
writeRaster(
  capa_redd_costarica_remuestreada,
  ARCHIVO_RASTER_REDD_COSTARICA_REMUESTREADO,
  overwrite=TRUE
)

cat("Finalizado\n\n")


cat("1/9 Extrayendo datos de REDD Sin Información ...\n")

# Capa raster de REDD Sin Información
capa_terra_remuestreada <- ifel(
  capa_redd_costarica_remuestreada == VALOR_REDD_SININFORMACION_ACTUAL, 
  VALOR_REDD_SININFORMACION_NUEVO, 
  NA
)

writeRaster(
  capa_terra_remuestreada,
  ARCHIVO_RASTER_REDD_SININFORMACION_REMUESTREADO,
  overwrite=TRUE
)

cat("Finalizado\n\n")


cat("2/9 Extrayendo datos de REDD Áreas Urbanas ...\n")

# Capa raster de REDD Áreas Urbanas
capa_terra_remuestreada <- ifel(
  capa_redd_costarica_remuestreada == VALOR_REDD_AREASURBANAS_ACTUAL, 
  VALOR_REDD_AREASURBANAS_NUEVO, 
  NA
)

writeRaster(
  capa_terra_remuestreada,
  ARCHIVO_RASTER_REDD_AREASURBANAS_REMUESTREADO,
  overwrite=TRUE
)

cat("Finalizado\n\n")


cat("3/9 Extrayendo datos de REDD Suelos Desnudos ...\n")

# Capa raster de REDD Suelos Desnudos
capa_terra_remuestreada <- ifel(
  capa_redd_costarica_remuestreada == VALOR_REDD_SUELOSDESNUDOS_ACTUAL, 
  VALOR_REDD_SUELOSDESNUDOS_NUEVO, 
  NA
)

writeRaster(
  capa_terra_remuestreada,
  ARCHIVO_RASTER_REDD_SUELOSDESNUDOS_REMUESTREADO,
  overwrite=TRUE
)

cat("Finalizado\n\n")


cat("4/9 Extrayendo datos de REDD Bosques ...\n")

# Capa raster de REDD Bosques
capa_terra_remuestreada <- ifel(
  capa_redd_costarica_remuestreada == VALOR_REDD_BOSQUES_ACTUAL, 
  VALOR_REDD_BOSQUES_NUEVO, 
  NA
)

writeRaster(
  capa_terra_remuestreada,
  ARCHIVO_RASTER_REDD_BOSQUES_REMUESTREADO,
  overwrite=TRUE
)

cat("Finalizado\n\n")


cat("5/9 Extrayendo datos de REDD Páramos ...\n")

# Capa raster de REDD Páramos
capa_terra_remuestreada <- ifel(
  capa_redd_costarica_remuestreada == VALOR_REDD_PARAMOS_ACTUAL, 
  VALOR_REDD_PARAMOS_NUEVO, 
  NA
)

writeRaster(
  capa_terra_remuestreada,
  ARCHIVO_RASTER_REDD_PARAMOS_REMUESTREADO,
  overwrite=TRUE
)

cat("Finalizado\n\n")


cat("6/9 Extrayendo datos de REDD Cultivos Permanentes ...\n")

# Capa raster de REDD Cultivos Permanentes
capa_terra_remuestreada <- ifel(
  capa_redd_costarica_remuestreada == VALOR_REDD_CULTIVOSPERMANENTES_ACTUAL, 
  VALOR_REDD_CULTIVOSPERMANENTES_NUEVO, 
  NA
)

writeRaster(
  capa_terra_remuestreada,
  ARCHIVO_RASTER_REDD_CULTIVOSPERMANENTES_REMUESTREADO,
  overwrite=TRUE
)

cat("Finalizado\n\n")


cat("7/9 Extrayendo datos de REDD Cultivos Anuales ...\n")

# Capa raster de REDD Cultivos Anuales
capa_terra_remuestreada <- ifel(
  capa_redd_costarica_remuestreada == VALOR_REDD_CULTIVOSANUALES_ACTUAL, 
  VALOR_REDD_CULTIVOSANUALES_NUEVO, 
  NA
)

writeRaster(
  capa_terra_remuestreada,
  ARCHIVO_RASTER_REDD_CULTIVOSANUALES_REMUESTREADO,
  overwrite=TRUE
)

cat("Finalizado\n\n")


cat("8/9 Extrayendo datos de REDD Pastos ...\n")

# Capa raster de REDD Pastos
capa_terra_remuestreada <- ifel(
  capa_redd_costarica_remuestreada == VALOR_REDD_PASTOS_ACTUAL, 
  VALOR_REDD_PASTOS_NUEVO, 
  NA
)

writeRaster(
  capa_terra_remuestreada,
  ARCHIVO_RASTER_REDD_PASTOS_REMUESTREADO,
  overwrite=TRUE
)

cat("Finalizado\n\n")


cat("9/9 Extrayendo datos de REDD Cuerpos de Agua ...\n")

# Capa raster de REDD Cuerpos de Agua
capa_terra_remuestreada <- ifel(
  capa_redd_costarica_remuestreada == VALOR_REDD_CUERPOSAGUA_ACTUAL, 
  VALOR_REDD_CUERPOSAGUA_NUEVO, 
  NA
)

writeRaster(
  capa_terra_remuestreada,
  ARCHIVO_RASTER_REDD_CUERPOSAGUA_REMUESTREADO,
  overwrite=TRUE
)

cat("Finalizado\n\n")


cat("FIN\n")