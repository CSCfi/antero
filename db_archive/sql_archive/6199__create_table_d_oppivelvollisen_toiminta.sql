USE [ANTERO]
GO

/****** Object:  Table [dw].[d_oppivelvollisen_toiminta]    Script Date: 9.5.2022 15:07:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_oppivelvollisen_toiminta](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[koodi] [varchar](200) NOT NULL,
	[selite_fi] [varchar](200) NOT NULL,
	[selite_sv] [varchar](200) NOT NULL,
	[selite_en] [varchar](200) NOT NULL,
	[selite2_fi] [varchar](200) NOT NULL,
	[selite2_sv] [varchar](200) NOT NULL,
	[selite2_en] [varchar](200) NOT NULL,
	[jarjestys] [int] NOT NULL,
	[jarjestys2] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK_d_oppivelvollisten_toiminta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[d_oppivelvollisen_toiminta] ADD  CONSTRAINT [DF__d_oppivelvollisen_toiminta__loadtime__5224328E]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_oppivelvollisen_toiminta] ADD  CONSTRAINT [DF__d_oppivelvollisen_toiminta__username__531856C7]  DEFAULT (suser_sname()) FOR [username]
GO

USE [ANTERO]