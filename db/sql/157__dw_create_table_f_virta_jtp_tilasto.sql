IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='f_virta_jtp_tilasto') BEGIN

CREATE TABLE dw.f_virta_jtp_tilasto(
  id int IDENTITY(1,1) NOT NULL,
  loadtime datetime NOT NULL,
  username varchar(30) NOT NULL,
  source varchar(100) NOT NULL,

  d_sektori_id int not null,
  d_organisaatio_id int not null,
  d_julkaisufoorumitaso_id int not null,
  -- luokitteluna:
  -- · Julkaisun pääluokka (A, B, C, D, E)
  -- · Julkaisutyyppi (A1, A2 jne.)
  d_julkaisutyyppi_id int not null,
  d_julkaisun_kansainvalisyys_id int not null,
  d_kansainvalinen_yhteisjulkaisu_id int not null,
  -- luokitteluna:
  -- · Päätieteenala
  -- · Tieteenala
  d_tieteenala_id int not null,
  tilastovuosi int not null,

  lukumaara int not null
)
;

ALTER TABLE dw.f_virta_jtp_tilasto ADD  CONSTRAINT PK__f_virta_jtp_tilasto PRIMARY KEY CLUSTERED (id ASC)
;

ALTER TABLE dw.f_virta_jtp_tilasto ADD  CONSTRAINT DF__f_virta_jtp_tilasto__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dw.f_virta_jtp_tilasto ADD  CONSTRAINT DF__f_virta_jtp_tilasto__username  DEFAULT (suser_sname()) FOR username
;

-- foreign keys
-- TODO

END
