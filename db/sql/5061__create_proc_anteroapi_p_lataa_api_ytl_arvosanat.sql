USE [AnteroAPI]
GO

DROP PROCEDURE IF EXISTS [dw].[p_lataa_api_ytl_arvosanat]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dw].[p_lataa_api_ytl_arvosanat] AS

BEGIN
  EXEC [dw].[p_lataa_api_ytl_arvosanat_esilataus]
END

IF (select count(*) from [dw].[api_ytl_arvosanat]) > 0

BEGIN
  
  TRUNCATE TABLE [api].[ytl_arvosanat]

  INSERT INTO [api].[ytl_arvosanat] (
       [defaultorder]
      ,[opiskelija_koodi]
      ,[tutkintokerta_koodi]
      ,[tutkintokerta]
      ,[lukio_koodi]
      ,[lukio]
      ,[oppilaitostyyppi_koodi]
      ,[oppilaitostyyppi]
      ,[opetuskieli_koodi]
      ,[opetuskieli]
      ,[sukupuoli_koodi]
      ,[sukupuoli]
      ,[koe_koodi]
      ,[koe]
      ,[arvosana_koodi]
      ,[arvosana]
      ,[arvosanapisteet]
  )
  SELECT [defaultorder]
      ,[opiskelija_koodi]
      ,[tutkintokerta_koodi]
      ,[tutkintokerta]
      ,[lukio_koodi]
      ,[lukio]
      ,[oppilaitostyyppi_koodi]
      ,[oppilaitostyyppi]
      ,[opetuskieli_koodi]
      ,[opetuskieli]
      ,[sukupuoli_koodi]
      ,[sukupuoli]
      ,[koe_koodi]
      ,[koe]
      ,[arvosana_koodi]
      ,[arvosana]
      ,[arvosanapisteet]
  FROM [ANTERO].[dw].[api_ytl_arvosanat]

END

ELSE RAISERROR('Source table has no rows.',11,1)
 
GO

USE [ANTERO]


