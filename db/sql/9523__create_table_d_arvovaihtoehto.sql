USE [ANTERO]
GO

/****** Object:  Table [dw].[d_arvovaihtoehto]    Script Date: 22.1.2024 13:40:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_arvovaihtoehto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[vastaus_koodi] [nvarchar](10) NOT NULL,
	[numerovalinta] [int] NOT NULL,
	[vastaus_fi] [nvarchar](500) NULL,
	[vastaus_sv] [nvarchar](500) NULL,
	[vastaus_en] [nvarchar](500) NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [nvarchar](100) NOT NULL,
	[username] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK__d_arvovaihtoehto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dw].[d_arvovaihtoehto] ADD  CONSTRAINT [DF__d_arvovaihtoehto__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_arvovaihtoehto] ADD  CONSTRAINT [DF__d_arvovaihtoehto__username]  DEFAULT (suser_sname()) FOR [username]
GO

USE [ANTERO]