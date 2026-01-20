USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_jtp_tilasto]    Script Date: 10.3.2025 10.14.06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dw].[v_virta_jtp_tilasto] AS

SELECT 
[Tilastovuosi]
,[Statistikår]
,[Statistical year]
,[Ilmoitusvuosi]
,julkaisunTunnus
,[Koodit Sektori]
,[Sektori]
,[Sektor]
,[Sector]
,[Koodit Organisaatio]
,[Organisaatio]
,[Organisation]
,[Organization]
,[Koodit Ammattikorkeakoulu]
,[Ammattikorkeakoulu]
,[Yrkeshögskola]
,[University of applied sciences]
,[Koodit Yliopisto]
,[Yliopisto]
,[Universitet]
,[University]
,[Koodit Julkaisufoorumitaso]
,[Julkaisufoorumitaso]
,[Publikationsforumsnivå]
,[Publication forum level]
,[Koodit Julkaisun pääluokka]
,[Julkaisun pääluokka]
,[Publikationens huvudklass]
,[Main publication category]
,[Koodit Julkaisutyyppi]
,[Julkaisutyyppi]
,[Typ av publikation]
,[Publication Type]
,[Koodit Julkaisun kansainvälisyys]
,[Julkaisun kansainvälisyys]
,[Publikationens internationalitet]
,[Internationality of publication]
,[Koodit Kansainvälinen yhteisjulkaisu]
,[Kansainvälinen yhteisjulkaisu]
,[Internationell sampublikation]
,[International co-publication]
,case [Koodit Päätieteenala] when -1 then 9 else [Koodit Päätieteenala] end as [Koodit Päätieteenala]
,[Päätieteenala]
,[Huvudsakligt vetenskapsområde]
,[Main discipline]
,case [Koodit Tieteenala] when -1 then 9999 else [Koodit Tieteenala] end as [Koodit Tieteenala]
,[Tieteenala]
,[Vetenskapsområde]
,[Discipline]
,case [Koodit Taiteenala] when -1 then 9999 else [Koodit Taiteenala] end as [Koodit Taiteenala]
,[Taiteenala]
,[Art gren]
,[Art discipline]
,case [Koodit TaidealanTyyppiKategoria] when -1 then 9999 else [Koodit TaidealanTyyppiKategoria] end as [Koodit TaidealanTyyppiKategoria]
,[Taidealan tyyppikategoria]
,case [Koodit OKM ohjauksen ala] when -1 then 99 else [Koodit OKM ohjauksen ala] end as [Koodit OKM ohjauksen ala]
,[OKM ohjauksen ala]
,[UKM-styrningsområde​]
,[Field of education - HE steering]
,case [Koodit Koulutusala 95] when -1 then 99 else [Koodit Koulutusala 95] end as [Koodit Koulutusala 95]
,[Koulutusala 95]
,[Utbildningsområde 95]
,[Field of education 95]
,case [Koodit Koulutusala 02] when -1 then 9 else [Koodit Koulutusala 02] end as [Koodit Koulutusala 02]
,[Koulutusala 02]
,[Utbildningsområde 02]
,[Field of education 02]
,[Yhteisjulk. yliop. sairaanhoitopiiri]
,[Yhteisjulk. valtion sektoritutkimuslaitos]
,[Yhteisjulk. muu kotim. tutkimusorganisaatio]
,[Yhteisjulkaisu yrityksen kanssa]
,[Julkaisu rinnakkaistallennettu]
,case [Koodit Avoin saatavuus] when -1 then 9 else [Koodit Avoin saatavuus] end as [Koodit Avoin saatavuus]
,[Avoin saatavuus]
,[Öppen tillgång]
,[Open access]
,[lukumaara]
,[Koodit Julkaisufoorumitaso_vanha]   
,[Julkaisufoorumitaso vanha luokitus] 
,[Koodit Julkaisufoorumitaso_uusi]   
,[Julkaisufoorumitaso uusi luokitus] 
,[Julkaisun tekijan rooli koodi]
,[Julkaisun tekijan rooli]
,tieteenala_lkm as 'Tieteenalojen lukumäärä (tarkka)'
,tieteenala_lkm_jarj
,case when tieteenala_lkm_jarj = 1 then 'Yksi tieteenala' when tieteenala_lkm_jarj = 7 then 'Tieto puuttuu' else 'Useampi tieteenala' end as 'Tieteenalojen lukumäärä'
,case when tieteenala_lkm_jarj = 1 then 1 when tieteenala_lkm_jarj = 7 then 3 else 2 end as tieteenala_lkm_jarj2
,paatieteenala_lkm as 'Päätieteenalojen lukumäärä (tarkka)'
,paatieteenala_lkm_jarj
,case when paatieteenala_lkm_jarj = 1 then 'Yksi päätieteenala' when paatieteenala_lkm_jarj = 7 then 'Tieto puuttuu' else 'Useampi päätieteenala' end as 'Päätieteenalojen lukumäärä'
,case when paatieteenala_lkm_jarj = 1 then 1 when paatieteenala_lkm_jarj = 7 then 3 else 2 end as paatieteenala_lkm_jarj2
,case when GETDATE() > =  CAST(CONCAT(Tilastovuosi + 1, '-06-01') AS DATE) then 1 else 0 end as jufo_suodatus
,painokerroin_avoimuus =
	CASE 
		WHEN	Sektori = 'Yliopisto' AND 
				([Julkaisu rinnakkaistallennettu] = 'Kyllä' OR [Avoin saatavuus] in ('Hybridijulkaisukanavassa ilmestynyt avoin julkaisu' ,'Open access -julkaisukanavassa ilmestynyt julkaisu')) AND
				[Koodit Julkaisutyyppi] in ('A1', 'A2', 'A3', 'A4', 'C1', 'C2') THEN 1.2
		WHEN	Sektori = 'Ammattikorkeakoulu' AND 
				([Julkaisu rinnakkaistallennettu] = 'Kyllä' OR [Avoin saatavuus] in ('Hybridijulkaisukanavassa ilmestynyt avoin julkaisu' ,'Open access -julkaisukanavassa ilmestynyt julkaisu')) AND
				[Koodit Julkaisutyyppi] in ('A1', 'A2', 'A3', 'A4', 'B1', 'B2', 'B3', 'C1', 'C2', 'D1', 'D2', 'D3', 'D4', 'D5', 'D6', 'E1', 'E2', 'E3') THEN 1.2
		ELSE 1
	END
,painokerroin_julkaisutyyppi =
	CASE 
		WHEN	Sektori = 'Yliopisto' AND Organisaatio <> 'Maanpuolustuskorkeakoulu' AND
				[Koodit Julkaisutyyppi] in ('A1', 'A2', 'A3', 'A4', 'C1', 'C2') THEN 1
		WHEN	Sektori = 'Yliopisto' AND Organisaatio <> 'Maanpuolustuskorkeakoulu' AND
				[Koodit Julkaisutyyppi] in ('B1', 'B2', 'B3', 'D1', 'D2', 'D3', 'D4', 'D6', 'E1', 'E3') THEN 0.1
		WHEN	Sektori = 'Yliopisto' AND Organisaatio <> 'Maanpuolustuskorkeakoulu' AND
				[Koodit Julkaisutyyppi] in ('D5', 'E2') THEN 0.4
		WHEN	Sektori = 'Ammattikorkeakoulu' AND Organisaatio <> 'Poliisiammattikorkeakoulu' AND
				[Koodit Julkaisutyyppi] in ('A1', 'A2', 'A3', 'A4', 'B1', 'B2', 'B3', 'C1', 'C2', 'D1', 'D2', 'D3', 'D4', 'D5', 'D6') THEN 1
		WHEN	Sektori = 'Ammattikorkeakoulu' AND Organisaatio <> 'Poliisiammattikorkeakoulu' AND
				[Koodit Julkaisutyyppi] in ('E1', 'E2', 'E3', 'F1', 'F2', 'F3', 'I1', 'I2') THEN 0.4
		ELSE 0
	END
,painokerroin_jufo =
	CASE 
		WHEN	Sektori <> 'Yliopisto' OR Organisaatio = 'Maanpuolustuskorkeakoulu' THEN 1
		WHEN	[Koodit Julkaisutyyppi] in ('A1', 'A2', 'A3', 'A4', 'C2') AND [Koodit Julkaisufoorumitaso] = '0' THEN 0.1
		WHEN	[Koodit Julkaisutyyppi] in ('A1', 'A2', 'A3', 'A4', 'C2') AND [Koodit Julkaisufoorumitaso] = '1' THEN 1
		WHEN	[Koodit Julkaisutyyppi] in ('A1', 'A2', 'A3', 'A4', 'C2') AND [Koodit Julkaisufoorumitaso] = '2' THEN 3
		WHEN	[Koodit Julkaisutyyppi] in ('A1', 'A2', 'A3', 'A4', 'C2') AND [Koodit Julkaisufoorumitaso] = '3' THEN 4
		WHEN	[Koodit Julkaisutyyppi] = 'C1' AND [Koodit Julkaisufoorumitaso] = '0' THEN 0.4
		WHEN	[Koodit Julkaisutyyppi] = 'C1' AND [Koodit Julkaisufoorumitaso] = '1' THEN 4
		WHEN	[Koodit Julkaisutyyppi] = 'C1' AND [Koodit Julkaisufoorumitaso] = '2' THEN 12
		WHEN	[Koodit Julkaisutyyppi] = 'C1' AND [Koodit Julkaisufoorumitaso] = '3' THEN 16
		WHEN	[Koodit Julkaisutyyppi] not in ('A1', 'A2', 'A3', 'A4', 'C1', 'C2') THEN 1
		ELSE 0
	END
	,rahoitusmalli_suodatin_yliopisto = CASE WHEN ilmoitusvuosi is null THEN 1 WHEN GETDATE() <= CAST(CONCAT(cast(Ilmoitusvuosi + 1 as varchar), '-06-01') as date) THEN 0 ELSE 1 END
FROM

(


SELECT f.tilastovuosi AS "Tilastovuosi"
  ,f.tilastovuosi AS 'Statistikår'
  ,f.tilastovuosi AS 'Statistical year'
  ,f.ilmoitusvuosi AS 'Ilmoitusvuosi'
  ,[julkaisunTunnus] as 'julkaisunTunnus'
  ,d2.virtajtpsektori_koodi as 'Koodit Sektori'
  ,d2.virtajtpsektori_fi as 'Sektori'
  ,d2.virtajtpsektori_sv as 'Sektor'
  ,d2.virtajtpsektori_en as 'Sector'
  ,d3.organisaatio_koodi as 'Koodit Organisaatio'
  ,d3.organisaatio_fi as 'Organisaatio'
  ,d3.organisaatio_sv as 'Organisation'
  ,d3.organisaatio_en as 'Organization'
  ,case when d3.oppilaitostyyppi_fi = 'Ammattikorkeakoulut' or d3.organisaatio_fi like '%ammattikorkeakoulu%' then d3.organisaatio_koodi else NULL end as 'Koodit Ammattikorkeakoulu'
  ,case when d3.oppilaitostyyppi_fi = 'Ammattikorkeakoulut' or d3.organisaatio_fi like '%ammattikorkeakoulu%' then d3.organisaatio_fi else NULL end as 'Ammattikorkeakoulu'
  ,case when d3.oppilaitostyyppi_sv = 'Yrkeshögskolor' or d3.organisaatio_fi like '%ammattikorkeakoulu%' then d3.organisaatio_sv else NULL end as 'Yrkeshögskola'
  ,case when d3.oppilaitostyyppi_en = 'Polytechnics' or d3.organisaatio_fi like '%ammattikorkeakoulu%' then d3.organisaatio_en else NULL end as 'University of applied sciences'
  ,case when d3.oppilaitostyyppi_fi = 'Yliopistot' then d3.organisaatio_koodi else NULL end as 'Koodit Yliopisto'
  ,case when d3.oppilaitostyyppi_fi = 'Yliopistot' then d3.organisaatio_fi 
	    when d3.oppilaitostyyppi_fi = 'Sotilaskorkeakoulut' then d3.organisaatio_fi 
		else NULL 
   end as 'Yliopisto'
  ,case when d3.oppilaitostyyppi_sv = 'Universitet' then d3.organisaatio_sv 
        when d3.oppilaitostyyppi_sv = 'Militära högskolor' then d3.organisaatio_sv 
        else NULL 
   end as 'Universitet'
  ,case when d3.oppilaitostyyppi_en = 'Universities' then d3.organisaatio_en 
        when d3.oppilaitostyyppi_en = 'Military universities' then d3.organisaatio_en 
        else NULL 
   end as 'University'
  ,d5.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_sv as 'Publikationsforumsnivå'
  ,d5.julkaisufoorumitaso_en as 'Publication forum level'
  ,d4.julkaisunpaaluokka_koodi as 'Koodit Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_fi as 'Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_sv as 'Publikationens huvudklass'
  ,d4.julkaisunpaaluokka_nimi_en as 'Main publication category'
  ,d4.julkaisutyyppi_koodi as 'Koodit Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_fi as 'Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_sv as 'Typ av publikation'
  ,d4.julkaisutyyppi_nimi_en as 'Publication Type'
  ,d6.julkaisun_kansainvalisyys_koodi as 'Koodit Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_fi as 'Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_sv as 'Publikationens internationalitet'
  ,d6.julkaisun_kansainvalisyys_en as 'Internationality of publication'
  ,d7.kansainvalinen_yhteisjulkaisu_koodi as 'Koodit Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_fi as 'Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_sv as 'Internationell sampublikation'
  ,d7.kansainvalinen_yhteisjulkaisu_en as 'International co-publication'
  ,d1.paatieteenala_koodi as 'Koodit Päätieteenala'
  ,d1.paatieteenala_nimi_fi as 'Päätieteenala'
  ,d1.paatieteenala_nimi_sv as 'Huvudsakligt vetenskapsområde'
  ,d1.paatieteenala_nimi_en as 'Main discipline'
  ,d1.tieteenala_koodi as 'Koodit Tieteenala'
  ,d1.tieteenala_nimi_fi as 'Tieteenala'
  ,d1.tieteenala_nimi_sv as 'Vetenskapsområde'
  ,d1.tieteenala_nimi_en as 'Discipline'
  ,d20.taiteenala_koodi as 'Koodit Taiteenala'
  ,d20.taiteenala_nimi_fi as 'Taiteenala'
  ,d20.taiteenala_nimi_sv as 'Art gren'
  ,d20.taiteenala_nimi_en as 'Art discipline'
  ,d21.taidealantyyppikategoria_koodi as 'Koodit TaidealanTyyppikategoria'
  ,d21.taidealantyyppikategoria_nimi_fi as 'Taidealan tyyppikategoria'
  ,d8.ohjauksenala_koodi as 'Koodit OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_fi as 'OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_sv as 'UKM-styrningsområde​'
  ,d8.ohjauksenala_nimi_en as 'Field of education - HE steering'
  ,d9.koodi as 'Koodit Koulutusala 95'
  ,d9.selite_fi as 'Koulutusala 95'
  ,d9.selite_sv as 'Utbildningsområde 95'
  ,d9.selite_en as 'Field of education 95'
  ,d10.koodi as 'Koodit Koulutusala 02'
  ,d10.selite_fi as 'Koulutusala 02'
  ,d10.selite_sv as 'Utbildningsområde 02'
  ,d10.selite_en as 'Field of education 02'
  ,d12.kytkin_fi as 'Yhteisjulk. yliop. sairaanhoitopiiri'
  ,d13.kytkin_fi as 'Yhteisjulk. valtion sektoritutkimuslaitos'
  ,d14.kytkin_fi as 'Yhteisjulk. muu kotim. tutkimusorganisaatio'
  ,d15.kytkin_fi as 'Yhteisjulkaisu yrityksen kanssa'
  ,d16.kytkin_fi as 'Julkaisu rinnakkaistallennettu'
  ,d17.avoinsaatavuus_koodi as 'Koodit Avoin saatavuus'
  ,d17.avoinsaatavuus_fi as 'Avoin saatavuus'
  ,d17.avoinsaatavuus_sv as 'Öppen tillgång'
  ,d17.avoinsaatavuus_en as 'Open access'
  ,cast(f.lukumaara / f.lkm as decimal(6,5))  as 'lukumaara'    -- updated 2019-05-04
  ,d18.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso_vanha' --new
  ,d18.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso vanha luokitus'  --new
  ,d19.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso_uusi'  --new
  ,d19.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso uusi luokitus'  --new
  ,d22.rooli_koodi as 'Julkaisun tekijan rooli koodi'
  ,d22.rooli_fi as 'Julkaisun tekijan rooli'
  ,coalesce(cast(f.tieteenala_lkm as varchar), 'Tieto puuttuu') as tieteenala_lkm
  ,coalesce(f.tieteenala_lkm, 7) as tieteenala_lkm_jarj
  ,coalesce(cast(f.paatieteenala_lkm as varchar), 'Tieto puuttuu') as paatieteenala_lkm
  ,coalesce(f.paatieteenala_lkm, 7) as paatieteenala_lkm_jarj
FROM dw.f_virta_jtp_tilasto f
LEFT JOIN d_tieteenala d1 ON d1.id=f.d_tieteenala_id
LEFT JOIN d_taiteenala d20 ON d20.id=f.d_taiteenala_id
LEFT JOIN d_virtajtpsektori d2 ON d2.id=f.d_virtajtpsektori_id
LEFT JOIN d_organisaatioluokitus d3 ON d3.id=f.d_organisaatio_id
LEFT JOIN d_julkaisutyyppi d4 ON d4.id=f.d_julkaisutyyppi_id
LEFT JOIN d_julkaisufoorumitaso d5 ON d5.id=f.d_julkaisufoorumitaso_id
LEFT JOIN d_julkaisun_kansainvalisyys d6 ON d6.id=f.d_julkaisun_kansainvalisyys_id
LEFT JOIN d_kansainvalinen_yhteisjulkaisu d7 ON d7.id=f.d_kansainvalinen_yhteisjulkaisu_id
LEFT JOIN dw.d_ohjauksenala d8 on d8.id=f.d_ohjauksenala_id
LEFT JOIN dw.d_koulutusala_1995 d9 on d9.id=f.d_koulutusala95_id
LEFT JOIN dw.d_koulutusala_2002 d10 on d10.id=f.d_koulutusala02_id
LEFT JOIN dw.d_kytkin d12 on d12.id = d_yhteisjulkaisuSHPKytkin_id
LEFT JOIN dw.d_kytkin d13 on d13.id = d_yhteisjulkaisuTutkimuslaitosKytkin_id
LEFT JOIN dw.d_kytkin d14 on d14.id = d_yhteisjulkaisuMuuKytkin_id
LEFT JOIN dw.d_kytkin d15 on d15.id = d_yhteisjulkaisuYritysKytkin_id
LEFT JOIN dw.d_kytkin d16 on d16.id = d_rinnakkaistallennusKytkin_id
LEFT JOIN dw.d_avoinsaatavuus d17 on d17.id = d_avoinSaatavuus_id

LEFT JOIN d_julkaisufoorumitaso d18 ON d18.id=f.d_julkaisufoorumitaso_vanha_id --new
LEFT JOIN d_julkaisufoorumitaso d19 ON d19.id=f.d_julkaisufoorumitaso_uusi_id --new

left join d_taidealantyyppikategoria d21 on d21.taidealantyyppikategoria_koodi = f.d_taidealantyyppikategoria_id   -- added 2019-05-04
left join d_julkaisun_tekijan_rooli d22 on d22.id = f.d_rooli_id

UNION ALL

SELECT f.vuosi AS "Tilastovuosi"
  ,f.vuosi AS 'Statistikår'
  ,f.vuosi AS 'Statistical year'
  ,f.vuosi AS 'Ilmoitusvuosi'
  ,julkaisunTunnnus = NULL
  ,d2.virtajtpsektori_koodi as 'Koodit Sektori'
  ,d2.virtajtpsektori_fi as 'Sektori'
  ,d2.virtajtpsektori_sv
  ,d2.virtajtpsektori_en
  ,d3.organisaatio_koodi as 'Koodit Organisaatio'
  ,d3.organisaatio_fi as 'Organisaatio'
  ,d3.organisaatio_sv
  ,d3.organisaatio_en
  ,null as 'Koodit Ammattikorkeakoulu'
  ,NULL as 'Ammattikorkeakoulu'
  ,NULL as 'Yrkeshögskola'
  ,NULL as 'University of applied sciences'
  ,d3.organisaatio_koodi as 'Koodit Yliopisto'
  ,d3.organisaatio_fi as 'Yliopisto'
  ,d3.organisaatio_sv as 'Universitet'
  ,d3.organisaatio_en as 'University'
  ,d5.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_sv
  ,d5.julkaisufoorumitaso_en
  ,d4.julkaisunpaaluokka_koodi as 'Koodit Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_fi as 'Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_sv
  ,d4.julkaisunpaaluokka_nimi_en
  ,d4.julkaisutyyppi_koodi as 'Koodit Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_fi as 'Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_sv
  ,d4.julkaisutyyppi_nimi_en
  ,d6.julkaisun_kansainvalisyys_koodi as 'Koodit Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_fi as 'Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_sv
  ,d6.julkaisun_kansainvalisyys_en
  ,d7.kansainvalinen_yhteisjulkaisu_koodi as 'Koodit Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_fi as 'Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_sv
  ,d7.kansainvalinen_yhteisjulkaisu_en
  ,d1.paatieteenala_koodi as 'Koodit Päätieteenala'
  ,d1.paatieteenala_nimi_fi as 'Päätieteenala'
  ,d1.paatieteenala_nimi_sv
  ,d1.paatieteenala_nimi_en
  ,d1.tieteenala_koodi as 'Koodit Tieteenala'
  ,d1.tieteenala_nimi_fi as 'Tieteenala'
  ,d1.tieteenala_nimi_sv
  ,d1.tieteenala_nimi_en
  ,d20.taiteenala_koodi as 'Koodit Taiteenala'
  ,d20.taiteenala_nimi_fi as 'Taiteenala'
  ,d20.taiteenala_nimi_sv
  ,d20.taiteenala_nimi_en
  ,9999 as 'Koodit TaidealanTyyppikategoria'
  ,'Tieto puuttuu' as 'Taidealan tyyppikategoria'
  ,d8.ohjauksenala_koodi as 'Koodit OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_fi as 'OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_sv
  ,d8.ohjauksenala_nimi_en
  ,d9.koodi as 'Koodit Koulutusala 95'
  ,d9.selite_fi as 'Koulutusala 95'
  ,d9.selite_sv as 'Utbildningsområde 95'
  ,d9.selite_en as 'Field of education 95'
  ,d10.koodi as 'Koodit Koulutusala 02'
  ,d10.selite_fi as 'Koulutusala 02'
  ,d10.selite_sv as 'Utbildningsområde 02'
  ,d10.selite_en as 'Field of education 02'
  ,d12.kytkin_fi as 'Yhteisjulk. yliop. sairaanhoitopiiri'
  ,d13.kytkin_fi as 'Yhteisjulk. valtion sektoritutkimuslaitos'
  ,d14.kytkin_fi as 'Yhteisjulk. muu kotim. tutkimusorganisaatio'
  ,d15.kytkin_fi as 'Yhteisjulkaisu yrityksen kanssa'
  ,d16.kytkin_fi as 'Julkaisu rinnakkaistallennettu'
  ,d17.avoinsaatavuus_koodi as 'Koodit Avoin saatavuus'
  ,d17.avoinsaatavuus_fi as 'Avoin saatavuus'
  ,d17.avoinsaatavuus_sv as 'Öppen tillgång'
  ,d17.avoinsaatavuus_en as 'Open access'
  ,f.julkaisujen_maara
  ,d18.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso_vanha' --new
  ,d18.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso vanha luokitus'  --new
  ,d19.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso_uusi'  --new
  ,d19.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso uusi luokitus'  --new
  ,9999 as 'Julkaisun tekijan rooli koodi'
  ,'Tieto puuttuu' as 'Julkaisun tekijan rooli'
  ,coalesce(cast(f.tieteenala_lkm as varchar), 'Tieto puuttuu') as tieteenala_lkm
  ,coalesce(f.tieteenala_lkm, 7) as tieteenala_lkm_jarj
  ,coalesce(cast(f.paatieteenala_lkm as varchar), 'Tieto puuttuu') as paatieteenala_lkm
  ,coalesce(f.paatieteenala_lkm, 7) as paatieteenala_lkm_jarj
FROM f_yo_julkaisut_f_i f
LEFT JOIN d_tieteenala d1 ON d1.id=f.d_tieteenala_id
LEFT JOIN d_taiteenala d20 ON d20.id = -1
LEFT JOIN d_virtajtpsektori d2 ON d2.id=(select id from dw.d_virtajtpsektori where virtajtpsektori_fi='Yliopisto')
LEFT JOIN dw.d_organisaatioluokitus d3 ON d3.id=f.d_yliopisto_id
LEFT JOIN d_julkaisutyyppi d4 ON d4.id=f.d_julkaisutyyppi_id
LEFT JOIN d_julkaisufoorumitaso d5 ON d5.id=-1
LEFT JOIN d_julkaisun_kansainvalisyys d6 ON d6.id=f.d_julkaisun_kansainvalisyys_id
LEFT JOIN d_kansainvalinen_yhteisjulkaisu d7 ON d7.id=-1
LEFT JOIN dw.d_ohjauksenala d8 on d8.id=f.d_ohjauksenala_id
LEFT JOIN dw.d_koulutusala_1995 d9 on d9.id=f.d_koulutusala_id
LEFT JOIN dw.d_koulutusala_2002 d10 on d10.id=-1
LEFT JOIN dw.d_kytkin d12 on d12.id = -1
LEFT JOIN dw.d_kytkin d13 on d13.id = -1
LEFT JOIN dw.d_kytkin d14 on d14.id = -1
LEFT JOIN dw.d_kytkin d15 on d15.id = -1
LEFT JOIN dw.d_kytkin d16 on d16.id = -1
LEFT JOIN dw.d_avoinsaatavuus d17 on d17.id = -1

LEFT JOIN d_julkaisufoorumitaso d18 ON d18.id=-1 --new
LEFT JOIN d_julkaisufoorumitaso d19 ON d19.id=-1 --new

where d4.julkaisutyyppi_koodi<>'H2'

UNION ALL

SELECT f.vuosi AS "Tilastovuosi"
  ,f.vuosi AS 'Statistikår'
  ,f.vuosi AS 'Statistical year'
  ,f.vuosi AS 'Ilmoitusvuosi'
  ,julkaisunTunnnus = NULL
  ,d2.virtajtpsektori_koodi as 'Koodit Sektori'
  ,d2.virtajtpsektori_fi as 'Sektori'
  ,d2.virtajtpsektori_sv
  ,d2.virtajtpsektori_en
  ,d3.organisaatio_koodi as 'Koodit Organisaatio'
  ,d3.organisaatio_fi as 'Organisaatio'
  ,d3.organisaatio_sv
  ,d3.organisaatio_en
  ,d3.organisaatio_koodi as 'Koodit Ammattikorkeakoulu'
  ,d3.organisaatio_fi as 'Ammattikorkeakoulu'
  ,d3.organisaatio_sv as 'Yrkeshögskola'
  ,d3.organisaatio_en as 'University of applied sciences'
  ,NULL as 'Koodit Yliopisto'
  ,NULL as 'Yliopisto'
  ,NULL as 'Universitet'
  ,NULL as 'University'
  ,d5.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_sv
  ,d5.julkaisufoorumitaso_en
  ,d4.julkaisunpaaluokka_koodi as 'Koodit Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_fi as 'Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_sv
  ,d4.julkaisunpaaluokka_nimi_en
  ,d4.julkaisutyyppi_koodi as 'Koodit Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_fi as 'Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_sv
  ,d4.julkaisutyyppi_nimi_en
  ,d6.julkaisun_kansainvalisyys_koodi as 'Koodit Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_fi as 'Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_sv
  ,d6.julkaisun_kansainvalisyys_en
  ,d7.kansainvalinen_yhteisjulkaisu_koodi as 'Koodit Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_fi as 'Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_sv
  ,d7.kansainvalinen_yhteisjulkaisu_en
  ,d1.paatieteenala_koodi as 'Koodit Päätieteenala'
  ,d1.paatieteenala_nimi_fi as 'Päätieteenala'
  ,d1.paatieteenala_nimi_sv
  ,d1.paatieteenala_nimi_en
  ,d1.tieteenala_koodi as 'Koodit Tieteenala'
  ,d1.tieteenala_nimi_fi as 'Tieteenala'
  ,d1.tieteenala_nimi_sv
  ,d1.tieteenala_nimi_en
  ,d20.taiteenala_koodi as 'Koodit Taiteenala'
  ,d20.taiteenala_nimi_fi as 'Taiteenala'
  ,d20.taiteenala_nimi_sv
  ,d20.taiteenala_nimi_en
  ,9999 as 'Koodit TaidealanTyyppikategoria'
  ,'Tieto puuttuu' as 'Taidealan tyyppikategoria'
  ,d8.ohjauksenala_koodi as 'Koodit OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_fi as 'OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_sv
  ,d8.ohjauksenala_nimi_en
  ,d9.koodi as 'Koodit Koulutusala 95'
  ,d9.selite_fi as 'Koulutusala 95'
  ,d9.selite_sv as 'Utbildningsområde 95'
  ,d9.selite_en as 'Field of education 95'
  ,d10.koodi as 'Koodit Koulutusala 02'
  ,d10.selite_fi as 'Koulutusala 02'
  ,d10.selite_sv as 'Utbildningsområde 02'
  ,d10.selite_en as 'Field of education 02'
  ,d12.kytkin_fi as 'Yhteisjulk. yliop. sairaanhoitopiiri'
  ,d13.kytkin_fi as 'Yhteisjulk. valtion sektoritutkimuslaitos'
  ,d14.kytkin_fi as 'Yhteisjulk. muu kotim. tutkimusorganisaatio'
  ,d15.kytkin_fi as 'Yhteisjulkaisu yrityksen kanssa'
  ,d16.kytkin_fi as 'Julkaisu rinnakkaistallennettu'
  ,d17.avoinsaatavuus_koodi as 'Koodit Avoin saatavuus'
  ,d17.avoinsaatavuus_fi as 'Avoin saatavuus'
  ,d17.avoinsaatavuus_sv as 'Öppen tillgång'
  ,d17.avoinsaatavuus_en as 'Open access'
  ,f.julkaisujen_maara
  ,d18.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso_vanha' --new
  ,d18.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso vanha luokitus'  --new
  ,d19.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso_uusi'  --new
  ,d19.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso uusi luokitus'  --new
   ,9999 as 'Julkaisun tekijan rooli koodi'
  ,'Tieto puuttuu' as 'Julkaisun tekijan rooli'
  ,coalesce(cast(f.tieteenala_lkm as varchar), 'Tieto puuttuu') as tieteenala_lkm
  ,coalesce(f.tieteenala_lkm, 7) as tieteenala_lkm_jarj
  ,coalesce(cast(f.paatieteenala_lkm as varchar), 'Tieto puuttuu') as paatieteenala_lkm
  ,coalesce(f.paatieteenala_lkm, 7) as paatieteenala_lkm_jarj
FROM f_amk_julkaisut_f_i f
LEFT JOIN d_tieteenala d1 ON d1.id=f.d_tieteenala_id
LEFT JOIN d_taiteenala d20 ON d20.id = -1
LEFT JOIN d_virtajtpsektori d2 ON d2.id=(select id from dw.d_virtajtpsektori where virtajtpsektori_fi='Ammattikorkeakoulu')
LEFT JOIN dw.d_organisaatioluokitus d3 ON d3.id=f.d_organisaatioluokitus_id
LEFT JOIN d_julkaisutyyppi d4 ON d4.id=f.d_julkaisutyyppi_id
LEFT JOIN d_julkaisufoorumitaso d5 ON d5.id=-1
LEFT JOIN d_julkaisun_kansainvalisyys d6 ON d6.id=f.d_julkaisun_kansainvalisyys_id
LEFT JOIN d_kansainvalinen_yhteisjulkaisu d7 ON d7.id=-1
LEFT JOIN dw.d_ohjauksenala d8 on d8.id=f.d_ohjauksenala_id
LEFT JOIN dw.d_koulutusala_1995 d9 on d9.id=-1
LEFT JOIN dw.d_koulutusala_2002 d10 on d10.id=f.d_koulutusala_id
LEFT JOIN dw.d_kytkin d12 on d12.id = -1
LEFT JOIN dw.d_kytkin d13 on d13.id = -1
LEFT JOIN dw.d_kytkin d14 on d14.id = -1
LEFT JOIN dw.d_kytkin d15 on d15.id = -1
LEFT JOIN dw.d_kytkin d16 on d16.id = -1
LEFT JOIN dw.d_avoinsaatavuus d17 on d17.id = -1

LEFT JOIN d_julkaisufoorumitaso d18 ON d18.id=-1 --new
LEFT JOIN d_julkaisufoorumitaso d19 ON d19.id=-1 --new

where d4.julkaisutyyppi_koodi<>'H2'


UNION ALL

SELECT f.vuosi AS "Tilastovuosi"
  ,f.vuosi AS 'Statistikår'
  ,f.vuosi AS 'Statistical year'
  ,f.vuosi AS 'Ilmoitusvuosi'
  ,julkaisunTunnnus = NULL
  ,d2.virtajtpsektori_koodi as 'Koodit Sektori'
  ,d2.virtajtpsektori_fi as 'Sektori'
  ,d2.virtajtpsektori_sv
  ,d2.virtajtpsektori_en
  ,d3.organisaatio_koodi as 'Koodit Organisaatio'
  ,d3.organisaatio_fi as 'Organisaatio'
  ,d3.organisaatio_sv
  ,d3.organisaatio_en
  ,null as 'Koodit Ammattikorkeakoulu'
  ,NULL as 'Ammattikorkeakoulu'
  ,NULL as 'Yrkeshögskola'
  ,NULL as 'University of applied sciences'
  ,d3.organisaatio_koodi as 'Koodit Yliopisto'
  ,d3.organisaatio_fi as 'Yliopisto'
  ,d3.organisaatio_sv as 'Universitet'
  ,d3.organisaatio_en as 'University'
  ,d5.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_sv
  ,d5.julkaisufoorumitaso_en
  ,d4.julkaisunpaaluokka_koodi as 'Koodit Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_fi as 'Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_sv
  ,d4.julkaisunpaaluokka_nimi_en
  ,d4.julkaisutyyppi_koodi as 'Koodit Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_fi as 'Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_sv
  ,d4.julkaisutyyppi_nimi_en
  ,d6.julkaisun_kansainvalisyys_koodi as 'Koodit Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_fi as 'Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_sv
  ,d6.julkaisun_kansainvalisyys_en
  ,d7.kansainvalinen_yhteisjulkaisu_koodi as 'Koodit Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_fi as 'Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_sv
  ,d7.kansainvalinen_yhteisjulkaisu_en
  ,d1.paatieteenala_koodi as 'Koodit Päätieteenala'
  ,d1.paatieteenala_nimi_fi as 'Päätieteenala'
  ,d1.paatieteenala_nimi_sv
  ,d1.paatieteenala_nimi_en
  ,d1.tieteenala_koodi as 'Koodit Tieteenala'
  ,d1.tieteenala_nimi_fi as 'Tieteenala'
  ,d1.tieteenala_nimi_sv
  ,d1.tieteenala_nimi_en
  ,d20.taiteenala_koodi as 'Koodit Taiteenala'
  ,d20.taiteenala_nimi_fi as 'Taiteenala'
  ,d20.taiteenala_nimi_sv
  ,d20.taiteenala_nimi_en
  ,9999 as 'Koodit TaidealanTyyppikategoria'
  ,'Tieto puuttuu' as 'Taidealan tyyppikategoria'
  ,d8.ohjauksenala_koodi as 'Koodit OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_fi as 'OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_sv
  ,d8.ohjauksenala_nimi_en
  ,d9.koodi as 'Koodit Koulutusala 95'
  ,d9.selite_fi as 'Koulutusala 95'
  ,d9.selite_sv as 'Utbildningsområde 95'
  ,d9.selite_en as 'Field of education 95'
  ,d10.koodi as 'Koodit Koulutusala 02'
  ,d10.selite_fi as 'Koulutusala 02'
  ,d10.selite_sv as 'Utbildningsområde 02'
  ,d10.selite_en as 'Field of education 02'
  ,d12.kytkin_fi as 'Yhteisjulk. yliop. sairaanhoitopiiri'
  ,d13.kytkin_fi as 'Yhteisjulk. valtion sektoritutkimuslaitos'
  ,d14.kytkin_fi as 'Yhteisjulk. muu kotim. tutkimusorganisaatio'
  ,d15.kytkin_fi as 'Yhteisjulkaisu yrityksen kanssa'
  ,d16.kytkin_fi as 'Julkaisu rinnakkaistallennettu'
  ,d17.avoinsaatavuus_koodi as 'Koodit Avoin saatavuus'
  ,d17.avoinsaatavuus_fi as 'Avoin saatavuus'
  ,d17.avoinsaatavuus_sv as 'Öppen tillgång'
  ,d17.avoinsaatavuus_en as 'Open access'
  ,f.h21
  ,d18.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso_vanha' --new
  ,d18.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso vanha luokitus'  --new
  ,d19.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso_uusi'  --new
  ,d19.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso uusi luokitus'  --new
   ,9999 as 'Julkaisun tekijan rooli koodi'
  ,'Tieto puuttuu' as 'Julkaisun tekijan rooli'
  ,coalesce(cast(f.tieteenala_lkm as varchar), 'Tieto puuttuu') as tieteenala_lkm
  ,coalesce(f.tieteenala_lkm, 7) as tieteenala_lkm_jarj
  ,coalesce(cast(f.paatieteenala_lkm as varchar), 'Tieto puuttuu') as paatieteenala_lkm
  ,coalesce(f.paatieteenala_lkm, 7) as paatieteenala_lkm_jarj
FROM dw.f_yo_keksintoilmoitukset f
LEFT JOIN d_tieteenala d1 ON d1.id=f.d_tieteenala_id
LEFT JOIN d_taiteenala d20 ON d20.id = -1
LEFT JOIN d_virtajtpsektori d2 ON d2.id=(select id from dw.d_virtajtpsektori where virtajtpsektori_fi='Yliopisto')
LEFT JOIN dw.d_organisaatioluokitus d3 ON d3.id=f.d_yliopisto_id
LEFT JOIN d_julkaisutyyppi d4 ON d4.julkaisutyyppi_koodi='H2'
LEFT JOIN d_julkaisufoorumitaso d5 ON d5.id=-1
LEFT JOIN d_julkaisun_kansainvalisyys d6 ON d6.id=f.d_julkaisun_kansainvalisyys_id
LEFT JOIN d_kansainvalinen_yhteisjulkaisu d7 ON d7.id=-1
LEFT JOIN dw.d_ohjauksenala d8 on d8.id=f.d_ohjauksenala_id
LEFT JOIN dw.d_koulutusala_1995 d9 on d9.id=f.d_koulutusala_id
LEFT JOIN dw.d_koulutusala_2002 d10 on d10.id=-1
LEFT JOIN dw.d_kytkin d12 on d12.id = -1
LEFT JOIN dw.d_kytkin d13 on d13.id = -1
LEFT JOIN dw.d_kytkin d14 on d14.id = -1
LEFT JOIN dw.d_kytkin d15 on d15.id = -1
LEFT JOIN dw.d_kytkin d16 on d16.id = -1
LEFT JOIN dw.d_avoinsaatavuus d17 on d17.id = -1

LEFT JOIN d_julkaisufoorumitaso d18 ON d18.id=-1 --new
LEFT JOIN d_julkaisufoorumitaso d19 ON d19.id=-1 --new

UNION ALL

SELECT f.vuosi AS "Tilastovuosi"
  ,f.vuosi AS 'Statistikår'
  ,f.vuosi AS 'Statistical year'
  ,f.vuosi AS 'Ilmoitusvuosi'
  ,julkaisunTunnnus = NULL
  ,d2.virtajtpsektori_koodi as 'Koodit Sektori'
  ,d2.virtajtpsektori_fi as 'Sektori'
  ,d2.virtajtpsektori_sv
  ,d2.virtajtpsektori_en
  ,d3.organisaatio_koodi as 'Koodit Organisaatio'
  ,d3.organisaatio_fi as 'Organisaatio'
  ,d3.organisaatio_sv
  ,d3.organisaatio_en
  ,d3.organisaatio_koodi as 'Koodit Ammattikorkeakoulu'
  ,d3.organisaatio_fi as 'Ammattikorkeakoulu'
  ,d3.organisaatio_sv as 'Yrkeshögskola'
  ,d3.organisaatio_en as 'University of applied sciences'
  ,NULL as 'Koodit Yliopisto'
  ,NULL as 'Yliopisto'
  ,NULL as 'Universitet'
  ,NULL as 'University'
  ,d5.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_sv
  ,d5.julkaisufoorumitaso_en
  ,d4.julkaisunpaaluokka_koodi as 'Koodit Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_fi as 'Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_sv
  ,d4.julkaisunpaaluokka_nimi_en
  ,d4.julkaisutyyppi_koodi as 'Koodit Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_fi as 'Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_sv
  ,d4.julkaisutyyppi_nimi_en
  ,d6.julkaisun_kansainvalisyys_koodi as 'Koodit Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_fi as 'Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_sv
  ,d6.julkaisun_kansainvalisyys_en
  ,d7.kansainvalinen_yhteisjulkaisu_koodi as 'Koodit Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_fi as 'Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_sv
  ,d7.kansainvalinen_yhteisjulkaisu_en
  ,d1.paatieteenala_koodi as 'Koodit Päätieteenala'
  ,d1.paatieteenala_nimi_fi as 'Päätieteenala'
  ,d1.paatieteenala_nimi_sv
  ,d1.paatieteenala_nimi_en
  ,d1.tieteenala_koodi as 'Koodit Tieteenala'
  ,d1.tieteenala_nimi_fi as 'Tieteenala'
  ,d1.tieteenala_nimi_sv
  ,d1.tieteenala_nimi_en
  ,d20.taiteenala_koodi as 'Koodit Taiteenala'
  ,d20.taiteenala_nimi_fi as 'Taiteenala'
  ,d20.taiteenala_nimi_sv
  ,d20.taiteenala_nimi_en
  ,9999 as 'Koodit TaidealanTyyppikategoria'
  ,'Tieto puuttuu' as 'Taidealan tyyppikategoria'
  ,d8.ohjauksenala_koodi as 'Koodit OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_fi as 'OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_sv
  ,d8.ohjauksenala_nimi_en
  ,d9.koodi as 'Koodit Koulutusala 95'
  ,d9.selite_fi as 'Koulutusala 95'
  ,d9.selite_sv as 'Utbildningsområde 95'
  ,d9.selite_en as 'Field of education 95'
  ,d10.koodi as 'Koodit Koulutusala 02'
  ,d10.selite_fi as 'Koulutusala 02'
  ,d10.selite_sv as 'Utbildningsområde 02'
  ,d10.selite_en as 'Field of education 02'
  ,d12.kytkin_fi as 'Yhteisjulk. yliop. sairaanhoitopiiri'
  ,d13.kytkin_fi as 'Yhteisjulk. valtion sektoritutkimuslaitos'
  ,d14.kytkin_fi as 'Yhteisjulk. muu kotim. tutkimusorganisaatio'
  ,d15.kytkin_fi as 'Yhteisjulkaisu yrityksen kanssa'
  ,d16.kytkin_fi as 'Julkaisu rinnakkaistallennettu'
  ,d17.avoinsaatavuus_koodi as 'Koodit Avoin saatavuus'
  ,d17.avoinsaatavuus_fi as 'Avoin saatavuus'
  ,d17.avoinsaatavuus_sv as 'Öppen tillgång'
  ,d17.avoinsaatavuus_en as 'Open access'
  ,f.h21
  ,d18.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso_vanha' --new
  ,d18.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso vanha luokitus'  --new
  ,d19.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso_uusi'  --new
  ,d19.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso uusi luokitus'  --new
   ,9999 as 'Julkaisun tekijan rooli koodi'
  ,'Tieto puuttuu' as 'Julkaisun tekijan rooli'
  ,coalesce(cast(f.tieteenala_lkm as varchar), 'Tieto puuttuu') as tieteenala_lkm
  ,coalesce(f.tieteenala_lkm, 7) as tieteenala_lkm_jarj
  ,coalesce(cast(f.paatieteenala_lkm as varchar), 'Tieto puuttuu') as paatieteenala_lkm
  ,coalesce(f.paatieteenala_lkm, 7) as paatieteenala_lkm_jarj
FROM dw.f_amk_keksintoilmoitukset f
LEFT JOIN d_tieteenala d1 ON d1.id=f.d_tieteenala_id
LEFT JOIN d_taiteenala d20 ON d20.id = -1
LEFT JOIN d_virtajtpsektori d2 ON d2.id=(select id from dw.d_virtajtpsektori where virtajtpsektori_fi='Ammattikorkeakoulu')
LEFT JOIN dw.d_organisaatioluokitus d3 ON d3.id=f.d_organisaatioluokitus_id
LEFT JOIN d_julkaisutyyppi d4 ON d4.julkaisutyyppi_koodi='H2'
LEFT JOIN d_julkaisufoorumitaso d5 ON d5.id=-1
LEFT JOIN d_julkaisun_kansainvalisyys d6 ON d6.id=f.d_julkaisun_kansainvalisyys_id
LEFT JOIN d_kansainvalinen_yhteisjulkaisu d7 ON d7.id=-1
LEFT JOIN dw.d_ohjauksenala d8 on d8.id=f.d_ohjauksenala_id
LEFT JOIN dw.d_koulutusala_1995 d9 on d9.id=-1
LEFT JOIN dw.d_koulutusala_2002 d10 on d10.id=f.d_koulutusala_id
LEFT JOIN dw.d_kytkin d12 on d12.id = -1
LEFT JOIN dw.d_kytkin d13 on d13.id = -1
LEFT JOIN dw.d_kytkin d14 on d14.id = -1
LEFT JOIN dw.d_kytkin d15 on d15.id = -1
LEFT JOIN dw.d_kytkin d16 on d16.id = -1
LEFT JOIN dw.d_avoinsaatavuus d17 on d17.id = -1

LEFT JOIN d_julkaisufoorumitaso d18 ON d18.id=-1 --new
LEFT JOIN d_julkaisufoorumitaso d19 ON d19.id=-1 --new

UNION ALL

SELECT f.vuosi AS "Tilastovuosi"
  ,f.vuosi AS 'Statistikår'
  ,f.vuosi AS 'Statistical year'
  ,f.vuosi AS 'Ilmoitusvuosi'
  ,julkaisunTunnnus = NULL
  ,d2.virtajtpsektori_koodi as 'Koodit Sektori'
  ,d2.virtajtpsektori_fi as 'Sektori'
  ,d2.virtajtpsektori_sv
  ,d2.virtajtpsektori_en
  ,d3.organisaatio_koodi as 'Koodit Organisaatio'
  ,d3.organisaatio_fi as 'Organisaatio'
  ,d3.organisaatio_sv
  ,d3.organisaatio_en
  ,d3.organisaatio_koodi as 'Koodit Ammattikorkeakoulu'
  ,d3.organisaatio_fi as 'Ammattikorkeakoulu'
  ,d3.organisaatio_sv as 'Yrkeshögskola'
  ,d3.organisaatio_en as 'University of applied sciences'
  ,NULL as 'Koodit Yliopisto'
  ,NULL as 'Yliopisto'
  ,NULL as 'Universitet'
  ,NULL as 'University'
  ,d5.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_sv
  ,d5.julkaisufoorumitaso_en
  ,d4.julkaisunpaaluokka_koodi as 'Koodit Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_fi as 'Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_sv
  ,d4.julkaisunpaaluokka_nimi_en
  ,d4.julkaisutyyppi_koodi as 'Koodit Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_fi as 'Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_sv
  ,d4.julkaisutyyppi_nimi_en
  ,d6.julkaisun_kansainvalisyys_koodi as 'Koodit Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_fi as 'Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_sv
  ,d6.julkaisun_kansainvalisyys_en
  ,d7.kansainvalinen_yhteisjulkaisu_koodi as 'Koodit Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_fi as 'Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_sv
  ,d7.kansainvalinen_yhteisjulkaisu_en
  ,case when d1.paatieteenala_nimi_fi = 'Tieto puuttuu' and f.vuosi=2010 then (select top 1 paatieteenala_koodi from antero.dw.d_tieteenala f2 where LEFT(f2.tieteenala_koodi,3)=f.tieteenala_koodi) else d1.paatieteenala_koodi end as 'Koodit Päätieteenala'
  ,case when d1.paatieteenala_nimi_fi = 'Tieto puuttuu' and f.vuosi=2010 then (select top 1 paatieteenala_nimi_fi from antero.dw.d_tieteenala f2 where LEFT(f2.tieteenala_koodi,3)=f.tieteenala_koodi) else d1.paatieteenala_nimi_fi end as 'Päätieteenala'
  ,d1.paatieteenala_nimi_sv
  ,d1.paatieteenala_nimi_en
  ,d1.tieteenala_koodi as 'Koodit Tieteenala'
  ,d1.tieteenala_nimi_fi as 'Tieteenala'
  ,d1.tieteenala_nimi_sv
  ,d1.tieteenala_nimi_en
  ,d20.taiteenala_koodi as 'Koodit Taiteenala'
  ,d20.taiteenala_nimi_fi as 'Taiteenala'
  ,d20.taiteenala_nimi_sv
  ,d20.taiteenala_nimi_en
  ,9999 as 'Koodit TaidealanTyyppikategoria'
  ,'Tieto puuttuu' as 'Taidealan tyyppikategoria'
  ,d8.ohjauksenala_koodi as 'Koodit OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_fi as 'OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_sv
  ,d8.ohjauksenala_nimi_en
  ,d9.koodi as 'Koodit Koulutusala 95'
  ,d9.selite_fi as 'Koulutusala 95'
  ,d9.selite_sv as 'Utbildningsområde 95'
  ,d9.selite_en as 'Field of education 95'
  ,d10.koodi as 'Koodit Koulutusala 02'
  ,d10.selite_fi as 'Koulutusala 02'
  ,d10.selite_sv as 'Utbildningsområde 02'
  ,d10.selite_en as 'Field of education 02'
  ,d12.kytkin_fi as 'Yhteisjulk. yliop. sairaanhoitopiiri'
  ,d13.kytkin_fi as 'Yhteisjulk. valtion sektoritutkimuslaitos'
  ,d14.kytkin_fi as 'Yhteisjulk. muu kotim. tutkimusorganisaatio'
  ,d15.kytkin_fi as 'Yhteisjulkaisu yrityksen kanssa'
  ,d16.kytkin_fi as 'Julkaisu rinnakkaistallennettu'
  ,d17.avoinsaatavuus_koodi as 'Koodit Avoin saatavuus'
  ,d17.avoinsaatavuus_fi as 'Avoin saatavuus'
  ,d17.avoinsaatavuus_sv as 'Öppen tillgång'
  ,d17.avoinsaatavuus_en as 'Open access'
  ,f.julkaisujen_maara
  ,d18.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso_vanha' --new
  ,d18.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso vanha luokitus'  --new
  ,d19.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso_uusi'  --new
  ,d19.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso uusi luokitus'  --new
   ,9999 as 'Julkaisun tekijan rooli koodi'
  ,'Tieto puuttuu' as 'Julkaisun tekijan rooli'
  ,'Tieto puuttuu' as tieteenala_lkm
  ,7 as 'tieteenala_lkm_jarj'
  ,'Tieto puuttuu' as 'paatieteenala_lkm'
  ,7 as 'paatieteenala_lkm_jarj'
FROM f_amk_julkaisut_a_e f
LEFT JOIN d_tieteenala d1 ON d1.id=f.d_tieteenala_id
LEFT JOIN d_taiteenala d20 ON d20.id = -1
LEFT JOIN d_virtajtpsektori d2 ON d2.id=(select id from dw.d_virtajtpsektori where virtajtpsektori_fi='Ammattikorkeakoulu')
LEFT JOIN dw.d_organisaatioluokitus d3 ON d3.id=f.d_organisaatioluokitus_id
LEFT JOIN d_julkaisutyyppi d4 ON d4.id=f.d_julkaisutyyppi_id
LEFT JOIN d_julkaisufoorumitaso d5 ON d5.id=-1
LEFT JOIN d_julkaisun_kansainvalisyys d6 ON d6.id=f.d_julkaisun_kansainvalisyys_id
LEFT JOIN d_kansainvalinen_yhteisjulkaisu d7 ON d7.id=-1
LEFT JOIN dw.d_ohjauksenala d8 on d8.id=f.d_ohjauksenala_id
LEFT JOIN dw.d_koulutusala_1995 d9 on d9.id=-1
LEFT JOIN dw.d_koulutusala_2002 d10 on d10.id=f.d_koulutusala_id
LEFT JOIN dw.d_kytkin d12 on d12.id = -1
LEFT JOIN dw.d_kytkin d13 on d13.id = -1
LEFT JOIN dw.d_kytkin d14 on d14.id = -1
LEFT JOIN dw.d_kytkin d15 on d15.id = -1
LEFT JOIN dw.d_kytkin d16 on d16.id = -1
LEFT JOIN dw.d_avoinsaatavuus d17 on d17.id = -1

LEFT JOIN d_julkaisufoorumitaso d18 ON d18.id=-1 --new
LEFT JOIN d_julkaisufoorumitaso d19 ON d19.id=-1 --new

WHERE vuosi in (2010,2011)

UNION ALL

SELECT f.vuosi AS "Tilastovuosi"
  ,f.vuosi AS 'Statistikår'
  ,f.vuosi AS 'Statistical year'
  ,f.vuosi AS 'Ilmoitusvuosi'
  ,julkaisunTunnnus = NULL
  ,d2.virtajtpsektori_koodi as 'Koodit Sektori'
  ,d2.virtajtpsektori_fi as 'Sektori'
  ,d2.virtajtpsektori_sv
  ,d2.virtajtpsektori_en
  ,d3.organisaatio_koodi as 'Koodit Organisaatio'
  ,d3.organisaatio_fi as 'Organisaatio'
  ,d3.organisaatio_sv
  ,d3.organisaatio_en
  ,null as 'Koodit Ammattikorkeakoulu'
  ,NULL as 'Ammattikorkeakoulu'
  ,NULL as 'Yrkeshögskola'
  ,NULL as 'University of applied sciences'
  ,d3.organisaatio_koodi as 'Koodit Yliopisto'
  ,d3.organisaatio_fi as 'Yliopisto'
  ,d3.organisaatio_sv as 'Universitet'
  ,d3.organisaatio_en as 'University'
  ,d5.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso'
  ,d5.julkaisufoorumitaso_sv
  ,d5.julkaisufoorumitaso_en
  ,d4.julkaisunpaaluokka_koodi as 'Koodit Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_fi as 'Julkaisun pääluokka'
  ,d4.julkaisunpaaluokka_nimi_sv
  ,d4.julkaisunpaaluokka_nimi_en
  ,d4.julkaisutyyppi_koodi as 'Koodit Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_fi as 'Julkaisutyyppi'
  ,d4.julkaisutyyppi_nimi_sv
  ,d4.julkaisutyyppi_nimi_en
  ,d6.julkaisun_kansainvalisyys_koodi as 'Koodit Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_fi as 'Julkaisun kansainvälisyys'
  ,d6.julkaisun_kansainvalisyys_sv
  ,d6.julkaisun_kansainvalisyys_en
  ,d7.kansainvalinen_yhteisjulkaisu_koodi as 'Koodit Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_fi as 'Kansainvälinen yhteisjulkaisu'
  ,d7.kansainvalinen_yhteisjulkaisu_sv
  ,d7.kansainvalinen_yhteisjulkaisu_en
  ,case when d1.paatieteenala_nimi_fi = 'Tieto puuttuu' and f.vuosi=2010 then (select top 1 paatieteenala_koodi from antero.dw.d_tieteenala f2 where LEFT(f2.tieteenala_koodi,3)=f.tieteenala_koodi) else d1.paatieteenala_koodi end as 'Koodit Päätieteenala'
  ,case when d1.paatieteenala_nimi_fi = 'Tieto puuttuu' and f.vuosi=2010 then (select top 1 paatieteenala_nimi_fi from antero.dw.d_tieteenala f2 where LEFT(f2.tieteenala_koodi,3)=f.tieteenala_koodi) else d1.paatieteenala_nimi_fi end as 'Päätieteenala'
  ,d1.paatieteenala_nimi_sv
  ,d1.paatieteenala_nimi_en
  ,d1.tieteenala_koodi as 'Koodit Tieteenala'
  ,d1.tieteenala_nimi_fi as 'Tieteenala'
  ,d1.tieteenala_nimi_sv
  ,d1.tieteenala_nimi_en
  ,d20.taiteenala_koodi as 'Koodit Taiteenala'
  ,d20.taiteenala_nimi_fi as 'Taiteenala'
  ,d20.taiteenala_nimi_sv
  ,d20.taiteenala_nimi_en
  ,9999 as 'Koodit TaidealanTyyppikategoria'
  ,'Tieto puuttuu' as 'Taidealan tyyppikategoria'
  ,d8.ohjauksenala_koodi as 'Koodit OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_fi as 'OKM ohjauksen ala'
  ,d8.ohjauksenala_nimi_sv
  ,d8.ohjauksenala_nimi_en
  ,d9.koodi as 'Koodit Koulutusala 95'
  ,d9.selite_fi as 'Koulutusala 95'
  ,d9.selite_sv as 'Utbildningsområde 95'
  ,d9.selite_en as 'Field of education 95'
  ,d10.koodi as 'Koodit Koulutusala 02'
  ,d10.selite_fi as 'Koulutusala 02'
  ,d10.selite_sv as 'Utbildningsområde 02'
  ,d10.selite_en as 'Field of education 02'
  ,d12.kytkin_fi as 'Yhteisjulk. yliop. sairaanhoitopiiri'
  ,d13.kytkin_fi as 'Yhteisjulk. valtion sektoritutkimuslaitos'
  ,d14.kytkin_fi as 'Yhteisjulk. muu kotim. tutkimusorganisaatio'
  ,d15.kytkin_fi as 'Yhteisjulkaisu yrityksen kanssa'
  ,d16.kytkin_fi as 'Julkaisu rinnakkaistallennettu'
  ,d17.avoinsaatavuus_koodi as 'Koodit Avoin saatavuus'
  ,d17.avoinsaatavuus_fi as 'Avoin saatavuus'
  ,d17.avoinsaatavuus_sv as 'Öppen tillgång'
  ,d17.avoinsaatavuus_en as 'Open access'
  ,f.julkaisujen_maara
  ,d18.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso_vanha' --new
  ,d18.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso vanha luokitus'  --new
  ,d19.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso_uusi'  --new
  ,d19.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso uusi luokitus'  --new
   ,9999 as 'Julkaisun tekijan rooli koodi'
  ,'Tieto puuttuu' as 'Julkaisun tekijan rooli'
  ,'Tieto puuttuu' as tieteenala_lkm
  ,7 as 'tieteenala_lkm_jarj'
  ,'Tieto puuttuu' as 'paatieteenala_lkm'
  ,7 as 'paatieteenala_lkm_jarj'
FROM f_yo_julkaisut_a_e f
LEFT JOIN d_tieteenala d1 ON d1.id=f.d_tieteenala_id
LEFT JOIN d_taiteenala d20 ON d20.id = -1
LEFT JOIN d_virtajtpsektori d2 ON d2.id=(select id from dw.d_virtajtpsektori where virtajtpsektori_fi='Yliopisto')
LEFT JOIN dw.d_organisaatioluokitus d3 ON d3.id=f.d_yliopisto_id
LEFT JOIN d_julkaisutyyppi d4 ON d4.id=f.d_julkaisutyyppi_id
LEFT JOIN d_julkaisufoorumitaso d5 ON d5.id=-1
LEFT JOIN d_julkaisun_kansainvalisyys d6 ON d6.id=f.d_julkaisun_kansainvalisyys_id
LEFT JOIN d_kansainvalinen_yhteisjulkaisu d7 ON d7.id=-1
LEFT JOIN dw.d_ohjauksenala d8 on d8.id=f.d_ohjauksenala_id
LEFT JOIN dw.d_koulutusala_1995 d9 on d9.id=f.d_koulutusala_id
LEFT JOIN dw.d_koulutusala_2002 d10 on d10.id=-1
LEFT JOIN dw.d_kytkin d12 on d12.id = -1
LEFT JOIN dw.d_kytkin d13 on d13.id = -1
LEFT JOIN dw.d_kytkin d14 on d14.id = -1
LEFT JOIN dw.d_kytkin d15 on d15.id = -1
LEFT JOIN dw.d_kytkin d16 on d16.id = -1
LEFT JOIN dw.d_avoinsaatavuus d17 on d17.id = -1

LEFT JOIN d_julkaisufoorumitaso d18 ON d18.id=-1 --new
LEFT JOIN d_julkaisufoorumitaso d19 ON d19.id=-1 --new

WHERE vuosi = 2010


) a
where a.lukumaara>0 and a.Tilastovuosi <= (SELECT MAX(tilastovuosi) FROM ANTERO.dw.f_virta_jtp_tilasto)

GO

USE [ANTERO]