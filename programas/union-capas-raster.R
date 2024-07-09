#
# UNIÓN DE CAPAS RASTER
#

# Paquetes
library(here)
library(terra)


# Directorio de capas rasterizadas
DIRECTORIO_CAPAS_RASTERIZADAS <- 
  here("datos", "procesados", "rasterizados")

# Directorio de capas remuestreadas
DIRECTORIO_CAPAS_REMUESTREADAS <- 
  here("datos", "procesados", "remuestreados")

# Archivo raster de zonas urbanas
ARCHIVO_RASTER_ZONASURBANAS <- 
  here(DIRECTORIO_CAPAS_REMUESTREADAS, "zonas-urbanas-2021.tif")

# Archivo raster de cultivos
ARCHIVO_RASTER_CULTIVOS <- 
  here(DIRECTORIO_CAPAS_RASTERIZADAS, "cultivos-2017.tif")

# Archivo raster de cultivo de piña
ARCHIVO_RASTER_PINA <- 
  here(DIRECTORIO_CAPAS_RASTERIZADAS, "cultivo-pina-2019.tif")

# Archivo raster de cultivo de palma
ARCHIVO_RASTER_PALMA <- 
  here(DIRECTORIO_CAPAS_RASTERIZADAS, "cultivo-palma-2019.tif")

# Archivo raster de pastos
ARCHIVO_RASTER_PASTOS <- 
  here(DIRECTORIO_CAPAS_RASTERIZADAS, "cultivo-pastos-2019-2020.tif")

# Archivo raster de café
ARCHIVO_RASTER_CAFE <- 
  here(DIRECTORIO_CAPAS_RASTERIZADAS, "cultivo-cafe-2017-2018.tif")

# Archivo raster de banano
ARCHIVO_RASTER_BANANO <- 
  here(DIRECTORIO_CAPAS_RASTERIZADAS, "fincas_Bananeras.tif")

# Archivo raster de caña
ARCHIVO_RASTER_CANA <- 
  here(DIRECTORIO_CAPAS_RASTERIZADAS, "cultivo-cana-2020.tif")

# Archivo raster de cobertura forestal
ARCHIVO_RASTER_COBERTURA_FORESTAL <- 
  here(DIRECTORIO_CAPAS_RASTERIZADAS, "Cobertura forestal 2021.tif")

# Archivo raster de patrimonio natural del estado (PNE)
ARCHIVO_RASTER_PNE <- 
  here(DIRECTORIO_CAPAS_RASTERIZADAS, "patrimonio-natural-estado.tif")

# Archivo raster de registro nacional de humedales (RNH)
ARCHIVO_RASTER_RNH <- 
  here(DIRECTORIO_CAPAS_RASTERIZADAS, "registro-nacional-humedales.tif")

# Archivo raster de áreas silvestres protegidas (ASP)
ARCHIVO_RASTER_ASP <- 
  here(DIRECTORIO_CAPAS_RASTERIZADAS, "areas-silvestres-protegidas.tif")

# Archivo raster de capa de uso agropecuario y bosques
ARCHIVO_RASTER_USO_AGROPECUARIO_BOSQUES <-
  here("salidas", "uso-agropecuario-bosques-2020.tif")


# 1 ZONAS URBANAS

cat("Procesando datos de zonas urbanas...\n")

# Objeto terra de zonas urbanas
capa_terra <- rast(ARCHIVO_RASTER_ZONASURBANAS)

# Adición a la caoa de uso agropecuario y bosques
agropecuario_bosques_terra <- capa_terra

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_terra)
gc()


# 2 CULTIVOS

cat("Procesando datos de cultivos...\n")

# Objeto terra de cultivos
capa_terra <- rast(ARCHIVO_RASTER_CULTIVOS)

# Adición a la caoa de uso agropecuario y bosques
agropecuario_bosques_terra <- merge(capa_terra, agropecuario_bosques_terra, overwrite=TRUE)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_terra)
gc()


# 3 PIÑA

cat("Procesando datos de piña...\n")

# Objeto terra de piña
capa_terra <- rast(ARCHIVO_RASTER_PINA)

# Adición a la caoa de uso agropecuario y bosques
agropecuario_bosques_terra <- merge(capa_terra, agropecuario_bosques_terra, overwrite=TRUE)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_terra)
gc()


# 4 PALMA

cat("Procesando datos de palma...\n")

# Objeto terra de palma
capa_terra <- rast(ARCHIVO_RASTER_PALMA)

# Adición a la caoa de uso agropecuario y bosques
agropecuario_bosques_terra <- merge(capa_terra, agropecuario_bosques_terra, overwrite=TRUE)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_terra)
gc()


# 5 PASTOS

cat("Procesando datos de pastos...\n")

# Objeto terra de palma
capa_terra <- rast(ARCHIVO_RASTER_PASTOS)

# Adición a la caoa de uso agropecuario y bosques
agropecuario_bosques_terra <- merge(capa_terra, agropecuario_bosques_terra, overwrite=TRUE)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_terra)
gc()


# 6 CAFÉ

cat("Procesando datos de café...\n")

# Objeto terra de café
capa_terra <- rast(ARCHIVO_RASTER_CAFE)

# Adición a la caoa de uso agropecuario y bosques
agropecuario_bosques_terra <- merge(capa_terra, agropecuario_bosques_terra, overwrite=TRUE)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_terra)
gc()


# 7 BANANO

cat("Procesando datos de banano...\n")

# Objeto terra de banano
capa_terra <- rast(ARCHIVO_RASTER_BANANO)

# Adición a la caoa de uso agropecuario y bosques
agropecuario_bosques_terra <- merge(capa_terra, agropecuario_bosques_terra, overwrite=TRUE)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_terra)
gc()


# 8 CAÑA

cat("Procesando datos de caña...\n")

# Objeto terra de caña
capa_terra <- rast(ARCHIVO_RASTER_CANA)

# Adición a la caoa de uso agropecuario y bosques
agropecuario_bosques_terra <- merge(capa_terra, agropecuario_bosques_terra, overwrite=TRUE)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_terra)
gc()


# 9 COBERTURA FORESTAL

cat("Procesando datos de cobertura forestal...\n")

# Objeto terra de cobertura forestal
capa_terra <- rast(ARCHIVO_RASTER_COBERTURA_FORESTAL)

# Adición a la caoa de uso agropecuario y bosques
agropecuario_bosques_terra <- merge(capa_terra, agropecuario_bosques_terra, overwrite=TRUE)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_terra)
gc()


# 10 PATRIMO NATURAL DEL ESTADO (PNE)

cat("Procesando datos del Patrimonio Natural del Estado (PNE)...\n")

# Objeto terra de PNE
capa_terra <- rast(ARCHIVO_RASTER_PNE)

# Adición a la caoa de uso agropecuario y bosques
agropecuario_bosques_terra <- merge(capa_terra, agropecuario_bosques_terra, overwrite=TRUE)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_terra)
gc()


# 11 REGISTRO NACIONAL DE HUMEDALES (RNH)

cat("Procesando datos del Registro Nacional de Humedales (RNH)...\n")

# Objeto terra de RNH
capa_terra <- rast(ARCHIVO_RASTER_RNH)

# Adición a la caoa de uso agropecuario y bosques
agropecuario_bosques_terra <- merge(capa_terra, agropecuario_bosques_terra, overwrite=TRUE)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_terra)
gc()


# 12 ÁREAS SILVESTRES PROTEGIDAS (ASP)

cat("Procesando datos de Áreas Silvestres Protegidas (ASP)...\n")

# Objeto terra de ASP
capa_terra <- rast(ARCHIVO_RASTER_ASP)

# Adición a la caoa de uso agropecuario y bosques
agropecuario_bosques_terra <- merge(capa_terra, agropecuario_bosques_terra, overwrite=TRUE)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_terra)
gc()


# Almacenamiento de la capa de uso agropecuario y bosques

cat("Almacenando capa de uso agropecuario y bosques...\n")

agropecuario_bosques_terra |> writeRaster(
  ARCHIVO_RASTER_USO_AGROPECUARIO_BOSQUES,
  overwrite=TRUE
)

cat("Finalizado\n\n")

cat("FIN\n")