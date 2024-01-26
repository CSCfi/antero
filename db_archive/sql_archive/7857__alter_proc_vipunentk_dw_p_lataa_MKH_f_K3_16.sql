USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_MKH_f_K3_16]    Script Date: 11.7.2023 17:28:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER PROCEDURE [dbo].[p_lataa_MKH_f_K3_16] AS

/*
Poistettu automaattilatauksesta, koska ei enää tule uusia tietoja. JS 11.7.2023
*/

Delete from [VipunenTK].[dbo].[f_Moninkertainen_haku_hakijat]
Insert into [VipunenTK].[dbo].[f_Moninkertainen_haku_hakijat] 
	Select * from [VipunenTK_DW].[dbo].[v_f_Moninkertainen_haku_hakijat]

Delete from [VipunenTK].[dbo].[f_Moninkertainen_haku_uudet_haut]
Insert into [VipunenTK].[dbo].[f_Moninkertainen_haku_uudet_haut] 
	Select * from [VipunenTK_DW].[dbo].[v_f_Moninkertainen_haku_uudet_haut]

Delete from [VipunenTK].[dbo].[f_Moninkertainen_haku_edelliset_haut]
Insert into [VipunenTK].[dbo].[f_Moninkertainen_haku_edelliset_haut] 
	Select * from [VipunenTK_DW].[dbo].[v_f_Moninkertainen_haku_edelliset_haut]

Delete from [VipunenTK].[dbo].[f_Moninkertainen_haku_aiemmat_tutkinnot]
Insert into [VipunenTK].[dbo].[f_Moninkertainen_haku_aiemmat_tutkinnot] 
	Select * from [VipunenTK_DW].[dbo].[v_f_Moninkertainen_haku_aiemmat_tutkinnot]

Delete from [VipunenTK].[dbo].[f_Moninkertainen_haku_edellisen_vuoden_opiskelut]
Insert into [VipunenTK].[dbo].[f_Moninkertainen_haku_edellisen_vuoden_opiskelut] 
	Select * from [VipunenTK_DW].[dbo].[v_f_Moninkertainen_haku_edellisen_vuoden_opiskelut]



GO


