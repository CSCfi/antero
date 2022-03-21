USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_organisaatioluokitus_historia]    Script Date: 30.10.2019 12:40:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_organisaatioluokitus_historia')
BEGIN
DROP TABLE [dw].[d_organisaatioluokitus_historia]
END
GO
