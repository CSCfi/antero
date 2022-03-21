USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_arvo_amis]    Script Date: 28.2.2019 16:09:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_arvo_amis]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_arvo_amis] AS' 
END
GO


ALTER PROCEDURE [dw].[p_lataa_arvo_amis] AS

--dimensiot
EXEC [dw].[p_lataa_d_arvovastaus_koulutustausta]
EXEC [dw].[p_lataa_d_arvovastaus_monivalinta]
EXEC [dw].[p_lataa_d_arvovastaus_taustakysymys]


--faktat
EXEC [dw].[p_lataa_f_arvo_luodut_vastaajatunnukset]
EXEC [dw].[p_lataa_f_arvo_amis]
