USE [ANTERO]
GO

ALTER TABLE [dw].[d_julkaisun_tekijan_rooli] DROP CONSTRAINT [DF__d_rooli__loadtime]
GO

/****** Object:  Table [dw].[d_julkaisun_tekijan_rooli]    Script Date: 4.5.2023 10:09:09 ******/
DROP TABLE IF EXISTS [dw].[d_julkaisun_tekijan_rooli]
GO

/****** Object:  Table [dw].[d_julkaisun_tekijan_rooli]    Script Date: 4.5.2023 10:09:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_julkaisun_tekijan_rooli](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[username] [nvarchar](128) NOT NULL,
	[source] [nvarchar](255) NULL,
	[rooli_koodi] [varchar](100) NULL,
	[rooli_fi] [nvarchar](255) NULL,
	[rooli_sv] [nvarchar](255) NULL,
	[rooli_en] [nvarchar](255) NULL,
 CONSTRAINT [PK__d_julkaisun_tekijan_rooli] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[d_julkaisun_tekijan_rooli] ADD  CONSTRAINT [DF__d_rooli__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_julkaisun_tekijan_rooli] ADD  CONSTRAINT [DF__d_rooli__username]  DEFAULT (suser_sname()) FOR [username]
GO


USE [ANTERO]