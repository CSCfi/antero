USE [ANTERO]
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vipunen_raportit_fi]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[vipunen_raportit_fi](
	[raportti] [nvarchar](1000) NULL,
	[osio] [nvarchar](100) NULL,
	[alaosio] [nvarchar](100) NULL,
	[teksti] [nvarchar](1000) NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](30) NULL
) ON [PRIMARY]

ALTER TABLE [dbo].[vipunen_raportit_fi] ADD  CONSTRAINT [DF__vipunen_raportit_fi__loadtime__5224328E]  DEFAULT (getdate()) FOR [loadtime]

ALTER TABLE [dbo].[vipunen_raportit_fi] ADD  CONSTRAINT [DF__vipunen_raportit_fi__username__531856C7]  DEFAULT (suser_sname()) FOR [username]

END

GO

USE [ANTERO]

