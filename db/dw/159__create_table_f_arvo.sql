IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dbo' and TABLE_NAME='f_arvo') BEGIN

CREATE TABLE dbo.f_arvo(
  id int IDENTITY(1,1) NOT NULL,
  loadtime datetime NOT NULL,
  username varchar(30) NOT NULL,
  source varchar(100) NOT NULL,
  d_organisaatio_id int NOT NULL,
  d_koulutusluokitus_id int NOT NULL,
  d_kieli_id int NOT NULL,
  d_alueluokitus_id int NOT NULL,
  d_kalenteri_id int NOT NULL,
  d_arvokysymys_id int NULL,
  d_arvokyselykerta_id int NULL,
  koulutusmuoto varchar(20) NULL,
  vaihtoehto varchar(10) NULL,
  monivalintavaihtoehto nvarchar(max) NULL,
  numerovalinta varchar(10) NULL,
  taustakysymys_ika nvarchar(50) NULL,
  taustakysymys_sukupuoli nvarchar(50) NULL,
  taustakysymys_pohjakoulutus nvarchar(100) NULL,
  vastaajaid int NULL,
  lukumaara int NOT NULL,
  CONSTRAINT PK__f_arvo PRIMARY KEY CLUSTERED (id)
)

ALTER TABLE dbo.f_arvo ADD  CONSTRAINT DF__f_arvo__loadtime  DEFAULT (getdate()) FOR loadtime

ALTER TABLE dbo.f_arvo ADD  CONSTRAINT DF__f_arvo__username  DEFAULT (suser_sname()) FOR username

END
