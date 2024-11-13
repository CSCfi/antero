USE [ANTERO]
GO

/****** Object:  Table [dw].[f_virta_otp_opiskeluoikeudet_live]    Script Date: 13.11.2024 12:18:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_virta_otp_opiskeluoikeudet_live]') AND type in (N'U'))
DROP TABLE [dw].[f_virta_otp_opiskeluoikeudet_live]
GO

/****** Object:  Table [dw].[f_virta_otp_opiskeluoikeudet_live]    Script Date: 13.11.2024 12:18:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_virta_otp_opiskeluoikeudet_live](
	[tilastovuosi] [int] NULL,
	[d_organisaatioluokitus_ensimmainen_id] [bigint] NULL,
	[d_organisaatioluokitus_viimeinen_id] [bigint] NULL,
	[d_ika_id] [int] NULL,
	[d_koulutusluokitus_ensimmainen_id] [int] NULL,
	[d_koulutusluokitus_viimeinen_id] [int] NULL,
	[d_kytkin_usea_oo_samalta_alalta] [int] NULL,
	[d_kytkin_usea_oo_samasta_ammattikorkeakoulusta] [int] NULL,
	[d_kytkin_usea_oo_samasta_yliopistosta] [int] NULL,
	[d_kytkin_yliopisto_ja_ammattikorkeakoulu] [int] NULL,
	[vuosia_ensimmaisesta_opiskeluoikeudesta] [int] NULL,
	[vuosia_viimeisesta_opiskeluoikeudesta] [int] NULL,
	[lukumaara_opiskeluoikeudet] [bigint] NULL,
	[lukumaara_korkeakoulut] [int] NULL,
	[lukumaara_yliopistot] [int] NULL,
	[lukumaara_ammattikorkeakoulut] [int] NULL,
	[opintopisteet_ensimmainen_opiskeluoikeus] [int] NULL,
	[opintopisteet_muut_opiskeluoikeudet] [int] NULL,
	[lkm] [int] NULL,
	[loadtime] [datetime] NULL,
	[source] [varchar](250) NOT NULL,
	[username] [varchar](250) NULL
) ON [PRIMARY]
GO


