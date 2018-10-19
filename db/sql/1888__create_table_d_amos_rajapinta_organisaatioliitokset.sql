USE [Antero]
GO 
IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_amos_rajapinta_organisaatioliitokset') 
BEGIN
GO CREATE TABLE [dw].[d_amos_rajapinta_organisaatioliitokset](
 [vanha] [varchar](61) NOT NULL,
 [uusi] [varchar](50) NOT NULL,
 [voimaan_alkaen] [date] NOT NULL,
 [kommentti] [varchar](255) NULL,
 [tiedostonimi] [varchar](255) NULL,
 [latauspvm] [date] NULL
) ON [PRIMARY]

GO