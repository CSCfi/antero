USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_f_4_3b]    Script Date: 17.1.2023 20:52:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






--drop table VipunenTK.dbo.f_4_2d_Vaeston_koulutusrakenne_syntyperan_mukaan
--select * into VipunenTK.dbo.f_4_2d_Vaeston_koulutusrakenne_syntyperan_mukaan from ( ... ) q

CREATE OR ALTER PROCEDURE [dbo].[p_lataa_f_4_2d] AS

TRUNCATE TABLE VipunenTK.dbo.f_4_2d_Vaeston_koulutusrakenne_syntyperan_mukaan;

INSERT VipunenTK.dbo.f_4_2d_Vaeston_koulutusrakenne_syntyperan_mukaan

SELECT 
	 tilv
	,tilv_date
	,sp
	,sp_id = coalesce(d1.id,-1)
	,aikielir1
	,aikielir1_id = coalesce(d2.id,-1)
	,ikar8
	,ikar8_id = coalesce(d3.id,-1)
	,tilvasmaak
	,tilvasmaak_id = coalesce(d4.id,-1)
	,kansalr2
    ,kansalr2_id = coalesce(d5.id,-1)
	,syntyp2
    ,syntyp2_id = coalesce(d6.id,-1)
	,suormaak
	,suormaak_id = coalesce(d7.id,-1)
	,f.iscfi2013
	,iscfi2013_id = coalesce(d8.id,-1)
	,kaste_t2
	,kaste_t2_id = coalesce(d9.id,-1)
	,kouljat
	,kouljat_id = coalesce(d10.id,-1)
	,oppis
	,oppis_id = coalesce(d11.id,-1)
	,tutklaja_tr
	,tutklaja_tr_id = coalesce(d12.id,-1)
	,opso
	,opso_id = coalesce(d13.id,-1)
	,koso
	,koso_id = coalesce(d14.id,-1)

	,lkm

	,f.tietolahde
	,rivinumero

FROM VipunenTK_DW.dbo.sa_4_2d_Vaeston_koulutusrakenne_syntyperan_mukaan f
LEFT JOIN VipunenTK..d_sukupuoli AS d1 ON d1.sukupuoli_koodi = f.sp
LEFT JOIN VipunenTK..d_aidinkieli_versio1 AS d2 ON d2.aidinkieli_versio1_koodi = f.aikielir1
LEFT JOIN VipunenTK..d_ika AS d3 ON d3.ika_avain = 'ikar8_'+f.ikar8
LEFT JOIN VipunenTK..d_alueluokitus AS d4 ON d4.alueluokitus_avain = 'MAAK'+f.tilvasmaak
LEFT JOIN VipunenTK..d_kansalaisuus_versio2 AS d5 ON d5.kansalaisuus_versio2_koodi = f.kansalr2
LEFT JOIN VipunenTK..d_syntypera AS d6 ON d6.syntypera_koodi = f.syntyp2
LEFT JOIN VipunenTK..d_alueluokitus AS d7 ON d7.alueluokitus_avain = 'MAAK'+f.suormaak
LEFT JOIN VipunenTK..d_koulutusluokitus AS d8 ON d8.koulutusluokitus_avain = 'ISCFI'+f.iscfi2013
LEFT JOIN VipunenTK..d_koulutusluokitus AS d9 ON d9.koulutusluokitus_avain = 'KASTET2'+f.kaste_t2
LEFT JOIN VipunenTK..d_koulutusmuoto AS d10 ON d10.koulutusmuoto_koodi = f.kouljat AND f.tilv_date between d10.alkaa and d10.paattyy
LEFT JOIN VipunenTK..d_oppisopimuskoulutus AS d11 ON d11.oppisopimuskoulutus_koodi = f.oppis AND f.tilv_date between d11.alkaa and d11.paattyy
LEFT JOIN VipunenTK..d_ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa AS d12 ON d12.ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa_koodi = f.tutklaja_tr AND f.tilv_date between d12.alkaa and d12.paattyy
LEFT JOIN VipunenTK..d_kylla_ei AS d13 ON d13.kylla_ei_koodi = f.opso
LEFT JOIN VipunenTK..d_kylla_ei AS d14 ON d14.kylla_ei_koodi = f.koso

GO
