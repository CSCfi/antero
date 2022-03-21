USE [AnteroAPI]
GO

DROP PROCEDURE IF EXISTS [dw].[p_lataa_api_suorittanut55]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dw].[p_lataa_api_suorittanut55] AS

BEGIN
  EXEC dw.p_lataa_api_suorittanut55_esilataus
END

IF (select count(*) from dw.api_suorittanut55) > 0

BEGIN

  TRUNCATE TABLE [api].[suorittanut55]

  INSERT INTO [api].[suorittanut55] (
	  [defaultorder]
      ,[oppilaitos_koodi]
      ,[oppilaitos]
      ,[okm_ohjauksen_ala_koodi]
      ,[okm_ohjauksen_ala]
      ,[koulutusaste(taso2)_koodi]
      ,[koulutusaste(taso2)]
      ,[koulutusala(taso1)_koodi]
      ,[koulutusala(taso1)]
      ,[koulutusala(taso2)_koodi]
      ,[koulutusala(taso2)]
      ,[koulutusala(taso3)_koodi]
      ,[koulutusala(taso3)]
      ,[koulutus_koodi]
      ,[koulutusnimike]
      ,[vuosi]
      ,[suorittanut_55]
      ,[suorittanut_55ilman_pankkia]
      ,[suorittanut_55pankin_avulla]
      ,[suorittanut_27]
  )
  SELECT [defaultorder]
      ,[oppilaitos_koodi]
      ,[oppilaitos]
      ,[okm_ohjauksen_ala_koodi]
      ,[okm_ohjauksen_ala]
      ,[koulutusaste(taso2)_koodi]
      ,[koulutusaste(taso2)]
      ,[koulutusala(taso1)_koodi]
      ,[koulutusala(taso1)]
      ,[koulutusala(taso2)_koodi]
      ,[koulutusala(taso2)]
      ,[koulutusala(taso3)_koodi]
      ,[koulutusala(taso3)]
      ,[koulutus_koodi]
      ,[koulutusnimike]
      ,[vuosi]
      ,[suorittanut_55]
      ,[suorittanut_55ilman_pankkia]
      ,[suorittanut_55pankin_avulla]
      ,[suorittanut_27]
  FROM [dw].[api_suorittanut55]

END

ELSE RAISERROR('Source table has no rows.',11,1)

GO
	
USE [ANTERO]