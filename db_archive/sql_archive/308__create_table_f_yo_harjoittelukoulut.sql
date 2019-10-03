IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='f_yo_harjoittelukoulut') BEGIN

CREATE TABLE [dw].[f_yo_harjoittelukoulut](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_yliopisto_id] [int] NOT NULL,
	[vuosi] [int] NOT NULL,
	[harjoittelukoulun_oppilaat_yhteensa] [int] NOT NULL,
	[harjoittelukoulun_oppilaat_esiopetus] [int] NOT NULL,
	[harjoittelukoulun_oppilaat_perusopetuksen_vuodet_1_6] [int] NOT NULL,
	[harjoittelukoulun_oppilaat_perusopetuksen_vuodet_7_9] [int] NOT NULL,
	[harjoittelukoulun_oppilaat_lukio] [int] NOT NULL,
	[harjoittelukoulun_kokonaistuntimaara] [int] NOT NULL,
	[harjoittelukoulun_opettajankoulutustehtavien_kokonaisviikkotunnit] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__f_yo_har__3213E83F2C947626] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
;
ALTER TABLE [dw].[f_yo_harjoittelukoulut] ADD  CONSTRAINT [DF_f_yo_harjoittelukoulut_loadtime]  DEFAULT (getdate()) FOR [loadtime]
;
ALTER TABLE [dw].[f_yo_harjoittelukoulut] ADD  CONSTRAINT [DF_f_yo_harjoittelukoulut_username]  DEFAULT (suser_sname()) FOR [username]
;

END

