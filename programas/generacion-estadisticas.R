#
# GENERACIÓN DE ESTADÍSTICAS
#


# PAQUETES
library(here)
library(dplyr)
library(readr)
library(terra)


# PARÁMETROS GENERALES

# Archivo raster de capa de uso agropecuario y bosques reclasificado comprimido
ARCHIVO_RASTER_USO_AGROPECUARIO_BOSQUES_RECLASIFICADO <-
  here("salidas", "uso-agropecuario-bosques-2020-reclasificado-comprimido.tif")

# Archivo CSV con estadísticas
ARCHIVO_CSV_ESTADISTICAS <-
  here("salidas", "estadisticas.csv")


# PROCESAMIENTO

# Lectura del archivo raster de capa de uso agropecuario y bosques
agropecuario_bosques_terra_reclasificado <- 
  rast(ARCHIVO_RASTER_USO_AGROPECUARIO_BOSQUES_RECLASIFICADO)

cat("Generando estadísticas ...\n")
estadisticas <- freq(agropecuario_bosques_terra_reclasificado)

# Adición de columna de etiqueta de las clases
estadisticas <- estadisticas |> mutate(
  nombre_clase = case_when(
    value == 1 ~ "Red vial",
    value == 2 ~ "Áreas Silvestres Protegidas",
    value == 3 ~ "Humedales",
    value == 4 ~ "Patrimonio Natural del Estado",
    value == 5 ~ "Caña",
    value == 6 ~ "Banano",
    value == 7 ~ "Café",
    value == 8 ~ "Pasto",
    value == 9 ~ "Palma",
    value == 10 ~ "Piña",
    value == 11 ~ "Cultivos",
    value == 12 ~ "Páramo",
    value == 13 ~ "Cobertura forestal",
    value == 14 ~ "Suelo desnudo",
    value == 15 ~ "Zonas urbanas",
    value == 16 ~ "Sin información"
  )
)

# Borrado de la columna "layer"
estadisticas <- estadisticas |>
  select(
    codigo_clase = value,
    nombre_clase,
    celdas = count
  )

# Adición de columnas de m2, ha y km2
estadisticas <- estadisticas |>
  mutate(
    m2 = celdas * 100,
    ha = m2 / 10000,
    km2 = m2 / 1000000
  )

# Conteo del total de celdas
total_celdas <- sum(estadisticas$celdas)

# Adición de columna de proporción
estadisticas <- estadisticas |>
  mutate(
    proporcion = celdas / total_celdas
  )

# Despliegue del resultado
print(estadisticas)

# Almacenamiento del resultado
write_csv(estadisticas, ARCHIVO_CSV_ESTADISTICAS)

cat("Finalizado\n\n")

cat("FIN\n")