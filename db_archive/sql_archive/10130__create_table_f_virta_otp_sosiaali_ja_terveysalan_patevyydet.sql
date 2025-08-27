USE [ANTERO]
GO

/****** Object:  Table [dw].[f_virta_otp_sosiaali_ja_terveysalan_patevyydet]    Script Date: 20.9.2024 7:46:38 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_virta_otp_sosiaali_ja_terveysalan_patevyydet]') AND type in (N'U'))
DROP TABLE [dw].[f_virta_otp_sosiaali_ja_terveysalan_patevyydet]
GO

/****** Object:  Table [dw].[f_virta_otp_sosiaali_ja_terveysalan_patevyydet]    Script Date: 20.9.2024 7:46:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_virta_otp_sosiaali_ja_terveysalan_patevyydet](
	[tilastovuosi] [int] NULL,
	[henkilo] [int] NULL,
	[d_organisaatioluokitus_id] [bigint] NULL,
	[d_virta_patevyydet_id] [bigint] NULL,
	[lkm] [int] NOT NULL,
	[loadtime] [date] NULL,
	[username] [varchar](50) NULL,
	[source] [varchar](100) NULL
) ON [PRIMARY]
GO


USE [ANTERO]