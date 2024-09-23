USE [Koski_SA]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_koski_kotikuntahistoria]') AND type in (N'U'))
BEGIN

	CREATE TABLE [sa].[sa_koski_kotikuntahistoria](
		[master_oid] [varchar](100) NULL,
		[kotikunta] [varchar](10) NULL,
		[muutto_pvm] [datetime] NULL,
		[poismuutto_pvm] [datetime] NULL,
		[turvakielto] [int] NULL,
		[imp_created] [datetime] NULL,
		[username] [varchar](100) NULL,
		[source] [varchar](100) NULL
	) ON [PRIMARY]
END
GO

USE ANTERO
