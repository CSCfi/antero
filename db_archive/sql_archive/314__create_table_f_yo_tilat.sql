IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='f_yo_tilat') BEGIN

CREATE TABLE [dw].[f_yo_tilat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_yliopisto_id] [int] NOT NULL,
	[vuosi] [int] NOT NULL,
	[harjoittelukoulujen_tilat] [int] NOT NULL,
	[muut_vuokratilat] [int] NOT NULL,
	[yliopistokiinteistoyhtion_toimitilat_suomen_yliopistokiinteistot_oy] [int] NOT NULL,
	[yliopistokiinteistoyhtion_toimitilat_aalto_yliopistokiinteistot_oy] [int] NOT NULL,
	[yliopistokiinteistoyhtion_toimitilat_helsingin_yliopistokiinteistot_oy] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__f_yo_til__3213E83F8E859F15] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
;
ALTER TABLE [dw].[f_yo_tilat] ADD  CONSTRAINT [DF_f_yo_tilat_loadtime]  DEFAULT (getdate()) FOR [loadtime]
;
ALTER TABLE [dw].[f_yo_tilat] ADD  CONSTRAINT [DF_f_yo_tilat_username]  DEFAULT (suser_sname()) FOR [username]
;
END

