USE [ANTERO]
GO


/****** Object:  Table [dw].[d_haku_ovara]    Script Date: 4.2.2026 8.57.38 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_haku_ovara]') AND type in (N'U'))
DROP TABLE [dw].[d_haku]
DROP TABLE IF EXISTS [dw].[d_haku_ovara]
GO

/****** Object:  Table [dw].[d_haku_ovara]    Script Date: 4.2.2026 8.57.38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_haku](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[haku_oid] [nvarchar](255) NULL,
	[haun_nimi_fi] [nvarchar](255) NULL,
	[haun_nimi_sv] [nvarchar](255) NULL,
	[haun_nimi_en] [nvarchar](255) NULL,
	[hakutyyppi_koodi] [nvarchar](255) NULL,
	[hakutyyppi_fi] [nvarchar](255) NULL,
	[hakutyyppi_sv] [nvarchar](255) NULL,
	[hakutyyppi_en] [nvarchar](255) NULL,
	[hakutapa_koodi] [nvarchar](255) NULL,
	[hakutapa_fi] [nvarchar](255) NULL,
	[hakutapa_sv] [nvarchar](255) NULL,
	[hakutapa_en] [nvarchar](255) NULL,
	[hakuryhma_koodi] [nvarchar](255) NULL,
	[hakuryhma_fi] [nvarchar](255) NULL,
	[hakuryhma_sv] [nvarchar](255) NULL,
	[hakuryhma_en] [nvarchar](255) NULL,
	[hakuaika_fi] [nvarchar](255) NULL,
	[hakuaika_sv] [nvarchar](255) NULL,
	[hakuaika_en] [nvarchar](255) NULL,
	[kohdejoukontarkenne_koodi] [nvarchar](255) NULL,
	[kohdejoukontarkenne_fi] [nvarchar](255) NULL,
	[kohdejoukontarkenne_sv] [nvarchar](255) NULL,
	[kohdejoukontarkenne_en] [nvarchar](255) NULL,
	[korkeakouluhaku] [int] NULL,
	[jarjestys_hakutyyppi]  AS (case when [hakutyyppi_koodi]='-1' then '99999' else CONVERT([int],[hakutyyppi_koodi]) end),
	[jarjestys_hakutapa]  AS (case when [hakutapa_koodi]='-1' then '99999' else CONVERT([int],[hakutapa_koodi]) end),
	[jarjestys_kohdejoukontarkenne]  AS (case when [kohdejoukontarkenne_koodi]='-1' then '99999' else CONVERT([int],[kohdejoukontarkenne_koodi]) end),
	[jarjestys_hakuaika] [int] NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[hakutapa2_fi] [varchar](50) NULL,
	[hakutapa2_sv] [varchar](50) NULL,
	[hakutapa2_en] [varchar](50) NULL,
	[jarjestys_hakutapa2] [int] NULL,
 CONSTRAINT [PK__d_haku] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dw].[d_haku] ADD  CONSTRAINT [DF_d_haku_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_haku] ADD  CONSTRAINT [DF_d_haku_username]  DEFAULT (suser_sname()) FOR [username]