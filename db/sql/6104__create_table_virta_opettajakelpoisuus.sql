USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[virta_opettajakelpoisuus]') AND type in (N'U'))

BEGIN

CREATE TABLE [sa].[virta_opettajakelpoisuus](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[alkamispvm] [bigint] NULL,
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
	[tutkinnonsuorituspvm] [bigint] NULL,
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
	[xxiaiempitutkintosuorituspvm] [bigint] NULL,
	[xxjaiempikk] [varchar](20) NULL,
	[xxksiirtoopiskelija] [smallint] NULL,
	[xxlavoimenvayla] [smallint] NULL,
	[xxlkoulutustyyppi] [smallint] NULL,
	[xxltutkintoryhma] [char](1) NULL,
	[xxmikatutkinnonaloitusajankohtana] [smallint] NULL,
	[xxmrahoituslahde] [smallint] NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL
) ON [PRIMARY]

END

GO

USE [ANTERO]
