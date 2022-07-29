USE [VipunenTK]
GO

/****** Object:  Table [dbo].[d_tutkinto_suoritettu_ulkomailla]    Script Date: 23.6.2022 14:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--JS 23.6.2022 /
--Tehdään alustava toteutus suoraan VipunenTK-kantaan ilman fk-viitteitä, katsotaan tarkemmin kun ulkom-muuttujia tullut muihinkin aineistoihin tai palautteen pohjalta.
--Nyt 4.8-näkymässä muodostetaan lopulliset selitteet "Myöh." + [selite] + " (yo)" jne.

IF OBJECT_ID(N'dbo.d_tutkinto_suoritettu_ulkomailla', N'U') IS NULL
BEGIN
CREATE TABLE [dbo].[d_tutkinto_suoritettu_ulkomailla](
	[id] [int] NOT NULL,
	[tutkinto_suoritettu_ulkomailla_avain] [nvarchar](20) NULL,
	[tutkinto_suoritettu_ulkomailla] [nvarchar](100) NULL,
	[tutkinto_suoritettu_ulkomailla_SV] [nvarchar](100) NULL,
	[tutkinto_suoritettu_ulkomailla_EN] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[tietolahde] [nvarchar](50) NULL,
 CONSTRAINT [PK_d_tutkinto_suoritettu_ulkomailla] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

INSERT [dbo].[d_tutkinto_suoritettu_ulkomailla] ([id], [tutkinto_suoritettu_ulkomailla_avain], [tutkinto_suoritettu_ulkomailla], [tutkinto_suoritettu_ulkomailla_SV], [tutkinto_suoritettu_ulkomailla_EN], [jarjestys], [tietolahde]) 
VALUES (-1, N'-1', N'tutkinto suoritettu, ei tietoa ulkomailla/Suomessa', N'', N'', N'98', N'CSC Juha')
INSERT [dbo].[d_tutkinto_suoritettu_ulkomailla] ([id], [tutkinto_suoritettu_ulkomailla_avain], [tutkinto_suoritettu_ulkomailla], [tutkinto_suoritettu_ulkomailla_SV], [tutkinto_suoritettu_ulkomailla_EN], [jarjestys], [tietolahde]) 
VALUES (1, N'1', N'tutkinto suoritettu ulkomailla', N'', N'', N'01', N'CSC Juha')
INSERT [dbo].[d_tutkinto_suoritettu_ulkomailla] ([id], [tutkinto_suoritettu_ulkomailla_avain], [tutkinto_suoritettu_ulkomailla], [tutkinto_suoritettu_ulkomailla_SV], [tutkinto_suoritettu_ulkomailla_EN], [jarjestys], [tietolahde]) 
VALUES (2, N'0', N'tutkinto suoritettu Suomessa', N'', N'', N'02', N'CSC Juha')
INSERT [dbo].[d_tutkinto_suoritettu_ulkomailla] ([id], [tutkinto_suoritettu_ulkomailla_avain], [tutkinto_suoritettu_ulkomailla], [tutkinto_suoritettu_ulkomailla_SV], [tutkinto_suoritettu_ulkomailla_EN], [jarjestys], [tietolahde]) 
VALUES (3, N'X', N'tutkintoa ei suoritettu', N'', N'', N'99', N'CSC Juha')
END
