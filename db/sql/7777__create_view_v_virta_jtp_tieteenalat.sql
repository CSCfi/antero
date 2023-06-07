USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_jtp_tieteenalat]    Script Date: 7.6.2023 12:22:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [dw].[v_virta_jtp_tieteenalat] AS

SELECT 
	 f.tilastovuosi AS 'Tilastovuosi'
	,[julkaisunTunnus] as 'julkaisunTunnus'
	,d3.organisaatio_koodi as 'Koodit Organisaatio'
	,d3.organisaatio_fi as 'Organisaatio'
	,d7.virtajtpsektori_fi as 'Sektori'
	,d5.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso'
	,d5.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso'
	,d4.julkaisunpaaluokka_koodi as 'Koodit Julkaisun pääluokka'
	,d4.julkaisunpaaluokka_nimi_fi as 'Julkaisun pääluokka'
	,d4.julkaisutyyppi_koodi as 'Koodit Julkaisutyyppi'
	,d4.julkaisutyyppi_nimi_fi as 'Julkaisutyyppi'
	,d6.julkaisun_kansainvalisyys_koodi as 'Koodit Julkaisun kansainvälisyys'
	,d6.julkaisun_kansainvalisyys_fi as 'Julkaisun kansainvälisyys'
	,d1.paatieteenala_koodi as 'Koodit Päätieteenala_rivi'
	,d1.paatieteenala_nimi_fi as 'Päätieteenala_rivi'
	,d1.tieteenala_koodi as 'Koodit Tieteenala_rivi'
	,d1.tieteenala_nimi_fi as 'Tieteenala_rivi'
	,d2.paatieteenala_koodi as 'Koodit Päätieteenala_sarake'
	,d2.paatieteenala_nimi_fi as 'Päätieteenala_sarake'
	,d2.tieteenala_koodi as 'Koodit Tieteenala_sarake'
	,d2.tieteenala_nimi_fi as 'Tieteenala_sarake'
	,d16.kytkin_fi as 'Julkaisu rinnakkaistallennettu'
	,d17.avoinsaatavuus_koodi as 'Koodit Avoin saatavuus'
	,d17.avoinsaatavuus_fi as 'Avoin saatavuus'
	,d18.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso_vanha'
	,d18.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso vanha luokitus'  
	,d19.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso_uusi' 
	,d19.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso uusi luokitus'  
	,d1.jarjestys_paatieteenala_koodi as jarjestys_paatieteenala_1
	,d1.jarjestys_tieteenala_koodi as jarjestys_tieteenala_1
	,d2.jarjestys_paatieteenala_koodi as jarjestys_paatieteenala_2
	,d2.jarjestys_tieteenala_koodi as jarjestys_tieteenala_2
FROM dw.f_virta_jtp_tieteenalat f
LEFT JOIN dw.d_tieteenala d1 ON d1.id=f.d_tieteenala_1_id
LEFT JOIN dw.d_tieteenala d2 ON d2.id=f.d_tieteenala_2_id
LEFT JOIN dw.d_organisaatioluokitus d3 ON d3.id=f.d_organisaatio_id
LEFT JOIN dw.d_julkaisutyyppi d4 ON d4.id=f.d_julkaisutyyppi_id
LEFT JOIN dw.d_julkaisufoorumitaso d5 ON d5.id=f.d_julkaisufoorumitaso_id
LEFT JOIN dw.d_julkaisun_kansainvalisyys d6 ON d6.id=f.d_julkaisun_kansainvalisyys_id
LEFT JOIN dw.d_kytkin d16 on d16.id = d_rinnakkaistallennusKytkin_id
LEFT JOIN dw.d_avoinsaatavuus d17 on d17.id = d_avoinSaatavuus_id
LEFT JOIN dw.d_julkaisufoorumitaso d18 ON d18.id=f.d_julkaisufoorumitaso_vanha_id 
LEFT JOIN dw.d_julkaisufoorumitaso d19 ON d19.id=f.d_julkaisufoorumitaso_uusi_id
LEFT JOIN dw.d_virtajtpsektori d7 ON d7.id=f.d_virtajtpsektori_id
WHERE d4.julkaisutyyppi_koodi <> 'H2'

UNION ALL

SELECT
	f.tilastovuosi AS 'Tilastovuosi'
	,[julkaisunTunnus] as 'julkaisunTunnus'
	,d3.organisaatio_koodi as 'Koodit Organisaatio'
	,d3.organisaatio_fi as 'Organisaatio'
	,'Ammattikorkeakoulu' as 'Sektori'
	,d5.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso'
	,d5.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso'
	,d4.julkaisunpaaluokka_koodi as 'Koodit Julkaisun pääluokka'
	,d4.julkaisunpaaluokka_nimi_fi as 'Julkaisun pääluokka'
	,d4.julkaisutyyppi_koodi as 'Koodit Julkaisutyyppi'
	,d4.julkaisutyyppi_nimi_fi as 'Julkaisutyyppi'
	,d6.julkaisun_kansainvalisyys_koodi as 'Koodit Julkaisun kansainvälisyys'
	,d6.julkaisun_kansainvalisyys_fi as 'Julkaisun kansainvälisyys'
	,d1.paatieteenala_koodi as 'Koodit Päätieteenala_rivi'
	,d1.paatieteenala_nimi_fi as 'Päätieteenala_rivi'
	,d1.tieteenala_koodi as 'Koodit Tieteenala_rivi'
	,d1.tieteenala_nimi_fi as 'Tieteenala_rivi'
	,d2.paatieteenala_koodi as 'Koodit Päätieteenala_sarake'
	,d2.paatieteenala_nimi_fi as 'Päätieteenala_sarake'
	,d2.tieteenala_koodi as 'Koodit Tieteenala_sarake'
	,d2.tieteenala_nimi_fi as 'Tieteenala_sarake'
	,d16.kytkin_fi as 'Julkaisu rinnakkaistallennettu'
	,d17.avoinsaatavuus_koodi as 'Koodit Avoin saatavuus'
	,d17.avoinsaatavuus_fi as 'Avoin saatavuus'
	,d18.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso_vanha'
	,d18.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso vanha luokitus'  
	,d19.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso_uusi' 
	,d19.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso uusi luokitus'  
	,d1.jarjestys_paatieteenala_koodi as jarjestys_paatieteenala_1
	,d1.jarjestys_tieteenala_koodi as jarjestys_tieteenala_1
	,d2.jarjestys_paatieteenala_koodi as jarjestys_paatieteenala_2
	,d2.jarjestys_tieteenala_koodi as jarjestys_tieteenala_2
FROM [ANTERO].dw.[f_amk_julkaisut_f_i_tieteenalat] f
LEFT JOIN dw.d_tieteenala d1 ON d1.id=f.d_tieteenala_1_id
LEFT JOIN dw.d_tieteenala d2 ON d2.id=f.d_tieteenala_2_id
LEFT JOIN dw.d_organisaatioluokitus d3 ON d3.id=f.d_organisaatioluokitus_id
LEFT JOIN dw.d_julkaisutyyppi d4 ON d4.id=f.d_julkaisutyyppi_id
LEFT JOIN dw.d_julkaisufoorumitaso d5 ON d5.id=-1
LEFT JOIN dw.d_julkaisun_kansainvalisyys d6 ON d6.id=f.d_julkaisun_kansainvalisyys_id
LEFT JOIN dw.d_kytkin d16 on d16.id = -1
LEFT JOIN dw.d_avoinsaatavuus d17 on d17.id = -1
LEFT JOIN dw.d_julkaisufoorumitaso d18 ON d18.id=-1 
LEFT JOIN dw.d_julkaisufoorumitaso d19 ON d19.id=-1
WHERE d4.julkaisutyyppi_koodi <> 'H2'

UNION ALL

SELECT
	f.tilastovuosi AS 'Tilastovuosi'
	,[julkaisunTunnus] as 'julkaisunTunnus'
	,d3.organisaatio_koodi as 'Koodit Organisaatio'
	,d3.organisaatio_fi as 'Organisaatio'
	,'Yliopisto' as 'Sektori'
	,d5.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso'
	,d5.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso'
	,d4.julkaisunpaaluokka_koodi as 'Koodit Julkaisun pääluokka'
	,d4.julkaisunpaaluokka_nimi_fi as 'Julkaisun pääluokka'
	,d4.julkaisutyyppi_koodi as 'Koodit Julkaisutyyppi'
	,d4.julkaisutyyppi_nimi_fi as 'Julkaisutyyppi'
	,d6.julkaisun_kansainvalisyys_koodi as 'Koodit Julkaisun kansainvälisyys'
	,d6.julkaisun_kansainvalisyys_fi as 'Julkaisun kansainvälisyys'
	,d1.paatieteenala_koodi as 'Koodit Päätieteenala_rivi'
	,d1.paatieteenala_nimi_fi as 'Päätieteenala_rivi'
	,d1.tieteenala_koodi as 'Koodit Tieteenala_rivi'
	,d1.tieteenala_nimi_fi as 'Tieteenala_rivi'
	,d2.paatieteenala_koodi as 'Koodit Päätieteenala_sarake'
	,d2.paatieteenala_nimi_fi as 'Päätieteenala_sarake'
	,d2.tieteenala_koodi as 'Koodit Tieteenala_sarake'
	,d2.tieteenala_nimi_fi as 'Tieteenala_sarake'
	,d16.kytkin_fi as 'Julkaisu rinnakkaistallennettu'
	,d17.avoinsaatavuus_koodi as 'Koodit Avoin saatavuus'
	,d17.avoinsaatavuus_fi as 'Avoin saatavuus'
	,d18.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso_vanha'
	,d18.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso vanha luokitus'  
	,d19.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso_uusi' 
	,d19.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso uusi luokitus'  
	,d1.jarjestys_paatieteenala_koodi as jarjestys_paatieteenala_1
	,d1.jarjestys_tieteenala_koodi as jarjestys_tieteenala_1
	,d2.jarjestys_paatieteenala_koodi as jarjestys_paatieteenala_2
	,d2.jarjestys_tieteenala_koodi as jarjestys_tieteenala_2
FROM [ANTERO].dw.[f_yo_julkaisut_f_i_tieteenalat] f
LEFT JOIN dw.d_tieteenala d1 ON d1.id=f.d_tieteenala_1_id
LEFT JOIN dw.d_tieteenala d2 ON d2.id=f.d_tieteenala_2_id
LEFT JOIN dw.d_organisaatioluokitus d3 ON d3.id=f.d_organisaatioluokitus_id
LEFT JOIN dw.d_julkaisutyyppi d4 ON d4.id=f.d_julkaisutyyppi_id
LEFT JOIN dw.d_julkaisufoorumitaso d5 ON d5.id=-1
LEFT JOIN dw.d_julkaisun_kansainvalisyys d6 ON d6.id=f.d_julkaisun_kansainvalisyys_id
LEFT JOIN dw.d_kytkin d16 on d16.id = -1
LEFT JOIN dw.d_avoinsaatavuus d17 on d17.id = -1
LEFT JOIN dw.d_julkaisufoorumitaso d18 ON d18.id=-1 
LEFT JOIN dw.d_julkaisufoorumitaso d19 ON d19.id=-1
WHERE d4.julkaisutyyppi_koodi <> 'H2'

UNION ALL

SELECT
	f.tilastovuosi AS 'Tilastovuosi'
	,[julkaisunTunnus] as 'julkaisunTunnus'
	,d3.organisaatio_koodi as 'Koodit Organisaatio'
	,d3.organisaatio_fi as 'Organisaatio'
	,'Ammattikorkeakoulu' as 'Sektori'
	,d5.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso'
	,d5.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso'
	,d4.julkaisunpaaluokka_koodi as 'Koodit Julkaisun pääluokka'
	,d4.julkaisunpaaluokka_nimi_fi as 'Julkaisun pääluokka'
	,d4.julkaisutyyppi_koodi as 'Koodit Julkaisutyyppi'
	,d4.julkaisutyyppi_nimi_fi as 'Julkaisutyyppi'
	,d6.julkaisun_kansainvalisyys_koodi as 'Koodit Julkaisun kansainvälisyys'
	,d6.julkaisun_kansainvalisyys_fi as 'Julkaisun kansainvälisyys'
	,d1.paatieteenala_koodi as 'Koodit Päätieteenala_rivi'
	,d1.paatieteenala_nimi_fi as 'Päätieteenala_rivi'
	,d1.tieteenala_koodi as 'Koodit Tieteenala_rivi'
	,d1.tieteenala_nimi_fi as 'Tieteenala_rivi'
	,d2.paatieteenala_koodi as 'Koodit Päätieteenala_sarake'
	,d2.paatieteenala_nimi_fi as 'Päätieteenala_sarake'
	,d2.tieteenala_koodi as 'Koodit Tieteenala_sarake'
	,d2.tieteenala_nimi_fi as 'Tieteenala_sarake'
	,d16.kytkin_fi as 'Julkaisu rinnakkaistallennettu'
	,d17.avoinsaatavuus_koodi as 'Koodit Avoin saatavuus'
	,d17.avoinsaatavuus_fi as 'Avoin saatavuus'
	,d18.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso_vanha'
	,d18.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso vanha luokitus'  
	,d19.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso_uusi' 
	,d19.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso uusi luokitus'  
	,d1.jarjestys_paatieteenala_koodi as jarjestys_paatieteenala_1
	,d1.jarjestys_tieteenala_koodi as jarjestys_tieteenala_1
	,d2.jarjestys_paatieteenala_koodi as jarjestys_paatieteenala_2
	,d2.jarjestys_tieteenala_koodi as jarjestys_tieteenala_2
FROM [ANTERO].dw.[f_amk_keksintoilmoitukset_tieteenalat] f
LEFT JOIN dw.d_tieteenala d1 ON d1.id=f.d_tieteenala_1_id
LEFT JOIN dw.d_tieteenala d2 ON d2.id=f.d_tieteenala_2_id
LEFT JOIN dw.d_organisaatioluokitus d3 ON d3.id=f.d_organisaatioluokitus_id
LEFT JOIN dw.d_julkaisutyyppi d4 ON d4.id=f.d_julkaisutyyppi_id
LEFT JOIN dw.d_julkaisufoorumitaso d5 ON d5.id=-1
LEFT JOIN dw.d_julkaisun_kansainvalisyys d6 ON d6.id=f.d_julkaisun_kansainvalisyys_id
LEFT JOIN dw.d_kytkin d16 on d16.id = -1
LEFT JOIN dw.d_avoinsaatavuus d17 on d17.id = -1
LEFT JOIN dw.d_julkaisufoorumitaso d18 ON d18.id=-1 
LEFT JOIN dw.d_julkaisufoorumitaso d19 ON d19.id=-1

UNION ALL

SELECT
	f.tilastovuosi AS 'Tilastovuosi'
	,[julkaisunTunnus] as 'julkaisunTunnus'
	,d3.organisaatio_koodi as 'Koodit Organisaatio'
	,d3.organisaatio_fi as 'Organisaatio'
	,'Yliopisto' as 'Sektori'
	,d5.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso'
	,d5.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso'
	,d4.julkaisunpaaluokka_koodi as 'Koodit Julkaisun pääluokka'
	,d4.julkaisunpaaluokka_nimi_fi as 'Julkaisun pääluokka'
	,d4.julkaisutyyppi_koodi as 'Koodit Julkaisutyyppi'
	,d4.julkaisutyyppi_nimi_fi as 'Julkaisutyyppi'
	,d6.julkaisun_kansainvalisyys_koodi as 'Koodit Julkaisun kansainvälisyys'
	,d6.julkaisun_kansainvalisyys_fi as 'Julkaisun kansainvälisyys'
	,d1.paatieteenala_koodi as 'Koodit Päätieteenala_rivi'
	,d1.paatieteenala_nimi_fi as 'Päätieteenala_rivi'
	,d1.tieteenala_koodi as 'Koodit Tieteenala_rivi'
	,d1.tieteenala_nimi_fi as 'Tieteenala_rivi'
	,d2.paatieteenala_koodi as 'Koodit Päätieteenala_sarake'
	,d2.paatieteenala_nimi_fi as 'Päätieteenala_sarake'
	,d2.tieteenala_koodi as 'Koodit Tieteenala_sarake'
	,d2.tieteenala_nimi_fi as 'Tieteenala_sarake'
	,d16.kytkin_fi as 'Julkaisu rinnakkaistallennettu'
	,d17.avoinsaatavuus_koodi as 'Koodit Avoin saatavuus'
	,d17.avoinsaatavuus_fi as 'Avoin saatavuus'
	,d18.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso_vanha'
	,d18.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso vanha luokitus'  
	,d19.julkaisufoorumitaso_koodi as 'Koodit Julkaisufoorumitaso_uusi' 
	,d19.julkaisufoorumitaso_fi as 'Julkaisufoorumitaso uusi luokitus'  
	,d1.jarjestys_paatieteenala_koodi as jarjestys_paatieteenala_1
	,d1.jarjestys_tieteenala_koodi as jarjestys_tieteenala_1
	,d2.jarjestys_paatieteenala_koodi as jarjestys_paatieteenala_2
	,d2.jarjestys_tieteenala_koodi as jarjestys_tieteenala_2
FROM [ANTERO].dw.[f_yo_keksintoilmoitukset_tieteenalat] f
LEFT JOIN dw.d_tieteenala d1 ON d1.id=f.d_tieteenala_1_id
LEFT JOIN dw.d_tieteenala d2 ON d2.id=f.d_tieteenala_2_id
LEFT JOIN dw.d_organisaatioluokitus d3 ON d3.id=f.d_organisaatioluokitus_id
LEFT JOIN dw.d_julkaisutyyppi d4 ON d4.id=f.d_julkaisutyyppi_id
LEFT JOIN dw.d_julkaisufoorumitaso d5 ON d5.id=-1
LEFT JOIN dw.d_julkaisun_kansainvalisyys d6 ON d6.id=f.d_julkaisun_kansainvalisyys_id
LEFT JOIN dw.d_kytkin d16 on d16.id = -1
LEFT JOIN dw.d_avoinsaatavuus d17 on d17.id = -1
LEFT JOIN dw.d_julkaisufoorumitaso d18 ON d18.id=-1 
LEFT JOIN dw.d_julkaisufoorumitaso d19 ON d19.id=-1

GO

USE [ANTERO]