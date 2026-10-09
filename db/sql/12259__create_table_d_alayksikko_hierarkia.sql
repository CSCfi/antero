USE [ANTERO]
GO

/****** Object:  Table [dw].[d_alayksikko_hierarkia]    Script Date: 9.10.2026 13.07.40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_alayksikko_hierarkia]') AND type in (N'U'))
DROP TABLE [dw].[d_alayksikko_hierarkia]
GO

/****** Object:  Table [dw].[d_alayksikko_hierarkia]    Script Date: 9.10.2026 13.07.40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_alayksikko_hierarkia](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[vuosi] [int] NOT NULL,
	[korkeakoulu_koodi] [nvarchar](10) NOT NULL,
	[alayksikko_koodi] [nvarchar](100) NOT NULL,
	[alayksikko_taso_1_koodi] [varchar](4000) NULL,
	[alayksikko_taso_1_fi] [nvarchar](100) NULL,
	[alayksikko_taso_1_en] [nvarchar](150) NULL,
	[alayksikko_taso_1_sv] [nvarchar](150) NULL,
	[alayksikko_taso_2_koodi] [varchar](4000) NULL,
	[alayksikko_taso_2_fi] [nvarchar](100) NULL,
	[alayksikko_taso_2_en] [nvarchar](150) NULL,
	[alayksikko_taso_2_sv] [nvarchar](150) NULL,
	[alayksikko_taso_3_koodi] [varchar](4000) NULL,
	[alayksikko_taso_3_fi] [nvarchar](100) NULL,
	[alayksikko_taso_3_en] [nvarchar](150) NULL,
	[alayksikko_taso_3_sv] [nvarchar](150) NULL,
	[alayksikko_taso_4_koodi] [varchar](4000) NULL,
	[alayksikko_taso_4_fi] [nvarchar](100) NULL,
	[alayksikko_taso_4_en] [nvarchar](150) NULL,
	[alayksikko_taso_4_sv] [nvarchar](150) NULL,
	[alayksikko_taso_5_koodi] [varchar](4000) NULL,
	[alayksikko_taso_5_fi] [nvarchar](100) NULL,
	[alayksikko_taso_5_en] [nvarchar](150) NULL,
	[alayksikko_taso_5_sv] [nvarchar](150) NULL,
	[alayksikko_taso_6_koodi] [varchar](4000) NULL,
	[alayksikko_taso_6_fi] [nvarchar](100) NULL,
	[alayksikko_taso_6_en] [nvarchar](150) NULL,
	[alayksikko_taso_6_sv] [nvarchar](150) NULL,
	[alayksikko_taso_7_koodi] [varchar](4000) NULL,
	[alayksikko_taso_7_fi] [nvarchar](100) NULL,
	[alayksikko_taso_7_en] [nvarchar](150) NULL,
	[alayksikko_taso_7_sv] [nvarchar](150) NULL,
	[source] [nvarchar](100) NULL,
	[loadtime] [date] NULL,
	[username] [nvarchar](100) NULL,
 CONSTRAINT [PK__d_alayksikko_hierarkia] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]