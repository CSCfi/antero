USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_f_4_6ab]    Script Date: 12.1.2021 12:43:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[p_lataa_f_4_6ab] AS
 
TRUNCATE TABLE VipunenTK.dbo.f_4_6ab_Tyovoimatutkimus_tyolliset_ja_tyottomat;

INSERT INTO VipunenTK.dbo.f_4_6ab_Tyovoimatutkimus_tyolliset_ja_tyottomat


SELECT
	 f.tilv as 'tilastovuosi'
	,f.tyovoima as 'tyovoima'
	,d1.id as 'sukupuoli_id' 
	,f.sp as 'sukupuoli'
	,d8.id as 'ammattiluokitus_2001_id'
	,f.amm2001 as 'ammattiluokitus_2001'
	,d2.id as 'ammattiluokitus_2010_id'
	,f.amm2010 as 'ammattiluokitus_2010'
	,d3.id as 'ikaryhma_id'
	,f.ikar3 as 'ikaryhma'
	,coalesce(d4.id, '-1') as 'koulutusaste_taso2_id'
	,f.kaste_t2 as 'koulutusaste_taso2'
	,coalesce(d5.id, '-1') as 'koulutusala_taso2_id'
	,f.iscfinarrow2013 as 'koulutusala_taso2'
	,coalesce(d6.id, '-1') as 'koulutusaste_2002_id'
	,f.opmast as 'koulutusaste_2002'
	,coalesce(d7.id, '-1') as 'koulutusala_2002_id'
	,f.opmopa as 'koulutusala_2002'
	,f.lkm
	,f.tietolahde
	,f.rivinumero
FROM [VipunenTK_DW].[dbo].[sa_4_6ab_Tyovoimatutkimus_tyolliset_ja_tyottomat] f

LEFT JOIN VipunenTK..d_sukupuoli AS d1 ON d1.sukupuoli_koodi=f.sp
LEFT JOIN VipunenTK..d_ammattiluokitus_2010 AS d2 ON d2.ammattiluokitus_2010_avain = f.amm2010
LEFT JOIN VipunenTK..d_ika AS d3 ON d3.ika_avain = f.ikar3
LEFT JOIN VipunenTK..d_koulutusluokitus AS d4 ON d4.koulutusluokitus_avain = CONCAT('KASTET2', f.kaste_t2)
LEFT JOIN VipunenTK..d_koulutusluokitus AS d5 ON d5.koulutusluokitus_avain = CONCAT('ISCFINARROW', f.iscfinarrow2013)
LEFT JOIN VipunenTK..d_koulutusluokitus AS d6 ON d6.koulutusluokitus_avain = CONCAT('OPMAST', f.opmast)
LEFT JOIN VipunenTK..d_koulutusluokitus AS d7 ON d7.koulutusluokitus_avain = CONCAT('OPMOPA', f.opmopa)
LEFT JOIN VipunenTK..d_ammattiluokitus_2001 AS d8 ON d8.ammattiluokitus_2001_avain = f.amm2001

GO

USE [ANTERO]