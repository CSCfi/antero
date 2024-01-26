USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_hakeneet_kk_pohjakoulutuksen_maa]    Script Date: 20.1.2023 20:09:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (select * from sysobjects where name='sa_hakeneet_kk_pohjakoulutuksen_maa' and xtype='U')

CREATE TABLE [sa].[sa_hakeneet_kk_pohjakoulutuksen_maa](
	[HenkiloOID] [varchar](255) NULL,
	[koulutuksen_alkamisvuosi] [int] NULL,
	[koulutuksen_alkamiskausi] [nchar](10) NULL,
	[pohjakoulutus_suomessa_priorisoitu] [int] NULL
) ON [PRIMARY]

GO


