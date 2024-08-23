USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_indikaattorit_kk_top_10_indeksi]    Script Date: 23.8.2024 8:02:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE OR ALTER  PROCEDURE [dw].[p_lataa_f_indikaattorit_kk_top_10_indeksi] as

DECLARE @alkuvuosi nvarchar(4)
DECLARE @sql nvarchar(max)
DECLARE @sql2 nvarchar(max)
DECLARE @sql3 nvarchar(max)
DECLARE @sql4 nvarchar(max)
DECLARE @n int
DECLARE @n3 int

SET @alkuVuosi = CAST(YEAR(GETDATE()) as nvarchar)


WHILE cast(@alkuVuosi as int) >= 2022

BEGIN

	SET @sql2 = 'SELECT @n2 = COUNT(*) FROM Bibliometriikka.INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = ''FactSuomi4Vuotta'' and TABLE_SCHEMA = CONCAT(''CAKuutio'',' + @alkuVuosi + ')'

	SET @sql4 = 'SELECT @n4 = COUNT(*) FROM Bibliometriikka.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = ''FactSuomi4Vuotta'' and TABLE_SCHEMA = CONCAT(''CAKuutio'',' + @alkuVuosi + ') and COLUMN_NAME = ''JulkaisutT10(Kaikki)'''

	EXECUTE sp_executesql @sql2, N'@n2 int OUTPUT', @n2=@n OUTPUT
	EXECUTE sp_executesql @sql4, N'@n4 int OUTPUT', @n4=@n3 OUTPUT

	IF @n > 0 

	BEGIN

		IF @n3 > 0

			SET @sql =

			'MERGE dw.f_indikaattorit_kk AS target

			USING (
				SELECT
					f.tilastovuosi,
					f.organisaatio_koodi,
					f.arvo,
					s.arvo_sektori,
					f.indikaattori,
					''ETL: p_lataa_f_indikaattorit_kk_top_10_indeksi'' as source,
					GETDATE() as loadtime,
					SUSER_NAME() as username
				FROM (
					SELECT 
						CAST(RIGHT(d2.Nelivuotisjakso,4) as int) as tilastovuosi,
						d3.organisaatio_nykyinen_koodi as organisaatio_koodi,
						SUM(f.[Top10(Kaikki)]) / SUM(f.[JulkaisutT10(Kaikki)]) as arvo,
						''top10'' as Indikaattori
					FROM [Bibliometriikka].[CAKuutio' + @alkuvuosi + '].[FactSuomi4Vuotta] f
					INNER JOIN [Bibliometriikka].[CAKuutio' + @alkuvuosi + '].[DimOrg] d1 on d1.Organisaationumero = f.Organisaationumero
					INNER JOIN [Bibliometriikka].[CAKuutio' + @alkuvuosi + '].[Dim4Vuosi] d2 ON f.vuosikoodi4 = d2.vuosikoodi4
					LEFT JOIN ANTERO.dw.d_organisaatioluokitus  d3 on d3.organisaatio_koodi = d1.Oppilaitostunnus
					WHERE CAST(RIGHT(d2.Nelivuotisjakso,4) as int) >= 2018 and d3.oppilaitostyyppi_koodi = ''42'' and d2.vuosikoodi4 < (' + @alkuvuosi + ' - 1994)
					GROUP BY CAST(RIGHT(d2.Nelivuotisjakso,4) as int), d3.organisaatio_nykyinen_koodi
					HAVING SUM(Julkaisut) >= 1000 AND (SUM([Sisäinen kattavuus]) / SUM(Julkaisut)) >= 0.4
				) f
				OUTER APPLY (
					SELECT 
						SUM(fb.[Top10(Kaikki)]) / SUM(fb.[JulkaisutT10(Kaikki)]) as arvo_sektori
					FROM [Bibliometriikka].[CAKuutio' + @alkuvuosi + '].[FactSuomi4Vuotta] fb
					INNER JOIN [Bibliometriikka].[CAKuutio' + @alkuvuosi + '].[DimOrg] d1b on d1b.Organisaationumero = fb.Organisaationumero
					INNER JOIN [Bibliometriikka].[CAKuutio' + @alkuvuosi + '].[Dim4Vuosi] d2b ON fb.vuosikoodi4 = d2b.vuosikoodi4
					LEFT JOIN ANTERO.dw.d_organisaatioluokitus  d3b on d3b.organisaatio_koodi = d1b.Oppilaitostunnus
					WHERE d3b.oppilaitostyyppi_koodi = ''42'' and d2b.vuosikoodi4 < (' + @alkuvuosi + ' - 1994) and
					CAST(RIGHT(d2b.Nelivuotisjakso,4) as int) = f.tilastovuosi
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
				);'

			ELSE

			SET @sql =

			'MERGE dw.f_indikaattorit_kk AS target

			USING (
				SELECT
					f.tilastovuosi,
					f.organisaatio_koodi,
					f.arvo,
					s.arvo_sektori,
					f.indikaattori,
					''ETL: p_lataa_f_indikaattorit_kk_top_10_indeksi'' as source,
					GETDATE() as loadtime,
					SUSER_NAME() as username
				FROM (
					SELECT 
						CAST(RIGHT(d2.Nelivuotisjakso,4) as int) as tilastovuosi,
						d3.organisaatio_nykyinen_koodi as organisaatio_koodi,
						SUM(f.[Top10]) / SUM(f.[JulkaisutT10]) as arvo,
						''top10'' as Indikaattori
					FROM [Bibliometriikka].[CAKuutio' + @alkuvuosi + '].[FactSuomi4Vuotta] f
					INNER JOIN [Bibliometriikka].[CAKuutio' + @alkuvuosi + '].[DimOrg] d1 on d1.Organisaationumero = f.Organisaationumero
					INNER JOIN [Bibliometriikka].[CAKuutio' + @alkuvuosi + '].[Dim4Vuosi] d2 ON f.vuosikoodi4 = d2.vuosikoodi4
					LEFT JOIN ANTERO.dw.d_organisaatioluokitus  d3 on d3.organisaatio_koodi = d1.Oppilaitostunnus
					WHERE CAST(RIGHT(d2.Nelivuotisjakso,4) as int) >= 2018 and d3.oppilaitostyyppi_koodi = ''42'' and d2.vuosikoodi4 < (' + @alkuvuosi + ' - 1994)
					GROUP BY CAST(RIGHT(d2.Nelivuotisjakso,4) as int), d3.organisaatio_nykyinen_koodi
					HAVING SUM(Julkaisut) >= 1000 AND (SUM([Sisäinen kattavuus]) / SUM(Julkaisut)) >= 0.4
				) f
				OUTER APPLY (
					SELECT 
						SUM(fb.[Top10]) / SUM(fb.[JulkaisutT10]) as arvo_sektori
					FROM [Bibliometriikka].[CAKuutio' + @alkuvuosi + '].[FactSuomi4Vuotta] fb
					INNER JOIN [Bibliometriikka].[CAKuutio' + @alkuvuosi + '].[DimOrg] d1b on d1b.Organisaationumero = fb.Organisaationumero
					INNER JOIN [Bibliometriikka].[CAKuutio' + @alkuvuosi + '].[Dim4Vuosi] d2b ON fb.vuosikoodi4 = d2b.vuosikoodi4
					LEFT JOIN ANTERO.dw.d_organisaatioluokitus  d3b on d3b.organisaatio_koodi = d1b.Oppilaitostunnus
					WHERE d3b.oppilaitostyyppi_koodi = ''42'' and d2b.vuosikoodi4 < (' + @alkuvuosi + ' - 1994) and
					CAST(RIGHT(d2b.Nelivuotisjakso,4) as int) = f.tilastovuosi
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
				);'

		EXEC (@sql)

		SET @alkuVuosi = cast(0 as nvarchar)

		END

		SET @alkuVuosi = cast(cast(@alkuVuosi as int) - 1 as nvarchar)

	END

EXEC [dw].[p_lataa_f_indikaattorit_kk_4v]

GO