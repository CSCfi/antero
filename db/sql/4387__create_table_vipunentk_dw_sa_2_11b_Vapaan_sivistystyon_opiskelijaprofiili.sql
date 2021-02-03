USE [VipunenTK_SA]
GO

Drop table if exists VipunenTK_DW.[dbo].sa_2_11b_Vapaan_sivistystyon_opiskelijaprofiili
Select * into VipunenTK_DW.[dbo].sa_2_11b_Vapaan_sivistystyon_opiskelijaprofiili 
from VipunenTK_SA.[dbo].v_sa_2_11b_Vapaan_sivistystyon_opiskelijaprofiili

go
use antero
