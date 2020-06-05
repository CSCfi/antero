USE [ANTERO]
GO

ALTER TABLE [dw].[d_erityisopetus] DROP CONSTRAINT [DF__d_erityisopetus__username]
GO

ALTER TABLE [dw].[d_erityisopetus] DROP CONSTRAINT [DF__d_erityisopetus__loadtime]
GO

/****** Object:  Table [dw].[d_erityisopetus]    Script Date: 4.6.2020 18:00:00 ******/
DROP TABLE [dw].[d_erityisopetus]
GO

/****** Object:  Table [dw].[d_erityisopetus]    Script Date: 4.6.2020 18:00:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_erityisopetus](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[erityisopetus_koodi] [varchar](3) NOT NULL,
	[erityisopetus_nimi_fi] [varchar](100) NOT NULL,
	[erityisopetus_nimi_sv] [varchar](100) NOT NULL,
	[erityisopetus_nimi_en] [varchar](100) NOT NULL,
	[erityisopetus_ryhma_fi] [varchar](100) NULL,
	[erityisopetus_ryhma_sv] [varchar](100) NULL,
	[erityisopetus_ryhma_en] [varchar](100) NULL,
	[alkupvm] [date] NULL,
	[loppupvm] [date] NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[jarjestys_erityisopetus_koodi]  AS (case when [erityisopetus_koodi]=(-1) then '99999' else CONVERT([varchar](10),[erityisopetus_koodi]) end),
	[jarjestys_erityisopetus_ryhma] [int] NULL,
 CONSTRAINT [PK_d_erityisopetus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[d_erityisopetus] ADD  CONSTRAINT [DF__d_erityisopetus__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_erityisopetus] ADD  CONSTRAINT [DF__d_erityisopetus__username]  DEFAULT (suser_sname()) FOR [username]
