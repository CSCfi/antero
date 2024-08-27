USE [ANTERO]
GO


/****** Object:  Table [dw].[d_opetuksen_jarjestamismuoto_lukio]    Script Date: 26.8.2024 13:44:00 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_opetuksen_jarjestamismuoto_lukio]') AND type in (N'U'))
DROP TABLE [dw].[d_opetuksen_jarjestamismuoto_lukio]
GO

/****** Object:  Table [dw].[d_opetuksen_jarjestamismuoto_lukio]    Script Date: 26.8.2024 13:44:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_opetuksen_jarjestamismuoto_lukio](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [varchar](255) NOT NULL,
	[selite_fi] [varchar](255) NOT NULL,
	[selite_sv] [varchar](255) NULL,
	[selite_en] [varchar](255) NULL,
	[jarjestys] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_opetuksen_jarjestamismuoto_lukio] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dw].[d_opetuksen_jarjestamismuoto_lukio] ADD  CONSTRAINT [DF_d_opetuksen_jarjestamismuoto_lukio_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_opetuksen_jarjestamismuoto_lukio] ADD  CONSTRAINT [DF_d_opetuksen_jarjestamismuoto_lukio_username]  DEFAULT (suser_sname()) FOR [username]
GO

