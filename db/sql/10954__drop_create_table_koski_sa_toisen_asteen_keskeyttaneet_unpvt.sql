USE [Koski_SA]
GO

/****** Object:  Table [dbo].[toisen_asteen_keskeyttaneet_unpvt]    Script Date: 30.7.2025 10.13.23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[toisen_asteen_keskeyttaneet_unpvt]') AND type in (N'U'))
DROP TABLE [dbo].[toisen_asteen_keskeyttaneet_unpvt]
GO

/****** Object:  Table [dbo].[toisen_asteen_keskeyttaneet_unpvt]    Script Date: 30.7.2025 10.13.23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[toisen_asteen_keskeyttaneet_unpvt](
	[master_oid] [varchar](150) NULL,
	[opiskeluoikeus_oid] [varchar](150) NULL,
	[viimeinen_lasna] [datetime] NULL,
	[vuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[keskeyttaminen_kategoria] [nvarchar](128) NULL
) ON [PRIMARY]
GO


