
USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
USE [ANTERO]
IF EXISTS
(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_amos_siirtotiedosto_okm5')
BEGIN
DROP TABLE [sa].[sa_amos_siirtotiedosto_okm5];
END
GO
IF  NOT EXISTS
(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_amos_siirtotiedosto_okm5')

BEGIN

CREATE TABLE [sa].[sa_amos_siirtotiedosto_okm5](
[id] [bigint] IDENTITY(1,1) NOT NULL,
[ytunnus] [varchar] (9)  NULL,
[nimi] [varchar] (255) NULL,
[laji] [varchar](50) NULL,
[tyyppi] [varchar](50) NULL,
[maakunta] [varchar](50) NULL,
[jarj_luvan_opiskelijavuodet_a] [float] NULL,
[ta_ensikertainen_suoritepaatos_a] [float] NULL,
[ta_lisasuoritepaatos_a] [float] NULL,
[ta_paatokset_yhteensa_a] [float] NULL,
[ltae_mukaiset_paatokset_a] [float] NULL,
[ltae2_mukaiset_paatokset_a] [float] NULL,
[ltae_mukaiset_paatokset_yhteensa_a] [float] NULL,
[paatokset_yhteensa_a] [float] NULL,
[sp_lisays_kohdentamaton_jarj_esitys_a] [float] NULL,
[sp_lisays_kohdentamaton_okm_paatos_a] [float] NULL,
[sp_lisays_kohdentamaton_tyovkoul_jarj_esitys_a] [float] NULL,
[sp_lisays_kohdentamaton_tyovkoul_okm_paatos_a] [float] NULL,
[sp_lisays_kohdennettu_krit1_jarj_esitys_a] [float] NULL,
[sp_lisays_kohdennettu_krit1_okm_paatos_a] [float] NULL,
[sp_lisays_kohdennettu_tyovkoul_krit1_jarj_esitys_a] [float] NULL,
[sp_lisays_kohdennettu_tyovkoul_krit1_okm_paatos_a] [float] NULL,
[sp_lisays_kohdennettu_krit2_jarj_esitys_a] [float] NULL,
[sp_lisays_kohdennettu_krit2_okm_paatos_a] [float] NULL,
[sp_lisays_kohdennettu_tyovkoul_krit2_jarj_esitys_a] [float] NULL,
[sp_lisays_kohdennettu_tyovkoul_krit2_okm_paatos_a] [float] NULL,
[sp_lisays_kohdennettu_krit3_jarj_esitys_a] [float] NULL,
[sp_lisays_kohdennettu_krit3_okm_paatos_a] [float] NULL,
[sp_lisays_kohdennettu_tyovkoul_krit3_jarj_esitys_a] [float] NULL,
[sp_lisays_kohdennettu_tyovkoul_krit3_okm_paatos_a] [float] NULL,
[sp_lisays_kohdennettu_krit4_jarj_esitys_a] [float] NULL,
[sp_lisays_kohdennettu_krit4_okm_paatos_a] [float] NULL,
[sp_lisays_kohdennettu_tyovkoul_krit4_jarj_esitys_a] [float] NULL,
[sp_lisays_kohdennettu_tyovkoul_krit4_okm_paatos_a] [float] NULL,
[KAAVA_$AH$5] [float] NULL,
[KAAVA_$AI$5] [float] NULL,
[KAAVA_$AJ$5] [float] NULL,
[KAAVA_$AK$5] [float] NULL,
[opiskelijavuodet_ytm_a] [float] NULL,
[opiskelijavuodet_ytm_tyovoimakoulutus_a] [float] NULL,
[opiskelijavuodet_estimaatti_a] [float] NULL,
[opiskelijavuodet_tyovoimakoulutus_estimaatti_a] [float] NULL,
[KAAVA_$AP$5] [float] NULL,
[KAAVA_$AQ$5] [float] NULL,
[profiilikerroin_a] [float] NULL,
[KAAVA_$AS$5] [float] NULL,
[KAAVA_$AT$5] [float] NULL,
[KAAVA_$AU$5] [float] NULL,
[KAAVA_$AV$5] [float] NULL,
[KAAVA_$AW$5] [float] NULL,
[KAAVA_$AX$5] [float] NULL,
[KAAVA_$AY$5] [float] NULL,
[ta_ensikertainen_suoritepaatos_harkv_korotus_a] [float] NULL,
[ta_lisasuoritepaatos_harkv_korotus_a] [float] NULL,
[KAAVA_$BB$5] [float] NULL,
[ltae_mukaiset_paatokset_ed_vuosi_a] [float] NULL,
[ltae2_mukaiset_paatokset_ed_vuosi_a] [float] NULL,
[KAAVA_$BE$5] [float] NULL,
[KAAVA_$BF$5] [float] NULL,
[harkv_korotus_syy1_hakemus_a] [float] NULL,
[harkv_korotus_syy1_paatos_a] [float] NULL,
[harkv_korotus_syy2_hakemus_a] [float] NULL,
[harkv_korotus_syy2_paatos_a] [float] NULL,
[harkv_korotus_syy3_hakemus_a] [float] NULL,
[harkv_korotus_syy3_paatos_a] [float] NULL,
[harkv_korotus_syy4_hakemus_a] [float] NULL,
[harkv_korotus_syy4_paatos_a] [float] NULL,
[KAAVA_$BO$5] [float] NULL,
[KAAVA_$BP$5] [float] NULL,
[KAAVA_$BQ$5] [float] NULL,
[painotettu_tutkintomaara_a] [float] NULL,
[KAAVA_$BS$5] [float] NULL,
[KAAVA_$BT$5] [float] NULL,
[KAAVA_$BU$5] [float] NULL,
[KAAVA_$BV$5] [float] NULL,
[KAAVA_$BW$5] [float] NULL,
[KAAVA_$BX$5] [float] NULL,
[KAAVA_$BY$5] [float] NULL,
[vos_ta_mukainen_a] [float] NULL,
[vos_ta_mukainen_sis_alv_a] [float] NULL,
[KAAVA_$CB$5] [float] NULL,
[KAAVA_$CC$5] [float] NULL,
[KAAVA_$CD$5] [float] NULL,
[KAAVA_$CE$5] [float] NULL,
[vos_ta_ja_ltae_mukainen_a] [float] NULL,
[vos_ta_ja_ltae_mukainen_sis_alv_a] [float] NULL,
[KAAVA_$CH$5] [float] NULL,
[KAAVA_$CI$5] [float] NULL,
[KAAVA_$CJ$5] [float] NULL,
[KAAVA_$CK$5] [float] NULL,
[vos_ta_ja_ltae_mukainen_vertailu_a] [float] NULL,
[vos_ta_ja_ltae_mukainen_vertailu_sis_alv_a] [float] NULL,
[KAAVA_$CN$5] [float] NULL,
[KAAVA_$CO$5] [float] NULL,
[KAAVA_$CP$5] [float] NULL,
[KAAVA_$CQ$5] [float] NULL,
[ensikertainen_sp_suoritusrahoitus_a] [float] NULL,
[KAAVA_$CS$5] [float] NULL,
[KAAVA_$CT$5] [float] NULL,
[KAAVA_$CU$5] [float] NULL,
[ensikertainen_sp_tyovoimakoulutus_a] [float] NULL,
[KAAVA_$CW$5] [float] NULL,
[KAAVA_$CX$5] [float] NULL,
[KAAVA_$CY$5] [float] NULL,
[tiedostonimi] [varchar](255) NULL,
[latauspvm] [date] NULL,
[lastmodified] [datetime] NULL,
[source] [varchar](255) NULL,
[username] [varchar](100) NULL,
[loadtime] [datetime] NULL,
CONSTRAINT [PK__sa_amos_siirtotiedosto_okm5] PRIMARY KEY CLUSTERED (id ASC))

END
GO

ALTER TABLE [sa].[sa_amos_siirtotiedosto_okm5] ADD  CONSTRAINT [DF__sa_amos_siirtotiedosto_okm5__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_amos_siirtotiedosto_okm5] ADD  CONSTRAINT [DF__sa_amos_siirtotiedosto_okm5__username]  DEFAULT (suser_name()) FOR [username]
GO
