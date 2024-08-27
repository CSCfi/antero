USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_korkeakoulujen_tutkimus_kehitys]    Script Date: 27.8.2024 9:39:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[p_lataa_korkeakoulujen_tutkimus_kehitys] AS

--execute VipunenTK_DW.dbo.p_lataa_korkeakoulujen_tutkimus_kehitys

Delete from [VipunenTK].[dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]
Insert into [VipunenTK].[dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet] 
	Select * from [VipunenTK_DW].[dbo].[v_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]

Delete from [VipunenTK].[dbo].[f_korkeakoulujen_tutkimus_kehitys_5_3_menot]
Insert into [VipunenTK].[dbo].[f_korkeakoulujen_tutkimus_kehitys_5_3_menot] 
	Select * from [VipunenTK_DW].[dbo].[v_f_korkeakoulujen_tutkimus_kehitys_5_3_menot]

Delete from [VipunenTK].[dbo].[f_korkeakoulujen_tutkimus_kehitys_5_3_rahoitus]
Insert into [VipunenTK].[dbo].[f_korkeakoulujen_tutkimus_kehitys_5_3_rahoitus] 
	Select * from [VipunenTK_DW].[dbo].[v_f_korkeakoulujen_tutkimus_kehitys_5_3_rahoitus]

EXEC [ANTERO].[dw].[p_lataa_f_indikaattorit_kk_taloustiedot]

GO

USE [ANTERO]
