USE [ANTERO]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_sa_virta_otp_opiskeluoikeudet]    Script Date: 13.11.2024 11:10:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER   PROCEDURE [sa].[p_lataa_sa_virta_otp_opiskeluoikeudet] AS

TRUNCATE TABLE [ANTERO].[sa].[sa_virta_otp_opiskeluoikeudet]

INSERT INTO [ANTERO].[sa].[sa_virta_otp_opiskeluoikeudet]
SELECT [Tilastovuosi]
      ,[Opiskeluoikeuksien lukumäärä]
      ,[Ensimmäinen korkeakoulu]
      ,[Viimeinen korkeakoulu]
      ,[Korkeakoulujen lukumäärä]
      ,[Yliopistoja]
      ,[AMKeja]
      ,[YO+AMK]
      ,[Useampi opiskeluoikeus samalta alalta]
      ,[Useampi opiskeluoikeus samasta yliopistosta]
      ,[Useampi opiskeluoikeus samasta AMKista]
      ,[Vuosia ensimmäisestä opiskeluoikeudesta]
      ,[Vuosia viimeisestä opiskeluoikeudesta]
      ,[Lkm]
      ,[1. op.oikeuden koulutuskoodi]
      ,[Viim. op.oikeuden koulutuskoodi]
	  ,[eka_op]
      ,[muut_op]
      ,[syntymavuosi]
      ,getdate() as loadtime
FROM [VirtaSiirto].[sa].[sa_virta_otp_opiskeluoikeudet]

GO


