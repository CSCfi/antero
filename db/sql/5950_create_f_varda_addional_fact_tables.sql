USE [ANTERO]
GO

/****** Object:  Table [dw].[f_varda_jarjestamismuoto]    Script Date: 1.3.2022 10.50.23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (select * from sysobjects where name = 'f_varda_jarjestamismuoto' and xtype='U')

BEGIN;

CREATE TABLE [dw].[f_varda_jarjestamismuoto](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[tilastovuosi] [int] NULL,
	[d_varda_jarjestamismuoto_id_jm01] [int] NULL,
	[d_varda_jarjestamismuoto_id_jm02] [int] NULL,
	[d_varda_jarjestamismuoto_id_jm03] [int] NULL,
	[d_varda_jarjestamismuoto_id_jm04] [int] NULL,
	[d_varda_jarjestamismuoto_id_jm05] [int] NULL,
	[alkamis_pvm] [date] NULL,
	[paattymis_pvm] [nvarchar](200) NULL,
	[toimipaikka_id] [int] NOT NULL,
	[tilastovuosi_toimipaikka_oid] [nvarchar](100) NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__f_varda_jarjestamismuoto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dw].[f_varda_jarjestamismuoto] ADD  CONSTRAINT [DF__f_varda_jarjestamismuoto__loadtime]  DEFAULT (getdate()) FOR [loadtime]

ALTER TABLE [dw].[f_varda_jarjestamismuoto] ADD  CONSTRAINT [DF__f_varda_jarjestamismuoto__username]  DEFAULT (suser_name()) FOR [username]
END;

IF NOT EXISTS (select * from sysobjects where name = 'f_varda_huoltajatiedot' and xtype='U')

BEGIN;

CREATE TABLE [dw].[f_varda_huoltajatiedot](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tilastovuosi] [int] NULL,
	[maksutieto_id] [nvarchar](200) NOT NULL,
	[lapsi_id] [int] NOT NULL,
	[henkilo_id] [int] NOT NULL,
	[yksityinen_jarjestaja] [varchar](10) NOT NULL,
	[d_maksun_peruste_id] [int] NOT NULL,
	[d_maksun_luokka_id] [int] NULL,
	[palveluseteli_arvo] [float] NOT NULL,
	[asiakasmaksu] [float] NULL,
	[perheen_koko] [int] NOT NULL,
	[alkamis_pvm] [date] NOT NULL,
	[paattymis_pvm] [date] NULL,
	[cum_sum] [float] NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL
) ON [PRIMARY]

ALTER TABLE [dw].[f_varda_huoltajatiedot] ADD  CONSTRAINT [DF__f_varda_huoltajatiedot]  DEFAULT (getdate()) FOR [loadtime]

ALTER TABLE [dw].[f_varda_huoltajatiedot] ADD  CONSTRAINT [DF__varda_huoltajatiedot]  DEFAULT (suser_sname()) FOR [username]
END;