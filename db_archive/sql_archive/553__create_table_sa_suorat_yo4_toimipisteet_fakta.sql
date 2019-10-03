IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo4_toimipisteet_fakta') BEGIN

CREATE TABLE [sa].[sa_suorat_yo4_toimipisteet_fakta](
	[yliopisto_tunnus] [varchar](5) NULL,
	[vuosi] [int] NULL,
	[toimipiste_koodi] [varchar](3) NULL,
	[toimipaikka_koodi] [varchar](10) NULL,
	[toimipaikan_htv_lkm] [decimal](10, 4) NULL,
	[tutkaseman_henk_max_maara] [int] NULL,
	[tutkaseman_henk_min_maara] [int] NULL,
	[tutkaseman_yopymisvuorokaudet_lkm] [int] NULL,
	[imp_created_by] [varchar](100) NULL,
	[imp_created_date] [datetime] NULL
);

END