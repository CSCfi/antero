--
-- create table sa_cimo_hist_kvliikkuvuus_yo_04_15
--

USE [ANTERO]
GO

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_cimo_hist_kvliikkuvuus_yo_04_15') BEGIN

/****** Object:  Table [sa].[sa_cimo_hist_kvliikkuvuus_yo_04_15]    Script Date: 19.4.2018 15:53:07 ******/


CREATE TABLE [sa].[sa_cimo_hist_kvliikkuvuus_yo_04_15](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[suunta] [nvarchar](100) NOT NULL,
	[tilastovuosi] [int] NOT NULL,
	[yliopisto_vanha] [nvarchar](100) NOT NULL,
	[yliopisto] [nvarchar](100) NULL,
	[sukupuoli] [nvarchar](20) NOT NULL,
	[koulutusala_95] [nvarchar](100) NOT NULL,
	[koulutusaste] [nvarchar](100) NULL,
	[liikkuvuusohjelma] [nvarchar](150) NULL,
	[maa] [nvarchar](100) NOT NULL,
	[maanosa] [nvarchar](50) NOT NULL,
	[kesto_kk] [nvarchar](50) NOT NULL,
	[liikkuvuuden_tyyppi] [nvarchar](100) NOT NULL,
	[lkm] [int] NOT NULL,
	[jarjestys_kesto] [nvarchar](50) NULL,
	[tietolahde] [nvarchar](70) NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__sa.sa_cimo_hist_kvliikkuvuus_yo_04_15] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
;

ALTER TABLE [sa].[sa_cimo_hist_kvliikkuvuus_yo_04_15] ADD  DEFAULT ('CIMO') FOR [Tietolahde]
;

ALTER TABLE [sa].[sa_cimo_hist_kvliikkuvuus_yo_04_15] ADD  CONSTRAINT [DF__sa_cimo_hist_kvliikkuvuus_yo_04_15__loadtime]  DEFAULT (getdate()) FOR [loadtime]

;

ALTER TABLE [sa].[sa_cimo_hist_kvliikkuvuus_yo_04_15] ADD  DEFAULT ('Excel') FOR [source]

;

ALTER TABLE [sa].[sa_cimo_hist_kvliikkuvuus_yo_04_15] ADD  CONSTRAINT [DF__sa_cimo_hist_kvliikkuvuus_yo_04_15__username]  DEFAULT (suser_name()) FOR [username]
;
END



