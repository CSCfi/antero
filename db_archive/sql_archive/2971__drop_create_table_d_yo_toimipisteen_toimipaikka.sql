USE ANTERO

IF  EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dw' and TABLE_NAME='d_yo_toimipisteen_toimipaikka')

BEGIN
	DROP TABLE [dw].[d_yo_toimipisteen_toimipaikka]
END


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dw' and TABLE_NAME='d_yo_toimipisteen_toimipaikka')

BEGIN


CREATE TABLE [dw].[d_yo_toimipisteen_toimipaikka](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[vuosi] [varchar] (5) NOT NULL,
	[koodi_yliopisto] [varchar](5) NOT NULL,
	[koodi_toimipiste] [varchar](3) NOT NULL,
	[koodi_toimipaikka] [varchar](5) NOT NULL,
	[selite_fi] [varchar](500) NOT NULL,
	[selite_sv] [varchar](500) NOT NULL,
	[selite_en] [varchar](500) NOT NULL,
	[ensisijainen_katuosoite] [varchar](500) NOT NULL,
	[postinumero] [varchar](55) NOT NULL,
	[kunta] [varchar](255) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[jarjestys_koodi_toimipaikka]  AS (case when [koodi_toimipaikka]='-1' then 'ZZZZZ' else CONVERT([varchar](10),[koodi_toimipaikka]) end),
	[jarjestys_koodi_toimipiste]  AS (case when [koodi_toimipiste]='-1' then 'ZZZZZ' else CONVERT([varchar](10),[koodi_toimipiste]) end),
	[jarjestys_koodi_yliopisto]  AS (case when [koodi_yliopisto]='-1' then 'ZZZZZ' else CONVERT([varchar](10),[koodi_yliopisto]) end),
 CONSTRAINT [PK__d_yo_toimipisteen_toimipaikka] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

END
GO

ALTER TABLE [dw].[d_yo_toimipisteen_toimipaikka] ADD  CONSTRAINT [DF_d_yo_toimipisteen_toimipaikka_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_yo_toimipisteen_toimipaikka] ADD  CONSTRAINT [DF_d_yo_toimipisteen_toimipaikka_username]  DEFAULT (suser_sname()) FOR [username]
GO
