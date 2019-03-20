USE [ANTERO]
GO
/****** Object:  Table [dw].[d_oppisopimuskoulutus]    Script Date: 20.3.2019 22:09:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_oppisopimuskoulutus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_oppisopimuskoulutus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[koodi] [nvarchar](100) NOT NULL,
	[selite_fi] [nvarchar](100) NOT NULL,
	[selite_sv] [nvarchar](100) NOT NULL,
	[selite_en] [nvarchar](100) NOT NULL,
	[jarjestys]  AS (case when [koodi]='-1' then '9' else CONVERT([varchar](10),[koodi])+(1) end),
	[loadtime] [datetime] NOT NULL,
	[source] [nvarchar](100) NOT NULL,
	[username] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_d_oppisopimuskoulutus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__d_oppisopimuskoulutus__loadtime__5224328E]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_oppisopimuskoulutus] ADD  CONSTRAINT [DF__d_oppisopimuskoulutus__loadtime__5224328E]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__d_oppisopimuskoulutus__username__531856C7]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_oppisopimuskoulutus] ADD  CONSTRAINT [DF__d_oppisopimuskoulutus__username__531856C7]  DEFAULT (suser_sname()) FOR [username]
END

