IF EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='f_amk_toimipisteet') BEGIN

DROP TABLE dw.f_amk_toimipisteet;

CREATE TABLE [dw].[f_amk_toimipisteet](
	[id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[d_amk_id] [int] NOT NULL,
	[d_toimipisteen_toimipaikka_id] [int] NOT NULL,
	[vuosi] [int] NOT NULL,
	[toimipaikan_henkilokunnan_henkilotyovuodet] [float] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL)
	;

END