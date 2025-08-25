USE [ANTERO]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_amos_koonti_rahoitusperusteet]') AND type in (N'U'))
DROP TABLE [dw].[f_amos_koonti_rahoitusperusteet]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_amos_koonti_rahoitusperusteet](
	[Varainhoitovuosi] [int] NULL,
	[ytunnus_amos_spl] [varchar](10) NULL,
	[nimi_amos_spl] [nvarchar](255) NULL,
	[laskennallinen_rahoitus_ed_v] [decimal](38, 5) NULL,
	[laskennallinen_rahoitus_osuus_ed_v] [decimal](30, 29) NULL,
	[painotetut_opv_lahtotaso_hyv_ka_osuus] [decimal](30, 29) NULL,
	[painotetut_opv_kr_hyv_ka_osuus] [decimal](30, 29) NULL,
	[painotetut_tutk_ja_osp_hyv_ka_osuus] [decimal](30, 29) NULL,
	[tyoll_ja_jatkoopisk_ei_tyoll_ennen_koul_ka_osuus] [decimal](30, 29) NULL,
	[tyopaikkakysely_pisteet_osuus] [decimal](30, 29) NULL,
	[tyopaikkaohjaajakysely_painotetut_pisteet_osuus] [decimal](30, 29) NULL,
	[aloituskysely_painotetut_pisteet_osuus] [decimal](30, 29) NULL,
	[paattokysely_painotetut_pisteet_osuus] [decimal](30, 29) NULL,
	[painotetut_opv_lahtotaso_hyv_ka_osuus_paino] [numeric](2, 2) NOT NULL,
	[painotetut_opv_kr_hyv_ka_osuus_paino] [numeric](2, 2) NOT NULL,
	[painotetut_tutk_ja_osp_hyv_ka_osuus_paino] [numeric](2, 2) NOT NULL,
	[tyoll_ja_jatkoopisk_ei_tyoll_ennen_koul_ka_osuus_paino] [numeric](2, 2) NOT NULL,
	[tyopaikkakysely_pisteet_osuus_paino] [numeric](4, 4) NOT NULL,
	[tyopaikkaohjaajakysely_painotetut_pisteet_osuus_paino] [numeric](4, 4) NOT NULL,
	[aloituskysely_painotetut_pisteet_osuus_paino] [numeric](4, 4) NOT NULL,
	[paattokysely_painotetut_pisteet_osuus_paino] [numeric](4, 4) NOT NULL,
	[laskennallinen_rahoitus_osuus_ilman_rajoitteita] [decimal](30, 29) NULL,
	[muutos_minimikerroin] [decimal](30, 29) NULL,
	[muutos_maksimikerroin] [decimal](30, 29) NULL,
	[rajoitekerroin_minimi] [decimal](30, 27) NULL,
	[rajoitekerroin_maksimi] [decimal](30, 27) NULL,
	[laskennallinen_rahoitus_rajoitekerroin] [decimal](30, 27) NULL,
	[laskennallinen_rahoitus_osuus] [decimal](30, 29) NULL,
	[laskennallinen_rahoitus_rajoitekerroin_estimaatti] [decimal](30, 27) NULL,
	[laskennallinen_rahoitus_osuus_estimaatti] [decimal](30, 29) NULL
) ON [PRIMARY]
GO
