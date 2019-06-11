USE [Arvo_SA]
IF  EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_arvo_kysymykset')
BEGIN
ALTER TABLE [sa].[sa_arvo_kysymykset] DROP CONSTRAINT [DF__sa_arvo_kysymykset__loadtime]
ALTER TABLE [sa].[sa_arvo_kysymykset] DROP CONSTRAINT [DF__sa_arvo_kysymykset__username]
DROP TABLE [sa].[sa_arvo_kysymykset]
END


IF  NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_arvo_kysymykset')
BEGIN
CREATE TABLE [sa].[sa_arvo_kysymykset](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[kysymysryhmaid] [int] NULL,
	[kysymysryhma_fi] [nvarchar](max) NULL,
	[kysymysryhma_en] [nvarchar](max) NULL,
	[kysymysryhma_sv] [nvarchar](max) NULL,
	[kysymysid] [int] NULL,
	[kysymys_fi] [nvarchar](max) NULL,
	[kysymys_sv] [nvarchar](max) NULL,
	[kysymys_en] [nvarchar](max) NULL,
	[jarjestys] [int] NULL,
	[jatkokysymys] [bit] NULL,
	[jatkokysymys_kysymysid] [int] NULL,
	[kategoria] [nvarchar](max) NULL,
	[rahoitusmallikysymys] [bit] NULL,
	[taustakysymyksen_tyyppi] [nvarchar](max) NULL,
	[vastaustyyppi] [nvarchar](max) NULL,
	[valtakunnallinen] [bit] NULL,
	[source] [varchar](100) NULL,
	[username] [varchar](100) NULL,
	[loadtime] [datetime] NULL,
 CONSTRAINT [PK__sa_arvo_kysymykset] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS
 (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[DF__sa_arvo_kysymykset__username]') AND type = 'D')
BEGIN
ALTER TABLE [sa].[sa_arvo_kysymykset] ADD  CONSTRAINT [DF__sa_arvo_kysymykset__username]  DEFAULT (suser_name()) FOR [username]
END

GO

IF NOT EXISTS
 (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[DF__sa_arvo_kysymykset__loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [sa].[sa_arvo_kysymykset] ADD  CONSTRAINT [DF__sa_arvo_kysymykset__loadtime]  DEFAULT (getdate()) FOR [loadtime]
END
GO


USE [ANTERO]
GO
