USE [Koski_SA]
GO

DROP TABLE IF EXISTS [dbo].[esi_ja_perus_oppilaat_aipe_lukukausittain_vaihe_priorisoitu]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[esi_ja_perus_oppilaat_aipe_lukukausittain_vaihe_priorisoitu](
	[vuosi] [int] NULL,
	[lukuvuosi] [nvarchar](20) NULL,
	[opiskeluoikeus_oid] [varchar](100) NULL,
	[paatason_suoritus_id] [bigint] NULL,
	[vaihe_koodi_priorisoitu] [decimal](2, 1) NULL
) ON [PRIMARY]
GO
