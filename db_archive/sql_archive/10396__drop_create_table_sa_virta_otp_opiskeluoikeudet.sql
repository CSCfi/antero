USE [ANTERO]
GO


/****** Object:  Table [sa].[sa_virta_otp_opiskeluoikeudet]    Script Date: 21.11.2024 8:15:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_virta_otp_opiskeluoikeudet]') AND type in (N'U'))
DROP TABLE [sa].[sa_virta_otp_opiskeluoikeudet]
GO

/****** Object:  Table [sa].[sa_virta_otp_opiskeluoikeudet]    Script Date: 21.11.2024 8:15:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

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
	[Lkm] [int] NULL,
	[1. op.oikeuden koulutuskoodi] [nvarchar](6) NULL,
	[Viim. op.oikeuden koulutuskoodi] [nvarchar](6) NULL,
	[eka_op] [int] NULL,
	[muut_op] [int] NULL,
	[uusi_oo_edell_lv] [smallint] NULL,
	[syntymavuosi] [int] NULL,
	[loadtime] [datetime] NULL
) ON [PRIMARY]
GO

ALTER TABLE [sa].[sa_virta_otp_opiskeluoikeudet] ADD  DEFAULT ((0)) FOR [Vuosia ensimmäisestä opiskeluoikeudesta]
GO

ALTER TABLE [sa].[sa_virta_otp_opiskeluoikeudet] ADD  DEFAULT ((0)) FOR [Vuosia viimeisestä opiskeluoikeudesta]
GO

ALTER TABLE [sa].[sa_virta_otp_opiskeluoikeudet] ADD  CONSTRAINT [DF_sa_virta_otp_opiskeluoikeudet_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

