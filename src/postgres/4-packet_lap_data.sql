CREATE TABLE IF NOT EXISTS PacketLapData (
   ID                         uuid DEFAULT uuid_generate_v4 (),
   PacketHeader_ID            uuid NOT NULL,
   CreatedOn                  TIMESTAMPTZ DEFAULT NOW(),

   PRIMARY KEY (ID),
   FOREIGN KEY (PacketHeader_ID)
      REFERENCES PacketHeader (ID)
);

CREATE TABLE IF NOT EXISTS LapData (
  ID                          uuid DEFAULT uuid_generate_v4 (),
  PacketLapData_ID            uuid NOT NULL,
  LastLapTime                 FLOAT NOT NULL,
  CurrentLapTime              FLOAT NOT NULL,
  Sector1TimeInMS             INT NOT NULL,
  Sector2TimeInMS             INT NOT NULL,
  BestLapTime                 FLOAT NOT NULL,
  BestLapNum                  INT NOT NULL,
  BestLapSector1TimeInMS      INT NOT NULL,
  BestLapSector2TimeInMS      INT NOT NULL,
  BestLapSector3TimeInMS      INT NOT NULL,
  BestOverallSector1TimeInMS  INT NOT NULL,
  BestOverallSector1LapNum    INT NOT NULL,
  BestOverallSector2TimeInMS  INT NOT NULL,
  BestOverallSector2LapNum    INT NOT NULL,
  BestOverallSector3TimeInMS  INT NOT NULL,
  BestOverallSector3LapNum    INT NOT NULL,
  LapDistance                 FLOAT NOT NULL,
  TotalDistance               FLOAT NOT NULL,
  SafetyCarDelta              FLOAT NOT NULL,
  CarPosition                 INT NOT NULL,
  CurrentLapNum               FLOAT NOT NULL,
  PitStatus                   FLOAT NOT NULL,
  Sector                      FLOAT NOT NULL,
  CurrentLapInvalid           FLOAT NOT NULL,
  Penalties                   FLOAT NOT NULL,
  GridPosition                FLOAT NOT NULL,
  DriverStatus                FLOAT NOT NULL,
  ResultStatus                FLOAT NOT NULL,
  CreatedOn                   TIMESTAMPTZ DEFAULT NOW(),

  PRIMARY KEY (ID),
   FOREIGN KEY (PacketLapData_ID)
      REFERENCES PacketLapData (ID)      
);

CREATE OR REPLACE PROCEDURE insert_packet_lap_data("ID" uuid, "PacketHeader_ID" uuid)
LANGUAGE 'plpgsql'
AS $BODY$
	BEGIN
		INSERT INTO PacketLapData 
		VALUES ("ID", "PacketHeader_ID");
	END;
$BODY$;

CREATE OR REPLACE PROCEDURE insert_lap_data("ID" uuid, "PacketLapData_ID" uuid, "LastLapTime" double precision, "CurrentLapTime" double precision, "Sector1TimeInMS" integer, "Sector2TimeInMS" integer, "BestLapTime" double precision, "BestLapNum" integer, "BestLapSector1TimeInMS" integer, "BestLapSector2TimeInMS" integer, "BestLapSector3TimeInMS" integer, "BestOverallSector1TimeInMS" integer, "BestOverallSector1LapNum" integer, "BestOverallSector2TimeInMS" integer, "BestOverallSector2LapNum" integer, "BestOverallSector3TimeInMS" integer, "BestOverallSector3LapNum" integer, "LapDistance" double precision, "TotalDistance" double precision, "SafetyCarDelta" double precision, "CarPosition" integer, "CurrentLapNum" double precision, "PitStatus" double precision, "Sector" double precision, "CurrentLapInvalid" double precision, "Penalties" double precision, "GridPosition" double precision, "DriverStatus" double precision, "ResultStatus" double precision)
LANGUAGE 'plpgsql'
AS $BODY$
	BEGIN
		INSERT INTO LapData 
		VALUES ("ID", "PacketLapData_ID", "LastLapTime", "CurrentLapTime", "Sector1TimeInMS", "Sector2TimeInMS", "BestLapTime", "BestLapNum", "BestLapSector1TimeInMS", "BestLapSector2TimeInMS", "BestLapSector3TimeInMS", "BestOverallSector1TimeInMS", "BestOverallSector1LapNum", "BestOverallSector2TimeInMS", "BestOverallSector2LapNum", "BestOverallSector3TimeInMS", "BestOverallSector3LapNum", "LapDistance", "TotalDistance", "SafetyCarDelta", "CarPosition", "CurrentLapNum", "PitStatus", "Sector", "CurrentLapInvalid", "Penalties", "GridPosition", "DriverStatus", "ResultStatus");
	END;
$BODY$;
