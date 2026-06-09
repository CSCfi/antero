USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_amos_opiskelijavuodet_Tilastokeskukseen]
GO

DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_amos_opiskelijavuodet_Tilastokeskukseen_K1_15]
GO

DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_amos_opiskelijavuodet_Tilastokeskukseen_K1_16] 
GO

DROP TABLE IF EXISTS  [dw].[f_amos_opiskelijavuodet_Tilastokeskukseen]
GO

DROP TABLE IF EXISTS  [dw].[f_amos_opiskelijavuodet_Tilastokeskukseen_K1_15]
GO

DROP TABLE IF EXISTS  [dw].[f_amos_opiskelijavuodet_Tilastokeskukseen_K1_16]
GO
