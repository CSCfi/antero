USE [ANTERO]
GO

/****** Object:  Table [dw].[d_oef_osaaminen]    Script Date: 19.12.2024 15.33.25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_oef_osaaminen]') AND type in (N'U'))
DROP TABLE [dw].[d_oef_osaaminen]
GO

/****** Object:  Table [dw].[d_oef_osaaminen]    Script Date: 19.12.2024 15.33.25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_oef_osaaminen](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[koodi] [varchar](200) NOT NULL,
	[osaaminen_fi] [varchar](200) NOT NULL,
	[osaaminen_sv] [varchar](200) NOT NULL,
	[osaaminen_en] [varchar](200) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK_d_oef_osaaminen] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dw].[d_oef_osaaminen] ADD  CONSTRAINT [DF__d_oef_osaaminen__loadtime__5224328E]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_oef_osaaminen] ADD  CONSTRAINT [DF__d_oef_osaaminen__username__531856C7]  DEFAULT (suser_sname()) FOR [username]
GO


