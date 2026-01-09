USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_muu_henkilosto_amk_esilataus]    Script Date: 9.1.2026 8.36.07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_api_muu_henkilosto_amk_esilataus] AS

TRUNCATE TABLE AnteroAPI.dw.[api_muu_henkilosto_amk];

INSERT INTO AnteroAPI.dw.[api_muu_henkilosto_amk]

SELECT 
	   ROW_NUMBER() 
		OVER( ORDER BY 
			f.tilastovuosi ASC, 
			f.koodit_ammattikorkeakoulu ASC,
			f.koodit_koulutusala ASC, 
			f.koodit_okm_ohjauksen_ala ASC,
			f.koodit_henkilöstöryhmä ASC) as defaultorder
      ,f.tilastovuosi
	  ,f.henkilöstöryhmä
	  ,f.koulutusala
	  ,f.okm_ohjauksen_ala
	  ,f.ammattikorkeakoulu
	  ,sum(f.sivutoimisten_tuntiopettajien_opetustunnit) as sivutoimisten_tuntiopettajien_opetustunnit
	  ,sum(f.ostopalveluna_hankittu_tuntiopetus) as ostopalveluna_hankittu_tuntiopetus
	  ,sum(f.henkilostoryhman_tunnit_lkm) as henkilostoryhman_tunnit_lkm
	  ,f.koodit_koulutusala
	  ,f.koodit_okm_ohjauksen_ala
	  ,f.koodit_ammattikorkeakoulu
	  ,f.koodit_henkilöstöryhmä
FROM (
	SELECT
		 [tilastovuosi] = vuosi
		,[henkilöstöryhmä] = null
		,koulutusala = d2.selite_fi
		,[okm_ohjauksen_ala] = d3.ohjauksenala_nimi_fi
		,[ammattikorkeakoulu] = d6.organisaatio_fi
		--mittarit
		,f.sivutoimisten_tuntiopettajien_opetustunnit
		,f.ostopalveluna_hankittu_tuntiopetus
		,null as henkilostoryhman_tunnit_lkm
		--koodit
		,[koodit_koulutusala] = d2.koodi
		,[koodit_okm_ohjauksen_ala] = d3.ohjauksenala_koodi
		,[koodit_ammattikorkeakoulu] = d6.organisaatio_nykyinen_koodi
		,[koodit_henkilöstöryhmä] = null
	from ANTERO.[dw].[f_amk_sivutoimiset_opettajat] f
	join ANTERO.dw.d_koulutusala_2002 d2 on d2.id=f.d_koulutusala_id
	join ANTERO.dw.d_ohjauksenala d3 on d3.id=f.d_ohjauksenala_id
	join ANTERO.dw.d_organisaatioluokitus d6 on d6.id=f.d_amk_id


	UNION ALL

	SELECT
		 [tilastovuosi] = vuosi
		,[henkilöstöryhmä] = d1.selite_fi
		,koulutusala = null
		,[okm_ohjauksen_ala] = null
		,[ammattikorkeakoulu] = d6.organisaatio_fi
		--mittarit
		,null
		,null
		,henkilostoryhman_tunnit_lkm
		--koodit
		,[koodit_koulutusala] = null
		,[koodit_okm_ohjauksen_ala] = null
		,[koodit_ammattikorkeakoulu] = d6.organisaatio_nykyinen_koodi
		,[koodit_henkilöstöryhmä] = d1.koodi
	FROM ANTERO.[dw].[f_amk_ostopalveluna_hankittu_tyo] f
	join ANTERO.dw.d_amk_muun_henkilokunnan_henkilostoryhma d1 on d1.id=f.d_henkilostoryhma_id
	join ANTERO.dw.d_organisaatioluokitus d6 on d6.id=f.d_amk_id
) f

GROUP BY
	   f.tilastovuosi
	  ,f.henkilöstöryhmä
	  ,f.koulutusala
	  ,f.okm_ohjauksen_ala
	  ,f.ammattikorkeakoulu
	  ,f.koodit_koulutusala
	  ,f.koodit_okm_ohjauksen_ala
	  ,f.koodit_ammattikorkeakoulu
	  ,f.koodit_henkilöstöryhmä