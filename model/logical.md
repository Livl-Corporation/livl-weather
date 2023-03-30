# Logical Data Model

`Forecast`(<u>stationId</u><sub>FK</sub>, <u>date</u>, windDirection, windSpeed, humidity, visibility, seaPressure, stationPressure, barometer, temperature, minTemperature, maxTemperature, groundLayerHeight, precipitation, code4677<sub>FK</sub>)

`Station`(<u>stationId</u>, name, latitude, longitude, altitude, region<sub>FK</sub>)

`Region`(<u>regionId</u>, name)

`AdjacentRegion`(<u>regionId</u><sub>FK</sub>, <u>adjacentRegionId</u><sub>FK</sub>)

`Code4677`(<u>code</u>, description)

> Check out our [Conceptual Data Model](conceptual.puml) for more information about the data model.