IF NOT EXISTS (
    select * from INFORMATION_SCHEMA.TABLES
    where TABLE_SCHEMA='dbo' and TABLE_NAME='sa_virta_otp_tkopiskamk'
) BEGIN

CREATE TABLE dbo.sa_virta_otp_tkopiskamk(
  id bigint IDENTITY(1,1) NOT NULL,

  enimi nvarchar(255) null,
  ht varchar(11) null,
  kkun varchar(3) null,
  koulk varchar(6) null,
  luoja nvarchar(255) null,
  luontipaivamaara bigint null, --date
  olosyys varchar(2) null,
  olotamm varchar(2) null,
  opek varchar(4) null,
  opes varchar(4) null,
  opiskelijaId bigint null,
  opiskelijaavain nvarchar(100) null,
  opiskeluoikeusId bigint null,
  opiskeluoikeusavain nvarchar(100) null,
  snimi nvarchar(255) null,
  opker varchar(4) null,
  sp varchar(2) null,

  aikieli varchar(2) null,
  askunta varchar(3) null,
  kansal varchar(3) null,
  kiel varchar(2) null,
  kirtu1pv varchar(8) null,
  kirtupv varchar(8) null,
  koultyp varchar(4) null,
  laajuus varchar(4) null,
  lasnalk varchar(4) null,
  lastu varchar(2) null,
  oikeusAlkamispaivamaara bigint null, --date
  oikeusPaattymispaivamaara bigint null, --date
  oikeusSiirtopaivamaara bigint null, --date
  poissalk varchar(4) null,
  rahlahde varchar(2) null,
  tunn varchar(5) null,

  loadtime datetime2(4) NOT NULL,
  source nvarchar(255) NULL,
  username nvarchar(128) NOT NULL,
  CONSTRAINT PK__sa_virta_otp_tkopiskamk PRIMARY KEY CLUSTERED (id ASC)
)
;

ALTER TABLE dbo.sa_virta_otp_tkopiskamk
  ADD CONSTRAINT DF__sa_virta_otp_tkopiskamk__loadtime
  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dbo.sa_virta_otp_tkopiskamk
  ADD CONSTRAINT DF__sa_virta_otp_tkopiskamk__username
  DEFAULT (suser_name()) FOR username
;

END
