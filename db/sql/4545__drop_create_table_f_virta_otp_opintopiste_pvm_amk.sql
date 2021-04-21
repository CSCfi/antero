USE [ANTERO]
GO

ALTER TABLE [dw].[f_virta_otp_opintopiste_pvm_amk] DROP CONSTRAINT IF EXISTS [DF__f_virta_otp_opintopiste_pvm_amk__username]
GO

ALTER TABLE [dw].[f_virta_otp_opintopiste_pvm_amk] DROP CONSTRAINT IF EXISTS [DF__f_virta_otp_opintopiste_pvm_amk__loadtime__loadtime]
GO

/****** Object:  Table [dw].[f_virta_otp_opintopiste_pvm_amk]    Script Date: 21.4.2021 18:48:18 ******/
DROP TABLE IF EXISTS [dw].[f_virta_otp_opintopiste_pvm_amk]
GO

/****** Object:  Table [dw].[f_virta_otp_opintopiste_pvm_amk]    Script Date: 21.4.2021 18:48:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_virta_otp_opintopiste_pvm_amk](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tilastovuosi] [int] NOT NULL,
	[suorituspaiva] [datetime] NOT NULL,
	[d_ohjauksenala_id] [int] NOT NULL,
	[d_amk_koulutustyyppi_id] [int] NOT NULL,
	[d_amk_id] [int] NOT NULL,
	[lukumaara_int] [int] NULL,
	[perustutk_opiskelijat_lkm] [int] NULL,
	[vierask_suoritukset_lkm] [int] NULL,
	[kansainv_vaihto_lkm] [int] NULL,
	[kk_yhteistyo_lkm] [int] NULL,
	[avoin_kk_lkm] [int] NULL,
	[erillinen_opinto_oikeus_lkm] [int] NULL,
	[ulkomailta_hyv_luet_lkm] [int] NULL,
	[maahanm_val_koulutus_lkm] [int] NULL,
	[TKI_toiminnan_laajuus_lkm] [int] NULL,
	[TKI_muut_laajuus_lkm] [int] NULL,
	[TKI_harjoittelun_laajuus_lkm] [int] NULL,
	[ulkomaaharjoittelu_lkm] [int] NULL,
	[erikoistumiskoulutus_lkm] [int] NULL,
	[paivitys_ajankohta] nvarchar(10) NOT NULL,
	[tietojen_ajankohta] nvarchar(10) NOT NULL,
	[jarjestys_tietojen_ajankohta] int NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
	[loadtime] [datetime2](7) NOT NULL
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[f_virta_otp_opintopiste_pvm_amk] ADD  CONSTRAINT [DF__f_virta_otp_opintopiste_pvm_amk__loadtime__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_virta_otp_opintopiste_pvm_amk] ADD  CONSTRAINT [DF__f_virta_otp_opintopiste_pvm_amk__username]  DEFAULT (suser_sname()) FOR [username]
GO


