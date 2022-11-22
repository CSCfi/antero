USE [ANTERO]
GO


/****** Object:  Table [dw].[d_rahoitusryhma]    Script Date: 17.11.2022 11:16:11 ******/
DROP TABLE IF EXISTS [dw].[d_rahoitusryhma]
GO
/****** Object:  Table [dw].[d_rahoitusryhma]    Script Date: 17.11.2022 11:16:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
SET IDENTITY_INSERT [dw].[d_rahoitusryhma] ON 

GO
INSERT [dw].[d_rahoitusryhma] ([id], [koodi], [selite_fi], [selite_sv], [selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (-1, N'-1', N'Tieto puuttuu', N'Information saknas', N'Missing data', 9, CAST(N'2022-11-15T12:03:12.060' AS DateTime), N'etl: p_lataa_d_rahoitusryhma', N'DWI\pankalai')
GO
INSERT [dw].[d_rahoitusryhma] ([id], [koodi], [selite_fi], [selite_sv], [selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (0, N'02', N'jatkuvan oppimisen rahoitus', N'finansiering av kontinuerligt lärande', N'financing of continuous learning', 2, CAST(N'2022-11-15T12:03:12.073' AS DateTime), N'etl: p_lataa_d_rahoitusryhma', N'DWI\pankalai')
GO
INSERT [dw].[d_rahoitusryhma] ([id], [koodi], [selite_fi], [selite_sv], [selite_en], [jarjestys], [loadtime], [source], [username]) VALUES (1, N'01', N'oppivelvollisuuskoulutuksen rahoitus', N'finansiering av läropliktsutbildning', N'financing of compulsory education', 1, CAST(N'2022-11-15T12:03:12.073' AS DateTime), N'etl: p_lataa_d_rahoitusryhma', N'DWI\pankalai')
GO
SET IDENTITY_INSERT [dw].[d_rahoitusryhma] OFF
GO
ALTER TABLE [dw].[d_rahoitusryhma] ADD  CONSTRAINT [DF_d_rahoitusryhma_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [dw].[d_rahoitusryhma] ADD  CONSTRAINT [DF_d_rahoitusryhma_username]  DEFAULT (suser_sname()) FOR [username]
GO
