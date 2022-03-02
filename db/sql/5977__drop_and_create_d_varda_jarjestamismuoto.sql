USE [ANTERO]
GO

ALTER TABLE [dw].[d_varda_jarjestamismuoto] DROP CONSTRAINT [DF__d_varda_jarjestamismuoto__username]
GO

ALTER TABLE [dw].[d_varda_jarjestamismuoto] DROP CONSTRAINT [DF__d_varda_jarjestamismuoto__loadtime]
GO

/****** Object:  Table [dw].[d_varda_jarjestamismuoto]    Script Date: 2.3.2022 13.45.13 ******/
DROP TABLE [dw].[d_varda_jarjestamismuoto]
GO

/****** Object:  Table [dw].[d_varda_jarjestamismuoto]    Script Date: 2.3.2022 13.45.13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_varda_jarjestamismuoto](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[koodi] [nvarchar](100) NOT NULL,
	[nimi_fi] [nvarchar](200) NULL,
	[nimi_sv] [nvarchar](200) NULL,
	[nimi_en] [nvarchar](200) NULL,
	[kuvaus_fi] [nvarchar](200) NULL,
	[kuvaus_sv] [nvarchar](200) NULL,
	[kuvaus_en] [nvarchar](200) NULL,
	[jarj_nro] [int] NOT NULL,
	[alkupvm] [date] NULL,
	[loppupvm] [date] NULL,
	[loadtime] [datetime2](4) NOT NULL,
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK__d_varda_jarjestamismuoto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dw].[d_varda_jarjestamismuoto] ADD  CONSTRAINT [DF__d_varda_jarjestamismuoto__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_varda_jarjestamismuoto] ADD  CONSTRAINT [DF__d_varda_jarjestamismuoto__username]  DEFAULT (suser_name()) FOR [username]
GO


