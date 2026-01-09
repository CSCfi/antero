USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_opinnaytetyot_esilataus]    Script Date: 9.1.2026 8.37.19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_api_opinnaytetyot_esilataus] AS

TRUNCATE TABLE AnteroAPI.dw.[api_opinnaytetyot];

INSERT INTO AnteroAPI.dw.[api_opinnaytetyot]

SELECT
	 ROW_NUMBER() OVER(ORDER BY f.id ASC, d1.id ASC, d2.id ASC, d6.id ASC, d9.id ASC) as defaultorder
	,[tilastovuosi] = vuosi
	,[okm_ohjauksen_ala] = d2.ohjauksenala_nimi_fi
	,[koulutusala_02] = d9.selite_fi
	,[koulutustyyppi] = d1.selite_fi
	,koulutusaste = case d1.selite_fi when 'Amk-tutkintoon johtava nuorten koulutus' then 'Ammattikorkeakoulututkinto' when 'Amk-tutkintoon johtava aikuiskoulutus' then 'Ammattikorkeakoulututkinto' when 'Ylempi ammattikorkeakoulututkinto' then 'Ylempi ammattikorkeakoulututkinto' else 'Tuntematon' end
	,[ammattikorkeakoulu] = d6.organisaatio_fi
	--mittarit
	,[hankkeistetut_opinnaytetyot]
	,[opinnaytetyot_ei_hankkeistetut]
	--koodit
	,[koodit_koulutusala_2002] = case d9.koodi when -1 then 99 else d9.koodi end
	,[koodit_okm_ohjauksen_ala] = case d2.ohjauksenala_koodi when -1 then 99 else d2.ohjauksenala_koodi end
	,[koodit_ammattikorkeakoulu] = d6.organisaatio_nykyinen_koodi
	,[koodit_koulutustyyppi] = d1.koodi
FROM ANTERO.[dw].[f_amk_opinnaytetyot] f
JOIN ANTERO.dw.d_amk_koulutustyyppi d1 on d1.id=f.d_koulutustyyppi_id
JOIN ANTERO.dw.d_ohjauksenala d2 on d2.id=f.d_ohjauksen_ala_id
JOIN ANTERO.dw.d_organisaatioluokitus d6 on d6.id=f.d_amk_id
JOIN ANTERO.dw.d_koulutusala_2002 d9 on d9.id=f.d_koulutusala_id
	 
GO