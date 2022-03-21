USE [ANTERO]
GO

/****** Object:  View [dw].[v_haku_ja_valinta_yoarvosanat_kaikki]    Script Date: 6.9.2019 15:09:47 ******/
DROP VIEW IF EXISTS [dw].[v_haku_ja_valinta_yoarvosanat_kaikki]
GO

/****** Object:  View [dw].[v_haku_ja_valinta_yoarvosanat_kaikki]    Script Date: 6.9.2019 15:09:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dw].[v_haku_ja_valinta_yoarvosanat_kaikki] AS

SELECT [Valmistumisvuosi] = f.vuosi
      ,[Aine] = d1.koodi
      ,[Laajuus] = d2.koodi
	  ,[Arvosana, kirjain] = f.arvosana_kirjain
	  ,[Arvosana, numero] = f.arvosana_numero
      ,[OpiskelijaID] = f.opiskelijaID
FROM [ANTERO].[dw].[f_ytl_arvosanat] f
LEFT JOIN ANTERO.dw.d_ytl_aine d1 ON d1.id = f.d_ytl_aine_id
LEFT JOIN ANTERO.dw.d_ytl_aine_laajuus d2 ON d2.id = f.d_ytl_aine_laajuus_id
--LEFT JOIN (
--	SELECT
--		vuosi
--		,lkm_yht = COUNT(DISTINCT opiskelijaID)
--	FROM dw.f_ytl_arvosanat
--	GROUP BY vuosi
--) yht ON yht.vuosi = f.vuosi
--GROUP BY f.vuosi, d1.koodi, d2.koodi, f.opiskelijaID


--SELECT 
--       f.[valmistumisvuosi]
--      ,aine_koodi = d1.koodi
--      ,laajuus_koodi = COALESCE(d2.koodi,'')
--      ,matikka_koodi = d3.koodi
--      --,[kielet_lkm]
--     -- ,[reaali_lkm]
--      --,[l_lkm]
--      --,[el_lkm]
--      --,[mel_lkm]
--	  ,henkilot = COUNT(DISTINCT henkiloOID)
--      ,vuosi_yht= henkilo_lkm
--FROM [ANTERO].[dw].[f_haku_ja_valinta_yoarvosanat] f
--LEFT JOIN ANTERO.dw.d_ytl_aine d1 ON d1.id = f.d_ytl_aine_id
--LEFT JOIN ANTERO.dw.d_ytl_aine_laajuus d2 ON d2.id = f.d_ytl_aine_laajuus_id
--LEFT JOIN ANTERO.dw.d_ytl_aine d3 ON d3.id = f.d_ytl_aine_matikka_id
--JOIN (
--	SELECT 
--		 valmistumisvuosi 
--		,henkilo_lkm = COUNT(DISTINCT henkiloOID) 
--	FROM [ANTERO].[dw].[f_haku_ja_valinta_yoarvosanat]
--	GROUP BY valmistumisvuosi
--) d4 ON d4.valmistumisvuosi = f.valmistumisvuosi

--GROUP BY  f.[valmistumisvuosi]
--      ,d1.koodi
--      ,d2.koodi
--      ,d3.koodi
--      --,[kielet_lkm]
--      --,[reaali_lkm]
--      --,[l_lkm]
--      --,[el_lkm]
--      --,[mel_lkm]
--	  ,henkilo_lkm
	 


