USE [ANTERO]
GO
/****** Object:  Table [dw].[d_haku]    Script Date: 7.12.2017 15:09:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_haku]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_haku](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[haku_oid] [nvarchar](255) NULL,
	[haun_nimi_fi] [nvarchar](255) NULL,
	[haun_nimi_sv] [nvarchar](255) NULL,
	[haun_nimi_en] [nvarchar](255) NULL,
	[hakutyyppi_koodi] [nvarchar](255) NULL,
	[hakutyyppi_fi] [nvarchar](255) NULL,
	[hakutyyppi_sv] [nvarchar](255) NULL,
	[hakutyyppi_en] [nvarchar](255) NULL,
	[hakutapa_koodi] [nvarchar](255) NULL,
	[hakutapa_fi] [nvarchar](255) NULL,
	[hakutapa_sv] [nvarchar](255) NULL,
	[hakutapa_en] [nvarchar](255) NULL,
	[hakuryhma_koodi] [nvarchar](255) NULL,
	[hakuryhma_fi] [nvarchar](255) NULL,
	[hakuryhma_sv] [nvarchar](255) NULL,
	[hakuryhma_en] [nvarchar](255) NULL,
	[kohdejoukontarkenne_koodi] [nvarchar](255) NULL,
	[kohdejoukontarkenne_fi] [nvarchar](255) NULL,
	[kohdejoukontarkenne_sv] [nvarchar](255) NULL,
	[kohdejoukontarkenne_en] [nvarchar](255) NULL,
	[korkeakouluhaku] [int] NULL,
	[jarjestys_hakutyyppi]  AS (case when [hakutyyppi_koodi]='-1' then '99999' else CONVERT([int],[hakutyyppi_koodi]) end),
	[jarjestys_hakutapa]  AS (case when [hakutapa_koodi]='-1' then '99999' else CONVERT([int],[hakutapa_koodi]) end),
	[jarjestys_kohdejoukontarkenne]  AS (case when [kohdejoukontarkenne_koodi]='-1' then '99999' else CONVERT([int],[kohdejoukontarkenne_koodi]) end),
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_haku] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[d_hakuaika]    Script Date: 7.12.2017 15:09:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_hakuaika]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_hakuaika](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[hakuaikaId] [varchar](255) NULL,
	[selite_fi] [varchar](255) NULL,
	[selite_sv] [varchar](255) NULL,
	[selite_en] [varchar](255) NULL,
	[haku_oid] [varchar](255) NULL,
	[jarjestys] [varchar](255) NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_hakuaika__3213E83FFE0FF408] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[d_hakukohde]    Script Date: 7.12.2017 15:09:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_hakukohde]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_hakukohde](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[oid] [varchar](255) NOT NULL,
	[selite_fi] [varchar](255) NULL,
	[selite_sv] [varchar](255) NULL,
	[selite_en] [varchar](255) NULL,
	[jarjestys] [varchar](255) NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_hakukohde__3213E83FFE0FF408] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[d_ika]    Script Date: 7.12.2017 15:09:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_ika]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_ika](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[ika_avain] [varchar](6) NULL,
	[ika_fi] [nvarchar](100) NULL,
	[ika_sv] [nvarchar](100) NULL,
	[ika_en] [nvarchar](100) NULL,
	[ikaryhma1_fi] [nvarchar](100) NULL,
	[ikaryhma1_sv] [nvarchar](100) NULL,
	[ikaryhma1_en] [nvarchar](100) NULL,
	[ikaryhma2_fi] [nvarchar](100) NULL,
	[ikaryhma2_sv] [nvarchar](100) NULL,
	[ikaryhma2_en] [nvarchar](100) NULL,
	[jarjestys_ika] [nvarchar](100) NULL,
	[jarjestys_ikaryhma1] [nvarchar](100) NULL,
	[jarjestys_ikaryhma2] [nvarchar](100) NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_ika] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[d_kausi]    Script Date: 7.12.2017 15:09:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_kausi]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_kausi](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [varchar](10) NOT NULL,
	[selite_fi] [varchar](255) NOT NULL,
	[selite_sv] [varchar](255) NOT NULL,
	[selite_en] [varchar](255) NOT NULL,
	[jarjestys]  AS (case when [koodi]='K' then '1' when [koodi]='S' then '2' else CONVERT([varchar](100),[koodi]) end),
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_kausi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[d_koulutustyyppi]    Script Date: 7.12.2017 15:09:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_koulutustyyppi]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_koulutustyyppi](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [varchar](255) NOT NULL,
	[selite_fi] [varchar](255) NULL,
	[selite_sv] [varchar](255) NULL,
	[selite_en] [varchar](255) NULL,
	[jarjestys] [int] NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_koulutustyyppi__3213E83FFE0FF408] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[d_opintojenlaajuus]    Script Date: 7.12.2017 15:09:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_opintojenlaajuus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_opintojenlaajuus](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [varchar](255) NOT NULL,
	[selite_fi] [varchar](255) NOT NULL,
	[selite_sv] [varchar](255) NULL,
	[selite_en] [varchar](255) NULL,
	[jarjestys]  AS (case when [koodi]='-1' then '999' else right('00'+rtrim(left([koodi],(3))),(3)) end),
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_opintojenlaajuus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[d_pohjakoulutus]    Script Date: 7.12.2017 15:09:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_pohjakoulutus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_pohjakoulutus](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [varchar](255) NOT NULL,
	[selite_fi] [varchar](255) NOT NULL,
	[selite_sv] [varchar](255) NULL,
	[selite_en] [varchar](255) NULL,
	[jarjestys]  AS (case when [koodi]='-1' then 'ZZZ' else CONVERT([varchar](100),[koodi]) end),
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_pohjakoulutus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[d_pohjakoulutusvaatimus]    Script Date: 7.12.2017 15:09:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_pohjakoulutusvaatimus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_pohjakoulutusvaatimus](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [varchar](255) NOT NULL,
	[selite_fi] [varchar](255) NOT NULL,
	[selite_sv] [varchar](255) NULL,
	[selite_en] [varchar](255) NULL,
	[jarjestys]  AS (case when [koodi]='-1' then 'ZZZZZ' else CONVERT([varchar](100),[koodi]) end),
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_pohjakoulutusvaatimus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_haku_loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_haku] ADD  CONSTRAINT [DF_d_haku_loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_haku_username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_haku] ADD  CONSTRAINT [DF_d_haku_username]  DEFAULT (suser_sname()) FOR [username]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_hakuaika_loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_hakuaika] ADD  CONSTRAINT [DF_d_hakuaika_loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_hakuaika_username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_hakuaika] ADD  CONSTRAINT [DF_d_hakuaika_username]  DEFAULT (suser_sname()) FOR [username]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_hakukohde_loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_hakukohde] ADD  CONSTRAINT [DF_d_hakukohde_loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_hakukohde_username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_hakukohde] ADD  CONSTRAINT [DF_d_hakukohde_username]  DEFAULT (suser_sname()) FOR [username]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__d_ika__loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_ika] ADD  CONSTRAINT [DF__d_ika__loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__d_ika__username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_ika] ADD  CONSTRAINT [DF__d_ika__username]  DEFAULT (suser_name()) FOR [username]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_kausi_loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_kausi] ADD  CONSTRAINT [DF_d_kausi_loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_kausi_username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_kausi] ADD  CONSTRAINT [DF_d_kausi_username]  DEFAULT (suser_sname()) FOR [username]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_koulutustyyppi_loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_koulutustyyppi] ADD  CONSTRAINT [DF_d_koulutustyyppi_loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_koulutustyyppi_username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_koulutustyyppi] ADD  CONSTRAINT [DF_d_koulutustyyppi_username]  DEFAULT (suser_sname()) FOR [username]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_opintojenlaajuus_loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_opintojenlaajuus] ADD  CONSTRAINT [DF_d_opintojenlaajuus_loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_opintojenlaajuus_username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_opintojenlaajuus] ADD  CONSTRAINT [DF_d_opintojenlaajuus_username]  DEFAULT (suser_sname()) FOR [username]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_pohjakoulutus_loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_pohjakoulutus] ADD  CONSTRAINT [DF_d_pohjakoulutus_loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_pohjakoulutus_username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_pohjakoulutus] ADD  CONSTRAINT [DF_d_pohjakoulutus_username]  DEFAULT (suser_sname()) FOR [username]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_pohjakoulutusvaatimus_loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_pohjakoulutusvaatimus] ADD  CONSTRAINT [DF_d_pohjakoulutusvaatimus_loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_pohjakoulutusvaatimus_username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_pohjakoulutusvaatimus] ADD  CONSTRAINT [DF_d_pohjakoulutusvaatimus_username]  DEFAULT (suser_sname()) FOR [username]
END


