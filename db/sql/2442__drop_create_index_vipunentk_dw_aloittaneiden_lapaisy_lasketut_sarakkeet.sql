USE [VipunenTK_DW]
GO

/****** Object:  Index [NonClusteredIndex-20190808-112218]    Script Date: 22.9.2019 13:53:57 ******/
DROP INDEX IF EXISTS [NonClusteredIndex-20190808-112218] ON [dbo].[_aloittaneiden_lapaisy_lasketut_sarakkeet]
GO

/****** Object:  Index [NonClusteredIndex-20190808-112218]    Script Date: 22.9.2019 13:53:57 ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_aloittaneiden_lapaisy_lasketut_sarakkeet_rivinumero] ON [dbo].[_aloittaneiden_lapaisy_lasketut_sarakkeet]
(
	[rivinumero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

USE [ANTERO]