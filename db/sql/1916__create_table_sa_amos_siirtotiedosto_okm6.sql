USE [ANTERO]
IF EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_amos_siirtotiedosto_okm6')
BEGIN
		DROP TABLE [sa].[sa_amos_siirtotiedosto_okm6];
END
GO
IF  NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_amos_siirtotiedosto_okm6')


BEGIN
CREATE TABLE [sa].[sa_amos_siirtotiedosto_okm6](
	id bigint IDENTITY(1,1) NOT NULL,
	[ytunnus] [varchar](9) NOT NULL,
	[jarjestaja] [varchar](255) NULL,
	[ta_ensikertainen_suoritepaatos] [float] NULL,
	[ta_lisasuoritepaatos] [float] NULL,
	[sp_lisays_kohdentamaton_okm_paatos] [float] NULL,
	[sp_lisays_kohdentamaton_tyovkoul_okm_paatos] [float] NULL,
	[sp_lisays_kohdennettu_krit1_okm_paatos] [float] NULL,
	[sp_lisays_kohdennettu_tyovkoul_krit1_okm_paatos] [float] NULL,
	[sp_lisays_kohdennettu_krit2_okm_paatos] [float] NULL,
	[sp_lisays_kohdennettu_tyovkoul_krit2_okm_paatos] [float] NULL,
	[sp_lisays_kohdennettu_krit3_okm_paatos] [float] NULL,
	[sp_lisays_kohdennettu_tyovkoul_krit3_okm_paatos] [float] NULL,
	[sp_lisays_kohdennettu_krit4_okm_paatos] [float] NULL,
	[sp_lisays_kohdennettu_tyovkoul_krit4_okm_paatos] [float] NULL,
	[ta_ensikertainen_suoritepaatos_harkv_korotus] [float] NULL,
	[ta_lisasuoritepaatos_harkv_korotus] [float] NULL,
	[harkv_korotus_syy1_paatos] [float] NULL,
	[harkv_korotus_syy2_paatos] [float] NULL,
	[harkv_korotus_syy3_paatos] [float] NULL,
	[harkv_korotus_syy4_paatos] [float] NULL,
	[tiedostonimi] [varchar](255) NULL,
	[latauspvm] [date] NULL,
	[lastmodified] [datetime] NULL,
	[source] [varchar](255) NULL,
	[username] [varchar](100) NULL,
	[loadtime] [datetime] NULL,
  CONSTRAINT [PK__sa_amos_siirtotiedosto_okm6] PRIMARY KEY CLUSTERED (id ASC))

END
GO

ALTER TABLE [sa].[sa_amos_siirtotiedosto_okm6] ADD  CONSTRAINT [DF__sa_amos_siirtotiedosto_okm6__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_amos_siirtotiedosto_okm6] ADD  CONSTRAINT [DF__sa_amos_siirtotiedosto_okm6__username]  DEFAULT (suser_name()) FOR [username]
GO
