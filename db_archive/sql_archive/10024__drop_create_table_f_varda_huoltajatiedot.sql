USE [ANTERO]
GO

ALTER TABLE [dw].[f_varda_huoltajatiedot] DROP CONSTRAINT [DF__varda_huoltajatiedot]
GO

ALTER TABLE [dw].[f_varda_huoltajatiedot] DROP CONSTRAINT [DF__f_varda_huoltajatiedot]
GO

/****** Object:  Table [dw].[f_varda_huoltajatiedot]    Script Date: 19.8.2024 12:27:44 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_varda_huoltajatiedot]') AND type in (N'U'))
DROP TABLE [dw].[f_varda_huoltajatiedot]
GO

/****** Object:  Table [dw].[f_varda_huoltajatiedot]    Script Date: 19.8.2024 12:27:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_varda_huoltajatiedot](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tilastovuosi] [int] NULL,
	[maksutieto_id] [nvarchar](200) NOT NULL,
	[lapsi_id] [int] NOT NULL,
	[henkilo_id] [int] NOT NULL,
	[yksityinen_jarjestaja] [varchar](10) NOT NULL,
	[d_maksun_peruste_id] [int] NOT NULL,
	[d_maksun_luokka_id] [int] NULL,
	[palveluseteli_arvo] [float] NULL,
	[asiakasmaksu] [float] NULL,
	[perheen_koko] [int] NULL,
	[alkamis_pvm] [date] NOT NULL,
	[paattymis_pvm] [date] NULL,
	[cum_sum_asiakasmaksu] [float] NULL,
	[cum_sum_palveluseteli_arvo] [float] NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dw].[f_varda_huoltajatiedot] ADD  CONSTRAINT [DF__f_varda_huoltajatiedot]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_varda_huoltajatiedot] ADD  CONSTRAINT [DF__varda_huoltajatiedot]  DEFAULT (suser_sname()) FOR [username]
GO


