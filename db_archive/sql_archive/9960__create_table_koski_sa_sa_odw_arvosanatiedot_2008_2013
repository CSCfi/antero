
USE [Koski_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS
  (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_odw_arvosanatiedot_2008_2013]' )
    AND type in (N'U'))
BEGIN


CREATE TABLE [sa].[sa_odw_arvosanatiedot_2008_2013](
[hetu] [varchar](15) NULL,
[todistus_vuosi] [int] NULL,
[luonti_pvm] [datetime] NULL,
[aine_tun] [varchar](10) NULL,
[on_valinnainen] [varchar](10) NULL,
[arvosana] [varchar](10) NULL,
[source] [varchar](255) NULL
) ON [PRIMARY]
GO


END
