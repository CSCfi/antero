USE [ANTERO]
GO

ALTER TABLE [dw].[d_amk_toimipisteen_toimipaikka]	ALTER COLUMN [postinumero] [varchar](15) NULL
ALTER TABLE [dw].[d_amk_toimipisteen_toimipaikka] ALTER COLUMN [kunta] [varchar](15) NOT NULL
ALTER TABLE [dw].[d_amk_toimipisteen_toimipaikka] ALTER COLUMN [tki_toiminta] [varchar](15) NOT NULL
ALTER TABLE [dw].[d_amk_toimipisteen_toimipaikka] ALTER COLUMN [palvelutoiminta] [varchar](15) NOT NULL
ALTER TABLE [dw].[d_amk_toimipisteen_toimipaikka] ALTER COLUMN [nuorten_koulutus] [varchar](15) NOT NULL
ALTER TABLE [dw].[d_amk_toimipisteen_toimipaikka] ALTER COLUMN [aikuiskoulutus] [varchar](15) NOT NULL
ALTER TABLE [dw].[d_amk_toimipisteen_toimipaikka] ALTER COLUMN [ylempaan_amk_tutkintoon_johtava_koulutus] [varchar](15) NOT NULL

GO
