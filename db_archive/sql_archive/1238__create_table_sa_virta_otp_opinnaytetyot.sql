-- Opinnäytetyöt

-- IF EXISTS (
  -- select * from INFORMATION_SCHEMA.TABLES
  -- where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_otp_opinnaytetyot'
-- ) BEGIN
-- DROP TABLE sa.sa_virta_otp_opinnaytetyot
-- END

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_otp_opinnaytetyot'
) BEGIN

CREATE TABLE sa.sa_virta_otp_opinnaytetyot(
  
  id bigint IDENTITY(1,1) NOT NULL,   
  
  eihankeistettuja int NULL,
  hankeistettuja int NULL,
  kk varchar(12) NULL,
  koulutustyyppi smallint NULL,
  ohjausala smallint NULL,
  organisaatio varchar(5) NULL,
  vuosi int NULL,

  loadtime datetime2(4) NOT NULL,
  source nvarchar(255) NULL,
  username nvarchar(128) NOT NULL,
  CONSTRAINT PK__sa_virta_otp_opinnaytetyot PRIMARY KEY CLUSTERED (id ASC)
)
;

ALTER TABLE sa.sa_virta_otp_opinnaytetyot ADD  CONSTRAINT DF__sa_virta_otp_opinnaytetyot__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.sa_virta_otp_opinnaytetyot ADD  CONSTRAINT DF__sa_virta_otp_opinnaytetyot__username  DEFAULT (suser_name()) FOR username
;

END
