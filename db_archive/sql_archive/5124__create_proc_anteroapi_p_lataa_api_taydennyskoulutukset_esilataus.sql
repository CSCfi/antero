DROP PROCEDURE IF EXISTS [dw].[p_lataa_api_taydennyskoulutukset_esilataus]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dw].[p_lataa_api_taydennyskoulutukset_esilataus] AS

TRUNCATE TABLE [dw].[api_taydennyskoulutukset]

INSERT INTO [dw].[api_taydennyskoulutukset]

SELECT
   1000000000+ROW_NUMBER() OVER(ORDER BY f.id ASC, d1.id ASC) AS defaultorder
  ,Tilastovuosi = vuosi
  ,Yliopisto = d1.yo_nimi_fi
  ,Sukupuoli = null
  ,koulutukset = jarjestettyjen_koulutusten_lkm
  ,osallistuneet = null
  ,[Koodit Yliopisto] = d1.yo_tunnus
  ,sukupuoli_jarjestys = 9

FROM [ANTERO].[dw].[f_yo_taydennyskoulutukset_jarjestetty] f
LEFT JOIN antero.dw.d_yo d1 on d1.id=f.d_yliopisto_id

UNION ALL

SELECT
   2000000000+ROW_NUMBER() OVER(ORDER BY f.id ASC, d1.id ASC) AS defaultorder
  ,Tilastovuosi = vuosi
  ,Yliopisto = d1.yo_nimi_fi
  ,Sukupuoli = sukupuoli_fi
  ,koulutukset = null
  ,osallistuneet = osallistujien_lkm
  ,[Koodit Yliopisto] = d1.yo_tunnus
  ,sukupuoli_jarjestys = d2.sukupuoli_koodi


FROM [ANTERO].[dw].[f_yo_taydennyskoulutukset_osallistumiset] f
LEFT JOIN antero.dw.d_yo d1 on d1.id=f.d_yliopisto_id
LEFT JOIN antero.dw.d_sukupuoli d2 on d2.id=f.sukupuoli_id
