USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_virta_otp_opiskeluoikeudet]    Script Date: 15.2.2024 12:46:00 ******/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_virta_otp_opiskeluoikeudet]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[sa_virta_otp_opiskeluoikeudet](
	[Tilastovuosi] [varchar](4) NULL,
	[Opiskeluoikeuksien lukumäärä] [bigint] NULL,
	[Ensimmäinen korkeakoulu] [nvarchar](8) NULL,
	[Viimeinen korkeakoulu] [nvarchar](8) NULL,
	[Korkeakoulujen lukumäärä] [int] NULL,
	[Yliopistoja] [int] NULL,
	[AMKeja] [int] NULL,
	[YO+AMK] [varchar](5) NOT NULL,
	[Useampi opiskeluoikeus samalta alalta] [varchar](5) NOT NULL,
	[Useampi opiskeluoikeus samasta yliopistosta] [varchar](5) NOT NULL,
	[Useampi opiskeluoikeus samasta AMKista] [varchar](5) NOT NULL,
	[Vuosia ensimmäisestä opiskeluoikeudesta] [int] NULL,
	[Vuosia viimeisestä opiskeluoikeudesta] [int] NULL,
	[1. op.oikeuden koulutusluokitus] [nvarchar](200) NULL,
	[Viim. op.oikeuden koulutusluokitus] [nvarchar](200) NULL,
	[1. op.oikeuden okmohjauksenala] [nvarchar](200) NULL,
	[Viim. op.oikeuden okmohjauksenala] [nvarchar](200) NULL,
	[1. op.oikeuden koulutusastetaso1] [nvarchar](200) NULL,
	[Viim. op.oikeuden koulutusastetaso1] [nvarchar](200) NULL,
	[1. op.oikeuden koulutusastetaso2] [nvarchar](200) NULL,
	[Viim. op.oikeuden koulutusastetaso2] [nvarchar](200) NULL,
	[1. op.oikeuden koulutusalataso1] [nvarchar](200) NULL,
	[Viim. op.oikeuden koulutusalataso1] [nvarchar](200) NULL,
	[1. op.oikeuden koulutusalataso2] [nvarchar](200) NULL,
	[Viim. op.oikeuden koulutusalataso2] [nvarchar](200) NULL,
	[1. op.oikeuden koulutusalataso3] [nvarchar](200) NULL,
	[Viim. op.oikeuden koulutusalataso3] [nvarchar](200) NULL,
	[Lkm] [int] NULL,
	[1. op.oikeuden koulutuskoodi] [nvarchar](6) NULL,
	[Viim. op.oikeuden koulutuskoodi] [nvarchar](6) NULL,
	[loadtime] [datetime] NULL
) ON [PRIMARY]

ALTER TABLE [sa].[sa_virta_otp_opiskeluoikeudet] ADD  DEFAULT ((0)) FOR [Vuosia ensimmäisestä opiskeluoikeudesta]

ALTER TABLE [sa].[sa_virta_otp_opiskeluoikeudet] ADD  DEFAULT ((0)) FOR [Vuosia viimeisestä opiskeluoikeudesta]

ALTER TABLE [sa].[sa_virta_otp_opiskeluoikeudet] ADD  CONSTRAINT [DF_sa_virta_otp_opiskeluoikeudet_loadtime]  DEFAULT (getdate()) FOR [loadtime]

END

GO 

USE [ANTERO]
