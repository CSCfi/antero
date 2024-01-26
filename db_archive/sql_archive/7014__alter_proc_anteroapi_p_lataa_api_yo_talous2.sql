USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_yo_talous2]    Script Date: 31.1.2023 12:16:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dw].[p_lataa_api_yo_talous2] AS

DECLARE @pvm date

BEGIN
  EXEC [dw].[p_lataa_api_yo_talous2_esilataus]
END

IF ((((	select count (*) from (
		select	[Tilastovuosi],[Konserni],[Yliopisto],[Koulutusala],[Aineisto],[Ohjauksenala],[Statistikår],[Universitet],[Utbildningsområde],
				[Material typ],[Ohjauksenala_sv],[Statistical year],[University],[Field of education],[Material type],[Ohjauksenala_en],[Koodit_yliopisto],
				[Koodit_koulutusala],[Koodit_aineisto],[Koodit_ohjauksenala],[tili_taso0_fi],[tili_taso1_fi],[tili_taso2_fi],[tili_taso3_fi],[tili_taso4_fi],
				[tili_taso5_fi],[tili_taso0_sv],[tili_taso1_sv],[tili_taso2_sv],[tili_taso3_sv],[tili_taso4_sv],[tili_taso5_sv],[tili_taso0_en],
				[tili_taso1_en],[tili_taso2_en],[tili_taso3_en],[tili_taso4_en],[tili_taso5_en],[toiminto_nimi_fi],[arvo]
		from [dw].[api_yo_talous2] s
		except
		select	[Tilastovuosi],[Konserni],[Yliopisto],[Koulutusala],[Aineisto],[Ohjauksenala],[Statistikår],[Universitet],[Utbildningsområde],
				[Material typ],[Ohjauksenala_sv],[Statistical year],[University],[Field of education],[Material type],[Ohjauksenala_en],[Koodit_yliopisto],
				[Koodit_koulutusala],[Koodit_aineisto],[Koodit_ohjauksenala],[tili_taso0_fi],[tili_taso1_fi],[tili_taso2_fi],[tili_taso3_fi],[tili_taso4_fi],
				[tili_taso5_fi],[tili_taso0_sv],[tili_taso1_sv],[tili_taso2_sv],[tili_taso3_sv],[tili_taso4_sv],[tili_taso5_sv],[tili_taso0_en],
				[tili_taso1_en],[tili_taso2_en],[tili_taso3_en],[tili_taso4_en],[tili_taso5_en],[toiminto_nimi_fi],[arvo]
		from [api].[yo_talous2]) s ) > 0)
		or
		((select count(*) from [api].[yo_talous2]) <> (select count(*) from [dw].[api_yo_talous2])))
		and
		(select count(*) from [dw].[api_yo_talous2]) > 0)

BEGIN

  SET @pvm = dbo.api_update_time(getdate())
	  
  TRUNCATE TABLE [api].[yo_talous2]

  INSERT INTO [api].[yo_talous2] (
     [defaultorder]
     ,[Tilastovuosi]
     ,[Konserni]
     ,[Yliopisto]
     ,[Koulutusala]
     ,[Aineisto]
     ,[Ohjauksenala]
     ,[Statistikår]
     ,[Universitet]
     ,[Utbildningsområde]
     ,[Material typ]
     ,[Ohjauksenala_sv]
     ,[Statistical year]
     ,[University]
     ,[Field of education]
     ,[Material type]
     ,[Ohjauksenala_en]
     ,[Koodit_yliopisto]
     ,[Koodit_koulutusala]
     ,[Koodit_aineisto]
     ,[Koodit_ohjauksenala]
     ,[tili_taso0_fi]
     ,[tili_taso1_fi]
     ,[tili_taso2_fi]
     ,[tili_taso3_fi]
     ,[tili_taso4_fi]
     ,[tili_taso5_fi]
     ,[tili_taso0_sv]
     ,[tili_taso1_sv]
     ,[tili_taso2_sv]
     ,[tili_taso3_sv]
     ,[tili_taso4_sv]
     ,[tili_taso5_sv]
     ,[tili_taso0_en]
     ,[tili_taso1_en]
     ,[tili_taso2_en]
     ,[tili_taso3_en]
     ,[tili_taso4_en]
     ,[tili_taso5_en]
     ,[toiminto_nimi_fi]
     ,[arvo]
	 ,[tietojoukko_paivitetty_pvm])

 SELECT
   [defaultorder]
   ,[Tilastovuosi]
   ,[Konserni]
   ,[Yliopisto]
   ,[Koulutusala]
   ,[Aineisto]
   ,[Ohjauksenala]
   ,[Statistikår]
   ,[Universitet]
   ,[Utbildningsområde]
   ,[Material typ]
   ,[Ohjauksenala_sv]
   ,[Statistical year]
   ,[University]
   ,[Field of education]
   ,[Material type]
   ,[Ohjauksenala_en]
   ,[Koodit_yliopisto]
   ,[Koodit_koulutusala]
   ,[Koodit_aineisto]
   ,[Koodit_ohjauksenala]
   ,[tili_taso0_fi]
   ,[tili_taso1_fi]
   ,[tili_taso2_fi]
   ,[tili_taso3_fi]
   ,[tili_taso4_fi]
   ,[tili_taso5_fi]
   ,[tili_taso0_sv]
   ,[tili_taso1_sv]
   ,[tili_taso2_sv]
   ,[tili_taso3_sv]
   ,[tili_taso4_sv]
   ,[tili_taso5_sv]
   ,[tili_taso0_en]
   ,[tili_taso1_en]
   ,[tili_taso2_en]
   ,[tili_taso3_en]
   ,[tili_taso4_en]
   ,[tili_taso5_en]
   ,[toiminto_nimi_fi]
   ,[arvo]
   ,[tietojoukko_paivitetty_pvm] = @pvm
  FROM [dw].[api_yo_talous2]


END

IF ((select count(*) from [dw].[api_yo_talous2]) = 0)

BEGIN

RAISERROR('Source table has no rows.',11,1)

END

GO

USE [ANTERO]