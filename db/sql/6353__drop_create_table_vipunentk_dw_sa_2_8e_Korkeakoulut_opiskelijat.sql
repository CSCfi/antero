USE [VipunenTK_SA]
GO

drop table vipunentk_dw..sa_2_8e_Korkeakoulut_opiskelijat
select * into vipunentk_dw.dbo.sa_2_8e_Korkeakoulut_opiskelijat from v_sa_2_8e_Korkeakoulut_opiskelijat

go