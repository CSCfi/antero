IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.d_aineistotyyppi') AND type in (N'U'))
BEGIN
CREATE TABLE dw.d_aineistotyyppi(
  id int IDENTITY(-1,1) NOT NULL,
  aineistotyyppi_koodi nvarchar(2) NOT NULL,
  aineistotyyppi_nimi_fi nvarchar(100) NOT NULL,
  aineistotyyppi_nimi_sv nvarchar(100) NOT NULL,
  aineistotyyppi_nimi_en nvarchar(100) NOT NULL,
  loadtime datetime NOT NULL,
  source nvarchar(100) NOT NULL,
  username nvarchar(30) NOT NULL,
 CONSTRAINT PK_d_aineistotyyppi PRIMARY KEY CLUSTERED 
(
  id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
INSERT dw.d_aineistotyyppi (aineistotyyppi_koodi, aineistotyyppi_nimi_fi, aineistotyyppi_nimi_sv, aineistotyyppi_nimi_en, loadtime, source, username) VALUES (N'-1', N'Tuntematon', N'Tuntematon', N'Tuntematon', CAST(N'2016-11-09T00:00:00.000' AS DateTime), N'manual', N'DWI\jrouhiai')
INSERT dw.d_aineistotyyppi (aineistotyyppi_koodi, aineistotyyppi_nimi_fi, aineistotyyppi_nimi_sv, aineistotyyppi_nimi_en, loadtime, source, username) VALUES (N'E', N'Ennakko', N'Ennakko', N'Ennakko', CAST(N'2016-11-23T14:03:22.413' AS DateTime), N'manual', N'DWI\jrouhiai')
INSERT dw.d_aineistotyyppi (aineistotyyppi_koodi, aineistotyyppi_nimi_fi, aineistotyyppi_nimi_sv, aineistotyyppi_nimi_en, loadtime, source, username) VALUES (N'L', N'Lopullinen', N'Lopullinen', N'Lopullinen', CAST(N'2016-11-23T14:06:05.540' AS DateTime), N'manual', N'DWI\jrouhiai')
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.DF__d_aineist__loadt__7EC1CEDB') AND type = 'D')
BEGIN
ALTER TABLE dw.d_aineistotyyppi ADD  CONSTRAINT DF__d_aineist__loadt__7EC1CEDB  DEFAULT (getdate()) FOR loadtime
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.DF__d_aineist__usern__7FB5F314') AND type = 'D')
BEGIN
ALTER TABLE dw.d_aineistotyyppi ADD  CONSTRAINT DF__d_aineist__usern__7FB5F314  DEFAULT (suser_sname()) FOR username
END