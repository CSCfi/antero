USE [ANTERO]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_rahoitusmalli_yo_koulutus]    Script Date: 30.9.2020 15:49:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [sa].[p_lataa_rahoitusmalli_yo_koulutus] AS


DROP TABLE IF EXISTS sa.rahoitusmalli_yo_koulutus
--TRUNCATE TABLE sa.rahoitusmalli_yo_koulutus

--INSERT INTO sa.rahoitusmalli_yo_koulutus

SELECT 	
	 tilastovuosi

	,oppilaitos_koodi
	,koulutus_koodi
	,ohjauksen_ala_koodi
	,avain

	,lkm = mittari

	,tarkenne1_selite = cast(tarkenne1_selite as varchar(50))
	,tarkenne1_arvo = cast(tarkenne1_arvo as varchar(50))
	,tarkenne2_selite = cast(tarkenne2_selite as varchar(50))
	,tarkenne2_arvo = cast(tarkenne2_arvo as varchar(50))
	,tarkenne3_selite = cast(tarkenne3_selite as varchar(50))
	,tarkenne3_arvo = cast(tarkenne3_arvo as varchar(50))
	,tarkenne4_selite = cast(tarkenne4_selite as varchar(50))
	,tarkenne4_arvo = cast(tarkenne4_arvo as varchar(50))
	,tarkenne5_selite = cast(tarkenne5_selite as varchar(50))
	,tarkenne5_arvo = cast(tarkenne5_arvo as varchar(50))
INTO sa.rahoitusmalli_yo_koulutus
FROM (

	-- Ylemmät kk-tutkinnot
	SELECT
		 tilastovuosi = tilastointivuosi
		,oppilaitos_koodi = oppilaitos
		,koulutus_koodi = koulutusluokitus
		,ohjauksen_ala_koodi = OKM_ohjauksen_ala_koodi

		,mittari = sum(tutkinnot)

		,avain = 'tutkinnot_ylempi_kk17'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot] f
	left join VipunenTK.dbo.d_koulutusluokitus d1 on d1.id = f.koulutusluokitus_id
	WHERE d1.Koulutusaste_taso2_koodi = '72'
	GROUP BY tilastointivuosi, oppilaitos, koulutusluokitus, OKM_ohjauksen_ala_koodi
	HAVING sum(tutkinnot) > 0

	UNION ALL

	-- Ylemmät kk-tutkinnot
	SELECT
		tilastovuosi = tutkintovuosi
		,oppilaitos = oppilaitosnro
		,koulutus_koodi = tutkintokoodi
		,ohjauksen_ala_koodi = okmohjauksenala_koodi

		,mittari = count(distinct concat(opiskelijaavain,opiskeluoikeusAvain,oppilaitosnro))

		,indikaattori_lyhenne = 'tutkinnot_ylempi_kk'

		,tarkenne1_selite = 'maara_aika'
		,tarkenne1_arvo = case when tavoiteajassavalmistunut = 1 then 1 when xonenintaan12kk = 1 then 2 else 0 end
		,tarkenne2_selite = 'tutkintoryhma'
		,tarkenne2_arvo = xxltutkintoryhma
		,tarkenne3_selite = 'aiempi_tutkinto'
		,tarkenne3_arvo = onaiempitutkinto
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM ANTERO.sa.sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet f
	left join ANTERO.dw.d_koulutusluokitus d1 on d1.koulutusluokitus_koodi = f.tutkintokoodi
	WHERE d1.koulutusastetaso2_koodi = '72' and coalesce(f.xxmrahoituslahde,1) != 4
	GROUP BY tutkintovuosi, oppilaitosnro, tutkintokoodi, okmohjauksenala_koodi, (case when tavoiteajassavalmistunut = 1 then 1 when xonenintaan12kk = 1 then 2 else 0 end), xxltutkintoryhma, onaiempitutkinto
	HAVING count(distinct concat(opiskelijaavain,opiskeluoikeusAvain,oppilaitosnro)) > 0

	UNION ALL

	-- Alemmat kk-tutkinnot
	SELECT
		 tilastovuosi = tilastointivuosi
		,oppilaitos
		,koulutus_koodi = koulutusluokitus
		,ohjauksen_ala_koodi = OKM_ohjauksen_ala_koodi

		,mittari = sum(tutkinnot)

		,indikaattori_lyhenne = 'tutkinnot_alempi_kk17'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot] f
	left join VipunenTK.dbo.d_koulutusluokitus d1 on d1.id = f.koulutusluokitus_id
	WHERE d1.Koulutusaste_taso2_koodi = '63'
	GROUP BY tilastointivuosi, oppilaitos, koulutusluokitus, OKM_ohjauksen_ala_koodi
	HAVING sum(tutkinnot) > 0

	UNION ALL

	-- Alemmat kk-tutkinnot
	SELECT
		tilastovuosi = tutkintovuosi
		,oppilaitos = oppilaitosnro
		,koulutus_koodi = tutkintokoodi
		,ohjauksen_ala_koodi = okmohjauksenala_koodi

		,mittari = count(distinct concat(opiskelijaavain,opiskeluoikeusAvain,oppilaitosnro))

		,indikaattori_lyhenne = 'tutkinnot_alempi_kk'

		,tarkenne1_selite = 'maara_aika'
		,tarkenne1_arvo = case when tavoiteajassavalmistunut = 1 then 1 when xonenintaan12kk = 1 then 2 else 0 end
		,tarkenne2_selite = 'tutkintoryhma'
		,tarkenne2_arvo = xxltutkintoryhma
		,tarkenne3_selite = 'aiempi_tutkinto'
		,tarkenne3_arvo = onaiempitutkinto
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM ANTERO.sa.sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet f
	left join ANTERO.dw.d_koulutusluokitus d1 on d1.koulutusluokitus_koodi = f.tutkintokoodi
	WHERE d1.koulutusastetaso2_koodi = '63'
	GROUP BY tutkintovuosi, oppilaitosnro, tutkintokoodi, okmohjauksenala_koodi, (case when tavoiteajassavalmistunut = 1 then 1 when xonenintaan12kk = 1 then 2 else 0 end), xxltutkintoryhma, onaiempitutkinto
	HAVING count(distinct concat(opiskelijaavain,opiskeluoikeusAvain,oppilaitosnro)) > 0

	UNION ALL

	-- Ulkomaalaisten ylemmät kk-tutkinnot
	SELECT
		tilastovuosi = tilastointivuosi
		,oppilaitos = oppilaitos
		,koulutus_koodi = koulutusluokitus
		,ohjauksen_ala_koodi = okmohjauksenala_koodi

		,mittari = sum(lukumaara)

		,indikaattori_lyhenne = 'tutkinnot_ylempi_kk_ulk'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM VipunenTK.dbo.f_OTV_2_9_Korkeakoulututkinnot f
	left join ANTERO.dw.d_koulutusluokitus d1 on d1.koulutusluokitus_koodi = f.koulutusluokitus
	WHERE d1.koulutusastetaso2_koodi = '72' and kansalaisuus_versio2 != '-1'
	GROUP BY tilastointivuosi, oppilaitos, koulutusluokitus, okmohjauksenala_koodi
	HAVING sum(lukumaara) > 0

	UNION ALL

	--55 suorittaneet
	SELECT
		tilastointivuosi = vuosi
		,oppilaitos = d1.organisaatio_koodi
		,koulutusluokitus = d2.koulutusluokitus_koodi
		,ohjauksen_ala = d2.okmohjauksenala_koodi

		,mittari = count(distinct henkilokoodi)

		,indikaattori_lyhenne = '55_op_suorittaneet'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM [ANTERO].[dw].[f_virta_otp_55_tilasto] f
	left join ANTERO.dw.d_organisaatioluokitus d1 on d1.id = f.d_organisaatio_id
	left join ANTERO.dw.d_koulutusluokitus d2 on d2.id = f.d_koulutusluokitus_id
	WHERE ([suorittanut27]=1 or [suorittanut55ilmanPankkia]=1 or [suorittanut55PankinAvulla]=1)
	and d2.koulutusastetaso2_koodi in ('63','72')
	GROUP BY vuosi, d1.organisaatio_koodi, d2.koulutusluokitus_koodi, d2.okmohjauksenala_koodi

	UNION ALL
	
	-- Jatkuva oppiminen, Avoimen korkeakoulutuksen opintopisteet
	SELECT
		 tilastointivuosi = vuosi
		,oppilaitos = d1.yo_tunnus
		,koulutusluokitus = null
		,ohjauksen_ala = d2.ohjauksenala_koodi

		,mittari = sum(avoinop_yliop_lkm)+sum(erillisilla_oik_op_lkm)+sum(erikoul_suor_op_lkm)+sum(joo_op_lkm)

		,indikaattori_lyhenne = 'opintopisteet_jatkuva17'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM [ANTERO].[dw].[f_yo_opintopisteet] f
	left join ANTERO.dw.d_yo d1 on d1.id = f.d_yo_id
	left join ANTERO.dw.d_ohjauksenala d2 on d2.id = f.d_ohjauksenala_id
	GROUP BY vuosi, d1.yo_tunnus, d2.ohjauksenala_koodi
	HAVING sum(avoinop_yliop_lkm)+sum(erillisilla_oik_op_lkm)+sum(erikoul_suor_op_lkm)+sum(joo_op_lkm) > 0
	
	UNION ALL

	-- Jatkuva oppiminen, Avoimen korkeakoulutuksen opintopisteet
	SELECT
		 tilastointivuosi = vuosi
		,oppilaitos = d1.yo_tunnus
		,koulutusluokitus = null
		,ohjauksen_ala = d2.ohjauksenala_koodi

		,mittari = sum(avoinop_yliop_lkm)+sum(erillisilla_oik_op_lkm)+sum(erikoul_suor_op_lkm)

		,indikaattori_lyhenne = 'opintopisteet_jatkuva'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM [ANTERO].[dw].[f_yo_opintopisteet] f
	left join ANTERO.dw.d_yo d1 on d1.id = f.d_yo_id
	left join ANTERO.dw.d_ohjauksenala d2 on d2.id = f.d_ohjauksenala_id
	GROUP BY vuosi, d1.yo_tunnus, d2.ohjauksenala_koodi
	HAVING sum(avoinop_yliop_lkm)+sum(erillisilla_oik_op_lkm)+sum(erikoul_suor_op_lkm) > 0
	
	UNION ALL
	
	-- Jatkuva oppiminen, Yhteistyöopintojen opintopisteet
	SELECT
		tilastointivuosi = vuosi
		,oppilaitos = d1.yo_tunnus
		,koulutusluokitus = null
		,ohjauksen_ala = d2.ohjauksenala_koodi

		,mittari = sum(f.joo_op_lkm)

		,indikaattori_lyhenne = 'opintopisteet_yhteistyo'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM [ANTERO].[dw].[f_yo_opintopisteet] f
	left join ANTERO.dw.d_yo d1 on d1.id = f.d_yo_id
	left join ANTERO.dw.d_ohjauksenala d2 on d2.id = f.d_ohjauksenala_id
	GROUP BY vuosi, d1.yo_tunnus, d2.ohjauksenala_koodi
	HAVING sum(joo_op_lkm) > 0

	UNION ALL

	--Kv opiskelijaliikkuvuus
	SELECT
		vuosi
		,oppilaitos = d1.yo_tunnus
		,koulutusluokitus = null
		,ohjauksen_ala = d2.ohjauksenala_koodi

		,mittari = sum(kv_vaihtoopiskelijat_op_lkm)+sum(ulkom_hyv_luetut_op_lkm)+sum(ulkom_harj_op_lkm)

		,indikaattori_lyhenne = 'opintopisteet_kv'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM [ANTERO].[dw].[f_yo_opintopisteet] f
	left join ANTERO.dw.d_yo d1 on d1.id = f.d_yo_id
	left join ANTERO.dw.d_ohjauksenala d2 on d2.id = f.d_ohjauksenala_id
	GROUP BY vuosi, d1.yo_tunnus, d2.ohjauksenala_koodi
	HAVING sum(kv_vaihtoopiskelijat_op_lkm)+sum(ulkom_hyv_luetut_op_lkm)+sum(ulkom_harj_op_lkm) > 0

	UNION ALL

	-- Työllistyminen ja työllistymisen laatu, Työllistyminen 1 v.
	SELECT
		tilastointivuosi
		,oppilaitos
		,koulutusluokitus
		,ohjauksen_ala = OKM_ohjauksen_ala_koodi

		,mittari = sum(case when d1.paaasiallinen_toiminta_okm_koodi=1 then sijoittuminen_1v_tutkinnon_jalkeen else 0 end)

		,indikaattori_lyhenne = 'tyolliset_1v'

		,tarkenne1_selite = 'ammattiasema'
		,tarkenne1_arvo = ammattiasema
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM [VipunenTK].[dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] f
	left join VipunenTK.dbo.d_paaasiallinen_toiminta_okm d1 on d1.id = f.paaasiallinen_toiminta_okm_id
	left join VipunenTK.dbo.d_koulutusluokitus d2 on d2.id = f.koulutusluokitus_id
	WHERE d2.Koulutusaste_taso2_koodi = '72'
	GROUP BY tilastointivuosi, oppilaitos, koulutusluokitus, OKM_ohjauksen_ala_koodi, ammattiasema
	HAVING sum(case when d1.paaasiallinen_toiminta_okm_koodi=1 then sijoittuminen_1v_tutkinnon_jalkeen else 0 end) > 0
	
	UNION ALL

	-- Työllistyminen ja työllistymisen laatu, Uraseuranta
	SELECT
		tilastovuosi = f.kyselyvuosi
		,oppilaitos = d3.organisaatio_koodi
		,koulutusluokitus = d4.koulutusluokitus_koodi
		,ohjauksen_ala = d4.okmohjauksenala_koodi

		,mittari = sum(cast(f.numerovalinta as int))

		,indikaattori_lyhenne = 'opiskelijapalaute_ura'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM ANTERO.dw.f_arvo_yo_uraseuranta_2018 f
	--left join ANTERO.dw.d_arvokyselykerta d1 on d1.id = f.d_arvokyselykerta_id
	--left join ANTERO.dw.d_arvokysymys d2 on d2.id = f.d_arvokysymys_id
	--left join (select organisaatio_koodi,organisaatio_fi from ANTERO.dw.d_organisaatioluokitus where organisaatio_koodi=organisaatio_nykyinen_koodi and organisaatio_avain like 'oppilaitos%') d3 on d3.organisaatio_fi = f.Korkeakoulu
	left join dw.d_organisaatioluokitus d3 on d3.organisaatio_koodi = cast(right(concat('00',f.[Koodit Korkeakoulu]),5) as varchar(50))
	left join dw.d_koulutusluokitus d4 on d4.koulutusluokitus_koodi = f.[Koodit Koulutus]
	WHERE rahoitusmallikysymys = 'Kyllä'
	GROUP BY f.kyselyvuosi, d3.organisaatio_koodi, d4.koulutusluokitus_koodi, d4.okmohjauksenala_koodi
	
	
	UNION ALL

	-- Opiskelijapalaute
	SELECT
		tilastovuosi = d1.vuosi
		,oppilaitos = d3.organisaatio_koodi
		,koulutusluokitus = d4.koulutusluokitus_koodi
		,ohjauksen_ala = d4.okmohjauksenala_koodi

		,mittari = sum(cast(f.numerovalinta as float))

		,indikaattori_lyhenne = 'opiskelijapalaute_kandi'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM ANTERO.dw.f_arvo_kandi f
	left join ANTERO.dw.d_arvokyselykerta d1 on d1.id = f.d_arvokyselykerta_id
	left join ANTERO.dw.d_arvokysymys d2 on d2.id = f.d_arvokysymys_id
	left join ANTERO.dw.d_organisaatioluokitus d3 on d3.id = f.d_organisaatio_oppilaitos_id
	left join ANTERO.dw.d_koulutusluokitus d4 on d4.id = f.d_koulutusluokitus_id
	WHERE d2.rahoitusmallikysymys = 1 and d1.vuosi >= 2018
	GROUP BY d1.vuosi, d3.organisaatio_koodi, d4.koulutusluokitus_koodi, d4.okmohjauksenala_koodi
	HAVING sum(cast(f.numerovalinta as float)) > 0
	
	UNION ALL

	-- Opiskelijapalaute
	-- Opiskelijapalautteen lääketieteen opiskelijoiden vastausajankohta siirtyi 3. vuoden alusta 4. vuoden alkuun, jonka takia lääketieteen vastauksia ei ole olemassa vuosilta 2016-2017 (eri yliopistoissa ajankohdan siirto ajoittui eri vuosiin)... 
	-- Rahoituslaskelmassa käytetään kolmen viimeisen käytettävissä olevan tilastovuoden tietoja... 
	-- Vuoden 2017 tiedot lääketieteestä ovat HY:n ja TY:n tapauksessa keskiarvoja 2015 ja 2017 summasta ja UEF:n, OY:n ja TaY:n osalta keskiarvoja 2015 ja 2016 summasta.
	SELECT
		tilastovuosi = f.tilastovuosi
		,oppilaitos = f.korkeakoulu_koodi
		,koulutusluokitus = null
		,ohjauksen_ala = null

		,mittari = sum(cast(opiskelijapalaute as float))

		,indikaattori_lyhenne = 'opiskelijapalaute_kandi'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM [VipunenTK_lisatiedot].[dbo].[Rahoitusmalli_korkeakoulut_opiskelijapalaute] f
	left join ANTERO.dw.d_organisaatioluokitus d3 on d3.organisaatio_koodi = f.korkeakoulu_koodi
	WHERE f.tilastovuosi < 2018 and sektori = 'Yliopisto'
	GROUP BY f.tilastovuosi,f.korkeakoulu_koodi
	HAVING sum(cast(opiskelijapalaute as float)) > 0
	

) Q

WHERE tilastovuosi >= 2012

