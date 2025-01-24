USE [ANTERO]
GO

/****** Object:  Table [dw].[d_nayton_arvioinnista_paattaneet]    Script Date: 24.1.2025 8.17.34 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_nayton_arvioinnista_paattaneet]') AND type in (N'U'))
DROP TABLE [dw].[d_nayton_arvioinnista_paattaneet]
GO

/****** Object:  Table [dw].[d_nayton_arvioinnista_paattaneet]    Script Date: 24.1.2025 8.17.34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_nayton_arvioinnista_paattaneet](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[opettajat] [int] NOT NULL,
	[tyontekijat] [int] NOT NULL,
	[tyonantajan_edustajat] [int] NOT NULL,
	[itsenaiset_ammatinharjoittajat] [int] NOT NULL,
	[muut_koulutuksen_jarjestajan_edustajat] [int] NOT NULL,
	[selite_fi] [varchar](max) NOT NULL,
	[selite_sv] [varchar](max) NOT NULL,
	[selite_en] [varchar](max) NOT NULL,
	[source] [varchar](100) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_nayton_arvioinnista_paattaneet] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dw].[d_nayton_arvioinnista_paattaneet] ADD  CONSTRAINT [DF__d_nayton_arvioinnista_paattaneet__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_nayton_arvioinnista_paattaneet] ADD  CONSTRAINT [DF__d_nayton_arvioinnista_paattaneet__username]  DEFAULT (suser_sname()) FOR [username]
GO


