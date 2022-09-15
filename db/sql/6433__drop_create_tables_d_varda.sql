USE [ANTERO]
GO
/****** Object:  Table [dw].[d_varda_yritysluokitus]    Script Date: 13.9.2022 14:59:42 ******/
DROP TABLE [dw].[d_varda_yritysluokitus]
GO
/****** Object:  Table [dw].[d_varda_varhaiskasvatuspaikkaluokitus]    Script Date: 13.9.2022 14:59:42 ******/
DROP TABLE [dw].[d_varda_varhaiskasvatuspaikkaluokitus]
GO
/****** Object:  Table [dw].[d_varda_tyosuhde]    Script Date: 13.9.2022 14:59:42 ******/
DROP TABLE [dw].[d_varda_tyosuhde]
GO
/****** Object:  Table [dw].[d_varda_tyoaika]    Script Date: 13.9.2022 14:59:42 ******/
DROP TABLE [dw].[d_varda_tyoaika]
GO
/****** Object:  Table [dw].[d_varda_tutkinto]    Script Date: 13.9.2022 14:59:42 ******/
DROP TABLE [dw].[d_varda_tutkinto]
GO
/****** Object:  Table [dw].[d_varda_tuntimaara_asteikko]    Script Date: 13.9.2022 14:59:42 ******/
DROP TABLE [dw].[d_varda_tuntimaara_asteikko]
GO
/****** Object:  Table [dw].[d_varda_toimipaikkaluokitus]    Script Date: 13.9.2022 14:59:42 ******/
DROP TABLE [dw].[d_varda_toimipaikkaluokitus]
GO
/****** Object:  Table [dw].[d_varda_toimintamuoto]    Script Date: 13.9.2022 14:59:42 ******/
DROP TABLE [dw].[d_varda_toimintamuoto]
GO
/****** Object:  Table [dw].[d_varda_toiminnallinenpainotus]    Script Date: 13.9.2022 14:59:42 ******/
DROP TABLE [dw].[d_varda_toiminnallinenpainotus]
GO
/****** Object:  Table [dw].[d_varda_tehtavanimike]    Script Date: 13.9.2022 14:59:42 ******/
DROP TABLE [dw].[d_varda_tehtavanimike]
GO
/****** Object:  Table [dw].[d_varda_maksunperuste]    Script Date: 13.9.2022 14:59:42 ******/
DROP TABLE [dw].[d_varda_maksunperuste]
GO
/****** Object:  Table [dw].[d_varda_maksuluokka]    Script Date: 13.9.2022 14:59:42 ******/
DROP TABLE [dw].[d_varda_maksuluokka]
GO
/****** Object:  Table [dw].[d_varda_kytkin]    Script Date: 13.9.2022 14:59:42 ******/
DROP TABLE [dw].[d_varda_kytkin]
GO
/****** Object:  Table [dw].[d_varda_kielikoodistoopetushallinto]    Script Date: 13.9.2022 14:59:42 ******/
DROP TABLE [dw].[d_varda_kielikoodistoopetushallinto]
GO
/****** Object:  Table [dw].[d_varda_kasvatusopillinenjarjestelma]    Script Date: 13.9.2022 14:59:42 ******/
DROP TABLE [dw].[d_varda_kasvatusopillinenjarjestelma]
GO
/****** Object:  Table [dw].[d_varda_jarjestamismuoto]    Script Date: 13.9.2022 14:59:42 ******/
DROP TABLE [dw].[d_varda_jarjestamismuoto]
GO
/****** Object:  Table [dw].[d_varda_ikaryhma]    Script Date: 13.9.2022 14:59:42 ******/
DROP TABLE [dw].[d_varda_ikaryhma]
GO
/****** Object:  Table [dw].[d_varda_ikaryhma]    Script Date: 13.9.2022 14:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[d_varda_ikaryhma](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[koodi] [nvarchar](100) NOT NULL,
	[nimi_fi] [nvarchar](200) NULL,
	[nimi_sv] [nvarchar](200) NULL,
	[nimi_en] [nvarchar](200) NULL,
	[kuvaus_fi] [nvarchar](200) NULL,
	[kuvaus_sv] [nvarchar](200) NULL,
	[kuvaus_en] [nvarchar](200) NULL,
	[jarj_nro] [int] NOT NULL,
	[alkupvm] [date] NULL,
	[loppupvm] [date] NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__d_varda_ikaryhma] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dw].[d_varda_jarjestamismuoto]    Script Date: 13.9.2022 14:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[d_varda_jarjestamismuoto](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[koodi] [nvarchar](100) NOT NULL,
	[nimi_fi] [nvarchar](200) NULL,
	[nimi_sv] [nvarchar](200) NULL,
	[nimi_en] [nvarchar](200) NULL,
	[kuvaus_fi] [nvarchar](200) NULL,
	[kuvaus_sv] [nvarchar](200) NULL,
	[kuvaus_en] [nvarchar](200) NULL,
	[jarj_nro] [int] NOT NULL,
	[alkupvm] [date] NULL,
	[loppupvm] [date] NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__d_varda_jarjestamismuoto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dw].[d_varda_kasvatusopillinenjarjestelma]    Script Date: 13.9.2022 14:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[d_varda_kasvatusopillinenjarjestelma](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[koodi] [nvarchar](100) NOT NULL,
	[nimi_fi] [nvarchar](200) NULL,
	[nimi_sv] [nvarchar](200) NULL,
	[nimi_en] [nvarchar](200) NULL,
	[kuvaus_fi] [nvarchar](200) NULL,
	[kuvaus_sv] [nvarchar](200) NULL,
	[kuvaus_en] [nvarchar](200) NULL,
	[alkupvm] [date] NULL,
	[loppupvm] [date] NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__d_varda_kasvatusopillinenjarjestelma] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dw].[d_varda_kielikoodistoopetushallinto]    Script Date: 13.9.2022 14:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[d_varda_kielikoodistoopetushallinto](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[koodi] [nvarchar](100) NOT NULL,
	[nimi_fi] [nvarchar](200) NULL,
	[nimi_sv] [nvarchar](200) NULL,
	[nimi_en] [nvarchar](200) NULL,
	[kuvaus_fi] [nvarchar](200) NULL,
	[kuvaus_sv] [nvarchar](200) NULL,
	[kuvaus_en] [nvarchar](200) NULL,
	[alkupvm] [date] NULL,
	[loppupvm] [date] NULL,
	[jarj_nro] [int] NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__d_varda_kielikoodistoopetushallinto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dw].[d_varda_kytkin]    Script Date: 13.9.2022 14:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[d_varda_kytkin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[kytkin_luokka] [nvarchar](100) NOT NULL,
	[kytkin_koodi] [nvarchar](10) NOT NULL,
	[kytkin_fi] [nvarchar](100) NOT NULL,
	[kytkin_sv] [nvarchar](100) NOT NULL,
	[kytkin_en] [nvarchar](100) NOT NULL,
	[jarjestys_kytkin_koodi] [int] NOT NULL,
	[alkamis_pvm] [date] NOT NULL,
	[paattymis_pvm] [date] NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_varda_kytkin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dw].[d_varda_maksuluokka]    Script Date: 13.9.2022 14:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[d_varda_maksuluokka](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[koodi] [nvarchar](100) NOT NULL,
	[tilastovuosi] [int] NOT NULL,
	[max_arvo] [int] NULL,
	[yritystyyppi] [nvarchar](20) NULL,
	[nimi_fi] [nvarchar](200) NULL,
	[nimi_sv] [nvarchar](200) NULL,
	[nimi_en] [nvarchar](200) NULL,
	[kuvaus_fi] [nvarchar](200) NULL,
	[kuvaus_sv] [nvarchar](200) NULL,
	[kuvaus_en] [nvarchar](200) NULL,
	[jarjestysnumero] [int] NULL,
	[alkupvm] [date] NULL,
	[loppupvm] [date] NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__d_varda_maksuluokka] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dw].[d_varda_maksunperuste]    Script Date: 13.9.2022 14:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[d_varda_maksunperuste](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[koodi] [nvarchar](100) NOT NULL,
	[nimi_fi] [nvarchar](200) NULL,
	[nimi_sv] [nvarchar](200) NULL,
	[nimi_en] [nvarchar](200) NULL,
	[kuvaus_fi] [nvarchar](200) NULL,
	[kuvaus_sv] [nvarchar](200) NULL,
	[kuvaus_en] [nvarchar](200) NULL,
	[alkupvm] [date] NULL,
	[loppupvm] [date] NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__d_varda_maksunperuste] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dw].[d_varda_tehtavanimike]    Script Date: 13.9.2022 14:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[d_varda_tehtavanimike](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[koodi] [nvarchar](100) NOT NULL,
	[nimi_fi] [nvarchar](200) NULL,
	[nimi_sv] [nvarchar](200) NULL,
	[nimi_en] [nvarchar](200) NULL,
	[kuvaus_fi] [nvarchar](200) NULL,
	[kuvaus_sv] [nvarchar](200) NULL,
	[kuvaus_en] [nvarchar](200) NULL,
	[alkupvm] [date] NULL,
	[loppupvm] [date] NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__d_varda_tehtavanimike] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dw].[d_varda_toiminnallinenpainotus]    Script Date: 13.9.2022 14:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[d_varda_toiminnallinenpainotus](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[koodi] [nvarchar](100) NOT NULL,
	[nimi_fi] [nvarchar](200) NULL,
	[nimi_sv] [nvarchar](200) NULL,
	[nimi_en] [nvarchar](200) NULL,
	[kuvaus_fi] [nvarchar](200) NULL,
	[kuvaus_sv] [nvarchar](200) NULL,
	[kuvaus_en] [nvarchar](200) NULL,
	[jarj_nro] [int] NULL,
	[alkupvm] [date] NULL,
	[loppupvm] [date] NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__d_varda_toiminnallinenpainotus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dw].[d_varda_toimintamuoto]    Script Date: 13.9.2022 14:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[d_varda_toimintamuoto](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[koodi] [nvarchar](100) NOT NULL,
	[nimi_fi] [nvarchar](200) NULL,
	[nimi_sv] [nvarchar](200) NULL,
	[nimi_en] [nvarchar](200) NULL,
	[kuvaus_fi] [nvarchar](200) NULL,
	[kuvaus_sv] [nvarchar](200) NULL,
	[kuvaus_en] [nvarchar](200) NULL,
	[alkupvm] [date] NULL,
	[loppupvm] [date] NULL,
	[jarjestys] [int] NOT NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__d_varda_toimintamuoto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dw].[d_varda_toimipaikkaluokitus]    Script Date: 13.9.2022 14:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[d_varda_toimipaikkaluokitus](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[koodi] [nvarchar](100) NOT NULL,
	[nimi_fi] [nvarchar](200) NULL,
	[nimi_sv] [nvarchar](200) NULL,
	[nimi_en] [nvarchar](200) NULL,
	[kuvaus_fi] [nvarchar](200) NULL,
	[kuvaus_sv] [nvarchar](200) NULL,
	[kuvaus_en] [nvarchar](200) NULL,
	[alkupvm] [date] NULL,
	[loppupvm] [date] NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__d_varda_toimipaikkaluokitus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dw].[d_varda_tuntimaara_asteikko]    Script Date: 13.9.2022 14:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[d_varda_tuntimaara_asteikko](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[koodi] [nvarchar](100) NOT NULL,
	[nimi_fi] [nvarchar](200) NULL,
	[nimi_sv] [nvarchar](200) NULL,
	[nimi_en] [nvarchar](200) NULL,
	[kuvaus_fi] [nvarchar](200) NULL,
	[kuvaus_sv] [nvarchar](200) NULL,
	[kuvaus_en] [nvarchar](200) NULL,
	[jarj_nro] [int] NOT NULL,
	[alkupvm] [date] NULL,
	[loppupvm] [date] NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__d_varda_tuntimaara_asteikko] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dw].[d_varda_tutkinto]    Script Date: 13.9.2022 14:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[d_varda_tutkinto](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[koodi] [nvarchar](100) NOT NULL,
	[nimi_fi] [nvarchar](400) NULL,
	[nimi_sv] [nvarchar](400) NULL,
	[nimi_en] [nvarchar](400) NULL,
	[kuvaus_fi] [nvarchar](400) NULL,
	[kuvaus_sv] [nvarchar](400) NULL,
	[kuvaus_en] [nvarchar](400) NULL,
	[alkupvm] [date] NULL,
	[loppupvm] [date] NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__d_varda_tutkinto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dw].[d_varda_tyoaika]    Script Date: 13.9.2022 14:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[d_varda_tyoaika](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[koodi] [nvarchar](100) NOT NULL,
	[nimi_fi] [nvarchar](200) NULL,
	[nimi_sv] [nvarchar](200) NULL,
	[nimi_en] [nvarchar](200) NULL,
	[kuvaus_fi] [nvarchar](200) NULL,
	[kuvaus_sv] [nvarchar](200) NULL,
	[kuvaus_en] [nvarchar](200) NULL,
	[alkupvm] [date] NULL,
	[loppupvm] [date] NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__d_varda_tyoaika] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dw].[d_varda_tyosuhde]    Script Date: 13.9.2022 14:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[d_varda_tyosuhde](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[koodi] [nvarchar](100) NOT NULL,
	[nimi_fi] [nvarchar](200) NULL,
	[nimi_sv] [nvarchar](200) NULL,
	[nimi_en] [nvarchar](200) NULL,
	[kuvaus_fi] [nvarchar](200) NULL,
	[kuvaus_sv] [nvarchar](200) NULL,
	[kuvaus_en] [nvarchar](200) NULL,
	[alkupvm] [date] NULL,
	[loppupvm] [date] NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__d_varda_tyosuhde] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dw].[d_varda_varhaiskasvatuspaikkaluokitus]    Script Date: 13.9.2022 14:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[d_varda_varhaiskasvatuspaikkaluokitus](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[koodi] [nvarchar](100) NOT NULL,
	[nimi_fi] [nvarchar](200) NULL,
	[nimi_sv] [nvarchar](200) NULL,
	[nimi_en] [nvarchar](200) NULL,
	[kuvaus_fi] [nvarchar](200) NULL,
	[kuvaus_sv] [nvarchar](200) NULL,
	[kuvaus_en] [nvarchar](200) NULL,
	[alkupvm] [date] NULL,
	[loppupvm] [date] NULL,
	[jarj_nro] [int] NOT NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__d_varda_varhaiskasvatuspaikkaluokitus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dw].[d_varda_yritysluokitus]    Script Date: 13.9.2022 14:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[d_varda_yritysluokitus](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[koodi] [nvarchar](100) NOT NULL,
	[nimi_fi] [nvarchar](200) NULL,
	[nimi_sv] [nvarchar](200) NULL,
	[nimi_en] [nvarchar](200) NULL,
	[kuvaus_fi] [nvarchar](200) NULL,
	[kuvaus_sv] [nvarchar](200) NULL,
	[kuvaus_en] [nvarchar](200) NULL,
	[yritysmuoto_ryhma_fi] [nvarchar](200) NULL,
	[yritysmuoto_ryhma_en] [nvarchar](200) NULL,
	[yritysmuoto_ryhma_sv] [nvarchar](200) NULL,
	[yritys_tyyppi] [nvarchar](200) NULL,
	[alkupvm] [date] NULL,
	[loppupvm] [date] NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__d_varda_yritysluokitus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dw].[d_varda_ikaryhma] ON 

GO
INSERT [dw].[d_varda_ikaryhma] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarj_nro], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (1, N'1', N'Alle 3 vuotta', N'Under 3 år', N'Younger than 3 years', N'Alle 3 vuotta', N'Under 3', N'Alle 3 vuotta', 1, CAST(N'2019-01-01' AS Date), NULL, CAST(N'2021-11-09T10:57:15.4233000' AS DateTime2), N'p_lataa_d_varda_ikaryhma', N'DWI\tvaisane')
GO
INSERT [dw].[d_varda_ikaryhma] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarj_nro], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (2, N'2', N'3 - 5 vuotta', N'3 - 5 år', N'3 - 5 years', N'3 - 5 vuotta', N'3 - 5 år', N'3 - 5 vuotta', 2, CAST(N'2019-01-01' AS Date), NULL, CAST(N'2021-11-09T10:57:15.4233000' AS DateTime2), N'p_lataa_d_varda_ikaryhma', N'DWI\tvaisane')
GO
INSERT [dw].[d_varda_ikaryhma] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarj_nro], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (3, N'3', N'6 vuotta', N'6 år', N'6 years', N'6 vuotta', N'6 år', N'6 vuotta', 3, CAST(N'2019-01-01' AS Date), NULL, CAST(N'2021-11-09T10:57:15.4233000' AS DateTime2), N'p_lataa_d_varda_ikaryhma', N'DWI\tvaisane')
GO
INSERT [dw].[d_varda_ikaryhma] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarj_nro], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (4, N'4', N'7 vuotta ja yli', N'7 år och över', N'7 vuotta ja yli', N'7 vuotta ja yli', N'7 år och över', N'7 vuotta ja yli', 4, CAST(N'2019-01-01' AS Date), NULL, CAST(N'2021-11-09T10:57:15.4233000' AS DateTime2), N'p_lataa_d_varda_ikaryhma', N'DWI\tvaisane')
GO
SET IDENTITY_INSERT [dw].[d_varda_ikaryhma] OFF
GO
SET IDENTITY_INSERT [dw].[d_varda_jarjestamismuoto] ON 

GO
INSERT [dw].[d_varda_jarjestamismuoto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarj_nro], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (1, N'JM01', N'Kunnan tai kuntayhtymän järjestämä', N'Anordnas av kommunen eller samkommunen', NULL, N'Kunnan tai kuntayhtymän järjestämä', N'Anordnas av kommunen eller samkommunen', NULL, 1, CAST(N'2019-01-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.6867000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_jarjestamismuoto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarj_nro], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (2, N'JM02', N'Ostopalvelu, kunnan tai kuntayhtymän järjestämä', N'Anordnas som köpt tjänst av kommunen eller samkommunen', NULL, N'Ostopalvelu, kunnan tai kuntayhtymän järjestämä', N'Anordnas som köpt tjänst av kommunen eller samkommunen', NULL, 2, CAST(N'2019-01-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.6867000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_jarjestamismuoto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarj_nro], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (3, N'JM03', N'Palveluseteli, kunnan tai kuntayhtymän järjestämä', N'Anordnas med servicesedlar', NULL, N'Palveluseteli, kunnan tai kuntayhtymän järjestämä', N'Anordnas med servicesedlar', NULL, 3, CAST(N'2019-01-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.6867000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_jarjestamismuoto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarj_nro], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (4, N'JM04', N'Yksityisen hoidon tuella järjestetty', N'Anordnas med hjälp av stödet för privat vård av barn', NULL, N'Yksityisen hoidon tuella järjestetty', N'Anordnas med hjälp av stödet för privat vård av barn', NULL, 4, CAST(N'2019-01-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.6867000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_jarjestamismuoto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarj_nro], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (5, N'JM05', N'Yksityinen varhaiskasvatus ilman yksityisen hoidon tukea', N'Privat småbarnspedagogik utan stöd för privat vård av barn', NULL, N'Yksityinen varhaiskasvatus ilman yksityisen hoidon tukea', N'Privat småbarnspedagogik utan stöd för privat vård av barn', NULL, 5, CAST(N'2020-01-27' AS Date), NULL, CAST(N'2022-09-13T02:50:23.6867000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
SET IDENTITY_INSERT [dw].[d_varda_jarjestamismuoto] OFF
GO
SET IDENTITY_INSERT [dw].[d_varda_kasvatusopillinenjarjestelma] ON 

GO
INSERT [dw].[d_varda_kasvatusopillinenjarjestelma] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (1, N'KJ01', N'Steiner-pedagogiikka', N'Steiner-pedagogik', NULL, N'Steiner-pedagoginen kasvatusopillinen järjestelmä', N'Steiner-pedagogik', NULL, CAST(N'2019-01-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.7167000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kasvatusopillinenjarjestelma] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (2, N'KJ02', N'Montessori-pedagogiikka', N'Montessori-pedagogik', NULL, N'Montessori-pedagogiikka', N'Montessori-pedagogik', NULL, CAST(N'2019-01-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.7167000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kasvatusopillinenjarjestelma] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (3, N'KJ03', N'Freinet-pedagogiikka', N'Freinet-pedagogik', NULL, N'Freinet-pedagoginen kasvatusopillinen järjestelmä', N'Freinet-pedagogik', NULL, CAST(N'2019-01-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.7167000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kasvatusopillinenjarjestelma] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (4, N'KJ04', N'Reggio Emilia –pedagogiikka', N'Reggio Emilia-pedagogik', NULL, N'Reggio Emilia –pedagoginen kasvatusopillinen järjestelmä', N'Reggio Emilia-pedagogik', NULL, CAST(N'2019-01-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.7167000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kasvatusopillinenjarjestelma] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (5, N'KJ05', N'Freireläinen pedagogiikka', N'Freire-pedagogik', NULL, N'Freireläinen pedagoginen kasvatusopillinen järjestelmä', N'Freire-pedagogik', NULL, CAST(N'2019-01-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.7167000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kasvatusopillinenjarjestelma] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (6, N'KJ98', N'Ei painotusta', N'Ingen inriktning', NULL, N'Ei painotusta', N'Ingen inriktning', NULL, CAST(N'2019-01-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.7167000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kasvatusopillinenjarjestelma] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (7, N'KJ99', N'Muu', N'Övrig inriktning', N'Other', N'Muu (-1.3.2022)', N'Övrig inriktning (-1.3.2022)', N'Other (-1.3.2022)', CAST(N'2019-01-01' AS Date), CAST(N'2022-03-01' AS Date), CAST(N'2022-09-13T02:50:23.7167000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
SET IDENTITY_INSERT [dw].[d_varda_kasvatusopillinenjarjestelma] OFF
GO
SET IDENTITY_INSERT [dw].[d_varda_kielikoodistoopetushallinto] ON 

GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (1, N'99', N'tuntematon', N'okänt', N'Other', N'tuntematon', N'okänt', N'Other', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (2, N'AA', N'afar', N'afar', N'Afar', N'afar', N'afar', N'Afar', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (3, N'AB', N'abhaasi', N'abchaziska', N'Abkhazian', N'abhaasi', N'abchaziska', N'Abkhazian', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (4, N'AE', N'avesta', N'avestiska', N'Avestan', N'avesta', N'avestiska', N'Avestan', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (5, N'AF', N'afrikaans', N'afrikaans', N'Afrikaans', N'afrikaans', N'afrikaans', N'Afrikaans', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (6, N'AK', N'akan', N'akan', N'Akan', N'akan', N'akan', N'Akan', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (7, N'AM', N'amhara', N'amhariska', N'Amharic', N'amhara', N'amhariska', N'Amharic', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (8, N'AN', N'aragonia', N'aragonska', N'Aragonese', N'aragonia', N'aragonska', N'Aragonese', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (9, N'AR', N'arabia', N'arabiska', N'Arabic', N'arabia', N'arabiska', N'Arabic', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (10, N'AS', N'assami', N'assamesiska', N'Assamese', N'assami', N'assamesiska', N'Assamese', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (11, N'AV', N'avaari', N'avariskt språk', N'Avar, Avarish', N'avaari', N'avariskt språk', N'Avar, Avarish', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (12, N'AY', N'aimara', N'aymará', N'Aymara', N'aimara', N'aymará', N'Aymara', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (13, N'AZ', N'azeri', N'azerbajdzjanska', N'Azerbaijani', N'azeri, aiemmin myös: azerbaidžani', N'azeri, aiemmin myös: azerbaidžani', N'azeri, aiemmin myös: azerbaidžani', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (14, N'BA', N'baškiiri', N'basjkiriska', N'Bashkir', N'baškiiri', N'basjkiriska', N'Bashkir', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (15, N'BE', N'valkovenäjä', N'vitryska', N'Belarusian', N'valkovenäjä', N'vitryska', N'Belarusian', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (16, N'BG', N'bulgaria', N'bulgariska', N'Bulgarian', N'bulgaria', N'bulgariska', N'Bulgarian', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (17, N'BH', N'bihari', N'bihari', N'Bihari', N'biharikieli, aiemmin: bihari', N'biharikieli, aiemmin: bihari', N'biharikieli, aiemmin: bihari', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (18, N'BI', N'bislama', N'bislama', N'Bislama', N'bislama', N'bislama', N'Bislama', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (19, N'BM', N'bambara', N'bambara', N'Bambara', N'bambara', N'bambara', N'Bambara', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (20, N'BN', N'bengali', N'bengali', N'Bengali, Bangla', N'bengali', N'bengali', N'Bengali, Bangla', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (21, N'BO', N'tiibet', N'tibetanska', N'Tibetan', N'tiibet', N'tibetanska', N'Tibetan', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (22, N'BR', N'bretoni', N'bretonska', N'Breton', N'bretoni', N'bretonska', N'Breton', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (23, N'BS', N'bosnia', N'bosniska', N'Bosnian', N'bosnia', N'bosniska', N'Bosnian', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (24, N'CA', N'katalaani', N'katalanska', N'Catalan', N'katalaani', N'katalanska', N'Catalan', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (25, N'CE', N'tšetšeeni', N'tjetjenska', N'Chechen', N'tšetšeeni', N'tjetjenska', N'Chechen', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (26, N'CH', N'tšamorro', N'chamorro', N'Chamorro', N'tšamorro', N'chamorro', N'Chamorro', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (27, N'CO', N'korsika', N'korsikanska', N'Corsican', N'korsika', N'korsikanska', N'Corsican', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (28, N'CR', N'cree', N'cree', N'Cree', N'cree', N'cree', N'Cree', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (29, N'CS', N'tšekki', N'tjeckiska', N'Czech', N'tšekki', N'tjeckiska', N'Czech', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (30, N'CU', N'kirkkoslaavi', N'kyrkoslaviska', N'Old Slavonic', N'kirkkoslaavi', N'kyrkoslaviska', N'Old Slavonic', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (31, N'CV', N'tšuvassi', N'tjuvasjiska', N'Chuvash', N'tšuvassi', N'tjuvasjiska', N'Chuvash', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (32, N'CY', N'kymri', N'kymriska', N'Welsh', N'kymri, aiemmin myös: wales', N'kymriska, tidigare även: wales', N'kymri, aiemmin myös: wales', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (33, N'DA', N'tanska', N'danska', N'Danish', N'tanska', N'danska', N'Danish', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (34, N'DE', N'saksa', N'tyska', N'German', N'saksa', N'tyska', N'German', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (35, N'DR', N'dari', NULL, NULL, N'dari', NULL, NULL, CAST(N'2019-01-11' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (36, N'DV', N'divehi', N'divehi', N'Divehi; Maldivian', N'divehi', N'divehi', N'Divehi; Maldivian', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (37, N'DZ', N'dzongkha', N'dzongkha', N'Dzongkha; Bhutani; Butanese', N'dzongkha, aiemmin myös: bhutani', N'dzongkha, aiemmin myös: bhutani', N'dzongkha, aiemmin myös: bhutani', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (38, N'EE', N'ewe', N'ewe', N'Ewe', N'ewe', N'ewe', N'Ewe', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (39, N'EL', N'kreikka', N'grekiska', N'Modern Greek', N'kreikka', N'grekiska', N'Modern Greek', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (40, N'EN', N'englanti', N'engelska', N'English', N'englanti', N'engelska', N'English', CAST(N'1990-01-01' AS Date), NULL, 8, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (41, N'EO', N'esperanto', N'esperanto', N'Esperanto', N'esperanto', N'esperanto', N'Esperanto', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (42, N'ES', N'espanja', N'spanska', N'Spanish, Castilian', N'espanja', N'spanska', N'Spanish, Castilian', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (43, N'ET', N'viro', N'estniska', N'Estonian', N'viro, aiemmin myös: eesti', N'viro, aiemmin myös: eesti', N'viro, aiemmin myös: eesti', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (44, N'EU', N'baski, euskara', N'baskiska', N'Basque', N'baski, euskara', N'baskiska', N'Basque', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (45, N'FA', N'persia, farsi', N'persiska', N'Persian, Farsi', N'persia, farsi', N'persiska', N'Persian, Farsi', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (46, N'FF', N'fulani', N'fulani', N'Fulah; Fula; Fulani; Fulfulde; Peul', N'fulani, aiemmin myös: fulfulde', N'fulani, aiemmin myös: fulfulde', N'fulani, aiemmin myös: fulfulde', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (47, N'FI', N'suomi', N'finska', N'Finnish', N'suomi', N'finska', N'Finnish', CAST(N'1990-01-01' AS Date), NULL, 1, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (48, N'FJ', N'fidži', N'fiji', N'Fijian', N'fidži', N'fiji', N'Fijian', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (49, N'FO', N'fääri', N'färiska', N'Faroese; Faeroese', N'fääri', N'färiska', N'Faroese; Faeroese', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (50, N'FR', N'ranska', N'franska', N'French', N'ranska', N'franska', N'French', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (51, N'FY', N'länsifriisi', N'frisiska', N'Frisian', N'länsifriisi, aiemmin: friisi', N'länsifriisi, aiemmin: friisi', N'länsifriisi, aiemmin: friisi', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (52, N'GA', N'iiri', N'iriska', N'Irish', N'iiri', N'iriska', N'Irish', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (53, N'GD', N'gaeli', N'skotsk gäliska', N'Gaelic, Scottish Gaelic', N'gaeli', N'skotsk gäliska', N'Gaelic, Scottish Gaelic', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (54, N'GG', N'guernsey', N'guernsey', N'Guernesiais', N'guernsey', N'guernsey', N'Guernesiais', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (55, N'GL', N'galicia', N'galiciska', N'Galician; Gallegan', N'galicia', N'galiciska', N'Galician; Gallegan', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (56, N'GN', N'guarani', N'guarani', N'Guarani', N'guarani', N'guarani', N'Guarani', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (57, N'GU', N'gudžarati', N'gujarati', N'Gujarati', N'gudžarati', N'gujarati', N'Gujarati', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (58, N'GV', N'manksi', N'manx', N'Manx', N'manksi', N'manx', N'Manx', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (59, N'HA', N'hausa', N'hausa', N'Hausa', N'hausa', N'hausa', N'Hausa', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (60, N'HE', N'heprea', N'hebreiska', N'Hebrew', N'heprea', N'hebreiska', N'Hebrew', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (61, N'HI', N'hindi', N'hindi', N'Hindi', N'hindi', N'hindi', N'Hindi', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (62, N'HO', N'hiri-motu', N'hirimotu', N'Hiri Motu', N'hiri-motu', N'hirimotu', N'Hiri Motu', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (63, N'HR', N'kroatia', N'kroatiska', N'Croatian', N'kroatia', N'kroatiska', N'Croatian', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (64, N'HT', N'haiti', N'haitiska, haitisk kreol', N'Haitian, Haitian Creole', N'haiti', N'haitiska, haitisk kreol', N'Haitian, Haitian Creole', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (65, N'HU', N'unkari', N'ungerska', N'Hungarian', N'unkari', N'ungerska', N'Hungarian', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (66, N'HY', N'armenia', N'armeniska', N'Armenian', N'armenia', N'armeniska', N'Armenian', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (67, N'HZ', N'herero', N'herero', N'Herero', N'herero', N'herero', N'Herero', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (68, N'IA', N'interlingua', N'interlingua', N'Interlingua', N'interlingua', N'interlingua', N'Interlingua', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (69, N'ID', N'indonesia', N'indonesiska', N'Indonesian', N'indonesia, aiemmin myös: bahasa indonesia', N'indonesia, aiemmin myös: bahasa indonesia', N'indonesia, aiemmin myös: bahasa indonesia', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (70, N'IE', N'interlingue, occidental', N'interlingue', N'Interlingua', N'interlingue, occidental', N'interlingue', N'Interlingua', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (71, N'IG', N'igbo', N'ibo', N'Igbo', N'igbo, aiemmin myös: ibo', N'igbo, aiemmin myös: ibo', N'igbo, aiemmin myös: ibo', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (72, N'II', N'inupiaq, inupiatun', N'sichuan yi', N'Sichuan Yi', N'inupiaq, inupiatun', N'sichuan yi', N'Sichuan Yi', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (73, N'IK', N'inupiaq', N'inupiak', N'Inupiaq', N'inupiaq', N'inupiak', N'Inupiaq', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (74, N'IM', N'mansaari', N'mansaari', NULL, N'mansaari', N'mansaari', NULL, CAST(N'1990-01-01' AS Date), CAST(N'1999-12-31' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (75, N'IO', N'ido', N'ido', N'Ido', N'ido', N'ido', N'Ido', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (76, N'IS', N'islanti', N'isländska', N'Icelandic', N'islanti', N'isländska', N'Icelandic', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (77, N'IT', N'italia', N'italienska', N'Italian', N'italia', N'italienska', N'Italian', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (78, N'IU', N'inuktitut', N'eskimåiska', N'Inuktitut', N'inuktitut', N'eskimåiska', N'Inuktitut', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (79, N'IW', N'Heprea (vanha)', N'Heprea (vanha)', N'Heprea (vanha)', N'ISO 639-standardissa vuonna 1988 poistunut koodi. Nykyään HE.', NULL, NULL, CAST(N'1988-01-01' AS Date), CAST(N'1988-12-31' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (80, N'JA', N'japani', N'japanska', N'Japanese', N'japani', N'japanska', N'Japanese', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (81, N'JE', N'jersey', N'jersey', N'Jerriais', N'jersey', N'jersey', N'Jerriais', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (82, N'JV', N'jaava', N'javanesiska', N'Javanese', N'jaava', N'javanesiska', N'Javanese', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (83, N'KA', N'georgia', N'georgiska', N'Georgian', N'georgia; aiemmin myös: gruusia', N'georgia; aiemmin myös: gruusia', N'georgia; aiemmin myös: gruusia', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (84, N'KE', N'karjala', N'karjala', N'Karjala', N'karjala', N'karjala', N'Karjala', CAST(N'2008-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (85, N'KG', N'kongo', N'kikongo', N'Kongo', N'kongo, aiemmin myös: kikongo', N'kongo, aiemmin myös: kikongo', N'kongo, aiemmin myös: kikongo', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (86, N'KI', N'kikuju', N'kikuyu', N'Kikuyu, Gikuyu', N'kikuju', N'kikuyu', N'Kikuyu, Gikuyu', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (87, N'KJ', N'kuanjama', N'kuanyama', N'Kwanyama, Kuanyama', N'kuanjama, aiemmin myös: kwanjama', N'kuanjama, aiemmin myös: kwanjama', N'kuanjama, aiemmin myös: kwanjama', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (88, N'KK', N'kazakki', N'kazakiska', N'Kazakh', N'kazakki', N'kazakiska', N'Kazakh', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (89, N'KL', N'kalaallisut, grönlanti', N'grönländska', N'Greenlandic, Kalaallisut', N'kalaallisut, grönlanti', N'grönländska', N'Greenlandic, Kalaallisut', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (90, N'KM', N'keskikhmer', N'khmeriska, kambodjanska', N'Cambodian, Khmer', N'keskikhmer, aiemmin: khmer, kambodža', N'keskikhmer, aiemmin: khmer, kambodža', N'keskikhmer, aiemmin: khmer, kambodža', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (91, N'KN', N'kannada', N'kannada', N'Kannada', N'kannada', N'kannada', N'Kannada', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (92, N'KO', N'korea', N'koreanska', N'Korean', N'korea', N'koreanska', N'Korean', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (93, N'KR', N'kanuri', N'kanuri', N'Kanuri', N'kanuri', N'kanuri', N'Kanuri', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (94, N'KS', N'kašmiri', N'kashmiri', N'Kashmiri', N'kašmiri', N'kashmiri', N'Kashmiri', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (95, N'KU', N'kurdi', N'kurdiska', N'Kurdish', N'kurdi', N'kurdiska', N'Kurdish', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (96, N'KUKU', N'kurdi kurmandzi', N'kurdi kurmandzi', N'Kurdi Kurmanji', N'kurdi kurmandzi Kurdi murre', N'kurdi kurmandzi Kurdi murre', N'Kurdi Kurmanji Kurdi murre', CAST(N'2022-01-31' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (97, N'KUSO', N'kurdi sorani', N'kurdi sorani', N'Kurdi Sorani', N'kurdi sorani kurdi murre', N'kurdi sorani kurdi murre', N'Kurdi Sorani kurdi murre', CAST(N'2022-01-31' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (98, N'KV', N'komi', N'komi', N'Komi', N'komi', N'komi', N'Komi', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (99, N'KW', N'korni', N'korniska', N'Cornish', N'korni', N'korniska', N'Cornish', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (100, N'KY', N'kirgiisi', N'kirgisiska', N'Kirghiz, Kyrgyz', N'kirgiisi', N'kirgisiska', N'Kirghiz, Kyrgyz', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (101, N'LA', N'latina', N'latin', N'Latin', N'latina', N'latin', N'Latin', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (102, N'LB', N'luxemburg, myös: letzeburg', N'letzebuergesch (luxemburgiska)', N'Luxembourgish', N'luxemburg, myös: letzeburg', N'letzebuergesch (luxemburgiska)', N'Luxembourgish', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (103, N'LG', N'ganda', N'luganda', N'Ganda; Luganda', N'ganda, aiemmin myös: luganda', N'ganda, aiemmin myös: luganda', N'ganda, aiemmin myös: luganda', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (104, N'LI', N'limburg', N'limburgiska', N'Limburgan, Limburger', N'limburg', N'limburgiska', N'Limburgan, Limburger', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (105, N'LN', N'lingala', N'lingala', N'Lingala', N'lingala', N'lingala', N'Lingala', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (106, N'LO', N'lao', N'lao', N'Laotian, Lao', N'lao', N'lao', N'Laotian, Lao', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (107, N'LT', N'liettua', N'litauiska', N'Lithuanian', N'liettua', N'litauiska', N'Lithuanian', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (108, N'LU', N'katanganluba', N'luba-katanga', N'Luba-Katanga', N'katanganluba, aiemmin myös: luba', N'katanganluba, aiemmin myös: luba', N'katanganluba, aiemmin myös: luba', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (109, N'LV', N'latvia', N'lettiska', N'Latvian', N'latvia, aiemmin myös: lätti', N'latvia, aiemmin myös: lätti', N'latvia, aiemmin myös: lätti', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (110, N'MG', N'malagasi', N'malagassiska', N'Malagasy', N'malagasi, aiemmin myös: madagassi', N'malagasi, aiemmin myös: madagassi', N'malagasi, aiemmin myös: madagassi', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (111, N'MH', N'marshall', N'marshall', N'Marshallese', N'marshall', N'marshall', N'Marshallese', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (112, N'MI', N'maori', N'maori', N'Maori', N'maori', N'maori', N'Maori', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (113, N'MK', N'makedonia', N'makedonska', N'Macedonian', N'makedonia', N'makedonska', N'Macedonian', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (114, N'ML', N'malajalam', N'malayalam', N'Malayalam', N'malajalam', N'malayalam', N'Malayalam', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (115, N'MN', N'mongoli', N'mongoliska', N'Mongolian', N'mongoli', N'mongoliska', N'Mongolian', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (116, N'MO', N'moldova', N'moldaviska', N'Moldavian', N'moldova, aiemmin: moldavia', N'moldova, aiemmin: moldavia', N'moldova, aiemmin: moldavia', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (117, N'MR', N'marathi', N'marathi', N'Marathi', N'marathi', N'marathi', N'Marathi', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (118, N'MS', N'malaiji', N'malajiska', N'Malay', N'malaiji', N'malajiska', N'Malay', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (119, N'MT', N'malta', N'maltesiska', N'Maltese', N'malta', N'maltesiska', N'Maltese', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (120, N'MY', N'burma', N'burmanska', N'Burmese, Myanmar', N'burma', N'burmanska', N'Burmese, Myanmar', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (121, N'NA', N'nauru', N'nauru', N'Nauruan', N'nauru', N'nauru', N'Nauruan', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (122, N'NB', N'norjan bokmål', N'bokmål', N'Norwegian Bokmål', N'norjan bokmål, aiemmin myös: kirjanorja', N'norjan bokmål, aiemmin myös: kirjanorja', N'norjan bokmål, aiemmin myös: kirjanorja', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (123, N'ND', N'pohjoisndebele', N'ndebele (nord)', N'North Ndebele', N'pohjoisndebele', N'ndebele nord', N'North Ndebele', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (124, N'NE', N'nepali', N'nepali', N'Nepali', N'nepali', N'nepali', N'Nepali', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (125, N'NG', N'ndonga', N'ndonga', N'Ndonga', N'ndonga', N'ndonga', N'Ndonga', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (126, N'NL', N'hollanti', N'holländska', N'Dutch', N'hollanti', N'holländska', N'Dutch', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (127, N'NN', N'norjan nynorsk', N'nynorsk', N'Norwegian Nynorsk', N'norjan nynorsk, aiemmin myös: uusnorja', N'norjan nynorsk, aiemmin myös: uusnorja', N'norjan nynorsk, aiemmin myös: uusnorja', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (128, N'NO', N'norja', N'norska', N'Norwegian', N'norja', N'norska', N'Norwegian', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (129, N'NR', N'etelä-ndebele', N'ndebele (syd)', N'South Ndebele', N'etelä-ndebele', N'ndebele (syd)', N'South Ndebele', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (130, N'NV', N'navajo', N'navaho', N'Navajo, Navaho', N'navajo', N'navaho', N'Navajo, Navaho', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (131, N'NY', N'njandža, myös: tšitšewa, tšewa', N'nyanja', N'Chichewa, Cheva, Nyanja', N'njandža, myös: tšitšewa, tšewa', N'nyanja', N'Chichewa, Cheva, Nyanja', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (132, N'OC', N'oksitaani, provensaali', N'occitanska, provensalska', N'Occitan, Provencal', N'oksitaani, provensaali', N'occitanska, provensalska', N'Occitan, Provencal', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (133, N'OJ', N'odžibwa', N'ojibwa', N'Ojibwa', N'odžibwa', N'ojibwa', N'Ojibwa', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (134, N'OM', N'oromo', N'oromo', N'Afan Oromo; Oromo', N'oromo, aiemmin myös: afan oromo', N'oromo, aiemmin myös: afan oromo', N'oromo, aiemmin myös: afan oromo', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (135, N'OR', N'orija', N'oriya', N'Oriya', N'orija', N'oriya', N'Oriya', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (136, N'OS', N'osseetti', N'ossetiska', N'Ossetian, Ossetic', N'osseetti', N'ossetiska', N'Ossetian, Ossetic', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (137, N'PA', N'pandžabi', N'panjabi', N'Punjabi, Panjabi', N'pandžabi', N'panjabi', N'Punjabi, Panjabi', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (138, N'PI', N'paali', N'pali', N'Paali', N'paali', N'pali', N'Pali', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (139, N'PL', N'puola', N'polska', N'Polish', N'puola', N'polska', N'Polish', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (140, N'PS', N'paštu, myös: afgaani', N'pashto', N'Pashto, Pushto', N'paštu, myös: afgaani', N'paštu, myös: afgaani', N'paštu, myös: afgaani', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (141, N'PT', N'portugali', N'portugisiska', N'Portuguese', N'portugali', N'portugisiska', N'Portuguese', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (142, N'QU', N'ketšua', N'kechua', N'Quechua', N'ketšua', N'kechua', N'Quechua', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (143, N'RI', N'romani', N'romani', N'Romani', N'romani', N'romani', N'Romani', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (144, N'RM', N'retoromaani', N'rätoromanska', N'Rhaeto-Romance', N'retoromaani', N'rätoromanska', N'Rhaeto-Romance', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (145, N'RN', N'rundi', N'rundi, kirundi', N'Kirundi; Rundi', N'rundi, aiemmin myös: kirundi', N'rundi, aiemmin myös: kirundi', N'rundi, aiemmin myös: kirundi', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (146, N'RO', N'romania', N'rumänska', N'Romanian', N'romania', N'rumänska', N'Romanian', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (147, N'RU', N'venäjä', N'ryska', N'Russian', N'venäjä', N'ryska', N'Russian', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (148, N'RW', N'ruanda', N'kinyarwanda', N'Kinyarwanda, Rwanda', N'ruanda, aiemmin myös: kinjaruanda, njaruanda', N'ruanda, aiemmin myös: kinjaruanda, njaruanda', N'ruanda, aiemmin myös: kinjaruanda, njaruanda', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (149, N'SA', N'sanskrit', N'sanskrit', N'Sanskrit', N'sanskrit', N'sanskrit', N'Sanskrit', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (150, N'SC', N'sardi', N'sardiska', N'Sardinian', N'sardi', N'sardiska', N'Sardinian', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (151, N'SD', N'sindhi', N'sindhi', N'Sindhi', N'sindhi', N'sindhi', N'Sindhi', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (152, N'SE', N'saame', N'samiska', N'Sami', N'saame', N'samiska', N'Sami', CAST(N'1990-01-01' AS Date), NULL, 3, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (153, N'SEIN', N'inarinsaame', N'enaresamiska', N'Inari Sami', N'inarinsaame', N'enaresamiska', N'Inari Sami', CAST(N'2019-01-11' AS Date), NULL, 4, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (154, N'SEKO', N'koltansaame', N'skoltsamiska', N'Skolt Sami', N'kolttasaame', N'skoltsamiska', N'Skolt Sami', CAST(N'2019-01-11' AS Date), NULL, 5, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (155, N'SEPO', N'pohjoissaame', N'nordsamiska', N'Northern Sami', N'pohjoissaame', N'nordsamiska', N'Northern Sami', CAST(N'1990-01-01' AS Date), NULL, 6, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (156, N'SG', N'sango', N'sango', N'Sango, Sangho', N'sango', N'sango', N'Sango, Sangho', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (157, N'SH', N'serbokroatia', N'serbokroatiska', N'Serbo-Croatian', N'serbokroatia, serbokroatiska', N'serbokroatiska', N'Serbo-Croatian', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (158, N'SI', N'sinhala', N'singalesiska', N'Sinhala; Sinhalese; Singhalese', N'sinhala, aiemmin: singali', N'sinhala, aiemmin: singali', N'sinhala, aiemmin: singali', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (159, N'SK', N'slovakki', N'slovakiska', N'Slovak', N'slovakki', N'slovakiska', N'Slovak', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (160, N'SL', N'sloveeni', N'slovenska', N'Slovenian', N'sloveeni', N'slovenska', N'Slovenian', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (161, N'SM', N'samoa', N'samoanska', N'Samoan', N'samoa', N'samoanska', N'Samoan', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (162, N'SN', N'šona', N'shona', N'Shona', N'šona, aiemmin: shona', N'šona, aiemmin: shona', N'šona, aiemmin: shona', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (163, N'SO', N'somali', N'somaliska', N'Somali', N'somali', N'somaliska', N'Somali', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (164, N'SQ', N'albania', N'albanska', N'Albanian', N'albania', N'albanska', N'Albanian', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (165, N'SR', N'serbia', N'serbiska', N'Serbian', N'serbia', N'serbiska', N'Serbian', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (166, N'SS', N'swazi', N'swazi', N'Siswati, Swazi, Swati', N'swazi, aiemmin myös: siswati', N'swazi, aiemmin myös: siswati', N'swazi, aiemmin myös: siswati', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (167, N'ST', N'eteläsotho', N'sotho', N'Sesotho, Southern Sotho', N'eteläsotho', N'sotho', N'Sesotho, Southern Sotho', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (168, N'SU', N'sunda', N'sundanesiska', N'Sundanese', N'sunda', N'sundanesiska', N'Sundanese', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (169, N'SV', N'ruotsi', N'svenska', N'Swedish', N'ruotsi', N'svenska', N'Swedish', CAST(N'1990-01-01' AS Date), NULL, 2, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (170, N'SW', N'suahili', N'swahili', N'Swahili, Kiswahili', N'swahili, aiemmin myös: suahili', N'swahili, aiemmin myös: suahili', N'swahili, aiemmin myös: suahili', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (171, N'TA', N'tamili', N'tamili', N'Tamil', N'tamili', N'tamili', N'Tamil', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (172, N'TE', N'telugu', N'telugu', N'Telegu', N'telugu', N'telugu', N'Telegu', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (173, N'TG', N'tadžikki', N'tadzjikiska', N'Tajiki', N'tadžikki', N'tadzjikiska', N'Tajiki', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (174, N'TH', N'thai', N'thai', N'Thai', N'thai', N'thai', N'Thai', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (175, N'TI', N'tigrinja', N'tigrinja', N'Tigrinya', N'tigrinja', N'tigrinja', N'Tigrinya', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (176, N'TK', N'turkmeeni', N'turkmeniska', N'Turkmen', N'turkmeeni', N'turkmeniska', N'Turkmen', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (177, N'TL', N'tagalog', N'tagalog', N'Tagalog', N'tagalog, aiemmin myös: pilipino', N'tagalog, aiemmin myös: pilipino', N'tagalog, aiemmin myös: pilipino', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (178, N'TN', N'tswana', N'tswana', N'Setswana, Tswana', N'tswana', N'tswana', N'Setswana, Tswana', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (179, N'TO', N'tongantonga', N'tonga', N'Tongan (Tonga Islands)', N'tongantonga', N'tonga', N'Tongan (Tonga Islands)', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (180, N'TR', N'turkki', N'turkiska', N'Turkish', N'turkki', N'turkiska', N'Turkish', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (181, N'TS', N'tsonga', N'tsonga', N'Tsonga', N'tsonga', N'tsonga', N'Tsonga', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (182, N'TT', N'tataari', N'tatariska', N'Tatar', N'tataari', N'tatariska', N'Tatar', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (183, N'TW', N'twi', N'twi', N'Twi', N'twi', N'twi', N'Twi', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (184, N'TY', N'tahiti', N'tahitiska', N'Tahitian', N'tahiti', N'tahitiska', N'Tahitian', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (185, N'UG', N'uiguuri', N'uiguriska', N'Uighur', N'uiguuri', N'uiguriska', N'Uighur', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (186, N'UK', N'ukraina', N'ukrainska', N'Ukrainian', N'ukraina', N'ukrainska', N'Ukrainian', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (187, N'UR', N'urdu', N'urdu', N'Urdu', N'urdu', N'urdu', N'Urdu', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (188, N'UZ', N'uzbekki', N'uzbekiska', N'Uzbek', N'uzbekki', N'uzbekiska', N'Uzbek', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (189, N'VE', N'venda', N'venda', N'Venda', N'venda', N'venda', N'Venda', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (190, N'VI', N'vietnam', N'vietnamesiska', N'Vietnamese', N'vietnam', N'vietnamesiska', N'Vietnamese', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (191, N'VK', N'viittomakieli', N'teckenspråk', N'Sign language', N'viittomakieli', N'teckenspråk', N'Sign language', CAST(N'1990-01-01' AS Date), NULL, 7, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (192, N'VO', N'volapük', N'volapyk', N'Volapük', N'volapük', N'volapyk', N'Volapük', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (193, N'WA', N'valloni', N'vallonska', N'Walloon', N'valloni', N'vallonska', N'Walloon', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (194, N'WO', N'wolof', N'wolof', N'Wolof', N'wolof', N'wolof', N'Wolof', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (195, N'XH', N'xhosa', N'xhosa', N'Xhosa', N'xhosa', N'xhosa', N'Xhosa', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (196, N'XX', N'muu kieli', N'övrigt språk', N'Other languages', N'muu kieli', N'övrigt språk', N'Other languages', CAST(N'1990-01-01' AS Date), NULL, 9, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (197, N'YI', N'jiddiš', N'jiddisch', N'Yiddish', N'jiddiš, aiemmin myös: jiddi', N'jiddiš, aiemmin myös: jiddi', N'jiddiš, aiemmin myös: jiddi', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (198, N'YO', N'joruba', N'joruba', N'Yoruba', N'joruba', N'joruba', N'Yoruba', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (199, N'ZA', N'zhuang', N'tšuang', N'Zhuang, Chuang', N'zhuang', N'tšuang', N'zhuang', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (200, N'ZH', N'kiina', N'kinesiska', N'Chinese', N'kiina', N'kinesiska', N'Chinese', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_kielikoodistoopetushallinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (201, N'ZU', N'zulu', N'zulu', N'Zulu', N'zulu', N'zulu', N'Zulu', CAST(N'1990-01-01' AS Date), NULL, NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
SET IDENTITY_INSERT [dw].[d_varda_kielikoodistoopetushallinto] OFF
GO
SET IDENTITY_INSERT [dw].[d_varda_kytkin] ON 

GO
INSERT [dw].[d_varda_kytkin] ([id], [kytkin_luokka], [kytkin_koodi], [kytkin_fi], [kytkin_sv], [kytkin_en], [jarjestys_kytkin_koodi], [alkamis_pvm], [paattymis_pvm], [loadtime], [source], [username]) VALUES (-1, N'Tieto puuttuu', N'-1', N'Tieto puuttuu', N'Information saknas', N'Information missing', -1, CAST(N'2019-01-01' AS Date), NULL, CAST(N'2021-11-17T16:08:09.993' AS DateTime), N'p_lataa_d_varda_kytkin', N'DWI\tvaisane')
GO
INSERT [dw].[d_varda_kytkin] ([id], [kytkin_luokka], [kytkin_koodi], [kytkin_fi], [kytkin_sv], [kytkin_en], [jarjestys_kytkin_koodi], [alkamis_pvm], [paattymis_pvm], [loadtime], [source], [username]) VALUES (1, N'vakapaatos_kokopaivainen_vaka', N'0', N'Osapäiväinen varhaiskasvatus', N'Halvdagsverksamhet', N'EN Osapäiväinen varhaiskasvatus', 2, CAST(N'2019-01-01' AS Date), NULL, CAST(N'2021-11-17T16:08:09.993' AS DateTime), N'p_lataa_d_varda_kytkin', N'DWI\tvaisane')
GO
INSERT [dw].[d_varda_kytkin] ([id], [kytkin_luokka], [kytkin_koodi], [kytkin_fi], [kytkin_sv], [kytkin_en], [jarjestys_kytkin_koodi], [alkamis_pvm], [paattymis_pvm], [loadtime], [source], [username]) VALUES (2, N'vakapaatos_kokopaivainen_vaka', N'1', N'Kokopäiväinen varhaiskasvatus', N'Heldagsverksamhet', N'EN Kokopäiväinen varhaiskasvatus', 1, CAST(N'2019-01-01' AS Date), NULL, CAST(N'2021-11-17T16:08:09.993' AS DateTime), N'p_lataa_d_varda_kytkin', N'DWI\tvaisane')
GO
INSERT [dw].[d_varda_kytkin] ([id], [kytkin_luokka], [kytkin_koodi], [kytkin_fi], [kytkin_sv], [kytkin_en], [jarjestys_kytkin_koodi], [alkamis_pvm], [paattymis_pvm], [loadtime], [source], [username]) VALUES (3, N'vakapaatos_paivittainen_vaka', N'0', N'Osaviikkoinen varhaiskasvatus', N'Ordnas under en del av veckan', N'EN Osaviikkoinen varhaiskasvatus', 2, CAST(N'2019-01-01' AS Date), NULL, CAST(N'2021-11-17T16:08:09.993' AS DateTime), N'p_lataa_d_varda_kytkin', N'DWI\tvaisane')
GO
INSERT [dw].[d_varda_kytkin] ([id], [kytkin_luokka], [kytkin_koodi], [kytkin_fi], [kytkin_sv], [kytkin_en], [jarjestys_kytkin_koodi], [alkamis_pvm], [paattymis_pvm], [loadtime], [source], [username]) VALUES (4, N'vakapaatos_paivittainen_vaka', N'1', N'Päivittäinen varhaiskasvatus', N'Ordnas dagligen', N'EN Päivittäinen varhaiskasvatus', 1, CAST(N'2019-01-01' AS Date), NULL, CAST(N'2021-11-17T16:08:09.993' AS DateTime), N'p_lataa_d_varda_kytkin', N'DWI\tvaisane')
GO
SET IDENTITY_INSERT [dw].[d_varda_kytkin] OFF
GO
SET IDENTITY_INSERT [dw].[d_varda_maksuluokka] ON 

GO
INSERT [dw].[d_varda_maksuluokka] ([id], [koodi], [tilastovuosi], [max_arvo], [yritystyyppi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarjestysnumero], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (1, N'-1', 2000, 0, NULL, N'Tieto puuttuu', N'Information saknas', N'Information missing', N'Tieto puuttuu', N'Information saknas', N'Information missing', 999, CAST(N'2021-04-14' AS Date), NULL, CAST(N'2022-03-02T12:55:53.9233000' AS DateTime2), N'p_lataa_d_varda_maksuluokka', N'DWI\tvaisane')
GO
INSERT [dw].[d_varda_maksuluokka] ([id], [koodi], [tilastovuosi], [max_arvo], [yritystyyppi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarjestysnumero], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (2, N'1', 2020, 27, N'Kunta', N'Maksu 0 €', N'Avgift 0 €', N'Käännös puuttuu', N'Maksu 0 €', N'Avgift 0 €', N'Käännös puuttuu', 1, CAST(N'2021-04-14' AS Date), NULL, CAST(N'2022-03-02T12:55:53.9233000' AS DateTime2), N'p_lataa_d_varda_maksuluokka', N'DWI\tvaisane')
GO
INSERT [dw].[d_varda_maksuluokka] ([id], [koodi], [tilastovuosi], [max_arvo], [yritystyyppi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarjestysnumero], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (3, N'2', 2020, 288, N'Kunta', N'Asiakasmaksu pienimmän kerättävän ja enimmäismaksun välillä', N'Klientavgift mellan den lägsta debiterade och den maximala avgiften', N'Käännös puuttuu', N'Asiakasmaksu pienimmän kerättävän ja enimmäismaksun välillä', N'Klientavgift mellan den lägsta debiterade och den maximala avgiften', N'Käännös puuttuu', 2, CAST(N'2021-04-14' AS Date), NULL, CAST(N'2022-03-02T12:55:53.9233000' AS DateTime2), N'p_lataa_d_varda_maksuluokka', N'DWI\tvaisane')
GO
INSERT [dw].[d_varda_maksuluokka] ([id], [koodi], [tilastovuosi], [max_arvo], [yritystyyppi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarjestysnumero], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (4, N'3', 2020, NULL, N'Kunta', N'Enimmäismaksu', N'Högsta avgift', N'Käännös puuttuu', N'Enimmäismaksu', N'Högsta avgift', N'Käännös puuttuu', 3, CAST(N'2021-04-14' AS Date), NULL, CAST(N'2022-03-02T12:55:53.9233000' AS DateTime2), N'p_lataa_d_varda_maksuluokka', N'DWI\tvaisane')
GO
INSERT [dw].[d_varda_maksuluokka] ([id], [koodi], [tilastovuosi], [max_arvo], [yritystyyppi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarjestysnumero], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (5, N'4', 2020, 290, N'Yksityinen', N'0-290 €', N'0-290 €', N'0-290 €', N'0-290 €', N'0-290 €', N'0-290 €', 4, CAST(N'2021-04-14' AS Date), NULL, CAST(N'2022-03-02T12:55:53.9233000' AS DateTime2), N'p_lataa_d_varda_maksuluokka', N'DWI\tvaisane')
GO
INSERT [dw].[d_varda_maksuluokka] ([id], [koodi], [tilastovuosi], [max_arvo], [yritystyyppi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarjestysnumero], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (6, N'5', 2020, 400, N'Yksityinen', N'291-400 €', N'291-400 €', N'291-400 €', N'291-400 €', N'291-400 €', N'291-400 €', 5, CAST(N'2021-04-14' AS Date), NULL, CAST(N'2022-03-02T12:55:53.9233000' AS DateTime2), N'p_lataa_d_varda_maksuluokka', N'DWI\tvaisane')
GO
INSERT [dw].[d_varda_maksuluokka] ([id], [koodi], [tilastovuosi], [max_arvo], [yritystyyppi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarjestysnumero], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (7, N'6', 2020, 500, N'Yksityinen', N'401-500 €', N'401-500 €', N'401-500 €', N'401-500 €', N'401-500 €', N'401-500 €', 6, CAST(N'2021-04-14' AS Date), NULL, CAST(N'2022-03-02T12:55:53.9233000' AS DateTime2), N'p_lataa_d_varda_maksuluokka', N'DWI\tvaisane')
GO
INSERT [dw].[d_varda_maksuluokka] ([id], [koodi], [tilastovuosi], [max_arvo], [yritystyyppi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarjestysnumero], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (8, N'7', 2020, NULL, N'Yksityinen', N'Yli 500 €', N'Yli 500 €', N'Yli 500 €', N'Yli 500 €', N'Yli 500 €', N'Yli 500 €', 7, CAST(N'2021-04-14' AS Date), NULL, CAST(N'2022-03-02T12:55:53.9233000' AS DateTime2), N'p_lataa_d_varda_maksuluokka', N'DWI\tvaisane')
GO
INSERT [dw].[d_varda_maksuluokka] ([id], [koodi], [tilastovuosi], [max_arvo], [yritystyyppi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarjestysnumero], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (9, N'1', 2021, 27, N'Kunta', N'Maksu 0 €', N'Avgift 0 €', N'Käännös puuttuu', N'Maksu 0 €', N'Avgift 0 €', N'Käännös puuttuu', 1, CAST(N'2021-04-14' AS Date), NULL, CAST(N'2022-03-02T12:55:53.9233000' AS DateTime2), N'p_lataa_d_varda_maksuluokka', N'DWI\tvaisane')
GO
INSERT [dw].[d_varda_maksuluokka] ([id], [koodi], [tilastovuosi], [max_arvo], [yritystyyppi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarjestysnumero], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (10, N'2', 2021, 288, N'Kunta', N'Asiakasmaksu pienimmän kerättävän ja enimmäismaksun välillä', N'Klientavgift mellan den lägsta debiterade och den maximala avgiften', N'Käännös puuttuu', N'Asiakasmaksu pienimmän kerättävän ja enimmäismaksun välillä', N'Klientavgift mellan den lägsta debiterade och den maximala avgiften', N'Käännös puuttuu', 2, CAST(N'2021-04-14' AS Date), NULL, CAST(N'2022-03-02T12:55:53.9233000' AS DateTime2), N'p_lataa_d_varda_maksuluokka', N'DWI\tvaisane')
GO
INSERT [dw].[d_varda_maksuluokka] ([id], [koodi], [tilastovuosi], [max_arvo], [yritystyyppi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarjestysnumero], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (11, N'3', 2021, NULL, N'Kunta', N'Enimmäismaksu', N'Högsta avgift', N'Käännös puuttuu', N'Enimmäismaksu', N'Högsta avgift', N'Käännös puuttuu', 3, CAST(N'2021-04-14' AS Date), NULL, CAST(N'2022-03-02T12:55:53.9233000' AS DateTime2), N'p_lataa_d_varda_maksuluokka', N'DWI\tvaisane')
GO
INSERT [dw].[d_varda_maksuluokka] ([id], [koodi], [tilastovuosi], [max_arvo], [yritystyyppi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarjestysnumero], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (12, N'4', 2021, 290, N'Yksityinen', N'0-290 €', N'0-290 €', N'0-290 €', N'0-290 €', N'0-290 €', N'0-290 €', 4, CAST(N'2021-04-14' AS Date), NULL, CAST(N'2022-03-02T12:55:53.9233000' AS DateTime2), N'p_lataa_d_varda_maksuluokka', N'DWI\tvaisane')
GO
INSERT [dw].[d_varda_maksuluokka] ([id], [koodi], [tilastovuosi], [max_arvo], [yritystyyppi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarjestysnumero], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (14, N'5', 2021, 400, N'Yksityinen', N'291-400 €', N'291-400 €', N'291-400 €', N'291-400 €', N'291-400 €', N'291-400 €', 5, CAST(N'2021-04-14' AS Date), NULL, CAST(N'2022-03-02T12:55:53.9233000' AS DateTime2), N'p_lataa_d_varda_maksuluokka', N'DWI\tvaisane')
GO
INSERT [dw].[d_varda_maksuluokka] ([id], [koodi], [tilastovuosi], [max_arvo], [yritystyyppi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarjestysnumero], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (15, N'6', 2021, 500, N'Yksityinen', N'401-500 €', N'401-500 €', N'401-500 €', N'401-500 €', N'401-500 €', N'401-500 €', 6, CAST(N'2021-04-14' AS Date), NULL, CAST(N'2022-03-02T12:55:53.9233000' AS DateTime2), N'p_lataa_d_varda_maksuluokka', N'DWI\tvaisane')
GO
INSERT [dw].[d_varda_maksuluokka] ([id], [koodi], [tilastovuosi], [max_arvo], [yritystyyppi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarjestysnumero], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (16, N'7', 2021, NULL, N'Yksityinen', N'Yli 500 €', N'Yli 500 €', N'Yli 500 €', N'Yli 500 €', N'Yli 500 €', N'Yli 500 €', 7, CAST(N'2021-04-14' AS Date), NULL, CAST(N'2022-03-02T12:55:53.9233000' AS DateTime2), N'p_lataa_d_varda_maksuluokka', N'DWI\tvaisane')
GO
SET IDENTITY_INSERT [dw].[d_varda_maksuluokka] OFF
GO
SET IDENTITY_INSERT [dw].[d_varda_maksunperuste] ON 

GO
INSERT [dw].[d_varda_maksunperuste] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (1, N'MP01', N'Yleinen maksuttomuus', N'Allmän avgiftsfrihet', NULL, N'Yleinen maksuttomuus', N'Allmän avgiftsfrihet', NULL, CAST(N'2019-09-02' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8733000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_maksunperuste] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (2, N'MP02', N'Osittainen maksuttomuus', N'Partiell avgiftsfrihet', NULL, N'Osittainen maksuttomuus', N'Partiell avgiftsfrihet', NULL, CAST(N'2019-09-02' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8733000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_maksunperuste] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (3, N'MP03', N'Maksu', N'Avgift', NULL, N'Maksu', N'Avgift', NULL, CAST(N'2019-09-02' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8733000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
SET IDENTITY_INSERT [dw].[d_varda_maksunperuste] OFF
GO
SET IDENTITY_INSERT [dw].[d_varda_tehtavanimike] ON 

GO
INSERT [dw].[d_varda_tehtavanimike] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (1, N'39407', N'Perhepäivähoitaja', N'Familjedagvårdare', NULL, N'Perhepäivähoitaja', N'Familjedagvårdare', NULL, CAST(N'2019-08-28' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tehtavanimike] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (2, N'41712', N'Steinerpedagoginen varhaiskasvattaja', N'Steinerpedagog inom småbarnspedagogik', NULL, N'Steinerpedagoginen varhaiskasvattaja', N'Steinerpedagog inom småbarnspedagogik', NULL, CAST(N'2020-01-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tehtavanimike] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (3, N'43525', N'Päiväkodin johtaja', N'Daghemsföreståndare', NULL, N'Päiväkodin johtaja', N'Daghemsföreståndare', NULL, CAST(N'2019-08-28' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tehtavanimike] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (4, N'64212', N'Varhaiskasvatuksen opettaja', N'Lärare inom småbarnspedagogik', NULL, N'Varhaiskasvatuksen opettaja', N'Lärare inom småbarnspedagogik', NULL, CAST(N'2019-08-28' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tehtavanimike] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (5, N'77826', N'Varhaiskasvatuksen erityisopettaja', N'Speciallärare inom småbarnspedagogik', NULL, N'Varhaiskasvatuksen erityisopettaja', N'Speciallärare inom småbarnspedagogik', NULL, CAST(N'2019-08-28' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tehtavanimike] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (6, N'81787', N'Varhaiskasvatuksen avustaja', N'Assistent inom småbarnspedagogik', NULL, N'Varhaiskasvatuksen avustaja', N'Assistent inom småbarnspedagogik', NULL, CAST(N'2019-08-28' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tehtavanimike] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (7, N'84053', N'Varhaiskasvatuksen sosionomi', N'Socionom inom småbarnspedagogik', NULL, N'Varhaiskasvatuksen sosionomi', N'Socionom inom småbarnspedagogik', NULL, CAST(N'2019-08-28' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tehtavanimike] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (8, N'84724', N'Varhaiskasvatuksen lastenhoitaja', N'Barnskötare inom småbarnspedagogik', NULL, N'Varhaiskasvatuksen lastenhoitaja', N'Barnskötare inom småbarnspedagogik', NULL, CAST(N'2019-08-28' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
SET IDENTITY_INSERT [dw].[d_varda_tehtavanimike] OFF
GO
SET IDENTITY_INSERT [dw].[d_varda_toiminnallinenpainotus] ON 

GO
INSERT [dw].[d_varda_toiminnallinenpainotus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarj_nro], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (1, N'TP01', N'Musiikki', N'Musik', N'Music', N'Monipuolisen varhaiskasvatustoiminnan lisäksi varhaiskasvatustoiminnassa painotetaan musiikkia.', N'Förutom mångsidig småbarnspedagogisk verksamhet betonas musik i småbarnspedagogiken.', N'Music', 1, CAST(N'2019-01-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.7633000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_toiminnallinenpainotus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarj_nro], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (2, N'TP02', N'Liikunta', N'Gymnastik', N'Physical education', N'Monipuolisen varhaiskasvatustoiminnan lisäksi varhaiskasvatustoiminnassa painotetaan liikuntaa.', N'Förutom mångsidig småbarnspedagogisk verksamhet betonas gymnastik i småbarnspedagogiken.', N'Physical education', 2, CAST(N'2019-01-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.7633000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_toiminnallinenpainotus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarj_nro], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (3, N'TP03', N'Kuvataide', N'Bildkonst', NULL, N'Monipuolisen varhaiskasvatustoiminnan lisäksi varhaiskasvatustoiminnassa painotetaan kuvataidetta.', N'Förutom mångsidig småbarnspedagogisk verksamhet betonas bildkonst i småbarnspedagogiken.', NULL, 3, CAST(N'2019-01-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.7633000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_toiminnallinenpainotus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarj_nro], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (4, N'TP04', N'Tiede', N'Vetenskap', N'Science', N'Monipuolisen varhaiskasvatustoiminnan lisäksi varhaiskasvatustoiminnassa painotetaan tutkimista ja tiedettä.', N'Förutom mångsidig småbarnspedagogisk verksamhet betonas forskning och vetenskap i småbarnspedagogiken.', N'Science', 4, CAST(N'2019-01-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.7633000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_toiminnallinenpainotus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarj_nro], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (5, N'TP05', N'Draama ja teatteritaide', N'Drama och teater', N'Drama', N'Monipuolisen varhaiskasvatustoiminnan lisäksi varhaiskasvatustoiminnassa painotetaan draamaa, tanssia, sanataidetta, sirkustaidetta tai teatteritaidetta.', N'Förutom mångsidig småbarnspedagogisk verksamhet betonas drama, dans, ordkonst, cirkuskonst eller teater i småbarnspedagogiken.', N'Drama', 5, CAST(N'2019-01-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.7633000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_toiminnallinenpainotus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarj_nro], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (6, N'TP06', N'Ympäristö ja luonto', N'Miljö och natur', NULL, N'Monipuolisen varhaiskasvatustoiminnan lisäksi varhaiskasvatustoiminnassa painotetaan ympäristöä ja luonnossa olemista.', N'Förutom mångsidig småbarnspedagogisk verksamhet betonas miljö och vistelse i naturen i småbarnspedagogiken.', NULL, 6, CAST(N'2019-01-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.7633000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_toiminnallinenpainotus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarj_nro], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (7, N'TP07', N'Seikkailu', N'Äventyr', N'Adventure', N'Monipuolisen varhaiskasvatustoiminnan lisäksi varhaiskasvatustoiminnassa painotetaan seikkailuun liittyvää toimintaa.', N'Förutom mångsidig småbarnspedagogisk verksamhet betonas äventyrsaktiviteter i småbarnspedagogiken.', N'Adventure', 7, CAST(N'2019-01-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.7633000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_toiminnallinenpainotus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarj_nro], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (8, N'TP08', N'Media', N'Media', N'Media', N'Monipuolisen varhaiskasvatustoiminnan lisäksi varhaiskasvatustoiminnassa painotetaan mediaa ja mediataiteita.', N'Förutom mångsidig småbarnspedagogisk verksamhet betonas media och mediekonst i småbarnspedagogiken.', N'Media', 8, CAST(N'2019-01-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.7633000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_toiminnallinenpainotus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarj_nro], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (9, N'TP09', N'Erityiseen katsomukseen perustuva varhaiskasvatus', N'Småbarnspedagogik som baserar sig på en särskild åskådning', NULL, N'Monipuolisen varhaiskasvatustoiminnan lisäksi varhaiskasvatustoiminnassa on erityinen katsomuksellinen painotus, kuten kristillinen tai juutalainen katsomus.', N'Förutom mångsidig småbarnspedagogisk verksamhet betonas en särskild åskådning i småbarnspedagogiken, såsom kristen eller judisk åskådning.', NULL, 9, CAST(N'2019-01-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.7633000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_toiminnallinenpainotus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarj_nro], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (10, N'TP98', N'Ei painotusta', N'Ingen betoning', NULL, N'Ei toiminnallista painotusta (- 6.5.2021)', N'Ingen betoning', NULL, 98, CAST(N'2019-01-01' AS Date), CAST(N'2021-05-06' AS Date), CAST(N'2022-09-13T02:50:23.7633000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_toiminnallinenpainotus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarj_nro], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (11, N'TP99', N'Muu', N'Övrig betoning', N'Other', N'Varhaiskasvatustoiminnan painotus ei sisälly johonkin tämän koodiston painotukseen.', N'Verksamheten som betonas i småbarnspedagogiken ingår inte i någon av betoningarna i detta kodverk.', N'Other', 99, CAST(N'2019-01-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.7633000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
SET IDENTITY_INSERT [dw].[d_varda_toiminnallinenpainotus] OFF
GO
SET IDENTITY_INSERT [dw].[d_varda_toimintamuoto] ON 

GO
INSERT [dw].[d_varda_toimintamuoto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarjestys], [loadtime], [source], [username]) VALUES (1, N'TM01', N'Päiväkoti', N'Daghem', NULL, N'Päiväkoti', N'Daghem', NULL, CAST(N'2019-01-01' AS Date), NULL, 1, CAST(N'2022-09-13T02:50:23.7800000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_toimintamuoto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarjestys], [loadtime], [source], [username]) VALUES (2, N'TM02', N'Perhepäivähoito', N'Familjedagvård', NULL, N'Perhepäivähoito', N'Familjedagvård', NULL, CAST(N'2019-01-01' AS Date), NULL, 2, CAST(N'2022-09-13T02:50:23.7800000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_toimintamuoto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarjestys], [loadtime], [source], [username]) VALUES (3, N'TM03', N'Ryhmäperhepäivähoito', N'Gruppfamiljedagvård', N'Private group family daycare provider', N'Ryhmäperhepäivähoito', N'Gruppfamiljedagvård', NULL, CAST(N'2019-01-01' AS Date), NULL, 3, CAST(N'2022-09-13T02:50:23.7800000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
SET IDENTITY_INSERT [dw].[d_varda_toimintamuoto] OFF
GO
SET IDENTITY_INSERT [dw].[d_varda_toimipaikkaluokitus] ON 

GO
INSERT [dw].[d_varda_toimipaikkaluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (1, N'1', N'1 toimipaikka', N'Ett verksamhetsställe', N'1 toimipaikka', N'1 toimipaikka', N'Ett verksamhetsställe', N'1 toimipaikka', CAST(N'2021-03-23' AS Date), NULL, CAST(N'2021-06-01T14:36:55.6967000' AS DateTime2), N'p_lataa_d_varda_toimipaikkaluokitus', N'DWI\tvaisane')
GO
INSERT [dw].[d_varda_toimipaikkaluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (2, N'2', N'2-3 toimipaikkaa', N'2-3 verksamhetsställen', N'2-3 toimipaikkaa', N'2-3 toimipaikkaa', N'2-3 verksamhetsställen', N'2-3 toimipaikkaa', CAST(N'2021-03-23' AS Date), NULL, CAST(N'2021-06-01T14:36:55.6967000' AS DateTime2), N'p_lataa_d_varda_toimipaikkaluokitus', N'DWI\tvaisane')
GO
INSERT [dw].[d_varda_toimipaikkaluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (3, N'3', N'4-10 toimipaikkaa', N'4-10 verksamhetsställen', N'4-10 toimipaikkaa', N'4-10 toimipaikkaa', N'4-10 verksamhetsställen', N'4-10 toimipaikkaa', CAST(N'2021-03-23' AS Date), NULL, CAST(N'2021-06-01T14:36:55.6967000' AS DateTime2), N'p_lataa_d_varda_toimipaikkaluokitus', N'DWI\tvaisane')
GO
INSERT [dw].[d_varda_toimipaikkaluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (4, N'4', N'11-20 toimipaikkaa', N'11-20 verksamhetsställen', N'11-20 toimipaikkaa', N'11-20 toimipaikkaa', N'11-20 verksamhetsställen', N'11-20 toimipaikkaa', CAST(N'2021-03-23' AS Date), NULL, CAST(N'2021-06-01T14:36:55.6967000' AS DateTime2), N'p_lataa_d_varda_toimipaikkaluokitus', N'DWI\tvaisane')
GO
INSERT [dw].[d_varda_toimipaikkaluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (5, N'5', N'Yli 20 toimipaikkaa', N'Över 20 verksamhetsställen', N'Yli 20 toimipaikkaa', N'Yli 20 toimipaikkaa', N'Över 20 verksamhetsställen', N'Yli 20 toimipaikkaa', CAST(N'2021-03-23' AS Date), NULL, CAST(N'2021-06-01T14:36:55.6967000' AS DateTime2), N'p_lataa_d_varda_toimipaikkaluokitus', N'DWI\tvaisane')
GO
SET IDENTITY_INSERT [dw].[d_varda_toimipaikkaluokitus] OFF
GO
SET IDENTITY_INSERT [dw].[d_varda_tuntimaara_asteikko] ON 

GO
INSERT [dw].[d_varda_tuntimaara_asteikko] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarj_nro], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (1, N'1', N'Alle 25 h', N'Under 25 h', N'Alle 25 h', N'Alle 25 h', N'Under 25 h', N'Alle 25 h', 1, CAST(N'2019-01-01' AS Date), NULL, CAST(N'2021-11-09T10:47:43.1700000' AS DateTime2), N'p_lataa_d_varda_tuntimaara_asteikko', N'DWI\tvaisane')
GO
INSERT [dw].[d_varda_tuntimaara_asteikko] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarj_nro], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (2, N'2', N'25 - 35 h', N'25 - 35 h', N'25 - 35 h', N'25 - 35 h', N'25 - 35 h', N'25 - 35 h', 2, CAST(N'2019-01-01' AS Date), NULL, CAST(N'2021-11-09T10:47:43.1700000' AS DateTime2), N'p_lataa_d_varda_tuntimaara_asteikko', N'DWI\tvaisane')
GO
INSERT [dw].[d_varda_tuntimaara_asteikko] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [jarj_nro], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (3, N'3', N'Yli 35 h', N'Över 35 h', N'Yli 35 h', N'Yli 35 h', N'Över 35 h', N'Yli 35 h', 3, CAST(N'2019-01-01' AS Date), NULL, CAST(N'2021-11-09T10:47:43.1700000' AS DateTime2), N'p_lataa_d_varda_tuntimaara_asteikko', N'DWI\tvaisane')
GO
SET IDENTITY_INSERT [dw].[d_varda_tuntimaara_asteikko] OFF
GO
SET IDENTITY_INSERT [dw].[d_varda_tutkinto] ON 

GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (1, N'001', N'Opetushallituksen päätöksellä kelpoisuuden antava ulkomailla suoritettu koulutus', N'Utbildning som avlagts utomlands och som ger behörighet enligt Utbildningsstyrelsens beslut', NULL, N'Vardan oma koodi. Varhaiskasvatuksessa työskentelevällä henkilöllä on Opetushallituksen päätös kelpoisuudesta toimia varhaiskasvatuksen tehtävässä', N'Vardas egen kod. Personen som arbetar inom småbarnspedagogiken har ett av Utbildningsstyrelsen utfärdat beslut som ger behörighet för uppgifter inom småbarnspedagogik.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (2, N'002', N'Muu varhaiskasvatusalan tutkinto tai koulutus', N'Annan examen eller utbildning inom småbarnspedagogik', NULL, N'Vardan oma koodi. Käytetään kun kyseessä on muu varhaiskasvatusalan tutkinto tai koulutus', N'Vardas egen kod. Används i fråga om någon annan examen eller utbildning inom småbarnspedagogik.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (3, N'003', N'Ei varhaiskasvatusalan tutkintoa tai koulutusta', N'Ingen examen eller utbildning inom småbarnspedagogik', NULL, N'Vardan oma koodi. Käytetään kun varhaiskasvatuksessa työskentelevällä henkilöllä ei ole suoritettua tutkintoa tai koulutusta varhaiskasvatusalalta tai henkilön työtehtävään ei ole kelpoisuusvaatimusta.', N'Vardas egen kod. Används då personen som arbetar inom småbarnspedagogiken inte har avlagt någon examen eller utbildning inom småbarnspedagogik, eller då det inte finns några behörighetsvillkor för personens arbetsuppgifter.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (4, N'321901', N'Viittomakielisen ohjauksen perustutkinto', N'Grundexamen i teckenspråkshandledning', NULL, N'Varhaiskasvatuksen lastenhoitajan kelpoisuuden tuova ammatillinen perustutkinto (tutkintonimike viittomakielen ohjaaja), johon otettiin opiskelijoita ennen 31.7.2018. Tutkinnon opiskelun aloittanut voi suorittaa tutkinnon loppuun 31.12.2021 saakka.', N'Yrkesinriktad grundexamen som ger behörighet som barnskötare inom småbarnspedaogik (examensbenämningen teckenspråkshandledare), till vilken studerande antogs före 31.7.2018. En studerande som påbörjat studierna kan avlägga examen fram till 31.12.2021.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (5, N'371101', N'Sosiaali- ja terveysalan perustutkinto, lähihoitaja', N'Grundexamen inom social- och hälsovård, närvårdare', NULL, N'Ammatillinen perustutkinto (tutkintonimike lähihoitaja)', N'Yrkesinriktad grundexamen (examensbenämningen närvårdare)', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (6, N'371168', N'Lastenhoitaja', N'Barnskötare', NULL, N'Varhaiskasvatuksen lastenhoitajan kelpoisuuden tuova koulutus, joka edelsi sosiaali- ja terveysalan perustutkintoa. Koulutukseen otettiin opiskelijoita vuosina 1921-1993/96.', N'Utbildning som ger behörighet som barnskötare inom småbarnspedagogik, föregick grundexamen inom social- och hälsovårdsbranschen. Studerande antogs till utbildningen mellan åren 1921 och 1993/96.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (7, N'371169', N'Päivähoitaja', N'Dagvårdare', NULL, N'Varhaiskasvatuksen lastenhoitajan kelpoisuuden tuova koulutus, joka edelsi sosiaali- ja terveysalan perustutkintoa. Koulutukseen otettiin opiskelijoita vuosina 1985-1993.', N'Utbildning som ger behörighet som barnskötare inom småbarnspedagogik, föregick grundexamen inom social- och hälsovårdsbranschen. Studerande antogs till utbildningen mellan åren 1985 och 1993.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (8, N'374114', N'Perhepäivähoitajan ammattitutkinto', N'Yrkesexamen för familjedagvårdare', NULL, N'Perhepäivähoitajan kelpoisuuden tuova ammattitutkinto. Perhepäivähoitajan ammattitutkintoon otettiin opiskelijoita ennen 1.1.2019.', N'Yrkesexamen som ger behörighet som familjedagvårdare. Till yrkesexamen för familjedagvårdare antogs studerande före 1.1.2019.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (9, N'381204', N'Lapsi- ja perhetyön perustutkinto', N'Grundexamen i barn- och familjearbete', NULL, N'Varhaiskasvatuksen lastenhoitajan kelpoisuuden tuova ammatillinen perustutkinto (tutkintonimike lastenohjaaja), johon otettiin opiskelijoita ennen 31.7.2018. Tutkinnon opiskelun aloittanut voi suorittaa tutkinnon loppuun 31.12.2021 saakka.', N'Yrkesinriktad grundexamen som ger behörighet som barnskötare inom småbarnspedaogik (examensbenämningen barnskötare), till vilken studerande antogs före 31.7.2018. En studerande som påbörjat studierna kan avlägga examen fram till 31.12.2021.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (10, N'381241', N'Kasvatus- ja ohjausalan perustutkinto', N'Grundexamen i pedagogisk verksamhet och handledning', NULL, N'Ammatillinen perustutkinto (tutkintonimike lastenohjaaja tai kommunikaation ja viittomakielen ohjaaja)', N'Yrkesinriktad grundexamen (examensbenämningen barnskötare eller handledare i kommunikation och teckenspråk)', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (11, N'384246', N'Kasvatus- ja ohjausalan ammattitutkinto', N'Yrkesexamen i pedagogisk verksamhet och handledning', NULL, N'Perhepäivähoitajan kelpoisuuden tuova ammattitutkinto, jos suoritettuna on perhepäivähoidon osaamisala. Tutkintoon on otettu opiskelijoita 1.1.2019 lähtien.', N'Yrkesexamen som ger behörighet som familjedagvårdare, om kompetensområdet för familjedagvård har avlagts. Studerande har antagits till utbildningen från och med 1.1.2019.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (12, N'511501', N'Lastentarhanopettaja (-1985)', N'Barnträdgårdslärare (-1985)', NULL, N'Yksi- tai kaksivuotinen lastentarhanopettajan koulutus seminaarissa, opistossa tai yliopistossa (ns. ULO-koulutus), joka ei johtanut kandidaatin tutkintoon.', N'Sådan en- eller tvåårig barnträdgårdslärarutbildning vid seminarium, institut eller universitet som inte ledde till kandidatexamen.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (13, N'571201', N'Sosiaalialan opistotutkinto', N'Sociala området, institutsexamen', NULL, N'Sosiaalialan ohjaajan opistotason tutkinto, joka oli käytössä 1990-luvulla ja joka antoi kelpoisuuden lastentarhanopettajan tehtäviin mikäli opinnot suuntautuivat varhaiskasvatukseen', N'Examen för handledare inom socialsektorn, som kunde avläggas på 1990-talet och som gav behörighet som barnträdgårdslärare om studierna var inriktade på småbarnspedagogik', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (14, N'571254', N'Sosiaalikasvattaja', N'Socialpedagog', NULL, N'Sosiaalikasvattajan opistotason tutkinto, johon otettiin opiskelijoita vuosina 1998 asti ja joka antoi kelpoisuuden lastentarhanopettajan tehtäviin', N'Socialpedagogexamen på insitutsnivå, till vilken studerande antogs fram till 1998 och som gav behörighet som barnträdgårdslärare', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (15, N'612101', N'Kasvatust. kand. (alempi) varhaiskasvatuksen opettaja; Kasvatust. kand. (alempi), lastentarhanopettaja', N'Ped. kand. (lägre), lärare inom småbarnspedagogik; Ped. kand. (lägre), barnträdgårdslärare', NULL, N'Kasvatustieteen kandidaatin tutkinto, joka sisältää suoritetut vähintään 60 opintopisteen varhaiskasvatuksen tehtäviin ja esiopetukseen ammatillisia valmiuksia antavat opinnot tai lastentarhanopettajan koulutuksen.', N'Pedagogie kandidatexamen som innehåller studier som ger yrkesfärdigheter för uppgifter inom småbarnspedagogik och förskoleundervisning till en omfattning av minst 60 studiepoäng eller barnträdgårdslärarutbildning.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (16, N'612102', N'Kasvatust. kand. (alempi), luokanopettaja (ei opettajankelpoisuutta)', N'Ped. kand. (lägre), klasslärare (inte lärarbehörighet)', NULL, N'Kasvatustieteen kandidaatin tutkinto muusta kuin varhaiskasvatuksen pääaineesta. ', N'Pedagogie kandidatexamen med något annat huvudämne än småbarnspedagogik.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (17, N'612103', N'Kasvatust. kand. (alempi), erityisopettaja (ei opettajankelpoisuutta)', N'Ped. kand. (lägre), speciallärare (inte lärarbehörighet)', NULL, N'Kasvatustieteen kandidaatin tutkinto muusta kuin varhaiskasvatuksen pääaineesta. ', N'Pedagogie kandidatexamen med något annat huvudämne än småbarnspedagogik.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (18, N'612104', N'Kasvatust. kand. (alempi), kotitalousopettaja (ei opettajankelpoisuutta)', N'Ped. kand. (lägre), lärare i huslig ekonomi (inte lärarbehörighet)', NULL, N'Kasvatustieteen kandidaatin tutkinto muusta kuin varhaiskasvatuksen pääaineesta. ', N'Pedagogie kandidatexamen med något annat huvudämne än småbarnspedagogik.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (19, N'612105', N'Kasvatust. kand. (alempi), käsityönopettaja (ei opettajankelpoisuutta)', N'Ped. kand. (lägre), handarbetslärare (inte lärarbehörighet)', NULL, N'Kasvatustieteen kandidaatin tutkinto muusta kuin varhaiskasvatuksen pääaineesta. ', N'Pedagogie kandidatexamen med något annat huvudämne än småbarnspedagogik.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (20, N'612107', N'Kasvatust. kand. (alempi), peruskoulun ja lukion opinto-ohjaaja (ei opettajankelpoisuutta)', N'Ped. kand. (lägre), studiehandledare i grundskolan och gymnasiet (inte lärarbehörighet)', NULL, N'Kasvatustieteen kandidaatin tutkinto muusta kuin varhaiskasvatuksen pääaineesta. ', N'Pedagogie kandidatexamen med något annat huvudämne än småbarnspedagogik.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (21, N'612108', N'Kasvatust. kand. (alempi), musiikinopettaja (ei opettajankelpoisuutta)', N'Ped. kand. (lägre), musiklärare (inte lärarbehörighet)', NULL, N'Kasvatustieteen kandidaatin tutkinto muusta kuin varhaiskasvatuksen pääaineesta. ', N'Pedagogie kandidatexamen med något annat huvudämne än småbarnspedagogik.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (22, N'612199', N'Kasvatust. kand. (alempi), muu tai tuntematon opettajankoulutus', N'Ped. kand. (lägre), annan eller okänd lärarutbildning', NULL, N'Kasvatustieteen kandidaatin tutkinto muusta kuin varhaiskasvatuksen pääaineesta. ', N'Pedagogie kandidatexamen med något annat huvudämne än småbarnspedagogik.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (23, N'612201', N'Kasvatust. kand. (alempi), kasvatustiede', N'Ped. kand. (lägre), pedagogik', NULL, N'Kasvatustieteen kandidaatin tutkinto muusta kuin varhaiskasvatuksen pääaineesta. ', N'Pedagogie kandidatexamen med något annat huvudämne än småbarnspedagogik.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (24, N'612202', N'Kasvatust. kand. (alempi), aikuiskasvatus', N'Ped. kand. (lägre), vuxenutbildning', NULL, N'Kasvatustieteen kandidaatin tutkinto muusta kuin varhaiskasvatuksen pääaineesta. ', N'Pedagogie kandidatexamen med något annat huvudämne än småbarnspedagogik.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (25, N'612203', N'Kasvatust. kand. (alempi), erityispedagogiikka', N'Ped. kand. (lägre), specialpedagogik', NULL, N'Kasvatustieteen kandidaatin tutkinto muusta kuin varhaiskasvatuksen pääaineesta. ', N'Pedagogie kandidatexamen med något annat huvudämne än småbarnspedagogik.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (26, N'612204', N'Kasvatust. kand. (alempi), varhaiskasvatus', N'Ped. kand. (lägre), småbarnspedagogik ', NULL, N'Kasvatustieteen kandidaatin tutkinto pääaineesta varhaiskasvatus.', N'Pedagogie kandidatsexamen med huvudämnet småbarnpedagogik.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (27, N'612205', N'Kasvatust. kand. (alempi), tekstiilityö, tekninen työ ja kotitalous', N'Ped. kand. (lägre), textilslöjd, tekniskt arbete och huslig ekonomi', NULL, N'Kasvatustieteen kandidaatin tutkinto muusta kuin varhaiskasvatuksen pääaineesta. ', N'Pedagogie kandidatexamen med något annat huvudämne än småbarnspedagogik.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (28, N'612299', N'Kasvatust. kand. (alempi), muu tai tuntematon pääaineryhmä', N'Ped. kand. (lägre), annat eller okänt huvudämne', NULL, N'Kasvatustieteen kandidaatin tutkinto muusta kuin varhaiskasvatuksen pääaineesta. ', N'Pedagogie kandidatexamen med något annat huvudämne än småbarnspedagogik.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (29, N'613101', N'Lastentarhanopettaja (1986-)', N'Barnträdgårdslärare (1986-) ', NULL, N'Kolmivuotinen lastentarhanopettajan koulutus opistossa tai yliopistossa, joka ei johtanut kandidaatin tutkintoon. Koulutukseen otettiin opiskelijoita vuosien 1986-1995 välillä. Ns. ULO-koulutus.', N'Sådan treårig barnträdgårdslärarutbildning vid ett institut eller universitet som inte ledde till kandidatexamen. Studerande antogs till utbildningen mellan åren 1986 och 1995.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (30, N'613401', N'Varhaiskasvatuksen erityisopettaja; erityislastentarhanopettaja', N'Speciallärare inom småbarnspedagogik; specialbarnträdgårdslärare', NULL, N'Erilliset varhaiskasvatuksen erityisopettajan tehtäviin ammatillisia valmiuksia antavat 60 opintopisteen opinnot (VNan asetus yliopistojen tutkinnoista ja erikoistumiskoulutuksista (794/2004) 19.1 § kohta 3). Tämän lisäksi suoritettuna on varhaiskasvatuksen opettajan kelpoisuuden tuova tutkinto.
', N'Separata studier till en omfattning av 60 studiepoäng som ger yrkesfärdigheter för uppgifter inom specialundervisning (Statsrådets förordning om universitetsexamina (794/2004) 19.1 § punkt 3). Därtill ska en examen som ger behörighet som lärare inom småbarspedagogik vara avlagd.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (31, N'613952', N'Steinerpäiväkodin varhaiskasvattaja', N'Förskollärare i Steinerdaghem', NULL, N'Steinerpedagogisen varhaiskasvattajan opinnot', N'Steinerpedagogiska studier med inriktning på småbarnspedagogik', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (32, N'671201', N'Sosionomi (AMK), sosiaaliala', N'Socionom (YH), socialbranschen', NULL, N'Sosiaali- ja terveysalan ammattikorkeakoulututkinto. Tutkinto sisältää myös väliaikaisen ammattikorkeakoulun myöntämän sosiaali- ja terveysalan ammattikorkeakoulututkinnon tai sosiaalialan ammattikorkeakoulututkinnon vuosina 1991-2000.', N'Yrkeshögskoleexamen inom social- och hälsovårdsområdet. Examen innefattar också yrkeshögskoleexamen inom social- och hälsovård eller yrkeshögskoleexamen inom socialsektorn som beviljats av en temporär yrkeshögskola åren 1991-2000.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (33, N'712101', N'Kasvatust. maist., luokanopettaja', N'Ped. mag., klasslärare', NULL, N'Kasvatustieteen maisterin tutkinto muusta kuin varhaiskasvatuksen pääaineesta. ', N'Pedagogie magisterexamen med något annat huvudämne än småbarnspedagogik.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (34, N'712102', N'Kasvatust. maist., erityisopettaja', N'Ped. mag., speciallärare', NULL, N'Kasvatustieteen maisterin tutkinto muusta kuin varhaiskasvatuksen pääaineesta. ', N'Pedagogie magisterexamen med något annat huvudämne än småbarnspedagogik.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (35, N'712104', N'Kasvatust. maist., kotitalousopettaja', N'Ped. mag., lärare i huslig ekonomi', NULL, N'Kasvatustieteen maisterin tutkinto muusta kuin varhaiskasvatuksen pääaineesta. ', N'Pedagogie magisterexamen med något annat huvudämne än småbarnspedagogik.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (36, N'712105', N'Kasvatust. maist., käsityönopettaja', N'Ped. mag., handarbetslärare', NULL, N'Kasvatustieteen maisterin tutkinto muusta kuin varhaiskasvatuksen pääaineesta. ', N'Pedagogie magisterexamen med något annat huvudämne än småbarnspedagogik.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (37, N'712108', N'Kasvatust. maist., peruskoulun ja lukion opinto-ohjaaja', N'Ped. mag., studiehandledare i grundskolan och gymnasiet', NULL, N'Kasvatustieteen maisterin tutkinto muusta kuin varhaiskasvatuksen pääaineesta. ', N'Pedagogie magisterexamen med något annat huvudämne än småbarnspedagogik.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (38, N'712109', N'Kasvatust. maist., musiikinopettaja', N'Ped. mag., musiklärare', NULL, N'Kasvatustieteen maisterin tutkinto muusta kuin varhaiskasvatuksen pääaineesta. ', N'Pedagogie magisterexamen med något annat huvudämne än småbarnspedagogik.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (39, N'712199', N'Kasvatust. maist., muu tai tuntematon opettajankoulutus', N'Ped. mag., annan eller okänd lärarutbildning', NULL, N'Kasvatustieteen maisterin tutkinto muusta kuin varhaiskasvatuksen pääaineesta. ', N'Pedagogie magisterexamen med något annat huvudämne än småbarnspedagogik.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (40, N'712201', N'Kasvatust. maist., kasvatustiede', N'Ped. mag., pedagogik', NULL, N'Kasvatustieteen maisterin tutkinto muusta kuin varhaiskasvatuksen pääaineesta. ', N'Pedagogie magisterexamen med något annat huvudämne än småbarnspedagogik.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (41, N'712202', N'Kasvatust. maist., aikuiskasvatus', N'Ped. mag., vuxenutbildning', NULL, N'Kasvatustieteen maisterin tutkinto muusta kuin varhaiskasvatuksen pääaineesta. ', N'Pedagogie magisterexamen med något annat huvudämne än småbarnspedagogik.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (42, N'712203', N'Kasvatust. maist., erityispedagogiikka', N'Ped. mag., specialpedagogik', NULL, N'Varhaiskasvatuslain 30 §:n 2 kohdassa tarkoitettu maisterin tutkinto pääaineesta erityispedagogiikka (varhaiserityisopettajan koulutus) ', N'Sådan magisterexamen med huvudämnet specialpedagogik som avses i 30 § punkt 2 i lagen om småbarnspedagogik (speciallärarutbildng med inriktning på småbarnspedagogik)', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (43, N'712204', N'Kasvatust. maist., varhaiskasvatus', N'Ped. mag., småbarnspedagogik', NULL, N'Kasvatustieteen maisterin tutkinto varhaiskasvatuksen pääaineesta.', N'Pedagogie magisterexamen med huvudämnet småbarnspedagogik.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (44, N'712205', N'Kasvatust. maist., tekstiilityö, tekninen työ ja kotitalous', N'Ped. mag., textilslöjd, tekniskt arbete och huslig ekonomi', NULL, N'Kasvatustieteen maisterin tutkinto muusta kuin varhaiskasvatuksen pääaineesta. ', N'Pedagogie magisterexamen med något annat huvudämne än småbarnspedagogik.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (45, N'712299', N'Kasvatust. maist., muu tai tuntematon pääaineryhmä', N'Ped. mag., annat eller okänt huvudämne', NULL, N'Kasvatustieteen maisterin tutkinto muusta kuin varhaiskasvatuksen pääaineesta. ', N'Pedagogie magisterexamen med något annat huvudämne än småbarnspedagogik.', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (46, N'771301', N'Sosionomi (ylempi AMK), sosiaaliala', N'Socionom (högre YH), socialbranschen', NULL, N'Sosiaali- ja terveysalan ylempi ammattikorkeakoulututkinto. Tutkinto sisältää myös väliaikaisen ammattikorkeakoulun myöntämän sosiaali- ja terveysalan ammattikorkeakoulututkinnon tai sosiaalialan ammattikorkeakoulututkinnon vuosina 1991-2000 / Ammattikorkeakoulun jatkotutkinnon', N'Högre yrkeshögskoleexamen inom social- och hälsovårdsområdet. Examen innefattar också yrkeshögskoleexamen inom social- och hälsovård eller yrkeshögskoleexamen inom socialsektorn som beviljats av en temporär yrkeshögskola åren 1991-2000 / påbyggnadsexamen vid yrkeshögskola', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (47, N'812101', N'Kasvatust. lis., kasvatustiede', N'Ped. lic., pedagogik', NULL, N'Kasvatustieteen lisensiaatin tutkinto', N'Pedagogie licentitatexamen', NULL, CAST(N'2020-04-16' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (48, N'812102', N'Kasvatust. lis., aikuiskasvatus', N'Ped. lic., vuxenutbildning', NULL, N'Kasvatustieteen lisensiaatin tutkinto', N'Pedagogie licentitatexamen', NULL, CAST(N'2020-04-16' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (49, N'812103', N'Kasvatust. lis., erityispedagogiikka', N'Ped. lic., specialpedagogik', NULL, N'Kasvatustieteen lisensiaatin tutkinto', N'Pedagogie licentitatexamen', NULL, CAST(N'2020-04-16' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (50, N'815101', N'Kasvatust. toht., kasvatustiede', N'Ped. dr, pedagogik', NULL, N'Kasvatustieteen tohtorin tutkinto', N'Pedagogie doktorsexamen', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (51, N'815102', N'Kasvatust. toht., aikuiskasvatus', N'Ped. dr, vuxenutbildning', NULL, N'Kasvatustieteen tohtorin tutkinto', N'Pedagogie doktorsexamen', NULL, CAST(N'2020-04-16' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tutkinto] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (52, N'815103', N'Kasvatust. toht., erityispedagogiikka', N'Ped. dr, specialpedagogik', NULL, N'Kasvatustieteen tohtorin tutkinto', N'Pedagogie doktorsexamen', NULL, CAST(N'2020-04-16' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
SET IDENTITY_INSERT [dw].[d_varda_tutkinto] OFF
GO
SET IDENTITY_INSERT [dw].[d_varda_tyoaika] ON 

GO
INSERT [dw].[d_varda_tyoaika] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (1, N'1', N'Kokoaikainen', N'Heltid', N'Full time', N'Kokoaikainen työaika', N'Arbete på heltid', N'Full time', CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tyoaika] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (2, N'2', N'Osa-aikainen', N'Deltid', NULL, N'Osa-aikainen', N'Arbete på deltid', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8100000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
SET IDENTITY_INSERT [dw].[d_varda_tyoaika] OFF
GO
SET IDENTITY_INSERT [dw].[d_varda_tyosuhde] ON 

GO
INSERT [dw].[d_varda_tyosuhde] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (1, N'1', N'Toistaiseksi voimassaoleva', N'I kraft tills vidare', NULL, N'Toistaiseksi voimassaoleva työsuhde', N'Anställningsförhållandet är i kraft tills vidare (stadigvarande)', NULL, CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
INSERT [dw].[d_varda_tyosuhde] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (2, N'2', N'Määräaikainen', N'Tidsbundet', N'Fixed term', N'Määräaikainen työsuhde', N'Anställningsförhållandet är tidsbundet', N'Fixed term position', CAST(N'2019-09-01' AS Date), NULL, CAST(N'2022-09-13T02:50:23.8267000' AS DateTime2), N'p_lataa_varda_koodistot', N't_sql16_etl')
GO
SET IDENTITY_INSERT [dw].[d_varda_tyosuhde] OFF
GO
SET IDENTITY_INSERT [dw].[d_varda_varhaiskasvatuspaikkaluokitus] ON 

GO
INSERT [dw].[d_varda_varhaiskasvatuspaikkaluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (1, N'-1', N'Tieto puuttuu', N'Information saknas', N'Data missing', N'Tieto puuttuu', N'Information saknas', N'Data missing', CAST(N'2021-03-23' AS Date), NULL, -1, CAST(N'2021-11-18T12:52:49.1433000' AS DateTime2), N'p_lataa_d_varda_varhaiskasvatuspaikkaluokitus', N'DWI\tvaisane')
GO
INSERT [dw].[d_varda_varhaiskasvatuspaikkaluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (2, N'1', N'Alle 25', N'Mindre än 25', N'Less than 25', N'Alle 25', N'Mindre än 25', N'Less than 25', CAST(N'2021-03-23' AS Date), NULL, 1, CAST(N'2021-11-18T12:52:49.1433000' AS DateTime2), N'p_lataa_d_varda_varhaiskasvatuspaikkaluokitus', N'DWI\tvaisane')
GO
INSERT [dw].[d_varda_varhaiskasvatuspaikkaluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (3, N'2', N'25 - 49', N'25 - 49', N'25 - 49', N'25 - 49', N'25 - 49', N'25 - 49', CAST(N'2021-03-23' AS Date), NULL, 2, CAST(N'2021-11-18T12:52:49.1433000' AS DateTime2), N'p_lataa_d_varda_varhaiskasvatuspaikkaluokitus', N'DWI\tvaisane')
GO
INSERT [dw].[d_varda_varhaiskasvatuspaikkaluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (4, N'3', N'50 - 99', N'50 - 99', N'50 - 99', N'50 - 99', N'50 - 99', N'50 - 99', CAST(N'2021-03-23' AS Date), NULL, 3, CAST(N'2021-11-18T12:52:49.1433000' AS DateTime2), N'p_lataa_d_varda_varhaiskasvatuspaikkaluokitus', N'DWI\tvaisane')
GO
INSERT [dw].[d_varda_varhaiskasvatuspaikkaluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (5, N'4', N'100 - 149', N'100 - 149', N'100 - 149', N'100 - 149', N'100 - 149', N'100 - 149', CAST(N'2021-03-23' AS Date), NULL, 4, CAST(N'2021-11-18T12:52:49.1433000' AS DateTime2), N'p_lataa_d_varda_varhaiskasvatuspaikkaluokitus', N'DWI\tvaisane')
GO
INSERT [dw].[d_varda_varhaiskasvatuspaikkaluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (6, N'5', N'150 - 199', N'150 - 199', N'150 - 199', N'150 - 199', N'150 - 199', N'150 - 199', CAST(N'2021-03-23' AS Date), NULL, 5, CAST(N'2021-11-18T12:52:49.1433000' AS DateTime2), N'p_lataa_d_varda_varhaiskasvatuspaikkaluokitus', N'DWI\tvaisane')
GO
INSERT [dw].[d_varda_varhaiskasvatuspaikkaluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (7, N'6', N'200 - 249', N'200 - 249', N'200 - 249', N'200 - 249', N'200 - 249', N'200 - 249', CAST(N'2021-03-23' AS Date), NULL, 6, CAST(N'2021-11-18T12:52:49.1433000' AS DateTime2), N'p_lataa_d_varda_varhaiskasvatuspaikkaluokitus', N'DWI\tvaisane')
GO
INSERT [dw].[d_varda_varhaiskasvatuspaikkaluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [alkupvm], [loppupvm], [jarj_nro], [loadtime], [source], [username]) VALUES (8, N'7', N'250 tai yli', N'250 eller mer', N'250 or more', N'250 tai yli', N'250 eller mer', N'250 or more', CAST(N'2021-03-23' AS Date), NULL, 7, CAST(N'2021-11-18T12:52:49.1433000' AS DateTime2), N'p_lataa_d_varda_varhaiskasvatuspaikkaluokitus', N'DWI\tvaisane')
GO
SET IDENTITY_INSERT [dw].[d_varda_varhaiskasvatuspaikkaluokitus] OFF
GO
SET IDENTITY_INSERT [dw].[d_varda_yritysluokitus] ON 

GO
INSERT [dw].[d_varda_yritysluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [yritysmuoto_ryhma_fi], [yritysmuoto_ryhma_en], [yritysmuoto_ryhma_sv], [yritys_tyyppi], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (1, N'16', N'Osakeyhtiö', N'Aktiebolag', N'Osakeyhtiö', N'Osakeyhtiö', N'Aktiebolag', N'Osakeyhtiö', N'Yritykset', N'Yritykset', N'Företag', N'Yksityinen', CAST(N'2021-03-23' AS Date), NULL, CAST(N'2022-05-03T16:45:29.6567000' AS DateTime2), N'p_lataa_varda_yritysmuoto', N'DWI\akoskini')
GO
INSERT [dw].[d_varda_yritysluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [yritysmuoto_ryhma_fi], [yritysmuoto_ryhma_en], [yritysmuoto_ryhma_sv], [yritys_tyyppi], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (2, N'13', N'Kommandiittiyhtiö', N'Kommanditbolag', N'Kommandiittiyhtiö', N'Kommandiittiyhtiö', N'Kommanditbolag', N'Kommandiittiyhtiö', N'Yritykset', N'Yritykset', N'Företag', N'Yksityinen', CAST(N'2021-03-23' AS Date), NULL, CAST(N'2022-05-03T16:45:29.6567000' AS DateTime2), N'p_lataa_varda_yritysmuoto', N'DWI\akoskini')
GO
INSERT [dw].[d_varda_yritysluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [yritysmuoto_ryhma_fi], [yritysmuoto_ryhma_en], [yritysmuoto_ryhma_sv], [yritys_tyyppi], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (3, N'18', N'Säätiö', N'Stiftelse', N'Säätiö', N'Säätiö', N'Stiftelse', N'Säätiö', N'Yhdistykset ja säätiöt', N'Yhdistykset ja säätiöt', N'Föreningar och stiftelser', N'Yksityinen', CAST(N'2021-03-23' AS Date), NULL, CAST(N'2022-05-03T16:45:29.6567000' AS DateTime2), N'p_lataa_varda_yritysmuoto', N'DWI\akoskini')
GO
INSERT [dw].[d_varda_yritysluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [yritysmuoto_ryhma_fi], [yritysmuoto_ryhma_en], [yritysmuoto_ryhma_sv], [yritys_tyyppi], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (4, N'71', N'Paikallisyhteisö', N'Lokalsamfund', N'Paikallisyhteisö', N'Paikallisyhteisö', N'Lokalsamfund', N'Paikallisyhteisö', N'Yhdistykset ja säätiöt', N'Yhdistykset ja säätiöt', N'Föreningar och stiftelser', N'Yksityinen', CAST(N'2021-03-23' AS Date), NULL, CAST(N'2022-05-03T16:45:29.6567000' AS DateTime2), N'p_lataa_varda_yritysmuoto', N'DWI\akoskini')
GO
INSERT [dw].[d_varda_yritysluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [yritysmuoto_ryhma_fi], [yritysmuoto_ryhma_en], [yritysmuoto_ryhma_sv], [yritys_tyyppi], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (5, N'26', N'Yksityinen elinkeinonharjoittaja', N'Enskild näringsidkare', N'Yksityinen elinkeinonharjoittaja', N'Yksityinen elinkeinonharjoittaja', N'Enskild näringsidkare', N'Yksityinen elinkeinonharjoittaja', N'Yksityiset elinkeinonharjoittajat', N'Yksityiset elinkeinonharjoittajat', N'Enskilda näringsidkare', N'Yksityinen', CAST(N'2021-03-23' AS Date), NULL, CAST(N'2022-05-03T16:45:29.6567000' AS DateTime2), N'p_lataa_varda_yritysmuoto', N'DWI\akoskini')
GO
INSERT [dw].[d_varda_yritysluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [yritysmuoto_ryhma_fi], [yritysmuoto_ryhma_en], [yritysmuoto_ryhma_sv], [yritys_tyyppi], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (6, N'45', N'Ortodoksinen kirkko', N'Ortodoxa kyrkan', N'Ortodoksinen kirkko', N'Ortodoksinen kirkko', N'Ortodoxa kyrkan', N'Ortodoksinen kirkko', N'Yhdistykset ja säätiöt', N'Yhdistykset ja säätiöt', N'Föreningar och stiftelser', N'Yksityinen', CAST(N'2021-03-23' AS Date), NULL, CAST(N'2022-05-03T16:45:29.6567000' AS DateTime2), N'p_lataa_varda_yritysmuoto', N'DWI\akoskini')
GO
INSERT [dw].[d_varda_yritysluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [yritysmuoto_ryhma_fi], [yritysmuoto_ryhma_en], [yritysmuoto_ryhma_sv], [yritys_tyyppi], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (7, N'14', N'Osuuskunta', N'Andelslag', N'Osuuskunta', N'Osuuskunta', N'Andelslag', N'Osuuskunta', N'Yritykset', N'Yritykset', N'Företag', N'Yksityinen', CAST(N'2021-03-23' AS Date), NULL, CAST(N'2022-05-03T16:45:29.6567000' AS DateTime2), N'p_lataa_varda_yritysmuoto', N'DWI\akoskini')
GO
INSERT [dw].[d_varda_yritysluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [yritysmuoto_ryhma_fi], [yritysmuoto_ryhma_en], [yritysmuoto_ryhma_sv], [yritys_tyyppi], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (8, N'46', N'Uskonnollinen yhdyskunta', N'Församling/Lokalsamfund', N'Uskonnollinen yhdyskunta', N'Uskonnollinen yhdyskunta', N'Församling/Lokalsamfund', N'Uskonnollinen yhdyskunta', N'Yhdistykset ja säätiöt', N'Yhdistykset ja säätiöt', N'Föreningar och stiftelser', N'Yksityinen', CAST(N'2021-03-23' AS Date), NULL, CAST(N'2022-05-03T16:45:29.6567000' AS DateTime2), N'p_lataa_varda_yritysmuoto', N'DWI\akoskini')
GO
INSERT [dw].[d_varda_yritysluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [yritysmuoto_ryhma_fi], [yritysmuoto_ryhma_en], [yritysmuoto_ryhma_sv], [yritys_tyyppi], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (9, N'29', N'Muu yhdistys', N'Annan förening', N'Muu yhdistys', N'Muu yhdistys', N'Annan förening', N'Muu yhdistys', N'Yhdistykset ja säätiöt', N'Yhdistykset ja säätiöt', N'Föreningar och stiftelser', N'Yksityinen', CAST(N'2021-03-23' AS Date), NULL, CAST(N'2022-05-03T16:45:29.6567000' AS DateTime2), N'p_lataa_varda_yritysmuoto', N'DWI\akoskini')
GO
INSERT [dw].[d_varda_yritysluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [yritysmuoto_ryhma_fi], [yritysmuoto_ryhma_en], [yritysmuoto_ryhma_sv], [yritys_tyyppi], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (10, N'0', N'Ei yritysmuotoa', N'Ingen företagsform', N'Ei yritysmuotoa', N'Ei yritysmuotoa', N'Ingen företagsform', N'Ei yritysmuotoa', N'Yksityiset elinkeinonharjoittajat', N'Yksityiset elinkeinonharjoittajat', N'Enskilda näringsidkare', N'Yksityinen', CAST(N'2021-03-23' AS Date), NULL, CAST(N'2022-05-03T16:45:29.6567000' AS DateTime2), N'p_lataa_varda_yritysmuoto', N'DWI\akoskini')
GO
INSERT [dw].[d_varda_yritysluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [yritysmuoto_ryhma_fi], [yritysmuoto_ryhma_en], [yritysmuoto_ryhma_sv], [yritys_tyyppi], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (11, N'41', N'Kunta', N'Kommun', N'Kunta', N'Kunta', N'Kommun', N'Kunta', N'Kunta', N'Kunta', N'Kommun', N'Kunta', CAST(N'2021-03-23' AS Date), NULL, CAST(N'2022-05-03T16:45:29.6567000' AS DateTime2), N'p_lataa_varda_yritysmuoto', N'DWI\akoskini')
GO
INSERT [dw].[d_varda_yritysluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [yritysmuoto_ryhma_fi], [yritysmuoto_ryhma_en], [yritysmuoto_ryhma_sv], [yritys_tyyppi], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (12, N'42', N'Kuntayhtymä', N'samkommun', N'Kuntayhtymä', N'Kuntayhtymä', N'Samkommun', N'Kuntayhtymä', N'Kunta', N'Kunta', N'Kommun', N'Kunta', CAST(N'2021-03-23' AS Date), NULL, CAST(N'2022-05-03T16:45:29.6567000' AS DateTime2), N'p_lataa_varda_yritysmuoto', N'DWI\akoskini')
GO
INSERT [dw].[d_varda_yritysluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [yritysmuoto_ryhma_fi], [yritysmuoto_ryhma_en], [yritysmuoto_ryhma_sv], [yritys_tyyppi], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (13, N'5', N'Avoin yhtiö', N'Öppet bolag', N'Avoin yhtiö', N'Avoin yhtiö', N'Öppet bolag', N'Avoin yhtiö', N'Yritykset', N'Yritykset', N'Företag', N'Yksityinen', CAST(N'2021-03-23' AS Date), NULL, CAST(N'2022-05-03T16:45:29.6567000' AS DateTime2), N'p_lataa_varda_yritysmuoto', N'DWI\akoskini')
GO
INSERT [dw].[d_varda_yritysluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [yritysmuoto_ryhma_fi], [yritysmuoto_ryhma_en], [yritysmuoto_ryhma_sv], [yritys_tyyppi], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (14, N'44', N'Evankelis-luterilainen kirkko', N'Ev.luth.kyrkan', N'Evankelis-luterilainen kirkko', N'Evankelis-luterilainen kirkko', N'Ev.luth.kyrkan', N'Evankelis-luterilainen kirkko', N'Yhdistykset ja säätiöt', N'Yhdistykset ja säätiöt', N'Föreningar och stiftelser', N'Yksityinen', CAST(N'2021-03-23' AS Date), NULL, CAST(N'2022-05-03T16:45:29.6567000' AS DateTime2), N'p_lataa_varda_yritysmuoto', N'DWI\akoskini')
GO
INSERT [dw].[d_varda_yritysluokitus] ([id], [koodi], [nimi_fi], [nimi_sv], [nimi_en], [kuvaus_fi], [kuvaus_sv], [kuvaus_en], [yritysmuoto_ryhma_fi], [yritysmuoto_ryhma_en], [yritysmuoto_ryhma_sv], [yritys_tyyppi], [alkupvm], [loppupvm], [loadtime], [source], [username]) VALUES (15, N'6', N'Aatteellinen yhdistys', N'Ideell förening', N'Aatteellinen yhdistys', N'Aatteellinen yhdistys', N'Ideell förening', N'Aatteellinen yhdistys', N'Yhdistykset ja säätiöt', N'Yhdistykset ja säätiöt', N'Föreningar och stiftelser', N'Yksityinen', CAST(N'2021-03-23' AS Date), NULL, CAST(N'2022-05-03T16:45:29.6567000' AS DateTime2), N'p_lataa_varda_yritysmuoto', N'DWI\akoskini')
GO
SET IDENTITY_INSERT [dw].[d_varda_yritysluokitus] OFF
GO
ALTER TABLE [dw].[d_varda_ikaryhma] ADD  CONSTRAINT [DF__d_varda_ikaryhma__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [dw].[d_varda_ikaryhma] ADD  CONSTRAINT [DF__d_varda_ikaryhma__username]  DEFAULT (suser_name()) FOR [username]
GO
ALTER TABLE [dw].[d_varda_jarjestamismuoto] ADD  CONSTRAINT [DF__d_varda_jarjestamismuoto__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [dw].[d_varda_jarjestamismuoto] ADD  CONSTRAINT [DF__d_varda_jarjestamismuoto__username]  DEFAULT (suser_name()) FOR [username]
GO
ALTER TABLE [dw].[d_varda_kasvatusopillinenjarjestelma] ADD  CONSTRAINT [DF__d_varda_kasvatusopillinenjarjestelma__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [dw].[d_varda_kasvatusopillinenjarjestelma] ADD  CONSTRAINT [DF__d_varda_kasvatusopillinenjarjestelma__username]  DEFAULT (suser_name()) FOR [username]
GO
ALTER TABLE [dw].[d_varda_kielikoodistoopetushallinto] ADD  CONSTRAINT [DF__d_varda_kielikoodistoopetushallinto__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [dw].[d_varda_kielikoodistoopetushallinto] ADD  CONSTRAINT [DF__d_varda_kielikoodistoopetushallinto__username]  DEFAULT (suser_name()) FOR [username]
GO
ALTER TABLE [dw].[d_varda_kytkin] ADD  CONSTRAINT [DF__d_varda_kytkin__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [dw].[d_varda_kytkin] ADD  CONSTRAINT [DF__d_varda_kytkin__username]  DEFAULT (suser_sname()) FOR [username]
GO
ALTER TABLE [dw].[d_varda_maksuluokka] ADD  CONSTRAINT [DF__d_varda_maksuluokka__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [dw].[d_varda_maksuluokka] ADD  CONSTRAINT [DF__d_varda_maksuluokka__username]  DEFAULT (suser_name()) FOR [username]
GO
ALTER TABLE [dw].[d_varda_maksunperuste] ADD  CONSTRAINT [DF__d_varda_maksunperuste__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [dw].[d_varda_maksunperuste] ADD  CONSTRAINT [DF__d_varda_maksunperuste__username]  DEFAULT (suser_name()) FOR [username]
GO
ALTER TABLE [dw].[d_varda_tehtavanimike] ADD  CONSTRAINT [DF__d_varda_tehtavanimike__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [dw].[d_varda_tehtavanimike] ADD  CONSTRAINT [DF__d_varda_tehtavanimike__username]  DEFAULT (suser_name()) FOR [username]
GO
ALTER TABLE [dw].[d_varda_toiminnallinenpainotus] ADD  CONSTRAINT [DF__d_varda_toiminnallinenpainotus__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [dw].[d_varda_toiminnallinenpainotus] ADD  CONSTRAINT [DF__d_varda_toiminnallinenpainotus__username]  DEFAULT (suser_name()) FOR [username]
GO
ALTER TABLE [dw].[d_varda_toimintamuoto] ADD  CONSTRAINT [DF__d_varda_toimintamuoto__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [dw].[d_varda_toimintamuoto] ADD  CONSTRAINT [DF__d_varda_toimintamuoto__username]  DEFAULT (suser_name()) FOR [username]
GO
ALTER TABLE [dw].[d_varda_toimipaikkaluokitus] ADD  CONSTRAINT [DF__d_varda_toimipaikkaluokitus__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [dw].[d_varda_toimipaikkaluokitus] ADD  CONSTRAINT [DF__d_varda_toimipaikkaluokitus__username]  DEFAULT (suser_name()) FOR [username]
GO
ALTER TABLE [dw].[d_varda_tuntimaara_asteikko] ADD  CONSTRAINT [DF__d_varda_tuntimaara_asteikko__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [dw].[d_varda_tuntimaara_asteikko] ADD  CONSTRAINT [DF__d_varda_tuntimaara_asteikko__username]  DEFAULT (suser_name()) FOR [username]
GO
ALTER TABLE [dw].[d_varda_tutkinto] ADD  CONSTRAINT [DF__d_varda_tutkinto__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [dw].[d_varda_tutkinto] ADD  CONSTRAINT [DF__d_varda_tutkinto__username]  DEFAULT (suser_name()) FOR [username]
GO
ALTER TABLE [dw].[d_varda_tyoaika] ADD  CONSTRAINT [DF__d_varda_tyoaika__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [dw].[d_varda_tyoaika] ADD  CONSTRAINT [DF__d_varda_tyoaika__username]  DEFAULT (suser_name()) FOR [username]
GO
ALTER TABLE [dw].[d_varda_tyosuhde] ADD  CONSTRAINT [DF__d_varda_tyosuhde__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [dw].[d_varda_tyosuhde] ADD  CONSTRAINT [DF__d_varda_tyosuhde__username]  DEFAULT (suser_name()) FOR [username]
GO
ALTER TABLE [dw].[d_varda_varhaiskasvatuspaikkaluokitus] ADD  CONSTRAINT [DF__d_varda_varhaiskasvatuspaikkaluokitus__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [dw].[d_varda_varhaiskasvatuspaikkaluokitus] ADD  CONSTRAINT [DF__d_varda_varhaiskasvatuspaikkaluokitus__username]  DEFAULT (suser_name()) FOR [username]
GO
ALTER TABLE [dw].[d_varda_yritysluokitus] ADD  CONSTRAINT [DF__d_varda_yritysluokitus__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [dw].[d_varda_yritysluokitus] ADD  CONSTRAINT [DF__d_varda_yritysluokitus__username]  DEFAULT (suser_name()) FOR [username]
GO
