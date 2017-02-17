IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='f_yo_opettaja_ja_tutkijavierailut') BEGIN

CREATE TABLE [dw].[f_yo_opettaja_ja_tutkijavierailut](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_yliopisto_id] [int] NOT NULL,
	[d_ohjauksen_ala_id] [int] NOT NULL,
	[d_koulutusala_id] [int] NULL,
	[d_maa_id] [int] NOT NULL,
	[d_yo_tutkijanuravaihe_id] [int] NOT NULL,
	[d_vierailutyyppi_id] [int] NOT NULL,
	[vuosi] [int] NOT NULL,
	[vierailut_ulkomaille_lkm] [int] NULL,
	[vierailut_ulkomailta_lkm] [int] NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__f_yo_ope__3213E83FBABA70D7] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
;
ALTER TABLE [dw].[f_yo_opettaja_ja_tutkijavierailut] ADD  CONSTRAINT [DF_f_yo_opettaja_ja_tutkijavierailut_loadtime]  DEFAULT (getdate()) FOR [loadtime]
;
ALTER TABLE [dw].[f_yo_opettaja_ja_tutkijavierailut] ADD  CONSTRAINT [DF_f_yo_opettaja_ja_tutkijavierailut_username]  DEFAULT (suser_sname()) FOR [username]
;
END

