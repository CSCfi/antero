USE [VipunenTK_SA]
GO

drop table VipunenTK_DW.dbo.f_R2_22_Oppilaitostason_oppil_ja_opisk;
GO

select top 0 * into VipunenTK_DW.dbo.f_R2_22_Oppilaitostason_oppil_ja_opisk 
from v_sa_R2_22_Oppilaitostason_oppil_ja_opisk;
GO

USE [ANTERO]