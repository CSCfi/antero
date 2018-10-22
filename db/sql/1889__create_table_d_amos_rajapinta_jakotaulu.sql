USE [Antero]
GO 
IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_amos_rajapinta_jakotaulu') 
BEGIN

CREATE TABLE [dw].[d_amos_rajapinta_jakotaulu](
 [versio] [varchar](50) NOT NULL,
 [kommentti] [varchar](255) NULL,
 [rahoitus_mukaanlukien_alv] [money] NOT NULL,
 [alv] [money] NOT NULL,
 [strategiarahoitus] [money] NOT NULL,
 [harkinnanvarainen_perusrahoitus] [money] NOT NULL,
 [kiky_kohdennus] [money] NOT NULL,
 [jako_ja_oikaisuvara] [money] NOT NULL
) 
END
GO
