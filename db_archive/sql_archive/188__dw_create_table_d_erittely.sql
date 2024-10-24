IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.d_erittely') AND type in (N'U'))
BEGIN
CREATE TABLE dw.d_erittely(
  id int IDENTITY(-1,1) NOT NULL,
  erittely_koodi nvarchar(30) NOT NULL,
  erittely_nimi_fi nvarchar(100) NOT NULL,
  erittely_nimi_sv nvarchar(100) NOT NULL,
  erittely_nimi_en nvarchar(100) NOT NULL,
  loadtime datetime NOT NULL,
  source nvarchar(100) NOT NULL,
  username nvarchar(30) NOT NULL,
 CONSTRAINT PK_d_erittely PRIMARY KEY CLUSTERED 
(
  id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

INSERT [dw].[d_erittely] ([erittely_koodi], [erittely_nimi_fi], [erittely_nimi_sv], [erittely_nimi_en], [loadtime], [source], [username]) VALUES (N'-1', N'Tuntematon', N'Tuntematon', N'Tuntematon', CAST(N'2016-11-09T00:00:00.000' AS DateTime), N'manual', N'DWI\jrouhiai')
INSERT [dw].[d_erittely] ([erittely_koodi], [erittely_nimi_fi], [erittely_nimi_sv], [erittely_nimi_en], [loadtime], [source], [username]) VALUES (N'pt', N'Perustehtävä', N'Perustehtävä', N'Perustehtävä', CAST(N'2016-11-23T15:18:21.600' AS DateTime), N'manual', N'DWI\jrouhiai')
INSERT [dw].[d_erittely] ([erittely_koodi], [erittely_nimi_fi], [erittely_nimi_sv], [erittely_nimi_en], [loadtime], [source], [username]) VALUES (N'lt', N'Liiketoiminta', N'Liiketoiminta', N'Liiketoiminta', CAST(N'2016-11-23T15:18:42.293' AS DateTime), N'manual', N'DWI\jrouhiai')
INSERT [dw].[d_erittely] ([erittely_koodi], [erittely_nimi_fi], [erittely_nimi_sv], [erittely_nimi_en], [loadtime], [source], [username]) VALUES (N'yht', N'Yhteensä', N'Yhteensä', N'Yhteensä', CAST(N'2016-11-23T15:19:04.087' AS DateTime), N'manual', N'DWI\jrouhiai')
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.DF__d_erittel__loadt__0A338187') AND type = 'D')
BEGIN
ALTER TABLE dw.d_erittely ADD  DEFAULT (getdate()) FOR loadtime
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.DF__d_erittel__usern__0B27A5C0') AND type = 'D')
BEGIN
ALTER TABLE dw.d_erittely ADD  DEFAULT (suser_sname()) FOR username
END
