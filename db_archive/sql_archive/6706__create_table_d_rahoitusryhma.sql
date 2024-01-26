USE [ANTERO]
GO
/****** Object:  Table [dw].[d_rahoitusryhma]    Script Date: 15.11.2022 12:52:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_rahoitusryhma]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_rahoitusryhma](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [varchar](255) NOT NULL,
	[selite_fi] [varchar](255) NOT NULL,
	[selite_sv] [varchar](255) NULL,
	[selite_en] [varchar](255) NULL,
	[jarjestys] [int] NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_rahoitusryhma] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_rahoitusryhma_loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_rahoitusryhma] ADD  CONSTRAINT [DF_d_rahoitusryhma_loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_rahoitusryhma_username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_rahoitusryhma] ADD  CONSTRAINT [DF_d_rahoitusryhma_username]  DEFAULT (suser_sname()) FOR [username]
END

