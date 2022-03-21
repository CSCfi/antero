USE [ANTERO]
GO
/****** Object:  Table [dw].[d_opettajapatevyys]    Script Date: 8.5.2020 11:36:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_opettajapatevyys]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_opettajapatevyys](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[koodi] [varchar](20) NULL,
	[selite_fi] [nvarchar](550) NULL,
	[selite_sv] [nvarchar](550) NULL,
	[selite_en] [nvarchar](550) NULL,
	[patevyyksien_maara] [nvarchar](50) NULL,
	[aineenopettajan_pedagogiset] [int] NULL,
	[ammatillinen] [int] NULL,
	[erityislastentarhanopettaja] [int] NULL,
	[erityisopettaja] [int] NULL,
	[opinto_ohjaaja] [int] NULL,
	[monialaiset_opinnot] [int] NULL,
	[varhaiskasvatuksen_ammatilliset_valmiudet] [int] NULL,
	[jarjestys_koodi]  AS (case when [koodi]='-1' then '99' else [koodi] end),
	[loadtime] [datetime] NULL,
	[source] [varchar](100) NULL,
	[username] [varchar](30) NULL,
 CONSTRAINT [PK_d_opettajapatevyys] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[f_virta_otp_opettajapatevyydet]    Script Date: 8.5.2020 11:36:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_virta_otp_opettajapatevyydet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_virta_otp_opettajapatevyydet](
	[tilastovuosi] [int] NULL,
	[opiskelija_avain] [varchar](105) NULL,
	[opiskelija] [varchar](100) NULL,
	[d_organisaatioluokitus_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_ika_id] [int] NULL,
	[tutkinnon_vuosi] [int] NULL,
	[d_koulutusluokitus_viimeisin_tutkinto_id] [int] NULL,
	[d_organisaatioluokitus_tutkinto_id] [int] NULL,
	[d_opettajapatevyys_kaikki_id] [int] NULL,
	[d_opettajapatevyys_id] [int] NULL,
	[suor_tapa] [varchar](150) NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__d_opettajapatevyys__loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_opettajapatevyys] ADD  CONSTRAINT [DF__d_opettajapatevyys__loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__d_opettajapatevyys__username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_opettajapatevyys] ADD  CONSTRAINT [DF__d_opettajapatevyys__username]  DEFAULT (suser_name()) FOR [username]
END
