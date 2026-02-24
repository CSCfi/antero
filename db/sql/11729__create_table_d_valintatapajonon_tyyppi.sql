USE [ANTERO]
GO


/****** Object:  Table [dw].[d_valintatapajonon_tyyppi_ovara]    Script Date: 4.2.2026 9.04.33 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_valintatapajonon_tyyppi]') AND type in (N'U'))
DROP TABLE [dw].[d_valintatapajonon_tyyppi]
GO

/****** Object:  Table [dw].[d_valintatapajonon_tyyppi_ovara]    Script Date: 4.2.2026 9.04.33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_valintatapajonon_tyyppi](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [nvarchar](100) NOT NULL,
	[selite_fi] [nvarchar](100) NOT NULL,
	[selite_sv] [nvarchar](100) NOT NULL,
	[selite_en] [nvarchar](100) NOT NULL,
	[jarjestys] [varchar](5) NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [nvarchar](100) NOT NULL,
	[username] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_d_valintatapajonon_tyyppi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dw].[d_valintatapajonon_tyyppi] ADD  CONSTRAINT [DF__d_valintatapajonon_tyyppi__loadtime__5224328E]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_valintatapajonon_tyyppi] ADD  CONSTRAINT [DF__d_valintatapajonon_tyyppi__username__531856C7]  DEFAULT (suser_sname()) FOR [username]