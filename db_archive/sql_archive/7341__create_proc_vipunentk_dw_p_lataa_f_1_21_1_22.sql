USE [VipunenTK_DW]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_f_1_21_1_22]    Script Date: 20.1.2023 0:19:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




--exec [dbo].[p_lataa_f_1_21_1_22]
--drop table VipunenTK.dbo.f_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat
--select * into VipunenTK.dbo.f_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat from ( ... ) q

CREATE OR ALTER PROCEDURE [dbo].[p_lataa_f_1_21_1_22] AS

TRUNCATE TABLE VipunenTK.dbo.f_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat;

INSERT VipunenTK.dbo.f_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat

SELECT
	 tilv
	,aineisto
	,f.lahde
	,lahde_id = coalesce(d14.id,-1)
	,sektori
	,sektori_id = coalesce(d13.id,-1)

	,[ikar8]
	,ikar8_id = coalesce(d0.id,-1)
	,ika_25_64_vuotta_id = coalesce(d0b.id,-1)
	,sp
	,sp_id = coalesce(d1.id,-1)
	,syntyp2
    ,syntyp2_id = coalesce(d2.id,-1)
	,[tilvaskunsuuraluer2] 
	,[tilvaskunsuuraluer2_id] = coalesce((select top 1 d.id from VipunenTK.dbo.d_alueluokitus d where d.suuralue_koodi = [tilvaskunsuuraluer2]), -1)
    ,[tilvaskunryh]
	,[tilvaskunryh_id] = coalesce(d3.id,-1)
	,ptoim1r6e
	,ptoim1r6e_id = coalesce(d4.id,-1)
	,[sosee]
	,[sosee_id] = coalesce(d5.id,-1)
	,[pientul_id] = coalesce(d6.id,-1)
	,tol2008_1_v2
	,tol2008_1_v2_id = coalesce(d7.id,-1)

	,f.iscfi2013
	,iscfi2013_id = coalesce(d8.id,-1)
	,kaste_t2_3
	,kaste_t2_3_id = coalesce(d9.id,-1)
	,eitutkjoht
	,eitutkjoht_id = coalesce(d10.id,-1)
    ,[tavoite]
	,[tavoite_id] = coalesce(d11.id,-1)
	,[tyov_id] = coalesce(d12.id,-1)
	
	,lkm
	
	--aik
    ,[korkein_aiempi_tutkinto_id] = coalesce(d30.id,-1)
    ,[korkein_aiempi_tutkinto_vuotta_kulunut]
    ,[aikyo_id] = coalesce(d31.id,-1)
    ,[aikyo_vuotta_kulunut]
    ,[aikpt_id] = coalesce(d32.id,-1)
    ,[aikpt_vuotta_kulunut]
    ,[aikateat_id] = coalesce(d33.id,-1)
    ,[aikateat_vuotta_kulunut]
    ,[aikamk_id] = coalesce(d34.id,-1)
    ,[aikamk_vuotta_kulunut]
    ,[aikalkk_id] = coalesce(d35.id,-1)
    ,[aikalkk_vuotta_kulunut]
    ,[aikylamk_id] = coalesce(d36.id,-1)
    ,[aikylamk_vuotta_kulunut]
    ,[aikylkk_id] = coalesce(d37.id,-1)
    ,[aikylkk_vuotta_kulunut]
	
FROM VipunenTK_DW.dbo.f_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat f 

LEFT JOIN VipunenTK..d_ika d0 on d0.ika_avain = 'ikar8_'+ikar8
LEFT JOIN VipunenTK..d_kylla_ei AS d0b ON d0b.kylla_ei_koodi = f.ika_25_64_vuotta
LEFT JOIN VipunenTK..d_sukupuoli AS d1 ON d1.sukupuoli_koodi = f.sp
LEFT JOIN VipunenTK..d_syntypera AS d2 ON d2.syntypera_koodi = f.syntyp2
LEFT JOIN VipunenTK..d_kuntaryhma AS d3 ON d3.kuntaryhma_koodi = f.tilvaskunryh
LEFT JOIN VipunenTK..d_paaasiallinen_toiminta_versio2 AS d4 ON d4.paaasiallinen_toiminta_versio2_koodi = f.ptoim1r6e --r6 <-> r2 pl. varusmies- & siviilpalvelus
LEFT JOIN VipunenTK..d_sosioekonominen_asema AS d5 ON d5.sosioekonominen_asema_koodi = f.sosee
LEFT JOIN VipunenTK..d_kylla_ei AS d6 ON d6.kylla_ei_koodi = f.pientul
LEFT JOIN VipunenTK..d_toimiala_2008 AS d7 ON d7.toimiala_2008_avain = f.tol2008_1_v2
LEFT JOIN VipunenTK..d_koulutusluokitus AS d8 ON d8.koulutusluokitus_avain = 'ISCFI'+f.iscfi2013
LEFT JOIN VipunenTK..d_koulutusluokitus AS d9 ON d9.koulutusluokitus_avain = 'KASTET2'+f.kaste_t2_3
LEFT JOIN VipunenTK..d_tutkintoon_johtamaton_koulutus AS d10 ON d10.tutkintoon_johtamaton_koulutus_koodi = f.eitutkjoht
LEFT JOIN VipunenTK..d_tutkinnon_tavoite AS d11 ON d11.tutkinnon_tavoite_koodi = f.tavoite
LEFT JOIN VipunenTK..d_kylla_ei AS d12 ON d12.kylla_ei_koodi = f.tyov
LEFT JOIN VipunenTK..d_koulutussektori d13 ON d13.koulutussektori_koodi = f.sektori
LEFT JOIN VipunenTK..d_lahde d14 ON d14.lahde_koodi = f.lahde
--aik
LEFT JOIN VipunenTK..d_tutkinto AS d30 ON d30.tutkinto_avain = f.korkein_aiempi_tutkinto
LEFT JOIN VipunenTK..d_kylla_ei AS d31 ON d31.kylla_ei_koodi = f.aikyo
LEFT JOIN VipunenTK..d_kylla_ei AS d32 ON d32.kylla_ei_koodi = f.aikpt
LEFT JOIN VipunenTK..d_kylla_ei AS d33 ON d33.kylla_ei_koodi = f.aikateat
LEFT JOIN VipunenTK..d_kylla_ei AS d34 ON d34.kylla_ei_koodi = f.aikamk
LEFT JOIN VipunenTK..d_kylla_ei AS d35 ON d35.kylla_ei_koodi = f.aikalkk
LEFT JOIN VipunenTK..d_kylla_ei AS d36 ON d36.kylla_ei_koodi = f.aikylamk
LEFT JOIN VipunenTK..d_kylla_ei AS d37 ON d37.kylla_ei_koodi = f.aikylkk
