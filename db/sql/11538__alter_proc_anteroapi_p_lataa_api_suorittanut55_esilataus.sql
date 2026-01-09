USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_suorittanut55_esilataus]    Script Date: 9.1.2026 8.41.57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_api_suorittanut55_esilataus] AS

TRUNCATE TABLE AnteroAPI.dw.[api_suorittanut55];

INSERT INTO AnteroAPI.dw.[api_suorittanut55]

SELECT
	 ROW_NUMBER() OVER(ORDER BY 
		f.vuosi ASC, 
		d1.organisaatio_nykyinen_koodi ASC, 
		d2.koulutusluokitus_koodi ASC) as defaultorder 
	,d1.organisaatio_nykyinen_koodi AS 'oppilaitos_koodi'
	,d1.organisaatio_fi AS 'oppilaitos'
	,d2.okmohjauksenala_koodi AS 'okm_ohjauksen_ala_koodi'
	,d2.okmohjauksenala_fi AS 'okm_ohjauksen_ala'
	,d2.koulutusastetaso2_koodi AS 'koulutusaste(taso 2)_koodi'
	,d2.koulutusastetaso2_fi AS 'koulutusaste(taso 2)'
	,d2.koulutusalataso1_koodi AS 'koulutusala(taso 1)_koodi'
	,d2.koulutusalataso1_fi AS 'koulutusala(taso 1)'
	,d2.koulutusalataso2_koodi AS 'koulutusala(taso 2)_Koodi'
	,d2.koulutusalataso2_fi AS 'koulutusala(taso 2)'
	,d2.koulutusalataso3_koodi AS 'koulutusala(taso 3)_koodi'
	,d2.koulutusalataso3_fi AS 'koulutusala(taso 3)'
	,d2.koulutusluokitus_koodi AS 'koulutus_koodi'
	,d2.koulutusluokitus_fi AS 'koulutusnimike'
	,f.vuosi
	,SUM(f.suorittanut55) as suorittanut_55
	,SUM(f.suorittanut55ilmanPankkia) as suorittanut_55ilman_pankkia
	,SUM(f.suorittanut55pankinAvulla) as suorittanut_55pankin_avulla
	,SUM(f.suorittanut27) suorittanut_27
  FROM ANTERO.dw.f_virta_otp_55_suppea f
  LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 ON d1.id=f.d_organisaatio_id
  LEFT JOIN ANTERO.dw.d_koulutusluokitus d2 ON d2.id=f.d_koulutusluokitus_id
  GROUP BY
	 d1.organisaatio_nykyinen_koodi
	,d1.organisaatio_fi
	,d2.okmohjauksenala_koodi
	,d2.okmohjauksenala_fi
	,d2.koulutusastetaso2_koodi
	,d2.koulutusastetaso2_fi
	,d2.koulutusalataso1_koodi
	,d2.koulutusalataso1_fi
	,d2.koulutusalataso2_koodi
	,d2.koulutusalataso2_fi
	,d2.koulutusalataso3_koodi 
	,d2.koulutusalataso3_fi 
	,d2.koulutusluokitus_koodi
	,d2.koulutusluokitus_fi 
	,f.vuosi

GO