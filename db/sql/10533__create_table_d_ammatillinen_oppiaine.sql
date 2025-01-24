USE [ANTERO]
GO

/****** Object:  Table [dw].[d_ammatillinen_oppiaine]    Script Date: 24.1.2025 10.30.03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_ammatillinen_oppiaine]') AND type in (N'U'))
DROP TABLE [dw].[d_ammatillinen_oppiaine]
GO

/****** Object:  Table [dw].[d_ammatillinen_oppiaine]    Script Date: 24.1.2025 10.30.03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_ammatillinen_oppiaine](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[koodi] [nvarchar](100) NOT NULL,
	[nimi] [nvarchar](200) NULL,
	[nimi_sv] [nvarchar](200) NULL,
	[nimi_en] [nvarchar](200) NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_ammatillinen_oppiaine] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dw].[d_ammatillinen_oppiaine] ADD  CONSTRAINT [DF__d_ammatillinen_oppiaine__loadtime__5224328E]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_ammatillinen_oppiaine] ADD  CONSTRAINT [DF__d_ammatillinen_oppiaine__username__531856C7]  DEFAULT (suser_sname()) FOR [username]
GO


USE [ANTERO]