USE [ANTERO]
GO

/****** Object:  Table [dw].[d_pidennetty_oppivelvollisuus]    Script Date: 26.9.2024 8:38:52 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_pidennetty_oppivelvollisuus]') AND type in (N'U'))
DROP TABLE [dw].[d_pidennetty_oppivelvollisuus]
GO

/****** Object:  Table [dw].[d_pidennetty_oppivelvollisuus]    Script Date: 26.9.2024 8:38:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_pidennetty_oppivelvollisuus](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[koodi] [varchar](200) NOT NULL,
	[selite_fi] [varchar](200) NOT NULL,
	[selite_sv] [varchar](200) NOT NULL,
	[selite_en] [varchar](200) NOT NULL,
	[jarjestys] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK_d_pidennetty_oppivelvollisuus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dw].[d_pidennetty_oppivelvollisuus] ADD  CONSTRAINT [DF__d_pidennetty_oppivelvollisuus__loadtime__5224328E]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_pidennetty_oppivelvollisuus] ADD  CONSTRAINT [DF__d_pidennetty_oppivelvollisuus__username__531856C7]  DEFAULT (suser_sname()) FOR [username]
GO

USE [ANTERO]