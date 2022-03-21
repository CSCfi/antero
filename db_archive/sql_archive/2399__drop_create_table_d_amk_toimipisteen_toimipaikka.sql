USE ANTERO
IF NOT EXISTS(
	SELECT 1 FROM sys.columns
    WHERE Name = N'vuosi' AND Object_ID = Object_ID(N'dw.d_amk_toimipisteen_toimipaikka')
)
BEGIN
DROP TABLE dw.d_amk_toimipisteen_toimipaikka
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dw].[d_amk_toimipisteen_toimipaikka](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[vuosi] [varchar] (5) NOT NULL,
	[koodi_amk] [varchar](10) NOT NULL,
	[koodi_toimipiste] [varchar](10) NOT NULL,
	[koodi_toimipaikka] [varchar](10) NOT NULL,
	[toimipisteen_nimi] [varchar](255) NOT NULL,
	[toimipaikan_nimi] [varchar](255) NOT NULL,
	[ensisijainen_katuosoite] [varchar](255) NOT NULL,
	[postinumero] [varchar](15) NULL,
	[kunta] [varchar](15) NOT NULL,
	[tki_toiminta] [varchar](15) NOT NULL,
	[palvelutoiminta] [varchar](15) NOT NULL,
	[nuorten_koulutus] [varchar](15) NOT NULL,
	[aikuiskoulutus] [varchar](15) NOT NULL,
	[ylempaan_amk_tutkintoon_johtava_koulutus] [varchar](15) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](255) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[jarjestys_koodi_amk]  AS (case when [koodi_amk]=(-1) then '99999' else CONVERT([varchar](10),COALESCE([koodi_amk],'-1')) end),
	[jarjestys_koodi_toimipaikka]  AS (case when [koodi_toimipaikka]=(-1) then '99999' else CONVERT([varchar](10),COALESCE([koodi_toimipaikka],'-1')) end),
	[jarjestys_koodi_toimipiste]  AS (case when [koodi_toimipiste]=(-1) then '99999' else CONVERT([varchar](10),COALESCE([koodi_toimipiste],'-1')) end),
	CONSTRAINT [PK__d_amk_toimipisteen_toimipaikka] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_amk_toimipisteen_toimipaikka_loadtime]') AND type = 'D')
	BEGIN
		ALTER TABLE [dw].[d_amk_toimipisteen_toimipaikka] ADD  CONSTRAINT [DF_d_amk_toimipisteen_toimipaikka_loadtime]  DEFAULT (getdate()) FOR [loadtime]
	END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_amk_toimipisteen_toimipaikka_username]') AND type = 'D')
	BEGIN
		ALTER TABLE [dw].[d_amk_toimipisteen_toimipaikka] ADD  CONSTRAINT [DF_d_amk_toimipisteen_toimipaikka_username]  DEFAULT (suser_sname()) FOR [username]

	END
