USE [ANTERO]
GO

ALTER TABLE [dw].[f_virta_otp_tutkinnon_suorittaneet_vaihdossa] DROP CONSTRAINT IF EXISTS [DF__f_virta_otp_tutkinnon_suorittaneet_vaihdossa__username]
GO

ALTER TABLE [dw].[f_virta_otp_tutkinnon_suorittaneet_vaihdossa] DROP CONSTRAINT IF EXISTS [DF__f_virta_otp_tutkinnon_suorittaneet_vaihdossa__loadtime]
GO

/****** Object:  Table [dw].[f_virta_otp_tutkinnon_suorittaneet_vaihdossa]    Script Date: 14.12.2022 12:45:49 ******/
DROP TABLE [dw].[f_virta_otp_tutkinnon_suorittaneet_vaihdossa]
GO

/****** Object:  Table [dw].[f_virta_otp_tutkinnon_suorittaneet_vaihdossa]    Script Date: 14.12.2022 12:45:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_virta_otp_tutkinnon_suorittaneet_vaihdossa](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tilastovuosi] [int] NOT NULL,
	[d_sukupuoli_id] [int] NOT NULL,
	[d_ika_id] [int] NOT NULL,
	[d_koulutusluokitus_id] [int] NOT NULL,
	[d_liikkuvuudenkesto_id] [int] NOT NULL,
	[d_organisaatioluokitus_id] [int] NOT NULL,
	[opiskelijaavain] [varchar](50) NULL,
	[lukumaara] [int] NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](30) NOT NULL,
	[source] [varchar](100) NOT NULL,
 CONSTRAINT [PK__f_virta_otp_tutkinnon_suorittaneet_vaihdossa] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[f_virta_otp_tutkinnon_suorittaneet_vaihdossa] ADD  CONSTRAINT [DF__f_virta_otp_tutkinnon_suorittaneet_vaihdossa__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_virta_otp_tutkinnon_suorittaneet_vaihdossa] ADD  CONSTRAINT [DF__f_virta_otp_tutkinnon_suorittaneet_vaihdossa__username]  DEFAULT (suser_sname()) FOR [username]
GO

USE [ANTERO]