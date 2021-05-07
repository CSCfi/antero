USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_koulutuksenkustannukset]    Script Date: 7.5.2021 1:57:34 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_api_koulutuksenkustannukset]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_koulutuksenkustannukset]    Script Date: 7.5.2021 1:57:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dw].[p_lataa_api_koulutuksenkustannukset] AS

BEGIN
  EXEC [dw].[p_lataa_api_koulutuksenkustannukset_esilataus]
END

IF (select count(*) from [dw].[api_koulutuksenkustannukset]) > 0
BEGIN
  TRUNCATE TABLE [api].[koulutuksenkustannukset]

  INSERT INTO [api].[koulutuksenkustannukset]
  SELECT * FROM [dw].[api_koulutuksenkustannukset]
END
ELSE RAISERROR('tabula rasa',11,1)
 

GO


