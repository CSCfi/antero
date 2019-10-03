IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='f_yo_julkaisut_f_i') BEGIN

CREATE TABLE [dw].[f_yo_julkaisut_f_i](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_yliopisto_id] [int] NOT NULL,
	[d_koulutusala_id] [int] NOT NULL,
	[d_ohjauksenala_id] [int] NOT NULL,
	[d_julkaisutyyppi_id] [int] NOT NULL,
	[d_julkaisun_kansainvalisyys_id] [int] NOT NULL,
	[d_tieteenala_id] [int] NOT NULL,
	[vuosi] [int] NOT NULL,
	[julkaisujen_maara] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__f_yo_kot__3213E83F02841AF9] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
;
ALTER TABLE [dw].[f_yo_julkaisut_f_i] ADD  CONSTRAINT [DF_f_yo_kotimaiset_julkaisut_loadtime]  DEFAULT (getdate()) FOR [loadtime]
;
ALTER TABLE [dw].[f_yo_julkaisut_f_i] ADD  CONSTRAINT [DF_f_yo_kotimaiset_julkaisut_username]  DEFAULT (suser_sname()) FOR [username]
;

END

