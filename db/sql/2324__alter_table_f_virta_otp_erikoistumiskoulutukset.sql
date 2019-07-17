USE [ANTERO]
GO

ALTER TABLE [dw].[f_virta_otp_erikoistumiskoulutukset] DROP CONSTRAINT [DF_f_virta_otp_erikoistumiskoulutukset_username]
GO

ALTER TABLE [dw].[f_virta_otp_erikoistumiskoulutukset] DROP CONSTRAINT [DF_f_virta_otp_erikoistumiskoulutukset_loadtime]
GO

/****** Object:  Table [dw].[f_virta_otp_erikoistumiskoulutukset]    Script Date: 16.7.2019 13:37:58 ******/
DROP TABLE [dw].[f_virta_otp_erikoistumiskoulutukset]
GO

/****** Object:  Table [dw].[f_virta_otp_erikoistumiskoulutukset]    Script Date: 16.7.2019 13:37:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_virta_otp_erikoistumiskoulutukset](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_erikoistumiskoulutus_id] [int] NOT NULL,
	[d_ika_id] [int] NOT NULL,
	[d_ohjauksenala_id] [int] NOT NULL,
	[d_kalenteri_opiskeluoikeus_alku_id] [int] NOT NULL,
	[d_organisaatioluokitus_id] [int] NOT NULL,
	[d_sukupuoli_id] [int] NOT NULL,
	[d_kalenteri_muu_tutkinto_id] [int] NULL,
	[d_koulutusluokitus_muu_tutkinto_id] [int] NULL,
	[d_organisaatioluokitus_muu_tutkinto_id] [int] NULL,
	[d_kytkin_aiempi_tutkinto_id] [int] NULL,
	[d_kytkin_myohempi_tutkinto_id] [int] NULL,
	[lkm] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__f_virta_otp_erikoistumiskoulutukset] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[f_virta_otp_erikoistumiskoulutukset] ADD  CONSTRAINT [DF_f_virta_otp_erikoistumiskoulutukset_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_virta_otp_erikoistumiskoulutukset] ADD  CONSTRAINT [DF_f_virta_otp_erikoistumiskoulutukset_username]  DEFAULT (suser_sname()) FOR [username]



