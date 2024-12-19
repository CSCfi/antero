USE [ANTERO]
GO

/****** Object:  Table [dw].[d_oef_ammattiala]    Script Date: 19.12.2024 15.32.37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_oef_ammattiala]') AND type in (N'U'))
DROP TABLE [dw].[d_oef_ammattiala]
GO

/****** Object:  Table [dw].[d_oef_ammattiala]    Script Date: 19.12.2024 15.32.37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_oef_ammattiala](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[koodi] [varchar](200) NOT NULL,
	[ammattiala_taso1_koodi] [varchar](200) NOT NULL,
	[ammattiala_taso1_fi] [varchar](200) NOT NULL,
	[ammattiala_taso1_sv] [varchar](200) NOT NULL,
	[ammattiala_taso1_en] [varchar](200) NOT NULL,
	[ammattiala_taso2_koodi] [varchar](200) NULL,
	[ammattiala_taso2_fi] [varchar](200) NULL,
	[ammattiala_taso2_sv] [varchar](200) NULL,
	[ammattiala_taso2_en] [varchar](200) NULL,
	[ammattiala_taso3_koodi] [varchar](200) NULL,
	[ammattiala_taso3_fi] [varchar](200) NULL,
	[ammattiala_taso3_sv] [varchar](200) NULL,
	[ammattiala_taso3_en] [varchar](200) NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK_d_oef_ammattiala] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dw].[d_oef_ammattiala] ADD  CONSTRAINT [DF__d_oef_ammattiala__loadtime__5224328E]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_oef_ammattiala] ADD  CONSTRAINT [DF__d_oef_ammattiala__username__531856C7]  DEFAULT (suser_sname()) FOR [username]
GO


