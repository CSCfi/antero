IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='f_yo_harjoittelukoulujen_opintopisteet') BEGIN

CREATE TABLE [dw].[f_yo_harjoittelukoulujen_opintopisteet](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_yliopisto_id] [int] NOT NULL,
	[d_koulutusala95_id] [int] NOT NULL,
	[d_ohjauksenala_id] [int] NOT NULL,
	[vuosi] [int] NOT NULL,
	[suoritetut_opintopisteet_luokanopettajaharjoittelu] [int] NOT NULL,
	[suoritetut_opintopisteet_aineenopettajaharjoittelu] [int] NOT NULL,
	[suoritetut_opintopisteet_erityisopettajat] [int] NOT NULL,
	[suoritetut_opintopisteet_opinto_ohjaajat] [int] NOT NULL,
	[suoritetut_opintopisteet_lastentarhanopettajat] [int] NOT NULL,
	[suoritetut_opintopisteet_aikuiskoulutus_harjoittelu] [int] NOT NULL,
	[suoritetut_opintopisteet_muut_opettajankoulutusryhmat] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__f_yo_har__3213E83FC01469A0] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
;

ALTER TABLE [dw].[f_yo_harjoittelukoulujen_opintopisteet] ADD  CONSTRAINT [DF_f_yo_harjoittelukoulujen_opintopisteet_loadtime]  DEFAULT (getdate()) FOR [loadtime]
;

ALTER TABLE [dw].[f_yo_harjoittelukoulujen_opintopisteet] ADD  CONSTRAINT [DF_f_yo_harjoittelukoulujen_opintopisteet_username]  DEFAULT (suser_sname()) FOR [username]
;

END

