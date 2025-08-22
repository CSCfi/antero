USE [Koski_SA]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[perusopetuksen_keskiarvot]') AND type in (N'U'))
DROP TABLE [sa].[perusopetuksen_keskiarvot]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[perusopetuksen_keskiarvot](
	[master_oid] [varchar](150) NOT NULL,
	[tarkasteluajankohta] [datetime] NOT NULL,
	[perusopetuksen_paattymispaiva] [datetime] NOT NULL,
	[opiskelee_toiminta_alueittain] [int] NULL,
	[oppiaineita_lkm] [int] NULL,
	[oppiaineita_yksilollistetty_lkm] [int] NULL,
	[yksilollistaminen] [int] NULL,
	[yksilollistaminen_fi] [varchar](50) NULL,
	[keskiarvo] [decimal](10, 5) NULL,
	[keskiarvoluokka] [int] NULL,
	[keskiarvo_lahde] [varchar](5) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [nvarchar](128) NULL
) ON [PRIMARY]
GO
