USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_jtp_latausraportit_tilanne]    Script Date: 18.9.2025 12.03.28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dw].[v_virta_jtp_latausraportit_tilanne] AS

SELECT	
	s.*, 
	CASE 
		WHEN Julkaisutyyppi <> [Julkaisutyyppi (päätelty)] THEN 'Kyllä'
		ELSE 'Ei'
	END as 'Attribuutit ja julkaisutyyppi ristiriidassa' 
FROM (
	SELECT	

		 [julkaisunNimi] as 'Julkaisun nimi'
		,[organisaationJulkaisuTunnus] as 'JulkaisunOrgTunnus'
		,[julkaisunTila]
		,[organisaatioNimi] as 'Organisaatio'
		,[julkaisuVuosi]
		,[ilmoitusVuosi]
		,[julkaisunTunnus] as JulkaisunTunnus
		,[jufoTunnus] as 'JufoTunnus'
		,coalesce([jufoLuokkaKoodi], 'Tieto puuttuu') as 'JufoLuokka'
		,COALESCE([julkaisuTyyppi],'Tieto puuttuu') as 'Julkaisutyyppi'
		,CASE
			WHEN [MuotoKoodi] is null and [YleisoKoodi] is null and [EmojulkaisuntyyppiKoodi] is null and [ArtikkelityyppiKoodi] is null and [VertaisarvioituKytkin] is null and [RaporttiKytkin] is null and [OpinnayteKoodi] is null and [TaidetyyppiKoodi] is null and [AVSovellusTyyppiKoodi] is null THEN julkaisuTyyppi
			WHEN [MuotoKoodi] = '0' and [YleisoKoodi] = '0' and [EmojulkaisuntyyppiKoodi] = '0' and [ArtikkelityyppiKoodi] in ('1', '3') and [VertaisarvioituKytkin] = '1' and ([RaporttiKytkin] is null or [RaporttiKytkin] = '0') and [OpinnayteKoodi] is null and [TaidetyyppiKoodi] is null and [AVSovellusTyyppiKoodi] is null THEN 'A1'
			WHEN [MuotoKoodi] = '0' and [YleisoKoodi] = '0' and [EmojulkaisuntyyppiKoodi] = '0' and [ArtikkelityyppiKoodi] = '2' and [VertaisarvioituKytkin] = '1' and ([RaporttiKytkin] is null or [RaporttiKytkin] = '0') and [OpinnayteKoodi] is null and [TaidetyyppiKoodi] is null and [AVSovellusTyyppiKoodi] is null THEN 'A2'
			WHEN [MuotoKoodi] = '0' and [YleisoKoodi] = '0' and [EmojulkaisuntyyppiKoodi] = '1' and [ArtikkelityyppiKoodi] = '0' and [VertaisarvioituKytkin] = '1' and ([RaporttiKytkin] is null or [RaporttiKytkin] = '0') and [OpinnayteKoodi] is null and [TaidetyyppiKoodi] is null and [AVSovellusTyyppiKoodi] is null THEN 'A3'
			WHEN [MuotoKoodi] = '0' and [YleisoKoodi] = '0' and [EmojulkaisuntyyppiKoodi] = '2' and [ArtikkelityyppiKoodi] = '0' and [VertaisarvioituKytkin] = '1' and ([RaporttiKytkin] is null or [RaporttiKytkin] = '0') and [OpinnayteKoodi] is null and [TaidetyyppiKoodi] is null and [AVSovellusTyyppiKoodi] is null THEN 'A4'
			WHEN [MuotoKoodi] = '0' and [YleisoKoodi] = '0' and [EmojulkaisuntyyppiKoodi] = '0' and [ArtikkelityyppiKoodi] = '0' and [VertaisarvioituKytkin] = '0' and ([RaporttiKytkin] is null or [RaporttiKytkin] = '0') and [OpinnayteKoodi] is null and [TaidetyyppiKoodi] is null and [AVSovellusTyyppiKoodi] is null THEN 'B1'
			WHEN [MuotoKoodi] = '0' and [YleisoKoodi] = '0' and [EmojulkaisuntyyppiKoodi] = '0' and [ArtikkelityyppiKoodi] = '3' and [VertaisarvioituKytkin] = '0' and ([RaporttiKytkin] is null or [RaporttiKytkin] = '0') and [OpinnayteKoodi] is null and [TaidetyyppiKoodi] is null and [AVSovellusTyyppiKoodi] is null THEN 'B1'
			WHEN [MuotoKoodi] = '0' and [YleisoKoodi] = '0' and [EmojulkaisuntyyppiKoodi] = '0' and [ArtikkelityyppiKoodi] = '0' and [VertaisarvioituKytkin] = '1' and ([RaporttiKytkin] is null or [RaporttiKytkin] = '0') and [OpinnayteKoodi] is null and [TaidetyyppiKoodi] is null and [AVSovellusTyyppiKoodi] is null THEN 'B1'
			WHEN [MuotoKoodi] = '0' and [YleisoKoodi] = '0' and [EmojulkaisuntyyppiKoodi] = '1' and [ArtikkelityyppiKoodi] = '0' and [VertaisarvioituKytkin] = '0' and ([RaporttiKytkin] is null or [RaporttiKytkin] = '0') and [OpinnayteKoodi] is null and [TaidetyyppiKoodi] is null and [AVSovellusTyyppiKoodi] is null THEN 'B2'
			WHEN [MuotoKoodi] = '0' and [YleisoKoodi] = '0' and [EmojulkaisuntyyppiKoodi] = '2' and [ArtikkelityyppiKoodi] = '0' and [VertaisarvioituKytkin] = '0' and ([RaporttiKytkin] is null or [RaporttiKytkin] = '0') and [OpinnayteKoodi] is null and [TaidetyyppiKoodi] is null and [AVSovellusTyyppiKoodi] is null THEN 'B3'
			WHEN [MuotoKoodi] = '1' and [YleisoKoodi] = '0' and [VertaisarvioituKytkin] = '1' and [EmojulkaisuntyyppiKoodi] is null and [ArtikkelityyppiKoodi] is null and ([RaporttiKytkin] is null or [RaporttiKytkin] in ('0','1')) and [OpinnayteKoodi] is null and [TaidetyyppiKoodi] is null and [AVSovellusTyyppiKoodi] is null THEN 'C1'
			WHEN [MuotoKoodi] = '2' and [YleisoKoodi] = '0' and [VertaisarvioituKytkin] = '1' and [EmojulkaisuntyyppiKoodi] in ('1','2','3') and [ArtikkelityyppiKoodi] is null and ([RaporttiKytkin] is null or [RaporttiKytkin] = '0') and [OpinnayteKoodi] is null and [TaidetyyppiKoodi] is null and [AVSovellusTyyppiKoodi] is null THEN 'C2'
			WHEN [MuotoKoodi] = '0' and [YleisoKoodi] = '1' and [EmojulkaisuntyyppiKoodi] = '0' and [ArtikkelityyppiKoodi] = '0' and ([VertaisarvioituKytkin] is null or [VertaisarvioituKytkin] = '0')  and ([RaporttiKytkin] is null or [RaporttiKytkin] = '0') and [OpinnayteKoodi] is null and [TaidetyyppiKoodi] is null and [AVSovellusTyyppiKoodi] is null THEN 'D1'
			WHEN [MuotoKoodi] = '5' and [YleisoKoodi] = '1' and [EmojulkaisuntyyppiKoodi] = '3' and [ArtikkelityyppiKoodi] is null and ([VertaisarvioituKytkin] is null or [VertaisarvioituKytkin] = '0')  and ([RaporttiKytkin] is null or [RaporttiKytkin] = '0') and [OpinnayteKoodi] is null and [TaidetyyppiKoodi] is null and [AVSovellusTyyppiKoodi] is null THEN 'D1'
			WHEN [MuotoKoodi] = '0' and [YleisoKoodi] = '1' and [EmojulkaisuntyyppiKoodi] = '1' and [ArtikkelityyppiKoodi] = '0' and ([VertaisarvioituKytkin] is null or [VertaisarvioituKytkin] = '0')  and ([RaporttiKytkin] is null or [RaporttiKytkin] = '0') and [OpinnayteKoodi] is null and [TaidetyyppiKoodi] is null and [AVSovellusTyyppiKoodi] is null THEN 'D2'
			WHEN [MuotoKoodi] = '0' and [YleisoKoodi] = '1' and [EmojulkaisuntyyppiKoodi] = '2' and [ArtikkelityyppiKoodi] = '0' and ([VertaisarvioituKytkin] is null or [VertaisarvioituKytkin] = '0')  and ([RaporttiKytkin] is null or [RaporttiKytkin] = '0') and [OpinnayteKoodi] is null and [TaidetyyppiKoodi] is null and [AVSovellusTyyppiKoodi] is null THEN 'D3'
			WHEN [MuotoKoodi] = '1' and [YleisoKoodi] = '1' and [EmojulkaisuntyyppiKoodi] is null and [ArtikkelityyppiKoodi] is null and ([VertaisarvioituKytkin] is null or [VertaisarvioituKytkin] = '0')  and [RaporttiKytkin] = '1' and [OpinnayteKoodi] is null and [TaidetyyppiKoodi] is null and [AVSovellusTyyppiKoodi] is null THEN 'D4'
			WHEN [MuotoKoodi] = '1' and [YleisoKoodi] = '1' and [EmojulkaisuntyyppiKoodi] is null and [ArtikkelityyppiKoodi] is null and ([VertaisarvioituKytkin] is null or [VertaisarvioituKytkin] = '0')  and [RaporttiKytkin] = '0' and [OpinnayteKoodi] is null and [TaidetyyppiKoodi] is null and [AVSovellusTyyppiKoodi] is null THEN 'D5'
			WHEN [MuotoKoodi] = '2' and [YleisoKoodi] = '1' and [EmojulkaisuntyyppiKoodi] in ('0', '1') and [ArtikkelityyppiKoodi] is null and ([VertaisarvioituKytkin] is null or [VertaisarvioituKytkin] = '0')  and ([RaporttiKytkin] is null or [RaporttiKytkin] = '0') and [OpinnayteKoodi] is null and [TaidetyyppiKoodi] is null and [AVSovellusTyyppiKoodi] is null THEN 'D6'
			WHEN [MuotoKoodi] = '2' and [YleisoKoodi] = '0' and [EmojulkaisuntyyppiKoodi] in ('0', '1', '2') and [ArtikkelityyppiKoodi] is null and [VertaisarvioituKytkin] = '0'  and [RaporttiKytkin] is null and [OpinnayteKoodi] is null and [TaidetyyppiKoodi] is null and [AVSovellusTyyppiKoodi] is null THEN 'D6'
			WHEN [MuotoKoodi] = '0' and [YleisoKoodi] = '2' and [EmojulkaisuntyyppiKoodi] in ('0', '1') and [ArtikkelityyppiKoodi] = '0' and ([VertaisarvioituKytkin] is null or [VertaisarvioituKytkin] = '0') and ([RaporttiKytkin] is null or [RaporttiKytkin] = '0') and [OpinnayteKoodi] is null and [TaidetyyppiKoodi] is null and [AVSovellusTyyppiKoodi] is null THEN 'E1'
			WHEN [MuotoKoodi] = '5' and [YleisoKoodi] = '2' and [EmojulkaisuntyyppiKoodi] = '3' and [ArtikkelityyppiKoodi] is null and ([VertaisarvioituKytkin] is null or [VertaisarvioituKytkin] = '0') and ([RaporttiKytkin] is null or [RaporttiKytkin] = '0') and [OpinnayteKoodi] is null and [TaidetyyppiKoodi] is null and [AVSovellusTyyppiKoodi] is null THEN 'E1'
			WHEN [MuotoKoodi] = '1' and [YleisoKoodi] = '2' and [EmojulkaisuntyyppiKoodi] is null and [ArtikkelityyppiKoodi] is null and ([VertaisarvioituKytkin] is null or [VertaisarvioituKytkin] = '0') and ([RaporttiKytkin] is null or [RaporttiKytkin] = '0') and [OpinnayteKoodi] is null and [TaidetyyppiKoodi] is null and [AVSovellusTyyppiKoodi] is null THEN 'E2'
			WHEN [MuotoKoodi] = '1' and [YleisoKoodi] = '0' and [EmojulkaisuntyyppiKoodi] is null and [ArtikkelityyppiKoodi] is null and [VertaisarvioituKytkin] = '0' and ([RaporttiKytkin] is null or [RaporttiKytkin] = '0') and [OpinnayteKoodi] is null and [TaidetyyppiKoodi] is null and [AVSovellusTyyppiKoodi] is null THEN 'E2'
			WHEN [MuotoKoodi] = '2' and [YleisoKoodi] = '2' and [EmojulkaisuntyyppiKoodi] in ('0', '1', '2') and [ArtikkelityyppiKoodi] is null and ([VertaisarvioituKytkin] is null or [VertaisarvioituKytkin] = '0') and ([RaporttiKytkin] is null or [RaporttiKytkin] = '0') and [OpinnayteKoodi] is null and [TaidetyyppiKoodi] is null and [AVSovellusTyyppiKoodi] is null THEN 'E3'
			WHEN [MuotoKoodi] = '1' and [YleisoKoodi] = '0' and [EmojulkaisuntyyppiKoodi] is null and [ArtikkelityyppiKoodi] is null and ([VertaisarvioituKytkin] is null or [VertaisarvioituKytkin] = '0') and ([RaporttiKytkin] is null or [RaporttiKytkin] = '0') and [OpinnayteKoodi] = '0' and [TaidetyyppiKoodi] is null and [AVSovellusTyyppiKoodi] is null THEN 'G4'
			WHEN [MuotoKoodi] = '1' and [YleisoKoodi] = '0' and [EmojulkaisuntyyppiKoodi] is null and [ArtikkelityyppiKoodi] is null and ([VertaisarvioituKytkin] is null or [VertaisarvioituKytkin] = '0') and ([RaporttiKytkin] is null or [RaporttiKytkin] = '0') and [OpinnayteKoodi] = '1' and [TaidetyyppiKoodi] is null and [AVSovellusTyyppiKoodi] is null THEN 'G5'
			WHEN [MuotoKoodi] = '6' and [YleisoKoodi] is null and ([EmojulkaisuntyyppiKoodi] is null or [EmojulkaisuntyyppiKoodi] = '3') and [ArtikkelityyppiKoodi] is null and [VertaisarvioituKytkin] is null and [RaporttiKytkin] is null and ([OpinnayteKoodi] is null or [OpinnayteKoodi] in('0', '1')) and [TaidetyyppiKoodi] = '0' and [AVSovellusTyyppiKoodi] is null THEN 'F1'
			WHEN [MuotoKoodi] = '6' and [YleisoKoodi] is null and ([EmojulkaisuntyyppiKoodi] is null or [EmojulkaisuntyyppiKoodi] = '3') and [ArtikkelityyppiKoodi] is null and [VertaisarvioituKytkin] is null and [RaporttiKytkin] is null and ([OpinnayteKoodi] is null or [OpinnayteKoodi] in('0', '1')) and [TaidetyyppiKoodi] = '1' and [AVSovellusTyyppiKoodi] is null THEN 'F2'
			WHEN [MuotoKoodi] = '6' and [YleisoKoodi] is null and ([EmojulkaisuntyyppiKoodi] is null or [EmojulkaisuntyyppiKoodi] = '3') and [ArtikkelityyppiKoodi] is null and [VertaisarvioituKytkin] is null and [RaporttiKytkin] is null and ([OpinnayteKoodi] is null or [OpinnayteKoodi] in('0', '1')) and [TaidetyyppiKoodi] = '2' and [AVSovellusTyyppiKoodi] is null THEN 'F3'
			WHEN [MuotoKoodi] = '7' and ([YleisoKoodi] is null or [YleisoKoodi] in ('0', '1', '2')) and [EmojulkaisuntyyppiKoodi] is null and [ArtikkelityyppiKoodi] is null and [VertaisarvioituKytkin] is null and [RaporttiKytkin] is null and [OpinnayteKoodi] is null and [TaidetyyppiKoodi] is null and [AVSovellusTyyppiKoodi] in ('0','1','2','3') THEN 'I1'
			WHEN [MuotoKoodi] = '8' and ([YleisoKoodi] is null or [YleisoKoodi] in ('0', '1', '2')) and [EmojulkaisuntyyppiKoodi] is null and [ArtikkelityyppiKoodi] is null and [VertaisarvioituKytkin] is null and [RaporttiKytkin] is null and [OpinnayteKoodi] is null and [TaidetyyppiKoodi] is null and [AVSovellusTyyppiKoodi] in ('4','5') THEN 'I2'
			WHEN [MuotoKoodi] = '3' and [YleisoKoodi] in ('0', '1', '2') and [EmojulkaisuntyyppiKoodi] in ('0', '1', '2', '3') and [ArtikkelityyppiKoodi] is null and ([VertaisarvioituKytkin] is null or [VertaisarvioituKytkin] = '0') and ([RaporttiKytkin] is null or [RaporttiKytkin] = '0') and [OpinnayteKoodi] is null and [TaidetyyppiKoodi] is null and [AVSovellusTyyppiKoodi] is null THEN 'KA'
			WHEN [MuotoKoodi] = '4' and [YleisoKoodi] in ('0', '1', '2') and [EmojulkaisuntyyppiKoodi] in ('0', '1', '2', '3') and [ArtikkelityyppiKoodi] is null and ([VertaisarvioituKytkin] is null or [VertaisarvioituKytkin] = '0') and ([RaporttiKytkin] is null or [RaporttiKytkin] = '0') and [OpinnayteKoodi] is null and [TaidetyyppiKoodi] is null and [AVSovellusTyyppiKoodi] is null THEN 'KP'
			ELSE 'Puutteelliset attribuutit'
		END as 'Julkaisutyyppi (päätelty)'
		,lkm=1
		,[AvoinSaatavuusJulkaisumaksu]
		,[AvoinSaatavuusJulkaisumaksuVuosi]
		,CASE
			WHEN [JulkaisuKanavaOA] = '0' THEN 'Ei vastausta (0)'
			WHEN [JulkaisuKanavaOA] = '1' THEN 'Kokonaan avoin julkaisukanava (1)'
			WHEN [JulkaisuKanavaOA] = '2' THEN 'Osittain avoin julkaisukanava (2)'
			WHEN [JulkaisuKanavaOA] = '3' THEN 'Viivästetysti avoin julkaisukanava (3)' 
			ELSE 'Tieto puuttuu'
		END as JulkaisuKanavaOA
		,CASE
			WHEN [AvoinSaatavuusKytkin] = '0' THEN 'Ei avoin (0)'
			WHEN [AvoinSaatavuusKytkin] = '1' THEN 'Avoimesti saatavilla (1)'
			ELSE 'Tieto puuttuu'
		END as AvoinSaatavuusKytkin
		,CASE
			WHEN [LisenssiKoodi] = '0' THEN 'Muu lisenssi (0)'
			WHEN [LisenssiKoodi] = '1' THEN 'CC BY (1)'
			WHEN [LisenssiKoodi] = '2' THEN 'CC BY NC (2)'
			WHEN [LisenssiKoodi] = '3' THEN 'CC BY NC ND (3)' 
			WHEN [LisenssiKoodi] = '4' THEN 'CC BY SA (4)' 
			ELSE 'Tieto puuttuu'
		END as LisenssiKoodi
		,CASE
			WHEN [MuotoKoodi] = '0' THEN 'Artikkeli (0)' 
			WHEN [MuotoKoodi] = '1' THEN 'Erillisteos (1)' 
			WHEN [MuotoKoodi] = '2' THEN 'Toimitustyö (2)' 
			WHEN [MuotoKoodi] = '3' THEN 'Abstrakti (3)' 
			WHEN [MuotoKoodi] = '4' THEN 'Posteri (4)' 
			WHEN [MuotoKoodi] = '5' THEN 'Blogikirjoitus (5)' 
			WHEN [MuotoKoodi] = '6' THEN 'Taidejulkaisu (6)' 
			WHEN [MuotoKoodi] = '7' THEN 'Audiovisuaalinen julkaisu (7)' 
			WHEN [MuotoKoodi] = '8' THEN 'Tieto- ja viestintätekninen sovellus (8)'
			ELSE 'Tieto puuttuu'
		END as MuotoKoodi 
		,CASE
			WHEN [YleisoKoodi] = '0' THEN 'Tieteellinen (0)' 
			WHEN [YleisoKoodi] = '1' THEN 'Ammatillinen (1)' 
			WHEN [YleisoKoodi] = '2' THEN 'Yleistajuinen (2)'  
			ELSE 'Tieto puuttuu'
		END as YleisoKoodi
		,CASE
			WHEN [EmojulkaisuntyyppiKoodi] = '0' THEN 'Lehti (0)' 
			WHEN [EmojulkaisuntyyppiKoodi] = '1' THEN 'Kokoomateos (1)' 
			WHEN [EmojulkaisuntyyppiKoodi] = '2' THEN 'Konferenssi (2)' 
			WHEN [EmojulkaisuntyyppiKoodi] = '3' THEN 'Verkkoalusta (3)'  
			ELSE 'Tieto puuttuu'
		END as EmojulkaisuntyyppiKoodi
		,CASE
			WHEN [ArtikkelityyppiKoodi] = '0' THEN 'Muu artikkeli (0)' 
			WHEN [ArtikkelityyppiKoodi] = '1' THEN 'Alkuperäisartikkeli (1)' 
			WHEN [ArtikkelityyppiKoodi] = '2' THEN 'Katsausartikkeli (2)' 
			WHEN [ArtikkelityyppiKoodi] = '3' THEN 'Data-artikkeli (3)'  
			ELSE 'Tieto puuttuu'
		END as ArtikkelityyppiKoodi
		,CASE
			WHEN [VertaisarvioituKytkin] = '0' THEN 'Ei-vertaisarvioitu (0)' 
			WHEN [VertaisarvioituKytkin] = '1' THEN 'Vertaisarvioitu (1)'   
			ELSE 'Tieto puuttuu'
		END as VertaisarvioituKytkin
		,CASE
			WHEN [RaporttiKytkin] = '0' THEN 'Ei-raportti (0)' 
			WHEN [RaporttiKytkin] = '1' THEN 'Raportti (1)'   
			ELSE 'Tieto puuttuu'
		END as RaporttiKytkin
		,CASE
			WHEN [OpinnayteKoodi] = '0' THEN 'Monografiaväitöskirja (0)' 
			WHEN [OpinnayteKoodi] = '1' THEN 'Kokoomaväitöskirja (1)'   
			ELSE 'Tieto puuttuu'
		END as OpinnayteKoodi
		,CASE
			WHEN [TaidetyyppiKoodi] = '0' THEN 'Taiteellinen erillisjulkaisu (0)' 
			WHEN [TaidetyyppiKoodi] = '1' THEN 'Taiteellisen teoksen osatoteutus (1)' 
			WHEN [TaidetyyppiKoodi] = '2' THEN 'Ei-taiteellisen julkaisun taiteellinen osa (2)' 
			ELSE 'Tieto puuttuu'
		END as TaidetyyppiKoodi
		,CASE
			WHEN [AVSovellusTyyppiKoodi] = '0' THEN 'Muu multimediajulkaisu (0)' 
			WHEN [AVSovellusTyyppiKoodi] = '1' THEN 'Video (1)' 
			WHEN [AVSovellusTyyppiKoodi] = '2' THEN 'Podcast (2)' 
			WHEN [AVSovellusTyyppiKoodi] = '3' THEN 'Televisio- tai radio-ohjelma (3)' 
			WHEN [AVSovellusTyyppiKoodi] = '4' THEN 'Sovellus (4)' 
			WHEN [AVSovellusTyyppiKoodi] = '5' THEN 'Algoritmi (5)' 
			ELSE 'Tieto puuttuu'
		END as AVSovellusTyyppiKoodi,
		d.kytkin_fi as Rinnakkaistallennettu,
		d.jarjestys_kytkin_koodi as jarj_Rinnakkaistallennettu
		,coalesce([MuotoKoodi],'99') as jarj_MuotoKoodi
		,coalesce([YleisoKoodi],'99') as jarj_YleisoKoodi
		,coalesce([EmojulkaisuntyyppiKoodi],'99') as jarj_EmojulkaisuntyyppiKoodi
		,coalesce([ArtikkelityyppiKoodi],'99') as jarj_ArtikkelityyppiKoodi
		,coalesce([VertaisarvioituKytkin],'99') as jarj_VertaisarvioituKytkin
		,coalesce([RaporttiKytkin],'99') as jarj_RaporttiKytkin
		,coalesce([OpinnayteKoodi],'99') as jarj_OpinnayteKoodi
		,coalesce([TaidetyyppiKoodi],'99') as jarj_TaidetyyppiKoodi
		,coalesce([AVSovellusTyyppiKoodi],'99') as jarj_AVSovellusTyyppiKoodi
		,coalesce(JulkaisuKanavaOA,'99') as jarj_JulkaisuKanavaOA
		,coalesce(AvoinSaatavuusKytkin,'99') as jarj_AvoinSaatavuusKytkin
		,coalesce(LisenssiKoodi,'99') as jarj_LisenssiKoodi
	FROM [ANTERO].[sa].[sa_virta_jtp_latausraportit_tilanne] s
	LEFT JOIN ANTERO.dw.d_kytkin d on d.kytkin_koodi = coalesce(CASE WHEN RinnakkaistallennettuKytkin = '' THEN NULL ELSE RinnakkaistallennettuKytkin END, -1)
	where (julkaisuVuosi > 2016 and ilmoitusVuosi is not null) or (ilmoitusVuosi is null and julkaisuVuosi >= YEAR(GETDATE())-3)
) s


GO


