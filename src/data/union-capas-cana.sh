# Unión de los archivos de caña
# Ejecución: bash union-capas-cana.sh

# Archivos temporales con nombres de campos unificados
ogr2ogr \
  ../../data/interim/capas-archivos-vectoriales/NORTE_2020.gpkg \
  ../../data/raw/cana/NORTE_2020.shp \
  -sql "SELECT Provincia, Cantn, Distrito FROM NORTE_2020"
ogr2ogr \
  ../../data/interim/capas-archivos-vectoriales/GUANACASTE_E_2020.gpkg \
  ../../data/raw/cana/GUANACASTE_E_2020.shp \
  -sql "SELECT Provincia, Cantn, Distrito FROM GUANACASTE_E_2020"
ogr2ogr \
  ../../data/interim/capas-archivos-vectoriales/GUANACASTE_O_2020.gpkg \
  ../../data/raw/cana/GUANACASTE_O_2020.shp \
  -sql "SELECT Provincia, Cantn, Distrito FROM GUANACASTE_O_2020"
ogr2ogr \
  ../../data/interim/capas-archivos-vectoriales/TURRIALBA_2020.gpkg \
  ../../data/raw/cana/TURRIALBA_2020.shp \
  -sql "SELECT Provincia, Cantn, Distrito FROM TURRIALBA_2020"
ogr2ogr \
  "../../data/interim/capas-archivos-vectoriales/VALLE CENTRAL_2020.gpkg" \
  "../../data/raw/cana/VALLE CENTRAL_2020.shp" \
  -sql "SELECT Provincia, Cantn, Distrito FROM \"VALLE CENTRAL_2020\""
ogr2ogr \
  ../../data/interim/capas-archivos-vectoriales/PUNTARENAS_2020.gpkg \
  ../../data/raw/cana/PUNTARENAS_2020.shp \
  -sql "SELECT Provincia, Cantn, Distrito FROM PUNTARENAS_2020"
ogr2ogr \
  ../../data/interim/capas-archivos-vectoriales/SUR_2020.gpkg \
  ../../data/raw/cana/SUR_2020.shp \
  -sql "SELECT Provincia, Cantn, Distrito FROM SUR_2020"
  
# Unión de los archivos
ogr2ogr \
  ../../data/interim/capas-archivos-vectoriales/cana_2020.gpkg \
  ../../data/interim/capas-archivos-vectoriales/NORTE_2020.gpkg -nln cana_2020
ogr2ogr -update -append \
  ../../data/interim/capas-archivos-vectoriales/cana_2020.gpkg \
  ../../data/interim/capas-archivos-vectoriales/GUANACASTE_E_2020.gpkg \
  -nln cana_2020
ogr2ogr -update -append \
  ../../data/interim/capas-archivos-vectoriales/cana_2020.gpkg \
  ../../data/interim/capas-archivos-vectoriales/GUANACASTE_O_2020.gpkg \
  -nln cana_2020
ogr2ogr -update -append \
  ../../data/interim/capas-archivos-vectoriales/cana_2020.gpkg \
  ../../data/interim/capas-archivos-vectoriales/TURRIALBA_2020.gpkg \
  -nln cana_2020
ogr2ogr -update -append \
  ../../data/interim/capas-archivos-vectoriales/cana_2020.gpkg \
  "../../data/interim/capas-archivos-vectoriales/VALLE CENTRAL_2020.gpkg" \
  -nln cana_2020
ogr2ogr -update -append \
  ../../data/interim/capas-archivos-vectoriales/cana_2020.gpkg \
  ../../data/interim/capas-archivos-vectoriales/PUNTARENAS_2020.gpkg \
  -nln cana_2020
ogr2ogr -update -append \
  ../../data/interim/capas-archivos-vectoriales/cana_2020.gpkg \
  ../../data/interim/capas-archivos-vectoriales/SUR_2020.gpkg \
  -nln cana_2020
  
 # Borrado de los archivos temporales
 rm ../../data/interim/capas-archivos-vectoriales/NORTE_2020.gpkg
 rm ../../data/interim/capas-archivos-vectoriales/GUANACASTE_E_2020.gpkg
 rm ../../data/interim/capas-archivos-vectoriales/GUANACASTE_O_2020.gpkg
 rm ../../data/interim/capas-archivos-vectoriales/TURRIALBA_2020.gpkg
 rm "../../data/interim/capas-archivos-vectoriales/VALLE CENTRAL_2020.gpkg"
 rm ../../data/interim/capas-archivos-vectoriales/PUNTARENAS_2020.gpkg
 rm ../../data/interim/capas-archivos-vectoriales/SUR_2020.gpkg
