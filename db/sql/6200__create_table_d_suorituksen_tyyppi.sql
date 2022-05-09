USE [ANTERO]
GO

/****** Object:  Table [dw].[d_suorituksen_tyyppi]    Script Date: 9.5.2022 15:10:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_suorituksen_tyyppi](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [varchar](255) NOT NULL,
	[selite_fi] [varchar](255) NULL,
	[selite_sv] [varchar](255) NULL,
	[selite_en] [varchar](255) NULL,
	[jarjestys] [int] NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_suorituksen_Tyyppi__3213E83FFE0FF408] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[d_suorituksen_tyyppi] ADD  CONSTRAINT [DF_d_suorituksen_tyyppi_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_suorituksen_tyyppi] ADD  CONSTRAINT [DF_d_suorituksen_tyyppi_username]  DEFAULT (suser_sname()) FOR [username]
GO


USE [ANTERO]