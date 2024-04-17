USE [ANTERO]
GO

/****** Object:  Table [dw].[d_indikaattorit_kk]    Script Date: 17.4.2024 12:06:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_indikaattorit_kk]') AND type in (N'U'))
DROP TABLE [dw].[d_indikaattorit_kk]
GO

/****** Object:  Table [dw].[d_indikaattorit_kk]    Script Date: 17.4.2024 12:06:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_indikaattorit_kk](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[koodi] [varchar](200) NOT NULL,
	[selite_fi] [varchar](200) NOT NULL,
	[selite_sv] [varchar](200) NULL,
	[selite_en] [varchar](200) NULL,
	[indikaattorityyppi_fi] [varchar](200) NOT NULL,
	[indikaattorityyppi_sv] [varchar](200) NULL,
	[indikaattorityyppi_en] [varchar](200) NULL,
	[jarjestys] [int] NOT NULL,
	[jarjestys_indikaattorityyppi] [int] NOT NULL,
	[tyyppi] [varchar](30) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK_d_indikaattorit_kk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dw].[d_indikaattorit_kk] ADD  CONSTRAINT [DF__d_indikaattorit_kk__loadtime__5224328E]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_indikaattorit_kk] ADD  CONSTRAINT [DF__d_indikaattorit_kk__username__531856C7]  DEFAULT (suser_sname()) FOR [username]
GO

USE [ANTERO]
