<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" minScale="1e+08" maxScale="0" version="3.24.2-Tisler">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal enabled="0" mode="0" fetchMode="0">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <customproperties>
    <Option type="Map">
      <Option type="bool" name="WMSBackgroundLayer" value="false"/>
      <Option type="bool" name="WMSPublishDataSourceUrl" value="false"/>
      <Option type="int" name="embeddedWidgets/count" value="0"/>
      <Option type="QString" name="identify/format" value="Value"/>
    </Option>
  </customproperties>
  <pipe-data-defined-properties>
    <Option type="Map">
      <Option type="QString" name="name" value=""/>
      <Option name="properties"/>
      <Option type="QString" name="type" value="collection"/>
    </Option>
  </pipe-data-defined-properties>
  <pipe>
    <provider>
      <resampling zoomedInResamplingMethod="nearestNeighbour" enabled="false" zoomedOutResamplingMethod="nearestNeighbour" maxOversampling="2"/>
    </provider>
    <rasterrenderer type="paletted" opacity="1" band="1" alphaBand="-1" nodataColor="">
      <rasterTransparency/>
      <minMaxOrigin>
        <limits>None</limits>
        <extent>WholeRaster</extent>
        <statAccuracy>Estimated</statAccuracy>
        <cumulativeCutLower>0.02</cumulativeCutLower>
        <cumulativeCutUpper>0.98</cumulativeCutUpper>
        <stdDevFactor>2</stdDevFactor>
      </minMaxOrigin>
			<colorPalette>
				<paletteEntry alpha="255" color="#55ac26" value="51" label="REDD Bosques"/>
				<paletteEntry alpha="255" color="#ebafd8" value="52" label="REDD Cultivos anuales"/>
				<paletteEntry alpha="255" color="#f37b1f" value="53" label="REDD Cultivos permanentes"/>
				<paletteEntry alpha="255" color="#fbef0c" value="54" label="REDD Pastos"/>
				<paletteEntry alpha="255" color="#aab1b1" value="55" label="REDD Áreas urbanas"/>
				<paletteEntry alpha="255" color="#1b85e2" value="56" label="REDD Cuerpos de agua"/>
				<paletteEntry alpha="255" color="#7c2a62" value="57" label="REDD Páramos"/>
				<paletteEntry alpha="255" color="#db3220" value="58" label="REDD Suelos desnudos"/>
				<paletteEntry alpha="255" color="#2a291f" value="59" label="REDD Sin información"/>
				<paletteEntry alpha="255" color="#ffff99" value="1"  label="Cultivos"/>
				<paletteEntry alpha="255" color="#ffcc66" value="2"  label="Piña"/>
				<paletteEntry alpha="255" color="#ff9933" value="3"  label="Palma"/>
				<paletteEntry alpha="255" color="#99cc66" value="4"  label="Pastos"/>
				<paletteEntry alpha="255" color="#cc9933" value="5"  label="Café"/>
				<paletteEntry alpha="255" color="#ffff00" value="6"  label="Banano"/>
				<paletteEntry alpha="255" color="#ffccff" value="7"  label="Caña"/>
				<paletteEntry alpha="255" color="#006600" value="8"  label="Cobertura forestal"/>
				<paletteEntry alpha="255" color="#3399ff" value="9"  label="Patrimonio Natural del Estado"/>
				<paletteEntry alpha="255" color="#66ccff" value="10" label="Registro Nacional de Humedales"/>
				<paletteEntry alpha="255" color="#66cc99" value="11" label="Áreas Silvestres Protegidas"/>
			</colorPalette>
      <colorramp type="randomcolors" name="[source]">
        <Option/>
      </colorramp>
    </rasterrenderer>
    <brightnesscontrast contrast="0" brightness="0" gamma="1"/>
    <huesaturation colorizeGreen="128" invertColors="0" saturation="0" colorizeOn="0" colorizeRed="255" colorizeBlue="128" grayscaleMode="0" colorizeStrength="100"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
