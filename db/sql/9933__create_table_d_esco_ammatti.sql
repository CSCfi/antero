USE [ANTERO]
GO

/****** Object:  Table [dw].[d_esco_ammatti]    Script Date: 11.6.2024 12:29:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_esco_ammatti]') AND type in (N'U'))
DROP TABLE [dw].[d_esco_ammatti]
GO

/****** Object:  Table [dw].[d_esco_ammatti]    Script Date: 11.6.2024 12:29:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_esco_ammatti](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[koodit_ammatti] [varchar](200) NOT NULL,
	[koodit_ammatti_taso1] [varchar](200) NOT NULL,
	[ammatti_taso1_fi] [varchar](200) NOT NULL,
	[ammatti_taso1_sv] [varchar](200) NOT NULL,
	[ammatti_taso1_en] [varchar](200) NOT NULL,
	[koodit_ammatti_taso2] [varchar](200) NULL,
	[ammatti_taso2_fi] [varchar](200) NULL,
	[ammatti_taso2_sv] [varchar](200) NULL,
	[ammatti_taso2_en] [varchar](200) NULL,
	[koodit_ammatti_taso3] [varchar](200) NULL,
	[ammatti_taso3_fi] [varchar](200) NULL,
	[ammatti_taso3_sv] [varchar](200) NULL,
	[ammatti_taso3_en] [varchar](200) NULL,
	[koodit_ammatti_taso4] [varchar](200) NULL,
	[ammatti_taso4_fi] [varchar](200) NULL,
	[ammatti_taso4_sv] [varchar](200) NULL,
	[ammatti_taso4_en] [varchar](200) NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK_d_esco_ammatti] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dw].[d_esco_ammatti] ADD  CONSTRAINT [DF__d_esco_ammatti__loadtime__5224328E]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_esco_ammatti] ADD  CONSTRAINT [DF__d_esco_ammatti__username__531856C7]  DEFAULT (suser_sname()) FOR [username]
GO

USE [ANTERO]