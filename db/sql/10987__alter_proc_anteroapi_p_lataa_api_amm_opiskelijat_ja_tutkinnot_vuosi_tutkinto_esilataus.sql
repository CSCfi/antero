USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto_esilataus]    Script Date: 4.8.2025 12.22.31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER PROCEDURE [dw].[p_lataa_api_amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto_esilataus] AS

TRUNCATE TABLE [dw].[api_amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto]

INSERT INTO [dw].[api_amm_opiskelijat_ja_tutkinnot_vuosi_tutkinto]

SELECT 
	[defaultorder] = ROW_NUMBER() OVER(ORDER BY f.tilastovuosi, d11.organisaatio_fi, d17.selite_fi, d4.koulutusluokitus_fi)

	,f.tilastovuosi

	,[suorituksen_tyyppi] = d17.selite_fi
	,[tutkintotyyppi] = 
		case 
			when valmentava_koodi = 1 then 'VALMA' 
			when valmentava_koodi = 2 then 'TELMA' 
			when valmentava_koodi = 3 then 'TUVA' 
			when d24.kytkin_koodi = 1 then 'Muu ammatillinen koulutus' 
			else d4.tutkintotyyppi_fi 
		end
	,[tutkinto] = d4.koulutusluokitus_fi

	,[koulutuksen_jarjestaja] = d11.organisaatio_fi
	,[hankintakoulutuksen_jarjestaja] = d11b.organisaatio_fi

	,[hankintakoulutus_kylla_ei] = nullif(d39.kytkin_koodi, -1)

	,koodi_tutkinto = d4.koulutusluokitus_koodi
	,koodi_koulutuksen_jarjestaja = d11.organisaatio_koodi
	,koodi_hankintakoulutuksen_jarjestaja = d11b.organisaatio_koodi

	,uudet_opiskelijat_lkm = count(distinct case when f.uudet_opiskelijat = 1 then f.master_oid end)
	,opiskelijat_lkm = count(distinct case when f.opiskelijat = 1 then f.master_oid end)
	,tutkinnon_suorittaneet_lkm = count(distinct case when f.tutkinnot = 1 then f.master_oid end)
	,nettoopiskelijamaara_lkm = sum(opiskelijat_netto)

FROM ( 

	--yhdistetty faktataulu vaikuttaisi olevan liian raskas groupattava, joten käytetään osafaktoja
	
	SELECT DISTINCT
		tilastovuosi
		,d_koulutusluokitus_id
		,d_suorituksen_tyyppi_id
		,valmentava_koodi
		,d_kytkin_muu_ammatillinen_id
		,d_organisaatioluokitus_jarj_id
		,d_kytkin_hankintakoulutus_id
		,d_organisaatioluokitus_hk_jarj_id
		,master_oid
		,opiskelijat = 1
		,uudet_opiskelijat = uusi
		,tutkinnot = 0
		,opiskelijat_netto = cast(0 as float)
	FROM ANTERO.dw.f_koski_amm_opiskelijat

	UNION ALL

	SELECT DISTINCT
		tilastovuosi
		,d_koulutusluokitus_id
		,d_suorituksen_tyyppi_id
		,valmentava_koodi
		,d_kytkin_muu_ammatillinen_id
		,d_organisaatioluokitus_jarj_id
		,d_kytkin_hankintakoulutus_id
		,d_organisaatioluokitus_hk_jarj_id
		,master_oid
		,opiskelijat = 0
		,uudet_opiskelijat = 0
		,tutkinnot = 1
		,opiskelijat_netto = cast(0 as float)
	FROM ANTERO.dw.f_koski_amm_tutkinnot 
	WHERE tutk = 1  --lisätty tutk_tt

	UNION ALL

	SELECT --huom. taustamuuttujista riippuen pitää sallia identtisiä rivejä ennen grouppausta
		tilastovuosi
		,d_koulutusluokitus_id
		,d_suorituksen_tyyppi_id
		,valmentava_koodi
		,d_kytkin_muu_ammatillinen_id
		,d_organisaatioluokitus_jarj_id
		,d_kytkin_hankintakoulutus_id
		,d_organisaatioluokitus_hk_jarj_id
		,master_oid = null
		,opiskelijat = 0
		,uudet_opiskelijat = 0
		,tutkinnot = 1
		,opiskelijat_netto = 
			sum(opiskelijat	* day(eomonth(d.paivays)))
			/ datediff(
				day
				,datefromparts(tilastovuosi-1, 12, 31)
				,case when tilastovuosi = year(getdate()) then max(ca.max_pvm) else datefromparts(tilastovuosi, 12, 31) end
			)
	FROM ANTERO.dw.f_koski_amm_opiskelijat_netto t
	LEFT JOIN ANTERO.dw.d_kalenteri d on d.id = t.d_kalenteri_id
	CROSS APPLY (
		select max(eomonth(datefromparts(tilastovuosi, kuukausi, 1))) max_pvm 
		from ANTERO.dw.f_koski_amm_opiskelijat_netto t
		left join ANTERO.dw.d_kalenteri d on d.id = t.d_kalenteri_id
	) ca
	GROUP BY tilastovuosi
		,d_suorituksen_tyyppi_id
		,valmentava_koodi
		,d_kytkin_muu_ammatillinen_id
		,d_koulutusluokitus_id
		,d_organisaatioluokitus_jarj_id
		,d_organisaatioluokitus_hk_jarj_id
		,d_kytkin_hankintakoulutus_id
	
) f

LEFT JOIN [ANTERO].dw.d_koulutusluokitus d4 ON d4.id = f.d_koulutusluokitus_id
LEFT JOIN [ANTERO].dw.d_organisaatioluokitus d11 ON d11.id = f.d_organisaatioluokitus_jarj_id
LEFT JOIN [ANTERO].dw.d_organisaatioluokitus d11b ON d11b.id = f.d_organisaatioluokitus_hk_jarj_id
LEFT JOIN [ANTERO].dw.d_suorituksen_tyyppi d17 ON d17.id = f.d_suorituksen_tyyppi_id
LEFT JOIN [ANTERO].dw.d_kytkin d24 ON d24.id = f.d_kytkin_muu_ammatillinen_id
LEFT JOIN [ANTERO].dw.d_kytkin d39 ON d39.id = f.d_kytkin_hankintakoulutus_id

GROUP BY [tilastovuosi]
	,d11.organisaatio_fi
	,d11.organisaatio_koodi
	,d17.selite_fi
	,d4.koulutusluokitus_fi
	,d4.koulutusluokitus_koodi
	,case 
		when valmentava_koodi = 1 then 'VALMA' 
		when valmentava_koodi = 2 then 'TELMA' 
		when valmentava_koodi = 3 then 'TUVA' 
		when d24.kytkin_koodi = 1 then 'Muu ammatillinen koulutus' 
		else d4.tutkintotyyppi_fi 
	end
	,d11b.organisaatio_fi
	,d39.kytkin_koodi
	,d11b.organisaatio_koodi

GO


