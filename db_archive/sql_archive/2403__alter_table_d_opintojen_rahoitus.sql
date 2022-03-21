USE [ANTERO]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_opintojenrahoitus]') AND type in (N'U'))
ALTER TABLE [dw].[d_opintojenrahoitus] DROP CONSTRAINT IF EXISTS [DF__d_opintojenrahoitus__username__531856C7]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_opintojenrahoitus]') AND type in (N'U'))
ALTER TABLE [dw].[d_opintojenrahoitus] DROP CONSTRAINT IF EXISTS [DF__d_opintojenrahoitus__loadtime__5224328E]
GO
/****** Object:  Table [dw].[d_opintojenrahoitus]    Script Date: 17.9.2019 16:06:55 ******/
DROP TABLE IF EXISTS [dw].[d_opintojenrahoitus]
GO
/****** Object:  Table [dw].[d_opintojenrahoitus]    Script Date: 17.9.2019 16:06:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_opintojenrahoitus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_opintojenrahoitus](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [nvarchar](100) NOT NULL,
	[selite_fi] [nvarchar](100) NOT NULL,
	[selite_sv] [nvarchar](100) NOT NULL,
	[selite_en] [nvarchar](100) NOT NULL,
	[jarjestys_koodi] [int] NULL,
	[sisaltyy_okm_perusrahoitus] [nvarchar](100) NULL,
	[sisaltyy_okm_suoritusrahoitus] [nvarchar](100) NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [nvarchar](100) NOT NULL,
	[username] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_d_opintojenrahoitus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__d_opintojenrahoitus__loadtime__5224328E]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_opintojenrahoitus] ADD  CONSTRAINT [DF__d_opintojenrahoitus__loadtime__5224328E]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__d_opintojenrahoitus__username__531856C7]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_opintojenrahoitus] ADD  CONSTRAINT [DF__d_opintojenrahoitus__username__531856C7]  DEFAULT (suser_sname()) FOR [username]
END


