USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_yamk_tutkinnot]    Script Date: 31.1.2023 12:12:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_api_yamk_tutkinnot] AS

DECLARE @pvm date

BEGIN
  EXEC dw.p_lataa_api_yamk_tutkinnot_esilataus
END

IF ((((	select count (*) from (
		select	[Tutkinnon suorittamisvuosi],[Suorituskuukausi],[Koodit korkeakoulu],[Korkeakoulu],[Tutkintokoodi],[Tutkinto],[Tutkinnon laajuus op],
				[Rahoituslahde],[Tutkinnot lkm],[Koulutusaste taso 1],[Koulutusaste taso 2],[Koulutusala taso 1],[Koulutusala taso 2],[Koulutusala taso 3],
				[OKM ohjauksen ala],[Rahoitusmallialat amk 2021-2024]
		from [dw].[api_yamk_tutkinnot] s
		except
		select	[Tutkinnon suorittamisvuosi],[Suorituskuukausi],[Koodit korkeakoulu],[Korkeakoulu],[Tutkintokoodi],[Tutkinto],[Tutkinnon laajuus op],
				[Rahoituslahde],[Tutkinnot lkm],[Koulutusaste taso 1],[Koulutusaste taso 2],[Koulutusala taso 1],[Koulutusala taso 2],[Koulutusala taso 3],
				[OKM ohjauksen ala],[Rahoitusmallialat amk 2021-2024]
		from [api].[yamk_tutkinnot]) s ) > 0)
		or
		((select count(*) from [api].[yamk_tutkinnot]) <> (select count(*) from [dw].[api_yamk_tutkinnot])))
		and
		(select count(*) from [dw].[api_yamk_tutkinnot]) > 0)

BEGIN

  SET @pvm = dbo.api_update_time(getdate())

  TRUNCATE TABLE [api].[yamk_tutkinnot]

  INSERT INTO [api].[yamk_tutkinnot] (
    [Tutkinnon suorittamisvuosi]
	,[Suorituskuukausi]
	,[Koodit korkeakoulu]
	,[Korkeakoulu]
	,[Tutkintokoodi]
	,[Tutkinto]
	,[Tutkinnon laajuus op]
	--,[Koulutuskieli]
	--,[Koulutuskunta]
	,[Rahoituslahde]
	,[Tutkinnot lkm]
	,[Koulutusaste taso 1]
	,[Koulutusaste taso 2]
	,[Koulutusala taso 1]
	,[Koulutusala taso 2]
	,[Koulutusala taso 3]
	,[OKM ohjauksen ala]
	,[Rahoitusmallialat amk 2021-2024]
	,[tietojoukko_paivitetty_pvm]
  )
  SELECT [Tutkinnon suorittamisvuosi]
	,[Suorituskuukausi]
	,[Koodit korkeakoulu]
	,[Korkeakoulu]
	,[Tutkintokoodi]
	,[Tutkinto]
	,[Tutkinnon laajuus op]
	--,[Koulutuskieli]
	--,[Koulutuskunta]
	,[Rahoituslahde]
	,[Tutkinnot lkm]
	,[Koulutusaste taso 1]
	,[Koulutusaste taso 2]
	,[Koulutusala taso 1]
	,[Koulutusala taso 2]
	,[Koulutusala taso 3]
	,[OKM ohjauksen ala]
	,[Rahoitusmallialat amk 2021-2024]
	,[tietojoukko_paivitetty_pvm] =	@pvm
  FROM [dw].[api_yamk_tutkinnot]

END

IF ((select count(*) from [dw].[api_yamk_tutkinnot]) = 0)

BEGIN

RAISERROR('Source table has no rows.',11,1)

END

GO

USE [ANTERO]