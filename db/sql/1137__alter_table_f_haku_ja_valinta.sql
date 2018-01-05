USE [ANTERO]
GO

ALTER TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste]
DROP COLUMN hakukohteen_tutkinnon_taso_kk_sykli

ALTER TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste]
DROP COLUMN hakukohteen_tutkinnon_taso_kk

ALTER TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste]
DROP COLUMN haku_amk_yo

ALTER TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste]
ADD d_tutkinnon_aloitussykli_kk_id int

ALTER TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste]
ADD d_tutkinnon_taso_kk_id int

ALTER TABLE [dw].[f_haku_ja_valinta_hakeneet_korkea_aste]
ADD d_haku_amk_yo_id int


ALTER TABLE [dw].[f_haku_ja_valinta_aloituspaikat_ja_pistemaarat]
DROP COLUMN hakukohteen_tutkinnon_taso_kk_sykli

ALTER TABLE [dw].[f_haku_ja_valinta_aloituspaikat_ja_pistemaarat]
DROP COLUMN hakukohteen_tutkinnon_taso_kk

ALTER TABLE [dw].[f_haku_ja_valinta_aloituspaikat_ja_pistemaarat]
ADD d_tutkinnon_aloitussykli_kk_id int

ALTER TABLE [dw].[f_haku_ja_valinta_aloituspaikat_ja_pistemaarat]
ADD d_tutkinnon_taso_kk_id int