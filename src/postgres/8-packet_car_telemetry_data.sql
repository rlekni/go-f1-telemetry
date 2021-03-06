CREATE TABLE IF NOT EXISTS PacketCarTelemetryData (
   ID                           uuid DEFAULT uuid_generate_v4 (),
   PacketHeader_ID              uuid NOT NULL,
   ButtonStatus                 INT NOT NULL,
   MfdPanelIndex                INT NOT NULL,
   MfdPanelIndexSecondaryPlayer INT NOT NULL,
   SuggestedGear                INT NOT NULL,
   CreatedOn                    TIMESTAMPTZ DEFAULT NOW(),

   PRIMARY KEY (ID),
   FOREIGN KEY (PacketHeader_ID)
      REFERENCES PacketHeader (ID)
);

CREATE TABLE IF NOT EXISTS CarTelemetryData (
   ID                         uuid DEFAULT uuid_generate_v4 (),
   PacketCarTelemetryData_ID  uuid NOT NULL,
   Speed                      INT NOT NULL,
   Throttle                   FLOAT NOT NULL,
   Steer                      FLOAT NOT NULL,
   Brake                      FLOAT NOT NULL,
   Clutch                     INT NOT NULL,
   Gear                       INT NOT NULL,
   EngineRPM                  INT NOT NULL,
   Drs                        INT NOT NULL,
   RevLightsPercent           INT NOT NULL,
   BrakesTemperatureRL        INT NOT NULL,
   BrakesTemperatureRR        INT NOT NULL,
   BrakesTemperatureFL        INT NOT NULL,
   BrakesTemperatureFR        INT NOT NULL,
   TyresSurfaceTemperatureRL  INT NOT NULL,
   TyresSurfaceTemperatureRR  INT NOT NULL,
   TyresSurfaceTemperatureFL  INT NOT NULL,
   TyresSurfaceTemperatureFR  INT NOT NULL,
   TyresInnerTemperatureRL    INT NOT NULL,
   TyresInnerTemperatureRR    INT NOT NULL,
   TyresInnerTemperatureFL    INT NOT NULL,
   TyresInnerTemperatureFR    INT NOT NULL,
   EngineTemperature          INT NOT NULL,
   TyresPressureRL            FLOAT NOT NULL,
   TyresPressureRR            FLOAT NOT NULL,
   TyresPressureFL            FLOAT NOT NULL,
   TyresPressureFR            FLOAT NOT NULL,
   SurfaceTypeRL              INT NOT NULL,
   SurfaceTypeRR              INT NOT NULL,
   SurfaceTypeFL              INT NOT NULL,
   SurfaceTypeFR              INT NOT NULL,
   CreatedOn                  TIMESTAMPTZ DEFAULT NOW(),

   PRIMARY KEY (ID),
   FOREIGN KEY (PacketCarTelemetryData_ID)
      REFERENCES PacketCarTelemetryData (ID)
);

CREATE OR REPLACE PROCEDURE insert_packet_car_telemetry_data("ID" uuid, "PacketHeader_ID" uuid, "ButtonStatus" integer, "MfdPanelIndex" integer, "MfdPanelIndexSecondaryPlayer" integer, "SuggestedGear" integer)
LANGUAGE 'plpgsql'
AS $BODY$
	BEGIN
		INSERT INTO PacketCarTelemetryData 
		VALUES ("ID", "PacketHeader_ID", "ButtonStatus", "MfdPanelIndex", "MfdPanelIndexSecondaryPlayer", "SuggestedGear");
	END;
$BODY$;

CREATE OR REPLACE PROCEDURE insert_car_telemetry_data("ID" uuid, "PacketCarTelemetryData_ID" uuid, "Speed" integer, "Throttle" double precision, "Steer" double precision, "Brake" double precision, "Clutch" integer, "Gear" integer, "EngineRPM" integer, "Drs" integer, "RevLightsPercent" integer, "BrakesTemperatureRL" integer, "BrakesTemperatureRR" integer, "BrakesTemperatureFL" integer, "BrakesTemperatureFR" integer, "TyresSurfaceTemperatureRL" integer, "TyresSurfaceTemperatureRR" integer, "TyresSurfaceTemperatureFL" integer, "TyresSurfaceTemperatureFR" integer, "TyresInnerTemperatureRL" integer, "TyresInnerTemperatureRR" integer, "TyresInnerTemperatureFL" integer, "TyresInnerTemperatureFR" integer, "EngineTemperature" integer, "TyresPressureRL" double precision, "TyresPressureRR" double precision, "TyresPressureFL" double precision, "TyresPressureFR" double precision, "SurfaceTypeRL" integer, "SurfaceTypeRR" integer, "SurfaceTypeFL" integer, "SurfaceTypeFR" integer)
LANGUAGE 'plpgsql'
AS $BODY$
	BEGIN
		INSERT INTO CarTelemetryData 
		VALUES ("ID", "PacketCarTelemetryData_ID", "Speed", "Throttle", "Steer", "Brake", "Clutch", "Gear", "EngineRPM", "Drs", "RevLightsPercent", "BrakesTemperatureRL", "BrakesTemperatureRR", "BrakesTemperatureFL", "BrakesTemperatureFR", "TyresSurfaceTemperatureRL", "TyresSurfaceTemperatureRR", "TyresSurfaceTemperatureFL", "TyresSurfaceTemperatureFR", "TyresInnerTemperatureRL", "TyresInnerTemperatureRR", "TyresInnerTemperatureFL", "TyresInnerTemperatureFR", "EngineTemperature", "TyresPressureRL", "TyresPressureRR", "TyresPressureFL", "TyresPressureFR", "SurfaceTypeRL", "SurfaceTypeRR", "SurfaceTypeFL", "SurfaceTypeFR");
	END;
$BODY$;
