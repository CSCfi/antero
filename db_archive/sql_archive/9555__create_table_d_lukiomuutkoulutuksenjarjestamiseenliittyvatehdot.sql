USE [ANTERO]
GO


/****** Object:  Table [dw].[d_lukiomuutkoulutuksenjarjestamiseenliittyvatehdot]    Script Date: 2.2.2024 13:42:49 ******/
DROP TABLE IF EXISTS [dw].[d_lukiomuutkoulutuksenjarjestamiseenliittyvatehdot]
GO

/****** Object:  Table [dw].[d_lukiomuutkoulutuksenjarjestamiseenliittyvatehdot]    Script Date: 2.2.2024 13:42:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_lukiomuutkoulutuksenjarjestamiseenliittyvatehdot](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [varchar](255) NOT NULL,
	[selite_fi] [varchar](255) NOT NULL,
	[selite_sv] [varchar](255) NULL,
	[selite_en] [varchar](255) NULL,
	[jarjestys] [varchar](50) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_lukiomuutkoulutuksenjarjestamiseenliittyvatehdot] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[d_lukiomuutkoulutuksenjarjestamiseenliittyvatehdot] ADD  CONSTRAINT [DF_d_lukiomuutkoulutuksenjarjestamiseenliittyvatehdot_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_lukiomuutkoulutuksenjarjestamiseenliittyvatehdot] ADD  CONSTRAINT [DF_d_lukiomuutkoulutuksenjarjestamiseenliittyvatehdot_username]  DEFAULT (suser_sname()) FOR [username]
GO


