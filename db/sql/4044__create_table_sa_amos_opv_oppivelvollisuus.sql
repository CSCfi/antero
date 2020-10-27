USE [ANTERO]
GO
/****** Object:  Table [sa].[amos_opiskelijavuodet_oppivelvollisuuskerroin]    Script Date: 25.10.2020 18:30:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[amos_opiskelijavuodet_oppivelvollisuuskerroin]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[amos_opiskelijavuodet_oppivelvollisuuskerroin](
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[ikaraja] [int] NULL,
	[kerroin] [decimal](3, 2) NULL
) ON [PRIMARY]
END
GO
INSERT [sa].[amos_opiskelijavuodet_oppivelvollisuuskerroin] ([alkaa], [paattyy], [ikaraja], [kerroin]) VALUES (CAST(N'2019-08-01' AS Date), CAST(N'2019-12-31' AS Date), 16, CAST(0.06 AS Decimal(3, 2)))
GO
INSERT [sa].[amos_opiskelijavuodet_oppivelvollisuuskerroin] ([alkaa], [paattyy], [ikaraja], [kerroin]) VALUES (CAST(N'2020-01-01' AS Date), CAST(N'2020-12-31' AS Date), 17, CAST(0.06 AS Decimal(3, 2)))
GO
INSERT [sa].[amos_opiskelijavuodet_oppivelvollisuuskerroin] ([alkaa], [paattyy], [ikaraja], [kerroin]) VALUES (CAST(N'2021-01-01' AS Date), CAST(N'2021-12-31' AS Date), 18, CAST(0.06 AS Decimal(3, 2)))
GO
INSERT [sa].[amos_opiskelijavuodet_oppivelvollisuuskerroin] ([alkaa], [paattyy], [ikaraja], [kerroin]) VALUES (CAST(N'2022-01-01' AS Date), CAST(N'2022-12-31' AS Date), 19, CAST(0.06 AS Decimal(3, 2)))
GO
INSERT [sa].[amos_opiskelijavuodet_oppivelvollisuuskerroin] ([alkaa], [paattyy], [ikaraja], [kerroin]) VALUES (CAST(N'2023-01-01' AS Date), CAST(N'2023-12-31' AS Date), 20, CAST(0.06 AS Decimal(3, 2)))
GO
INSERT [sa].[amos_opiskelijavuodet_oppivelvollisuuskerroin] ([alkaa], [paattyy], [ikaraja], [kerroin]) VALUES (CAST(N'2024-01-01' AS Date), CAST(N'2024-12-31' AS Date), 20, CAST(0.06 AS Decimal(3, 2)))
GO
INSERT [sa].[amos_opiskelijavuodet_oppivelvollisuuskerroin] ([alkaa], [paattyy], [ikaraja], [kerroin]) VALUES (CAST(N'2025-01-01' AS Date), CAST(N'2025-12-31' AS Date), 20, CAST(0.06 AS Decimal(3, 2)))
