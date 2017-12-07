USE [ANTERO]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_kieli]') AND type in (N'U'))
ALTER TABLE [dw].[d_kieli] DROP CONSTRAINT IF EXISTS [DF__d_kieli__username]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_kieli]') AND type in (N'U'))
ALTER TABLE [dw].[d_kieli] DROP CONSTRAINT IF EXISTS [DF__d_kieli__loadtime]
GO
/****** Object:  Table [dw].[d_kieli]    Script Date: 7.12.2017 17:39:21 ******/
DROP TABLE IF EXISTS [dw].[d_kieli]
GO
/****** Object:  Table [dw].[d_kieli]    Script Date: 7.12.2017 17:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_kieli]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_kieli](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
	[kieli_koodi] [varchar](6) NULL,
	[kieli_fi] [nvarchar](100) NULL,
	[kieli_sv] [nvarchar](100) NULL,
	[kieli_en] [nvarchar](100) NULL,
	[kieliryhma1_koodi] [int] NULL,
	[kieliryhma1_fi] [nvarchar](100) NULL,
	[kieliryhma1_sv] [nvarchar](100) NULL,
	[kieliryhma1_en] [nvarchar](100) NULL,
	[jarjestys_kieliryhma1]  AS (case when [kieliryhma1_koodi]='-1' then (99999) else [kieliryhma1_koodi] end),
 CONSTRAINT [PK__d_kieli] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__d_kieli__loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_kieli] ADD  CONSTRAINT [DF__d_kieli__loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__d_kieli__username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_kieli] ADD  CONSTRAINT [DF__d_kieli__username]  DEFAULT (suser_name()) FOR [username]
END

GO
USE [ANTERO]
