USE [ANTERO]
GO
/****** Object:  Table [dw].[f_virta_otp_55_summa_amk]    Script Date: 28.3.2018 15:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_virta_otp_55_summa_amk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_virta_otp_55_summa_amk](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](30) NOT NULL,
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__f_virta_otp_55_summa_amk__loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[f_virta_otp_55_summa_amk] ADD  CONSTRAINT [DF__f_virta_otp_55_summa_amk__loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__f_virta_otp_55_summa_amk__username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[f_virta_otp_55_summa_amk] ADD  CONSTRAINT [DF__f_virta_otp_55_summa_amk__username]  DEFAULT (suser_sname()) FOR [username]
END

GO
