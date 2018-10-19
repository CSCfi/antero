USE [Antero]
GO 
IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='f_amos_tutkinnot') 
BEGIN
GO CREATE TABLE [dw].[f_amos_tutkinnot](
 [vuosi] [int] NULL,
 [vaihe] [varchar](1) NULL,
 [d_organisaatioluokitus_id] [int] NULL,
 [tutkintopisteiden_osuus] [decimal](10, 5) NULL,
 [painotettu_tutkintomaara] [decimal](10, 4) NULL,
 [painottamaton_tutkintomaara] [decimal](10, 4) NULL
) ON [PRIMARY]

GO
