USE [ANTERO]
GO
/****** Object:  Table [dw].[d_amos_spl_opiskelijavuodet_hylkaamisperuste]    Script Date: 2.8.2019 11:47:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_amos_spl_opiskelijavuodet_hylkaamisperuste]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_amos_spl_opiskelijavuodet_hylkaamisperuste](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[koodi] [varchar](6) NULL,
	[selite_fi] [nvarchar](100) NULL,
	[selite_sv] [nvarchar](100) NULL,
	[selite_en] [nvarchar](100) NULL,
	[jarjestys] [nvarchar](100) NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_amos_spl_opiskelijavuodet_hylkaamisperuste] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__d_amos_spl_opiskelijavuodet_hylkaamisperuste__loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_amos_spl_opiskelijavuodet_hylkaamisperuste] ADD  CONSTRAINT [DF__d_amos_spl_opiskelijavuodet_hylkaamisperuste__loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__d_amos_spl_opiskelijavuodet_hylkaamisperuste__username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_amos_spl_opiskelijavuodet_hylkaamisperuste] ADD  CONSTRAINT [DF__d_amos_spl_opiskelijavuodet_hylkaamisperuste__username]  DEFAULT (suser_name()) FOR [username]
END

