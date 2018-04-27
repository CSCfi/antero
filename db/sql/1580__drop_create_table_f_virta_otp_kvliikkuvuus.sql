USE [ANTERO]
GO

IF EXISTS (select * from information_schema.tables where table_schema='dw' and table_name ='f_virta_otp_kvliikkuvuus') BEGIN

ALTER TABLE [dw].[f_virta_otp_kvliikkuvuus] DROP CONSTRAINT [DF__f_virta_otp_kvliikkuvuus__username]
;

ALTER TABLE [dw].[f_virta_otp_kvliikkuvuus] DROP CONSTRAINT [DF__f_virta_otp_kvliikkuvuus__loadtime]
;

/****** Object:  Table [dw].[f_virta_otp_kvliikkuvuus]    Script Date: 4.4.2018 15:54:43 ******/
DROP TABLE [dw].[f_virta_otp_kvliikkuvuus]
;
END

IF not exists (select * from information_schema.tables where table_schema='dw' and table_name ='f_virta_otp_kvliikkuvuus') BEGIN


/****** Object:  Table [dw].[f_virta_otp_kvliikkuvuus]    Script Date: 4.4.2018 15:54:43 ******/
SET ANSI_NULLS ON
;

SET QUOTED_IDENTIFIER ON
;

CREATE TABLE [dw].[f_virta_otp_kvliikkuvuus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](30) NOT NULL,
	[source] [varchar](100) NOT NULL,
	[d_organisaatio_id] [int] NOT NULL,
	[d_ohjauksenala_id] [int] NOT NULL,
	[d_koulutusluokitus_id] [int] NOT NULL,
	[d_koulutusala_2002_id] [int] NOT NULL,
	[d_koulutusala_1995_id] [int] NOT NULL,
	[d_sukupuoli_id] [int] NOT NULL,
	[d_liikkuvuudentyyppi_id] [int] NOT NULL,
	[d_lahtomaa_id] [int] NOT NULL,
	[d_kohdemaa_id] [int] NOT NULL,
	[d_kansalaisuus_id] [int] NOT NULL,
	[d_liikkuvuusohjelma_id] [int] NOT NULL,
	[opiskelijaavain] [nvarchar](100) NULL,
	[opiskeluoikeusavain] [nvarchar](100) NULL,
	[liikkuvuusjaksoavain] [nvarchar](100) NULL,
	[jaksoAlkupvm] [date] NULL,
	[jaksoLoppupvm] [date] NULL,
	[kesto] [int] NULL,
	[lukumaara] [int] NOT NULL,
	[d_liikkuvuudensuunta_id] [int] NOT NULL,
	[d_liikkuvuudenkesto_id] [int] NOT NULL,
	[tilannepvm] [date] NULL,
	[tilastovuosi] [int] NULL,
	[cimo_opintoaste] [varchar](2) NULL,
 CONSTRAINT [PK__f_virta_otp_kvliikkuvuus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

;

ALTER TABLE [dw].[f_virta_otp_kvliikkuvuus] ADD  CONSTRAINT [DF__f_virta_otp_kvliikkuvuus__loadtime]  DEFAULT (getdate()) FOR [loadtime]
;

ALTER TABLE [dw].[f_virta_otp_kvliikkuvuus] ADD  CONSTRAINT [DF__f_virta_otp_kvliikkuvuus__username]  DEFAULT (suser_sname()) FOR [username]
;
END


