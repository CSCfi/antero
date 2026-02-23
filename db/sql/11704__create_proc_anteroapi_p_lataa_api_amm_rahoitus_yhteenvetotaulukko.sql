USE [AnteroAPI]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE [dw].[p_lataa_api_amm_rahoitus_yhteenvetotaulukko] AS

DECLARE @pvm date

IF EXISTS (select 1 from dw.api_amm_rahoitus_yhteenvetotaulukko)

BEGIN
	
	SET @pvm = dbo.api_update_time(getdate())
  
	TRUNCATE TABLE [api].[amm_rahoitus_yhteenvetotaulukko]

	INSERT [api].[amm_rahoitus_yhteenvetotaulukko] (
		[defaultorder]
		,[varainhoitovuosi]
		,[koodit_koulutuksen_jarjestaja]
		,[koulutuksen_jarjestaja]
		,[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_lahtotaso_ka]
		,[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_kustannusryhma_tutkintotyyppi_korotukset_ka]
		,[tutkinnot_painotettu_ja_tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_ka]
		,[koulutuksen_suorittaneet_tyollistyneet_ja_jatkoopiskelijat_ei_tyollinen_ennen_koulutusta_ka]
		,[opiskelunsa_aloittaneiden_palautteen_painotetut_pisteet_lkm]
		,[opiskelunsa_paattaneiden_palautteen_painotetut_pisteet_lkm]
		,[tyopaikkaohjaajakyselyn_painotetut_pisteet_lkm]
		,[tyopaikkakyselyn_pisteet_lkm]
		,[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_lahtotaso_ka_osuus]
		,[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_kustannusryhma_tutkintotyyppi_korotukset_ka_osuus]
		,[tutkinnot_painotettu_ja_tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_ka_osuus]
		,[koulutuksen_suorittaneet_tyollistyneet_ja_jatkoopiskelijat_ei_tyollinen_ennen_koulutusta_ka_osuus]
		,[opiskelunsa_aloittaneiden_palautteen_painotetut_pisteet_lkm_osuus]
		,[opiskelunsa_paattaneiden_palautteen_painotetut_pisteet_lkm_osuus]
		,[tyopaikkaohjaajakyselyn_painotetut_pisteet_lkm_osuus]
		,[tyopaikkakyselyn_pisteet_lkm_osuus]
		,[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_lahtotaso_ka_osuus_paino]
		,[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_kustannusryhma_tutkintotyyppi_korotukset_ka_osuus_paino]
		,[tutkinnot_painotettu_ja_tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_ka_osuus_paino]
		,[koulutuksen_suorittaneet_tyollistyneet_ja_jatkoopiskelijat_ei_tyollinen_ennen_koulutusta_ka_osuus_paino]
		,[opiskelunsa_aloittaneiden_palautteen_painotetut_pisteet_lkm_osuus_paino]
		,[opiskelunsa_paattaneiden_palautteen_painotetut_pisteet_lkm_osuus_paino]
		,[tyopaikkaohjaajakyselyn_painotetut_pisteet_lkm_osuus_paino]
		,[tyopaikkakyselyn_pisteet_lkm_osuus_paino]
		,[laskennallinen_rahoitus_osuus_ilman_rajoitteita]
		,[laskennallinen_rahoitus_ed_v]
		,[laskennallinen_rahoitus_osuus_ed_v]
		,[laskennallinen_rahoitus_muutos_ed_v_osuuteen_ilman_rajoitteita]
		,[laskennallinen_rahoitus_muutos_minimikerroin]
		,[laskennallinen_rahoitus_muutos_maksimikerroin]
		,[laskennallinen_rahoitus_rajoitekerroin]
		,[laskennallinen_rahoitus_muutos_ed_v_osuuteen]
		,[laskennallinen_rahoitus_osuus]
		,tietojoukko_paivitetty_pvm
	)

	SELECT 
		[defaultorder] = ROW_NUMBER() OVER (ORDER BY [varainhoitovuosi] DESC, [nimi_amos_spl])
		,[varainhoitovuosi]
		,[ytunnus_amos_spl]
		,[nimi_amos_spl]
		,[painotetut_opv_lahtotaso_hyv_ka]
		,[painotetut_opv_kr_hyv_ka]
		,[painotetut_tutk_ja_osp_hyv_ka]
		,[tyoll_ja_jatkoopisk_ei_tyoll_ennen_koul_ka]
		,[aloituskysely_painotetut_pisteet]
		,[paattokysely_painotetut_pisteet]
		,[tyopaikkaohjaajakysely_painotetut_pisteet]
		,[tyopaikkakysely_pisteet]
		,[painotetut_opv_lahtotaso_hyv_ka_osuus]
		,[painotetut_opv_kr_hyv_ka_osuus]
		,[painotetut_tutk_ja_osp_hyv_ka_osuus]
		,[tyoll_ja_jatkoopisk_ei_tyoll_ennen_koul_ka_osuus]
		,[aloituskysely_painotetut_pisteet_osuus]
		,[paattokysely_painotetut_pisteet_osuus]
		,[tyopaikkaohjaajakysely_painotetut_pisteet_osuus]
		,[tyopaikkakysely_pisteet_osuus]
		,[painotetut_opv_lahtotaso_hyv_ka_osuus_paino]
		,[painotetut_opv_kr_hyv_ka_osuus_paino]
		,[painotetut_tutk_ja_osp_hyv_ka_osuus_paino]
		,[tyoll_ja_jatkoopisk_ei_tyoll_ennen_koul_ka_osuus_paino]
		,[aloituskysely_painotetut_pisteet_osuus_paino]
		,[paattokysely_painotetut_pisteet_osuus_paino]
		,[tyopaikkaohjaajakysely_painotetut_pisteet_osuus_paino]
		,[tyopaikkakysely_pisteet_osuus_paino]
		,[laskennallinen_rahoitus_osuus_ilman_rajoitteita]
		,[laskennallinen_rahoitus_ed_v]
		,[laskennallinen_rahoitus_osuus_ed_v]
		,muutos_ed_v_osuuteen_ilman_rajoitteita = 
			cast([laskennallinen_rahoitus_osuus_ilman_rajoitteita] as decimal(15,14)) 
			/ nullif(cast([laskennallinen_rahoitus_osuus_ed_v] as decimal(15,14)), 0.0) 
			- 1
		,[muutos_minimikerroin]
		,[muutos_maksimikerroin]
		,[laskennallinen_rahoitus_rajoitekerroin]
		,muutos_ed_v_osuuteen = coalesce(
			cast([laskennallinen_rahoitus_rajoitekerroin] * [laskennallinen_rahoitus_osuus_ilman_rajoitteita] as decimal(15,14))
			/ nullif(cast([laskennallinen_rahoitus_osuus_ed_v] as decimal(15,14)), 0.0) 
			- 1
			,muutos_minimikerroin - 1 
		)
		,[laskennallinen_rahoitus_osuus]
		,[tietojoukko_paivitetty_pvm] = @pvm
	FROM [dw].[api_amm_rahoitus_yhteenvetotaulukko]

END

ELSE 

BEGIN
	RAISERROR('Source table has no rows.',11,1)
END

GO
