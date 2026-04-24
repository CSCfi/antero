USE [ANTERO]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_f_varhaiskasvatuksen_avainluvut_lapset]    Script Date: 24.4.2026 13.25.14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE  [dw].[p_lataa_f_varhaiskasvatuksen_avainluvut_lapset] AS

-- Apulataus varhaiskasvatuksen avainluvut -visualisointia varten
DROP TABLE IF EXISTS [ANTERO].[dbo].[temp_varhaiskasvatustiedot]

SELECT DISTINCT
	vaka.tilastovuosi,
	DATEDIFF(year,henkilo_syntyma_pvm, cast(concat(vaka.tilastovuosi, '-12-31') as date)) AS ika, 
	sukup.sukupuoli_koodi,
	vaka.henkilo_id as apusarake_henkilo_id,
	jm.koodi as jarjestamismuoto_koodi
INTO [ANTERO].[dbo].[temp_varhaiskasvatustiedot]
FROM [ANTERO].[dw].[f_varda_vakasuhteet_vakapaatokset] vaka
INNER JOIN dw.f_varda_vakajarjestajat_toimipaikat tp on tp.toimipaikka_id = vaka.vakasuhde_toimipaikka_id and vaka.tilastovuosi = tp.tilastovuosi
LEFT JOIN ANTERO.dw.d_sukupuoli sukup ON vaka.d_sukupuoli = sukup.id
LEFT JOIN dw.d_varda_jarjestamismuoto jm ON d_jarjestamismuoto_id_vakapaatos = jm.id
LEFT JOIN dw.d_ika as ikar on ikar.id = vaka.d_ikaryhma_id

DROP TABLE IF EXISTS [ANTERO].[dbo].[f_varhaiskasvatuksen_avainluvut_lapset]

SELECT
	t.tilastovuosi,
	t.ika,
	t.sukupuoli_koodi,
	jm.jarjestamismuotoavain,
	COUNT(DISTINCT t.apusarake_henkilo_id) as lapset
INTO [ANTERO].[dw].[f_varhaiskasvatuksen_avainluvut_lapset]
FROM [ANTERO].[dbo].[temp_varhaiskasvatustiedot] t
-- Muodostetaan järjestämismuotoavain lapsille, jos he ovat samaan aikaan toimipaikoissa, joilla on eri järjestämismuoto
OUTER APPLY (
    SELECT
        STRING_AGG(
            CAST(d.jarjestamismuoto_koodi AS varchar(max)),
            '_'
        ) WITHIN GROUP (ORDER BY d.jarjestamismuoto_koodi) AS jarjestamismuotoavain
    FROM (
        SELECT DISTINCT t2.jarjestamismuoto_koodi
        FROM [ANTERO].[dbo].[temp_varhaiskasvatustiedot] t2
        WHERE t2.tilastovuosi = t.tilastovuosi AND t.apusarake_henkilo_id = t2.apusarake_henkilo_id
    ) d
) jm
WHERE ika <= 10
GROUP BY t.tilastovuosi, t.ika, t.sukupuoli_koodi, jm.jarjestamismuotoavain

DROP TABLE IF EXISTS [ANTERO].[dbo].[temp_varhaiskasvatustiedot]