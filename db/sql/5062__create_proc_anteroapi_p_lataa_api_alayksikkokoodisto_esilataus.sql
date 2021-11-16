USE [AnteroAPI]
GO


DROP PROCEDURE IF EXISTS [dw].[p_lataa_api_alayksikkokoodisto_esilataus]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dw].[p_lataa_api_alayksikkokoodisto_esilataus] AS

TRUNCATE TABLE [dw].[api_alayksikkokoodisto]

INSERT INTO [dw].[api_alayksikkokoodisto]

SELECT
	ROW_NUMBER() OVER(ORDER BY d0.id) as defaultorder,
	d0.vuosi AS tilastovuosi,
	d0.korkeakoulu_koodi AS organisaatio_koodi,
	COALESCE(s1.nimi, '') AS organisaatio_nimi_fi,
	COALESCE(s1.nimi_sv, '') AS organisaatio_nimi_sv,
	COALESCE(s1.nimi_en, '') AS organisaatio_nimi_en,
	CASE
		WHEN d0.paayksikko_koodi  = '-1'  THEN ''
		ELSE d0.paayksikko_koodi
	END AS paayksikko_koodi ,
	CASE
	  WHEN d0.alayksikko_koodi  = '-1'  THEN ''
	  ELSE d0.alayksikko_koodi
	END AS alayksikko_koodi ,
	d0.alayksikko_nimi AS alayksikko_nimi_fi,
	d0.alayksikko_nimi_sv AS alayksikko_nimi_sv,
	d0.alayksikko_nimi_en AS alayksikko_nimi_en,
	d2.oppilaitostyyppi_koodi,
    d2.oppilaitostyyppi_fi,
    d2.oppilaitostyyppi_sv,
    d2.oppilaitostyyppi_en,
	s1.koodi AS organisaatio_nykyinen_koodi,
	COALESCE(s1.nimi, '') AS organisaatio_vanha_nimi_fi,
	COALESCE(s1.nimi_sv, '') AS organisaatio_vanha_nimi_sv,
	COALESCE(s1.nimi_en, '') AS organisaatio_vanha_nimi_en,
	FORMAT(cast(s1.alkupvm as date),'yyyy-MM-dd') as 'organisaation_alkupvm',
	FORMAT(cast(s1.loppupvm as date),'yyyy-MM-dd') as 'organisaation_loppupvm',
	d0.loadtime as latauspvm
FROM ANTERO.dw.d_organisaation_alayksikot  d0
	LEFT JOIN Antero.sa.sa_organisaatioluokitus s1 ON d0.korkeakoulu_koodi = s1.koodi
	LEFT JOIN Antero.dw.d_organisaatio d2 ON d0.korkeakoulu_koodi = d2.organisaatio_koodi
WHERE d0.id  != 0




GO
