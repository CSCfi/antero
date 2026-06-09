USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_otp_55_suppea]    Script Date: 9.1.2026 8.46.29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dw].[v_virta_otp_55_suppea] AS 
SELECT d1.organisaatio_koodi AS 'Oppilaitos Koodi'
  ,d1.organisaatio_fi AS 'Oppilaitos'

  ,d2.okmohjauksenala_koodi AS 'OKM Ohjauksen ala Koodi'
  ,d2.okmohjauksenala_fi AS 'OKM Ohjauksen ala'
  ,d2.koulutusastetaso2_koodi AS 'Koulutusaste (taso 2) Koodi'
  ,d2.koulutusastetaso2_fi AS 'Koulutusaste (taso 2)'
  ,d2.koulutusalataso1_koodi AS 'Koulutusala (taso 1) Koodi'
  ,d2.koulutusalataso1_fi AS 'Koulutusala (taso 1)'
  ,d2.koulutusalataso2_koodi AS 'Koulutusala (taso 2) Koodi'
  ,d2.koulutusalataso2_fi AS 'Koulutusala (taso 2)'
  ,d2.koulutusalataso3_koodi AS 'Koulutusala (taso 3) Koodi'
  ,d2.koulutusalataso3_fi AS 'Koulutusala (taso 3)'
  ,d2.koulutusluokitus_koodi AS 'Koulutus Koodi'
  ,d2.koulutusluokitus_fi AS 'Koulutusnimike'

  ,f.vuosi
  ,f.suorittanut55

FROM dw.f_virta_otp_55_suppea f
LEFT JOIN dw.d_organisaatioluokitus d1 ON d1.id=f.d_organisaatio_id
LEFT JOIN dw.d_koulutusluokitus d2 ON d2.id=f.d_koulutusluokitus_id