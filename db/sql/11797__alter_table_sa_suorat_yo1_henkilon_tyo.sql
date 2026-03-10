USE ANTERO

IF NOT EXISTS (
  SELECT *
  FROM sys.columns
  WHERE object_id = OBJECT_ID(N'[sa].[sa_suorat_yo1_henkilon_tyo]') 
  AND name = 'pedagogiset_opinnot_koodi'
)
BEGIN
	ALTER TABLE [sa].[sa_suorat_yo1_henkilon_tyo] ADD pedagogiset_opinnot_koodi varchar(20) null
END 

IF NOT EXISTS (
  SELECT *
  FROM sys.columns
  WHERE object_id = OBJECT_ID(N'[sa].[sa_suorat_yo1_henkilon_tyo]') 
  AND name = 'pedagogiset_opinnot_vuosi'
)
BEGIN
	ALTER TABLE [sa].[sa_suorat_yo1_henkilon_tyo] ADD pedagogiset_opinnot_vuosi int null
END 

IF NOT EXISTS (
  SELECT *
  FROM sys.columns
  WHERE object_id = OBJECT_ID(N'[sa].[sa_suorat_yo1_henkilon_tyo]') 
  AND name = 'pedagogiset_opinnot_korkeakoulu'
)
BEGIN
	ALTER TABLE [sa].[sa_suorat_yo1_henkilon_tyo] ADD pedagogiset_opinnot_korkeakoulu varchar(10) null
END 

USE ANTERO

IF NOT EXISTS (
  SELECT *
  FROM sys.columns
  WHERE object_id = OBJECT_ID(N'[sa].[sa_suorat_yo1_henkilon_tyo]') 
  AND name = 'tohtorintutkinto_koodi'
)
BEGIN
	ALTER TABLE [sa].[sa_suorat_yo1_henkilon_tyo] ADD tohtorintutkinto_koodi varchar(20) null
END 

IF NOT EXISTS (
  SELECT *
  FROM sys.columns
  WHERE object_id = OBJECT_ID(N'[sa].[sa_suorat_yo1_henkilon_tyo]') 
  AND name = 'tohtorintutkinto_vuosi'
)
BEGIN
	ALTER TABLE [sa].[sa_suorat_yo1_henkilon_tyo] ADD tohtorintutkinto_vuosi int null
END 

IF NOT EXISTS (
  SELECT *
  FROM sys.columns
  WHERE object_id = OBJECT_ID(N'[sa].[sa_suorat_yo1_henkilon_tyo]') 
  AND name = 'tohtorintutkinto_korkeakoulu'
)
BEGIN
	ALTER TABLE [sa].[sa_suorat_yo1_henkilon_tyo] ADD tohtorintutkinto_korkeakoulu varchar(10) null
END