USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_eter_erasmus]    Script Date: 27.4.2022 10:44:29 ******/
DROP TABLE [sa].[sa_eter_erasmus]
GO

/****** Object:  Table [sa].[sa_eter_erasmus]    Script Date: 27.4.2022 10:44:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_eter_erasmus](
	[ETER_ID] [varchar](255) NULL,
	[Erasmus incoming students - ISCED 7] [varchar](255) NULL,
	[Erasmus outgoing students - ISCED 6] [varchar](255) NULL,
	[Erasmus incoming staff] [varchar](255) NULL,
	[Erasmus incoming students - ISCED 8] [varchar](255) NULL,
	[Erasmus outgoing students - ISCED 7] [varchar](255) NULL,
	[Erasmus outgoing staff] [varchar](255) NULL,
	[Erasmus incoming students - ISCED 6] [varchar](255) NULL,
	[Erasmus incoming students (other)] [varchar](255) NULL,
	[Erasmus outgoing students - ISCED 5] [varchar](255) NULL,
	[Erasmus outgoing students - ISCED 8] [varchar](255) NULL,
	[Erasmus total outgoing students] [varchar](255) NULL,
	[Flag Erasmus data] [varchar](255) NULL,
	[Erasmus incoming students - ISCED 5] [varchar](255) NULL,
	[Erasmus total incoming students] [varchar](255) NULL,
	[Erasmus outgoing students (other)] [varchar](255) NULL,
	[Notes on Erasmus data] [varchar](255) NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL,
	[loadtime] [datetime] NULL
) ON [PRIMARY]

GO

USE [ANTERO]