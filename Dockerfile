# Se utiliza la imagen rocker/geospatial:4.3.3 como base
FROM rocker/geospatial:4.3.3

# Definición de la variable de entorno PASSWORD
ENV PASSWORD=mapa

# Descarga e instalación del paquete quarto del sistema operativo, versión 1.4.551
RUN apt update && \
    wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.4.551/quarto-1.4.551-linux-amd64.deb && \
    apt install -y ./quarto-1.4.551-linux-amd64.deb && \
    rm quarto-1.4.551-linux-amd64.deb

# Instalación del paquete here de R, versión 1.0.1
RUN R -e "devtools::install_version('here', version = '1.0.1', repos = 'http://cran.us.r-project.org')"

# Instalación del paquete DT de R, versión 0.32
RUN R -e "devtools::install_version('DT', version = '0.32', repos = 'http://cran.us.r-project.org')"

# Instalación del paquete plotly de R, versión 4.10.4
RUN R -e "devtools::install_version('plotly', version = '4.10.4', repos = 'http://cran.us.r-project.org')"

# Instalación del paquete leaflet.extras de R, versión 1.0.0
RUN R -e "devtools::install_version('leaflet.extras', version = '1.0.0', repos = 'http://cran.us.r-project.org')"

# Limpieza del cache de apt, para reducir el tamaño de la imagen
RUN apt clean && \
    rm -rf /var/lib/apt/lists/*

# Se expone el puerto por defecto de RStudio Server
EXPOSE 8787
