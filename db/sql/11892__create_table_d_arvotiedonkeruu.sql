USE [ANTERO]
GO

/****** Object:  Table [dw].[d_arvotiedonkeruu_v2]    Script Date: 16.3.2026 10.15.52 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_arvotiedonkeruu]') AND type in (N'U'))
DROP TABLE [dw].[d_arvotiedonkeruu]
GO

/****** Object:  Table [dw].[d_arvotiedonkeruu_v2]    Script Date: 16.3.2026 10.15.52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_arvotiedonkeruu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[kyselyid] [int] NOT NULL,
	[kysely_fi] [nvarchar](500) NOT NULL,
	[kysely_sv] [nvarchar](500) NULL,
	[kysely_en] [nvarchar](500) NULL,
	[kyselytyyppi] [nvarchar](500) NULL,
	[kyselypohja_tarkenne_fi] [nvarchar](500) NULL,
	[kyselypohja_tarkenne_sv] [nvarchar](500) NULL,
	[kyselypohja_tarkenne_en] [nvarchar](500) NULL,
	[kyselypohja_tarkenne_amis_fi] [nvarchar](500) NULL,
	[kyselypohja_tarkenne_amis_sv] [nvarchar](500) NULL,
	[kyselypohja_tarkenne_amis_en] [nvarchar](500) NULL,
	[vuosi] [int] NULL,
	[jarjestys_aineistotyyppi_kyselyid]  AS (case when [kyselyid]=(-1) then '99999' else CONVERT([varchar](10),[kyselyid]) end),
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_arvotiedonkeruu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dw].[d_arvotiedonkeruu] ADD  CONSTRAINT [DF__d_arvotiedonkeruu__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_arvotiedonkeruu] ADD  CONSTRAINT [DF__d_arvotiedonkeruu__username]  DEFAULT (suser_sname()) FOR [username]