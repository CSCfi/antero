USE [ANTERO]
IF EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_amos_siirtotiedosto_okm4')
BEGIN
		DROP TABLE [sa].[sa_amos_siirtotiedosto_okm4];
END
GO
IF  NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_amos_siirtotiedosto_okm4')


BEGIN
CREATE TABLE [sa].[sa_amos_siirtotiedosto_okm4](
	id bigint IDENTITY(1,1) NOT NULL,
	[ytunnus] [varchar](9) NOT NULL,
	[jarjestaja] [varchar](255) NULL,
	[ta_ensikertainen_suoritepaatos] [float] NULL,
	[ta_lisasuoritepaatos] [float] NULL,
	[ltae_mukaiset_paatokset] [float] NULL,
	[ltae2_mukaiset_paatokset] [float] NULL,
	[sp_lisays_kohdentamaton_jarj_esitys] [float] NULL,
	[sp_lisays_kohdentamaton_tyovkoul_jarj_esitys] [float] NULL,
	[sp_lisays_kohdennettu_krit1_jarj_esitys] [float] NULL,
	[sp_lisays_kohdennettu_tyovkoul_krit1_jarj_esitys] [float] NULL,
	[sp_lisays_kohdennettu_krit2_jarj_esitys] [float] NULL,
	[sp_lisays_kohdennettu_tyovkoul_krit2_jarj_esitys] [float] NULL,
	[sp_lisays_kohdennettu_krit3_jarj_esitys] [float] NULL,
	[sp_lisays_kohdennettu_tyovkoul_krit3_jarj_esitys] [float] NULL,
	[sp_lisays_kohdennettu_krit4_jarj_esitys] [float] NULL,
	[sp_lisays_kohdennettu_tyovkoul_krit4_jarj_esitys] [float] NULL,
	[ta_ensikertainen_suoritepaatos_harkv_korotus] [float] NULL,
	[ta_lisasuoritepaatos_harkv_korotus] [float] NULL,
	[ltae_mukaiset_paatokset_ed_vuosi] [float] NULL,
	[ltae2_mukaiset_paatokset_ed_vuosi] [float] NULL,
	[harkv_korotus_syy1_hakemus] [float] NULL,
	[harkv_korotus_syy2_hakemus] [float] NULL,
	[harkv_korotus_syy3_hakemus] [float] NULL,
	[harkv_korotus_syy4_hakemus] [float] NULL,
	[vos_ta_mukainen] [float] NULL,
	[vos_ta_mukainen_sis_alv] [float] NULL,
	[vos_ta_ja_ltae_mukainen] [float] NULL,
	[vos_ta_ja_ltae_mukainen_sis_alv] [float] NULL,
	[vos_ta_ja_ltae_mukainen_vertailu] [float] NULL,
	[vos_ta_ja_ltae_mukainen_vertailu_sis_alv] [float] NULL,
	[ensikertainen_sp_suoritusrahoitus] [float] NULL,
	[ensikertainen_sp_tyovoimakoulutus] [float] NULL,
	[latauspvm] [date] NULL,
	[lastmodified] [datetime] NULL,
	[username] [varchar](100) NULL,
	[loadtime] [datetime] NULL,
  CONSTRAINT [PK__sa_amos_siirtotiedosto_okm4] PRIMARY KEY CLUSTERED (id ASC))

END
GO

ALTER TABLE [sa].[sa_amos_siirtotiedosto_okm4] ADD  CONSTRAINT [DF__sa_amos_siirtotiedosto_okm4__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_amos_siirtotiedosto_okm4] ADD  CONSTRAINT [DF__sa_amos_siirtotiedosto_okm4__username]  DEFAULT (suser_name()) FOR [username]
GO
