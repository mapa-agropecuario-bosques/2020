#
# COMBINACIÓN DE CAPAS RASTER
#


# PAQUETES
library(here)
library(terra)


# PARÁMETROS GENERALES

# Directorio de capas remuestreadas
DIRECTORIO_CAPAS_REMUESTREADAS <- 
  here("datos", "procesados", "remuestreados")

# Archivos raster de capas remuestreadas
ARCHIVO_RASTER_REDD_SININFORMACION <- 
  here(DIRECTORIO_CAPAS_REMUESTREADAS, "redd-sininformacion-2021.tif")
ARCHIVO_RASTER_REDD_AREASURBANAS <- 
  here(DIRECTORIO_CAPAS_REMUESTREADAS, "redd-areasurbanas-2021.tif")
ARCHIVO_RASTER_REDD_SUELOSDESNUDOS <- 
  here(DIRECTORIO_CAPAS_REMUESTREADAS, "redd-suelosdesnudos-2021.tif")
ARCHIVO_RASTER_REDD_BOSQUES <- 
  here(DIRECTORIO_CAPAS_REMUESTREADAS, "redd-bosques-2021.tif")
ARCHIVO_RASTER_REDD_PARAMOS <- 
  here(DIRECTORIO_CAPAS_REMUESTREADAS, "redd-paramos-2021.tif")
ARCHIVO_RASTER_REDD_CULTIVOSPERMANENTES <- 
  here(DIRECTORIO_CAPAS_REMUESTREADAS, "redd-cultivospermanentes-2021.tif")
ARCHIVO_RASTER_REDD_CULTIVOSANUALES <- 
  here(DIRECTORIO_CAPAS_REMUESTREADAS, "redd-cultivosanuales-2021.tif")
ARCHIVO_RASTER_REDD_PASTOS <- 
  here(DIRECTORIO_CAPAS_REMUESTREADAS, "redd-pastos-2021.tif")
ARCHIVO_RASTER_REDD_CUERPOSAGUA <- 
  here(DIRECTORIO_CAPAS_REMUESTREADAS, "redd-cuerposagua-2021.tif")


# Directorio de capas rasterizadas
DIRECTORIO_CAPAS_RASTERIZADAS <- 
  here("datos", "procesados", "rasterizados")

# Archivos raster de capas rasterizadas
ARCHIVO_RASTER_COBERTURA_FORESTAL <- 
  here(DIRECTORIO_CAPAS_RASTERIZADAS, "cobertura-forestal-2021.tif")
ARCHIVO_RASTER_CULTIVOS <- 
  here(DIRECTORIO_CAPAS_RASTERIZADAS, "cultivos-2017.tif")
ARCHIVO_RASTER_PINA <- 
  here(DIRECTORIO_CAPAS_RASTERIZADAS, "cultivo-pina-2019.tif")
ARCHIVO_RASTER_PALMA <- 
  here(DIRECTORIO_CAPAS_RASTERIZADAS, "cultivo-palma-2019.tif")
ARCHIVO_RASTER_PASTOS <- 
  here(DIRECTORIO_CAPAS_RASTERIZADAS, "cultivo-pastos-2019-2020.tif")
ARCHIVO_RASTER_CAFE <- 
  here(DIRECTORIO_CAPAS_RASTERIZADAS, "cultivo-cafe-2017-2018.tif")
ARCHIVO_RASTER_BANANO <- 
  here(DIRECTORIO_CAPAS_RASTERIZADAS, "cultivo-banano.tif")
ARCHIVO_RASTER_CANA <- 
  here(DIRECTORIO_CAPAS_RASTERIZADAS, "cultivo-cana-2020.tif")
ARCHIVO_RASTER_PNE <- 
  here(DIRECTORIO_CAPAS_RASTERIZADAS, "patrimonio-natural-estado.tif")
ARCHIVO_RASTER_RNH <- 
  here(DIRECTORIO_CAPAS_RASTERIZADAS, "registro-nacional-humedales.tif")
ARCHIVO_RASTER_ASP <- 
  here(DIRECTORIO_CAPAS_RASTERIZADAS, "areas-silvestres-protegidas.tif")
ARCHIVO_RASTER_RVN <- 
  here(DIRECTORIO_CAPAS_RASTERIZADAS, "red-vial-nacional.tif")


# Archivo raster de capa de uso agropecuario y bosques
ARCHIVO_RASTER_USO_AGROPECUARIO_BOSQUES <-
  here("salidas", "uso-agropecuario-bosques-2020.tif")


# PROCESAMIENTO

# REDD Sin información

cat("1/21 Procesando datos de REDD Sin información ...\n")

# Objeto terra de REDD Sin información
capa_terra <- rast(ARCHIVO_RASTER_REDD_SININFORMACION)

# Adición a la capa de uso agropecuario y bosques
agropecuario_bosques_terra <- capa_terra

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_terra)
gc()


# REDD Áreas urbanas

cat("2/21 Procesando datos de REDD Áreas urbanas ...\n")

# Objeto terra de REDD Áreas urbanas
capa_terra <- rast(ARCHIVO_RASTER_REDD_AREASURBANAS)

# Adición a la capa de uso agropecuario y bosques
agropecuario_bosques_terra <- merge(capa_terra, agropecuario_bosques_terra, overwrite=TRUE)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_terra)
gc()


# REDD Suelos desnudos

cat("3/21 Procesando datos de REDD Suelos desnudos ...\n")

# Objeto terra de REDD Suelos desnudos
capa_terra <- rast(ARCHIVO_RASTER_REDD_SUELOSDESNUDOS)

# Adición a la capa de uso agropecuario y bosques
agropecuario_bosques_terra <- merge(capa_terra, agropecuario_bosques_terra, overwrite=TRUE)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_terra)
gc()


# REDD Bosques

cat("4/21 Procesando datos de REDD Bosques ...\n")

# Objeto terra de REDD Bosques
capa_terra <- rast(ARCHIVO_RASTER_REDD_BOSQUES)

# Adición a la capa de uso agropecuario y bosques
agropecuario_bosques_terra <- merge(capa_terra, agropecuario_bosques_terra, overwrite=TRUE)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_terra)
gc()


# REDD Páramos

cat("5/21 Procesando datos de REDD Páramos ...\n")

# Objeto terra de REDD Páramos
capa_terra <- rast(ARCHIVO_RASTER_REDD_PARAMOS)

# Adición a la capa de uso agropecuario y bosques
agropecuario_bosques_terra <- merge(capa_terra, agropecuario_bosques_terra, overwrite=TRUE)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_terra)
gc()


# REDD Cultivos Permanentes

cat("6/21 Procesando datos de REDD Cultivos Permanentes ...\n")

# Objeto terra de REDD Cultivos Permanentes
capa_terra <- rast(ARCHIVO_RASTER_REDD_CULTIVOSPERMANENTES)

# Adición a la capa de uso agropecuario y bosques
agropecuario_bosques_terra <- merge(capa_terra, agropecuario_bosques_terra, overwrite=TRUE)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_terra)
gc()


# REDD Cultivos Anuales

cat("7/21 Procesando datos de REDD Cultivos Anuales ...\n")

# Objeto terra de REDD Cultivos Anuales
capa_terra <- rast(ARCHIVO_RASTER_REDD_CULTIVOSANUALES)

# Adición a la capa de uso agropecuario y bosques
agropecuario_bosques_terra <- merge(capa_terra, agropecuario_bosques_terra, overwrite=TRUE)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_terra)
gc()


# REDD Pastos

cat("8/21 Procesando datos de REDD Pastos ...\n")

# Objeto terra de REDD Pastos
capa_terra <- rast(ARCHIVO_RASTER_REDD_PASTOS)

# Adición a la capa de uso agropecuario y bosques
agropecuario_bosques_terra <- merge(capa_terra, agropecuario_bosques_terra, overwrite=TRUE)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_terra)
gc()


# REDD Cuerpos de agua

cat("9/21 Procesando datos de REDD Cuerpos de agua ...\n")

# Objeto terra de REDD Cuerpos de agua
capa_terra <- rast(ARCHIVO_RASTER_REDD_CUERPOSAGUA)

# Adición a la capa de uso agropecuario y bosques
agropecuario_bosques_terra <- merge(capa_terra, agropecuario_bosques_terra, overwrite=TRUE)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_terra)
gc()


# COBERTURA FORESTAL

cat("10/21 Procesando datos de cobertura forestal ...\n")

# Objeto terra de cobertura forestal
capa_terra <- rast(ARCHIVO_RASTER_COBERTURA_FORESTAL)

# Adición a la capa de uso agropecuario y bosques
agropecuario_bosques_terra <- merge(capa_terra, agropecuario_bosques_terra, overwrite=TRUE)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_terra)
gc()


# CULTIVOS

cat("11/21 Procesando datos de cultivos ...\n")

# Objeto terra de cultivos
capa_terra <- rast(ARCHIVO_RASTER_CULTIVOS)

# Adición a la capa de uso agropecuario y bosques
agropecuario_bosques_terra <- merge(capa_terra, agropecuario_bosques_terra, overwrite=TRUE)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_terra)
gc()


# PIÑA

cat("12/21 Procesando datos de piña ...\n")

# Objeto terra de piña
capa_terra <- rast(ARCHIVO_RASTER_PINA)

# Adición a la capa de uso agropecuario y bosques
agropecuario_bosques_terra <- merge(capa_terra, agropecuario_bosques_terra, overwrite=TRUE)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_terra)
gc()


# PALMA

cat("13/21 Procesando datos de palma ...\n")

# Objeto terra de palma
capa_terra <- rast(ARCHIVO_RASTER_PALMA)

# Adición a la capa de uso agropecuario y bosques
agropecuario_bosques_terra <- merge(capa_terra, agropecuario_bosques_terra, overwrite=TRUE)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_terra)
gc()


# PASTOS

cat("14/21 Procesando datos de pastos ...\n")

# Objeto terra de palma
capa_terra <- rast(ARCHIVO_RASTER_PASTOS)

# Adición a la capa de uso agropecuario y bosques
agropecuario_bosques_terra <- merge(capa_terra, agropecuario_bosques_terra, overwrite=TRUE)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_terra)
gc()


# CAFÉ

cat("15/21 Procesando datos de café ...\n")

# Objeto terra de café
capa_terra <- rast(ARCHIVO_RASTER_CAFE)

# Adición a la capa de uso agropecuario y bosques
agropecuario_bosques_terra <- merge(capa_terra, agropecuario_bosques_terra, overwrite=TRUE)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_terra)
gc()


# BANANO

cat("16/21 Procesando datos de banano ...\n")

# Objeto terra de banano
capa_terra <- rast(ARCHIVO_RASTER_BANANO)

# Adición a la capa de uso agropecuario y bosques
agropecuario_bosques_terra <- merge(capa_terra, agropecuario_bosques_terra, overwrite=TRUE)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_terra)
gc()


# CAÑA

cat("17/21 Procesando datos de caña ...\n")

# Objeto terra de caña
capa_terra <- rast(ARCHIVO_RASTER_CANA)

# Adición a la capa de uso agropecuario y bosques
agropecuario_bosques_terra <- merge(capa_terra, agropecuario_bosques_terra, overwrite=TRUE)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_terra)
gc()


# PATRIMONIO NATURAL DEL ESTADO (PNE)

cat("18/21 Procesando datos del Patrimonio Natural del Estado (PNE) ...\n")

# Objeto terra de PNE
capa_terra <- rast(ARCHIVO_RASTER_PNE)

# Adición a la capa de uso agropecuario y bosques
agropecuario_bosques_terra <- merge(capa_terra, agropecuario_bosques_terra, overwrite=TRUE)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_terra)
gc()


# REGISTRO NACIONAL DE HUMEDALES (RNH)

cat("19/21 Procesando datos del Registro Nacional de Humedales (RNH) ...\n")

# Objeto terra de RNH
capa_terra <- rast(ARCHIVO_RASTER_RNH)

# Adición a la capa de uso agropecuario y bosques
agropecuario_bosques_terra <- merge(capa_terra, agropecuario_bosques_terra, overwrite=TRUE)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_terra)
gc()


# ÁREAS SILVESTRES PROTEGIDAS (ASP)

cat("20/21 Procesando datos de Áreas Silvestres Protegidas (ASP) ...\n")

# Objeto terra de ASP
capa_terra <- rast(ARCHIVO_RASTER_ASP)

# Adición a la capa de uso agropecuario y bosques
agropecuario_bosques_terra <- merge(capa_terra, agropecuario_bosques_terra, overwrite=TRUE)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_terra)
gc()


# RED VIAL NACIONAL (RVN)

cat("21/21 Procesando datos de Red Vial Nacional (RVN) ...\n")

# Objeto terra de RVN
capa_terra <- rast(ARCHIVO_RASTER_RVN)

# Adición a la capa de uso agropecuario y bosques
agropecuario_bosques_terra <- merge(capa_terra, agropecuario_bosques_terra, overwrite=TRUE)

cat("Finalizado\n\n")

# Borrado de objetos innecesarios
rm(capa_terra)
gc()


# Almacenamiento de la capa de uso agropecuario y bosques

cat("Almacenando capa de uso agropecuario y bosques ...\n")

agropecuario_bosques_terra |> writeRaster(
  ARCHIVO_RASTER_USO_AGROPECUARIO_BOSQUES,
  overwrite=TRUE
)

cat("Finalizado\n\n")

cat("FIN\n")