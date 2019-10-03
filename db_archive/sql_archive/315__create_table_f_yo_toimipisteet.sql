IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='f_yo_toimipisteet') BEGIN

CREATE TABLE [dw].[f_yo_toimipisteet](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_yliopisto_id] [int] NOT NULL,
	[d_toimipiste_id] [int] NOT NULL,
	[d_toimipaikka_id] [int] NOT NULL,
	[vuosi] [int] NOT NULL,
	[toimiala] [int] NOT NULL,
	[toimipaikan_henkilokunnan_henkilotyovuodet] [int] NOT NULL,
	[tutkimusaseman_henkilokunnan_maksimimäärä] [int] NOT NULL,
	[tutkimusaseman_henkilokunnan_minimäärä] [int] NOT NULL,
	[tutkimusaseman_yopymisvuorokaudet] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__f_yo_toi__3213E83F42C5136C] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
;
ALTER TABLE [dw].[f_yo_toimipisteet] ADD  CONSTRAINT [DF_f_yo_toimipisteet_loadtime]  DEFAULT (getdate()) FOR [loadtime]
;
ALTER TABLE [dw].[f_yo_toimipisteet] ADD  CONSTRAINT [DF_f_yo_toimipisteet_username]  DEFAULT (suser_sname()) FOR [username]
;
END

