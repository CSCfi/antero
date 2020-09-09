USE [VipunenTK_DW]
GO

Drop table [VipunenTK_DW].[dbo].[f_7_10_Ammatillisen_koulutuksen_opettajat_kelpoisuus_koulutus]
Select * into [VipunenTK_DW].[dbo].[f_7_10_Ammatillisen_koulutuksen_opettajat_kelpoisuus_koulutus] 
FROM [VipunenTK_SA].[dbo].[v_sa_7_10_Ammatillisen_koulutuksen_opettajat_kelpoisuus_koulutus]
GO

USE [ANTERO]