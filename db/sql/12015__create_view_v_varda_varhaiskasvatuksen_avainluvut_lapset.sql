USE [ANTERO]
GO

/****** Object:  View [dw].[v_varda_varhaiskasvatuksen_avainluvut_lapset]    Script Date: 24.4.2026 13.39.26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [dw].[v_varda_varhaiskasvatuksen_avainluvut_lapset] AS 

SELECT 
	v.tilastovuosi,
	v.sukupuoli_fi,
	v.ikaryhma_fi,
	v.jarjestamismuotoavain,
	SUM(v.lapset) as lapset
FROM (
	SELECT
		tilastovuosi,
		d.sukupuoli_fi,
		CASE
			WHEN f.ika < 3 THEN 'Alle 3-vuotiaat'
			WHEN f.ika < 6 THEN '3-5-vuotiaat'
			WHEN f.ika = 6 THEN '6-vuotiaat'
			ELSE '7 vuotta ja yli'
		END as ikaryhma_fi,
		f.jarjestamismuotoavain,
		f.lapset
	FROM  [ANTERO].[dw].[f_varhaiskasvatuksen_avainluvut_lapset] f
	LEFT JOIN [ANTERO].dw.d_sukupuoli d on d.sukupuoli_koodi = f.sukupuoli_koodi

) v
GROUP BY
v.tilastovuosi,
v.sukupuoli_fi,
v.ikaryhma_fi,
v.jarjestamismuotoavain