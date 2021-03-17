USE [ARVO_SA]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_arvo_teema]    Script Date: 15.3.2021 15:21:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER TABLE sa.sa_arvo_kysymykset ADD teema NVARCHAR(max)

USE [ANTERO]
