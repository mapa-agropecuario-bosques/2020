gdal_translate -co compress=zstd -co zstd_level=9 \
  ../salidas/uso-agropecuario-bosques-2020.tif \
  ../salidas/uso-agropecuario-bosques-2020-comprimido.tif
rm ../salidas/uso-agropecuario-bosques-2020.tif

gdal_translate -co compress=zstd -co zstd_level=9 \
  ../salidas/uso-agropecuario-bosques-2020-reclasificado.tif \
  ../salidas/uso-agropecuario-bosques-2020-reclasificado-comprimido.tif
rm ../salidas/uso-agropecuario-bosques-2020-reclasificado.tif
