USE [ANTERO]
GO

/****** Object:  Table [dw].[d_varda_yritysluokitus]    Script Date: 30.3.2023 14:24:25 ******/
DROP TABLE [dw].[d_varda_yritysluokitus]
GO
/****** Object:  Table [dw].[d_varda_yritysluokitus]    Script Date: 30.3.2023 14:24:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[d_varda_yritysluokitus](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[koodi] [nvarchar](100) NOT NULL,
	[nimi_fi] [nvarchar](200) NULL,
	[nimi_sv] [nvarchar](200) NULL,
	[nimi_en] [nvarchar](200) NULL,
	[kuvaus_fi] [nvarchar](200) NULL,
	[kuvaus_sv] [nvarchar](200) NULL,
	[kuvaus_en] [nvarchar](200) NULL,
	[yritysmuoto_ryhma_fi] [nvarchar](200) NULL,
	[yritysmuoto_ryhma_en] [nvarchar](200) NULL,
	[yritysmuoto_ryhma_sv] [nvarchar](200) NULL,
	[yritys_tyyppi] [nvarchar](200) NULL,
	[yritys_tyyppi_sv] [nvarchar](200) NULL,
	[yritys_tyyppi_en] [nvarchar](200) NULL,
	[alkupvm] [date] NULL,
	[loppupvm] [date] NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__d_varda_yritysluokitus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dw].[d_varda_yritysluokitus] ON 

GO
INSERT [dw].[d_varda_yritysluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [yritysmuoto_ryhma_fi], [yritysmuoto_ryhma_en], [yritysmuoto_ryhma_sv], [yritys_tyyppi], [yritys_tyyppi_sv], [yritys_tyyppi_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (1, N'16', N'Osakeyhtiö', N'Aktiebolag', NULL, N'Osakeyhtiö', N'Aktiebolag', N'Osakeyhtiö', N'Yritykset', N'Yritykset', N'Företag', N'Yksityinen', N'Privat', N'Private', CAST(N'2021-03-23' AS Date), NULL, CAST(N'2022-11-29T13:16:56.0500000' AS DateTime2), N'p_lataa_varda_yritysmuoto', N'DWI\akoskini')
GO
INSERT [dw].[d_varda_yritysluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [yritysmuoto_ryhma_fi], [yritysmuoto_ryhma_en], [yritysmuoto_ryhma_sv], [yritys_tyyppi], [yritys_tyyppi_sv], [yritys_tyyppi_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (2, N'13', N'Kommandiittiyhtiö', N'Kommanditbolag', NULL, N'Kommandiittiyhtiö', N'Kommanditbolag', N'Kommandiittiyhtiö', N'Yritykset', N'Yritykset', N'Företag', N'Yksityinen', N'Privat', N'Private', CAST(N'2021-03-23' AS Date), NULL, CAST(N'2022-11-29T13:16:56.0500000' AS DateTime2), N'p_lataa_varda_yritysmuoto', N'DWI\akoskini')
GO
INSERT [dw].[d_varda_yritysluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [yritysmuoto_ryhma_fi], [yritysmuoto_ryhma_en], [yritysmuoto_ryhma_sv], [yritys_tyyppi], [yritys_tyyppi_sv], [yritys_tyyppi_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (3, N'18', N'Säätiö', N'Stiftelse', NULL, N'Säätiö', N'Stiftelse', N'Säätiö', N'Yhdistykset ja säätiöt', N'Yhdistykset ja säätiöt', N'Föreningar och stiftelser', N'Yksityinen', N'Privat', N'Private', CAST(N'2021-03-23' AS Date), NULL, CAST(N'2022-11-29T13:16:56.0500000' AS DateTime2), N'p_lataa_varda_yritysmuoto', N'DWI\akoskini')
GO
INSERT [dw].[d_varda_yritysluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [yritysmuoto_ryhma_fi], [yritysmuoto_ryhma_en], [yritysmuoto_ryhma_sv], [yritys_tyyppi], [yritys_tyyppi_sv], [yritys_tyyppi_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (4, N'71', N'Paikallisyhteisö', N'Lokalsamfund', NULL, N'Paikallisyhteisö', N'Lokalsamfund', N'Paikallisyhteisö', N'Yhdistykset ja säätiöt', N'Yhdistykset ja säätiöt', N'Föreningar och stiftelser', N'Yksityinen', N'Privat', N'Private', CAST(N'2021-03-23' AS Date), NULL, CAST(N'2022-11-29T13:16:56.0500000' AS DateTime2), N'p_lataa_varda_yritysmuoto', N'DWI\akoskini')
GO
INSERT [dw].[d_varda_yritysluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [yritysmuoto_ryhma_fi], [yritysmuoto_ryhma_en], [yritysmuoto_ryhma_sv], [yritys_tyyppi], [yritys_tyyppi_sv], [yritys_tyyppi_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (5, N'26', N'Yksityinen elinkeinonharjoittaja', N'Enskild näringsidkare', NULL, N'Yksityinen elinkeinonharjoittaja', N'Enskild näringsidkare', N'Yksityinen elinkeinonharjoittaja', N'Yksityiset elinkeinonharjoittajat', N'Yksityiset elinkeinonharjoittajat', N'Enskilda näringsidkare', N'Yksityinen', N'Privat', N'Private', CAST(N'2021-03-23' AS Date), NULL, CAST(N'2022-11-29T13:16:56.0500000' AS DateTime2), N'p_lataa_varda_yritysmuoto', N'DWI\akoskini')
GO
INSERT [dw].[d_varda_yritysluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [yritysmuoto_ryhma_fi], [yritysmuoto_ryhma_en], [yritysmuoto_ryhma_sv], [yritys_tyyppi], [yritys_tyyppi_sv], [yritys_tyyppi_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (6, N'45', N'Ortodoksinen kirkko', N'Ortodoxa kyrkan', NULL, N'Ortodoksinen kirkko', N'Ortodoxa kyrkan', N'Ortodoksinen kirkko', N'Yhdistykset ja säätiöt', N'Yhdistykset ja säätiöt', N'Föreningar och stiftelser', N'Yksityinen', N'Privat', N'Private', CAST(N'2021-03-23' AS Date), NULL, CAST(N'2022-11-29T13:16:56.0500000' AS DateTime2), N'p_lataa_varda_yritysmuoto', N'DWI\akoskini')
GO
INSERT [dw].[d_varda_yritysluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [yritysmuoto_ryhma_fi], [yritysmuoto_ryhma_en], [yritysmuoto_ryhma_sv], [yritys_tyyppi], [yritys_tyyppi_sv], [yritys_tyyppi_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (7, N'14', N'Osuuskunta', N'Andelslag', NULL, N'Osuuskunta', N'Andelslag', N'Osuuskunta', N'Yritykset', N'Yritykset', N'Företag', N'Yksityinen', N'Privat', N'Private', CAST(N'2021-03-23' AS Date), NULL, CAST(N'2022-11-29T13:16:56.0500000' AS DateTime2), N'p_lataa_varda_yritysmuoto', N'DWI\akoskini')
GO
INSERT [dw].[d_varda_yritysluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [yritysmuoto_ryhma_fi], [yritysmuoto_ryhma_en], [yritysmuoto_ryhma_sv], [yritys_tyyppi], [yritys_tyyppi_sv], [yritys_tyyppi_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (8, N'46', N'Uskonnollinen yhdyskunta', N'Församling/Lokalsamfund', NULL, N'Uskonnollinen yhdyskunta', N'Församling/Lokalsamfund', N'Uskonnollinen yhdyskunta', N'Yhdistykset ja säätiöt', N'Yhdistykset ja säätiöt', N'Föreningar och stiftelser', N'Yksityinen', N'Privat', N'Private', CAST(N'2021-03-23' AS Date), NULL, CAST(N'2022-11-29T13:16:56.0500000' AS DateTime2), N'p_lataa_varda_yritysmuoto', N'DWI\akoskini')
GO
INSERT [dw].[d_varda_yritysluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [yritysmuoto_ryhma_fi], [yritysmuoto_ryhma_en], [yritysmuoto_ryhma_sv], [yritys_tyyppi], [yritys_tyyppi_sv], [yritys_tyyppi_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (9, N'29', N'Muu yhdistys', N'Annan förening', NULL, N'Muu yhdistys', N'Annan förening', N'Muu yhdistys', N'Yhdistykset ja säätiöt', N'Yhdistykset ja säätiöt', N'Föreningar och stiftelser', N'Yksityinen', N'Privat', N'Private', CAST(N'2021-03-23' AS Date), NULL, CAST(N'2022-11-29T13:16:56.0500000' AS DateTime2), N'p_lataa_varda_yritysmuoto', N'DWI\akoskini')
GO
INSERT [dw].[d_varda_yritysluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [yritysmuoto_ryhma_fi], [yritysmuoto_ryhma_en], [yritysmuoto_ryhma_sv], [yritys_tyyppi], [yritys_tyyppi_sv], [yritys_tyyppi_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (10, N'0', N'Ei yritysmuotoa', N'Ingen företagsform', NULL, N'Ei yritysmuotoa', N'Ingen företagsform', N'Ei yritysmuotoa', N'Yksityiset elinkeinonharjoittajat', N'Yksityiset elinkeinonharjoittajat', N'Enskilda näringsidkare', N'Yksityinen', N'Privat', N'Private', CAST(N'2021-03-23' AS Date), NULL, CAST(N'2022-11-29T13:16:56.0500000' AS DateTime2), N'p_lataa_varda_yritysmuoto', N'DWI\akoskini')
GO
INSERT [dw].[d_varda_yritysluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [yritysmuoto_ryhma_fi], [yritysmuoto_ryhma_en], [yritysmuoto_ryhma_sv], [yritys_tyyppi], [yritys_tyyppi_sv], [yritys_tyyppi_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (11, N'41', N'Kunta', N'Kommun', NULL, N'Kunta', N'Kommun', N'Kunta', N'Kunta', N'Kunta', N'Kommun', N'Kunta', N'Kommun', N'Municipality', CAST(N'2021-03-23' AS Date), NULL, CAST(N'2022-11-29T13:16:56.0500000' AS DateTime2), N'p_lataa_varda_yritysmuoto', N'DWI\akoskini')
GO
INSERT [dw].[d_varda_yritysluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [yritysmuoto_ryhma_fi], [yritysmuoto_ryhma_en], [yritysmuoto_ryhma_sv], [yritys_tyyppi], [yritys_tyyppi_sv], [yritys_tyyppi_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (12, N'42', N'Kuntayhtymä', N'Samkommun', NULL, N'Kuntayhtymä', N'Samkommun', N'Kuntayhtymä', N'Kunta', N'Kunta', N'Kommun', N'Kunta', N'Kommun', N'Municipality', CAST(N'2021-03-23' AS Date), NULL, CAST(N'2022-11-29T13:16:56.0500000' AS DateTime2), N'p_lataa_varda_yritysmuoto', N'DWI\akoskini')
GO
INSERT [dw].[d_varda_yritysluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [yritysmuoto_ryhma_fi], [yritysmuoto_ryhma_en], [yritysmuoto_ryhma_sv], [yritys_tyyppi], [yritys_tyyppi_sv], [yritys_tyyppi_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (13, N'5', N'Avoin yhtiö', N'Öppet bolag', NULL, N'Avoin yhtiö', N'Öppet bolag', N'Avoin yhtiö', N'Yritykset', N'Yritykset', N'Företag', N'Yksityinen', N'Privat', N'Private', CAST(N'2021-03-23' AS Date), NULL, CAST(N'2022-11-29T13:16:56.0500000' AS DateTime2), N'p_lataa_varda_yritysmuoto', N'DWI\akoskini')
GO
INSERT [dw].[d_varda_yritysluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [yritysmuoto_ryhma_fi], [yritysmuoto_ryhma_en], [yritysmuoto_ryhma_sv], [yritys_tyyppi], [yritys_tyyppi_sv], [yritys_tyyppi_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (14, N'44', N'Evankelis-luterilainen kirkko', N'Ev.luth.kyrkan', NULL, N'Evankelis-luterilainen kirkko', N'Ev.luth.kyrkan', N'Evankelis-luterilainen kirkko', N'Yhdistykset ja säätiöt', N'Yhdistykset ja säätiöt', N'Föreningar och stiftelser', N'Yksityinen', N'Privat', N'Private', CAST(N'2021-03-23' AS Date), NULL, CAST(N'2022-11-29T13:16:56.0500000' AS DateTime2), N'p_lataa_varda_yritysmuoto', N'DWI\akoskini')
GO
INSERT [dw].[d_varda_yritysluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [yritysmuoto_ryhma_fi], [yritysmuoto_ryhma_en], [yritysmuoto_ryhma_sv], [yritys_tyyppi], [yritys_tyyppi_sv], [yritys_tyyppi_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (15, N'6', N'Aatteellinen yhdistys', N'Ideell förening', NULL, N'Aatteellinen yhdistys', N'Ideell förening', N'Aatteellinen yhdistys', N'Yhdistykset ja säätiöt', N'Yhdistykset ja säätiöt', N'Föreningar och stiftelser', N'Yksityinen', N'Privat', N'Private', CAST(N'2021-03-23' AS Date), NULL, CAST(N'2022-11-29T13:16:56.0500000' AS DateTime2), N'p_lataa_varda_yritysmuoto', N'DWI\akoskini')
GO
SET IDENTITY_INSERT [dw].[d_varda_yritysluokitus] OFF
GO
ALTER TABLE [dw].[d_varda_yritysluokitus] ADD  CONSTRAINT [DF__d_varda_yritysluokitus__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [dw].[d_varda_yritysluokitus] ADD  CONSTRAINT [DF__d_varda_yritysluokitus__username]  DEFAULT (suser_name()) FOR [username]
GO
