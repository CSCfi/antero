USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_avoin_amk_esilataus]    Script Date: 10.3.2025 10.30.41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_api_avoin_amk_esilataus] AS

TRUNCATE TABLE AnteroAPI.dw.[api_avoin_amk];

INSERT INTO AnteroAPI.dw.[api_avoin_amk]

SELECT 
	   ROW_NUMBER() 
		OVER( ORDER BY 
			f.tilastovuosi ASC, 
			f.Sektori ASC, 
			f.[Koodit Ammattikorkeakoulu] ASC, 
			f.[Koodit OKM ohjauksen ala] ASC, 
			f.[Koodit Koulutusala] ASC, 
			f.[Koodit Sukupuoli] ASC) as defaultorder
      ,f.Tilastovuosi as [tilastovuosi]
      ,f.Sukupuoli as [sukupuoli]
      ,f.[OKM ohjauksen ala] as [okm_ohjauksen_ala]
      ,f.Koulutusala as [koulutusala]
      ,f.Ammattikorkeakoulu as [ammattikorkeakoulu]
      ,sum(f.osallistuneet) as [osallistuneet]
      ,sum(f.opintopisteet_yht) as [opintopisteet_yht]
      ,sum(f.opintopisteet_amk) as [opintopisteet_amk]
      ,sum(f.opintopisteet_kansalaisopistot) as [opintopisteet_kansalaisopistot]
      ,sum(f.opintopisteet_kansanopistot) as [opintopisteet_kansanopistot]
      ,sum(f.opintopisteet_kesayo) as [opintopisteet_kesayo]
      ,sum(f.opintopisteet_muut) as [opintopisteet_muut]
      ,sum(f.opintopisteet_yo) as [opintopisteet_yo]
      ,f.Sektori as [sektori]
      ,f.[Koodit Ammattikorkeakoulu] as [koodit_ammattikorkeakoulu]
      ,f.[Koodit Sukupuoli] as [koodit_sukupuoli]
	  ,f.[Koodit OKM ohjauksen ala] as [koodit_okm_ohjauksen_ala]
      ,f.[Koodit Koulutusala] as [koodit_koulutusala]
FROM (
	SELECT
		 [Tilastovuosi] = vuosi
		,[Sukupuoli] = d1.sukupuoli_fi
		,[OKM ohjauksen ala] = d2.ohjauksenala_nimi_fi
		,[Koulutusala] = d3.selite_fi
		,[Ammattikorkeakoulu] = d6.organisaatio_fi
		--mittarit
		,f.osallistuneet
		,null as opintopisteet_yht
		,null as opintopisteet_amk
		,null as opintopisteet_kansalaisopistot
		,null as opintopisteet_kansanopistot
		,null as opintopisteet_kesayo
		,null as opintopisteet_muut
		,null as opintopisteet_yo
		,[Sektori] = 'Avoin amk'
		--koodit
		,[Koodit Ammattikorkeakoulu] = d6.organisaatio_koodi
		,[Koodit Sukupuoli] = d1.sukupuoli_koodi
		,[Koodit OKM ohjauksen ala] = d2.ohjauksenala_koodi
		,[Koodit Koulutusala] = d3.koodi
	FROM ANTERO.dw.[f_amk_avoimen_opiskelijat] f
	JOIN ANTERO.dw.d_sukupuoli d1 on d1.id=f.d_sukupuoli_id
	JOIN ANTERO.dw.d_ohjauksenala d2 on d2.id=f.d_ohjauksenala_id
	JOIN ANTERO.dw.d_koulutusala_2002 d3 on d3.id=f.d_koulutusala_2002_id
	JOIN ANTERO.dw.d_organisaatioluokitus d6 on d6.id=f.d_amk_id

	UNION ALL

	SELECT
		 [Tilastovuosi] = vuosi
		,[Sukupuoli] = null
		,[OKM ohjauksen ala] = d2.ohjauksenala_nimi_fi
		,[Koulutusala] = d3.selite_fi
		,[Ammattikorkeakoulu] = d6.organisaatio_fi
		--mittarit
		,null
		,f.avoinamk_op_lkm
		,f.avoinamk_op_amk_lkm
		,f.avoinamk_op_kansal_lkm
		,f.avoinamk_op_kansan_lkm
		,f.avoinamk_op_kesa_lkm
		,f.avoinamk_op_muut_lkm
		,f.avoinamk_op_yliop_lkm
		,[Sektori] = 'Avoin amk'
		--koodit
		,[Koodit Ammattikorkeakoulu] = d6.organisaatio_koodi
		,[Koodit Sukupuoli] = null
		,[Koodit OKM ohjauksen ala] = d2.ohjauksenala_koodi
		,[Koodit Koulutusala] = d3.koodi
	FROM ANTERO.dw.[f_amk_opintopisteet] f
	JOIN ANTERO.dw.d_ohjauksenala d2 on d2.id=f.d_ohjauksenala_id
	JOIN ANTERO.dw.d_koulutusala_2002 d3 on d3.id=f.d_koulutusala_2002_id
	JOIN ANTERO.dw.d_organisaatioluokitus d6 on d6.id=f.d_amk_id

	UNION ALL

	SELECT
		 [Tilastovuosi] = vuosi
		,[Sukupuoli] = d1.sukupuoli_fi
		,[OKM ohjauksen ala] = d2.ohjauksenala_nimi_fi
		,[Koulutusala] = d3.selite_fi
		,[Ammattikorkeakoulu] = d6.organisaatio_fi
		--mittarit
		,osallistuneet
		,null
		,null
		,null
		,null
		,null
		,null
		,null
		,[Sektori] = 'Maahanmuuttajat'
		--koodit
		,[Koodit Ammattikorkeakoulu] = d6.organisaatio_koodi
		,[Koodit Sukupuoli] = d1.sukupuoli_koodi
		,[Koodit OKM ohjauksen ala] = d2.ohjauksenala_koodi
		,[Koodit Koulutusala] = d3.koodi
	FROM ANTERO.dw.[f_amk_maahanmuuttajien_valmentava_koulutus] f
	JOIN ANTERO.dw.d_sukupuoli d1 on d1.id=f.d_sukupuoli_id
	JOIN ANTERO.dw.d_ohjauksenala d2 on d2.id=f.d_ohjauksenala_id
	JOIN ANTERO.dw.d_koulutusala_2002 d3 on d3.id=f.d_koulutusala_2002_id
	JOIN ANTERO.dw.d_organisaatioluokitus d6 on d6.id=f.d_amk_id

	UNION ALL

	SELECT
		 [Tilastovuosi] = vuosi
		,[Sukupuoli] = null
		,[OKM ohjauksen ala] = d2.ohjauksenala_nimi_fi
		,[Koulutusala] = d3.selite_fi
		,[Ammattikorkeakoulu] = d6.organisaatio_fi
		--mittarit
		,null
		,mamu_op_lkm
		,null
		,null
		,null
		,null
		,null
		,null
		,[Sektori] = 'Maahanmuuttajat'
		--koodit
		,[Koodit Ammattikorkeakoulu] = d6.organisaatio_koodi
		,[Koodit Sukupuoli] = null
		,[Koodit OKM ohjauksen ala] = d2.ohjauksenala_koodi
		,[Koodit Koulutusala] = d3.koodi
	FROM ANTERO.dw.[f_amk_opintopisteet] f
	JOIN ANTERO.dw.d_ohjauksenala d2 on d2.id=f.d_ohjauksenala_id
	JOIN ANTERO.dw.d_koulutusala_2002 d3 on d3.id=f.d_koulutusala_2002_id
	JOIN ANTERO.dw.d_organisaatioluokitus d6 on d6.id=f.d_amk_id
) f

GROUP BY
	 f.Tilastovuosi
	,f.Sukupuoli
	,f.[OKM ohjauksen ala]
	,f.Koulutusala
	,f.Ammattikorkeakoulu
	,f.Sektori
	,f.[Koodit Ammattikorkeakoulu]
	,f.[Koodit Sukupuoli]
	,f.[Koodit OKM ohjauksen ala]
	,f.[Koodit Koulutusala]
	 
GO

USE [ANTERO]