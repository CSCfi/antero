USE [Antero]
GO 

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='f_amos_rajapinta_rahoitus_kriteerit') 
BEGIN


CREATE TABLE [dw].[f_amos_rajapinta_rahoitus_kriteerit](
 [ytunnus] [nvarchar](12) NULL,
 [ta_ensikertainen_suoritepaatos_2017] [bigint] NULL,
 [ta_lisasuoritepaatos_2017] [bigint] NULL,
 [ta_paatokset_yhteensa_2017] [bigint] NULL,
 [ltae_mukaiset_paatokset_2017] [bigint] NULL,
 [ltae2_mukaiset_paatokset_2017] [bigint] NULL,
 [ltae_mukaiset_paatokset_yhteensa_2017] [bigint] NULL,
 [paatokset_yhteensa_2017] [bigint] NULL,
 [sp_lisays_kohdentamaton_jarj_esitys_2019] [bigint] NULL,
 [sp_lisays_kohdentamaton_okm_paatos_2019] [bigint] NULL,
 [sp_lisays_kohdentamaton_tyovkoul_jarj_esitys_2019] [bigint] NULL,
 [sp_lisays_kohdentamaton_tyovkoul_okm_paatos_2019] [bigint] NULL,
 [sp_lisays_kohdennettu_krit1_jarj_esitys_2019] [bigint] NULL,
 [sp_lisays_kohdennettu_krit1_okm_paatos_2019] [bigint] NULL,
 [sp_lisays_kohdennettu_tyovkoul_krit1_jarj_esitys_2019] [bigint] NULL,
 [sp_lisays_kohdennettu_tyovkoul_krit1_okm_paatos_2019] [bigint] NULL,
 [sp_lisays_kohdennettu_krit2_jarj_esitys_2019] [bigint] NULL,
 [sp_lisays_kohdennettu_krit2_okm_paatos_2019] [bigint] NULL,
 [sp_lisays_kohdennettu_tyovkoul_krit2_jarj_esitys_2019] [bigint] NULL,
 [sp_lisays_kohdennettu_tyovkoul_krit2_okm_paatos_2019] [bigint] NULL,
 [sp_lisays_kohdennettu_krit3_jarj_esitys_2019] [bigint] NULL,
 [sp_lisays_kohdennettu_krit3_okm_paatos_2019] [bigint] NULL,
 [sp_lisays_kohdennettu_tyovkoul_krit3_jarj_esitys_2019] [bigint] NULL,
 [sp_lisays_kohdennettu_tyovkoul_krit3_okm_paatos_2019] [bigint] NULL,
 [sp_lisays_kohdennettu_krit4_jarj_esitys_2019] [bigint] NULL,
 [sp_lisays_kohdennettu_krit4_okm_paatos_2019] [bigint] NULL,
 [sp_lisays_kohdennettu_tyovkoul_krit4_jarj_esitys_2019] [bigint] NULL,
 [sp_lisays_kohdennettu_tyovkoul_krit4_okm_paatos_2019] [bigint] NULL,
 [ta_ensikertainen_suoritepaatos_harkv_korotus_2018] [bigint] NULL,
 [ta_lisasuoritepaatos_harkv_korotus_2018] [bigint] NULL,
 [harkv_korotus_syy1_hakemus_2018] [bigint] NULL,
 [harkv_korotus_syy1_paatos_2018] [bigint] NULL,
 [harkv_korotus_syy2_hakemus_2018] [bigint] NULL,
 [harkv_korotus_syy2_paatos_2018] [bigint] NULL,
 [harkv_korotus_syy3_hakemus_2018] [bigint] NULL,
 [harkv_korotus_syy3_paatos_2018] [bigint] NULL,
 [harkv_korotus_syy4_hakemus_2018] [bigint] NULL,
 [harkv_korotus_syy4_paatos_2018] [bigint] NULL,
 [vos_ta_mukainen_2018] [bigint] NULL,
 [vos_ta_mukainen_sis_alv_2018] [bigint] NULL,
 [vos_ta_ja_ltae_mukainen_2018] [bigint] NULL,
 [vos_ta_ja_ltae_mukainen_sis_alv_2018] [bigint] NULL,
 [vos_ta_ja_ltae_mukainen_2017] [bigint] NULL,
 [vos_ta_ja_ltae_mukainen_sis_alv_2017] [bigint] NULL,
 [ensikertainen_sp_suoritusrahoitus_2018] [bigint] NULL,
 [ensikertainen_sp_tyovoimakoulutus_2018] [bigint] NULL
)  
END

 
