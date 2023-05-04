
-- Créez une procédure stockée qui à partir d’un N° de station et une date/heure de début et une date/heure de fin renvoie l’ensemble des températures dans cet intervalle
DELIMITER //

CREATE PROCEDURE GetTemperaturesByStationAndDateRange(IN stationId INT, IN startDate DATETIME, IN endDate DATETIME)
BEGIN
  SELECT temperature 
  FROM Forecast
  WHERE stationId = stationId
  AND date BETWEEN startDate AND endDate;
END//

DELIMITER ;

-- b) Idem pour la pression ;
DELIMITER //

CREATE PROCEDURE GetPressuresByStationAndDateRange(IN stationId INT, IN startDate DATETIME, IN endDate DATETIME)
BEGIN
  SELECT stationPressure 
  FROM Forecast
  WHERE stationId = stationId
  AND date BETWEEN startDate AND endDate;
END//

DELIMITER ;

-- c) Idem pour Tmax et Tmin ;
DELIMITER //

CREATE PROCEDURE GetTmaxTminByStationAndDateRange(IN stationId INT, IN startDate DATETIME, IN endDate DATETIME)
BEGIN
  SELECT maxTemperature AS Tmax, minTemperature AS Tmin 
  FROM Forecast
  WHERE stationId = stationId
  AND date BETWEEN startDate AND endDate;
END//

DELIMITER ;


-- d) Idem pour Pmax et Pmin ;
DELIMITER //

CREATE PROCEDURE GetPmaxPminByStationAndDateRange(IN stationId INT, IN startDate DATETIME, IN endDate DATETIME)
BEGIN
  SELECT MAX(stationPressure) AS Pmax, MIN(stationPressure) AS Pmin
  FROM Forecast
  WHERE stationId = stationId
  AND date BETWEEN startDate AND endDate;
END//

DELIMITER ;
