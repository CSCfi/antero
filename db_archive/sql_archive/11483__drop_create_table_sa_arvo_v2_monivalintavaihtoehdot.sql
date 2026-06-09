USE [Arvo_SA]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_arvo_v2_monivalintavaihtoehdot]') AND type in (N'U'))
	DROP TABLE [sa].[sa_arvo_v2_monivalintavaihtoehdot]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_arvo_v2_monivalintavaihtoehdot](
	[kysymysid] [int] NULL,
	[kysymysversio] [int] NULL,
	[jarjestys] [int] NULL,
	[arvo] [varchar](100) NULL,
	[monivalintavaihtoehto_fi] [varchar](max) NULL,
	[monivalintavaihtoehto_sv] [varchar](max) NULL,
	[monivalintavaihtoehto_en] [varchar](max) NULL,
	[source] [varchar](255) NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

USE ANTERO
