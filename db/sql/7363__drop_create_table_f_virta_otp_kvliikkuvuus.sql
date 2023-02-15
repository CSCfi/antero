USE [ANTERO]
GO

ALTER TABLE [dw].[f_virta_otp_kvliikkuvuus] DROP CONSTRAINT [DF__f_virta_otp_kvliikkuvuus__username]
GO

ALTER TABLE [dw].[f_virta_otp_kvliikkuvuus] DROP CONSTRAINT [DF__f_virta_otp_kvliikkuvuus__loadtime]
GO

/****** Object:  Table [dw].[f_virta_otp_kvliikkuvuus]    Script Date: 15.2.2023 14:39:39 ******/
DROP TABLE [dw].[f_virta_otp_kvliikkuvuus]
GO

/****** Object:  Table [dw].[f_virta_otp_kvliikkuvuus]    Script Date: 15.2.2023 14:39:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

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
	[d_ika_id] [int] NULL,
	[d_kalenteri_alkupvm_id] [int] NULL,
	[opintojen_aloitusvuosi] [int] NULL,
 CONSTRAINT [PK__f_virta_otp_kvliikkuvuus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[f_virta_otp_kvliikkuvuus] ADD  CONSTRAINT [DF__f_virta_otp_kvliikkuvuus__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_virta_otp_kvliikkuvuus] ADD  CONSTRAINT [DF__f_virta_otp_kvliikkuvuus__username]  DEFAULT (suser_sname()) FOR [username]
GO

USE [ANTERO]