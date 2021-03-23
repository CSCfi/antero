USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dw' and TABLE_NAME='d_arvo_teema')

BEGIN
	DROP TABLE [dw].[d_arvo_teema]
END
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dw' and TABLE_NAME='d_arvo_teema')
BEGIN
	CREATE TABLE [dw].[d_arvo_teema](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[koodi][nvarchar](100)  NULL,
		[teema_fi] [nvarchar](500) NULL,
		[teema_sv] [nvarchar](500) NULL,
		[teema_en] [nvarchar](500) NULL,
		[hierarkiataso] [nvarchar](500) NULL,
		[jarjestys] [int] NULL,
		[loadtime] [datetime] NOT NULL,
		[source] [nvarchar](100) NOT NULL,
		[username] [nvarchar](30) NOT NULL,
	 CONSTRAINT [PK__d_arvo_teema] PRIMARY KEY CLUSTERED
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

END
GO

ALTER TABLE [dw].[d_arvo_teema] ADD  CONSTRAINT [DF__d_arvo_teema__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_arvo_teema] ADD  CONSTRAINT [DF__d_arvoteema__username]  DEFAULT (suser_sname()) FOR [username]
GO
