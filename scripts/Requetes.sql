-- a) Liste de températures de la station n° 7005
SELECT temperature 
FROM Forecast 
WHERE stationId = 7005;

-- b) Tmin, Tmax pour la station n° 7577 pour la date d'hier
SELECT minTemperature AS Tmin, maxTemperature AS Tmax 
FROM Forecast 
WHERE stationId = 7577 AND DATE(date) = DATE(DATE_SUB(NOW(), INTERVAL 1 DAY));

-- c) Description du temps pour la station n° 7643, pour le 20/10/2018 à 18H
SELECT code4677.description 
FROM Forecast 
JOIN Code4677 ON Forecast.code4677 = Code4677.code 
WHERE stationId = 7643 AND date = '2018-10-20 18:00:00';

-- d) Nombre de stations dans la base
SELECT COUNT(*) AS "Nombre de stations" 
FROM Station;

-- e) Températures et pressions de la semaine pour Strasbourg-Entzheim
SELECT date, temperature, stationPressure 
FROM Forecast 
JOIN Station ON Forecast.stationId = Station.stationId 
WHERE Station.name = 'Strasbourg-Entzheim' AND date >= DATE_SUB(NOW(), INTERVAL 7 DAY);

-- f) Température moyenne de la semaine par n° de station
SELECT stationId, AVG(temperature) AS "Température moyenne" 
FROM Forecast 
WHERE date >= DATE_SUB(NOW(), INTERVAL 7 DAY) 
GROUP BY stationId;

-- g) Température moyenne et pression moyenne de la semaine par nom de station
SELECT Station.name, AVG(temperature) AS "Température moyenne", AVG(stationPressure) AS "Pression moyenne" 
FROM Forecast 
JOIN Station ON Forecast.stationId = Station.stationId 
WHERE date >= DATE_SUB(NOW(), INTERVAL 7 DAY) 
GROUP BY Station.name;

-- h) Date/heure, nom de la station et direction du vent en lettres pour tous les relevés
SELECT date, Station.name, 
  CASE 
    WHEN windDirection BETWEEN 0 AND 22.5 OR windDirection BETWEEN 337.5 AND 360 THEN 'N'
    WHEN windDirection BETWEEN 22.5 AND 67.5 THEN 'NE'
    WHEN windDirection BETWEEN 67.5 AND 112.5 THEN 'E'
    WHEN windDirection BETWEEN 112.5 AND 157.5 THEN 'SE'
    WHEN windDirection BETWEEN 157.5 AND 202.5 THEN 'S'
    WHEN windDirection BETWEEN 202.5 AND 247.5 THEN 'SW'
    WHEN windDirection BETWEEN 247.5 AND 292.5 THEN 'W'
    WHEN windDirection BETWEEN 292.5 AND 337.5 THEN 'NW'
  END AS "Direction du vent" 
FROM Forecast 
JOIN Station ON Forecast.stationId = Station.stationId;

-- i) Date et nom de la station avec des valeurs manquantes
SELECT date, Station.name 
FROM Forecast 
JOIN Station ON Forecast.stationId = Station.stationId 
WHERE windDirection IS NULL OR windSpeed IS NULL OR humidity IS NULL OR visibility IS NULL OR seaPressure IS NULL OR stationPressure IS NULL OR barometer IS NULL OR temperature IS NULL OR minTemperature IS NULL OR maxTemperature IS NULL OR groundLayerHeight IS NULL OR precipitation IS NULL OR code4677 IS NULL;

-- j) Moyenne de température par région
SELECT Region.name, AVG(Forecast.temperature) AS "Température moyenne" 
FROM Forecast 
JOIN Station ON Forecast.stationId = Station.stationId 
JOIN Region ON Station.region = Region.regionId 
GROUP BY Region.name;

-- k) Région la plus chaude et la plus froide
SELECT Region.name, AVG(Forecast.temperature) AS "Température moyenne" 
FROM Forecast 
JOIN Station ON Forecast.stationId = Station.stationId 
JOIN Region ON Station.region = Region.regionId 
GROUP BY Region.name 
ORDER BY AVG(Forecast.temperature) DESC LIMIT 1; -- région la plus chaude

SELECT Region.name, AVG(Forecast.temperature) AS "Température moyenne" 
FROM Forecast 
JOIN Station ON Forecast.stationId = Station.stationId 
JOIN Region ON Station.region = Region.regionId 
GROUP BY Region.name 
ORDER BY AVG(Forecast.temperature) ASC LIMIT 1; -- région la plus froide

-- m) Régions limitrophes à Grand Est
SELECT r2.name 
FROM Region r1 
JOIN AdjacentRegion ON r1.regionId = AdjacentRegion.regionId 
JOIN Region r2 ON AdjacentRegion.adjacentRegionId = r2.regionId 
WHERE r1.name = 'Grand Est';

-- n) Région avec le plus de voisins
SELECT r1.name, COUNT(*) AS "Nombre de voisins"
FROM Region r1 
JOIN AdjacentRegion ON r1.regionId = AdjacentRegion.regionId 
GROUP BY r1.name 
ORDER BY COUNT(*) DESC LIMIT 1;

-- o) Stations où Tmax < température moyenne nationale
SELECT Station.name, MAX(Forecast.temperature) AS "Température maximale", AVG(Forecast.temperature) AS "Température moyenne nationale"
FROM Forecast 
JOIN Station ON Forecast.stationId = Station.stationId 
GROUP BY Station.name 
HAVING MAX(Forecast.temperature) < (SELECT AVG(Forecast.temperature) FROM Forecast);

-- p) Stations où il a plu toute la journée
SELECT date, Station.name 
FROM Forecast 
JOIN Station ON Forecast.stationId = Station.stationId 
WHERE precipitation >= 24;