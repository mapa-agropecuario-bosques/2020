# Desarrollo de un mapa base de uso agropecuario y bosques a nivel nacional del año 2020

## Flujos de trabajo

### Entradas
- [Lista de capas WFS](https://github.com/mapa-agropecuario-bosques/2020/blob/main/data/raw/capas-wfs.csv)

### Procesamiento
- [Descarga de capas WFS](https://mapa-agropecuario-bosques.github.io/2020/src/data/descarga-capas-wfs.html)

### Salidas
- [Capas WFS descargadas](https://drive.google.com/drive/folders/1M2NEtAsnteFmjm5tK1vr5l1V01dtgXCo?usp=sharing)

## Manejo del contenedor Docker

### Generación de la imagen a partir del archivo Dockerfile
```shell
# Generación de la imagen Docker a partir del archivo Dockerfile
docker build -t mapa-agropecuario-bosques-r-433 .
```

### Ejecución del contenedor
```shell
# Ejecución del contenedor Docker
# (el directorio local debe especificarse en la opción -v)
# (el archivo con variables de ambiente debe especificarse en la opción --env-file)
docker run -d --name mapa-agropecuario-bosques-r-433 \
  -p 8787:8787 \
  -v /home/mfvargas/mapa-agropecuario-bosques/github/2020:/home/rstudio \
  --env-file /home/mfvargas/mapa-agropecuario-bosques-r-433.env \
  mapa-agropecuario-bosques-r-433
```
  
### Acceso al contenedor (username=rstudio, password=biodatacr)
[http://localhost:8787](http://localhost:8787)

### Detención, inicio y borrado del contenedor
```shell
# Detención del contenedor Docker
docker stop mapa-agropecuario-bosques-r-433

# Inicio del contenedor Docker
docker start mapa-agropecuario-bosques-r-433

# Borrado del contenedor Docker
docker rm mapa-agropecuario-bosques-r-433
```

### Ejemplo de contenido del archivo `mapa-agropecuario-bosques-r-433.env`
(deben asignarse valores adecuados a las variables)
```shell
# Clave para ingresar a RStudio
PASSWORD=mapa
```
