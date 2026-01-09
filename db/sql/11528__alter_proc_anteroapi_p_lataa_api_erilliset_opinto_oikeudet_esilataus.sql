USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_erilliset_opinto_oikeudet_esilataus]    Script Date: 9.1.2026 8.22.28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dw].[p_lataa_api_erilliset_opinto_oikeudet_esilataus] AS

TRUNCATE TABLE AnteroAPI.dw.[api_erilliset_opinto_oikeudet];

INSERT INTO [dw].[api_erilliset_opinto_oikeudet]

SELECT 
	   ROW_NUMBER() 
		OVER( ORDER BY 
			f.Tilastovuosi ASC, 
			f.[Koodit Yliopisto] ASC, 
			f.[Koodit OKM ohjauksen ala] ASC, 
			f.[Koodit Koulutusala] ASC) as defaultorder
      ,f.Tilastovuosi as [tilastovuosi]
	  ,f.Koulutusala as [koulutusala]
      ,f.[OKM ohjauksen ala] as [okm_ohjauksen_ala]
      ,f.Yliopisto as [yliopisto]
      ,sum(f.suorittaneiden_lkm) as [suorittaneiden_lkm]
      ,sum(f.opettajakoulutus_suorittaneiden_lkm) as [opettajakoulutus_suorittaneiden_lkm]
      ,sum(f.erillisilla_oik_op_lkm) as [erillisilla_oik_op_lkm]
      ,sum(f.erillisilla_oik_opkoul_op_lkm) as [erillisilla_oik_opkoul_op_lkm]
      ,f.[Koodit Yliopisto] as [koodit_yliopisto]
      ,f.[Koodit Koulutusala] as [koodit_koulutusala]
	  ,f.[Koodit OKM ohjauksen ala] as [koodit_okm_ohjauksen_ala]
FROM (
	SELECT

		 [Tilastovuosi] = vuosi
		,Koulutusala = 'Tuntematon'
		,[OKM ohjauksen ala] = 'Tuntematon'
		,[Yliopisto] = d6.organisaatio_fi
		--mittarit
		,f.suorittaneiden_lkm
		,f.opettajakoulutus_suorittaneiden_lkm
		,erillisilla_oik_op_lkm = null
		,erillisilla_oik_opkoul_op_lkm = null
		--koodit
		,[Koodit Yliopisto] = d6.organisaatio_nykyinen_koodi
		,[Koodit Koulutusala] = 99
		,[Koodit OKM ohjauksen ala] = 99
	FROM ANTERO.[dw].[f_yo_erillisella_opinto_oikeudella_opiskelevat] f
	JOIN ANTERO.dw.d_organisaatioluokitus d6 on d6.id=f.d_yliopisto_id

	UNION ALL

	SELECT
		 [Tilastovuosi] = f.vuosi
		,Koulutusala = d1.opintoala95_nimi_fi
		,[OKM ohjauksen ala] = d2.ohjauksenala_nimi_fi
		,[Yliopisto] = d6.organisaatio_fi
		--mittarit
		,null
		,null
		,[erillisilla_oik_op_lkm]
		,[erillisilla_oik_opkoul_op_lkm]
		--koodit
		,[Koodit Yliopisto] = d6.organisaatio_nykyinen_koodi
		,[Koodit Koulutusala] = case d1.opintoala95_koodi when -1 then 99 else d1.opintoala95_koodi end
		,[Koodit OKM ohjauksen ala] = case d2.ohjauksenala_koodi when -1 then 99 else d2.ohjauksenala_koodi end
	FROM ANTERO.[dw].[f_yo_opintopisteet] f
	JOIN ANTERO.dw.d_opintoala95 d1 on d1.id=f.d_opintoala95_id
	JOIN ANTERO.dw.d_ohjauksenala d2 on d2.id=f.d_ohjauksenala_id
	JOIN ANTERO.dw.d_organisaatioluokitus d6 on d6.id=f.d_yo_id
	JOIN ANTERO.dw.d_kalenteri d7 on d7.id=f.d_tilannepvm_id
	WHERE d7.paivays like '%-03-02'
) f

GROUP BY
	 f.Tilastovuosi
	,f.[OKM ohjauksen ala]
	,f.Koulutusala
	,f.Yliopisto
	,f.[Koodit Yliopisto]
	,f.[Koodit OKM ohjauksen ala]
	,f.[Koodit Koulutusala]