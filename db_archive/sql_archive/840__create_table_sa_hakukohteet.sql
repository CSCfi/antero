IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_hakukohteet'
)
BEGIN

CREATE TABLE sa.sa_hakukohteet(
  id bigint IDENTITY(1,1) NOT NULL,
  loadtime datetime2(4) NOT NULL,
  source nvarchar(255) NULL,
  username nvarchar(128) NOT NULL,

  HenkiloID bigint NULL,
  HenkiloOID varchar(200) NULL,
  KotikuntaKoodi varchar(30) NULL,
  SukupuoliKoodi varchar(10) NULL,
  AidinkieliKoodi varchar(10) NULL,
  Ika int NULL,
  Ensikertalainen int NULL,
  KansalaisuusKoodi int NULL,
  OrganisaatioOID varchar(200) NULL,
  KoulutusToimijaOID varchar(200) NULL,
  OppilaitosOID varchar(200) NULL,
  ToimipisteOID varchar(200) NULL,
  OrganisaationKuntaKoodi varchar(30) NULL,
  Luokkataso varchar(20) NULL,
  Paattotodistuksenvuosi int NULL,
  PaattotodistuksenvuosiKK int NULL,
  HakukohdeOID varchar(200) NULL,
  HakutoiveNumero int NULL,
  EnsisijainenHakutoiveOrgID varchar(200) NULL,
  hakukohteen_tutkinnon_taso_kk_sykli nvarchar(100) NULL,
  hakukohteen_tutkinnon_taso_kk nvarchar(100) NULL,
  PohjakoulutusKoodi varchar(30) NULL,
  PohjakoulutusKKKoodi varchar(30) NULL,
  PohjakoulutuKKLomakeKoodi varchar(30) NULL,
  ValinnanTila varchar(30) NULL,
  VastaanotonTila varchar(30) NULL,
  IlmoittautumisenTila varchar(30) NULL,
  PohjakoulutusvaatimusKoodi varchar(30) NULL,
  HakuOid varchar(200) NULL,
  HakuaikaNimi varchar(200) NULL,
  HakemusOid varchar(200) NULL,
  Hakukelpoisuus varchar(30) NULL,
  KiinnostunutOppisopimuksesta int NULL,
  PohjakoulutuksenMaaKoodi varchar(200) NULL,
  Jatkotutkintohaku varchar(30) NULL,
  koulutusaste varchar(30) NULL

  CONSTRAINT PK__sa_hakukohteet PRIMARY KEY CLUSTERED (id ASC)
)

ALTER TABLE sa.sa_hakukohteet ADD  CONSTRAINT DF__sa_hakukohteet__loadtime  DEFAULT (getdate()) FOR loadtime
ALTER TABLE sa.sa_hakukohteet ADD  CONSTRAINT DF__sa_hakukohteet__username  DEFAULT (suser_name()) FOR username

END
