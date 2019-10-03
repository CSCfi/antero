IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'api.alayksikkokoodisto'))
EXEC dbo.sp_executesql @statement = N'create view api.alayksikkokoodisto as select 1 as a'
GO

ALTER VIEW api.alayksikkokoodisto
AS
SELECT
	d0.vuosi AS tilastovuosi,
	d0.korkeakoulu_koodi AS organisaatio_koodi,
	COALESCE(d1.organisaatio_fi, '') AS organisaatio_nimi_fi,
	COALESCE(d1.organisaatio_sv, '') AS organisaatio_nimi_sv,
	COALESCE(d1.organisaatio_en, '') AS organisaatio_nimi_en,
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
	d1.organisaatio_nykyinen_koodi AS organisaatio_nykyinen_koodi,
	COALESCE(d1.organisaatio_vanha_fi, '') AS organisaatio_vanha_nimi_fi,
	COALESCE(d1.organisaatio_vanha_sv, '') AS organisaatio_vanha_nimi_sv,
	COALESCE(d1.organisaatio_vanha_en, '') AS organisaatio_vanha_nimi_en,
	FORMAT(d1.alkupvm,'yyyy-MM-dd') as 'organisaation_alkupvm',
	FORMAT(d1.loppupvm,'yyyy-MM-dd') as 'organisaation_loppupvm',
	d0.loadtime as latauspvm,

    --oletusjärjestys sorttausta varten, 1000000000+ lajittelee alikyselyn tulokset
	ROW_NUMBER() OVER(ORDER BY d0.id ASC, d1.id ASC) as defaultorder

FROM dw.d_organisaation_alayksikot  d0
	LEFT JOIN dw.d_organisaatioluokitus d1 ON d0.korkeakoulu_koodi = d1.organisaatio_koodi
	LEFT JOIN dw.d_organisaatio d2 ON d0.korkeakoulu_koodi = d2.organisaatio_koodi
WHERE d0.id  != 0
