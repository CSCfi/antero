USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_f_2_8f_2_9d]    Script Date: 13.1.2025 12.49.11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






--drop table VipunenTK.dbo.f_2_8f_2_9d_Korkeakouluopiskelijat_ja_tutkinnot_syntyperan_mukaan
--select * into VipunenTK.dbo.f_2_8f_2_9d_Korkeakouluopiskelijat_ja_tutkinnot_syntyperan_mukaan from ( ... ) q

ALTER   PROCEDURE [dbo].[p_lataa_f_2_8f_2_9d] AS

TRUNCATE TABLE VipunenTK.dbo.f_2_8f_2_9d_Korkeakouluopiskelijat_ja_tutkinnot_syntyperan_mukaan;

INSERT VipunenTK.dbo.f_2_8f_2_9d_Korkeakouluopiskelijat_ja_tutkinnot_syntyperan_mukaan

SELECT
	 tilv
	,aineisto
	,f.lahde
	,lahde_id = coalesce(d24.id,-1)
	,sektori = left(f.lahde, 1)
	,sektori_id = coalesce(d23.id,-1)

	,ikar7
	,ikar7_id = coalesce(d0.id,-1)
	,sp
	,sp_id = coalesce(d1.id,-1)
	,kansalr1
    ,kansalr1_id = coalesce(d2.id,-1)
	,syntyp2
    ,syntyp2_id = coalesce(d3.id,-1)

	,ophal
	,ophal_id = coalesce(d25.id,-1)
	,rahlahde_v2
	,rahlahde_v2_id = coalesce(d26.id,-1)
	,f.iscfi2013
	,iscfi2013_id = coalesce(d8.id,-1)
	,kaste_t2
	,kaste_t2_id = coalesce(d9.id,-1)
	,alvv
	,allk
	,allk_id = coalesce(d27.kausi_id,-1)
	,kvopisk
	,kvopisk_id = coalesce(d28.id,-1)

	,lkm

FROM VipunenTK_DW.dbo.sa_2_8f_2_9d_Korkeakouluopiskelijat_ja_tutkinnot_syntyperan_mukaan f 

LEFT JOIN VipunenTK..d_ika d0 on d0.ika_avain = (case when f.ikar7 = 15 then '19655v19' else '19655v'+f.ikar7 end)
LEFT JOIN VipunenTK..d_sukupuoli AS d1 ON d1.sukupuoli_koodi = f.sp
LEFT JOIN VipunenTK..d_kansalaisuus_versio1 AS d2 ON d2.kansalaisuus_versio1_koodi = f.kansalr1
LEFT JOIN VipunenTK..d_syntypera AS d3 ON d3.syntypera_koodi = f.syntyp2
LEFT JOIN VipunenTK..d_koulutusluokitus AS d8 ON d8.koulutusluokitus_avain = 'ISCFI'+f.iscfi2013
LEFT JOIN VipunenTK..d_koulutusluokitus AS d9 ON d9.koulutusluokitus_avain = 'KASTET2'+f.kaste_t2
LEFT JOIN VipunenTK..d_koulutussektori d23 ON d23.koulutussektori_koodi = left(f.lahde, 1)
LEFT JOIN VipunenTK..d_lahde d24 ON d24.lahde_koodi = f.lahde
LEFT JOIN VipunenTK..d_opetushallinnon_koulutus d25 ON d25.opetushallinnon_koulutus_koodi = f.ophal
LEFT JOIN VipunenTK..d_rahoituslahde d26 ON d26.rahoituslahde_koodi = f.rahlahde_v2 --koodi 1 <-> 1,2,3
LEFT JOIN VipunenTK..d_kausi d27 ON d27.kausi_id = concat('1900',f.allk) --alvv karkeistettu, ohjattu '19XX'

LEFT JOIN VipunenTK..d_kylla_ei d28 on d28.kylla_ei_koodi = f.kvopisk

GO


