USE [VipunenTK_lisatiedot]
GO

/****** Object:  Table [dbo].[liikkuvuuden_kesto]    Script Date: 25.11.2022 15:59:03 ******/
DROP TABLE IF EXISTS [dbo].[liikkuvuuden_kesto]
GO

/****** Object:  Table [dbo].[liikkuvuuden_kesto]    Script Date: 25.11.2022 15:59:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[liikkuvuuden_kesto](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[liikkuvuuden_kesto_koodi] [nvarchar](5) NULL,
	[liikkuvuuden_kesto] [nvarchar](100) NULL,
	[liikkuvuuden_kesto_SV] [nvarchar](100) NULL,
	[liikkuvuuden_kesto_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO

INSERT INTO [VipunenTK_lisatiedot].[dbo].[liikkuvuuden_kesto]
(id, luotu, liikkuvuuden_kesto_koodi, liikkuvuuden_kesto, liikkuvuuden_kesto_SV, liikkuvuuden_kesto_EN, jarjestys, virhetilanne, tietolahde)
VALUES 
(-1, cast(getdate() as date), -1, 'Tuntematon','Information saknas', 'Missing data', 8, 'K', 'Manuaalinen'),
(-2, cast(getdate() as date), -2, 'Virhetilanne','Feltillstånd', 'Error occurred', 9, 'K', 'Manuaalinen'),
(1, cast(getdate() as date), 1, 'Alle 3kk','Mindre än 3 mån', 'Less than 3 months', 1, 'E', 'Manuaalinen'),
(2, cast(getdate() as date), 2, 'Vähintään 3kk', 'Minst 3 mån', 'At least 3 months', 2, 'E', 'Manuaalinen')

GO

USE [ANTERO]