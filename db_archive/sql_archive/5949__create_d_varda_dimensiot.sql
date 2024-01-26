USE [ANTERO]
GO

/****** Object:  Table [dw].[d_varda_ikaryhma]    Script Date: 28.2.2022 16.51.46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (select * from sysobjects where name = 'd_varda_ikaryhma' and xtype='U')

BEGIN;
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

ALTER TABLE [dw].[d_varda_ikaryhma] ADD  CONSTRAINT [DF__d_varda_ikaryhma__loadtime]  DEFAULT (getdate()) FOR [loadtime]

ALTER TABLE [dw].[d_varda_ikaryhma] ADD  CONSTRAINT [DF__d_varda_ikaryhma__username]  DEFAULT (suser_name()) FOR [username]
END;

IF NOT EXISTS (select * from sysobjects where name = 'd_varda_jarjestamismuoto' and xtype='U')

BEGIN;

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

ALTER TABLE [dw].[d_varda_jarjestamismuoto] ADD  CONSTRAINT [DF__d_varda_jarjestamismuoto__loadtime]  DEFAULT (getdate()) FOR [loadtime]

ALTER TABLE [dw].[d_varda_jarjestamismuoto] ADD  CONSTRAINT [DF__d_varda_jarjestamismuoto__username]  DEFAULT (suser_name()) FOR [username]
END;

IF NOT EXISTS (select * from sysobjects where name = 'd_varda_kasvatusopillinenjarjestelma' and xtype='U')

BEGIN;

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

ALTER TABLE [dw].[d_varda_kasvatusopillinenjarjestelma] ADD  CONSTRAINT [DF__d_varda_kasvatusopillinenjarjestelma__loadtime]  DEFAULT (getdate()) FOR [loadtime]

ALTER TABLE [dw].[d_varda_kasvatusopillinenjarjestelma] ADD  CONSTRAINT [DF__d_varda_kasvatusopillinenjarjestelma__username]  DEFAULT (suser_name()) FOR [username]
END;


IF NOT EXISTS (select * from sysobjects where name = 'd_varda_kielikoodistoopetushallinto' and xtype='U')

BEGIN;

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

ALTER TABLE [dw].[d_varda_kielikoodistoopetushallinto] ADD  CONSTRAINT [DF__d_varda_kielikoodistoopetushallinto__loadtime]  DEFAULT (getdate()) FOR [loadtime]

ALTER TABLE [dw].[d_varda_kielikoodistoopetushallinto] ADD  CONSTRAINT [DF__d_varda_kielikoodistoopetushallinto__username]  DEFAULT (suser_name()) FOR [username]
END;

IF NOT EXISTS (select * from sysobjects where name = 'd_varda_kytkin' and xtype='U')

BEGIN;

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

ALTER TABLE [dw].[d_varda_kytkin] ADD  CONSTRAINT [DF__d_varda_kytkin__loadtime]  DEFAULT (getdate()) FOR [loadtime]

ALTER TABLE [dw].[d_varda_kytkin] ADD  CONSTRAINT [DF__d_varda_kytkin__username]  DEFAULT (suser_sname()) FOR [username]
END;

IF NOT EXISTS (select * from sysobjects where name = 'd_varda_maksuluokka' and xtype='U')

BEGIN;

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

ALTER TABLE [dw].[d_varda_maksuluokka] ADD  CONSTRAINT [DF__d_varda_maksuluokka__loadtime]  DEFAULT (getdate()) FOR [loadtime]

ALTER TABLE [dw].[d_varda_maksuluokka] ADD  CONSTRAINT [DF__d_varda_maksuluokka__username]  DEFAULT (suser_name()) FOR [username]
END;

IF NOT EXISTS (select * from sysobjects where name = 'd_varda_maksunperuste' and xtype='U')

BEGIN;

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

ALTER TABLE [dw].[d_varda_maksunperuste] ADD  CONSTRAINT [DF__d_varda_maksunperuste__loadtime]  DEFAULT (getdate()) FOR [loadtime]

ALTER TABLE [dw].[d_varda_maksunperuste] ADD  CONSTRAINT [DF__d_varda_maksunperuste__username]  DEFAULT (suser_name()) FOR [username]
END;

IF NOT EXISTS (select * from sysobjects where name = 'd_varda_tehtavanimike' and xtype='U')

BEGIN;


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

ALTER TABLE [dw].[d_varda_tehtavanimike] ADD  CONSTRAINT [DF__d_varda_tehtavanimike__loadtime]  DEFAULT (getdate()) FOR [loadtime]

ALTER TABLE [dw].[d_varda_tehtavanimike] ADD  CONSTRAINT [DF__d_varda_tehtavanimike__username]  DEFAULT (suser_name()) FOR [username]
END;

IF NOT EXISTS (select * from sysobjects where name = 'd_varda_toiminnallinenpainotus' and xtype='U')

BEGIN;

CREATE TABLE [dw].[d_varda_toiminnallinenpainotus](
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
 CONSTRAINT [PK__d_varda_toiminnallinenpainotus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dw].[d_varda_toiminnallinenpainotus] ADD  CONSTRAINT [DF__d_varda_toiminnallinenpainotus__loadtime]  DEFAULT (getdate()) FOR [loadtime]

ALTER TABLE [dw].[d_varda_toiminnallinenpainotus] ADD  CONSTRAINT [DF__d_varda_toiminnallinenpainotus__username]  DEFAULT (suser_name()) FOR [username]
END;

IF NOT EXISTS (select * from sysobjects where name = 'd_varda_toimintamuoto' and xtype='U')

BEGIN;

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

ALTER TABLE [dw].[d_varda_toimintamuoto] ADD  CONSTRAINT [DF__d_varda_toimintamuoto__loadtime]  DEFAULT (getdate()) FOR [loadtime]

ALTER TABLE [dw].[d_varda_toimintamuoto] ADD  CONSTRAINT [DF__d_varda_toimintamuoto__username]  DEFAULT (suser_name()) FOR [username]
END;

IF NOT EXISTS (select * from sysobjects where name = 'd_varda_toimipaikkaluokitus' and xtype='U')

BEGIN;

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

ALTER TABLE [dw].[d_varda_toimipaikkaluokitus] ADD  CONSTRAINT [DF__d_varda_toimipaikkaluokitus__loadtime]  DEFAULT (getdate()) FOR [loadtime]

ALTER TABLE [dw].[d_varda_toimipaikkaluokitus] ADD  CONSTRAINT [DF__d_varda_toimipaikkaluokitus__username]  DEFAULT (suser_name()) FOR [username]
END;

IF NOT EXISTS (select * from sysobjects where name = 'd_varda_tuntimaara_asteikko' and xtype='U')

BEGIN;


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

ALTER TABLE [dw].[d_varda_tuntimaara_asteikko] ADD  CONSTRAINT [DF__d_varda_tuntimaara_asteikko__loadtime]  DEFAULT (getdate()) FOR [loadtime]

ALTER TABLE [dw].[d_varda_tuntimaara_asteikko] ADD  CONSTRAINT [DF__d_varda_tuntimaara_asteikko__username]  DEFAULT (suser_name()) FOR [username]
END;

IF NOT EXISTS (select * from sysobjects where name = 'd_varda_tutkinto' and xtype='U')

BEGIN;

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

ALTER TABLE [dw].[d_varda_tutkinto] ADD  CONSTRAINT [DF__d_varda_tutkinto__loadtime]  DEFAULT (getdate()) FOR [loadtime]

ALTER TABLE [dw].[d_varda_tutkinto] ADD  CONSTRAINT [DF__d_varda_tutkinto__username]  DEFAULT (suser_name()) FOR [username]
END;


IF NOT EXISTS (select * from sysobjects where name = 'd_varda_tyoaika' and xtype='U')

BEGIN;

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

ALTER TABLE [dw].[d_varda_tyoaika] ADD  CONSTRAINT [DF__d_varda_tyoaika__loadtime]  DEFAULT (getdate()) FOR [loadtime]

ALTER TABLE [dw].[d_varda_tyoaika] ADD  CONSTRAINT [DF__d_varda_tyoaika__username]  DEFAULT (suser_name()) FOR [username]
END;

IF NOT EXISTS (select * from sysobjects where name = 'd_varda_tyosuhde' and xtype='U')

BEGIN;

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

ALTER TABLE [dw].[d_varda_tyosuhde] ADD  CONSTRAINT [DF__d_varda_tyosuhde__loadtime]  DEFAULT (getdate()) FOR [loadtime]

ALTER TABLE [dw].[d_varda_tyosuhde] ADD  CONSTRAINT [DF__d_varda_tyosuhde__username]  DEFAULT (suser_name()) FOR [username]
END;

IF NOT EXISTS (select * from sysobjects where name = 'd_varda_varhaiskasvatuspaikkaluokitus' and xtype='U')

BEGIN;

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

ALTER TABLE [dw].[d_varda_varhaiskasvatuspaikkaluokitus] ADD  CONSTRAINT [DF__d_varda_varhaiskasvatuspaikkaluokitus__loadtime]  DEFAULT (getdate()) FOR [loadtime]

ALTER TABLE [dw].[d_varda_varhaiskasvatuspaikkaluokitus] ADD  CONSTRAINT [DF__d_varda_varhaiskasvatuspaikkaluokitus__username]  DEFAULT (suser_name()) FOR [username]
END;

IF NOT EXISTS (select * from sysobjects where name = 'd_varda_yritysluokitus' and xtype='U')

BEGIN;

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

ALTER TABLE [dw].[d_varda_yritysluokitus] ADD  CONSTRAINT [DF__d_varda_yritysluokitus__loadtime]  DEFAULT (getdate()) FOR [loadtime]

ALTER TABLE [dw].[d_varda_yritysluokitus] ADD  CONSTRAINT [DF__d_varda_yritysluokitus__username]  DEFAULT (suser_name()) FOR [username]
END;
