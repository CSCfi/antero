USE [VipunenTK_DW]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[p_lataa_f_vaestoennuste] AS



truncate table vipunentk.[dbo].[f_Vaestoennuste];

insert into vipunentk.[dbo].[f_Vaestoennuste]
 
SELECT ennv
		,tilvaskun = f.tilvaskun
		,tilvaskun_id = coalesce(d3.id,-1)
		,sp_id = coalesce(d1.id,-1)
		,ika_id = coalesce(d2.id,-1)
		,lkm
		,ennustemalli = Ennustemalli

FROM VipunenTK_SA.dbo.v_sa_4_21_Vaestoennuste f
LEFT JOIN VipunenTK..d_sukupuoli d1 on d1.sukupuoli_koodi=f.sp
LEFT JOIN VipunenTK..d_ika d2 on d2.ika_avain=f.ika2
LEFT JOIN VipunenTK..d_alueluokitus d3 on d3.alueluokitus_avain=f.tilvaskun




GO


USE [ANTERO]