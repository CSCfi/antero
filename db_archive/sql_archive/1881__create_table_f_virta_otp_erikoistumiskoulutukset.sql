USE [ANTERO]
GO

/****** Object:  Table [dw].[f_virta_otp_erikoistumiskoulutukset]    Script Date: 16.10.2018 13:10:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

if not exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='f_virta_otp_erikoistumiskoulutukset')
BEGIN 

CREATE TABLE [dw].[f_virta_otp_erikoistumiskoulutukset](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_erikoistumiskoulutuskoodi_id] [int] NOT NULL,
	[d_ika_id] [int] NOT NULL,
	[d_ohjauksenala_id] [int] NOT NULL,
	[opiskeluoikeus_alku_pvm] [date] NOT NULL,
	[d_organisaatioluokitus_id] [int] NOT NULL,
	[d_sukupuoli_id] [int] NOT NULL,
	[Lkm] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__f_virta_otp_erikoistumiskoulutukset] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dw].[f_virta_otp_erikoistumiskoulutukset] ADD  CONSTRAINT [DF_f_virta_otp_erikoistumiskoulutukset_loadtime]  DEFAULT (getdate()) FOR [loadtime]

ALTER TABLE [dw].[f_virta_otp_erikoistumiskoulutukset] ADD  CONSTRAINT [DF_f_virta_otp_erikoistumiskoulutukset_username]  DEFAULT (suser_sname()) FOR [username]

END


