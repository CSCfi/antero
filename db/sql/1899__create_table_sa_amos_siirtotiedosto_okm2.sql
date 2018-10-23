USE [Antero]
GO 
IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='sa_amos_siirtotiedosto_okm2') 
BEGIN
CREATE TABLE [sa].[sa_amos_siirtotiedosto_okm2](
 [id] [bigint] IDENTITY(1,1) NOT NULL,
 [versio] [varchar](50) NOT NULL,
 [kommentti] [varchar](255) NULL,
 [rahoitus_mukaanlukien_alv] [float] NOT NULL,
 [alv] [float] NOT NULL,
 [strategiarahoitus] [float] NOT NULL,
 [harkinnanvarainen_perusrahoitus] [float] NOT NULL,
 [kiky_kohdennus] [float] NOT NULL,
 [jako_ja_oikaisuvara] [float] NOT NULL,
 [karin_oma_sarake1] [varchar](max) NULL,
 [karin_oma_sarake2] [varchar](max) NULL,
 [karin_oma_sarake3] [varchar](max) NULL,
 [tiedostonimi] [varchar](255) NULL,
 [latauspvm] [date] NULL,
 [lastmodified] [datetime] NULL,
 [username] [varchar](100) NULL,
 [loadtime] [datetime] NULL)
END
