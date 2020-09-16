USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_yamk_tutkinnot]    Script Date: 3.9.2020 16:59:19 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_api_yamk_tutkinnot]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_yamk_tutkinnot]    Script Date: 3.9.2020 16:59:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dw].[p_lataa_api_yamk_tutkinnot] AS

TRUNCATE TABLE [api].[yamk_tutkinnot]

INSERT INTO [api].[yamk_tutkinnot]

SELECT [Korkeakoulu]
	,[Tutkinnon suorittamisvuosi]
	,[Suorituskuukausi]
	,[Tutkinto]
	,[Tutkintokoodi]
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
	,[defaultorder]

FROM [ANTERO].[dw].[api_yamk_tutkinnot]

GO


