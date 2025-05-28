USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[v_f_1_21c_Jatkuva_oppiminen_amm_uudet_opiskelijat]    Script Date: 27.5.2025 20.16.19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROC [dbo].p_lataa_f_1_21c AS

--drop table VipunenTK.dbo.f_1_21c_Jatkuva_oppiminen_amm_uudet_opiskelijat

TRUNCATE TABLE VipunenTK.dbo.f_1_21c_Jatkuva_oppiminen_amm_uudet_opiskelijat

INSERT VipunenTK.dbo.f_1_21c_Jatkuva_oppiminen_amm_uudet_opiskelijat
	
SELECT
	 tilv
	,aineisto

	,[ikar8]
	,ikar8_id = coalesce(d0.id,-1)
	,ika_25_64_vuotta_id = coalesce(d0b.id,-1)
	,sp
	,sp_id = coalesce(d1.id,-1)
	,ptoim1r6e
	,ptoim1r6e_id = coalesce(d4.id,-1)
	,[sosee]
	,[sosee_id] = coalesce(d5.id,-1)
	
	,[koulk]
	,[koulknimi]
	,f.[iscfibroad2013]
	,iscfibroad2013_id = coalesce(d8.id,-1)
	,kaste_t2_3 
	,kaste_t2_3_id = coalesce(d9.id,-1)
    ,[tavoite]
	,[tavoite_id] = coalesce(d11.id,-1)
	,[tyov_id] = coalesce(d12.id,-1)
	
	,lkm
	
	--aik
	,kaste_t2_tr --78 sis. tohtorit ja lis.
    ,[kaste_t2_tr_id] = coalesce(d30.id,-1)
	,aiktutk_id = coalesce(d31.id,-1)

--INTO VipunenTK.dbo.f_1_21c_Jatkuva_oppiminen_amm_uudet_opiskelijat

FROM dbo.sa_1_21c_Jatkuva_oppiminen_amm_uudet_opiskelijat f
LEFT JOIN VipunenTK.dbo.d_ika d0 on d0.ika_avain = 'ikar8_'+ikar8
LEFT JOIN VipunenTK.dbo.d_kylla_ei AS d0b ON d0b.kylla_ei_koodi = case when ikar8 between 25 and 64 then '1' when ikar8 != -1 then '0' end
LEFT JOIN VipunenTK.dbo.d_sukupuoli AS d1 ON d1.sukupuoli_koodi = f.sp
LEFT JOIN VipunenTK.dbo.d_paaasiallinen_toiminta_versio2 AS d4 ON d4.paaasiallinen_toiminta_versio2_koodi = f.ptoim1r6e --r6 <-> r2 pl. varusmies- & siviilpalvelus
LEFT JOIN VipunenTK.dbo.d_sosioekonominen_asema AS d5 ON d5.sosioekonominen_asema_koodi = f.sosee
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus AS d8 ON d8.koulutusluokitus_avain = 'ISCFIBROAD'+f.iscfibroad2013 
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus AS d9 ON d9.koulutusluokitus_avain = 'KASTET2'+f.kaste_t2_3 
LEFT JOIN VipunenTK.dbo.d_tutkinnon_tavoite AS d11 ON d11.tutkinnon_tavoite_koodi = f.tavoite
LEFT JOIN VipunenTK.dbo.d_kylla_ei AS d12 ON d12.kylla_ei_koodi = f.tyov
--aik
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus AS d30 ON d30.koulutusluokitus_avain = 'KASTET2'+f.kaste_t2_tr
LEFT JOIN VipunenTK.dbo.d_kylla_ei AS d31 ON d31.kylla_ei_koodi = f.aiktutk

GO
