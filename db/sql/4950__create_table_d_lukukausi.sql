USE [ANTERO]
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_lukukausi]') AND type in (N'U'))
BEGIN
	DROP TABLE [dw].[d_lukukausi]
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_lukukausi]') AND type in (N'U'))
BEGIN
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dw].[d_lukukausi](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[lukukausi_fi] [varchar](100) NOT NULL,
	[lukukausi_sv] [varchar](100) NOT NULL,
	[lukukausi_en] [varchar](100) NOT NULL,
	[jarjestys_lukukausi] bigint NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK_d_lukukausi] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]



ALTER TABLE [dw].[d_lukukausi] ADD  CONSTRAINT [DF__d_lukukausi__loadtime]  DEFAULT (getdate()) FOR [loadtime]

ALTER TABLE [dw].[d_lukukausi] ADD  CONSTRAINT [DF__d_lukukausi__username]  DEFAULT (suser_name()) FOR [username]



SET IDENTITY_INSERT [dw].[d_lukukausi] ON

INSERT [dw].[d_lukukausi] ([id], [lukukausi_fi], [lukukausi_sv], [lukukausi_en], [jarjestys_lukukausi], [source]) VALUES (1, 'Syys', 'Höst', 'Autumn', 1, 'manuaalinen')
INSERT [dw].[d_lukukausi] ([id], [lukukausi_fi], [lukukausi_sv], [lukukausi_en], [jarjestys_lukukausi], [source]) VALUES (2, 'Kevät', 'Vår', 'Spring', 2, 'manuaalinen')

SET IDENTITY_INSERT [dw].[d_lukukausi] OFF
END
