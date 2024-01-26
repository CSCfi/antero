USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[sa_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat]    Script Date: 29.9.2022 22:27:49 ******/
DROP TABLE IF EXISTS [dbo].[sa_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat]
GO

/****** Object:  Table [dbo].[sa_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat]    Script Date: 29.9.2022 22:27:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

select top 0 * into dbo.sa_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat 
from [VipunenTK_SA].[dbo].[v_sa_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat]
go