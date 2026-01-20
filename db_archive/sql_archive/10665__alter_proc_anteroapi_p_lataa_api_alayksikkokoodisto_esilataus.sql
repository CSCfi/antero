USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_alayksikkokoodisto_esilataus]    Script Date: 10.3.2025 10.19.56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_api_alayksikkokoodisto_esilataus] AS

TRUNCATE TABLE [dw].[api_alayksikkokoodisto]

INSERT INTO [dw].[api_alayksikkokoodisto]

SELECT
	ROW_NUMBER() OVER(ORDER BY d0.id) as defaultorder,
	d0.vuosi AS tilastovuosi,
	d0.korkeakoulu_koodi AS organisaatio_koodi,
	COALESCE(d2.organisaatio_fi, '') AS organisaatio_nimi_fi,
	COALESCE(d2.organisaatio_sv, '') AS organisaatio_nimi_sv,
	COALESCE(d2.organisaatio_en, '') AS organisaatio_nimi_en,
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
	d2.organisaatio_nykyinen_koodi AS organisaatio_nykyinen_koodi,
	COALESCE(d2.organisaatio_vanha_fi, '') AS organisaatio_vanha_nimi_fi,
	COALESCE(d2.organisaatio_vanha_sv, '') AS organisaatio_vanha_nimi_sv,
	COALESCE(d2.organisaatio_vanha_en, '') AS organisaatio_vanha_nimi_en,
	FORMAT(cast(d2.alkupvm as date),'yyyy-MM-dd') as 'organisaation_alkupvm',
	FORMAT(cast(d2.loppupvm as date),'yyyy-MM-dd') as 'organisaation_loppupvm',
	d0.loadtime as latauspvm,
	d0.tiedejatutkimusfi_nakyvyyden_rajaus as tiedejatutkimusfi_nakyvyyden_rajaus
FROM ANTERO.dw.d_organisaation_alayksikot  d0
LEFT JOIN Antero.dw.d_organisaatioluokitus d2 ON d0.korkeakoulu_koodi = d2.organisaatio_koodi

GO

USE [ANTERO]