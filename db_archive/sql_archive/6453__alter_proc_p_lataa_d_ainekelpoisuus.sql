USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_ainekelpoisuus]    Script Date: 21.9.2022 14:43:10 ******/
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
		left(d.patevyys_fi, len(d.patevyys_fi) - charindex(',', reverse(d.patevyys_fi))) as aine_fi,
		'*SV' as aine_sv,
		'*EN' as aine_en,
		CASE 
			WHEN d.patevyys_fi like '%kieli%' THEN 'Kielet'
			WHEN d.patevyys_fi like '%Kasvatustieteet%' or d.patevyys_fi like '%Liiketalous ja kauppa%' THEN 'Muut kuin perusopetuksen ja lukion opetettavat aineet'
			ELSE 'Muut aineet'
		END  as aineryhma_1_fi,
		'*SV' as aineryhma_1_sv,
		'*EN' as aineryhma_1_en,
		CASE 
			WHEN d.patevyys_fi like '%biologia%' or d.patevyys_fi like '%maantiede%' THEN 'Biologia, maantiede'
			WHEN d.patevyys_fi like '%elämänkatsomustieto%' or d.patevyys_fi like '%uskonto%' or d.patevyys_fi like '%filosofia%' or d.patevyys_fi like '%teologia%' THEN 'Elämänkatsomus, uskonto, filosofia'
			WHEN d.patevyys_fi like '%äidinkieli%' THEN 'Äidinkieli ja kirjallisuus'
			WHEN d.patevyys_fi like '%englan%' THEN 'Englannin kieli'
			WHEN d.patevyys_fi like 'suomen%' or d.patevyys_fi like '%toinen kotimainen kieli suomi%' THEN 'Suomen kieli'
			WHEN d.patevyys_fi like 'ruotsin%' or d.patevyys_fi like '%toinen kotimainen kieli ruotsi%' THEN 'Ruotsin kieli'
			WHEN d.patevyys_fi like '%kieli%' THEN 'Muut kielet'
			WHEN d.patevyys_fi like '%kuvataide%' or d.patevyys_fi like '%käsityö%' THEN 'Kuvataide, käsityö'
			WHEN d.patevyys_fi like '%fysiikka%' or d.patevyys_fi like '%kemia%' or d.patevyys_fi like '%matematiikka%' THEN 'Fysikka, kemia, matematiikka'
			WHEN d.patevyys_fi like '%historia%' or d.patevyys_fi like '%yhteiskuntaoppi%' THEN 'Historia, yhteiskuntaoppi'
			WHEN d.patevyys_fi like '%liikunta%' or d.patevyys_fi like '%terveystieto%' THEN 'Liikunta, terveystieto'
			ELSE left(d.patevyys_fi, len(d.patevyys_fi) - charindex(',', reverse(d.patevyys_fi)))
		END as aineryhma_2_fi,
		'*SV' as aineryhma_2_sv,
		'*EN' as aineryhma_2_en,
		source = 'ETL: p_lataa_d_ainekelpoisuus'
	FROM ANTERO.sa.sa_virta_otp_ope_patevyydet pat
	LEFT JOIN ANTERO.dw.d_virta_patevyydet d on d.patevyys_koodi = pat.patevyyskoodi
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
('Musiikkipedagogiikka', '*SV', '*EN', 'Muut kuin perusopetuksen ja lukion opetettavat aineet', '*SV', '*EN', 'Musiikkipedagogiikka', '*SV', '*EN', getdate(), user_name(), 'ETL: p_lataa_d_ainekelpoisuus'),
('Teatteri- ja tanssipedagogiikka', '*SV', '*EN', 'Muut kuin perusopetuksen ja lukion opetettavat aineet', '*SV', '*EN', 'Teatteri- ja tanssipedagogiikka', '*SV', '*EN', getdate(), user_name(), 'ETL: p_lataa_d_ainekelpoisuus')



GO

USE [ANTERO]