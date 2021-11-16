USE [AnteroAPI]
GO

DROP TABLE IF EXISTS [api].[ytl_arvosanat]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [api].[ytl_arvosanat](
	[defaultorder] [bigint] NOT NULL,
	[opiskelija_koodi] [int] NOT NULL,
	[tutkintokerta_koodi] [varchar](5) NOT NULL,
	[tutkintokerta] [varchar](10) NULL,
	[lukio_koodi] [varchar](5) NULL,
	[lukio] [varchar](100) NULL,
	[oppilaitostyyppi_koodi] [varchar](1) NULL,
	[oppilaitostyyppi] [varchar](15) NULL,
	[opetuskieli_koodi] [varchar](2) NULL,
	[opetuskieli] [varchar](6) NULL,
	[sukupuoli_koodi] [varchar](1) NULL,
	[sukupuoli] [varchar](6) NULL,
	[koe_koodi] [varchar](2) NULL,
	[koe] [varchar](50) NULL,
	[arvosana_koodi] [varchar](1) NULL,
	[arvosana] [varchar](30) NULL,
	[arvosanapisteet] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [ANTERO]

