USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS(
SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'f_amk_talous_vanha_koodisto' AND TABLE_SCHEMA = 'dw'
)
BEGIN

	CREATE TABLE [dw].[f_amk_talous_vanha_koodisto](
		[id] [int] IDENTITY(1,1) NOT NULL,
		[d_amk_id] [int] NOT NULL,
		[d_ohjauksenala_id] [int] NOT NULL,
		[d_tili_id] [int] NOT NULL,
		[d_aineistotyyppi_id] [int] NOT NULL,
		[d_toiminto_id] [int] NOT NULL,
		[d_erittely_id] [int] NOT NULL,
		[tilikausi] [int] NOT NULL,
		[arvo] [bigint] NULL,
		[loadtime] [datetime] NOT NULL,
		[source] [varchar](100) NOT NULL,
		[username] [varchar](30) NOT NULL,
		[Konserni] [char](1) NULL
	) ON [PRIMARY]

END
GO

ALTER TABLE [dw].[f_amk_talous_vanha_koodisto] ADD  CONSTRAINT [DF__f_amk_talous_vanha_koodisto_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_amk_talous_vanha_koodisto] ADD  CONSTRAINT [DF__f_amk_talous_vanha_koodisto_username]  DEFAULT (suser_sname()) FOR [username]
GO
