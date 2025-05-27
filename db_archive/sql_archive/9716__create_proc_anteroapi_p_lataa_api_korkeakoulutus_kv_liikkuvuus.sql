USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_korkeakoulutus_kv_liikkuvuus]    Script Date: 22.3.2024 12:32:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [dw].[p_lataa_api_korkeakoulutus_kv_liikkuvuus] AS

DECLARE @pvm date

BEGIN
  EXEC [dw].[p_lataa_api_korkeakoulutus_kv_liikkuvuus_esilataus]
END

IF ((	select count (*) from (
		select [tilastovuosi],[sektori],[sukupuoli],[korkeakoulu],[koulutusnimike],[koulutusasteTaso1],[koulutusasteTaso2],
			   [koulutusalaTaso1],[koulutusalaTaso2],[koulutusalaTaso3],[okmOhjauksenAla],[liikkuvuudenSuunta],
			   [liikkuvuudenKesto],[liikkuvuusjaksotLkm],[kooditKorkeakoulu],[kooditKoulutusnimike]
		from [dw].[api_korkeakoulutus_kv_liikkuvuus]
		except
		select [tilastovuosi],[sektori],[sukupuoli],[korkeakoulu],[koulutusnimike],[koulutusasteTaso1],[koulutusasteTaso2],
			   [koulutusalaTaso1],[koulutusalaTaso2],[koulutusalaTaso3],[okmOhjauksenAla],[liikkuvuudenSuunta],
			   [liikkuvuudenKesto],[liikkuvuusjaksotLkm],[kooditKorkeakoulu],[kooditKoulutusnimike]
		from [api].[korkeakoulutus_kv_liikkuvuus]) s ) > 0)

BEGIN

  SET @pvm = dbo.api_update_time(getdate())
  
  TRUNCATE TABLE [api].[korkeakoulutus_kv_liikkuvuus]

  INSERT INTO [api].[korkeakoulutus_kv_liikkuvuus] (
       [defaultorder]
      ,[tilastovuosi]
      ,[sektori]
      ,[sukupuoli]
      ,[korkeakoulu]
      ,[koulutusnimike]
      ,[koulutusasteTaso1]
      ,[koulutusasteTaso2]
      ,[koulutusalaTaso1]
      ,[koulutusalaTaso2]
      ,[koulutusalaTaso3]
      ,[okmOhjauksenAla]
      ,[liikkuvuudenSuunta]
      ,[liikkuvuudenKesto]
      ,[liikkuvuusjaksotLkm]
      ,[kooditKorkeakoulu]
      ,[kooditKoulutusnimike]
	  ,[tietojoukkoPaivitettyPvm]
  )
  SELECT [defaultorder]
      ,[tilastovuosi]
      ,[sektori]
      ,[sukupuoli]
      ,[korkeakoulu]
      ,[koulutusnimike]
      ,[koulutusasteTaso1]
      ,[koulutusasteTaso2]
      ,[koulutusalaTaso1]
      ,[koulutusalaTaso2]
      ,[koulutusalaTaso3]
      ,[okmOhjauksenAla]
      ,[liikkuvuudenSuunta]
      ,[liikkuvuudenKesto]
      ,[liikkuvuusjaksotLkm]
      ,[kooditKorkeakoulu]
      ,[kooditKoulutusnimike]
	  ,[tietojoukkoPaivitettyPvm] = @pvm
  FROM [dw].[api_korkeakoulutus_kv_liikkuvuus]

END

 
GO

USE [ANTERO]