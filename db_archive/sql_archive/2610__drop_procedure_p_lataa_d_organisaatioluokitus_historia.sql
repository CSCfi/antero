USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_organisaatioluokitus_historia]    Script Date: 30.10.2019 12:40:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_organisaatioluokitus_historia]') AND type in (N'P', N'PC'))
BEGIN
DROP PROCEDURE [dw].[p_lataa_d_organisaatioluokitus_historia] 
END
GO
