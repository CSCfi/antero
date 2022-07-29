USE [VipunenTK_SA]
GO

DROP PROCEDURE IF EXISTS [dbo].[p_lataa_TK_K1_13_sopv_yhdista]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_TK_K1_13_sopv_yhdista]    Script Date: 8.2.2022 10:54:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[p_lataa_TK_K1_13_sopv_yhdista] AS

--Ylläpidetään lähdenäkymää joka siirtyy jäädytyksessä, kytketään siltä varalta että tämä lataus käytössä jossain. / JS 8.2.2022

DROP TABLE IF EXISTS [dbo].[TK_K1_13_sopv]

SELECT * INTO [dbo].[TK_K1_13_sopv]
FROM ANTERO.dw.v_TK_K1_13


