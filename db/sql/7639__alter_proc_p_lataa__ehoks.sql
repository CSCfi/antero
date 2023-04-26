USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa__ehoks]    Script Date: 26.4.2023 19:44:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER PROCEDURE [dw].[p_lataa__ehoks] AS

--EXEC	Koski_SA.sa.paivita_sa_taulujen_indeksit
--EXEC	Koski_SA.sa.p_lataa_amm_paatason_suoritus

EXEC sa.p_lisaa_indeksit_ehoks

EXEC sa.p_lataa_ehoks_osaamisen_hankkimisjaksot
EXEC sa.p_lataa_ehoks_osaamisen_hankkimisjaksot_netto
EXEC sa.p_lataa_ehoks_osaamisen_hankkimistavat_paivat
EXEC dw.p_lataa_d_osaamisen_hankkimistapa
EXEC dw.p_lataa_d_osaamisen_hankkimistavat
EXEC dw.p_lataa_f_ehoks_opiskelijat
EXEC dw.p_lataa_f_ehoks_tutkinnon_suorittaneet
EXEC dw.p_lataa_f_ehoks_tutkinnon_suorittaneet_neljannekset

EXEC sa.p_poista_indeksit_ehoks


GO


