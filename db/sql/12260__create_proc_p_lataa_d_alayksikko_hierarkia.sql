
USE [ANTERO]

GO

CREATE OR ALTER PROCEDURE  dw.p_lataa_d_alayksikko_hierarkia as 

------------------------------------------------------------
-- 1) Tunnistetaan alayksiköiden väliset suhteet
------------------------------------------------------------

DROP TABLE IF EXISTS #temp_hierarkia;
DROP TABLE IF EXISTS #temp_hierarkia_pvt;
DROP TABLE IF EXISTS #siistitty;

    -- Yksi rivi per alayksikkö
SELECT * INTO #siistitty
FROM (
    SELECT
        d.*,
        ROW_NUMBER() OVER (
            PARTITION BY d.vuosi, d.korkeakoulu_koodi, d.alayksikko_koodi
            ORDER BY
                CASE WHEN d.paayksikko_koodi IS NULL  OR d.paayksikko_koodi = '-1' OR d.paayksikko_koodi = d.alayksikko_koodi THEN 0 ELSE 1 END,
                CASE WHEN EXISTS (
                        SELECT 1
                        FROM ANTERO.dw.d_organisaation_alayksikot p
                        WHERE p.vuosi = d.vuosi
                            AND p.korkeakoulu_koodi = d.korkeakoulu_koodi
                            AND p.alayksikko_koodi = d.paayksikko_koodi
                        )
                        THEN 0 ELSE 1 END,
                d.paayksikko_koodi
        ) AS rnk
    FROM ANTERO.dw.d_organisaation_alayksikot d
) x
WHERE x.rnk = 1;

WITH hierarkia AS (
    -- Pääyksiköt
    SELECT
        vuosi,
        korkeakoulu_koodi,
        alayksikko_koodi,
        alayksikko_nimi AS alayksikko_fi,
        COALESCE(NULLIF(alayksikko_nimi_en,''), alayksikko_nimi) AS alayksikko_en,
        COALESCE(NULLIF(alayksikko_nimi_sv,''), alayksikko_nimi) AS alayksikko_sv,
        paayksikko_koodi,
        1 AS taso,
        CAST(alayksikko_koodi AS VARCHAR(4000)) AS polku
    FROM #siistitty d1
    WHERE paayksikko_koodi IS NULL OR paayksikko_koodi = '-1' OR paayksikko_koodi = alayksikko_koodi OR
    NOT EXISTS (
        SELECT TOP 1 1
        FROM ANTERO.dw.d_organisaation_alayksikot d2
        WHERE d1.vuosi = d2.vuosi
          AND d1.korkeakoulu_koodi = d2.korkeakoulu_koodi
          AND d1.paayksikko_koodi = d2.alayksikko_koodi
    )

    UNION ALL

    -- Alayksiköt (rekursiivinen)
    SELECT
        c.vuosi,
        c.korkeakoulu_koodi,
        c.alayksikko_koodi,
        c.alayksikko_nimi AS alayksikko_fi,
        COALESCE(NULLIF(c.alayksikko_nimi_en,''), c.alayksikko_nimi) AS alayksikko_en,
        COALESCE(NULLIF(c.alayksikko_nimi_sv,''), c.alayksikko_nimi) AS alayksikko_sv,
        c.paayksikko_koodi,
        h.taso + 1,
        CAST(h.polku + '/' + c.alayksikko_koodi AS VARCHAR(4000))
    FROM #siistitty c
    JOIN hierarkia h ON  c.vuosi = h.vuosi  AND c.korkeakoulu_koodi = h.korkeakoulu_koodi  AND c.paayksikko_koodi = h.alayksikko_koodi
    WHERE c.alayksikko_koodi <> c.paayksikko_koodi AND h.taso <= 10 -- maksimiraja
)

SELECT * INTO #temp_hierarkia 
FROM hierarkia;

------------------------------------------------------------
-- 2) Pivotoidaan data sarakemuotoon
------------------------------------------------------------
DROP TABLE IF EXISTS #temp_hierarkia_final;

WITH expanded AS (
    SELECT
        lp.vuosi,
        lp.korkeakoulu_koodi,
        lp.alayksikko_koodi,
        lp.polku,
        s.ordinal AS taso_n,
        s.value   AS koodi,
        a.alayksikko_fi,   -- names of the ancestor at this level
        a.alayksikko_en,
        a.alayksikko_sv
    FROM #temp_hierarkia lp
    CROSS APPLY STRING_SPLIT(lp.polku, '/', 1) s
    LEFT JOIN #temp_hierarkia a
      ON  a.vuosi = lp.vuosi
      AND a.korkeakoulu_koodi = lp.korkeakoulu_koodi
      AND a.alayksikko_koodi = s.value
)
SELECT
    vuosi,
    korkeakoulu_koodi,
    alayksikko_koodi,
    COALESCE(MAX(CASE WHEN taso_n = 1 THEN koodi END),'-1') AS alayksikko_taso_1_koodi,
    COALESCE(MAX(CASE WHEN taso_n = 1 THEN alayksikko_fi END),'Tieto puuttuu') AS alayksikko_taso_1_fi,
    COALESCE(MAX(CASE WHEN taso_n = 1 THEN alayksikko_en END),'Missing data') AS alayksikko_taso_1_en,
    COALESCE(MAX(CASE WHEN taso_n = 1 THEN alayksikko_sv END),'Information saknas') AS alayksikko_taso_1_sv,
    COALESCE(MAX(CASE WHEN taso_n = 2 THEN koodi END),'-1') AS alayksikko_taso_2_koodi,
    COALESCE(MAX(CASE WHEN taso_n = 2 THEN alayksikko_fi END),'Tieto puuttuu') AS alayksikko_taso_2_fi,
    COALESCE(MAX(CASE WHEN taso_n = 2 THEN alayksikko_en END),'Missing data') AS alayksikko_taso_2_en,
    COALESCE(MAX(CASE WHEN taso_n = 2 THEN alayksikko_sv END),'Information saknas') AS alayksikko_taso_2_sv,
    COALESCE(MAX(CASE WHEN taso_n = 3 THEN koodi END),'-1') AS alayksikko_taso_3_koodi,
    COALESCE(MAX(CASE WHEN taso_n = 3 THEN alayksikko_fi END),'Tieto puuttuu') AS alayksikko_taso_3_fi,
    COALESCE(MAX(CASE WHEN taso_n = 3 THEN alayksikko_en END),'Missing data') AS alayksikko_taso_3_en,
    COALESCE(MAX(CASE WHEN taso_n = 3 THEN alayksikko_sv END),'Information saknas') AS alayksikko_taso_3_sv,
    COALESCE(MAX(CASE WHEN taso_n = 4 THEN koodi END),'-1') AS alayksikko_taso_4_koodi,
    COALESCE(MAX(CASE WHEN taso_n = 4 THEN alayksikko_fi END),'Tieto puuttuu') AS alayksikko_taso_4_fi,
    COALESCE(MAX(CASE WHEN taso_n = 4 THEN alayksikko_en END),'Missing data') AS alayksikko_taso_4_en,
    COALESCE(MAX(CASE WHEN taso_n = 4 THEN alayksikko_sv END),'Information saknas') AS alayksikko_taso_4_sv,
    COALESCE(MAX(CASE WHEN taso_n = 5 THEN koodi END),'-1') AS alayksikko_taso_5_koodi,
    COALESCE(MAX(CASE WHEN taso_n = 5 THEN alayksikko_fi END),'Tieto puuttuu') AS alayksikko_taso_5_fi,
    COALESCE(MAX(CASE WHEN taso_n = 5 THEN alayksikko_en END),'Missing data') AS alayksikko_taso_5_en,
    COALESCE(MAX(CASE WHEN taso_n = 5 THEN alayksikko_sv END),'Information saknas') AS alayksikko_taso_5_sv,
    COALESCE(MAX(CASE WHEN taso_n = 6 THEN koodi END),'-1') AS alayksikko_taso_6_koodi,
    COALESCE(MAX(CASE WHEN taso_n = 6 THEN alayksikko_fi END),'Tieto puuttuu') AS alayksikko_taso_6_fi,
    COALESCE(MAX(CASE WHEN taso_n = 6 THEN alayksikko_en END),'Missing data') AS alayksikko_taso_6_en,
    COALESCE(MAX(CASE WHEN taso_n = 6 THEN alayksikko_sv END),'Information saknas') AS alayksikko_taso_6_sv,
    COALESCE(MAX(CASE WHEN taso_n = 7 THEN koodi END),'-1') AS alayksikko_taso_7_koodi,
    COALESCE(MAX(CASE WHEN taso_n = 7 THEN alayksikko_fi END),'Tieto puuttuu') AS alayksikko_taso_7_fi,
    COALESCE(MAX(CASE WHEN taso_n = 7 THEN alayksikko_en END),'Missing data') AS alayksikko_taso_7_en,
    COALESCE(MAX(CASE WHEN taso_n = 7 THEN alayksikko_sv END),'Information saknas') AS alayksikko_taso_7_sv
INTO #temp_hierarkia_pvt
FROM expanded
WHERE alayksikko_koodi <> '-1'
GROUP BY vuosi, korkeakoulu_koodi, alayksikko_koodi, polku;

------------------------------------------------------------
-- 3) Merge dimensiotauluun
------------------------------------------------------------

IF NOT EXISTS (select * from dw.d_alayksikko_hierarkia where id = -1) 
begin
	SET identity_insert dw.d_alayksikko_hierarkia on;

	insert into dw.d_alayksikko_hierarkia (
		id, vuosi, korkeakoulu_koodi, alayksikko_koodi,
        alayksikko_taso_1_koodi, alayksikko_taso_1_fi, alayksikko_taso_1_en, alayksikko_taso_1_sv,
        alayksikko_taso_2_koodi, alayksikko_taso_2_fi, alayksikko_taso_2_en, alayksikko_taso_2_sv,
        alayksikko_taso_3_koodi, alayksikko_taso_3_fi, alayksikko_taso_3_en, alayksikko_taso_3_sv,
        alayksikko_taso_4_koodi, alayksikko_taso_4_fi, alayksikko_taso_4_en, alayksikko_taso_4_sv,
        alayksikko_taso_5_koodi, alayksikko_taso_5_fi, alayksikko_taso_5_en, alayksikko_taso_5_sv,
        alayksikko_taso_6_koodi, alayksikko_taso_6_fi, alayksikko_taso_6_en, alayksikko_taso_6_sv,
        alayksikko_taso_7_koodi, alayksikko_taso_7_fi, alayksikko_taso_7_en, alayksikko_taso_7_sv,
		source, loadtime, username
	)
	select
		-1, -1, '-1', '-1',
        '-1', 'Tieto puuttuu', 'Tieto puuttuu', 'Tieto puuttuu',
        '-1', 'Tieto puuttuu', 'Tieto puuttuu', 'Tieto puuttuu',
		'-1', 'Tieto puuttuu', 'Tieto puuttuu', 'Tieto puuttuu',
        '-1', 'Tieto puuttuu', 'Tieto puuttuu', 'Tieto puuttuu',
        '-1', 'Tieto puuttuu', 'Tieto puuttuu', 'Tieto puuttuu',
        '-1', 'Tieto puuttuu', 'Tieto puuttuu', 'Tieto puuttuu',
        '-1', 'Tieto puuttuu', 'Tieto puuttuu', 'Tieto puuttuu',
		'ETL: p_lataa_d_alayksikko_hierakia', GETDATE(), SUSER_NAME()
	from sa.sa_koodistot
	where koodisto='vipunenmeta' and koodi='-1';
	
	set identity_insert dw.d_alayksikko_hierarkia off;
end 

MERGE ANTERO.dw.d_alayksikko_hierarkia AS t
USING #temp_hierarkia_pvt AS s
   ON  t.vuosi = s.vuosi
   AND t.korkeakoulu_koodi = s.korkeakoulu_koodi
   AND t.alayksikko_koodi = s.alayksikko_koodi

WHEN MATCHED 
THEN UPDATE SET
    t.alayksikko_taso_1_koodi = s.alayksikko_taso_1_koodi, t.alayksikko_taso_1_fi = s.alayksikko_taso_1_fi,
    t.alayksikko_taso_1_en    = s.alayksikko_taso_1_en,    t.alayksikko_taso_1_sv = s.alayksikko_taso_1_sv,
    t.alayksikko_taso_2_koodi = s.alayksikko_taso_2_koodi, t.alayksikko_taso_2_fi = s.alayksikko_taso_2_fi,
    t.alayksikko_taso_2_en    = s.alayksikko_taso_2_en,    t.alayksikko_taso_2_sv = s.alayksikko_taso_2_sv,
    t.alayksikko_taso_3_koodi = s.alayksikko_taso_3_koodi, t.alayksikko_taso_3_fi = s.alayksikko_taso_3_fi,
    t.alayksikko_taso_3_en    = s.alayksikko_taso_3_en,    t.alayksikko_taso_3_sv = s.alayksikko_taso_3_sv,
    t.alayksikko_taso_4_koodi = s.alayksikko_taso_4_koodi, t.alayksikko_taso_4_fi = s.alayksikko_taso_4_fi,
    t.alayksikko_taso_4_en    = s.alayksikko_taso_4_en,    t.alayksikko_taso_4_sv = s.alayksikko_taso_4_sv,
    t.alayksikko_taso_5_koodi = s.alayksikko_taso_5_koodi, t.alayksikko_taso_5_fi = s.alayksikko_taso_5_fi,
    t.alayksikko_taso_5_en    = s.alayksikko_taso_5_en,    t.alayksikko_taso_5_sv = s.alayksikko_taso_5_sv,
    t.alayksikko_taso_6_koodi = s.alayksikko_taso_6_koodi, t.alayksikko_taso_6_fi = s.alayksikko_taso_6_fi,
    t.alayksikko_taso_6_en    = s.alayksikko_taso_6_en,    t.alayksikko_taso_6_sv = s.alayksikko_taso_6_sv,
    t.alayksikko_taso_7_koodi = s.alayksikko_taso_7_koodi, t.alayksikko_taso_7_fi = s.alayksikko_taso_7_fi,
    t.alayksikko_taso_7_en    = s.alayksikko_taso_7_en,    t.alayksikko_taso_7_sv = s.alayksikko_taso_7_sv,
	t.loadtime = GETDATE(), t.username = SUSER_NAME()

-- INSERT: new rows
WHEN NOT MATCHED BY TARGET THEN
    INSERT (
        vuosi, korkeakoulu_koodi, alayksikko_koodi,
        alayksikko_taso_1_koodi, alayksikko_taso_1_fi, alayksikko_taso_1_en, alayksikko_taso_1_sv,
        alayksikko_taso_2_koodi, alayksikko_taso_2_fi, alayksikko_taso_2_en, alayksikko_taso_2_sv,
        alayksikko_taso_3_koodi, alayksikko_taso_3_fi, alayksikko_taso_3_en, alayksikko_taso_3_sv,
        alayksikko_taso_4_koodi, alayksikko_taso_4_fi, alayksikko_taso_4_en, alayksikko_taso_4_sv,
        alayksikko_taso_5_koodi, alayksikko_taso_5_fi, alayksikko_taso_5_en, alayksikko_taso_5_sv,
        alayksikko_taso_6_koodi, alayksikko_taso_6_fi, alayksikko_taso_6_en, alayksikko_taso_6_sv,
        alayksikko_taso_7_koodi, alayksikko_taso_7_fi, alayksikko_taso_7_en, alayksikko_taso_7_sv,
		source, loadtime, username
    )
    VALUES (
        s.vuosi, s.korkeakoulu_koodi, s.alayksikko_koodi,
        s.alayksikko_taso_1_koodi, s.alayksikko_taso_1_fi, s.alayksikko_taso_1_en, s.alayksikko_taso_1_sv,
        s.alayksikko_taso_2_koodi, s.alayksikko_taso_2_fi, s.alayksikko_taso_2_en, s.alayksikko_taso_2_sv,
        s.alayksikko_taso_3_koodi, s.alayksikko_taso_3_fi, s.alayksikko_taso_3_en, s.alayksikko_taso_3_sv,
        s.alayksikko_taso_4_koodi, s.alayksikko_taso_4_fi, s.alayksikko_taso_4_en, s.alayksikko_taso_4_sv,
        s.alayksikko_taso_5_koodi, s.alayksikko_taso_5_fi, s.alayksikko_taso_5_en, s.alayksikko_taso_5_sv,
        s.alayksikko_taso_6_koodi, s.alayksikko_taso_6_fi, s.alayksikko_taso_6_en, s.alayksikko_taso_6_sv,
        s.alayksikko_taso_7_koodi, s.alayksikko_taso_7_fi, s.alayksikko_taso_7_en, s.alayksikko_taso_7_sv,
		'ETL: p_lataa_d_alayksikko_hierakia', GETDATE(), SUSER_NAME()
    )

WHEN NOT MATCHED BY SOURCE AND t.id <> '-1' THEN
    DELETE;