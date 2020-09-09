# CorrelAid X Challenge Bremen

This shiny app visualizes how many people have been commuting between states and districts in Germany. Data source: Bundesagentur für Arbeit; access via the [datenguidepy](https://github.com/CorrelAid/datenguide-python) package.

This is an entry for the CorrelAidX Challenge 2020 by CorrelAidX Bremen.


## Link to Online App

[App on shinyapps.io](https://long39ng.shinyapps.io/pendlerstat_de/)

## Running the App on your computer


## How to use

With our application you can gain insights into commuting behaviour in Germany, both on the level of "Länder" (NUTS-1) and "Kreise" (NUTS-3). You can visualize data as sortable tables with bar plots or presented as a map (zoomable for NUTS-3).  

<img alt="Show data as a table" src="./screenshots/datenguide_n1tab.png" width="500"> 
<img alt="Show data in a map" src="screenshots/datenguide_n1map.png" width="500">

For NUTS-1 there is also a time-series graph available.  

<img alt="Show data as time series" src="screenshots/datenguide_n1time.png" width="500">

The panel on the left lets you choose  
… a year between 2011 and 2019 for which numbers are shown  
… whether to show commuter inflow, outflow, or balance  
… whether numbers are absolute or in proportion to the regions populations  
… and if you like to download the data as a .csv-file.  

<img alt="Screenshot of the Shiny app's left sidebar" src="./screenshots/datenguide_leftpanel.png" width="300">  

You can also download the maps as images in different file formats.

<img alt="Download maps as images" src="./screenshots/datenguide_n3mapexportpng.png" width="500">
