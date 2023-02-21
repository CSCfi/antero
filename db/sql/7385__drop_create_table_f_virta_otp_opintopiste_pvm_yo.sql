USE [ANTERO]
GO

ALTER TABLE [dw].[f_virta_otp_opintopiste_pvm_yo] DROP CONSTRAINT [DF__f_virta_otp_opintopiste_pvm_yo__loadtime]
GO

ALTER TABLE [dw].[f_virta_otp_opintopiste_pvm_yo] DROP CONSTRAINT [DF__f_virta_otp_opintopiste_pvm_yo__username]
GO

/****** Object:  Table [dw].[f_virta_otp_opintopiste_pvm_yo]    Script Date: 21.2.2023 13:38:00 ******/
DROP TABLE [dw].[f_virta_otp_opintopiste_pvm_yo]
GO

/****** Object:  Table [dw].[f_virta_otp_opintopiste_pvm_yo]    Script Date: 21.2.2023 13:38:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_virta_otp_opintopiste_pvm_yo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tilastovuosi] [int] NOT NULL,
	[suorituspaiva] [datetime] NOT NULL,
	[d_ohjauksenala_id] [int] NOT NULL,
	[d_yo_id] [int] NOT NULL,
	[lukumaara_int] [int] NULL,
	[perustutk_opiskelijat_lkm] [int] NULL,
	[vierask_suoritukset_lkm] [int] NULL,
	[kansainv_vaihto_lkm] [int] NULL,
	[kk_yhteistyo_lkm] [int] NULL,
	[avoin_kk_lkm] [int] NULL,
	[erillinen_opinto_oikeus_lkm] [int] NULL,
	[ulkomailta_hyv_luet_lkm] [int] NULL,
	[erillinen_opinto_opettaja_lkm] [int] NULL,
	[ulkomaaharjoittelu_lkm] [int] NULL,
	[erikoistumiskoulutus_lkm] [int] NULL,
	[kvsuomivieraana_lkm] [int] NULL,
	[kvruotsivieraana_lkm] [int] NULL,
	[muunkuinkorkeakoulun_lkm] [int] NULL,
	[paivitys_ajankohta] [nvarchar](10) NOT NULL,
	[tietojen_ajankohta] [nvarchar](10) NOT NULL,
	[jarjestys_tietojen_ajankohta] [int] NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
	[loadtime] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[f_virta_otp_opintopiste_pvm_yo] ADD  CONSTRAINT [DF__f_virta_otp_opintopiste_pvm_yo__username]  DEFAULT (suser_sname()) FOR [username]
GO

ALTER TABLE [dw].[f_virta_otp_opintopiste_pvm_yo] ADD  CONSTRAINT [DF__f_virta_otp_opintopiste_pvm_yo__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO


USE [ANTERO]