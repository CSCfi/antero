USE [AnteroAPI]
GO

DROP PROCEDURE IF EXISTS [dw].[p_lataa_api_alayksikkokoodisto]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dw].[p_lataa_api_alayksikkokoodisto] AS

BEGIN
  EXEC [dw].[p_lataa_api_alayksikkokoodisto_esilataus]
END

IF (select count(*) from [dw].[api_alayksikkokoodisto]) > 0

BEGIN
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
      ,[latauspvm])

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

  FROM [dw].[api_alayksikkokoodisto]


END

ELSE RAISERROR('Source table has no rows.',11,1)

GO

USE [ANTERO]
