USE [ANTERO]
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vipunen_raportit_kaannokset]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[vipunen_raportit_kaannokset](
	[raportti] [nvarchar](1000) NULL,
	[kaannos_sv] [int] NOT NULL,
	[kaannos_en] [int] NOT NULL,
	[username] [nvarchar](128) NULL,
	[loadtime] [datetime] NOT NULL
) ON [PRIMARY]

END

GO

USE [ANTERO]

