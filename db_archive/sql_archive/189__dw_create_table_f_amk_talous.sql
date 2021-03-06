IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.f_amk_talous') AND type in (N'U'))
BEGIN
CREATE TABLE dw.f_amk_talous(
  id int IDENTITY(1,1) NOT NULL,
  d_amk_id int NOT NULL,
  d_ohjauksenala_id int NOT NULL,
  d_tili_id int NOT NULL,
  d_aineistotyyppi_id int NOT NULL,
  d_toiminto_id int NOT NULL,
  d_erittely_id int NOT NULL,
  tilikausi int NOT NULL,
  arvo bigint NULL,
  loadtime datetime NOT NULL,
  source varchar(100) NOT NULL,
  username varchar(30) NOT NULL
)
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.DF__f_amk_tal__loadt__019E3B86') AND type = 'D')
BEGIN
ALTER TABLE dw.f_amk_talous ADD  CONSTRAINT DF__f_amk_tal__loadt__019E3B86  DEFAULT (getdate()) FOR loadtime
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.DF__f_amk_tal__usern__02925FBF') AND type = 'D')
BEGIN
ALTER TABLE dw.f_amk_talous ADD  CONSTRAINT DF__f_amk_tal__usern__02925FBF  DEFAULT (suser_sname()) FOR username
END