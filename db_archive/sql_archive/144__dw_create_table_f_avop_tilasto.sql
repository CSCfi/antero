IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='f_avop_tilasto') BEGIN

CREATE TABLE dw.f_avop_tilasto (
  id int IDENTITY(1,1) NOT NULL,
  loadtime datetime NOT NULL,
  username varchar(30) NOT NULL,
  source varchar(100) NOT NULL,

  d_organisaatio_id int not null,
  d_koulutusluokitus_id int not null,
  d_kieli_id int not null,
  d_alueluokitus_id int not null,
  d_kalenteri_id int not null,

  koulutusmuoto varchar(20) null,

  kysymysryhma_fi nvarchar(max) null,
  kysymysryhma_sv nvarchar(max) null,
  kysymysryhma_en nvarchar(max) null,

  kysely_fi nvarchar(max) null,
  kysely_sv nvarchar(max) null,
  kysely_en nvarchar(max) null,

  kysymys_fi nvarchar(500) null,
  kysymys_sv nvarchar(500) null,
  kysymys_en nvarchar(500) null,

  kyselykerta nvarchar(200) null,

  vastaustyyppi varchar(50) null,
  vaihtoehto varchar(10) null,
  monivalintavaihtoehto nvarchar(max) null,
  numerovalinta varchar(10) null,

  taustakysymys_ika nvarchar(50) null,
  taustakysymys_sukupuoli nvarchar(50) null,
  taustakysymys_pohjakoulutus nvarchar(100) null,

  lukumaara int not null
)
;

ALTER TABLE dw.f_avop_tilasto ADD  CONSTRAINT PK__f_avop_tilasto PRIMARY KEY CLUSTERED (id ASC)
;

ALTER TABLE dw.f_avop_tilasto ADD  CONSTRAINT DF__f_avop_tilasto__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dw.f_avop_tilasto ADD  CONSTRAINT DF__f_avop_tilasto__username  DEFAULT (suser_sname()) FOR username
;

END
