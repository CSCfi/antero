USE [ANTERO]
GO


/****** Object:  Table [sa].[sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet]    Script Date: 4.6.2024 13:25:30 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet]') AND type in (N'U'))
DROP TABLE [sa].[sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet]
DROP TABLE IF EXISTS sa.sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet_uusi_rahoitusmalli
GO

/****** Object:  Table [sa].[sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet]    Script Date: 4.6.2024 13:25:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[alkamispvm] [date] NULL,
	[aloitusvuosi] [int] NULL,
	[ika] [smallint] NULL,
	[kaytetytlukukaudet] [int] NULL,
	[kaytetytpoissakoodi2kaudet] [int] NULL,
	[kaytetytpoissakoodi2paivia] [int] NULL,
	[kaytetytpoissakoodi3kaudet] [int] NULL,
	[kaytetytpoissakoodi3paivia] [int] NULL,
	[kk] [varchar](20) NULL,
	[lasnaololukukaudet] [int] NULL,
	[onaiempitutkinto] [smallint] NULL,
	[opintosuoritusavain] [varchar](100) NULL,
	[opiskelijaavain] [varchar](100) NULL,
	[opiskeluoikeusAvain] [varchar](100) NULL,
	[oppilaitosnro] [varchar](6) NULL,
	[paivia] [int] NULL,
	[sukupuoli] [smallint] NULL,
	[tavoiteaikavuosia] [float] NULL,
	[tavoiteajassavalmistunut] [smallint] NULL,
	[tavoitelukukaudet] [int] NULL,
	[tutkinnonsuorituspvm] [date] NULL,
	[tutkintokerroin] [float] NULL,
	[tutkintokoodi] [varchar](6) NULL,
	[tutkintovuosi] [int] NULL,
	[vaadittuop] [int] NULL,
	[vuosia] [float] NULL,
	[xkoulutuskieli] [char](2) NULL,
	[xkoulutuskunta] [varchar](3) NULL,
	[xonenintaan12kk] [smallint] NULL,
	[xonryhmaa] [smallint] NULL,
	[xonryhmab] [smallint] NULL,
	[xonryhmac] [smallint] NULL,
	[xonyli12kk] [smallint] NULL,
	[xxalasnaololukukaudet] [int] NULL,
	[xxblasnaolokuukaudet] [int] NULL,
	[xxcpoissaololukukaudet] [int] NULL,
	[xxdpoissaolokuukaudet] [int] NULL,
	[xxetavoiteaikakuukausia] [int] NULL,
	[xxfkaytettyaikakk] [int] NULL,
	[xxgkokonaisaikakk] [int] NULL,
	[xxhaiempitutkintokoodi] [varchar](6) NULL,
	[xxiaiempitutkintosuorituspvm] [date] NULL,
	[xxjaiempikk] [varchar](20) NULL,
	[xxksiirtoopiskelija] [smallint] NULL,
	[xxlavoimenvayla] [smallint] NULL,
	[xxlkoulutustyyppi] [smallint] NULL,
	[xxltutkintoryhma] [char](1) NULL,
	[xxmikatutkinnonaloitusajankohtana] [smallint] NULL,
	[xxmrahoituslahde] [smallint] NULL,
	[xxxsamakoodi] [smallint] NULL,
	[xxxvaihdossalyhyt] [smallint] NULL,
	[xxxvaihdossapitka] [smallint] NULL,
	[xxxvaihdossavirtuaalinenblended] [smallint] NULL,
	[xxxxvaihdonkestopaivissa] [int] NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [sa].[sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet] ADD  CONSTRAINT [DF__sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet] ADD  CONSTRAINT [DF__sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet__username]  DEFAULT (suser_name()) FOR [username]
GO

USE [ANTERO]