USE [Koski_SA]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_koski_henkilo_master]') AND type in (N'U'))
DROP TABLE [sa].[sa_koski_henkilo_master]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_koski_henkilo_master](
	[master_oid] [varchar](50) NULL,
	[syntymaaika] [date] NULL,
	[aidinkieli] [varchar](50) NULL,
	[kansalaisuus] [varchar](50) NULL,
	[turvakielto] [bit] NULL,
	[sukupuoli] [varchar](50) NULL,
	[kotikunta] [varchar](50) NULL,
	[linkitetyt_oidit] [varchar](500) NULL,
	[yksiloity] [bit] NULL,
	[imp_created] [datetime] NOT NULL,
	[source] [varchar](16) NOT NULL,
	[username] [nvarchar](128) NULL
) ON [PRIMARY]
GO
