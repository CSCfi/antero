USE [ANTERO]
GO

/****** Object:  Table [dw].[d_amos_kustannuskysely_yhdistelma]    Script Date: 26.2.2025 10.41.20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_amos_kustannuskysely_yhdistelma]') AND type in (N'U'))
DROP TABLE [dw].[d_amos_kustannuskysely_yhdistelma]
GO

/****** Object:  Table [dw].[d_amos_kustannuskysely_yhdistelma]    Script Date: 26.2.2025 10.41.20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_amos_kustannuskysely_yhdistelma](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[koodi] [nvarchar](50) NOT NULL,
	[selite] [varchar](250) NOT NULL,
	[taso1] [varchar](250) NOT NULL,
	[taso2] [varchar](250) NOT NULL,
	[taso3] [varchar](250) NULL,
	[taso4] [varchar](250) NULL,
	[taso5] [varchar](250) NULL,
	[lomake] [varchar](250) NOT NULL,
	[summatieto] [int] NOT NULL,
	[kerroin] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](250) NOT NULL,
	[username] [varchar](250) NULL
) ON [PRIMARY]