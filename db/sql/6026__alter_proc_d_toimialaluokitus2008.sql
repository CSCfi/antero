USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_toimialaluokitus2008]    Script Date: 9.3.2022 13:24:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





ALTER PROCEDURE [dw].[p_lataa_d_toimialaluokitus2008] AS


DROP TABLE IF EXISTS ANTERO.dw.d_toimialaluokitus2008
DROP TABLE IF EXISTS ANTERO.sa.sa_toimialaluokitus2008_valitaulu


SELECT 
	CAST(id AS int) AS id
	,toimiala_koodi
	,selite_fi
	,taso
	,taso_0
	,taso_1 =
		CASE WHEN toimiala_koodi IN ('X', '00', '000', '0000', '00000') THEN 'X'
		ELSE taso_1 END 
	,taso_2 =
		CASE WHEN toimiala_koodi IN ('X', '00', '000', '0000', '00000') THEN '00'
		ELSE taso_2 END 
	,taso_3 =
		CASE WHEN toimiala_koodi IN ('X', '00', '000', '0000', '00000') THEN '000'
		ELSE taso_3 END 
	,taso_4 =
		CASE WHEN toimiala_koodi IN ('X', '00', '000', '0000', '00000') THEN '0000'
		ELSE taso_4 END 
	,taso_5 =
		CASE WHEN toimiala_koodi IN ('X', '00', '000', '0000', '00000') THEN '00000'
		ELSE taso_5 END 
	,jarj_taso_1 =
		CASE
			WHEN CAST(id  AS int) < 0 THEN 99999
			WHEN taso = 1 THEN RANK() OVER (PARTITION BY taso ORDER BY CAST(id  AS int))
			ELSE NULL END
	,jarj_taso_1_v2 =
		CASE
			WHEN CAST(id  AS int) < 0 THEN 99999
			WHEN toimiala_koodi = 'X' THEN 999998
			WHEN taso = 1 THEN RANK() OVER (PARTITION BY taso ORDER BY selite_fi)
			ELSE NULL END
	,jarj_taso_2 =
		CASE
			WHEN CAST(id  AS int) < 0 THEN 99999
			WHEN taso = 2 THEN RANK() OVER (PARTITION BY taso ORDER BY CAST(id  AS int))
			ELSE NULL END
	,jarj_taso_3 =
		CASE
			WHEN CAST(id  AS int) < 0 THEN 99999
			WHEN taso = 3 THEN RANK() OVER (PARTITION BY taso ORDER BY CAST(id  AS int))
			ELSE NULL END
	,jarj_taso_4 =
		CASE
			WHEN CAST(id  AS int) < 0 THEN 99999
			WHEN taso = 4 THEN RANK() OVER (PARTITION BY taso ORDER BY CAST(id  AS int))
			ELSE NULL END
	,jarj_taso_5 =
		CASE
			WHEN CAST(id  AS int) < 0 THEN 99999
			WHEN taso = 5 THEN RANK() OVER (PARTITION BY taso ORDER BY CAST(id  AS int))
			ELSE NULL END
INTO ANTERO.sa.sa_toimialaluokitus2008_valitaulu
FROM ANTERO.sa.sa_toimialaluokitus2008



SELECT 
	tol.id
    ,tol.[toimiala_koodi]
    ,tol.[selite_fi]
    ,tol.[taso]
    ,tol.[taso_0]
	,taso_0_selite_fi = 'Toimialat yhteensä'
    ,tol.[taso_1]
	,taso_1_selite_fi = tol1.selite_fi
	,taso_1_selite_sv = tol1.selite_fi
    ,tol.[taso_2]
	,taso_2_selite_fi = tol2.selite_fi
	,taso_2_selite_sv = tol2.selite_fi
    ,tol.[taso_3]
	,taso_3_selite_fi = tol3.selite_fi
	,taso_3_selite_sv = tol3.selite_fi
    ,tol.[taso_4]
	,taso_4_selite_fi = tol4.selite_fi
	,taso_4_selite_sv = tol4.selite_fi
    ,tol.[taso_5]
	,taso_5_selite_fi = tol5.selite_fi
	,taso_5_selite_sv = tol5.selite_fi
	,tol1.jarj_taso_1
	,tol1.jarj_taso_1_v2
	,tol2.jarj_taso_2
	,tol3.jarj_taso_3
	,tol4.jarj_taso_4
	,tol5.jarj_taso_5
INTO ANTERO.dw.d_toimialaluokitus2008
FROM ANTERO.sa.sa_toimialaluokitus2008_valitaulu tol
LEFT JOIN sa.sa_toimialaluokitus2008_valitaulu tol1 on tol1.toimiala_koodi = tol.taso_1
LEFT JOIN sa.sa_toimialaluokitus2008_valitaulu tol2 on tol2.toimiala_koodi = tol.taso_2
LEFT JOIN sa.sa_toimialaluokitus2008_valitaulu tol3 on tol3.toimiala_koodi = tol.taso_3
LEFT JOIN sa.sa_toimialaluokitus2008_valitaulu tol4 on tol4.toimiala_koodi = tol.taso_4
LEFT JOIN sa.sa_toimialaluokitus2008_valitaulu tol5 on tol5.toimiala_koodi = tol.taso_5

DROP TABLE IF EXISTS ANTERO.sa.sa_toimialaluokitus2008_valitaulu



