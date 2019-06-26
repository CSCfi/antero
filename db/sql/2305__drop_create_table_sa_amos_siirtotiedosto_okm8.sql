USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'sa.sa_amos_siirtotiedosto_okm8') AND type in (N'U'))
BEGIN
ALTER TABLE [sa].[sa_amos_siirtotiedosto_okm8] DROP CONSTRAINT [DF__sa_amos_siirtotiedosto_okm8__loadtime];
ALTER TABLE [sa].[sa_amos_siirtotiedosto_okm8] DROP CONSTRAINT [DF__sa_amos_siirtotiedosto_okm8__username];
DROP TABLE [sa].[sa_amos_siirtotiedosto_okm8]
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'sa.sa_amos_siirtotiedosto_okm8') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[sa_amos_siirtotiedosto_okm8](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[organisaatio_fi] [varchar](255) NULL,
  [koul_jarj] [varchar](10) NOT NULL,
	[paa_asiallinen_toiminta_maakunta_koodi] [varchar](5) NULL,
	[omistajatyyppi_koodi] [varchar](5) NULL,
	[omistajatyyppi] [varchar](15) NULL,
	[voimaan_alkaen] [date] NULL,
	[kommentti] [varchar](255) NULL,
	[tiedostonimi] [varchar](255) NULL,
	[latauspvm] [date] NULL,
	[lastmodified] [datetime] NULL,
	[source] [varchar](255) NULL,
	[username] [varchar](100) NULL,
	[loadtime] [datetime] NULL,
    CONSTRAINT [PK__sa_amos_siirtotiedosto_okm8] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
) ON [PRIMARY]

END
GO

ALTER TABLE [sa].[sa_amos_siirtotiedosto_okm8] ADD  CONSTRAINT [DF__sa_amos_siirtotiedosto_okm8__username]  DEFAULT (suser_name()) FOR [username]
GO

ALTER TABLE [sa].[sa_amos_siirtotiedosto_okm8] ADD  CONSTRAINT [DF__sa_amos_siirtotiedosto_okm8__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
