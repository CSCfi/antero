USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_api_yamk_tutkinnot]    Script Date: 2.11.2020 20:46:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





ALTER PROCEDURE [dw].[p_lataa_api_yamk_tutkinnot] AS

DROP TABLE IF EXISTS [api].[yamk_tutkinnot]

SELECT * INTO [api].[yamk_tutkinnot] FROM
(
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
	,[defaultorder]

	FROM [ANTERO].[dw].[api_yamk_tutkinnot]

) f

