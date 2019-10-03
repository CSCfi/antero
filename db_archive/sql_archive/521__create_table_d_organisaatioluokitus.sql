-- nb! this dimension kind of exists already with different name but it is
-- based on so different dataset that renewing it entirely is needed
IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='dw' and TABLE_NAME='d_organisaatioluokitus'
)
BEGIN

CREATE TABLE dw.d_organisaatioluokitus (
  id bigint IDENTITY(1,1) NOT NULL,
  loadtime datetime NOT NULL,
  username nvarchar(128) NOT NULL,
  source nvarchar(255) NULL,
  organisaatio_avain varchar(50) NOT NULL,
  organisaatio_koodi varchar(20) NULL,
  organisaatio_fi nvarchar(255) NULL,
  organisaatio_sv nvarchar(255) NULL,
  organisaatio_en nvarchar(255) NULL,
  -- oppilaitostyyppi
  oppilaitostyyppi_koodi varchar(5) NULL,
  oppilaitostyyppi_fi nvarchar(120) NULL,
  oppilaitostyyppi_sv nvarchar(120) NULL,
  oppilaitostyyppi_en nvarchar(120) NULL,
  --additional features
  oppilaitoksenopetuskieli_koodi varchar(5) NULL,
  oppilaitoksenopetuskieli_fi nvarchar(120) NULL,
  oppilaitoksenopetuskieli_sv nvarchar(120) NULL,
  oppilaitoksenopetuskieli_en nvarchar(120) NULL,
  organisaatio_oid varchar(200) null,
  liitosorganisaatio_oid varchar(200) null,
  ylaorganisaatio_oid varchar(200) null,
  
  kunta_koodi varchar(5) null,

  osoitetyyppi varchar(20) null,
  katuosoite nvarchar(500) null,
  postinumero varchar(5) null,
  postitoimipaikka nvarchar(200) null,

  latitude varchar(30) null,
  longitude varchar(30) null,

  CONSTRAINT PK__d_organisaatioluokitus PRIMARY KEY CLUSTERED (id ASC),
  -- nb! extra unique constraint for business key column
  CONSTRAINT AK__d_organisaatioluokitus_organisaatio_avain UNIQUE NONCLUSTERED (organisaatio_avain ASC)
)

ALTER TABLE dw.d_organisaatioluokitus ADD  CONSTRAINT DF__d_organisaatioluokitus__loadtime  DEFAULT (getdate()) FOR loadtime

ALTER TABLE dw.d_organisaatioluokitus ADD  CONSTRAINT DF__d_organisaatioluokitus__username  DEFAULT (suser_name()) FOR username

END --table exists
/* revert
drop table dw.d_organisaatioluokitus
--*/
