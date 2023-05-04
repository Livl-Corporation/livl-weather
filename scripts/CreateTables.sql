CREATE DATABASE Weather;

CREATE TABLE Region (
    regionId INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE Station (
    stationId INT PRIMARY KEY,
    name VARCHAR(255),
    latitude FLOAT,
    longitude FLOAT,
    altitude FLOAT,
    region INT,
    FOREIGN KEY (region) REFERENCES Region(regionId)
);

CREATE TABLE Code4677 (
    code INT PRIMARY KEY,
    description VARCHAR(255)
);

CREATE TABLE Forecast (
    stationId INT,
    date DATE,
    windDirection FLOAT,
    windSpeed FLOAT,
    humidity FLOAT,
    visibility FLOAT,
    seaPressure FLOAT,
    stationPressure FLOAT,
    barometer FLOAT,
    temperature FLOAT,
    minTemperature FLOAT,
    maxTemperature FLOAT,
    groundLayerHeight FLOAT,
    precipitation FLOAT,
    code4677 INT,
    PRIMARY KEY (stationId, date),
    FOREIGN KEY (stationId) REFERENCES Station(stationId),
    FOREIGN KEY (code4677) REFERENCES Code4677(code)
);

CREATE TABLE AdjacentRegion (
    regionId INT,
    adjacentRegionId INT,
    PRIMARY KEY (regionId, adjacentRegionId),
    FOREIGN KEY (regionId) REFERENCES Region(regionId),
    FOREIGN KEY (adjacentRegionId) REFERENCES Region(regionId)
);