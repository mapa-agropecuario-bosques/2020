#
# REMUESTREO DE CAPAS RASTER
#


# Paquetes
library(here)
library(dplyr)
library(sf)
library(terra)


# Parámetros generales

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
ARCHIVO_RASTER_REDD_ORIGINAL <- 
  here(DIRECTORIO_CAPAS_RASTER_ORIGINALES, "MC21_20_01_23_GDAL.tif")

# Archivo raster de cobertura y uso de la tierra del proyecto REDD remuestreado
ARCHIVO_RASTER_REDD_REMUESTREADO <- 
  here(DIRECTORIO_CAPAS_REMUESTREADAS, "MC21_20_01_23_GDAL_REMUESTREADO.tif")

# Archivo raster de zonas urbanas remuestreado
ARCHIVO_RASTER_ZONASURBANAS_REMUESTREADO <- 
  here(DIRECTORIO_CAPAS_REMUESTREADAS, "zonas-urbanas-2021.tif")

# Valor actual de las zonas urbanas
VALOR_ZONAS_URBANAS_ACTUAL <- 95

# Valor nuevo de las zonas urbanas
VALOR_ZONAS_URBANAS_NUEVO <- 1

# Resolución de las capas raster (en metros)
RESOLUCION <- 10


# Procesamiento

# COSTA RICA

cat("Remuestreando polígono del contorno de Costa Rica...\n")

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

# Borrado de objetos innecesarios
gc()


# Objeto terra de REDD original

cat("Remuestreando datos de REDD...\n")

capa_terra_original <-
  rast(ARCHIVO_RASTER_REDD_ORIGINAL)

# Objeto terra de REDD remuestreado
capa_terra_remuestreada <-
  capa_terra_original |>
  resample(costarica_terra, method = "near")

# Recorte
capa_terra_remuestreada <-
  capa_terra_remuestreada |>
  crop(costarica_sf) |>
  mask(costarica_sf)

# Escritura
# writeRaster(
#   capa_terra_remuestreada,
#   ARCHIVO_RASTER_REDD_REMUESTREADO,
#   overwrite=TRUE
# )

cat("Finalizado\n\n")

cat("Extrayendo datos de zonas urbanas...\n")

# Capa raster de zonas urbanas
capa_zonasurbanas_remuestreada <-
  ifel(capa_terra_remuestreada == VALOR_ZONAS_URBANAS_ACTUAL, VALOR_ZONAS_URBANAS_NUEVO, NA)

writeRaster(
  capa_zonasurbanas_remuestreada,
  ARCHIVO_RASTER_ZONASURBANAS_REMUESTREADO,
  overwrite=TRUE
)

cat("Finalizado\n\n")

cat("FIN\n")