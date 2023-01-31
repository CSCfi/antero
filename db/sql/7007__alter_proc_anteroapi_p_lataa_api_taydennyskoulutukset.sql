USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_taydennyskoulutukset]    Script Date: 31.1.2023 12:10:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dw].[p_lataa_api_taydennyskoulutukset] AS

DECLARE @pvm date

BEGIN
  EXEC [dw].[p_lataa_api_taydennyskoulutukset_esilataus]
END

IF ((((	select count (*) from (
		select	[Tilastovuosi], [Yliopisto], [Sukupuoli], [koulutukset], [osallistuneet],
				[Koodit Yliopisto], [sukupuoli_jarjestys]
		from [dw].[api_taydennyskoulutukset] s
		except
		select	[Tilastovuosi], [Yliopisto], [Sukupuoli], [koulutukset], [osallistuneet],
				[Koodit Yliopisto], [sukupuoli_jarjestys]
		from [api].[taydennyskoulutukset]) s ) > 0)
		or
		((select count(*) from [api].[taydennyskoulutukset]) <> (select count(*) from [dw].[api_taydennyskoulutukset])))
		and
		(select count(*) from [dw].[api_taydennyskoulutukset]) > 0)

BEGIN

  SET @pvm = dbo.api_update_time(getdate())

  TRUNCATE TABLE [api].[taydennyskoulutukset]

  INSERT INTO [api].[taydennyskoulutukset] (
    [defaultorder]
    ,[Tilastovuosi]
    ,[Yliopisto]
    ,[Sukupuoli]
    ,[koulutukset]
    ,[osallistuneet]
    ,[Koodit Yliopisto]
    ,[sukupuoli_jarjestys]
	,[tietojoukko_paivitetty_pvm]
     )
  SELECT
    [defaultorder]
    ,[Tilastovuosi]
    ,[Yliopisto]
    ,[Sukupuoli]
    ,[koulutukset]
    ,[osallistuneet]
    ,[Koodit Yliopisto]
    ,[sukupuoli_jarjestys]
	,[tietojoukko_paivitetty_pvm] = @pvm
  FROM [dw].[api_taydennyskoulutukset]

END

IF ((select count(*) from [dw].[api_taydennyskoulutukset]) = 0)

BEGIN

RAISERROR('Source table has no rows.',11,1)

END

GO

USE [ANTERO]