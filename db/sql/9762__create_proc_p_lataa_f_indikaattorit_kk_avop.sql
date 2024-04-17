USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_indikaattorit_kk_avop]    Script Date: 17.4.2024 12:14:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dw].[p_lataa_f_indikaattorit_kk_avop] as

MERGE dw.f_indikaattorit_kk AS target

USING (
	SELECT
		f.tilastovuosi,
		f.organisaatio_koodi,
		f.arvo,
		s.arvo_sektori,
		f.indikaattori,
		'ETL: p_lataa_f_indikaattorit_kk_avop' as source,
		GETDATE() as loadtime,
		SUSER_NAME() as username
	FROM (
		SELECT		
			f.tilastovuosi, 
			f.organisaatio_koodi, 
			CAST(COUNT(DISTINCT CASE WHEN f.ka >= 4 THEN f.vastaajaid ELSE NULL END) as float) / COUNT(DISTINCT f.vastaajaid) as arvo,
			'avop_yli_4' as indikaattori
		FROM (		
			SELECT	
				d4.vuosi as tilastovuosi, 
				d2.organisaatio_koodi, 
				f.vastaajaid, 
				AVG(cast(f.numerovalinta as float)) as ka
			FROM ANTERO.dw.f_arvo_avop f
			LEFT JOIN ANTERO.dw.d_arvokysymys d1 on d1.id = f.d_arvokysymys_id 
			LEFT JOIN dw.d_organisaatioluokitus d2 ON d2.id = f.d_organisaatio_oppilaitos_id
			LEFT JOIN dw.d_koulutusluokitus d3 ON f.d_koulutusluokitus_id = d3.id
			LEFT JOIN dw.d_arvokyselykerta d4 ON f.d_arvokyselykerta_id = d4.id
			WHERE d1.kysymysryhma_fi = 'Opiskelutyytyväisyys' and d2.organisaatio_koodi <> '02557' and d3.koulutusastetaso2_fi = 'Ammattikorkeakoulututkinto' and d4.vuosi < year(getdate())
			GROUP BY d4.vuosi, d2.organisaatio_koodi, f.vastaajaid	
		) f		
		GROUP BY f.tilastovuosi, f.organisaatio_koodi	
	) f
	OUTER APPLY (
		SELECT		 
			CAST(COUNT(DISTINCT CASE WHEN fb.ka >= 4 THEN fb.vastaajaid ELSE NULL END) as float) / COUNT(DISTINCT fb.vastaajaid) as arvo_sektori
		FROM (		
			SELECT	  
				fb.vastaajaid, 
				AVG(cast(fb.numerovalinta as float)) as ka
			FROM ANTERO.dw.f_arvo_avop fb
			LEFT JOIN ANTERO.dw.d_arvokysymys d1b on d1b.id = fb.d_arvokysymys_id 
			LEFT JOIN dw.d_organisaatioluokitus d2b ON d2b.id = fb.d_organisaatio_oppilaitos_id
			LEFT JOIN dw.d_koulutusluokitus d3b ON fb.d_koulutusluokitus_id = d3b.id
			LEFT JOIN dw.d_arvokyselykerta d4b ON fb.d_arvokyselykerta_id = d4b.id
			WHERE d1b.kysymysryhma_fi = 'Opiskelutyytyväisyys' and d3b.koulutusastetaso2_fi = 'Ammattikorkeakoulututkinto' and d4b.vuosi < year(getdate())
			and d4b.vuosi = f.tilastovuosi and d2b.organisaatio_koodi <> '02557'
			GROUP BY fb.vastaajaid
		) fb	
	) s
) AS src
ON target.tilastovuosi = src.tilastovuosi and target.organisaatio_koodi = src.organisaatio_koodi and target.indikaattori = src.indikaattori
WHEN MATCHED THEN
	UPDATE SET
		target.[arvo] = src.arvo,
		target.[arvo_sektori] = src.arvo_sektori,
		target.[source] = src.source,
		target.loadtime = GETDATE(),
		target.username = SUSER_NAME()
WHEN NOT MATCHED THEN
	INSERT (
		tilastovuosi,
		organisaatio_koodi,
		arvo,
		arvo_sektori,
		indikaattori,
		source,
		loadtime,
		username
	)
	VALUES (
		src.tilastovuosi,src. organisaatio_koodi, src.arvo, src.arvo_sektori, src.indikaattori, src.source,
		src.loadtime,
		src.username
	);

IF (SELECT cast(MAX(loadtime) as date) FROM ANTERO.dw.f_indikaattorit_kk WHERE source = 'ETL: p_lataa_f_indikaattorit_kk_avop') = cast(getdate() as date)
BEGIN
EXEC [dw].[p_lataa_f_indikaattorit_kk_4v]
END

GO

USE [ANTERO]
