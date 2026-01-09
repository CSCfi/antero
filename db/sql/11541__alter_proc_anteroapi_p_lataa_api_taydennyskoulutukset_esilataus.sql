USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_taydennyskoulutukset_esilataus]    Script Date: 9.1.2026 8.55.24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_api_taydennyskoulutukset_esilataus] AS

TRUNCATE TABLE [dw].[api_taydennyskoulutukset]

INSERT INTO [dw].[api_taydennyskoulutukset]

SELECT
	ROW_NUMBER() OVER(ORDER BY f.Tilastovuosi ASC, f.Yliopisto ASC) AS defaultorder
	,Tilastovuosi
	,Yliopisto
	,Sukupuoli
	,koulutukset
	,osallistuneet
	,[Koodit Yliopisto]
	,sukupuoli_jarjestys
FROM (
	SELECT
	   Tilastovuosi = vuosi
	  ,Yliopisto = d1.organisaatio_fi
	  ,Sukupuoli = null
	  ,koulutukset = jarjestettyjen_koulutusten_lkm
	  ,osallistuneet = null
	  ,[Koodit Yliopisto] = d1.organisaatio_nykyinen_koodi
	  ,sukupuoli_jarjestys = 9
	FROM [ANTERO].[dw].[f_yo_taydennyskoulutukset_jarjestetty] f
	LEFT JOIN antero.dw.d_organisaatioluokitus d1 on d1.id=f.d_yliopisto_id
	UNION ALL
	SELECT
	   Tilastovuosi = vuosi
	  ,Yliopisto = d1.organisaatio_fi
	  ,Sukupuoli = sukupuoli_fi
	  ,koulutukset = null
	  ,osallistuneet = osallistujien_lkm
	  ,[Koodit Yliopisto] = d1.organisaatio_nykyinen_koodi
	  ,sukupuoli_jarjestys = d2.sukupuoli_koodi
	FROM [ANTERO].[dw].[f_yo_taydennyskoulutukset_osallistumiset] f
	LEFT JOIN antero.dw.d_organisaatioluokitus d1 on d1.id=f.d_yliopisto_id
	LEFT JOIN antero.dw.d_sukupuoli d2 on d2.id=f.sukupuoli_id
) f
GO