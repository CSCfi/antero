USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_yamk_tutkinnot]    Script Date: 15.11.2021 14:17:30 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_api_yamk_tutkinnot]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_yamk_tutkinnot]    Script Date: 15.11.2021 14:17:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dw].[p_lataa_api_yamk_tutkinnot] AS

BEGIN
  EXEC dw.p_lataa_api_yamk_tutkinnot_esilataus
END

IF (select count(*) from dw.api_yamk_tutkinnot) > 0

BEGIN

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
  FROM [dw].[api_yamk_tutkinnot]

END

ELSE RAISERROR('Source table has no rows.',11,1)

GO


