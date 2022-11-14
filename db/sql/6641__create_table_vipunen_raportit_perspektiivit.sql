USE [ANTERO]
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vipunen_raportit_perspektiivit]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[vipunen_raportit_perspektiivit](
	[raportti] [nvarchar](1000) NULL,
	[tabular] [nvarchar](100) NULL,
	[perspective] [nvarchar](100) NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](30) NULL
) ON [PRIMARY]

ALTER TABLE [dbo].[vipunen_raportit_perspektiivit] ADD  CONSTRAINT [DF__vipunen_raportit_perspektiivit__loadtime__5224328E]  DEFAULT (getdate()) FOR [loadtime]

ALTER TABLE [dbo].[vipunen_raportit_perspektiivit] ADD  CONSTRAINT [DF__vipunen_raportit_perspektiivit__username__531856C7]  DEFAULT (suser_sname()) FOR [username]


END

GO

USE [ANTERO]

