USE [ANTERO]
GO

/****** Object:  Table [dw].[d_koskiyokokeet]    Script Date: 27.4.2026 14.28.55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_koskiyokokeet]') AND type in (N'U'))
DROP TABLE [dw].[d_koskiyokokeet]
GO

/****** Object:  Table [dw].[d_koskiyokokeet]    Script Date: 27.4.2026 14.28.55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_koskiyokokeet](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[koodi] [varchar](200) NOT NULL,
	[aine_selite_fi] [varchar](300) NOT NULL,
	[aine_selite_sv] [varchar](300) NULL,
	[aine_selite_en] [varchar](300) NULL,
	[laajuus_fi] [varchar](300) NULL,
	[laajuus_sv] [varchar](300) NULL,
	[laajuus_en] [varchar](300) NULL,
	[aineryhma_selite_fi] [varchar](300) NOT NULL,
	[aineryhma_selite_sv] [varchar](300) NULL,
	[aineryhma_selite_en] [varchar](300) NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK_d_koskiyokokeet] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dw].[d_koskiyokokeet] ADD  CONSTRAINT [DF__d_koskiyokokeet__loadtime__5224328E]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_koskiyokokeet] ADD  CONSTRAINT [DF__d_koskiyokokeet__username__531856C7]  DEFAULT (suser_sname()) FOR [username]