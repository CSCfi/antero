USE [Arvo_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_arvo_monivalintavaihtoehdot]') AND type in (N'U'))
BEGIN
	DROP TABLE [sa].[sa_arvo_monivalintavaihtoehdot]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_arvo_monivalintavaihtoehdot]') AND type in (N'U'))
BEGIN
	CREATE TABLE [sa].[sa_arvo_monivalintavaihtoehdot](
		[id] [bigint] IDENTITY(1,1) NOT NULL,
		[kysymysid] [int] NULL,
		[jarjestys][int] NULL,
		[monivalintavaihtoehto_fi] [nvarchar](max) NULL,
		[monivalintavaihtoehto_sv] [nvarchar](max) NULL,
		[monivalintavaihtoehto_en] [nvarchar](max) NULL,
		[loadtime] [datetime] NOT NULL,
		[username] [varchar](30) NOT NULL,
		[source] [varchar](100) NOT NULL,

	 CONSTRAINT [PK__sa_arvo_monivalintavaihtoehdot] PRIMARY KEY CLUSTERED
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
	) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[DF__sa_arvo_monivalintavaihtoehdot_loadtime]') AND type = 'D')
BEGIN
	ALTER TABLE [sa].[sa_arvo_monivalintavaihtoehdot] ADD  CONSTRAINT [DF__sa_arvo_monivalintavaihtoehdot_loadtime]  DEFAULT (getdate()) FOR [loadtime]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[DF__sa_arvo_monivalintavaihtoehdot_username]') AND type = 'D')
BEGIN
	ALTER TABLE [sa].[sa_arvo_monivalintavaihtoehdot] ADD  CONSTRAINT [DF__sa_arvo_monivalintavaihtoehdot_username]  DEFAULT (suser_sname()) FOR [username]
END

USE [ANTERO]
