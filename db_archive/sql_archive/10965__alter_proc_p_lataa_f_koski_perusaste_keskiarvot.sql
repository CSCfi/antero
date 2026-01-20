USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_perusaste_keskiarvot]    Script Date: 30.7.2025 10.32.19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_koski_perusaste_keskiarvot] AS

-- Proseduurissa lasketaan uusien lukio-opiskelijoiden perusopetuksen kaikkien aineiden ja lukuaineiden keskiarvot (korotukset huomioidaan)


--Temp-taulujen pudotus
DROP TABLE IF EXISTS ANTERO.dbo.temp_perusopetus_arvosanat
DROP TABLE IF EXISTS ANTERO.dbo.temp_lukio_opiskelijoiden_tarkasteluajankohdat

-- Perusjoukko ja tarkasteluajankohdat temp-tauluun
SELECT DISTINCT 
	master_oid, 
	-- Tarkastelupäivä tilastovuoden kesäkuun 5. päivä: CSCVIPUNEN-4310
	DATEFROMPARTS(vuosi,6,5) as tarkasteluajankohta
INTO ANTERO.dbo.temp_lukio_opiskelijoiden_tarkasteluajankohdat
FROM ANTERO.dw.f_koski_lukio_opiskelijat_uudet

-- Temp-taulu osa-suoritustiedoille. 
-- nuortenperusopetuksenoppiaineenoppimaara ja perusopetuksenoppiaineenoppimaara suorituksien tiedot päätasolta
SELECT 
	oo.master_oid, 
	case 
		when ps.suorituksen_tyyppi in ('nuortenperusopetuksenoppiaineenoppimaara', 'perusopetuksenoppiaineenoppimaara') then ps.koulutusmoduuli_pakollinen 
		else os.koulutusmoduuli_pakollinen 
	end as koulutusmoduuli_pakollinen,
	case 
		when ps.suorituksen_tyyppi in ('nuortenperusopetuksenoppiaineenoppimaara', 'perusopetuksenoppiaineenoppimaara') and ps.koulutusmoduuli_koodiarvo = 'B2' then concat(ps.koulutusmoduuli_koodiarvo, ps.koulutusmoduuli_kieli)
		when ps.suorituksen_tyyppi in ('nuortenperusopetuksenoppiaineenoppimaara', 'perusopetuksenoppiaineenoppimaara') then ps.koulutusmoduuli_koodiarvo
		when ps.suorituksen_tyyppi not in ('nuortenperusopetuksenoppiaineenoppimaara', 'perusopetuksenoppiaineenoppimaara') and os.koulutusmoduuli_koodiarvo = 'B2' then concat(os.koulutusmoduuli_koodiarvo, os.kieli_koodiarvo)
		else os.koulutusmoduuli_koodiarvo
	end as koulutusmoduuli_koodiarvo,
	case 
		when ps.suorituksen_tyyppi in ('nuortenperusopetuksenoppiaineenoppimaara', 'perusopetuksenoppiaineenoppimaara') then ps.arviointi_arvosana_koodiarvo
		else os.arviointi_arvosana_koodiarvo
	end as arviointi_arvosana_koodiarvo,
	case 
		when ps.suorituksen_tyyppi in ('nuortenperusopetuksenoppiaineenoppimaara', 'perusopetuksenoppiaineenoppimaara') then ps.koulutusmoduuli_koodisto
		else os.koulutusmoduuli_koodisto
	end as koulutusmoduuli_koodisto,
	ps.vahvistus_paiva,
	ps.suorituksen_tyyppi,
	po.perusopetus_suoritettu
INTO ANTERO.dbo.temp_perusopetus_arvosanat
FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo 
LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] ps on ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
LEFT JOIN [Koski_SA].[sa].[sa_koski_osasuoritus] os on os.paatason_suoritus_id = ps.paatason_suoritus_id
OUTER APPLY (
	SELECT 
		MIN(vahvistus_paiva) as perusopetus_suoritettu
	FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo2
	LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] ps2 on oo2.opiskeluoikeus_oid = ps2.opiskeluoikeus_oid
	WHERE ps2.suorituksen_tyyppi in ('perusopetuksenoppimaara', 'aikuistenperusopetuksenoppimaara')
	and oo2.master_oid = oo.master_oid
) po
WHERE ps.suorituksen_tyyppi in ('perusopetuksenoppimaara', 'aikuistenperusopetuksenoppimaara', 'perusopetuksenlisaopetus', 'nuortenperusopetuksenoppiaineenoppimaara', 'perusopetuksenoppiaineenoppimaara')
and ps.luokkaaste_koodiarvo is null and ps.vahvistus_paiva is not null

-- Faktataulun tyhjäys ja lataus
TRUNCATE TABLE dw.f_koski_perusaste_keskiarvot

INSERT INTO dw.f_koski_perusaste_keskiarvot (	
	master_oid,
	vuosi,
	keskiarvo,
	keskiarvo_lukuaineet
)

SELECT 
	f.master_oid, 
	f.vuosi,
	f.keskiarvo, 
	f.keskiarvo_lukuaineet 
FROM (
  
	SELECT 
		f.master_oid
		,f.vuosi
		,CAST(AVG(CAST(f.arvosana as decimal(10,5))) as decimal(10,5)) as 'keskiarvo'
		,CAST(AVG(CAST(f.arvosana_lukuaine as decimal(10,5))) as decimal(10,5)) as 'keskiarvo_lukuaineet'
	FROM (

		SELECT 
			ta.master_oid, 
			YEAR(ta.tarkasteluajankohta) as vuosi,
			pa.koulutusmoduuli_koodiarvo,
			MAX(cast(pa.arviointi_arvosana_koodiarvo as int)) as 'arvosana',
			MAX(CASE WHEN pa.koulutusmoduuli_koodiarvo not in ('MU', 'KS', 'LI', 'KO', 'KU', 'FI', 'PS', 'OP', 'OPA', 'XX') THEN cast(pa.arviointi_arvosana_koodiarvo as int) ELSE NULL END) as arvosana_lukuaine
		FROM [ANTERO].[dbo].[temp_lukio_opiskelijoiden_tarkasteluajankohdat] ta
		LEFT JOIN ANTERO.dbo.temp_perusopetus_arvosanat pa on pa.master_oid = ta.master_oid and pa.vahvistus_paiva <= ta.tarkasteluajankohta
		WHERE pa.koulutusmoduuli_pakollinen = 1
			and pa.koulutusmoduuli_koodisto = 'koskioppiaineetyleissivistava' 
			and pa.arviointi_arvosana_koodiarvo not in ('S', 'H', 'O') 
			and pa.arviointi_arvosana_koodiarvo is not null 
			-- Perusopetuksen oppimäärän on oltava suoritettu
			and pa.perusopetus_suoritettu <= ta.tarkasteluajankohta
		GROUP BY ta.master_oid, pa.koulutusmoduuli_koodiarvo, YEAR(ta.tarkasteluajankohta)
	) f
	GROUP BY f.master_oid, f.vuosi
) f

DROP TABLE IF EXISTS ANTERO.dbo.temp_perusopetus_arvosanat
DROP TABLE IF EXISTS ANTERO.dbo.temp_lukio_opiskelijoiden_tarkasteluajankohdat

GO


