USE [ANTERO]
GO

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_cimo_hist_kvliikkuvuus_amk_10_15') BEGIN

/****** Script Date: 20.4.2018 11:00:40 ******/

CREATE TABLE [sa].[sa_cimo_hist_kvliikkuvuus_amk_10_15](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[tilastovuosi] [int] NOT NULL,
	[amk] [nvarchar](100) NOT NULL,
	[kohdemaa] [nvarchar](100) NOT NULL,
	[kohdemaanosa] [nvarchar](100) NOT NULL,
	[koulutusala_02] [nvarchar](100) NOT NULL,
	[koulutustyyppi] [nvarchar](50) NOT NULL,
	[laht_pitka_opisk_lkm] [int] NULL,
	[laht_pitka_harj_lkm] [int] NULL,
	[laht_lyhyt_opisk_lkm] [int] NULL,
	[saap_pitka_opisk_lkm] [int] NULL,
	[saap_pitka_harj_lkm] [int] NULL,
	[saap_lyhyt_opisk_lkm] [int] NULL,
	[tietolahde] [nvarchar](70) NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__sa.sa_cimo_hist_kvliikkuvuus_amk_10_15] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

;

ALTER TABLE [sa].[sa_cimo_hist_kvliikkuvuus_amk_10_15] ADD  DEFAULT ('CIMO') FOR [Tietolahde]
;

ALTER TABLE [sa].[sa_cimo_hist_kvliikkuvuus_amk_10_15] ADD  CONSTRAINT [DF__sa_cimo_hist_kvliikkuvuus_amk_10_15__loadtime]  DEFAULT (getdate()) FOR [loadtime]
;

ALTER TABLE [sa].[sa_cimo_hist_kvliikkuvuus_amk_10_15] ADD  DEFAULT ('Excel') FOR [source]
;

ALTER TABLE [sa].[sa_cimo_hist_kvliikkuvuus_amk_10_15] ADD  CONSTRAINT [DF__sa_cimo_hist_kvliikkuvuus_amk_10_15__username]  DEFAULT (suser_name()) FOR [username]
;

END
