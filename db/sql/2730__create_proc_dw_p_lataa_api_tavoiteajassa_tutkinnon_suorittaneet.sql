USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_tavoiteajassa_tutkinnon_suorittaneet]    Script Date: 17.12.2019 17:08:40 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_api_tavoiteajassa_tutkinnon_suorittaneet]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_tavoiteajassa_tutkinnon_suorittaneet]    Script Date: 17.12.2019 17:08:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dw].[p_lataa_api_tavoiteajassa_tutkinnon_suorittaneet] AS

TRUNCATE TABLE [dw].[api_tavoiteajassa_tutkinnon_suorittaneet];

INSERT INTO [dw].[api_tavoiteajassa_tutkinnon_suorittaneet]
SELECT * FROM [dw].[v_api_tavoiteajassa_tutkinnon_suorittaneet];
