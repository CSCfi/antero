USE [ANTERO]
GO

DROP TABLE IF EXISTS [dw].[d_lukio_kurssintyyppi]
GO

/****** Object:  Table [dw].[d_lukio_kurssintyyppi]    Script Date: 1.12.2020 19:43:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_lukio_kurssintyyppi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[koodi] [nvarchar](100) NOT NULL,
	[nimi] [nvarchar](200) NULL,
	[nimi_sv] [nvarchar](200) NULL,
	[nimi_en] [nvarchar](200) NULL,
	[jarjestys] [int] NULL,
	[koodisto] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK__d_lukio_kurssintyyppi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO

SET IDENTITY_INSERT [dw].[d_lukio_kurssintyyppi] ON 

GO
INSERT [dw].[d_lukio_kurssintyyppi] ([id], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [koodisto]) VALUES (1, N'pakollinen', N'Pakollinen', N'Obligatorisk', NULL, 1, N'lukionkurssintyyppi')
GO
INSERT [dw].[d_lukio_kurssintyyppi] ([id], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [koodisto]) VALUES (2, N'syventava', N'Syventävä', N'Fördjupad', NULL, 2, N'lukionkurssintyyppi')
GO
INSERT [dw].[d_lukio_kurssintyyppi] ([id], [koodi], [nimi], [nimi_sv], [nimi_en], [jarjestys], [koodisto]) VALUES (3, N'soveltava', N'Soveltava', N'Tillämpad', NULL, 3, N'lukionkurssintyyppi')
GO
SET IDENTITY_INSERT [dw].[d_lukio_kurssintyyppi] OFF
GO

