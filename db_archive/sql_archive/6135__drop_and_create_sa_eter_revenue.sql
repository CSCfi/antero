USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_eter_revenue]    Script Date: 27.4.2022 10:48:49 ******/
DROP TABLE [sa].[sa_eter_revenue]
GO

/****** Object:  Table [sa].[sa_eter_revenue]    Script Date: 27.4.2022 10:48:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_eter_revenue](
	[ETER_ID] [varchar](255) NULL,
	[Basic government allocation (NC)] [float] NULL,
	[Basic government allocation (PPP)] [float] NULL,
	[Basic government allocation (EURO)] [float] NULL,
	[Other core budget (EURO)] [float] NULL,
	[Other core budget (NC)] [float] NULL,
	[Other core budget (PPP)] [float] NULL,
	[Total core budget (PPP)] [float] NULL,
	[Total core budget (EURO)] [float] NULL,
	[Total core budget (NC)] [float] NULL,
	[Flag Public third party funding] [varchar](255) NULL,
	[Flag other core budget] [varchar](255) NULL,
	[Public third party funding (NC)] [float] NULL,
	[Public third party funding (PPP)] [float] NULL,
	[Public third party funding (EURO)] [float] NULL,
	[Flag Total core budget] [varchar](255) NULL,
	[Third party funding from abroad (NC)] [float] NULL,
	[Third party funding from abroad (PPP)] [float] NULL,
	[Third party funding from abroad (EURO)] [float] NULL,
	[Third party funding undivided (EURO)] [float] NULL,
	[Third party funding undivided (NC)] [float] NULL,
	[Third party funding undivided (PPP)] [float] NULL,
	[Flag Private third party funding] [varchar](255) NULL,
	[Private third party funding (NC)] [float] NULL,
	[Private third party funding (EURO)] [float] NULL,
	[Private third party funding (PPP)] [float] NULL,
	[Total third party funding (PPP)] [float] NULL,
	[Total third party funding (EURO)] [float] NULL,
	[Total third party funding (NC)] [float] NULL,
	[Student fees funding (PPP)] [float] NULL,
	[Student fees funding (EURO)] [float] NULL,
	[Student fees funding (NC)] [float] NULL,
	[Flag Third party funding undivided] [varchar](255) NULL,
	[Flag Revenue unclassified] [varchar](255) NULL,
	[Tuition fees] [float] NULL,
	[Flag Total third party funding] [varchar](255) NULL,
	[Revenue unclassified (NC)] [float] NULL,
	[Revenue unclassified (PPP)] [float] NULL,
	[Revenue unclassified (EURO)] [float] NULL,
	[Non-recurring revenues (NC)] [float] NULL,
	[Non-recurring revenues (PPP)] [float] NULL,
	[Non-recurring revenues (EURO)] [float] NULL,
	[Flag Student fees funding] [varchar](255) NULL,
	[Total Current revenues (EURO)] [float] NULL,
	[Total Current revenues (NC)] [float] NULL,
	[Total Current revenues (PPP)] [float] NULL,
	[Flag Total current revenues] [varchar](255) NULL,
	[Notes on revenues] [varchar](1274) NULL,
	[Flag Basic government allocationt] [varchar](255) NULL,
	[Flag Third party funding abroad] [varchar](255) NULL,
	[Flag Non-recurring revenues] [varchar](255) NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL,
	[loadtime] [datetime] NULL
) ON [PRIMARY]

GO

USE [ANTERO]