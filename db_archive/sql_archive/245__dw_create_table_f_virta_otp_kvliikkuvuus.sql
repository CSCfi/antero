IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='f_virta_otp_kvliikkuvuus') BEGIN

CREATE TABLE dw.f_virta_otp_kvliikkuvuus(
  id int IDENTITY(1,1) NOT NULL,
  loadtime datetime NOT NULL,
  username varchar(30) NOT NULL,
  source varchar(100) NOT NULL,
  
  d_opiskeluoikeudentyyppi_id int NOT NULL, --dimension sisältö? cimo tiedonkeruu opintoaste ja koultyp?
  d_organisaatio_id int NOT NULL,
  d_ohjauksenala_id int NOT NULL,
  d_koulutusluokitus_id int NOT NULL,
  d_sukupuoli_id int NOT NULL,
  d_liikkuvuudentyyppi_id int NOT NULL,
  d_lahtomaa_id int NOT NULL, --maatjavaltiot2
  d_kohdemaa_id int NOT NULL, --maatjavaltiot2
  d_kansalaisuus_id int NOT NULL, --maatjavaltiot2
  d_liikkuvuusohjelma_id int NOT NULL,
  opiskelijaavain nvarchar(100) NULL,
  opiskeluoikeusavain nvarchar(100) NULL,
  liikkuvuusjaksoavain nvarchar(100) NULL,
  jaksoAlkupvm date null,
  jaksoLoppupvm date null,
  kesto varchar(4) NULL,
  
  lukumaara int NOT NULL,
  
  CONSTRAINT PK__f_virta_otp_kvliikkuvuus PRIMARY KEY CLUSTERED (id)
)

ALTER TABLE dw.f_virta_otp_kvliikkuvuus ADD  CONSTRAINT DF__f_virta_otp_kvliikkuvuus__loadtime  DEFAULT (getdate()) FOR loadtime

ALTER TABLE dw.f_virta_otp_kvliikkuvuus ADD  CONSTRAINT DF__f_virta_otp_kvliikkuvuus__username  DEFAULT (suser_sname()) FOR username

END
