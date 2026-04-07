USE [ANTERO]
GO


/****** Object:  Table [dw].[d_arvokysymys_v2]    Script Date: 16.3.2026 10.01.16 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_arvokysymys]') AND type in (N'U'))
DROP TABLE [dw].[d_arvokysymys]
GO

/****** Object:  Table [dw].[d_arvokysymys_v2]    Script Date: 16.3.2026 10.01.16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_arvokysymys](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[kysymysryhmaid] [int] NOT NULL,
	[kysymysryhma_fi] [nvarchar](max) NOT NULL,
	[kysymysryhma_sv] [nvarchar](max) NULL,
	[kysymysryhma_en] [nvarchar](max) NULL,
	[kysymysid] [int] NOT NULL,
	[kysymys_fi] [nvarchar](500) NOT NULL,
	[kysymys_sv] [nvarchar](500) NULL,
	[kysymys_en] [nvarchar](500) NULL,
	[kysymysryhmajarjestys] [int] NULL,
	[kysymysjarjestys] [int] NULL,
	[kysymysryhmajarjestys2] [int] NULL,
	[kysymysjarjestys2] [int] NULL,
	[rahoitusmallikysymys] [int] NULL,
	[kiusaamiskysymys] [int] NULL,
	[vastaustyyppi] [varchar](50) NULL,
	[kysymysversio] [int] NULL,
	[kyselyid] [int] NULL,
	[rnk] [int] NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_arvokysymys] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dw].[d_arvokysymys] ADD  DEFAULT ((1)) FOR [kysymysversio]
GO

ALTER TABLE [dw].[d_arvokysymys] ADD  CONSTRAINT [DF__d_arvokysymys__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_arvokysymys] ADD  CONSTRAINT [DF__d_arvokysymys__username]  DEFAULT (suser_sname()) FOR [username]