USE [ANTERO]
GO

/****** Object:  Table [dw].[d_arvovastaus_monivalinta_v2]    Script Date: 16.3.2026 10.08.40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_arvovastaus_monivalinta]') AND type in (N'U'))
DROP TABLE [dw].[d_arvovastaus_monivalinta]
GO

/****** Object:  Table [dw].[d_arvovastaus_monivalinta_v2]    Script Date: 16.3.2026 10.08.40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_arvovastaus_monivalinta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[koodi] [int] NULL,
	[vastaus_fi] [nvarchar](500) NULL,
	[vastaus_sv] [nvarchar](500) NULL,
	[vastaus_en] [nvarchar](500) NULL,
	[kysymysid] [nvarchar](500) NULL,
	[kysymysversio] [int] NOT NULL,
	[jarjestys] [int] NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [nvarchar](100) NOT NULL,
	[username] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK__d_arvovastaus_monivalinta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dw].[d_arvovastaus_monivalinta] ADD  DEFAULT ((1)) FOR [kysymysversio]
GO

ALTER TABLE [dw].[d_arvovastaus_monivalinta] ADD  CONSTRAINT [DF__d_arvovastaus_monivalinta__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_arvovastaus_monivalinta] ADD  CONSTRAINT [DF__d_arvovastaus_monivalinta__username]  DEFAULT (suser_sname()) FOR [username]