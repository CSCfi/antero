USE [ANTERO]
GO

/****** Object:  Table [dw].[f_virta_otp_55_summa_amk]    Script Date: 27.3.2018 16:05:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dw].[f_virta_otp_55_summa_amk](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[loadtime] [datetime] NOT NULL CONSTRAINT [DF__f_virta_otp_55_summa_amk__loadtime]  DEFAULT (getdate()),
	[username] [varchar](30) NOT NULL CONSTRAINT [DF__f_virta_otp_55_summa_amk__username]  DEFAULT (suser_sname()),
	[source] [varchar](100) NOT NULL,
	[d_oppilaitos_id] [int] NOT NULL,
	[d_koulutusluokitus_id] [int] NOT NULL,
	[vuosi] [int] NOT NULL,
	[kuukausi] [int] NOT NULL,
	[suorittanut55] [int] NOT NULL,
	[suorittanut55ilmanPankkia] [int] NULL,
	[suorittanut55pankinAvulla] [int] NULL,
	[suorittanut27] [int] NULL,
 CONSTRAINT [PK__f_virta_otp_55_summa_amk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


