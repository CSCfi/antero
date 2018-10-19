USE [Antero]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dw].[v_amos_rahoitus_kriteerit]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dw].v_amos_rahoitus_kriteerit AS
SELECT 1 AS a
GO'
GO
ALTER VIEW [dw].[v_amos_rahoitus_kriteerit]
AS
SELECT        CASE WHEN l.uusi_ytunnus IS NULL THEN r.ytunnus ELSE l.uusi_ytunnus END AS ytunnus, l.poistuva_ytunnus, r.ta_ensikertainen_suoritepaatos, r.ta_lisasuoritepaatos, r.ta_paatokset_yhteensa, 
                         r.ltae_mukaiset_paatokset, r.ltae2_mukaiset_paatokset, r.ltae_mukaiset_paatokset_yhteensa, r.paatokset_yhteensa, r.sp_lisays_kohdentamaton_jarj_esitys, r.sp_lisays_kohdentamaton_okm_paatos, 
                         r.sp_lisays_kohdentamaton_tyovkoul_jarj_esitys, r.sp_lisays_kohdentamaton_tyovkoul_okm_paatos, r.sp_lisays_kohdennettu_krit1_jarj_esitys, r.sp_lisays_kohdennettu_krit1_okm_paatos, 
                         r.sp_lisays_kohdennettu_tyovkoul_krit1_jarj_esitys, r.sp_lisays_kohdennettu_tyovkoul_krit1_okm_paatos, r.sp_lisays_kohdennettu_krit2_jarj_esitys, r.sp_lisays_kohdennettu_krit2_okm_paatos, 
                         r.sp_lisays_kohdennettu_tyovkoul_krit2_jarj_esitys, r.sp_lisays_kohdennettu_tyovkoul_krit2_okm_paatos, r.sp_lisays_kohdennettu_krit3_jarj_esitys, r.sp_lisays_kohdennettu_krit3_okm_paatos, 
                         r.sp_lisays_kohdennettu_tyovkoul_krit3_jarj_esitys, r.sp_lisays_kohdennettu_tyovkoul_krit3_okm_paatos, r.sp_lisays_kohdennettu_krit4_jarj_esitys, r.sp_lisays_kohdennettu_krit4_okm_paatos, 
                         r.sp_lisays_kohdennettu_tyovkoul_krit4_jarj_esitys, r.sp_lisays_kohdennettu_tyovkoul_krit4_okm_paatos, r.ta_ensikertainen_suoritepaatos_harkv_korotus, r.ta_lisasuoritepaatos_harkv_korotus, 
                         r.harkv_korotus_syy1_hakemus, r.harkv_korotus_syy1_paatos, r.harkv_korotus_syy2_hakemus, r.harkv_korotus_syy2_paatos, r.harkv_korotus_syy3_hakemus, r.harkv_korotus_syy3_paatos, 
                         r.harkv_korotus_syy4_hakemus, r.harkv_korotus_syy4_paatos, r.vos_ta_mukainen, r.vos_ta_mukainen_sis_alv, r.vos_ta_ja_ltae_mukainen, r.vos_ta_ja_ltae_mukainen_sis_alv, 
                         r.vos_ta_ja_ltae_mukainen_vertailu, r.vos_ta_ja_ltae_mukainen_vertailu_sis_alv, r.ensikertainen_sp_suoritusrahoitus, r.ensikertainen_sp_tyovoimakoulutus, r.ltae_mukaiset_paatokset_ed_vuosi, 
                         r.jarj_luvan_opiskelijavuodet, r.profiilikerroin_korjattu
FROM            dw.f_amos_rajapinta_rahoitus_kriteerit_new AS r LEFT OUTER JOIN
                         dw.v_amos_organisaatioliitokset AS l ON r.ytunnus = l.poistuva_ytunnus


GO
