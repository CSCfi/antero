USE [ANTERO]
GO


/****** Object:  Table [dw].[d_move_viivajuoksu]    Script Date: 21.10.2024 14:59:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_move_viivajuoksu]') AND type in (N'U'))
DROP TABLE [dw].[d_move_viivajuoksu]
GO

/****** Object:  Table [dw].[d_move_viivajuoksu]    Script Date: 21.10.2024 14:59:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_move_viivajuoksu](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[lukumaara] [int] NOT NULL,
	[kesto] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK_d_move_viivajuoksu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dw].[d_move_viivajuoksu] ADD  CONSTRAINT [DF__d_move_viivajuoksu__loadtime__5224328E]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_move_viivajuoksu] ADD  CONSTRAINT [DF__d_move_viivajuoksu__username__531856C7]  DEFAULT (suser_sname()) FOR [username]
GO

USE [ANTERO]
