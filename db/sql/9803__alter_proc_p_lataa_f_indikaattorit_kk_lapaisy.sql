USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_indikaattorit_kk_lapaisy]    Script Date: 24.4.2024 14:42:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER   PROCEDURE [dw].[p_lataa_f_indikaattorit_kk_lapaisy] as

MERGE dw.f_indikaattorit_kk AS target

USING (
	SELECT
		f.tilastovuosi,
		f.organisaatio_koodi,
		f.arvo,
		0 as arvo_sektori,
		f.indikaattori,
		'ETL: p_lataa_f_indikaattorit_kk_lapaisy' as source
	FROM (
		SELECT 
			CASE 
				WHEN d2.tarkastelujakso_koodi = '5' THEN CAST(RIGHT(d1.lukuvuosi,4) as int) + 5
				ELSE CAST(RIGHT(d1.lukuvuosi,4) as int) + 7
			END as tilastovuosi,
			COALESCE(d6.oppilaitoksen_korvaavakoodi,d6.oppilaitoskoodi) as organisaatio_koodi,
			d7.oppilaitostyyppi_koodi,
			CAST(SUM(CASE WHEN f.[1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto] = 'Tutkinto alkuperäisessä tutkintolajissa' THEN f.lkm_int ELSE 0 END) as float) / CAST(SUM(f.lkm_int) as float) as arvo,
			CASE 
				WHEN d2.tarkastelujakso_koodi = '5' THEN '5_v_lapaisy'
				ELSE '7_v_lapaisy'
			END as indikaattori
		FROM  VipunenTK.dbo.f_aloittaneiden_lapaisy f 
		LEFT JOIN VipunenTK.dbo.d_kausi AS d1 ON d1.kausi_id = f.aloituskausikoodi 
		LEFT JOIN VipunenTK.dbo.d_tarkastelujakso AS d2 ON d2.id = f.tarkastelujakso_id 
		LEFT JOIN VipunenTK.dbo.d_koulutuslaji2 AS d3 ON d3.id = f.koulutuslaji2_id 
		LEFT JOIN VipunenTK.dbo.d_koulutusluokitus AS d4 ON d4.id = f.koulk_id 
		LEFT JOIN VipunenTK.dbo.d_lahde AS d5 ON d5.id = f.lahde_id 
		LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot AS d6 ON d6.id = f.oppilaitoksen_taustatiedot_id 
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d7 on d7.organisaatio_koodi = COALESCE(d6.oppilaitoksen_korvaavakoodi,d6.oppilaitoskoodi)
		WHERE aineistokoodi = 'K3.10' AND d3.koulutuslaji2_koodi <> '52' 
		AND ((CAST(RIGHT(d1.lukuvuosi,4) as int) + 5 >= 2018 and d5.lahde_koodi = '41' AND d2.tarkastelujakso_koodi = '5' AND (d4.koulutusaste2002_koodi='62' or d4.Koulutusaste_taso2_koodi = '62'))
		OR (CAST(RIGHT(d1.lukuvuosi,4) as int) + 7 >= 2018 and d5.lahde_koodi ='51' AND d2.tarkastelujakso_koodi = '7' AND ((d4.koulutusaste2002_koodi = '63' or d4.Koulutusaste_taso2_koodi = '63') OR d4.koulutus_koodi in ('772101', '772201'))))
		AND [1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto] <> 'Virhetilanne'
		AND d7.oppilaitostyyppi_koodi in ('41','42') and d7.organisaatio_koodi not in ('01710','01723','02557')
		GROUP BY d2.tarkastelujakso_koodi, COALESCE(d6.oppilaitoksen_korvaavakoodi,d6.oppilaitoskoodi), CASE WHEN d2.tarkastelujakso_koodi = '5' THEN CAST(RIGHT(d1.lukuvuosi,4) as int) + 5 ELSE CAST(RIGHT(d1.lukuvuosi,4) as int) + 7 END, d7.oppilaitostyyppi_koodi
	) f
	
) AS src
ON target.tilastovuosi = src.tilastovuosi and target.organisaatio_koodi = src.organisaatio_koodi and target.indikaattori = src.indikaattori
WHEN MATCHED AND target.arvo <> src.arvo THEN
	UPDATE SET
		target.[arvo] = src.arvo,
		target.[arvo_sektori] = src.arvo_sektori,
		target.[source] = src.source
WHEN NOT MATCHED THEN
	INSERT (
		tilastovuosi,
		organisaatio_koodi,
		arvo,
		arvo_sektori,
		indikaattori,
		source
	)
	VALUES (
		src.tilastovuosi,src. organisaatio_koodi, src.arvo, src.arvo_sektori, src.indikaattori, src.source
	);

MERGE dw.f_indikaattorit_kk AS target

USING (
	SELECT
		f.tilastovuosi,
		f.arvo_sektori,
		f.indikaattori,
		GETDATE() as loadtime,
		SUSER_NAME() as username
	FROM (
		SELECT 
			CASE 
				WHEN d2.tarkastelujakso_koodi = '5' THEN CAST(RIGHT(d1.lukuvuosi,4) as int) + 5
				ELSE CAST(RIGHT(d1.lukuvuosi,4) as int) + 7
			END as tilastovuosi,
			CASE 
				WHEN d2.tarkastelujakso_koodi = '5' THEN '5_v_lapaisy'
				ELSE '7_v_lapaisy'
			END as indikaattori,
			CAST(SUM(CASE WHEN f.[1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto] = 'Tutkinto alkuperäisessä tutkintolajissa' THEN f.lkm_int ELSE 0 END) as float) / CAST(SUM(f.lkm_int) as float) as arvo_sektori
		FROM  VipunenTK.dbo.f_aloittaneiden_lapaisy f 
		LEFT JOIN VipunenTK.dbo.d_kausi AS d1 ON d1.kausi_id = f.aloituskausikoodi 
		LEFT JOIN VipunenTK.dbo.d_tarkastelujakso AS d2 ON d2.id = f.tarkastelujakso_id 
		LEFT JOIN VipunenTK.dbo.d_koulutuslaji2 AS d3 ON d3.id = f.koulutuslaji2_id 
		LEFT JOIN VipunenTK.dbo.d_koulutusluokitus AS d4 ON d4.id = f.koulk_id 
		LEFT JOIN VipunenTK.dbo.d_lahde AS d5 ON d5.id = f.lahde_id 
		LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot AS d6 ON d6.id = f.oppilaitoksen_taustatiedot_id 
		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d7 on d7.organisaatio_koodi = COALESCE(d6.oppilaitoksen_korvaavakoodi,d6.oppilaitoskoodi)
		WHERE aineistokoodi = 'K3.10' AND d3.koulutuslaji2_koodi <> '52' 
		AND ((CAST(RIGHT(d1.lukuvuosi,4) as int) + 5 >= 2018 and d5.lahde_koodi = '41' AND d2.tarkastelujakso_koodi = '5' AND (d4.koulutusaste2002_koodi='62' or d4.Koulutusaste_taso2_koodi = '62'))
		OR (CAST(RIGHT(d1.lukuvuosi,4) as int) + 7 >= 2018 and d5.lahde_koodi ='51' AND d2.tarkastelujakso_koodi = '7' AND ((d4.koulutusaste2002_koodi = '63' or d4.Koulutusaste_taso2_koodi = '63') OR d4.koulutus_koodi in ('772101', '772201'))))
		AND [1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto] <> 'Virhetilanne'
		AND d7.oppilaitostyyppi_koodi in ('41','42') and d7.organisaatio_koodi not in ('01710','01723','02557')
		GROUP BY d2.tarkastelujakso_koodi, CASE WHEN d2.tarkastelujakso_koodi = '5' THEN CAST(RIGHT(d1.lukuvuosi,4) as int) + 5 ELSE CAST(RIGHT(d1.lukuvuosi,4) as int) + 7 END
	) f
	
) AS src
ON target.tilastovuosi = src.tilastovuosi and target.indikaattori = src.indikaattori
WHEN MATCHED AND target.arvo_sektori <> src.arvo_sektori THEN
	UPDATE SET
		target.[arvo_sektori] = src.arvo_sektori,
		target.loadtime = GETDATE(),
		target.username = SUSER_NAME()
WHEN NOT MATCHED THEN
	INSERT (
		arvo_sektori,
		loadtime,
		username
	)
	VALUES (
		src.arvo_sektori, src.loadtime, src.username
	);

IF (SELECT cast(MAX(loadtime) as date) FROM ANTERO.dw.f_indikaattorit_kk WHERE source = 'ETL: p_lataa_f_indikaattorit_kk_lapaisy') = cast(getdate() as date)
BEGIN
EXEC [dw].[p_lataa_f_indikaattorit_kk_4v]
END
	
GO

USE [ANTERO]
