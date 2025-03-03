USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_ainekelpoisuus]    Script Date: 18.4.2023 15:49:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_d_ainekelpoisuus]
AS
IF NOT EXISTS (SELECT * FROM dw.d_ainekelpoisuus WHERE id=-1)

	BEGIN

	  SET IDENTITY_INSERT dw.d_ainekelpoisuus ON;

	  INSERT INTO dw.d_ainekelpoisuus (
		id,aine_fi, aine_sv, aine_en, aineryhma_1_fi, aineryhma_1_sv, aineryhma_1_en, 
		aineryhma_2_fi, aineryhma_2_sv, aineryhma_2_en, source, loadtime, username
	  )
	SELECT
		-1,
		nimi,nimi_sv,nimi_en,
		nimi,nimi_sv,nimi_en,
		nimi,nimi_sv,nimi_en,
		'ETL: p_lataa_d_ainekelpoisuus',
		loadtime =getdate(),
		username = suser_name()
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta'
	  and koodi='-1'
	  ;

	  SET IDENTITY_INSERT dw.d_ainekelpoisuus OFF;

	END

ELSE

	BEGIN
		UPDATE d
		SET
			aine_fi=s.nimi,
			aine_sv=s.nimi_sv,
			aine_en=s.nimi_en,
			aineryhma_1_fi=s.nimi,
			aineryhma_1_sv=s.nimi_sv,
			aineryhma_1_en=s.nimi_en,
			aineryhma_2_fi=s.nimi,
			aineryhma_2_sv=s.nimi_sv,
			aineryhma_2_en=s.nimi_en,
			loadtime =getdate(),
			username = suser_name(),
			source = 'ETL: p_lataa_d_ainekelpoisuus'
		FROM dw.d_ainekelpoisuus d
			JOIN sa.sa_koodistot s ON s.koodi=d.aine_fi
		WHERE s.koodisto='vipunenmeta' AND s.koodi='-1'
		;
	END

MERGE dw.d_ainekelpoisuus AS target
USING (
	SELECT DISTINCT

		CASE 
			WHEN (d.patevyys_fi like 'suomen%' and d.patevyys_fi not like '%äidinkieli%') or d.patevyys_fi like '%toinen kotimainen kieli suomi%' THEN 'Toinen kotimainen kieli suomi'
			WHEN (d.patevyys_fi like 'ruotsin%' and d.patevyys_fi not like '%äidinkieli%')  or d.patevyys_fi like '%toinen kotimainen kieli ruotsi%' THEN 'Toinen kotimainen kieli ruotsi' 
			ELSE left(d.patevyys_fi, len(d.patevyys_fi) - charindex(',', reverse(d.patevyys_fi)))
		END as aine_fi,
		CASE
			WHEN s.nimi is not null THEN s.nimi_sv
			WHEN (d.patevyys_fi like 'suomen%' and d.patevyys_fi not like '%äidinkieli%') or d.patevyys_fi like '%toinen kotimainen kieli suomi%' THEN 'Andra inhemska språket finska'
			WHEN (d.patevyys_fi like 'ruotsin%' and d.patevyys_fi not like '%äidinkieli%')  or d.patevyys_fi like '%toinen kotimainen kieli ruotsi%' THEN 'Andra inhemska språket svenska' 
			WHEN left(d.patevyys_fi, len(d.patevyys_fi) - charindex(',', reverse(d.patevyys_fi))) = 'Elämänkatsomustieto' THEN 'Livsåskådningskunskap'
			WHEN left(d.patevyys_fi, len(d.patevyys_fi) - charindex(',', reverse(d.patevyys_fi))) = 'Käsityö (tekninen työ)' THEN 'Slöjd (teknisk)'
			WHEN left(d.patevyys_fi, len(d.patevyys_fi) - charindex(',', reverse(d.patevyys_fi))) = 'Käsityö (tekstiilityö)' THEN 'Slöjd (textil)'
			WHEN left(d.patevyys_fi, len(d.patevyys_fi) - charindex(',', reverse(d.patevyys_fi))) = 'Maantieto tai maantiede' THEN 'Geografi'
			WHEN left(d.patevyys_fi, len(d.patevyys_fi) - charindex(',', reverse(d.patevyys_fi))) = 'Teatteri ja tanssi' THEN 'Teater och dans'
			WHEN left(d.patevyys_fi, len(d.patevyys_fi) - charindex(',', reverse(d.patevyys_fi))) = 'Teologia' THEN 'Teologi'
			WHEN left(d.patevyys_fi, len(d.patevyys_fi) - charindex(',', reverse(d.patevyys_fi))) = 'Tietotekniikka' THEN 'Informationsteknologi'
			WHEN left(d.patevyys_fi, len(d.patevyys_fi) - charindex(',', reverse(d.patevyys_fi))) = 'Uskonto (buddhalaisuus)' THEN 'Religion (buddhism)'
			WHEN left(d.patevyys_fi, len(d.patevyys_fi) - charindex(',', reverse(d.patevyys_fi))) = 'Uskonto (islam)' THEN 'Religion (islam)'
			WHEN left(d.patevyys_fi, len(d.patevyys_fi) - charindex(',', reverse(d.patevyys_fi))) = 'Uskonto, evankelis-luterilainen' THEN 'Religion, evangelisk luthersk'
			WHEN left(d.patevyys_fi, len(d.patevyys_fi) - charindex(',', reverse(d.patevyys_fi))) = 'Uskonto, ortodoksinen' THEN 'Religion, ortodox'
			WHEN left(d.patevyys_fi, len(d.patevyys_fi) - charindex(',', reverse(d.patevyys_fi))) = 'Englannin kieli' THEN 'Engelska'
			WHEN left(d.patevyys_fi, len(d.patevyys_fi) - charindex(',', reverse(d.patevyys_fi))) = 'Espanjan kieli' THEN 'Spanska'
			WHEN left(d.patevyys_fi, len(d.patevyys_fi) - charindex(',', reverse(d.patevyys_fi))) = 'Italian kieli' THEN 'Italienska'
			WHEN left(d.patevyys_fi, len(d.patevyys_fi) - charindex(',', reverse(d.patevyys_fi))) = 'Japanin kieli' THEN 'Japanska'
			WHEN left(d.patevyys_fi, len(d.patevyys_fi) - charindex(',', reverse(d.patevyys_fi))) = 'Kiinan kieli' THEN 'Kinesiska'
			WHEN left(d.patevyys_fi, len(d.patevyys_fi) - charindex(',', reverse(d.patevyys_fi))) = 'Latinan kieli' THEN 'Latin'
			WHEN left(d.patevyys_fi, len(d.patevyys_fi) - charindex(',', reverse(d.patevyys_fi))) = 'Portugalin kieli' THEN 'Portugisiska'
			WHEN left(d.patevyys_fi, len(d.patevyys_fi) - charindex(',', reverse(d.patevyys_fi))) = 'Ranskan kieli' THEN 'Franska'
			WHEN left(d.patevyys_fi, len(d.patevyys_fi) - charindex(',', reverse(d.patevyys_fi))) = 'Saksan kieli' THEN 'Tysk'
			WHEN left(d.patevyys_fi, len(d.patevyys_fi) - charindex(',', reverse(d.patevyys_fi))) = 'Venäjän kieli' THEN 'Ryska'
			WHEN left(d.patevyys_fi, len(d.patevyys_fi) - charindex(',', reverse(d.patevyys_fi))) = 'Viron kieli' THEN 'Estniska'
			WHEN left(d.patevyys_fi, len(d.patevyys_fi) - charindex(',', reverse(d.patevyys_fi))) = 'Saamen kieli, äidinkieli ja kirjallisuus' THEN 'Samiska och litteratur'
			WHEN left(d.patevyys_fi, len(d.patevyys_fi) - charindex(',', reverse(d.patevyys_fi))) = 'Suomen kieli, äidinkieli ja kirjallisuus' THEN 'Finska och litteratur'
			WHEN left(d.patevyys_fi, len(d.patevyys_fi) - charindex(',', reverse(d.patevyys_fi))) = 'Ruotsin kieli, äidinkieli ja kirjallisuus' THEN 'Svenska och litteratur'
			WHEN left(d.patevyys_fi, len(d.patevyys_fi) - charindex(',', reverse(d.patevyys_fi))) = 'Äidinkieli ja kirjallisuus, suomi toisena kielenä' THEN 'Finska som andraspråk och litteratur'
			WHEN left(d.patevyys_fi, len(d.patevyys_fi) - charindex(',', reverse(d.patevyys_fi))) = 'Äidinkieli ja kirjallisuus, ruotsi toisena kielenä' THEN 'Svenska som andraspråk och litteratur'
			ELSE left(d.patevyys_fi, len(d.patevyys_fi) - charindex(',', reverse(d.patevyys_fi))) 
		END as aine_sv,
		'*EN' as aine_en,
		CASE 
			WHEN d.patevyys_fi like '%kieli%' THEN 'Kielet'
			WHEN d.patevyys_fi like '%Kasvatustieteet%' or d.patevyys_fi like '%Liiketalous ja kauppa%' THEN 'Muut kuin perusopetuksen ja lukion opetettavat aineet'
			ELSE 'Muut aineet'
		END  as aineryhma_1_fi,
		CASE 
			WHEN d.patevyys_fi like '%kieli%' THEN 'Språk'
			WHEN d.patevyys_fi like '%Kasvatustieteet%' or d.patevyys_fi like '%Liiketalous ja kauppa%' THEN 'Andra ämnen än de som undervisas i grundläggande utbildning och gymnasieutbildning'
			ELSE 'Andra ämnen'
		END as aineryhma_1_sv,
		'*EN' as aineryhma_1_en,
		CASE 
			WHEN d.patevyys_fi like '%biologia%' or d.patevyys_fi like '%maantiede%' THEN 'Biologia, maantiede'
			WHEN d.patevyys_fi like '%elämänkatsomustieto%' or d.patevyys_fi like '%uskonto%' or d.patevyys_fi like '%filosofia%' or d.patevyys_fi like '%teologia%' THEN 'Elämänkatsomus, uskonto, filosofia'
			WHEN d.patevyys_fi like '%äidinkieli%' THEN 'Äidinkieli ja kirjallisuus'
			WHEN d.patevyys_fi like '%englan%' THEN 'Englannin kieli'
			WHEN d.patevyys_fi like 'suomen%' or d.patevyys_fi like '%toinen kotimainen kieli suomi%' THEN 'Toinen kotimainen kieli suomi'
			WHEN d.patevyys_fi like 'ruotsin%' or d.patevyys_fi like '%toinen kotimainen kieli ruotsi%' THEN 'Toinen kotimainen kieli ruotsi'
			WHEN d.patevyys_fi like '%kieli%' THEN 'Muut kielet'
			WHEN d.patevyys_fi like '%kuvataide%' or d.patevyys_fi like '%käsityö%' THEN 'Kuvataide, käsityö'
			WHEN d.patevyys_fi like '%fysiikka%' or d.patevyys_fi like '%kemia%' or d.patevyys_fi like '%matematiikka%' THEN 'Fysiikka, kemia, matematiikka'
			WHEN d.patevyys_fi like '%historia%' or d.patevyys_fi like '%yhteiskuntaoppi%' THEN 'Historia, yhteiskuntaoppi'
			WHEN d.patevyys_fi like '%liikunta%' or d.patevyys_fi like '%terveystieto%' THEN 'Liikunta, terveystieto'
			ELSE left(d.patevyys_fi, len(d.patevyys_fi) - charindex(',', reverse(d.patevyys_fi)))
		END as aineryhma_2_fi,
		CASE 
			WHEN d.patevyys_fi like '%biologia%' or d.patevyys_fi like '%maantiede%' THEN 'Biologi, geografi'
			WHEN d.patevyys_fi like '%elämänkatsomustieto%' or d.patevyys_fi like '%uskonto%' or d.patevyys_fi like '%filosofia%' or d.patevyys_fi like '%teologia%' THEN 'Livsåskådningskunskap, religion, filosofi'
			WHEN d.patevyys_fi like '%äidinkieli%' THEN 'Modersmålet och litteratur'
			WHEN d.patevyys_fi like '%englan%' THEN 'Engelska'
			WHEN d.patevyys_fi like 'suomen%' or d.patevyys_fi like '%toinen kotimainen kieli suomi%' THEN 'Andra inhemska språket finska'
			WHEN d.patevyys_fi like 'ruotsin%' or d.patevyys_fi like '%toinen kotimainen kieli ruotsi%' THEN 'Andra inhemska språket svenska'
			WHEN d.patevyys_fi like '%kieli%' THEN 'Andra språk'
			WHEN d.patevyys_fi like '%kuvataide%' or d.patevyys_fi like '%käsityö%' THEN 'Bildkonst, slöjd'
			WHEN d.patevyys_fi like '%fysiikka%' or d.patevyys_fi like '%kemia%' or d.patevyys_fi like '%matematiikka%' THEN 'Fysik, kemi, matematik'
			WHEN d.patevyys_fi like '%historia%' or d.patevyys_fi like '%yhteiskuntaoppi%' THEN 'Historia, samhällslära'
			WHEN d.patevyys_fi like '%liikunta%' or d.patevyys_fi like '%terveystieto%' THEN 'Gymnastik, hälsokunskap'
			ELSE NULL
		END as aineryhma_2_sv,
		'*EN' as aineryhma_2_en,
		source = 'ETL: p_lataa_d_ainekelpoisuus'
	FROM ANTERO.sa.sa_virta_otp_ope_patevyydet pat
	LEFT JOIN ANTERO.dw.d_virta_patevyydet d on d.patevyys_koodi = pat.patevyyskoodi
	LEFT JOIN ANTERO.sa.sa_koodistot s on s.nimi = left(d.patevyys_fi, len(d.patevyys_fi) - charindex(',', reverse(d.patevyys_fi))) and s.koodisto = 'koskioppiaineetyleissivistava'
	WHERE d.patevyysryhma1_fi = 'opettajaaineet'

	) AS src
	ON target.aine_fi = src.aine_fi
WHEN MATCHED
	THEN
		UPDATE
		SET  aine_fi = src.aine_fi
			,aine_sv = src.aine_sv
			,aine_en = src.aine_en
			,aineryhma_1_fi = src.aineryhma_1_fi
			,aineryhma_1_sv = src.aineryhma_1_sv
			,aineryhma_1_en = src.aineryhma_1_en
			,aineryhma_2_fi = src.aineryhma_2_fi
			,aineryhma_2_sv = src.aineryhma_2_sv
			,aineryhma_2_en = src.aineryhma_2_en
			,target.source = src.source

WHEN NOT MATCHED
	THEN
		INSERT (
				aine_fi, aine_sv, aine_en, aineryhma_1_fi, aineryhma_1_sv, aineryhma_1_en, 
				aineryhma_2_fi, aineryhma_2_sv, aineryhma_2_en, source
				)
		VALUES (
				src.aine_fi, src.aine_sv, src.aine_en, src.aineryhma_1_fi, src.aineryhma_1_sv, src.aineryhma_1_en, 
				src.aineryhma_2_fi, src.aineryhma_2_sv, src.aineryhma_2_en, src.source
				);

DELETE FROM ANTERO.dw.d_ainekelpoisuus
WHERE aine_fi in ('Musiikkipedagogiikka', 'Teatteri- ja tanssipedagogiikka')

INSERT INTO ANTERO.dw.d_ainekelpoisuus
(aine_fi, aine_sv,aine_en,aineryhma_1_fi,aineryhma_1_sv,aineryhma_1_en,aineryhma_2_fi,aineryhma_2_sv,aineryhma_2_en, loadtime,username,source)
VALUES
('Musiikkipedagogiikka', 'Musikpedagogik', '*EN', 'Muut kuin perusopetuksen ja lukion opetettavat aineet', 'Andra ämnen än de som undervisas i grundläggande utbildning och gymnasieutbildning', '*EN', 'Musiikkipedagogiikka', 'Musikpedagogik', '*EN', getdate(), user_name(), 'ETL: p_lataa_d_ainekelpoisuus'),
('Teatteri- ja tanssipedagogiikka', 'Teater och danspedagogik', '*EN', 'Muut kuin perusopetuksen ja lukion opetettavat aineet', 'Andra ämnen än de som undervisas i grundläggande utbildning och gymnasieutbildning', '*EN', 'Teatteri- ja tanssipedagogiikka', 'Teateroch danspedagogik', '*EN', getdate(), user_name(), 'ETL: p_lataa_d_ainekelpoisuus')

UPDATE ANTERO.dw.d_ainekelpoisuus
SET aineryhma_2_sv = aine_sv
WHERE aineryhma_2_sv is null


GO

USE [ANTERO]