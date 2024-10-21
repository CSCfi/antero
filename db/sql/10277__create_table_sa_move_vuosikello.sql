USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_move_vuosikello]    Script Date: 21.10.2024 15:09:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_move_vuosikello]') AND type in (N'U'))
DROP TABLE [sa].[sa_move_vuosikello]
GO
/****** Object:  Table [sa].[sa_move_vuosikello]    Script Date: 21.10.2024 15:09:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sa].[sa_move_vuosikello](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tilastovuosi] [int] NOT NULL,
	[julkaisupvm] [date] NULL,
	[loadtime] [date] NULL,
	[username] [varchar](20) NULL,
 CONSTRAINT [PK__sa_move_vuosikello] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [sa].[sa_move_vuosikello] ON 
GO
INSERT [sa].[sa_move_vuosikello] ([id], [tilastovuosi], [julkaisupvm], [loadtime], [username]) VALUES (1, 2018, CAST(N'2024-11-10' AS Date), CAST(N'2024-10-21' AS Date), N'DWI\vavainio')
GO
INSERT [sa].[sa_move_vuosikello] ([id], [tilastovuosi], [julkaisupvm], [loadtime], [username]) VALUES (2, 2019, CAST(N'2024-11-10' AS Date), CAST(N'2024-10-21' AS Date), N'DWI\vavainio')
GO
INSERT [sa].[sa_move_vuosikello] ([id], [tilastovuosi], [julkaisupvm], [loadtime], [username]) VALUES (3, 2020, CAST(N'2024-11-10' AS Date), CAST(N'2024-10-21' AS Date), N'DWI\vavainio')
GO
INSERT [sa].[sa_move_vuosikello] ([id], [tilastovuosi], [julkaisupvm], [loadtime], [username]) VALUES (4, 2021, CAST(N'2024-11-10' AS Date), CAST(N'2024-10-21' AS Date), N'DWI\vavainio')
GO
INSERT [sa].[sa_move_vuosikello] ([id], [tilastovuosi], [julkaisupvm], [loadtime], [username]) VALUES (5, 2022, CAST(N'2024-11-10' AS Date), CAST(N'2024-10-21' AS Date), N'DWI\vavainio')
GO
INSERT [sa].[sa_move_vuosikello] ([id], [tilastovuosi], [julkaisupvm], [loadtime], [username]) VALUES (6, 2023, CAST(N'2024-11-10' AS Date), CAST(N'2024-10-21' AS Date), N'DWI\vavainio')
GO
INSERT [sa].[sa_move_vuosikello] ([id], [tilastovuosi], [julkaisupvm], [loadtime], [username]) VALUES (7, 2024, CAST(N'2024-11-10' AS Date), CAST(N'2024-10-21' AS Date), N'DWI\vavainio')
GO
SET IDENTITY_INSERT [sa].[sa_move_vuosikello] OFF
GO
ALTER TABLE [sa].[sa_move_vuosikello] ADD  CONSTRAINT [DF__sa_move_vuosikello__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
ALTER TABLE [sa].[sa_move_vuosikello] ADD  CONSTRAINT [DF__sa_move_vuosikello__username]  DEFAULT (suser_sname()) FOR [username]
GO

USE [ANTERO]
