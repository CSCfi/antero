USE [ANTERO]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_organisaatioluokitus]') AND type in (N'U'))
ALTER TABLE [dw].[d_organisaatioluokitus] DROP CONSTRAINT IF EXISTS [DF__d_organisaatioluokitus__username]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_organisaatioluokitus]') AND type in (N'U'))
ALTER TABLE [dw].[d_organisaatioluokitus] DROP CONSTRAINT IF EXISTS [DF__d_organisaatioluokitus__loadtime]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_maatjavaltiot2]') AND type in (N'U'))
ALTER TABLE [dw].[d_maatjavaltiot2] DROP CONSTRAINT IF EXISTS [DF__d_maatjavaltiot2__username]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_maatjavaltiot2]') AND type in (N'U'))
ALTER TABLE [dw].[d_maatjavaltiot2] DROP CONSTRAINT IF EXISTS [DF__d_maatjavaltiot2__loadtime]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_koulutusluokitus]') AND type in (N'U'))
ALTER TABLE [dw].[d_koulutusluokitus] DROP CONSTRAINT IF EXISTS [DF__d_koulutusluokitus__username]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_koulutusluokitus]') AND type in (N'U'))
ALTER TABLE [dw].[d_koulutusluokitus] DROP CONSTRAINT IF EXISTS [DF__d_koulutusluokitus__loadtime]
GO
/****** Object:  Table [dw].[d_organisaatioluokitus]    Script Date: 7.12.2017 17:44:01 ******/
DROP TABLE IF EXISTS [dw].[d_organisaatioluokitus]
GO
/****** Object:  Table [dw].[d_maatjavaltiot2]    Script Date: 7.12.2017 17:44:01 ******/
DROP TABLE IF EXISTS [dw].[d_maatjavaltiot2]
GO
/****** Object:  Table [dw].[d_koulutusluokitus]    Script Date: 7.12.2017 17:44:01 ******/
DROP TABLE IF EXISTS [dw].[d_koulutusluokitus]
GO
/****** Object:  Table [dw].[d_koulutusluokitus]    Script Date: 7.12.2017 17:44:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_koulutusluokitus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_koulutusluokitus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[koulutusluokitus_avain] [varchar](50) NOT NULL,
	[koulutusluokitus_koodi] [varchar](6) NOT NULL,
	[koulutusluokitus_fi] [nvarchar](200) NOT NULL,
	[koulutusluokitus_sv] [nvarchar](200) NOT NULL,
	[koulutusluokitus_en] [nvarchar](200) NOT NULL,
	[koulutusastetaso1_koodi] [varchar](2) NULL,
	[koulutusastetaso1_fi] [nvarchar](200) NULL,
	[koulutusastetaso1_sv] [nvarchar](200) NULL,
	[koulutusastetaso1_en] [nvarchar](200) NULL,
	[koulutusastetaso2_koodi] [varchar](2) NULL,
	[koulutusastetaso2_fi] [nvarchar](200) NULL,
	[koulutusastetaso2_sv] [nvarchar](200) NULL,
	[koulutusastetaso2_en] [nvarchar](200) NULL,
	[koulutusalataso1_koodi] [varchar](2) NULL,
	[koulutusalataso1_fi] [nvarchar](200) NULL,
	[koulutusalataso1_sv] [nvarchar](200) NULL,
	[koulutusalataso1_en] [nvarchar](200) NULL,
	[koulutusalataso2_koodi] [varchar](3) NULL,
	[koulutusalataso2_fi] [nvarchar](200) NULL,
	[koulutusalataso2_sv] [nvarchar](200) NULL,
	[koulutusalataso2_en] [nvarchar](200) NULL,
	[koulutusalataso3_koodi] [varchar](4) NULL,
	[koulutusalataso3_fi] [nvarchar](200) NULL,
	[koulutusalataso3_sv] [nvarchar](200) NULL,
	[koulutusalataso3_en] [nvarchar](200) NULL,
	[okmohjauksenala_koodi] [varchar](2) NULL,
	[okmohjauksenala_fi] [nvarchar](200) NULL,
	[okmohjauksenala_sv] [nvarchar](200) NULL,
	[okmohjauksenala_en] [nvarchar](200) NULL,
	[koulutusaste2002_koodi] [varchar](2) NULL,
	[koulutusaste2002_fi] [nvarchar](200) NULL,
	[koulutusaste2002_sv] [nvarchar](200) NULL,
	[koulutusaste2002_en] [nvarchar](200) NULL,
	[koulutusala2002_koodi] [varchar](2) NULL,
	[koulutusala2002_fi] [nvarchar](200) NULL,
	[koulutusala2002_sv] [nvarchar](200) NULL,
	[koulutusala2002_en] [nvarchar](200) NULL,
	[opintoala2002_koodi] [varchar](3) NULL,
	[opintoala2002_fi] [nvarchar](200) NULL,
	[opintoala2002_sv] [nvarchar](200) NULL,
	[opintoala2002_en] [nvarchar](200) NULL,
	[opintoala1995_koodi] [varchar](2) NULL,
	[opintoala1995_fi] [nvarchar](200) NULL,
	[opintoala1995_sv] [nvarchar](200) NULL,
	[opintoala1995_en] [nvarchar](200) NULL,
	[koulutussektori_koodi] [varchar](2) NULL,
	[koulutussektori_fi] [nvarchar](60) NULL,
	[koulutussektori_sv] [nvarchar](60) NULL,
	[koulutussektori_en] [nvarchar](60) NULL,
	[tutkintotyyppi_koodi] [varchar](2) NULL,
	[tutkintotyyppi_fi] [nvarchar](60) NULL,
	[tutkintotyyppi_sv] [nvarchar](60) NULL,
	[tutkintotyyppi_en] [nvarchar](60) NULL,
	[jarjestys_koulutusalataso1_koodi]  AS (case when [koulutusalataso1_koodi]=(-1) then '99999' else CONVERT([varchar](10),[koulutusalataso1_koodi]) end),
	[jarjestys_koulutusalataso2_koodi]  AS (case when [koulutusalataso2_koodi]=(-1) then '99999' else CONVERT([varchar](10),[koulutusalataso2_koodi]) end),
	[jarjestys_koulutusalataso3_koodi]  AS (case when [koulutusalataso3_koodi]='-1' then '99999' else CONVERT([varchar](10),[koulutusalataso3_koodi]) end),
	[jarjestys_koulutusastetaso1_koodi]  AS (case when [koulutusastetaso1_koodi]='-1' then '99999' else CONVERT([varchar](10),[koulutusastetaso1_koodi]) end),
	[jarjestys_koulutusastetaso2_koodi]  AS (case when [koulutusastetaso2_koodi]='-1' then '99999' else CONVERT([varchar](10),[koulutusastetaso2_koodi]) end),
	[jarjestys_koulutusluokitus_koodi]  AS (case when [koulutusluokitus_koodi]='-1' then '9999999' else CONVERT([varchar](10),[koulutusluokitus_koodi]) end),
	[jarjestys_koulutussektori_koodi]  AS (case when [koulutussektori_koodi]='-1' then '99999' else CONVERT([varchar](10),[koulutussektori_koodi]) end),
	[jarjestys_okmohjauksenala_koodi]  AS (case when [okmohjauksenala_koodi]='-1' then '99999' else CONVERT([varchar](10),[okmohjauksenala_koodi]) end),
	[jarjestys_tutkintotyyppi_koodi]  AS (case when [tutkintotyyppi_koodi]=(-1) then '99999' else CONVERT([varchar](10),[tutkintotyyppi_koodi]) end),
	[jarjestys_koulutusaste2002_koodi]  AS (case when [koulutusaste2002_koodi]=(-1) then '99999' else CONVERT([varchar](10),[koulutusaste2002_koodi]) end),
	[jarjestys_koulutusala2002_koodi]  AS (case when [koulutusala2002_koodi]=(-1) then '99999' else CONVERT([varchar](10),[koulutusala2002_koodi]) end),
	[jarjestys_opintoala2002_koodi]  AS (case when [opintoala2002_koodi]=(-1) then '99999' else CONVERT([varchar](10),[opintoala2002_koodi]) end),
	[jarjestys_opintoala1995_koodi]  AS (case when [opintoala1995_koodi]=(-1) then '99999' else CONVERT([varchar](10),[opintoala1995_koodi]) end),
 CONSTRAINT [PK__d_koulutusluokitus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[d_maatjavaltiot2]    Script Date: 7.12.2017 17:44:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_maatjavaltiot2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_maatjavaltiot2](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[maatjavaltiot2_koodi] [varchar](5) NOT NULL,
	[maatjavaltiot2_fi] [nvarchar](100) NOT NULL,
	[maatjavaltiot2_sv] [nvarchar](100) NOT NULL,
	[maatjavaltiot2_en] [nvarchar](100) NOT NULL,
	[maanosa_koodi] [nvarchar](3) NULL,
	[maanosa_fi] [nvarchar](200) NULL,
	[maanosa_sv] [nvarchar](200) NULL,
	[maanosa_en] [nvarchar](200) NULL,
	[maanosa2_koodi] [nvarchar](3) NULL,
	[maanosa2_fi] [nvarchar](200) NULL,
	[maanosa2_sv] [nvarchar](200) NULL,
	[maanosa2_en] [nvarchar](200) NULL,
	[maanosa3_koodi] [nvarchar](3) NULL,
	[maanosa3_fi] [nvarchar](200) NULL,
	[maanosa3_sv] [nvarchar](200) NULL,
	[maanosa3_en] [nvarchar](200) NULL,
	[jarjestys_maanosa_koodi]  AS (case when [maanosa_koodi]='-1' then 'ZZZZZ' else CONVERT([varchar](10),[maanosa_koodi]) end),
	[jarjestys_maanosa2_koodi]  AS (case when [maanosa2_koodi]='-1' then 'ZZZZZ' else CONVERT([varchar](10),[maanosa2_koodi]) end),
	[jarjestys_maanosa3_koodi]  AS (case when [maanosa3_koodi]='-1' then 'ZZZZZ' else CONVERT([varchar](10),[maanosa3_koodi]) end),
	[jarjestys_maatjavaltiot2_koodi]  AS (case when [maatjavaltiot2_koodi]='-1' then '99999' else CONVERT([varchar](10),[maatjavaltiot2_koodi]) end),
	[maanosa0_koodi] [nvarchar](3) NULL,
	[maanosa0_fi] [nvarchar](200) NULL,
	[maanosa0_sv] [nvarchar](200) NULL,
	[maanosa0_en] [nvarchar](200) NULL,
	[jarjestys_maanosa0_koodi]  AS (case when [maanosa0_koodi]='-1' then 'ZZZZZ' else CONVERT([varchar](10),[maanosa0_koodi]) end),
 CONSTRAINT [PK__d_maatjavaltiot2] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[d_organisaatioluokitus]    Script Date: 7.12.2017 17:44:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_organisaatioluokitus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_organisaatioluokitus](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [nvarchar](128) NOT NULL,
	[source] [nvarchar](255) NULL,
	[organisaatio_avain] [varchar](50) NOT NULL,
	[organisaatio_koodi] [varchar](20) NULL,
	[organisaatio_fi] [nvarchar](255) NULL,
	[organisaatio_sv] [nvarchar](255) NULL,
	[organisaatio_en] [nvarchar](255) NULL,
	[oppilaitostyyppi_koodi] [varchar](5) NULL,
	[oppilaitostyyppi_fi] [nvarchar](120) NULL,
	[oppilaitostyyppi_sv] [nvarchar](120) NULL,
	[oppilaitostyyppi_en] [nvarchar](120) NULL,
	[oppilaitoksenopetuskieli_koodi] [varchar](5) NULL,
	[oppilaitoksenopetuskieli_fi] [nvarchar](120) NULL,
	[oppilaitoksenopetuskieli_sv] [nvarchar](120) NULL,
	[oppilaitoksenopetuskieli_en] [nvarchar](120) NULL,
	[organisaatio_oid] [varchar](200) NULL,
	[liitosorganisaatio_oid] [varchar](200) NULL,
	[ylaorganisaatio_oid] [varchar](200) NULL,
	[kunta_koodi] [varchar](5) NULL,
	[osoitetyyppi] [varchar](20) NULL,
	[katuosoite] [nvarchar](500) NULL,
	[postinumero] [varchar](5) NULL,
	[postitoimipaikka] [nvarchar](200) NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL,
	[jarjestys_kunta_koodi]  AS (case when [kunta_koodi]='-1' then '99999' else CONVERT([varchar](10),[kunta_koodi]) end),
	[jarjestys_oppilaitoksenopetuskieli_koodi]  AS (case when [oppilaitoksenopetuskieli_koodi]='-1' then '99999' else CONVERT([varchar](10),[oppilaitoksenopetuskieli_koodi]) end),
	[jarjestys_oppilaitostyyppi_koodi]  AS (case when [oppilaitostyyppi_koodi]='-1' then '99999' else CONVERT([varchar](10),[oppilaitostyyppi_koodi]) end),
	[jarjestys_organisaatio_koodi]  AS (case when [organisaatio_koodi]='-1' then '99999' else CONVERT([varchar](10),[organisaatio_koodi]) end),
 CONSTRAINT [PK__d_organisaatioluokitus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [AK__d_organisaatioluokitus_organisaatio_avain] UNIQUE NONCLUSTERED 
(
	[organisaatio_avain] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__d_koulutusluokitus__loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_koulutusluokitus] ADD  CONSTRAINT [DF__d_koulutusluokitus__loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__d_koulutusluokitus__username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_koulutusluokitus] ADD  CONSTRAINT [DF__d_koulutusluokitus__username]  DEFAULT (suser_sname()) FOR [username]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__d_maatjavaltiot2__loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_maatjavaltiot2] ADD  CONSTRAINT [DF__d_maatjavaltiot2__loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__d_maatjavaltiot2__username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_maatjavaltiot2] ADD  CONSTRAINT [DF__d_maatjavaltiot2__username]  DEFAULT (suser_sname()) FOR [username]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__d_organisaatioluokitus__loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_organisaatioluokitus] ADD  CONSTRAINT [DF__d_organisaatioluokitus__loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__d_organisaatioluokitus__username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_organisaatioluokitus] ADD  CONSTRAINT [DF__d_organisaatioluokitus__username]  DEFAULT (suser_name()) FOR [username]
END

GO
