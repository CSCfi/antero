USE [ANTERO]
GO

/****** Object:  Table [dw].[f_virta_otp_55_suppea]    Script Date: 25.8.2026 12.07.12 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_virta_otp_55_suppea]') AND type in (N'U'))
DROP TABLE [dw].[f_virta_otp_55_suppea]
GO

/****** Object:  Table [dw].[f_virta_otp_55_suppea]    Script Date: 25.8.2026 12.07.12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_virta_otp_55_suppea](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](30) NOT NULL,
	[source] [varchar](100) NOT NULL,
	[d_organisaatio_id] [int] NOT NULL,
	[d_koulutusluokitus_id] [int] NOT NULL,
	[d_tk_koulutustyyppi_id] [int] NOT NULL,
	[vuosi] [int] NOT NULL,
	[suorittanut55] [int] NOT NULL,
	[suorittanut55ilmanPankkia] [int] NULL,
	[suorittanut55pankinAvulla] [int] NULL,
	[suorittanut27] [int] NULL,
 CONSTRAINT [PK__f_virta_otp_55_suppea] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dw].[f_virta_otp_55_suppea] ADD  CONSTRAINT [DF__f_virta_otp_55_suppea__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_virta_otp_55_suppea] ADD  CONSTRAINT [DF__f_virta_otp_55_suppea__username]  DEFAULT (suser_sname()) FOR [username]