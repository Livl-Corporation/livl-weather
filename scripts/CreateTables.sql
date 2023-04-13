CREATE TABLE `Forecast` (
  `stationId` INT NOT NULL,
  `date` DATE NOT NULL,
  `windDirection` INT(45) NULL,
  `windSpeed` FLOAT NULL,
  `humidity` INT NULL,
  `visibility` FLOAT NULL,
  `seaPressure` INT NULL,
  `stationPressure` INT NULL,
  `barometer` INT NULL,
  `temperature` FLOAT NULL,
  `minTemperature` FLOAT NULL,
  `maxTemperature` FLOAT NULL,
  `groundLayerHeight` FLOAT NULL,
  `precipitation` FLOAT NULL,
  `code4677` INT NOT NULL,
  PRIMARY KEY (`stationId`, `date`),
  CONSTRAINT `fk_Forecast_Code4677`
    FOREIGN KEY (`code4677`)
    REFERENCES `Code4677` (`code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Forecast_Station`
    FOREIGN KEY (`stationId`)
    REFERENCES `Station` (`stationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE `Station` (
  `stationId` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `latitude` FLOAT NULL,
  `longitude` FLOAT NULL,
  `altitude` FLOAT NULL,
  `region` INT NOT NULL,
  PRIMARY KEY (`stationId`),
  CONSTRAINT `fk_Station_Region`
    FOREIGN KEY (`region`)
    REFERENCES `Region` (`regionId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE `Region` (
  `regionId` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`regionId`)
);

CREATE TABLE `AdjacentRegion` (
  `regionId` INT NOT NULL,
  `adjacentRegionId` INT NOT NULL,
  PRIMARY KEY (`regionId`, `adjacentRegionId`),
  CONSTRAINT `fk_AdjacentRegion_Region1`
    FOREIGN KEY (`regionId`)
    REFERENCES `Region` (`regionId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AdjacentRegion_Region2`
    FOREIGN KEY (`adjacentRegionId`)
    REFERENCES `Region` (`regionId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE `Code4677` (
  `code` INT NOT NULL,
  `description` VARCHAR(45) NULL