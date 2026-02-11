USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut_uusi] @generoitu2 int = null
AS

DECLARE @maxRahoituskausiPohjatutkinto varchar(24) = (select max(rahoituskausi) from sa.sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot_uusi)
DECLARE @maxSuorituskausiPohjatutkinto varchar(24) = (select max(suorituskausi) from sa.sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot_uusi)

DECLARE @generoitu int = @generoitu2

BEGIN
	DELETE FROM dw.f_amos_tutkinnot_ja_tutkinnonosat_painotetut_uusi
	WHERE generoitu = @generoitu
END

INSERT INTO [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut_uusi] (
	generoitu
	,paivays
	,[rahoituskausi]
	,vuosiraportti_1_0
    ,[tilastovuosi]
    ,[suorituskausi]
    ,[d_kalenteri_id]
	,[d_kalenteri_alkamispaiva_id]
    ,[d_sukupuoli_id]
    ,[d_kieli_aidinkieli_id]
    ,[d_ika_id]
	,[perusopetuksen_suoritusvuosi]
	,[d_opintojen_kulku_keskiarvot_keskiarvoluokka_id]
    ,[d_erityisopetus_id]
    ,[d_koulutusluokitus_id]
    ,[d_organisaatioluokitus_jarjestaja_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_id]
	,[d_organisaatioluokitus_jarjestaja_hist_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_hist_id]
    ,[d_amos_spl_jarjestaja_linkki_id]
    ,[d_organisaatioluokitus_oppilaitos_id]
    ,[d_organisaatioluokitus_oppilaitos_pihvi_id]
    ,[d_organisaatioluokitus_toimipiste_id]
    ,[d_kustannusryhma_id]
    ,[d_suorituksen_tyyppi_id]
	,[d_osaamisala_id]
	,[d_kieli_suoritus_id]
    ,[d_opintojenrahoitus_id]
    ,[d_maksuttomuus_id]
    ,[d_oppisopimuskoulutus_id]
    ,[d_kytkin_vankilaopetus_id]
	,[d_amos_luvaton_koulutus_id]
	,[d_amos_luvaton_korotustekija_id]
	,[d_kieli_suoritus_luvanmukainen_id]
	,[d_kytkin_hankintakoulutus_id]
	,[painottamaton_tutkinnot]
	,[painottamaton_osatutkinnot] 
	,[painottamaton_osaamispisteet]
	,[enimmaismaaran_mukaiset_opv_ka]
	,[osaamispisteet_kerroin]
	,[painotettu_tutkinnot]
)

SELECT  
	generoitu
	,paivays
	,[rahoituskausi]
	,vuosiraportti_1_0
    ,[tilastovuosi]
    ,[suorituskausi]
	,[d_kalenteri_id]
	,[d_kalenteri_alkamispaiva_id]
	,[d_sukupuoli_id]
	,[d_kieli_aidinkieli_id]
	,[d_ika_id]
	,[perusopetuksen_suoritusvuosi]
	,[d_opintojen_kulku_keskiarvot_keskiarvoluokka_id]
	,[d_erityisopetus_id]
	,[d_koulutusluokitus_id]
	,[d_organisaatioluokitus_jarjestaja_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_id]
	,[d_organisaatioluokitus_jarjestaja_hist_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_hist_id]
	,[d_amos_spl_jarjestaja_linkki_id]
	,[d_organisaatioluokitus_oppilaitos_id]
	,[d_organisaatioluokitus_oppilaitos_pihvi_id]
	,[d_organisaatioluokitus_toimipiste_id]
	,[d_kustannusryhma_id]
	,[d_suorituksen_tyyppi_id]
	,[d_osaamisala_id]
	,[d_kieli_suoritus_id]
	,[d_opintojenrahoitus_id]
    ,[d_maksuttomuus_id]
	,[d_oppisopimuskoulutus_id]
	,[d_kytkin_vankilaopetus_id]
	,[d_amos_luvaton_koulutus_id]
	,[d_amos_luvaton_korotustekija_id]
	,[d_kieli_suoritus_luvanmukainen_id]
	,[d_kytkin_hankintakoulutus_id]
	,[painottamaton_tutkinnot]
	,[painottamaton_osatutkinnot] 
	,[painottamaton_osaamispisteet]
	,[enimmaismaaran_mukaiset_opv_ka]
	,[osaamispisteet_kerroin]
	,[painotettu_tutkinnot]

FROM (

	SELECT
		generoitu
		,paivays
		,f.[rahoituskausi]
		,vuosiraportti_1_0
		,[Tilastovuosi]
		,f.[suorituskausi]
		,[d_kalenteri_id]
		,[d_kalenteri_alkamispaiva_id]
		,[d_sukupuoli_id]
		,[d_kieli_aidinkieli_id]
		,[d_ika_id]
		,[perusopetuksen_suoritusvuosi]
		,[d_opintojen_kulku_keskiarvot_keskiarvoluokka_id]
		,[d_erityisopetus_id]
		,[d_koulutusluokitus_id]
		,[d_organisaatioluokitus_jarjestaja_id]
		,[d_organisaatioluokitus_jarjestaja_pihvi_id]
		,[d_organisaatioluokitus_jarjestaja_hist_id]
		,[d_organisaatioluokitus_jarjestaja_pihvi_hist_id]
		,[d_amos_spl_jarjestaja_linkki_id]
		,[d_organisaatioluokitus_oppilaitos_id]
		,[d_organisaatioluokitus_oppilaitos_pihvi_id]
		,[d_organisaatioluokitus_toimipiste_id]
		,[d_kustannusryhma_id]
		,[d_suorituksen_tyyppi_id]
		,[d_osaamisala_id]
		,[d_kieli_suoritus_id]
		,[d_opintojenrahoitus_id]
		,[d_maksuttomuus_id]
		,[d_oppisopimuskoulutus_id]
		,[d_kytkin_vankilaopetus_id]
		,[d_amos_luvaton_koulutus_id] 
		,[d_amos_luvaton_korotustekija_id] 
		,[d_kieli_suoritus_luvanmukainen_id]
		,[d_kytkin_hankintakoulutus_id]
		,[painottamaton_tutkinnot] = [koko_tutkinto]
		,[painottamaton_osatutkinnot] = [tutkinnon_osat]
		,[painottamaton_osaamispisteet] = [osaamispisteet]
		,[enimmaismaaran_mukaiset_opv_ka] = ca2.opv_ka_hyv
		,[osaamispisteet_kerroin] = ca3.osp_kerroin
		,[painotettu_tutkinnot] = 
			72.0
			* (case when d5.koodi = '1' then koko_tutkinto else 0 end) 
			* coalesce(pk.ei_pk_osuus, ca.ei_pk_osuus_kaikki)
			
	FROM [dw].[f_amos_tutkinnot_ja_tutkinnonosat_uusi] f
	left join dw.d_amos_spl_jarjestaja_linkki d0 on d0.id = f.d_amos_spl_jarjestaja_linkki_id
	left join dw.d_koulutusluokitus d1 on d1.id = f.d_koulutusluokitus_id
	left join dw.d_ammatillisen_tutkinnon_kustannusryhma d2 on d2.id = f.d_kustannusryhma_id
	left join dw.d_erityisopetus d6 on d6.id = f.d_erityisopetus_id
	left join dw.d_organisaatioluokitus d3 on d3.id = f.d_organisaatioluokitus_jarjestaja_id
	left join dw.d_suorituksen_tyyppi d5 on d5.id = f.d_suorituksen_tyyppi_id
	left join dw.d_amos_luvaton_korotustekija d24 on d24.koodi = f.d_amos_luvaton_korotustekija_id
	
	--tutkintojen pohjakoulutuksettomien osuudet; järjestäjälle löytyy osuus aineistosta
	left join sa.sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot_uusi pk 
		on pk.rahoituskausi = (case when right(f.rahoituskausi,4) > right(@maxRahoituskausiPohjatutkinto,4) then @maxRahoituskausiPohjatutkinto else f.rahoituskausi end) 
		and pk.suorituskausi = (case when right(f.suorituskausi,4) > right(@maxSuorituskausiPohjatutkinto,4) then @maxSuorituskausiPohjatutkinto else f.suorituskausi end) 
		and pk.ytunnus = coalesce(d0.ytunnus_amos_spl, d0.ytunnus_avain)
	--jos järjestäjälle ei löydy osuutta, käytetään koko aineiston jakaumaa
	cross apply (
		select 
			ei_pk_osuus_kaikki = cast(avg(ei_pk_osuus_kaikki) as decimal(30, 20))
		from [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot_uusi] 
		where 1=1
		and rahoituskausi = (case when right(f.rahoituskausi,4) > right(@maxRahoituskausiPohjatutkinto,4) then @maxRahoituskausiPohjatutkinto else f.rahoituskausi end) 
		and suorituskausi = (case when right(f.suorituskausi,4) > right(@maxSuorituskausiPohjatutkinto,4) then @maxSuorituskausiPohjatutkinto else f.suorituskausi end) 
	) ca

	--enimmäismääriin verrattavat opiskelijavuosikertymät per rahoituskausi
	left join (
		select 
			rahoituskausi
			,ytunnus = coalesce(d.ytunnus_amos_spl, d.ytunnus_avain) 
			,opv_ei_maksuton_ka = 0.5 * sum(case when f.maksuttomuus = 0 then opiskelijavuodet end)
			,opv_maksuton_ka = 0.5 * sum(case when f.maksuttomuus = 1 then opiskelijavuodet end)
		from dw.f_amos_opiskelijavuodet_uusi f
		left join dw.d_amos_spl_jarjestaja_linkki d on d.id = f.d_amos_spl_jarjestaja_linkki_id
		left join dw.d_erityisopetus d1 on d1.id = f.d_erityisopetus_id
		left join dw.d_majoitus d1b on d1b.id = f.d_majoitus_id
		left join dw.d_amos_luvaton_koulutus d2 on d2.id = f.d_amos_luvaton_koulutus_id
		left join dw.d_kieli d3 on d3.id = f.d_kieli_suoritus_luvanmukainen_id
		left join dw.d_ammatillisen_tutkinnon_kustannusryhma d3b on d3b.id = f.d_kustannusryhma_uusi_id
		left join dw.d_opintojenrahoitus d4 on d4.id = f.d_opintojenrahoitus_id
		where 1=1
		and f.generoitu = @generoitu
		and d2.koodi = 1 
		and (d3.kieli_koodi != '-2' or d3b.koodi = 'muu') 
		and d4.sisaltyy_okm_perusrahoitus = 1
		group by rahoituskausi, coalesce(d.ytunnus_amos_spl, d.ytunnus_avain)
	) opv_ka
		on opv_ka.rahoituskausi = f.rahoituskausi 
		and opv_ka.ytunnus = coalesce(d0.ytunnus_amos_spl, d0.ytunnus_avain) 

	--ei maksuttomien enimmäismäärä; HUOM. lopulta Oivasta
	outer apply (
		select 
			opv_ei_maksuton_max = t.[Ei_maksuttoman_koulutuksen_enimmäismäärä]
		from sa.sa_amos_ei_maksuttoman_koulutuksen_enimmaismaarat t
		left join dw.d_amos_spl_jarjestaja_linkki d on d.ytunnus_avain = t.Y_tunnus 
		where coalesce(d.ytunnus_amos_spl, d.ytunnus_avain) = coalesce(d0.ytunnus_amos_spl, d0.ytunnus_avain)	
	) jl 

	--enimmäismäärän mukaiset opv leikkuria varten
	outer apply (
		select opv_ka_hyv = 
			coalesce(opv_ka.opv_maksuton_ka, 0.0)
			+ case when opv_ka.opv_ei_maksuton_ka > jl.opv_ei_maksuton_max then jl.opv_ei_maksuton_max else coalesce(opv_ka.opv_ei_maksuton_ka, 0.0) end
	) ca2

	--osaamispisteiden kertymä leikkuria varten
	left join (
		select 
			rahoituskausi
			,ytunnus = coalesce(d.ytunnus_amos_spl, d.ytunnus_avain) 
			,osaamispisteet_ka = 0.5 * sum(f.[osaamispisteet])
		from [dw].[f_amos_tutkinnot_ja_tutkinnonosat_uusi] f
		left join dw.d_amos_spl_jarjestaja_linkki d on d.id = f.d_amos_spl_jarjestaja_linkki_id
		left join dw.d_amos_luvaton_koulutus d2 on d2.id = f.d_amos_luvaton_koulutus_id
		left join dw.d_kieli d3 on d3.id = f.d_kieli_suoritus_luvanmukainen_id
		left join dw.d_opintojenrahoitus d4 on d4.id = f.d_opintojenrahoitus_id
		where 1=1
		and f.generoitu = @generoitu
		and d2.koodi in ('1','23') 
		and d3.kieli_koodi != '-2'
		and d4.sisaltyy_okm_suoritusrahoitus = 1
		group by rahoituskausi, coalesce(d.ytunnus_amos_spl, d.ytunnus_avain)
	) osp
		on osp.rahoituskausi = f.rahoituskausi 
		and osp.ytunnus = coalesce(d0.ytunnus_amos_spl, d0.ytunnus_avain) 

	--osaamispisteleikkuri
	outer apply (
		select 
			osp_kerroin = 
				cast(
					case 
						when osp.osaamispisteet_ka > 120.0 * ca2.opv_ka_hyv then 120.0 * ca2.opv_ka_hyv / osp.osaamispisteet_ka
						else 1.0
					end
					as decimal(30,29)
				)
	) ca3

	WHERE f.generoitu = @generoitu
	  
) q

GO
