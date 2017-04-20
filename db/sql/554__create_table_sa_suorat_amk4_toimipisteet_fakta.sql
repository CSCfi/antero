IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk4_toimipisteet_fakta') BEGIN

create table [sa].[sa_suorat_amk4_toimipisteet_fakta](
	[korkeakoulu_tunnus] [varchar](5) null,
	[vuosi] [int] null,
	[toimipiste_koodi] [varchar](200) null,
	[toimipaikka_koodi] [varchar](5) null,
	[dummy_checksum] [int] null,
	[henkilosto_lkm] [decimal](9, 4) null,
	[toimipaikkojen_lkm] [int] null,
	[imp_created_by] [varchar](100) null,
	[imp_created_date] [datetime] null
);

END