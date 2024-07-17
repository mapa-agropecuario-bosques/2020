#
# RECLASIFICACIÓN DE CAPAS RASTER
#

# Paquetes
library(here)
library(terra)


# Archivo raster de capa de uso agropecuario y bosques
ARCHIVO_RASTER_USO_AGROPECUARIO_BOSQUES <-
  here("salidas", "uso-agropecuario-bosques-2020.tif")

# Archivo raster de capa de uso agropecuario y bosques reclasificado
ARCHIVO_RASTER_USO_AGROPECUARIO_BOSQUES_RECLASIFICADO <-
  here("salidas", "uso-agropecuario-bosques-2020-reclasificado.tif")


# Lectura
agropecuario_bosques_terra <- 
  rast(ARCHIVO_RASTER_USO_AGROPECUARIO_BOSQUES)


cat("Reclasificando ...\n")

# Matriz de reclasificación
matriz_reclasificacion <- 
  matrix(
    c(
      51, 51, 8,
      52, 52, 1,
      53, 53, 1,
      54, 54, 4,
      56, 56, 10,
      57, 57, 8
    ), 
    ncol = 3, byrow = TRUE
  )

# Reclasificación
agropecuario_bosques_terra_reclasificado <-
  classify(agropecuario_bosques_terra, matriz_reclasificacion, right=NA)

# Escritura
writeRaster(
  agropecuario_bosques_terra_reclasificado,
  ARCHIVO_RASTER_USO_AGROPECUARIO_BOSQUES_RECLASIFICADO,
  overwrite=TRUE
)

cat("Finalizado\n\n")

cat("FIN\n")