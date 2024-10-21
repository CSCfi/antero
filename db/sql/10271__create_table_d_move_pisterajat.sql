USE [ANTERO]
GO

/****** Object:  Table [dw].[d_move_pisterajat]    Script Date: 21.10.2024 14:58:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_move_pisterajat]') AND type in (N'U'))
DROP TABLE [dw].[d_move_pisterajat]
GO

/****** Object:  Table [dw].[d_move_pisterajat]    Script Date: 21.10.2024 14:58:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_move_pisterajat](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[mittari] [varchar](200) NOT NULL,
	[sukupuoli] [varchar](200) NOT NULL,
	[luokka] [varchar](200) NOT NULL,
	[ylaraja1] [float] NOT NULL,
	[alaraja2] [float] NOT NULL,
	[ylaraja2] [float] NOT NULL,
	[alaraja3] [float] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK_d_move_pisterajat] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dw].[d_move_pisterajat] ADD  CONSTRAINT [DF__d_move_pisterajat__loadtime__5224328E]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_move_pisterajat] ADD  CONSTRAINT [DF__d_move_pisterajat__username__531856C7]  DEFAULT (suser_sname()) FOR [username]
GO

USE [ANTERO]
