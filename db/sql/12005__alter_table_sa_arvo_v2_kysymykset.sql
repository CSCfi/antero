USE [Arvo_SA]

IF NOT EXISTS (
  SELECT *
  FROM sys.columns
  WHERE object_id = OBJECT_ID(N'[sa].[sa_arvo_v2_kysymykset]')
  AND name = 'osio_id' )
BEGIN
	ALTER TABLE [sa].[sa_arvo_v2_kysymykset] ADD osio_id int NULL
END

IF NOT EXISTS (
  SELECT *
  FROM sys.columns
  WHERE object_id = OBJECT_ID(N'[sa].[sa_arvo_v2_kysymykset]')
  AND name = 'osio_nimi_fi' )
BEGIN
	ALTER TABLE [sa].[sa_arvo_v2_kysymykset] ADD osio_nimi_fi varchar(500) NULL
END

IF NOT EXISTS (
  SELECT *
  FROM sys.columns
  WHERE object_id = OBJECT_ID(N'[sa].[sa_arvo_v2_kysymykset]')
  AND name = 'osio_nimi_sv' )
BEGIN
	ALTER TABLE [sa].[sa_arvo_v2_kysymykset] ADD osio_nimi_sv varchar(500) NULL
END

IF NOT EXISTS (
  SELECT *
  FROM sys.columns
  WHERE object_id = OBJECT_ID(N'[sa].[sa_arvo_v2_kysymykset]')
  AND name = 'osio_nimi_en' )
BEGIN
	ALTER TABLE [sa].[sa_arvo_v2_kysymykset] ADD osio_nimi_en varchar(500) NULL
END

IF NOT EXISTS (
  SELECT *
  FROM sys.columns
  WHERE object_id = OBJECT_ID(N'[sa].[sa_arvo_v2_kysymykset]')
  AND name = 'osio_jarjestys' )
BEGIN
	ALTER TABLE [sa].[sa_arvo_v2_kysymykset] ADD osio_jarjestys int NULL
END

USE ANTERO
