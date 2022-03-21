USE [VipunenTK]
GO

/****** Object:  Table [dbo].[tasaarvoindikaattori]    Script Date: 8.4.2020 15:49:11 ******/
DROP TABLE IF EXISTS [dbo].[tasaarvoindikaattori]
GO

/****** Object:  Table [dbo].[tasaarvoindikaattori]    Script Date: 8.4.2020 15:49:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tasaarvoindikaattori](
	[Tilastovuosi] [int] NOT NULL,
	[Sektori] [nvarchar](20) NOT NULL,
	[Koodit OKM ohjauksen ala] [nvarchar](20) NOT NULL,
	[n] [int] NOT NULL,
	[SES] [decimal](4, 3) NOT NULL,
	[SES: 0-2] [decimal](4, 3) NOT NULL,
	[SES: 3-4] [decimal](4, 3) NOT NULL,
	[SES: 5-6] [decimal](4, 3) NOT NULL,
	[Sukupuoli] [decimal](4, 3) NOT NULL,
	[Sukupuoli: nainen] [decimal](4, 3) NOT NULL,
	[Sukupuoli: mies] [decimal](4, 3) NOT NULL,
	[Kuntaryhmä] [decimal](4, 3) NOT NULL,
	[Kuntaryhmä: maaseutumaiset] [decimal](4, 3) NOT NULL,
	[Kuntaryhmä: taajaan asutut] [decimal](4, 3) NOT NULL,
	[Kuntaryhmä: kaupunkimaiset] [decimal](4, 3) NOT NULL,
	[SES (vakioitu)] [decimal](4, 3) NOT NULL,
	[SES: 0-2 (vakioitu)] [decimal](4, 3) NOT NULL,
	[SES: 3-4 (vakioitu)] [decimal](4, 3) NOT NULL,
	[SES: 5-6 (vakioitu)] [decimal](4, 3) NOT NULL,
	[Sukupuoli (vakioitu)] [decimal](4, 3) NOT NULL,
	[Sukupuoli: nainen (vakioitu)] [decimal](4, 3) NOT NULL,
	[Sukupuoli: mies (vakioitu)] [decimal](4, 3) NOT NULL,
	[Kuntaryhmä (vakioitu)] [decimal](4, 3) NOT NULL,
	[Kuntaryhmä: maaseutumaiset (vakioitu)] [decimal](4, 3) NOT NULL,
	[Kuntaryhmä: taajaan asutut (vakioitu)] [decimal](4, 3) NOT NULL,
	[Kuntaryhmä: kaupunkimaiset (vakioitu)] [decimal](4, 3) NOT NULL
) ON [PRIMARY]

GO


USE [ANTERO]