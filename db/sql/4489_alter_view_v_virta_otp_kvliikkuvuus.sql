USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_otp_kvliikkuvuus]    Script Date: 10.3.2021 12:42:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [dw].[v_virta_otp_kvliikkuvuus] AS 


SELECT 
	 f.tilastovuosi
	,coalesce(cast(f.opintojen_aloitusvuosi as varchar(4)),'Tieto puuttuu') AS 'Opintojen aloitusvuosi'

    ,d4.sukupuoli_fi AS 'Sukupuoli'
	,d14.ikaryhma5_fi AS 'Ikäryhmä'
	,d8.maatjavaltiot2_fi AS 'Kansalaisuus'
	,d8.maanosa_fi AS 'Kansalaisuuden maanosa'

	,d3.koulutussektori_fi AS 'Koulutussektori'
    ,case when d3.koulutusluokitus_koodi = '899999' and d3.koulutusastetaso2_fi like 'tohtori%' then 'Lisensiaatin tai tohtorin tutkinto' else d3.koulutusastetaso2_fi end AS 'Koulutusaste (taso 2)'
    ,d3.koulutusalataso1_fi AS 'Koulutusala (taso 1)'
    ,d3.koulutusalataso2_fi AS 'Koulutusala (taso 2)'
    ,d3.koulutusalataso3_fi AS 'Koulutusala (taso 3)'
    ,d3.koulutusluokitus_fi AS 'Koulutusnimike'
	,coalesce((case when d12.selite_fi = 'Tuntematon' then NULL else d12.selite_fi end), d3.koulutusala2002_fi,'Tuntematon') as 'Koulutusala 2002'
	,coalesce((case when d13.selite_fi = 'Tuntematon' then NULL else d13.selite_fi end), d3.opintoala1995_fi,'Tuntematon') as 'Koulutusala 1995'
	,d2.ohjauksenala_nimi_fi AS 'OKM Ohjauksen ala'

  
    ,d6.maatjavaltiot2_fi AS 'Lähtömaa'
    ,d7.maatjavaltiot2_fi AS 'Kohdemaa'
	,d6.maanosa_fi AS 'Lähtömaan maanosa'
    ,d7.maanosa_fi AS 'Kohdemaan maanosa'
	,d5.liikkuvuudentyyppi_fi AS 'Liikkuvuuden tyyppi'
    ,d9.liikkuvuusohjelma_fi AS 'Liikkuvuusohjelma'
    ,d10.liikkuvuudensuunta_fi AS 'Liikkuvuuden suunta'
	,d11.liikkuvuudenkesto_fi as 'Liikkuvuuden Kesto'

	,d1.oppilaitostyyppi_fi AS 'Sektori'
	,d1.organisaatio_fi AS 'Oppilaitos'
	,d1.organisaatio_vanha_fi AS 'Oppilaitos historia'
	,d1.latitude AS 'Leveyskoordinaatti'
    ,d1.longitude AS 'Pituuskoordinaatti'

    ,f.cimo_opintoaste
    ,f.opiskelijaavain
    ,f.opiskeluoikeusavain
    ,f.liikkuvuusjaksoavain
    ,f.jaksoAlkupvm
    ,f.jaksoLoppupvm
    ,f.kesto
    ,f.lukumaara
    ,f.tilannepvm

	,case 
		when cast((cast((f.tilastovuosi + 1) as varchar(4)) + '-03-10') as date) <= convert(date, getdate()) then 1
	    else 0
	 end AS 'tilannepvm_tilasto'
	
	--RUOTSI

	,f.tilastovuosi AS 'Statistikår'
	,coalesce(cast(f.opintojen_aloitusvuosi as varchar(4)),'Information saknas') AS 'Startår'

    ,d4.sukupuoli_sv AS 'Kön'
	,d14.ikaryhma5_sv AS 'Åldersgrupp'
	,d8.maatjavaltiot2_sv AS 'Medborgarskap'
	,d8.maanosa_sv AS 'Medborgarskap (världsdel)'

	,d3.koulutussektori_sv AS 'Utbildningssektor'
    ,case when d3.koulutusluokitus_koodi = '899999' and d3.koulutusastetaso2_fi like 'tohtori%' then 'Licentiatexamen eller doktorexamen' else d3.koulutusastetaso2_sv end AS 'Utbildningsnivå, nivå 2'
    ,d3.koulutusalataso1_sv AS 'Utbildningsområde, nivå 1'
    ,d3.koulutusalataso2_sv AS 'Utbildningsområde, nivå 2'
    ,d3.koulutusalataso3_sv AS 'Utbildningsområde, nivå 3'
    ,d3.koulutusluokitus_sv AS 'Utbildningsbenämning'
	,coalesce((case when d12.selite_sv = 'Okänd' then NULL else d12.selite_sv end), d3.koulutusala2002_sv,'Okänd') as 'Utbildningsområde 2002'
	,coalesce((case when d13.selite_sv = 'Okänd' then NULL else d13.selite_sv end), d3.opintoala1995_sv,'Okänd') as 'Utbildningsområde 1995'
	,d2.ohjauksenala_nimi_sv AS 'UKM-styrningsområde'

    ,d6.maatjavaltiot2_sv AS 'Det land från vilket man flyttat'
    ,d7.maatjavaltiot2_sv AS 'Det land till vilket man flyttat'
	,d6.maanosa_sv AS 'Den världsdel från vilken man flyttat'
    ,d7.maanosa_sv AS 'Den världsdel till vilken man flyttat'
	,case when d5.liikkuvuudentyyppi_sv = 'Opiskelijavaihto' then 'Studentutbyte' when d5.liikkuvuudentyyppi_sv = 'Kansainvälinen harjoittelu' then 'Internationell praktik' else d5.liikkuvuudentyyppi_sv end  AS 'Typ av mobilitet'
    ,d9.liikkuvuusohjelma_sv AS 'Mobilitetsprogram'
    ,d10.liikkuvuudensuunta_sv AS 'Mobilitetens rikting'
	,d11.liikkuvuudenkesto_sv as 'Mobilitetens längd'

	,d1.oppilaitostyyppi_sv AS 'Sektor'
	,d1.organisaatio_sv AS 'Läroanstalt'
	,d1.organisaatio_vanha_sv AS 'Läröanstalt (historia)'
	,d1.latitude AS 'Latitud'
    ,d1.longitude AS 'Longitud'

	--KOODIMUUTTUJAT
	,d1.organisaatio_nykyinen_koodi AS 'Koodit Oppilaitos'
	,d1.organisaatio_koodi AS 'Koodit Oppilaitos historia'
	,d2.ohjauksenala_koodi AS 'Koodit OKM Ohjauksen ala'
	,d3.koulutusastetaso2_koodi AS 'Koodit Koulutusaste, taso 2'
	,d3.koulutusalataso1_koodi AS 'Koodit Koulutusala, taso 1'
	,d3.koulutusalataso2_koodi AS 'Koodit Koulutusala, taso 2'
    ,d3.koulutusalataso3_koodi AS 'Koodit Koulutusala, taso 3'
	,coalesce((case when d12.koodi = '-1' then NULL else d12.koodi end),d3.koulutusala2002_koodi,'-1') AS 'Koodit Koulutusala 2002'
	,coalesce((case when d13.koodi = '-1' then NULL else d13.koodi end),d3.opintoala1995_koodi,'-1') AS 'Koodit Koulutusala 1995'
    ,d3.koulutusluokitus_koodi AS 'Koodit Koulutus'
    ,d4.sukupuoli_koodi AS 'Koodit Sukupuoli'
    ,d5.liikkuvuudentyyppi_koodi AS 'Koodit Liikkuvuuden tyyppi'
	,d6.maatjavaltiot2_koodi AS 'Koodit Lähtömaa'
    ,d7.maatjavaltiot2_koodi AS 'Koodit Kohdemaa'
    ,d8.maatjavaltiot2_koodi AS 'Koodit Kansalaisuus'
    ,d3.koulutussektori_koodi AS 'Koodit Koulutussektori'
    ,d1.oppilaitostyyppi_koodi AS 'Koodit Sektori'
    ,d6.maanosa_koodi AS 'Koodit Lähtömaan maanosa'
    ,d7.maanosa_koodi AS 'Koodit Kohdemaan maanosa'
    ,d8.maanosa_koodi AS 'Koodit Kansalaisuuden maanosa'
    ,d9.liikkuvuusohjelma_koodi AS 'Koodit Liikkuvuusohjelma'
    ,d10.liikkuvuudensuunta_koodi AS 'Koodit Liikkuvuuden suunta'
	,d11.liikkuvuudenkesto_koodi AS 'Koodit Liikkuvuudenkesto'

	--JÄRJESTYSMUUTTUJAT
	,d2.jarjestys_ohjauksenala_koodi 
	,d3.jarjestys_koulutusastetaso2_koodi
	,d3.jarjestys_koulutusalataso1_koodi
	,d3.jarjestys_koulutusalataso2_koodi
    ,d3.jarjestys_koulutusalataso3_koodi
	,d4.jarjestys_sukupuoli_koodi
	,coalesce(f.opintojen_aloitusvuosi,1111) AS 'jarjestys_opintojen_aloitusvuosi'

-- TODO: add translations with aliases
--    ,d1.organisaatio_sv
--    ,d1.organisaatio_en
--    ,d2.ohjauksenala_nimi_sv
--    ,d2.ohjauksenala_nimi_en
--    ,case when d3.koulutusluokitus_koodi = '899999' and d3.koulutusastetaso2_fi like 'tohtori%' then 'Licentiatexamen eller Doktorsexamen'
--	      else d3.koulutusastetaso2_en end as 'Utbildn.nivå, nivå 2'
--    ,case when d3.koulutusluokitus_koodi = '899999' and d3.koulutusastetaso2_fi like 'tohtori%' then concat('Licentiate', char(39), 's degree or Doctoral degree')
--	      else d3.koulutusastetaso2_en end as 'Level of ed., tier 2'
--    ,d3.koulutusalataso1_sv
--    ,d3.koulutusalataso1_en
--    ,d3.koulutusalataso2_sv
--    ,d3.koulutusalataso2_en
--    ,d3.koulutusalataso3_sv
--    ,d3.koulutusalataso3_en
--    ,d3.koulutusluokitus_sv
--    ,d3.koulutusluokitus_en
--    ,d4.sukupuoli_sv
--    ,d4.sukupuoli_en
--    ,d5.liikkuvuudentyyppi_sv
--    ,d5.liikkuvuudentyyppi_en
--    ,d6.maatjavaltiot2_sv AS 'Lähtömaa SV'
--    ,d6.maatjavaltiot2_en AS 'Lähtömaa EN'
--    ,d7.maatjavaltiot2_sv AS 'Kohdemaa SV'
--    ,d7.maatjavaltiot2_en AS 'Kohdemaa EN'
--    ,d8.maatjavaltiot2_sv AS 'Kansalaisuus SV'
--    ,d8.maatjavaltiot2_en AS 'Kansalaisuus EN'
--    ,d9.liikkuvuusohjelma_sv
--    ,d9.liikkuvuusohjelma_en
--    ,d10.liikkuvuudensuunta_sv
--    ,d10.liikkuvuudensuunta_en

  FROM dw.f_virta_otp_kvliikkuvuus f
  LEFT JOIN dw.d_organisaatioluokitus d1 ON d1.id=f.d_organisaatio_id
  LEFT JOIN dw.d_ohjauksenala d2 ON d2.id=f.d_ohjauksenala_id
  LEFT JOIN dw.d_koulutusluokitus d3 ON d3.id=f.d_koulutusluokitus_id
  LEFT JOIN dw.d_sukupuoli d4 ON d4.id=f.d_sukupuoli_id
  LEFT JOIN dw.d_liikkuvuudentyyppi d5 ON d5.id=f.d_liikkuvuudentyyppi_id
  LEFT JOIN dw.d_maatjavaltiot2 d6 ON d6.id=f.d_lahtomaa_id
  LEFT JOIN dw.d_maatjavaltiot2 d7 ON d7.id=f.d_kohdemaa_id
  LEFT JOIN dw.d_maatjavaltiot2 d8 ON d8.id=f.d_kansalaisuus_id
  LEFT JOIN dw.d_liikkuvuusohjelma d9 ON d9.id=f.d_liikkuvuusohjelma_id
  LEFT JOIN dw.d_liikkuvuudensuunta d10 ON d10.id=f.d_liikkuvuudensuunta_id
  LEFT JOIN dw.d_liikkuvuudenkesto d11 ON d11.id = f.d_liikkuvuudenkesto_id
  LEFT JOIN dw.d_koulutusala_2002 d12 ON d12.id = f.d_koulutusala_2002_id
  LEFT JOIN dw.d_koulutusala_1995 d13 ON d13.id = f.d_koulutusala_1995_id
  LEFT JOIN dw.d_ika d14 ON d14.id = f.d_ika_id


GO

use antero
