/****** Object:  Table [dw].[d_koski_koulutusmuoto]    Script Date: 2.8.2022 15:48:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_koski_koulutusmuoto](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[koodi] [varchar](200) NOT NULL,
	[selite_fi] [varchar](200) NOT NULL,
	[selite_sv] [varchar](200) NOT NULL,
	[selite_en] [varchar](200) NOT NULL,
	[jarjestys] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK_d_koski_koulutusmuoto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[d_koski_koulutusmuoto] ADD  CONSTRAINT [DF__d_koski_koulutusmuoto__loadtime__5224328E]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_koski_koulutusmuoto] ADD  CONSTRAINT [DF__d_koski_koulutusmuoto__username__531856C7]  DEFAULT (suser_sname()) FOR [username]
GO

USE [ANTERO]