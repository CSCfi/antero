USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tase_ja_tunnusluvut_kustannuskysely]    Script Date: 22.12.2025 8.15.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER TABLE sa.sa_suorat_amk_talous_3_tuloslaskelman_toiminnot ALTER COLUMN TUOTOT BIGINT


ALTER TABLE sa.sa_suorat_yo_talous_3_tuloslaskelman_toiminnot ALTER COLUMN [KKVALTRAH] BIGINT

ALTER TABLE sa.sa_suorat_yo_talous_3_tuloslaskelman_toiminnot ALTER COLUMN [KULKAT] BIGINT
