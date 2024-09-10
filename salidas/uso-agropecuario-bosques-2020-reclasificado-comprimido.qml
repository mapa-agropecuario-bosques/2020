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
				<paletteEntry alpha="255" color="#f80000" value="1"  label="Red vial"/>
				<paletteEntry alpha="255" color="#afffaf" value="2"  label="Áreas Silvestres Protegidas"/>
				<paletteEntry alpha="255" color="#b4e6fa" value="3"  label="Humedales"/>
				<paletteEntry alpha="255" color="#cdcd64" value="4"  label="Patrimonio Natural del Estado"/>
				<paletteEntry alpha="255" color="#ffaa00" value="5"  label="Caña"/>
				<paletteEntry alpha="255" color="#f0f000" value="6"  label="Banano"/>
				<paletteEntry alpha="255" color="#732600" value="7"  label="Café"/>
				<paletteEntry alpha="255" color="#ffffa6" value="8"  label="Pasto"/>
				<paletteEntry alpha="255" color="#ffa114" value="9"  label="Palma"/>
				<paletteEntry alpha="255" color="#ff5000" value="10" label="Piña"/>
				<paletteEntry alpha="255" color="#becd00" value="11" label="Cultivos"/>
				<paletteEntry alpha="255" color="#64ff96" value="12" label="Páramo"/>
				<paletteEntry alpha="255" color="#266900" value="13" label="Cobertura forestal"/>
				<paletteEntry alpha="255" color="#dcdcdc" value="14" label="Suelo desnudo"/>
				<paletteEntry alpha="255" color="#f6d9df" value="15" label="Zonas urbanas"/>												
				<paletteEntry alpha="255" color="#ffffff" value="16" label="Sin información"/>								
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
