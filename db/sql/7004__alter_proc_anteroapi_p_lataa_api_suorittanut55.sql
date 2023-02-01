USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_suorittanut55]    Script Date: 31.1.2023 12:07:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_api_suorittanut55] AS

DECLARE @pvm date

BEGIN
  EXEC dw.p_lataa_api_suorittanut55_esilataus
END

IF ((((	select count (*) from (
		select	[oppilaitos_koodi],[oppilaitos],[okm_ohjauksen_ala_koodi],[okm_ohjauksen_ala],[koulutusaste(taso2)_koodi],[koulutusaste(taso2)],
				[koulutusala(taso1)_koodi],[koulutusala(taso1)],[koulutusala(taso2)_koodi],[koulutusala(taso2)],[koulutusala(taso3)_koodi],
				[koulutusala(taso3)],[koulutus_koodi],[koulutusnimike],[vuosi],[suorittanut_55],[suorittanut_55ilman_pankkia],[suorittanut_55pankin_avulla],
				[suorittanut_27]
		from [dw].[api_suorittanut55] s
		except
		select	[oppilaitos_koodi],[oppilaitos],[okm_ohjauksen_ala_koodi],[okm_ohjauksen_ala],[koulutusaste(taso2)_koodi],[koulutusaste(taso2)],
				[koulutusala(taso1)_koodi],[koulutusala(taso1)],[koulutusala(taso2)_koodi],[koulutusala(taso2)],[koulutusala(taso3)_koodi],
				[koulutusala(taso3)],[koulutus_koodi],[koulutusnimike],[vuosi],[suorittanut_55],[suorittanut_55ilman_pankkia],[suorittanut_55pankin_avulla],
				[suorittanut_27]
		from [api].[suorittanut55]) s ) > 0)
		or
		((select count(*) from [api].[suorittanut55]) <> (select count(*) from [dw].[api_suorittanut55])))
		and
		(select count(*) from [dw].[api_suorittanut55]) > 0)

BEGIN

  SET @pvm = dbo.api_update_time(getdate())

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
	  ,[tietojoukko_paivitetty_pvm]
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
	  ,[tietojoukko_paivitetty_pvm] =	@pvm
  FROM [dw].[api_suorittanut55]

END

IF ((select count(*) from [dw].[api_suorittanut55]) = 0)

BEGIN

RAISERROR('Source table has no rows.',11,1)

END

GO

USE [ANTERO]