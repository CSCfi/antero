USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_amk_opintopisteet]    Script Date: 13.3.2024 15:28:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [sa].[p_lataa_sa_virta_otp_opiskeluoikeudet] AS

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
      ,[1. op.oikeuden koulutusluokitus]
      ,[Viim. op.oikeuden koulutusluokitus]
      ,[1. op.oikeuden okmohjauksenala]
      ,[Viim. op.oikeuden okmohjauksenala]
      ,[1. op.oikeuden koulutusastetaso1]
      ,[Viim. op.oikeuden koulutusastetaso1]
      ,[1. op.oikeuden koulutusastetaso2]
      ,[Viim. op.oikeuden koulutusastetaso2]
      ,[1. op.oikeuden koulutusalataso1]
      ,[Viim. op.oikeuden koulutusalataso1]
      ,[1. op.oikeuden koulutusalataso2]
      ,[Viim. op.oikeuden koulutusalataso2]
      ,[1. op.oikeuden koulutusalataso3]
      ,[Viim. op.oikeuden koulutusalataso3]
      ,[Lkm]
      ,[1. op.oikeuden koulutuskoodi]
      ,[Viim. op.oikeuden koulutuskoodi]
      ,getdate() as loadtime
FROM [VirtaSiirto].[sa].[sa_virta_otp_opiskeluoikeudet]

GO

USE [ANTERO]