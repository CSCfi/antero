USE [ANTERO]
GO

ALTER TABLE [dw].[d_taiteenala] DROP CONSTRAINT [DF__d_taiteenala__username]
GO

ALTER TABLE [dw].[d_taiteenala] DROP CONSTRAINT [DF__d_taiteenala__loadtime]
GO

/****** Object:  Table [dw].[d_taiteenala]    Script Date: 24.4.2018 17:46:46 ******/
DROP TABLE [dw].[d_taiteenala]
GO

/****** Object:  Table [dw].[d_taiteenala]    Script Date: 24.4.2018 17:46:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_taiteenala](
	[id] [int] IDENTITY(-1,1) NOT NULL,
	[taiteenala_koodi] [varchar](4) NOT NULL,
	[taiteenala_nimi_fi] [nvarchar](200) NOT NULL,
	[taiteenala_nimi_sv] [nvarchar](200) NOT NULL,
	[taiteenala_nimi_en] [nvarchar](200) NOT NULL,
	[startdate] [date] NULL,
	[enddate] [date] NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_taiteenala] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[d_taiteenala] ADD  CONSTRAINT [DF__d_taiteenala__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_taiteenala] ADD  CONSTRAINT [DF__d_taiteenala__username]  DEFAULT (suser_sname()) FOR [username]
GO


