USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_alayksikkokoodisto]    Script Date: 31.1.2023 11:40:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dw].[p_lataa_api_alayksikkokoodisto] AS

DECLARE @pvm date

BEGIN
  EXEC [dw].[p_lataa_api_alayksikkokoodisto_esilataus]
END

IF ((((	select count (*) from (
		select [tilastovuosi], [organisaatio_koodi], [organisaatio_nimi_fi], [organisaatio_nimi_sv], [organisaatio_nimi_en], [paayksikko_koodi],
			   [alayksikko_koodi], [alayksikko_nimi_fi], [alayksikko_nimi_sv] ,[alayksikko_nimi_en], [oppilaitostyyppi_koodi], [oppilaitostyyppi_fi],
			   [oppilaitostyyppi_sv], [oppilaitostyyppi_en], [organisaatio_nykyinen_koodi], [organisaatio_vanha_nimi_fi], [organisaatio_vanha_nimi_sv],
			   [organisaatio_vanha_nimi_en], [organisaation_alkupvm], [organisaation_loppupvm]
		from [dw].[api_alayksikkokoodisto]
		except
		select [tilastovuosi], [organisaatio_koodi], [organisaatio_nimi_fi], [organisaatio_nimi_sv], [organisaatio_nimi_en], [paayksikko_koodi],
			   [alayksikko_koodi], [alayksikko_nimi_fi], [alayksikko_nimi_sv] ,[alayksikko_nimi_en], [oppilaitostyyppi_koodi], [oppilaitostyyppi_fi],
			   [oppilaitostyyppi_sv], [oppilaitostyyppi_en], [organisaatio_nykyinen_koodi], [organisaatio_vanha_nimi_fi], [organisaatio_vanha_nimi_sv],
			   [organisaatio_vanha_nimi_en], [organisaation_alkupvm], [organisaation_loppupvm]
		from [api].[alayksikkokoodisto]) s ) > 0)
		or
		((select count(*) from [api].[alayksikkokoodisto]) <> (select count(*) from [dw].[api_alayksikkokoodisto])))
		and
		(select count(*) from [dw].[api_alayksikkokoodisto]) > 0)

BEGIN

  SET @pvm = dbo.api_update_time(getdate())
	
  TRUNCATE TABLE [api].[alayksikkokoodisto]

  INSERT INTO [api].[alayksikkokoodisto] (
       [defaultorder]
      ,[tilastovuosi]
      ,[organisaatio_koodi]
      ,[organisaatio_nimi_fi]
      ,[organisaatio_nimi_sv]
      ,[organisaatio_nimi_en]
      ,[paayksikko_koodi]
      ,[alayksikko_koodi]
      ,[alayksikko_nimi_fi]
      ,[alayksikko_nimi_sv]
      ,[alayksikko_nimi_en]
      ,[oppilaitostyyppi_koodi]
      ,[oppilaitostyyppi_fi]
      ,[oppilaitostyyppi_sv]
      ,[oppilaitostyyppi_en]
      ,[organisaatio_nykyinen_koodi]
      ,[organisaatio_vanha_nimi_fi]
      ,[organisaatio_vanha_nimi_sv]
      ,[organisaatio_vanha_nimi_en]
      ,[organisaation_alkupvm]
      ,[organisaation_loppupvm]
      ,[latauspvm]
	  ,[tietojoukko_paivitetty_pvm])
  SELECT
	     [defaultorder]
      ,[tilastovuosi]
      ,[organisaatio_koodi]
      ,[organisaatio_nimi_fi]
      ,[organisaatio_nimi_sv]
      ,[organisaatio_nimi_en]
      ,[paayksikko_koodi]
      ,[alayksikko_koodi]
      ,[alayksikko_nimi_fi]
      ,[alayksikko_nimi_sv]
      ,[alayksikko_nimi_en]
      ,[oppilaitostyyppi_koodi]
      ,[oppilaitostyyppi_fi]
      ,[oppilaitostyyppi_sv]
      ,[oppilaitostyyppi_en]
      ,[organisaatio_nykyinen_koodi]
      ,[organisaatio_vanha_nimi_fi]
      ,[organisaatio_vanha_nimi_sv]
      ,[organisaatio_vanha_nimi_en]
      ,[organisaation_alkupvm]
      ,[organisaation_loppupvm]
      ,[latauspvm]
	  ,[tietojoukko_paivitetty_pvm] =	@pvm
  FROM [dw].[api_alayksikkokoodisto]


END

IF (select count(*) from [dw].[api_alayksikkokoodisto]) = 0

BEGIN

RAISERROR('Source table has no rows.',11,1)

END


GO

USE [ANTERO]