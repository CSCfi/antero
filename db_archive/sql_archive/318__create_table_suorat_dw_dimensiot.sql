IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_amk_kelpoisuus') BEGIN

CREATE TABLE [dw].[d_amk_kelpoisuus](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [int] NOT NULL,
	[selite_fi] [varchar](55) NOT NULL,
	[selite_sv] [varchar](55) NOT NULL,
	[selite_en] [varchar](55) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_amk_ke__3213E83F19F4479D] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


ALTER TABLE [dw].[d_amk_kelpoisuus] ADD  CONSTRAINT [DF_d_amk_kelpoisuus_loadtime]  DEFAULT (getdate()) FOR [loadtime]
;

ALTER TABLE [dw].[d_amk_kelpoisuus] ADD  CONSTRAINT [DF_d_amk_kelpoisuus_username]  DEFAULT (suser_sname()) FOR [username]
;
; END
IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_amk_koulutustyyppi') BEGIN

CREATE TABLE [dw].[d_amk_koulutustyyppi](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [int] NOT NULL,
	[selite_fi] [varchar](55) NOT NULL,
	[selite_sv] [varchar](55) NOT NULL,
	[selite_en] [varchar](55) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_amk_ko__3213E83F089CFC5C] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
;


ALTER TABLE [dw].[d_amk_koulutustyyppi] ADD  CONSTRAINT [DF_d_amk_koulutustyyppi_loadtime]  DEFAULT (getdate()) FOR [loadtime]
;

ALTER TABLE [dw].[d_amk_koulutustyyppi] ADD  CONSTRAINT [DF_d_amk_koulutustyyppi_username]  DEFAULT (suser_sname()) FOR [username]
;
END
IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_amk_liikkuvuusohjelma') BEGIN
CREATE TABLE [dw].[d_amk_liikkuvuusohjelma](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [varchar](2) NOT NULL,
	[selite_fi] [varchar](255) NOT NULL,
	[selite_sv] [varchar](255) NOT NULL,
	[selite_en] [varchar](255) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_amk_li__3213E83F630297A8] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

;

ALTER TABLE [dw].[d_amk_liikkuvuusohjelma] ADD  CONSTRAINT [DF_d_amk_liikkuvuusohjelma_loadtime]  DEFAULT (getdate()) FOR [loadtime]
;

ALTER TABLE [dw].[d_amk_liikkuvuusohjelma] ADD  CONSTRAINT [DF_d_amk_liikkuvuusohjelma_username]  DEFAULT (suser_sname()) FOR [username]
;
END
IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_amk_muun_henkilokunnan_henkilostoryhma') BEGIN
CREATE TABLE [dw].[d_amk_muun_henkilokunnan_henkilostoryhma](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [int] NOT NULL,
	[selite_fi] [varchar](55) NOT NULL,
	[selite_sv] [varchar](55) NOT NULL,
	[selite_en] [varchar](55) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_amk_mu__3213E83F0C1645D0] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

;

ALTER TABLE [dw].[d_amk_muun_henkilokunnan_henkilostoryhma] ADD  CONSTRAINT [DF_d_amk_muun_henkilokunnan_henkilostoryhma_loadtime]  DEFAULT (getdate()) FOR [loadtime]
;

ALTER TABLE [dw].[d_amk_muun_henkilokunnan_henkilostoryhma] ADD  CONSTRAINT [DF_d_amk_muun_henkilokunnan_henkilostoryhma_username]  DEFAULT (suser_sname()) FOR [username]
; END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_amk_paatoimiset_opettajat') BEGIN
CREATE TABLE [dw].[d_amk_paatoimiset_opettajat](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [int] NOT NULL,
	[selite_fi] [varchar](55) NOT NULL,
	[selite_sv] [varchar](55) NOT NULL,
	[selite_en] [varchar](55) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_amk_pa__3213E83FFFF11F70] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

;


ALTER TABLE [dw].[d_amk_paatoimiset_opettajat] ADD  CONSTRAINT [DF_d_amk_paatoimiset_opettajat_loadtime]  DEFAULT (getdate()) FOR [loadtime]
;

ALTER TABLE [dw].[d_amk_paatoimiset_opettajat] ADD  CONSTRAINT [DF_d_amk_paatoimiset_opettajat_username]  DEFAULT (suser_sname()) FOR [username]
;

END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_amk_tehtavanjaottelu') BEGIN
CREATE TABLE [dw].[d_amk_tehtavanjaottelu](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [int] NOT NULL,
	[selite_fi] [varchar](55) NOT NULL,
	[selite_sv] [varchar](55) NOT NULL,
	[selite_en] [varchar](55) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_amk_te__3213E83FFE0FF408] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

;

ALTER TABLE [dw].[d_amk_tehtavanjaottelu] ADD  CONSTRAINT [DF_d_amk_tehtavanjaottelu_loadtime]  DEFAULT (getdate()) FOR [loadtime]
;

ALTER TABLE [dw].[d_amk_tehtavanjaottelu] ADD  CONSTRAINT [DF_d_amk_tehtavanjaottelu_username]  DEFAULT (suser_sname()) FOR [username]
;
END
IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_amk_toimipisteen_toimipaikka') BEGIN
CREATE TABLE [dw].[d_amk_toimipisteen_toimipaikka](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi_amk] [varchar](10) NOT NULL,
	[koodi_toimipiste] [varchar](10) NOT NULL,
	[koodi_toimipaikka] [varchar](10) NOT NULL,
	[toimipisteen_nimi] [varchar](255) NOT NULL,
	[toimipaikan_nimi] [varchar](255) NOT NULL,
	[ensisijainen_katuosoite] [varchar](255) NOT NULL,
	[postinumero] [varchar](10) NULL,
	[kunta] [varchar](10) NOT NULL,
	[tki_toiminta] [varchar](10) NOT NULL,
	[palvelutoiminta] [varchar](10) NOT NULL,
	[nuorten_koulutus] [varchar](10) NOT NULL,
	[aikuiskoulutus] [varchar](10) NOT NULL,
	[ylempaan_amk_tutkintoon_johtava_koulutus] [varchar](10) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](255) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_amk_to__3213E83FEA238312] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

;

ALTER TABLE [dw].[d_amk_toimipisteen_toimipaikka] ADD  CONSTRAINT [DF_d_amk_toimipisteen_toimipaikka_loadtime]  DEFAULT (getdate()) FOR [loadtime]
;

ALTER TABLE [dw].[d_amk_toimipisteen_toimipaikka] ADD  CONSTRAINT [DF_d_amk_toimipisteen_toimipaikka_username]  DEFAULT (suser_sname()) FOR [username]
; END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_ek_nimike') BEGIN
CREATE TABLE [dw].[d_ek_nimike](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [varchar](50) NOT NULL,
	[selite_fi] [varchar](55) NOT NULL,
	[selite_sv] [varchar](55) NOT NULL,
	[selite_en] [varchar](55) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_ek_nim__3213E83F9C711C14] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

;

ALTER TABLE [dw].[d_ek_nimike] ADD  CONSTRAINT [DF_d_ek_nimike_loadtime]  DEFAULT (getdate()) FOR [loadtime]
;

ALTER TABLE [dw].[d_ek_nimike] ADD  CONSTRAINT [DF_d_ek_nimike_username]  DEFAULT (suser_sname()) FOR [username]
; END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_koulutusala_1995') BEGIN
CREATE TABLE [dw].[d_koulutusala_1995](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [varchar](2) NOT NULL,
	[selite_fi] [varchar](55) NOT NULL,
	[selite_sv] [varchar](55) NOT NULL,
	[selite_en] [varchar](55) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_koulut__3213E83F16DF1CE3] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

;

ALTER TABLE [dw].[d_koulutusala_1995] ADD  CONSTRAINT [DF_d_koulutusala_1995_loadtime]  DEFAULT (getdate()) FOR [loadtime]
;

ALTER TABLE [dw].[d_koulutusala_1995] ADD  CONSTRAINT [DF_d_koulutusala_1995_username]  DEFAULT (suser_sname()) FOR [username]
; END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_koulutusala_2002') BEGIN
CREATE TABLE [dw].[d_koulutusala_2002](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [int] NOT NULL,
	[selite_fi] [varchar](255) NOT NULL,
	[selite_sv] [varchar](255) NOT NULL,
	[selite_en] [varchar](255) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_koulut__3213E83FD705A7D4] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dw].[d_koulutusala_2002] ADD  CONSTRAINT [DF_d_koulutusala_2002_loadtime]  DEFAULT (getdate()) FOR [loadtime]
;

ALTER TABLE [dw].[d_koulutusala_2002] ADD  CONSTRAINT [DF_d_koulutusala_2002_username]  DEFAULT (suser_sname()) FOR [username]
;


; END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_organisaation_alayksikot') BEGIN
CREATE TABLE [dw].[d_organisaation_alayksikot](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[vuosi] [int] NULL,
	[korkeakoulu_koodi] [varchar](10) NULL,
	[alayksikko_koodi] [varchar](10) NULL,
	[alayksikko_nimi] [varchar](255) NULL,
	[source] [varchar](100) NULL,
 CONSTRAINT [PK__d_organi__3213E83FF52C94E5] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

;
END
IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_suorat_liikkuvuudentyyppi') BEGIN
CREATE TABLE [dw].[d_suorat_liikkuvuudentyyppi](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [int] NOT NULL,
	[selite_fi] [varchar](55) NOT NULL,
	[selite_sv] [varchar](55) NOT NULL,
	[selite_en] [varchar](55) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_liikku__3213E83F1BA7BC48] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

;

ALTER TABLE [dw].[d_suorat_liikkuvuudentyyppi] ADD  CONSTRAINT [DF_d_liikkuvuuden_tyyppi_loadtime]  DEFAULT (getdate()) FOR [loadtime]
;

ALTER TABLE [dw].[d_suorat_liikkuvuudentyyppi] ADD  CONSTRAINT [DF_d_liikkuvuuden_tyyppi_username]  DEFAULT (suser_sname()) FOR [username]
;

END
IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_yo_harjoittelukoulujen_henkilostoryhma') BEGIN
CREATE TABLE [dw].[d_yo_harjoittelukoulujen_henkilostoryhma](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [int] NOT NULL,
	[selite_fi] [varchar](55) NOT NULL,
	[selite_sv] [varchar](55) NOT NULL,
	[selite_en] [varchar](55) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_yo_har__3213E83F7E76768F] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

;

ALTER TABLE [dw].[d_yo_harjoittelukoulujen_henkilostoryhma] ADD  CONSTRAINT [DF_d_yo_harjoittelukoulujen_henkilostoryhma_loadtime]  DEFAULT (getdate()) FOR [loadtime]
;

ALTER TABLE [dw].[d_yo_harjoittelukoulujen_henkilostoryhma] ADD  CONSTRAINT [DF_d_yo_harjoittelukoulujen_henkilostoryhma_username]  DEFAULT (suser_sname()) FOR [username]
; END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_yo_henkilostoryhma') BEGIN
CREATE TABLE [dw].[d_yo_henkilostoryhma](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [int] NOT NULL,
	[selite_fi] [varchar](55) NOT NULL,
	[selite_sv] [varchar](55) NOT NULL,
	[selite_en] [varchar](55) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_yo_hen__3213E83F2CCC8864] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

;

ALTER TABLE [dw].[d_yo_henkilostoryhma] ADD  CONSTRAINT [DF_d_yo_henkilostoryhma_loadtime]  DEFAULT (getdate()) FOR [loadtime]
;

ALTER TABLE [dw].[d_yo_henkilostoryhma] ADD  CONSTRAINT [DF_d_yo_henkilostoryhma_username]  DEFAULT (suser_sname()) FOR [username]
;
END
IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_yo_nimitystapa') BEGIN
CREATE TABLE [dw].[d_yo_nimitystapa](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [int] NOT NULL,
	[selite_fi] [varchar](55) NOT NULL,
	[selite_sv] [varchar](55) NOT NULL,
	[selite_en] [varchar](55) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_yo_nim__3213E83F0B4EB609] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

;

ALTER TABLE [dw].[d_yo_nimitystapa] ADD  CONSTRAINT [DF_d_yo_nimitystapa_loadtime]  DEFAULT (getdate()) FOR [loadtime]
;

ALTER TABLE [dw].[d_yo_nimitystapa] ADD  CONSTRAINT [DF_d_yo_nimitystapa_username]  DEFAULT (suser_sname()) FOR [username]
; END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_yo_tehtavanjaottelu') BEGIN
CREATE TABLE [dw].[d_yo_tehtavanjaottelu](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [int] NOT NULL,
	[selite_fi] [varchar](55) NOT NULL,
	[selite_sv] [varchar](55) NOT NULL,
	[selite_en] [varchar](55) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_yo_teh__3213E83F93786DD6] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

;

ALTER TABLE [dw].[d_yo_tehtavanjaottelu] ADD  CONSTRAINT [DF_d_yo_tehtavanjaottelu_loadtime]  DEFAULT (getdate()) FOR [loadtime]
;

ALTER TABLE [dw].[d_yo_tehtavanjaottelu] ADD  CONSTRAINT [DF_d_yo_tehtavanjaottelu_username]  DEFAULT (suser_sname()) FOR [username]
; END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_yo_tiedekunta') BEGIN
CREATE TABLE [dw].[d_yo_tiedekunta](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[yliopistokoodi] [varchar](5) NULL,
	[tiedekuntakoodi] [varchar](10) NULL,
	[tiedekunta] [varchar](200) NULL,
	[source] [varchar](100) NULL,
 CONSTRAINT [PK_d_yo_tiedekunta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

; END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_yo_toimipiste') BEGIN
CREATE TABLE [dw].[d_yo_toimipiste](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi_yliopisto] [varchar](5) NOT NULL,
	[koodi_toimipiste] [varchar](3) NOT NULL,
	[selite_fi] [varchar](55) NOT NULL,
	[selite_sv] [varchar](55) NOT NULL,
	[selite_en] [varchar](55) NOT NULL,
	[toiminta_tutkintoon_johtava_koulutus] [int] NOT NULL,
	[toiminta_tutkimustoiminta] [int] NOT NULL,
	[toiminta_muu] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_yo_toi__3213E83F98E46C2E] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

;

ALTER TABLE [dw].[d_yo_toimipiste] ADD  CONSTRAINT [DF_d_yo_toimipiste_loadtime]  DEFAULT (getdate()) FOR [loadtime]
;

ALTER TABLE [dw].[d_yo_toimipiste] ADD  CONSTRAINT [DF_d_yo_toimipiste_username]  DEFAULT (suser_sname()) FOR [username]
; END


IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_yo_toimipisteen_toimipaikka') BEGIN
CREATE TABLE [dw].[d_yo_toimipisteen_toimipaikka](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi_yliopisto] [varchar](5) NOT NULL,
	[koodi_toimipiste] [varchar](3) NOT NULL,
	[koodi_toimipaikka] [varchar](5) NOT NULL,
	[selite_fi] [varchar](55) NOT NULL,
	[selite_sv] [varchar](55) NOT NULL,
	[selite_en] [varchar](55) NOT NULL,
	[ensisijainen_katuosoite] [varchar](55) NOT NULL,
	[postinumero] [varchar](55) NOT NULL,
	[kunta] [varchar](55) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_yo_toi__3213E83F92875527] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

;


ALTER TABLE [dw].[d_yo_toimipisteen_toimipaikka] ADD  CONSTRAINT [DF_d_yo_toimipisteen_toimipaikka_loadtime]  DEFAULT (getdate()) FOR [loadtime]
;

ALTER TABLE [dw].[d_yo_toimipisteen_toimipaikka] ADD  CONSTRAINT [DF_d_yo_toimipisteen_toimipaikka_username]  DEFAULT (suser_sname()) FOR [username]
; 
END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_yo_tutkijanuravaihe') BEGIN
CREATE TABLE [dw].[d_yo_tutkijanuravaihe](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [int] NOT NULL,
	[selite_fi] [varchar](255) NOT NULL,
	[selite_sv] [varchar](255) NOT NULL,
	[selite_en] [varchar](255) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_yo_tut__3213E83F11443087] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

;

ALTER TABLE [dw].[d_yo_tutkijanuravaihe] ADD  CONSTRAINT [DF_d_yo_tutkijanuravaihe_loadtime]  DEFAULT (getdate()) FOR [loadtime]
;

ALTER TABLE [dw].[d_yo_tutkijanuravaihe] ADD  CONSTRAINT [DF_d_yo_tutkijanuravaihe_username]  DEFAULT (suser_sname()) FOR [username]
;

END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_yo_valinta_kutsumenettelylla') BEGIN
CREATE TABLE [dw].[d_yo_valinta_kutsumenettelylla](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [int] NOT NULL,
	[selite_fi] [varchar](55) NOT NULL,
	[selite_sv] [varchar](55) NOT NULL,
	[selite_en] [varchar](55) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_yo_val__3213E83F6FEAA841] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

;

ALTER TABLE [dw].[d_yo_valinta_kutsumenettelylla] ADD  CONSTRAINT [DF_d_yo_valinta_kutsumenettelylla_loadtime]  DEFAULT (getdate()) FOR [loadtime]
;

ALTER TABLE [dw].[d_yo_valinta_kutsumenettelylla] ADD  CONSTRAINT [DF_d_yo_valinta_kutsumenettelylla_username]  DEFAULT (suser_sname()) FOR [username]
;
END
