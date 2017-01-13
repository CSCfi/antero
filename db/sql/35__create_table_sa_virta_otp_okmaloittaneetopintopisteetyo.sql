IF NOT EXISTS (
    select * from INFORMATION_SCHEMA.TABLES
    where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_otp_okmaloittaneetopintopisteetyo'
) BEGIN

CREATE TABLE sa.sa_virta_otp_okmaloittaneetopintopisteetyo(
  id bigint IDENTITY(1,1) NOT NULL,

  kk varchar(2) null,
  fuksi varchar(2) NULL,
  olosyys varchar(2) NULL,
  kirtu varchar(5) NULL,
  opoik varchar(5) NULL,
  koulk varchar(6) NULL,
  opsyksy int NULL,
  opiskelijaavain nvarchar(100) NULL,
  opiskeluoikeusavain nvarchar(100) NULL,
  opiskelijaId bigint NULL,
  opiskeluoikeusId bigint NULL,
  luoja nvarchar(255) NULL,
  luontipaivamaara bigint null, --date
  
  loadtime datetime2(4) NOT NULL,
  source nvarchar(255) NULL,
  username nvarchar(128) NOT NULL,
  CONSTRAINT PK__sa_virta_otp_okmaloittaneetopintopisteetyo PRIMARY KEY CLUSTERED (id ASC)
)
;

ALTER TABLE sa.sa_virta_otp_okmaloittaneetopintopisteetyo
  ADD CONSTRAINT DF__sa_virta_otp_okmaloittaneetopintopisteetyo__loadtime
  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.sa_virta_otp_okmaloittaneetopintopisteetyo
  ADD CONSTRAINT DF__sa_virta_otp_okmaloittaneetopintopisteetyo__username
  DEFAULT (suser_name()) FOR username
;

END
