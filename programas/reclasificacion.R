#
# RECLASIFICACIÓN DE CAPAS RASTER
#


# PAQUETES
library(here)
library(terra)


# PARÁMETROS GENERALES

# Archivo raster de capa de uso agropecuario y bosques
ARCHIVO_RASTER_USO_AGROPECUARIO_BOSQUES <-
  here("salidas", "uso-agropecuario-bosques-2020.tif")

# Archivo raster de capa de uso agropecuario y bosques reclasificado
ARCHIVO_RASTER_USO_AGROPECUARIO_BOSQUES_RECLASIFICADO <-
  here("salidas", "uso-agropecuario-bosques-2020-reclasificado.tif")


# PROCESAMIENTO

# Lectura del archivo raster de capa de uso agropecuario y bosques
agropecuario_bosques_terra <- 
  rast(ARCHIVO_RASTER_USO_AGROPECUARIO_BOSQUES)

cat("Reclasificando ...\n")

# Matriz de reclasificación
matriz_reclasificacion <- 
  matrix(
    c(
      109, 109, 16,
      108, 108, 15,
      107, 107, 14,
      106, 106, 13,
      105, 105, 12,
      104, 104, 11,
      103, 103, 11,
      102, 102, 8,
      101, 101, 3,
      212, 212, 13,
      211, 211, 11,
      210, 210, 10,
      209, 209, 9,
      208, 208, 8,
      207, 207, 7,
      206, 206, 6,
      205, 205, 5,
      204, 204, 4,
      203, 203, 3,
      202, 202, 2,
      201, 201, 1
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