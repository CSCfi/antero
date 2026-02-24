USE [ANTERO]
GO

/****** Object:  Table [dw].[d_pohjakoulutusvaatimus_toinen_aste]    Script Date: 4.2.2026 9.06.09 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_pohjakoulutusvaatimus_toinen_aste]') AND type in (N'U'))
DROP TABLE [dw].[d_pohjakoulutusvaatimus_toinen_aste]
GO

/****** Object:  Table [dw].[d_pohjakoulutusvaatimus_toinen_aste]    Script Date: 4.2.2026 9.06.09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_pohjakoulutusvaatimus_toinen_aste](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [varchar](1000) NOT NULL,
	[selite_fi] [varchar](max) NOT NULL,
	[selite_sv] [varchar](max) NULL,
	[selite_en] [varchar](max) NULL,
	[jarjestys]  AS (case when [koodi]='-1' then 'ZZZZZ' else [koodi] end),
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_pohjakoulutusvaatimus_toinen_aste] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dw].[d_pohjakoulutusvaatimus_toinen_aste] ADD  CONSTRAINT [DF_d_pohjakoulutusvaatimus_toinen_aste_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_pohjakoulutusvaatimus_toinen_aste] ADD  CONSTRAINT [DF_d_pohjakoulutusvaatimus_toinen_aste_username]  DEFAULT (suser_sname()) FOR [username]