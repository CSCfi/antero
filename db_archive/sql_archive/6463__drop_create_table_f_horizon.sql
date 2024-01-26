USE [ANTERO]
GO

/****** Object:  Table [dw].[f_horizon]    Script Date: 23.9.2022 14:17:29 ******/
DROP TABLE [dw].[f_horizon]
GO

/****** Object:  Table [dw].[f_horizon]    Script Date: 23.9.2022 14:17:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_horizon](
	[organisation_id] [varchar](50) NULL,
	[d_horizon_projekti_id] [bigint] NULL,
	[d_horizon_organisaatiotyyppi_id] [bigint] NULL,
	[d_horizon_maa_id] [bigint] NULL,
	[d_horizon_ohjelma_id] [bigint] NULL,
	[d_horizon_rahoitusohjelma_id] [bigint] NULL,
	[d_horizon_topic_id] [bigint] NULL,
	[d_horizon_pilari_id] [bigint] NULL,
	[endOfParticipation] [varchar](10) NULL,
	[name] [varchar](400) NULL,
	[shortName] [varchar](400) NULL,
	[role] [varchar](100) NULL,
	[ecContribution] [float] NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [nvarchar](128) NULL,
	[source] [varchar](22) NOT NULL
) ON [PRIMARY]

GO

USE [ANTERO]