USE [ANTERO]
GO

/****** Object:  Table [dw].[d_jarjestajankoko]    Script Date: 12.1.2021 6:32:17 ******/
DROP TABLE IF EXISTS [dw].[d_jarjestajankoko]
GO

/****** Object:  Table [dw].[d_jarjestajankoko]    Script Date: 12.1.2021 6:32:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_jarjestajankoko](
	[id] [bigint] NOT NULL,
	[tilv] [varchar](4) NULL,
	[jarj] [varchar](10) NULL,
	[yopp01] [int] NULL,
	[yopp02] [int] NULL,
	[yopp19] [int] NULL,
	[yopp10] [int] NULL,
	[yopp21] [int] NULL,
	[yopp22] [int] NULL,
	[yopp31] [int] NULL,
	[yopp32] [int] NULL,
	[yopp33] [int] NULL,
	[yopp34] [int] NULL,
	[yopp35] [int] NULL,
	[yopp36] [int] NULL,
	[yopp37] [int] NULL,
	[yopp38] [int] NULL,
	[yopp91] [int] NULL,
	[yopp31ophal] [int] NULL,
	[yopp32ophal] [int] NULL,
	[yopp33ophal] [int] NULL,
	[yopp34ophal] [int] NULL,
	[yopp35ophal] [int] NULL,
	[yopp36ophal] [int] NULL,
	[yopp37ophal] [int] NULL,
	[yopp38ophal] [int] NULL,
	[source] [varchar](17) NOT NULL,
 CONSTRAINT [PK_d_jarjestajankoko] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


