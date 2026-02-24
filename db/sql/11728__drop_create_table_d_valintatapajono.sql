USE [ANTERO]
GO

/****** Object:  Table [dw].[d_valintatapajono_ovara]    Script Date: 4.2.2026 9.02.43 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_valintatapajono]') AND type in (N'U'))
DROP TABLE [dw].[d_valintatapajono]
DROP TABLE IF EXISTS [dw].[d_valintatapajono_ovara]
GO

/****** Object:  Table [dw].[d_valintatapajono_ovara]    Script Date: 4.2.2026 9.02.43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_valintatapajono](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[valintatapajono_oid] [nvarchar](255) NULL,
	[selite_fi] [nvarchar](max) NULL,
	[selite_sv] [nvarchar](max) NULL,
	[selite_en] [nvarchar](max) NULL,
	[hakukohde_oid] [nvarchar](255) NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_valintatapajono] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dw].[d_valintatapajono] ADD  CONSTRAINT [DF_d_valintatapajono_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_valintatapajono] ADD  CONSTRAINT [DF_d_valintatapajono_username]  DEFAULT (suser_sname()) FOR [username]