ALTER VIEW dw.v_virta_otp_55_suppea AS 
SELECT d1.organisaatio_koodi AS 'Oppilaitos Koodi'
  ,d1.organisaatio_fi AS 'Oppilaitos'

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
  LEFT JOIN dw.d_organisaatio d1 ON d1.id=f.d_organisaatio_id
  LEFT JOIN dw.d_koulutusluokitus d2 ON d2.id=f.d_koulutusluokitus_id
