USE [Koski_SA]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_esivalmistelu]    Script Date: 24.10.2019 13:50:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_esivalmistelu]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_esivalmistelu] AS' 
END
GO



ALTER PROCEDURE [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_esivalmistelu] AS


EXEC Koski_SA.[dbo].[p_lataa_eperusteet_tutkinnonosa_tutkinto_kustannusryhma]
EXEC Koski_SA.[dbo].[p_lataa_eperusteet_osaamisalat_tutkinnonosat_laajuudet]
EXEC Koski_SA.[dbo].[p_lataa_kustannusryhma_tutkinto_ja_osaamisala]
EXEC Koski_SA.[sa].[p_lataa_tutkinnot_ja_tutkinnonosat_liputa_ei_vos_rahoitettu_koulutus]	 
EXEC Koski_SA.[sa].[p_lataa_tutkinnot_ja_tutkinnonosat_osasuoritus_pl_eivos] 
EXEC Koski_SA.[sa].[p_lataa_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset] 
EXEC Koski_SA.[sa].[p_lataa_tutkinnot_ja_tutkinnonosat_paatason_suoritukset] 
EXEC Koski_SA.[sa].[p_lataa_tutkinnot_ja_tutkinnonosat_aikajaksot] 


GO
USE [ANTERO]