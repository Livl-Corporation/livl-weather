LOAD DATA LOCAL INFILE '../data/forecasts.csv' INTO TABLE Forecast FIELDS TERMINATED BY ";" LINES TERMINATED BY "\n" IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '../data/regions.csv' INTO TABLE Region FIELDS TERMINATED BY ";" LINES TERMINATED BY "\n" IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '../data/regions-adjacent.csv' INTO TABLE AdjacentRegion FIELDS TERMINATED BY ";" LINES TERMINATED BY "\n" IGNORE 1 LINES;
LOAD DATA LOCAL INFILE '../data/stations.csv' INTO TABLE Station FIELDS TERMINATED BY ";" LINES TERMINATED BY "\n" IGNORE 1 LINES;