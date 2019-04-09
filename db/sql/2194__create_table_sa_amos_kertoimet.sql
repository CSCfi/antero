USE [ANTERO]
GO
/****** Object:  Table [sa].[sa_amos_kertoimet]    Script Date: 3.4.2019 13:31:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_amos_kertoimet]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[sa_amos_kertoimet](
	[alkaen] [date] NULL,
	[paattyen] [date] NULL,
	[tyyppi] [nvarchar](50) NOT NULL,
	[ryhma_koodi] [nvarchar](100) NULL,
	[ryhma_selite] [nvarchar](100) NULL,
	[kerroin] [decimal](5, 2) NOT NULL
) ON [PRIMARY]
END
GO
INSERT [sa].[sa_amos_kertoimet] ([alkaen], [paattyen], [tyyppi], [ryhma_koodi], [ryhma_selite], [kerroin]) VALUES (CAST(N'2016-01-01' AS Date), CAST(N'2099-12-31' AS Date), N'Tutkintoon johtava', N'ryhma1', NULL, CAST(0.70 AS Decimal(5, 2)))
GO
INSERT [sa].[sa_amos_kertoimet] ([alkaen], [paattyen], [tyyppi], [ryhma_koodi], [ryhma_selite], [kerroin]) VALUES (CAST(N'2016-01-01' AS Date), CAST(N'2099-12-31' AS Date), N'Tutkintoon johtava', N'ryhma2', NULL, CAST(0.99 AS Decimal(5, 2)))
GO
INSERT [sa].[sa_amos_kertoimet] ([alkaen], [paattyen], [tyyppi], [ryhma_koodi], [ryhma_selite], [kerroin]) VALUES (CAST(N'2016-01-01' AS Date), CAST(N'2099-12-31' AS Date), N'Tutkintoon johtava', N'ryhma3', NULL, CAST(1.23 AS Decimal(5, 2)))
GO
INSERT [sa].[sa_amos_kertoimet] ([alkaen], [paattyen], [tyyppi], [ryhma_koodi], [ryhma_selite], [kerroin]) VALUES (CAST(N'2016-01-01' AS Date), CAST(N'2099-12-31' AS Date), N'Tutkintoon johtava', N'ryhma4', NULL, CAST(1.59 AS Decimal(5, 2)))
GO
INSERT [sa].[sa_amos_kertoimet] ([alkaen], [paattyen], [tyyppi], [ryhma_koodi], [ryhma_selite], [kerroin]) VALUES (CAST(N'2016-01-01' AS Date), CAST(N'2099-12-31' AS Date), N'Tutkintoon johtava', N'ryhma5', NULL, CAST(2.33 AS Decimal(5, 2)))
GO
INSERT [sa].[sa_amos_kertoimet] ([alkaen], [paattyen], [tyyppi], [ryhma_koodi], [ryhma_selite], [kerroin]) VALUES (CAST(N'2016-01-01' AS Date), CAST(N'2099-12-31' AS Date), N'Ei tutkintoon johtava', N'valma_ja_telma', NULL, CAST(1.04 AS Decimal(5, 2)))
GO
INSERT [sa].[sa_amos_kertoimet] ([alkaen], [paattyen], [tyyppi], [ryhma_koodi], [ryhma_selite], [kerroin]) VALUES (CAST(N'2016-01-01' AS Date), CAST(N'2099-12-31' AS Date), N'Ei tutkintoon johtava', N'muu', NULL, CAST(0.63 AS Decimal(5, 2)))
GO
INSERT [sa].[sa_amos_kertoimet] ([alkaen], [paattyen], [tyyppi], [ryhma_koodi], [ryhma_selite], [kerroin]) VALUES (CAST(N'2016-01-01' AS Date), CAST(N'2019-12-31' AS Date), N'Erityisopetus', N'tutk_koulutus_ei_erityinen_tuki', NULL, CAST(0.47 AS Decimal(5, 2)))
GO
INSERT [sa].[sa_amos_kertoimet] ([alkaen], [paattyen], [tyyppi], [ryhma_koodi], [ryhma_selite], [kerroin]) VALUES (CAST(N'2016-01-01' AS Date), CAST(N'2019-12-31' AS Date), N'Erityisopetus', N'valm_koulutus_ei_erityinen_tuki', NULL, CAST(0.47 AS Decimal(5, 2)))
GO
INSERT [sa].[sa_amos_kertoimet] ([alkaen], [paattyen], [tyyppi], [ryhma_koodi], [ryhma_selite], [kerroin]) VALUES (CAST(N'2016-01-01' AS Date), CAST(N'2099-12-31' AS Date), N'Erityisopetus', N'tutk_koulutus_vaativa_erityinen_tuki', NULL, CAST(1.42 AS Decimal(5, 2)))
GO
INSERT [sa].[sa_amos_kertoimet] ([alkaen], [paattyen], [tyyppi], [ryhma_koodi], [ryhma_selite], [kerroin]) VALUES (CAST(N'2016-01-01' AS Date), CAST(N'2099-12-31' AS Date), N'Erityisopetus', N'valm_koulutus_vaativa_erityinen_tuki', NULL, CAST(1.04 AS Decimal(5, 2)))
GO
INSERT [sa].[sa_amos_kertoimet] ([alkaen], [paattyen], [tyyppi], [ryhma_koodi], [ryhma_selite], [kerroin]) VALUES (CAST(N'2016-01-01' AS Date), CAST(N'2017-12-31' AS Date), N'Erityisopetus', N'valm_koulutus_vaativa_erityinen_tuki_vaikeasti_vammainen', NULL, CAST(1.43 AS Decimal(5, 2)))
GO
INSERT [sa].[sa_amos_kertoimet] ([alkaen], [paattyen], [tyyppi], [ryhma_koodi], [ryhma_selite], [kerroin]) VALUES (CAST(N'2016-01-01' AS Date), CAST(N'2017-12-31' AS Date), N'Erityisopetus', N'valm_koulutus_vaativa_erityinen_tuki_vammainen_avustaja', NULL, CAST(4.90 AS Decimal(5, 2)))
GO
INSERT [sa].[sa_amos_kertoimet] ([alkaen], [paattyen], [tyyppi], [ryhma_koodi], [ryhma_selite], [kerroin]) VALUES (CAST(N'2016-01-01' AS Date), CAST(N'2099-12-31' AS Date), N'Majoitus', N'tavallinen', NULL, CAST(0.23 AS Decimal(5, 2)))
GO
INSERT [sa].[sa_amos_kertoimet] ([alkaen], [paattyen], [tyyppi], [ryhma_koodi], [ryhma_selite], [kerroin]) VALUES (CAST(N'2016-01-01' AS Date), CAST(N'2099-12-31' AS Date), N'Majoitus', N'sisaoppilaitos', NULL, CAST(0.31 AS Decimal(5, 2)))
GO
INSERT [sa].[sa_amos_kertoimet] ([alkaen], [paattyen], [tyyppi], [ryhma_koodi], [ryhma_selite], [kerroin]) VALUES (CAST(N'2016-01-01' AS Date), CAST(N'2099-12-31' AS Date), N'Majoitus', N'vaativa_erityinen_tuki', NULL, CAST(0.98 AS Decimal(5, 2)))
GO
INSERT [sa].[sa_amos_kertoimet] ([alkaen], [paattyen], [tyyppi], [ryhma_koodi], [ryhma_selite], [kerroin]) VALUES (CAST(N'2016-01-01' AS Date), CAST(N'2099-12-31' AS Date), N'Henkilöstö', N'tutk_johtava', NULL, CAST(-0.53 AS Decimal(5, 2)))
GO
INSERT [sa].[sa_amos_kertoimet] ([alkaen], [paattyen], [tyyppi], [ryhma_koodi], [ryhma_selite], [kerroin]) VALUES (CAST(N'2016-01-01' AS Date), CAST(N'2099-12-31' AS Date), N'Henkilöstö', N'ei_tutk_johtava', NULL, CAST(-0.50 AS Decimal(5, 2)))
GO
INSERT [sa].[sa_amos_kertoimet] ([alkaen], [paattyen], [tyyppi], [ryhma_koodi], [ryhma_selite], [kerroin]) VALUES (CAST(N'2016-01-01' AS Date), CAST(N'2099-12-31' AS Date), N'Tutkintotyyppi (tutkinnot)', N'pt', NULL, CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [sa].[sa_amos_kertoimet] ([alkaen], [paattyen], [tyyppi], [ryhma_koodi], [ryhma_selite], [kerroin]) VALUES (CAST(N'2016-01-01' AS Date), CAST(N'2099-12-31' AS Date), N'Tutkintotyyppi (tutkinnot)', N'at_eat', NULL, CAST(0.60 AS Decimal(5, 2)))
GO
INSERT [sa].[sa_amos_kertoimet] ([alkaen], [paattyen], [tyyppi], [ryhma_koodi], [ryhma_selite], [kerroin]) VALUES (CAST(N'2016-01-01' AS Date), CAST(N'2099-12-31' AS Date), N'Pohjakoulutus', N'ei_pohjakoul', NULL, CAST(72.00 AS Decimal(5, 2)))
GO
INSERT [sa].[sa_amos_kertoimet] ([alkaen], [paattyen], [tyyppi], [ryhma_koodi], [ryhma_selite], [kerroin]) VALUES (CAST(N'2016-01-01' AS Date), CAST(N'2099-12-31' AS Date), N'Pohjakoulutus', N'pohjakoul', NULL, CAST(18.00 AS Decimal(5, 2)))
GO
INSERT [sa].[sa_amos_kertoimet] ([alkaen], [paattyen], [tyyppi], [ryhma_koodi], [ryhma_selite], [kerroin]) VALUES (CAST(N'2016-01-01' AS Date), CAST(N'2099-12-31' AS Date), N'Tutkintotyyppi (opiskelijat)', N'pt', NULL, CAST(1.00 AS Decimal(5, 2)))
GO
INSERT [sa].[sa_amos_kertoimet] ([alkaen], [paattyen], [tyyppi], [ryhma_koodi], [ryhma_selite], [kerroin]) VALUES (CAST(N'2016-01-01' AS Date), CAST(N'2099-12-31' AS Date), N'Tutkintotyyppi (opiskelijat)', N'at_eat', NULL, CAST(0.85 AS Decimal(5, 2)))
GO
INSERT [sa].[sa_amos_kertoimet] ([alkaen], [paattyen], [tyyppi], [ryhma_koodi], [ryhma_selite], [kerroin]) VALUES (CAST(N'2016-01-01' AS Date), CAST(N'2099-12-31' AS Date), N'Ei tutkintoon johtava', N'opisk_valm_tukeva', NULL, CAST(1.41 AS Decimal(5, 2)))
GO
INSERT [sa].[sa_amos_kertoimet] ([alkaen], [paattyen], [tyyppi], [ryhma_koodi], [ryhma_selite], [kerroin]) VALUES (CAST(N'2016-01-01' AS Date), CAST(N'2099-12-31' AS Date), N'Vankilaopetus', NULL, NULL, CAST(0.64 AS Decimal(5, 2)))
GO
INSERT [sa].[sa_amos_kertoimet] ([alkaen], [paattyen], [tyyppi], [ryhma_koodi], [ryhma_selite], [kerroin]) VALUES (CAST(N'2016-01-01' AS Date), CAST(N'2099-12-31' AS Date), N'Tyovoimakoulutus', NULL, NULL, CAST(0.19 AS Decimal(5, 2)))
GO
INSERT [sa].[sa_amos_kertoimet] ([alkaen], [paattyen], [tyyppi], [ryhma_koodi], [ryhma_selite], [kerroin]) VALUES (CAST(N'2018-01-01' AS Date), CAST(N'2019-12-31' AS Date), N'Erityisopetus', N'tutk_koulutus_vaativa_erityinen_tuki_vaikeasti_vammainen', NULL, CAST(2.85 AS Decimal(5, 2)))
GO
INSERT [sa].[sa_amos_kertoimet] ([alkaen], [paattyen], [tyyppi], [ryhma_koodi], [ryhma_selite], [kerroin]) VALUES (CAST(N'2018-01-01' AS Date), CAST(N'2019-12-31' AS Date), N'Erityisopetus', N'tutk_koulutus_vaativa_erityinen_tuki_vammainen_avustaja', NULL, CAST(6.32 AS Decimal(5, 2)))
GO
INSERT [sa].[sa_amos_kertoimet] ([alkaen], [paattyen], [tyyppi], [ryhma_koodi], [ryhma_selite], [kerroin]) VALUES (CAST(N'2018-01-01' AS Date), CAST(N'2019-12-31' AS Date), N'Erityisopetus', N'valm_koulutus_vaativa_erityinen_tuki_vaikeasti_vammainen', NULL, CAST(2.47 AS Decimal(5, 2)))
GO
INSERT [sa].[sa_amos_kertoimet] ([alkaen], [paattyen], [tyyppi], [ryhma_koodi], [ryhma_selite], [kerroin]) VALUES (CAST(N'2018-01-01' AS Date), CAST(N'2019-12-31' AS Date), N'Erityisopetus', N'valm_koulutus_vaativa_erityinen_tuki_vammainen_avustaja', NULL, CAST(5.94 AS Decimal(5, 2)))
