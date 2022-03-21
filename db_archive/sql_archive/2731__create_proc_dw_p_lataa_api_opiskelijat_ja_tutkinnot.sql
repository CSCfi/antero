USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_opiskelijat_ja_tutkinnot]    Script Date: 17.12.2019 17:07:43 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_api_opiskelijat_ja_tutkinnot]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_opiskelijat_ja_tutkinnot]    Script Date: 17.12.2019 17:07:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dw].[p_lataa_api_opiskelijat_ja_tutkinnot] AS

TRUNCATE TABLE [dw].[api_opiskelijat_ja_tutkinnot];

INSERT INTO [dw].[api_opiskelijat_ja_tutkinnot]
SELECT * FROM [dw].[v_api_opiskelijat_ja_tutkinnot];
