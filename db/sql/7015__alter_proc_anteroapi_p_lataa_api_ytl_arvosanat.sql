USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_ytl_arvosanat]    Script Date: 31.1.2023 12:16:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dw].[p_lataa_api_ytl_arvosanat] AS

DECLARE @pvm date

BEGIN
  EXEC [dw].[p_lataa_api_ytl_arvosanat_esilataus]
END

IF ((((	select count (*) from (
		select [opiskelija_koodi] ,[tutkintokerta_koodi] ,[tutkintokerta] ,[lukio_koodi] ,[lukio] ,[oppilaitostyyppi_koodi] ,[oppilaitostyyppi]
			  ,[opetuskieli_koodi] ,[opetuskieli] ,[sukupuoli_koodi] ,[sukupuoli] ,[koe_koodi] ,[koe] ,[arvosana_koodi] ,[arvosana] ,[arvosanapisteet] 
		from [dw].[api_ytl_arvosanat]
		except
		select [opiskelija_koodi] ,[tutkintokerta_koodi] ,[tutkintokerta] ,[lukio_koodi] ,[lukio] ,[oppilaitostyyppi_koodi] ,[oppilaitostyyppi]
			  ,[opetuskieli_koodi] ,[opetuskieli] ,[sukupuoli_koodi] ,[sukupuoli] ,[koe_koodi] ,[koe] ,[arvosana_koodi] ,[arvosana] ,[arvosanapisteet] 
		from [api].[ytl_arvosanat]) s ) > 0)
		or
		((select count(*) from [api].[ytl_arvosanat]) <> (select count(*) from [dw].[api_ytl_arvosanat])))
		and
		(select count(*) from [dw].[api_ytl_arvosanat]) > 0)

BEGIN
  
  SET @pvm = dbo.api_update_time(getdate())

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
	  ,[tietojoukko_paivitetty_pvm]
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
	  ,[tietojoukko_paivitetty_pvm] =	@pvm
  FROM [dw].[api_ytl_arvosanat]

END

IF (select count(*) from [dw].[api_ytl_arvosanat]) = 0

BEGIN

RAISERROR('Source table has no rows.',11,1)

END
 
GO

USE [ANTERO]