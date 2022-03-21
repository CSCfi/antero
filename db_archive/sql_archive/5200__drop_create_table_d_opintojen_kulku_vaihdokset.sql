USE [ANTERO]
GO
/****** Object:  Table [dw].[d_opintojen_kulku_vaihdokset]    Script Date: 7.10.2021 5:08:10 ******/
DROP TABLE [dw].[d_opintojen_kulku_vaihdokset]
GO
/****** Object:  Table [dw].[d_opintojen_kulku_vaihdokset]    Script Date: 7.10.2021 5:08:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[d_opintojen_kulku_vaihdokset](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[vaihdos_tyyppi] [varchar](30) NULL,
	[vaihdos_koodi] [int] NULL,
	[vaihdos_fi] [varchar](50) NULL,
	[vaihdos_se] [varchar](50) NULL,
	[vaihdos_en] [varchar](50) NULL,
	[jarj_vaihdos] [int] NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dw].[d_opintojen_kulku_vaihdokset] ON 

GO
INSERT [dw].[d_opintojen_kulku_vaihdokset] ([id], [vaihdos_tyyppi], [vaihdos_koodi], [vaihdos_fi], [vaihdos_se], [vaihdos_en], [jarj_vaihdos]) 
VALUES (-1, N'tuntematon', 99, N'Tieto puuttuu', N'Information saknas', N'Missing data', 99)
GO
INSERT [dw].[d_opintojen_kulku_vaihdokset] ([id], [vaihdos_tyyppi], [vaihdos_koodi], [vaihdos_fi], [vaihdos_se], [vaihdos_en], [jarj_vaihdos]) 
VALUES (1, N'oppilaitos', 0, N'Sama oppilaitos', NULL, NULL, 1)
GO
INSERT [dw].[d_opintojen_kulku_vaihdokset] ([id], [vaihdos_tyyppi], [vaihdos_koodi], [vaihdos_fi], [vaihdos_se], [vaihdos_en], [jarj_vaihdos]) 
VALUES (2, N'oppilaitos', 1, N'Eri oppilaitos', NULL, NULL, 2)
GO
INSERT [dw].[d_opintojen_kulku_vaihdokset] ([id], [vaihdos_tyyppi], [vaihdos_koodi], [vaihdos_fi], [vaihdos_se], [vaihdos_en], [jarj_vaihdos]) 
VALUES (3, N'jarjestaja', 0, N'Sama koulutuksen järjestäjä', NULL, NULL, 1)
GO
INSERT [dw].[d_opintojen_kulku_vaihdokset] ([id], [vaihdos_tyyppi], [vaihdos_koodi], [vaihdos_fi], [vaihdos_se], [vaihdos_en], [jarj_vaihdos]) 
VALUES (4, N'jarjestaja', 1, N'Eri koulutuksen järjestäjä', NULL, NULL, 2)
GO
INSERT [dw].[d_opintojen_kulku_vaihdokset] ([id], [vaihdos_tyyppi], [vaihdos_koodi], [vaihdos_fi], [vaihdos_se], [vaihdos_en], [jarj_vaihdos]) 
VALUES (5, N'oppilaitos', 8, N'Keskeyttänyt ammatillisen koulutuksen', NULL, NULL, 8)
GO
INSERT [dw].[d_opintojen_kulku_vaihdokset] ([id], [vaihdos_tyyppi], [vaihdos_koodi], [vaihdos_fi], [vaihdos_se], [vaihdos_en], [jarj_vaihdos]) 
VALUES (6, N'jarjestaja', 8, N'Keskeyttänyt ammatillisen koulutuksen', NULL, NULL, 8)
GO
INSERT [dw].[d_opintojen_kulku_vaihdokset] ([id], [vaihdos_tyyppi], [vaihdos_koodi], [vaihdos_fi], [vaihdos_se], [vaihdos_en], [jarj_vaihdos]) 
VALUES (7, N'oppilaitos', 9, N'Keskeyttänyt toisen asteen', NULL, NULL, 9)
GO
INSERT [dw].[d_opintojen_kulku_vaihdokset] ([id], [vaihdos_tyyppi], [vaihdos_koodi], [vaihdos_fi], [vaihdos_se], [vaihdos_en], [jarj_vaihdos]) 
VALUES (8, N'jarjestaja', 9, N'Keskeyttänyt toisen asteen', NULL, NULL, 9)
GO
SET IDENTITY_INSERT [dw].[d_opintojen_kulku_vaihdokset] OFF
GO
