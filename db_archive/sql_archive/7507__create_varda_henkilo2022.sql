USE [Varda_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_varda_henkilo2022]') AND type in (N'U'))
BEGIN

	CREATE TABLE [sa].[sa_varda_henkilo2022](
	[id] [int] NULL,
	[henkilo_oid] [varchar](100) NULL,
	[syntyma_pvm] [datetime] NULL,
	[aidinkieli_koodi] [varchar](10) NULL,
	[kotikunta_koodi] [int] NULL,
	[sukupuoli_koodi] [int] NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](255) NULL,
	[source] [varchar](100) NULL
	) ON [PRIMARY]
END

GO
USE ANTERO
