USE [VipunenTK_DW]
GO

ALTER TABLE [dbo].[d_tutkintonimike_ammpk] DROP CONSTRAINT IF EXISTS [DF__d_tutkintonimike_ammpk__tietolahde]
GO

ALTER TABLE [dbo].[d_tutkintonimike_ammpk] DROP CONSTRAINT IF EXISTS [DF__d_tutkintonimike_ammpk__paattyy]
GO

ALTER TABLE [dbo].[d_tutkintonimike_ammpk] DROP CONSTRAINT IF EXISTS [DF__d_tutkintonimike_ammpk__alkaa]
GO

/****** Object:  Table [dbo].[d_tutkintonimike_ammpk]    Script Date: 20.8.2021 18:13:15 ******/
DROP TABLE [dbo].[d_tutkintonimike_ammpk]
GO

/****** Object:  Table [dbo].[d_tutkintonimike_ammpk]    Script Date: 20.8.2021 18:13:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[d_tutkintonimike_ammpk](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkintonimike_ammpk_koodi] [nvarchar](5) NULL,
	[tutkintonimike_ammpk] [nvarchar](250) NULL,
	[tutkintonimike_ammpk_SV] [nvarchar](250) NULL,
	[tutkintonimike_ammpk_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[d_tutkintonimike_ammpk] ADD  CONSTRAINT [DF__d_tutkintonimike_ammpk__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO

ALTER TABLE [dbo].[d_tutkintonimike_ammpk] ADD  CONSTRAINT [DF__d_tutkintonimike_ammpk__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO

ALTER TABLE [dbo].[d_tutkintonimike_ammpk] ADD  CONSTRAINT [DF__d_tutkintonimike_ammpk__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
GO


