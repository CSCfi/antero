USE [Antero]
GO 
IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='f_amos_opiskelijavuodet') 
BEGIN
CREATE TABLE [dw].[f_amos_opiskelijavuodet](
 [vuosi] [int] NULL,
 [vaihe] [varchar](1) NULL,
 [d_organisaatioluokitus_id] [int] NULL,
 [profiilikerroin] [decimal](10, 4) NULL,
 [painottamaton_opiskelijavuosimaara] [decimal](10, 4) NULL,
 [painotettu_opiskelijavuosimäärä] [decimal](10, 4) NULL
)  
END
 