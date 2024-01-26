USE [ANTERO]
GO

ALTER TABLE [dw].[d_ainekelpoisuus] DROP CONSTRAINT [DF__d_ainekelpoisuus__username__531856C7]
GO

ALTER TABLE [dw].[d_ainekelpoisuus] DROP CONSTRAINT [DF__d_ainekelpoisuus__loadtime__5224328E]
GO

/****** Object:  Table [dw].[d_ainekelpoisuus]    Script Date: 19.4.2023 10:05:17 ******/
DROP TABLE [dw].[d_ainekelpoisuus]
GO

/****** Object:  Table [dw].[d_ainekelpoisuus]    Script Date: 19.4.2023 10:05:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_ainekelpoisuus](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[aine_fi] [varchar](100) NOT NULL,
	[aine_sv] [varchar](100) NOT NULL,
	[aine_en] [varchar](100) NOT NULL,
	[aineryhma_1_fi] [varchar](100) NOT NULL,
	[aineryhma_1_sv] [varchar](100) NULL,
	[aineryhma_1_en] [varchar](100) NULL,
	[aineryhma_2_fi] [varchar](100) NOT NULL,
	[aineryhma_2_sv] [varchar](100) NULL,
	[aineryhma_2_en] [varchar](100) NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK_d_ainekelpoisuus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[d_ainekelpoisuus] ADD  CONSTRAINT [DF__d_ainekelpoisuus__loadtime__5224328E]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_ainekelpoisuus] ADD  CONSTRAINT [DF__d_ainekelpoisuus__username__531856C7]  DEFAULT (suser_sname()) FOR [username]
GO

USE [ANTERO]