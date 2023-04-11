USE [ANTERO]
GO

ALTER TABLE [dw].[d_kieli] DROP CONSTRAINT [DF__d_kieli__username]
GO

ALTER TABLE [dw].[d_kieli] DROP CONSTRAINT [DF__d_kieli__loadtime]
GO

/****** Object:  Table [dw].[d_kieli]    Script Date: 11.4.2023 9:56:58 ******/
DROP TABLE [dw].[d_kieli]
GO

/****** Object:  Table [dw].[d_kieli]    Script Date: 11.4.2023 9:56:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_kieli](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[kieli_koodi] [varchar](6) NULL,
	[kieli_fi] [nvarchar](100) NULL,
	[kieli_sv] [nvarchar](100) NULL,
	[kieli_en] [nvarchar](100) NULL,
	[kieliryhma1_koodi] [int] NULL,
	[kieliryhma1_fi] [nvarchar](100) NULL,
	[kieliryhma1_sv] [nvarchar](100) NULL,
	[kieliryhma1_en] [nvarchar](100) NULL,
	[kieliryhma2_koodi] [int] NULL,
	[kieliryhma2_fi] [nvarchar](100) NULL,
	[kieliryhma2_sv] [nvarchar](100) NULL,
	[kieliryhma2_en] [nvarchar](100) NULL,
	[jarjestys_kieliryhma1]  AS (case when [kieliryhma1_koodi]='-1' then (99999) else [kieliryhma1_koodi] end),
	[jarjestys_kieliryhma2]  AS (case when [kieliryhma2_koodi]='-1' then (99999) else [kieliryhma2_koodi] end),
	[suorituskieli_yleissivistava_fi] [nvarchar](100) NULL,
	[suorituskieli_yleissivistava_sv] [nvarchar](100) NULL,
	[suorituskieli_yleissivistava_en] [nvarchar](100) NULL,
	[suorituskieli_ammatillinen_fi] [nvarchar](100) NULL,
	[suorituskieli_ammatillinen_sv] [nvarchar](100) NULL,
	[suorituskieli_ammatillinen_en] [nvarchar](100) NULL,
 CONSTRAINT [PK__d_kieli] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[d_kieli] ADD  CONSTRAINT [DF__d_kieli__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_kieli] ADD  CONSTRAINT [DF__d_kieli__username]  DEFAULT (suser_name()) FOR [username]
GO

USE [ANTERO]