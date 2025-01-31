USE [ANTERO]
GO

/****** Object:  Table [dw].[f_virta_otp_yhteiskaksoistutkinnot]    Script Date: 8.2.2024 13:47:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_virta_otp_yhteiskaksoistutkinnot]') AND type in (N'U'))
DROP TABLE [dw].[f_virta_otp_yhteiskaksoistutkinnot]
GO

/****** Object:  Table [dw].[f_virta_otp_yhteiskaksoistutkinnot]    Script Date: 8.2.2024 13:47:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_virta_otp_yhteiskaksoistutkinnot](
	[tilastovuosi] [int] NULL,
	[d_organisaatioluokitus_id] [int] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_virta_os_luokittelu_id] [int] NULL,
	[d_ika_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_maatjavaltiot2_kansalaisuus_id] [int] NULL,
	[henkilo_koodi] [varchar](100) NULL,
	[source] [varchar](100) NULL,
	[username] [varchar](50) NULL,
	[loadtime] [date] NULL
) ON [PRIMARY]
GO

USE [ANTERO]