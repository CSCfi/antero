USE [Antero]
GO 
IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_amos_rahoitus_notes') 
BEGIN
CREATE TABLE [dw].[d_amos_rahoitus_notes](
 [noteid] [int] IDENTITY(1,1) NOT NULL,
 [pvm] [date] NOT NULL,
 [tekija] [varchar](50) NULL,
 [kommentti] [varchar](255) NULL
 )
END
