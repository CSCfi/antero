USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_f_4_5]    Script Date: 8.1.2021 10:42:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_lataa_f_4_5]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_lataa_f_4_5] AS' 
END
GO

ALTER PROCEDURE [dbo].[p_lataa_f_4_5] AS
 
TRUNCATE TABLE VipunenTK.dbo.f_4_5_Tyovoimatutkimus_tyolliset;

INSERT INTO VipunenTK.dbo.f_4_5_Tyovoimatutkimus_tyolliset


SELECT
	 f.tilv as 'tilastovuosi'
	,d1.id as 'sukupuoli_id' 
	,f.sp as 'sukupuoli'
	,coalesce(d2.id,'-1') as 'ammattiluokitus_2001_id'
	,f.amm2001 as 'ammattiluokitus_2001'
	,coalesce(d3.id, '-1') as 'ammattiluokitus_2010_id'
	,f.amm2010 as 'ammattiluokitus_2010'
	,coalesce(d4.id, '-1') as 'toimiala_2008_id'
	,f.tol2008 as 'toimiala_2008'
	,f.lkm
	,f.tietolahde
	,f.rivinumero
FROM [VipunenTK_SA].[dbo].[v_sa_4_5_Tyovoimatutkimus_tyolliset] f

LEFT JOIN VipunenTK..d_sukupuoli AS d1 ON d1.sukupuoli_koodi=f.sp
LEFT JOIN VipunenTK..d_ammattiluokitus_2001 AS d2 ON d2.ammattiluokitus_2001_avain = f.amm2001
LEFT JOIN VipunenTK..d_ammattiluokitus_2010 AS d3 ON d3.ammattiluokitus_2010_avain = f.amm2010
LEFT JOIN VipunenTK..d_toimiala_2008 AS d4 ON d4.toimiala_2008_avain = f.tol2008

GO


USE [ANTERO]