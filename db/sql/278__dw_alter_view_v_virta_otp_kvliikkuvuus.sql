ALTER VIEW [dw].[v_virta_otp_kvliikkuvuus] AS 
SELECT d1.organisaatio_koodi
	  ,d1.organisaatio_fi AS 'Oppilaitos'
	  ,d1.organisaatio_sv
	  ,d1.organisaatio_en

      ,d2.ohjauksenala_koodi
	  ,d2.ohjauksenala_nimi_fi AS 'OKM Ohjauksen ala'
	  ,d2.ohjauksenala_nimi_sv
	  ,d2.ohjauksenala_nimi_en

	  ,d3.koulutusastetaso2_koodi AS 'Koulutusaste (taso 2) Koodi'
	  ,d3.koulutusastetaso2_fi AS 'Koulutusaste (taso 2)'
	  ,d3.koulutusalataso2_sv
	  ,d3.koulutusastetaso2_en
	  ,d3.koulutusalataso1_koodi AS 'Koulutusala (taso 1) Koodi'
	  ,d3.koulutusalataso1_fi AS 'Koulutusala (taso 1)'
	  ,d3.koulutusalataso1_sv
	  ,d3.koulutusalataso1_en
	  ,d3.koulutusalataso2_koodi AS 'Koulutusala (taso 2) Koodi'
	  ,d3.koulutusalataso2_fi AS 'Koulutusala (taso 2)'
	  ,d3.koulutusalataso2_sv
	  ,d3.koulutusalataso2_en
	  ,d3.koulutusalataso3_koodi AS 'Koulutusala (taso 3) Koodi'
	  ,d3.koulutusalataso3_fi AS 'Koulutusala (taso 3)'
	  ,d3.koulutusalataso3_sv
	  ,d3.koulutusalataso3_en
	  ,d3.koulutusluokitus_koodi AS 'Koulutus Koodi'
	  ,d3.koulutusluokitus_fi AS 'Koulutusnimike'
	  ,d3.koulutusluokitus_sv
	  ,d3.koulutusluokitus_en

	  ,d4.sukupuoli_koodi AS 'Sukupuoli Koodi'
	  ,d4.sukupuoli_fi AS 'Sukupuoli'
	  ,d4.sukupuoli_sv
	  ,d4.sukupuoli_en

	  ,d5.liikkuvuudentyyppi_koodi AS 'Liikkuvuuden tyyppi Koodi'
	  ,d5.liikkuvuudentyyppi_fi AS 'Liikkuvuuden tyyppi'
	  ,d5.liikkuvuudentyyppi_sv
	  ,d5.liikkuvuudentyyppi_en

	  ,d6.maatjavaltiot2_koodi AS 'Lähtömaa Koodi'
	  ,d6.maatjavaltiot2_fi AS 'Lähtömaa'
	  ,d6.maatjavaltiot2_sv AS 'Lähtömaa SV'
	  ,d6.maatjavaltiot2_en AS 'Lähtömaa EN'

	  ,d7.maatjavaltiot2_koodi AS 'Kohdemaa Koodi'
	  ,d7.maatjavaltiot2_fi AS 'Kohdemaa'
	  ,d7.maatjavaltiot2_sv AS 'Kohdemaa SV'
	  ,d7.maatjavaltiot2_en AS 'Kohdemaa EN'

	  ,d8.maatjavaltiot2_koodi AS 'Kansalaisuus Koodi'
	  ,d8.maatjavaltiot2_fi AS 'Kansalaisuus'
	  ,d8.maatjavaltiot2_sv AS 'Kansalaisuus SV'
	  ,d8.maatjavaltiot2_en AS 'Kansalaisuus EN'

	  ,d9.liikkuvuusohjelma_koodi AS 'Liikkuvuusohjelma Koodi'
	  ,d9.liikkuvuusohjelma_fi AS 'Liikkuvuusohjelma'
	  ,d9.liikkuvuusohjelma_sv
	  ,d9.liikkuvuusohjelma_en

	  ,d10.liikkuvuudensuunta_koodi AS 'Liikkuvuuden suunta Koodi'
	  ,d10.liikkuvuudensuunta_fi AS 'Liikkuvuuden suunta'
	  ,d10.liikkuvuudensuunta_sv
	  ,d10.liikkuvuudensuunta_en

      ,f.opiskelijaavain
      ,f.opiskeluoikeusavain
      ,f.liikkuvuusjaksoavain
      ,f.jaksoAlkupvm
      ,f.jaksoLoppupvm
      ,f.kesto
      ,f.lukumaara

  FROM dw.f_virta_otp_kvliikkuvuus f
  LEFT JOIN dw.d_organisaatio d1 ON d1.id=f.d_organisaatio_id
  LEFT JOIN dw.d_ohjauksenala d2 ON d2.id=f.d_ohjauksenala_id
  LEFT JOIN dw.d_koulutusluokitus d3 ON d3.id=f.d_koulutusluokitus_id
  LEFT JOIN dw.d_sukupuoli d4 ON d4.id=f.d_sukupuoli_id
  LEFT JOIN dw.d_liikkuvuudentyyppi d5 ON d5.id=f.d_liikkuvuudentyyppi_id
  LEFT JOIN dw.d_maatjavaltiot2 d6 ON d6.id=f.d_lahtomaa_id
  LEFT JOIN dw.d_maatjavaltiot2 d7 ON d7.id=f.d_lahtomaa_id
  LEFT JOIN dw.d_maatjavaltiot2 d8 ON d8.id=f.d_lahtomaa_id
  LEFT JOIN dw.d_liikkuvuusohjelma d9 ON d9.id=f.d_liikkuvuusohjelma_id
  LEFT JOIN dw.d_liikkuvuudensuunta d10 ON d10.id=f.d_liikkuvuudensuunta_id
