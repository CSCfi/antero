USE [Antero]
GO 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO 

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_amos_rajapinta_organisaatioliitokset') 
BEGIN
CREATE TABLE [dw].[d_amos_rajapinta_organisaatioliitokset](
 [vanha] [varchar](61) NOT NULL,
 [uusi] [varchar](50) NOT NULL,
 [voimaan_alkaen] [date] NOT NULL,
 [kommentti] [varchar](255) NULL,
 [tiedostonimi] [varchar](255) NULL,
 [latauspvm] [date] NULL
) ON [PRIMARY]

GO