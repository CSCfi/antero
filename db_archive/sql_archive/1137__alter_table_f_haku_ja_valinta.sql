USE [ANTERO]
GO

IF  EXISTS (SELECT 1 FROM sys.columns 
          WHERE Name = N'hakukohteen_tutkinnon_taso_kk_sykli'
          AND Object_ID = Object_ID(N'dw.f_haku_ja_valinta_hakeneet_korkea_aste'))
BEGIN
ALTER TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste]
DROP COLUMN hakukohteen_tutkinnon_taso_kk_sykli
END

IF  EXISTS (SELECT 1 FROM sys.columns 
          WHERE Name = N'hakukohteen_tutkinnon_taso_kk'
          AND Object_ID = Object_ID(N'dw.f_haku_ja_valinta_hakeneet_korkea_aste'))
BEGIN
ALTER TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste]
DROP COLUMN hakukohteen_tutkinnon_taso_kk
END

IF  EXISTS (SELECT 1 FROM sys.columns 
          WHERE Name = N'haku_amk_yo'
          AND Object_ID = Object_ID(N'dw.f_haku_ja_valinta_hakeneet_korkea_aste'))
BEGIN
ALTER TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste]
DROP COLUMN haku_amk_yo
END

IF NOT EXISTS (SELECT 1 FROM sys.columns 
          WHERE Name = N'd_tutkinnon_aloitussykli_kk_id'
          AND Object_ID = Object_ID(N'dw.f_haku_ja_valinta_hakeneet_korkea_aste'))
BEGIN
ALTER TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste]
ADD d_tutkinnon_aloitussykli_kk_id int
END

IF NOT EXISTS (SELECT 1 FROM sys.columns 
          WHERE Name = N'd_tutkinnon_taso_kk_id'
          AND Object_ID = Object_ID(N'dw.f_haku_ja_valinta_hakeneet_korkea_aste'))
BEGIN
ALTER TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste]
ADD d_tutkinnon_taso_kk_id int
END

IF NOT EXISTS (SELECT 1 FROM sys.columns 
          WHERE Name = N'd_haku_amk_yo_id'
          AND Object_ID = Object_ID(N'dw.f_haku_ja_valinta_hakeneet_korkea_aste'))
BEGIN
ALTER TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste]
ADD d_haku_amk_yo_id int
END

IF EXISTS (SELECT 1 FROM sys.columns 
          WHERE Name = N'hakukohteen_tutkinnon_taso_kk_sykli'
          AND Object_ID = Object_ID(N'dw.f_haku_ja_valinta_aloituspaikat_ja_pistemaarat'))
BEGIN
ALTER TABLE [dw].[f_haku_ja_valinta_aloituspaikat_ja_pistemaarat]
DROP COLUMN hakukohteen_tutkinnon_taso_kk_sykli
END

IF EXISTS (SELECT 1 FROM sys.columns 
          WHERE Name = N'hakukohteen_tutkinnon_taso_kk'
          AND Object_ID = Object_ID(N'dw.f_haku_ja_valinta_aloituspaikat_ja_pistemaarat'))
BEGIN
ALTER TABLE [dw].[f_haku_ja_valinta_aloituspaikat_ja_pistemaarat]
DROP COLUMN hakukohteen_tutkinnon_taso_kk
END

IF NOT EXISTS (SELECT 1 FROM sys.columns 
          WHERE Name = N'd_tutkinnon_aloitussykli_kk_id'
          AND Object_ID = Object_ID(N'dw.f_haku_ja_valinta_aloituspaikat_ja_pistemaarat'))
BEGIN
ALTER TABLE [dw].[f_haku_ja_valinta_aloituspaikat_ja_pistemaarat]
ADD d_tutkinnon_aloitussykli_kk_id int
END

IF NOT EXISTS (SELECT 1 FROM sys.columns 
          WHERE Name = N'd_tutkinnon_taso_kk_id'
          AND Object_ID = Object_ID(N'dw.f_haku_ja_valinta_aloituspaikat_ja_pistemaarat'))
BEGIN
ALTER TABLE [dw].[f_haku_ja_valinta_aloituspaikat_ja_pistemaarat]
ADD d_tutkinnon_taso_kk_id int
END