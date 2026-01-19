USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_amos_koonti_rahoitusperusteet] --@generoitu [int], @kokonaisuus [nvarchar](255)
AS

--Huom. Kohdetauluun jää toteuman osalta vain muutosrajoitteet huomioiva rahoitusosuus yhteensä sekä rajoitekerroin, estimaatti jyrää muut tiedot.

/*
SYNOPSIS
0. Pohjaksi nykyrakenne sis. ed. v. rahoitusosuudet ja mallin painot
1. TOTEUMA
	a) osakokonaisuuksien rahoitusosuuksien muodostaminen
	b) mallin painojen mukaiset rahoitusosuudet yhteensä (ilman siirtymäajan rajoitteita)
	c-d) vuosikohtainen tasauskerroin sekä järjestäjäkohtaisen rajoitekerroin ja rahoitusosuudet yhteensä (siirtymäajan rajoitteet huomioiden)
2. ESTIMAATTI vastaavasti, mutta vain tuoreimmalle vuodelle (Varainhoitovuosi = @maxVuosi)
*/

DECLARE @minVuosi int = (select min(Varainhoitovuosi) from [dw].[f_amos_koonti_rahoitusperusteet])
DECLARE @maxVuosi int = (select max(Varainhoitovuosi) from [dw].[f_amos_koonti_rahoitusperusteet])
DECLARE @vuosi int = @minVuosi
DECLARE @t decimal(30,29) --vuosikohtainen tasauskerroin


--0. Pohjaksi nykyrakenne ml. ed. v. rahoitusosuudet ja mallin painot

DROP TABLE IF EXISTS [dw].[f_amos_koonti_rahoitusperusteet]
SELECT *
INTO [dw].[f_amos_koonti_rahoitusperusteet]
FROM [dw].[v_amos_koonti_rahoitusperusteet]


--1. TOTEUMA

--1.a) osakokonaisuuksien rahoitusosuuksien muodostaminen

--opiskelijavuodet
UPDATE f
SET [painotetut_opv_lahtotaso_hyv_ka_osuus] = v.painotetut_opv_lahtotaso_hyv_ka_osuus
	,[painotetut_opv_kr_hyv_ka_osuus] = v.painotetut_opv_kr_hyv_ka_osuus
FROM [dw].[f_amos_koonti_rahoitusperusteet] f
LEFT JOIN [dw].[v_amos_opiskelijavuodet_uusi_rahoitusperusteet] v ON v.varainhoitovuosi = f.Varainhoitovuosi AND v.ytunnus_amos_spl = f.ytunnus_amos_spl
WHERE v.generoitu = 0 --huom.

--tutkinnot ja osaamispisteet
UPDATE f
SET [painotetut_tutk_ja_osp_hyv_ka_osuus] = v.painotetut_tutk_ja_osp_hyv_ka_osuus
FROM [dw].[f_amos_koonti_rahoitusperusteet] f
LEFT JOIN [dw].[v_amos_tutkinnot_ja_tutkinnonosat_uusi_rahoitusperusteet] v	ON v.varainhoitovuosi = f.Varainhoitovuosi AND v.ytunnus_amos_spl = f.ytunnus_amos_spl
WHERE v.generoitu = 0 --huom.

--työllistyminen ja jatko-opiskelu
UPDATE f
SET [tyoll_ja_jatkoopisk_ei_tyoll_ennen_koul_ka_osuus] = v.tyoll_ja_jatkoopisk_ei_tyoll_ennen_koul_ka_osuus
FROM [dw].[f_amos_koonti_rahoitusperusteet] f
LEFT JOIN [dw].[v_amos_tyollistyminen_ja_jatkoopiskelu_rahoitusperusteet] v ON v.varainhoitovuosi = f.Varainhoitovuosi AND v.[Koodit Koulutuksen järjestäjä] = f.ytunnus_amos_spl
WHERE v.[Toteuma/Estimaatti] = 'Toteuma' --huom.

--työelämäpalaute
UPDATE f
SET [tyopaikkakysely_pisteet_osuus] = v.tyopaikkakysely_pisteet_osuus
	,[tyopaikkaohjaajakysely_painotetut_pisteet_osuus] = v.tyopaikkaohjaajakysely_painotetut_pisteet_osuus
FROM [dw].[f_amos_koonti_rahoitusperusteet] f
LEFT JOIN [dw].[v_amos_tyoelamapalaute_rahoitusperusteet] v ON v.varainhoitovuosi = f.Varainhoitovuosi AND v.koodit_koulutuksen_jarjestaja = f.ytunnus_amos_spl
WHERE v.generoitu = 0 --huom.

--opiskelijapalaute
UPDATE f
SET [aloituskysely_painotetut_pisteet_osuus] = v.aloituskysely_painotetut_pisteet_osuus
	,[paattokysely_painotetut_pisteet_osuus] = v.paattokysely_painotetut_pisteet_osuus
FROM [dw].[f_amos_koonti_rahoitusperusteet] f
LEFT JOIN [dw].[v_amos_opiskelijapalaute_rahoitusperusteet] v ON v.varainhoitovuosi = f.Varainhoitovuosi AND v.[Koodit Koulutuksen järjestäjä] = f.ytunnus_amos_spl
WHERE v.generoitu = 0 --huom.


--1.b) mallin painojen mukaiset rahoitusosuudet yhteensä (ilman siirtymäajan rajoitteita)

UPDATE [dw].[f_amos_koonti_rahoitusperusteet]
SET [laskennallinen_rahoitus_osuus_ilman_rajoitteita] = 
	[painotetut_opv_lahtotaso_hyv_ka_osuus_paino] * coalesce([painotetut_opv_lahtotaso_hyv_ka_osuus], 0.0)
	+ [painotetut_opv_kr_hyv_ka_osuus_paino] * coalesce([painotetut_opv_kr_hyv_ka_osuus], 0.0)
	+ [painotetut_tutk_ja_osp_hyv_ka_osuus_paino] * coalesce([painotetut_tutk_ja_osp_hyv_ka_osuus], 0.0)
	+ [tyoll_ja_jatkoopisk_ei_tyoll_ennen_koul_ka_osuus_paino] * coalesce([tyoll_ja_jatkoopisk_ei_tyoll_ennen_koul_ka_osuus], 0.0)
	+ [tyopaikkakysely_pisteet_osuus_paino] * coalesce([tyopaikkakysely_pisteet_osuus], 0.0)
	+ [tyopaikkaohjaajakysely_painotetut_pisteet_osuus_paino] * coalesce([tyopaikkaohjaajakysely_painotetut_pisteet_osuus], 0.0)
	+ [aloituskysely_painotetut_pisteet_osuus_paino] * coalesce([aloituskysely_painotetut_pisteet_osuus], 0.0)
	+ [paattokysely_painotetut_pisteet_osuus_paino] * coalesce([paattokysely_painotetut_pisteet_osuus], 0.0)


--1.c-d) vuosikohtainen tasauskerroin sekä järjestäjäkohtaisen rajoitekerroin ja rahoitusosuudet yhteensä (siirtymäajan rajoitteet huomioiden)

--järjestäjäkohtaisten rajoitekertoimien ääriarvot
UPDATE [dw].[f_amos_koonti_rahoitusperusteet]
SET rajoitekerroin_minimi = 
		cast(
			cast(muutos_minimikerroin as decimal(3,2)) 
			* 
			cast(
				cast(nullif(laskennallinen_rahoitus_osuus_ed_v, 0.0) as decimal(16,15)) 
				/ cast(nullif(laskennallinen_rahoitus_osuus_ilman_rajoitteita, 0.0) as decimal(16,15))
				as decimal(33,30)	
			) 
			as decimal(30,27)
		)
	,rajoitekerroin_maksimi = 
		cast(
			cast(muutos_maksimikerroin as decimal(3,2)) 
			* 
			cast(
				cast(nullif(laskennallinen_rahoitus_osuus_ed_v, 0.0) as decimal(16,15)) 
				/ cast(nullif(laskennallinen_rahoitus_osuus_ilman_rajoitteita, 0.0) as decimal(16,15))
				as decimal(33,30)	
			) 
			as decimal(30,27)
		)
;

WHILE @vuosi <= @maxVuosi
BEGIN
	--1.c) vuosikohtainen tasauskerroin

	DROP TABLE IF EXISTS #rajatapaukset

	SELECT 
		parametri = rajoitekerroin_minimi
		,budjetti = cast(null as decimal(30,27))
	INTO #rajatapaukset
	FROM [dw].[f_amos_koonti_rahoitusperusteet]
	WHERE Varainhoitovuosi = @vuosi

	UNION 

	SELECT 
		rajoitekerroin_maksimi
		,null
	FROM [dw].[f_amos_koonti_rahoitusperusteet]
	WHERE Varainhoitovuosi = @vuosi
	;

	--suhteellinen budjetti em. ääriarvoissa
	update t
	set budjetti = coalesce(ca.a, 0.0) + coalesce(ca2.b, 0.0) + t.parametri * coalesce(ca3.c, 0.0)
	from #rajatapaukset t
	cross apply (
		select 
			a = sum(f.muutos_minimikerroin * f.laskennallinen_rahoitus_osuus_ed_v)
		from [dw].[f_amos_koonti_rahoitusperusteet] f
		where Varainhoitovuosi = @vuosi
		and (
			coalesce(f.laskennallinen_rahoitus_osuus_ilman_rajoitteita, 0.0) = 0.0
			or t.parametri < f.rajoitekerroin_minimi --* f.laskennallinen_rahoitus_osuus_ilman_rajoitteita < f.muutos_minimikerroin * f.laskennallinen_rahoitus_osuus_ed_v
		)
	) ca
	cross apply (
		select 
			b = sum(f.muutos_maksimikerroin * f.laskennallinen_rahoitus_osuus_ed_v)
		from [dw].[f_amos_koonti_rahoitusperusteet] f
		where Varainhoitovuosi = @vuosi
		and t.parametri > f.rajoitekerroin_maksimi --* f.laskennallinen_rahoitus_osuus_ilman_rajoitteita > f.muutos_maksimikerroin * f.laskennallinen_rahoitus_osuus_ed_v
	) ca2
	cross apply (
		select 
			c = sum(f.laskennallinen_rahoitus_osuus_ilman_rajoitteita)
		from [dw].[f_amos_koonti_rahoitusperusteet] f
		where Varainhoitovuosi = @vuosi
		and (
			coalesce(f.laskennallinen_rahoitus_osuus_ed_v, 0.0) = 0.0
			or t.parametri between f.rajoitekerroin_minimi and f.rajoitekerroin_maksimi --* f.laskennallinen_rahoitus_osuus_ilman_rajoitteita between f.muutos_minimikerroin * f.laskennallinen_rahoitus_osuus_ed_v and f.muutos_maksimikerroin * f.laskennallinen_rahoitus_osuus_ed_v
		)
	) ca3
	;

	--haarukoidaan väli, jolla budjettitasapaino kääntyy
	DROP TABLE IF EXISTS #vali;

	WITH orderedRows AS (
		SELECT 
			parametri_alaraja = parametri
			,parametri_ylaraja = LEAD(parametri) OVER (ORDER BY parametri)
			,SignCheck = (budjetti-1) * LEAD(budjetti-1) OVER (ORDER BY parametri)
		FROM #rajatapaukset
	)
	SELECT top 1 
		parametri_alaraja
		,parametri_ylaraja
		,parametri = cast(null as decimal(30,29))
	INTO #vali
	FROM orderedRows
	WHERE SignCheck <= 0
	ORDER BY parametri_alaraja
	;

	--ratkaistaan em. väliltä yleinen tasauskerroin budjettitasapainossa
	UPDATE t
	SET parametri = cast((1.0 - (coalesce(ca.a, 0.0) + coalesce(ca2.b, 0.0))) as decimal(15,14)) / ca3.c
	FROM #vali t
	CROSS APPLY (
		select 
			a = sum(cast(f.muutos_minimikerroin as decimal(15,12)) * cast(f.laskennallinen_rahoitus_osuus_ed_v as decimal(15,14)))
		from [dw].[f_amos_koonti_rahoitusperusteet] f
		where Varainhoitovuosi = @vuosi
		and (
			coalesce(f.laskennallinen_rahoitus_osuus_ilman_rajoitteita, 0.0) = 0.0
			or t.parametri_alaraja < f.rajoitekerroin_minimi 
		)
	) ca
	CROSS APPLY (
		select 
			b = sum(cast(f.muutos_maksimikerroin as decimal(15,12)) * cast(f.laskennallinen_rahoitus_osuus_ed_v as decimal(15,14)))
		from [dw].[f_amos_koonti_rahoitusperusteet] f
		where Varainhoitovuosi = @vuosi
		and t.parametri_ylaraja > f.rajoitekerroin_maksimi 
	) ca2
	CROSS APPLY (
		select 
			c = cast(sum(f.laskennallinen_rahoitus_osuus_ilman_rajoitteita) as decimal(15,14))
		from [dw].[f_amos_koonti_rahoitusperusteet] f
		where Varainhoitovuosi = @vuosi
		and (
			coalesce(f.laskennallinen_rahoitus_osuus_ed_v, 0.0) = 0.0
			or (
				t.parametri_alaraja >= f.rajoitekerroin_minimi
				and t.parametri_ylaraja <= f.rajoitekerroin_maksimi
			)
		)
	) ca3

	SET @t = (select parametri from #vali)
	;


	--1.d) järjestäjäkohtaisen rajoitekerroin ja rahoitusosuudet yhteensä (siirtymäajan rajoitteet huomioiden)

	UPDATE [dw].[f_amos_koonti_rahoitusperusteet]
	SET laskennallinen_rahoitus_rajoitekerroin = 
		case
			when @t < rajoitekerroin_minimi then rajoitekerroin_minimi
			when @t > rajoitekerroin_maksimi then rajoitekerroin_maksimi
			when coalesce(laskennallinen_rahoitus_osuus_ilman_rajoitteita, 0.0) = 0.0 then null
			else @t
		end
	WHERE Varainhoitovuosi = @vuosi
	;

	UPDATE [dw].[f_amos_koonti_rahoitusperusteet]
	SET laskennallinen_rahoitus_osuus = 
		coalesce(
			cast(laskennallinen_rahoitus_rajoitekerroin as decimal(15,12)) * cast(laskennallinen_rahoitus_osuus_ilman_rajoitteita as decimal(15,14))
			,cast(muutos_minimikerroin as decimal(15,12)) * cast(laskennallinen_rahoitus_osuus_ed_v as decimal(15,14))
		)
	WHERE Varainhoitovuosi = @vuosi
	;


	DROP TABLE #rajatapaukset
	DROP TABLE #vali

	SET @vuosi += 1

END


--2. ESTIMAATTI

--2.a) osakokonaisuuksien rahoitusosuuksien muodostaminen

--opiskelijavuodet
UPDATE f
SET [painotetut_opv_lahtotaso_hyv_ka_osuus] = v.painotetut_opv_lahtotaso_hyv_ka_osuus
	,[painotetut_opv_kr_hyv_ka_osuus] = v.painotetut_opv_kr_hyv_ka_osuus
FROM [dw].[f_amos_koonti_rahoitusperusteet] f
LEFT JOIN [dw].[v_amos_opiskelijavuodet_uusi_rahoitusperusteet] v ON v.varainhoitovuosi = f.Varainhoitovuosi AND v.ytunnus_amos_spl = f.ytunnus_amos_spl
WHERE v.generoitu = 1 --huom.

--tutkinnot ja osaamispisteet
UPDATE f
SET [painotetut_tutk_ja_osp_hyv_ka_osuus] = v.painotetut_tutk_ja_osp_hyv_ka_osuus
FROM [dw].[f_amos_koonti_rahoitusperusteet] f
LEFT JOIN [dw].[v_amos_tutkinnot_ja_tutkinnonosat_uusi_rahoitusperusteet] v	ON v.varainhoitovuosi = f.Varainhoitovuosi AND v.ytunnus_amos_spl = f.ytunnus_amos_spl
WHERE v.generoitu = 1 --huom.

--työllistyminen ja jatko-opiskelu
UPDATE f
SET [tyoll_ja_jatkoopisk_ei_tyoll_ennen_koul_ka_osuus] = v.tyoll_ja_jatkoopisk_ei_tyoll_ennen_koul_ka_osuus
FROM [dw].[f_amos_koonti_rahoitusperusteet] f
LEFT JOIN [dw].[v_amos_tyollistyminen_ja_jatkoopiskelu_rahoitusperusteet] v ON v.varainhoitovuosi = f.Varainhoitovuosi AND v.[Koodit Koulutuksen järjestäjä] = f.ytunnus_amos_spl
WHERE v.[Toteuma/Estimaatti] = 'Estimaatti' --huom.

--työelämäpalaute
UPDATE f
SET [tyopaikkakysely_pisteet_osuus] = v.tyopaikkakysely_pisteet_osuus
	,[tyopaikkaohjaajakysely_painotetut_pisteet_osuus] = v.tyopaikkaohjaajakysely_painotetut_pisteet_osuus
FROM [dw].[f_amos_koonti_rahoitusperusteet] f
LEFT JOIN [dw].[v_amos_tyoelamapalaute_rahoitusperusteet] v ON v.varainhoitovuosi = f.Varainhoitovuosi AND v.koodit_koulutuksen_jarjestaja = f.ytunnus_amos_spl
WHERE v.generoitu = 1 --huom.

--opiskelijapalaute
UPDATE f
SET [aloituskysely_painotetut_pisteet_osuus] = v.aloituskysely_painotetut_pisteet_osuus
	,[paattokysely_painotetut_pisteet_osuus] = v.paattokysely_painotetut_pisteet_osuus
FROM [dw].[f_amos_koonti_rahoitusperusteet] f
LEFT JOIN [dw].[v_amos_opiskelijapalaute_rahoitusperusteet] v ON v.varainhoitovuosi = f.Varainhoitovuosi AND v.[Koodit Koulutuksen järjestäjä] = f.ytunnus_amos_spl
WHERE v.generoitu = 1 --huom.


--2.b) mallin painojen mukaiset rahoitusosuudet yhteensä (ilman siirtymäajan rajoitteita)

UPDATE [dw].[f_amos_koonti_rahoitusperusteet]
SET [laskennallinen_rahoitus_osuus_ilman_rajoitteita] = 
	[painotetut_opv_lahtotaso_hyv_ka_osuus_paino] * coalesce([painotetut_opv_lahtotaso_hyv_ka_osuus], 0.0)
	+ [painotetut_opv_kr_hyv_ka_osuus_paino] * coalesce([painotetut_opv_kr_hyv_ka_osuus], 0.0)
	+ [painotetut_tutk_ja_osp_hyv_ka_osuus_paino] * coalesce([painotetut_tutk_ja_osp_hyv_ka_osuus], 0.0)
	+ [tyoll_ja_jatkoopisk_ei_tyoll_ennen_koul_ka_osuus_paino] * coalesce([tyoll_ja_jatkoopisk_ei_tyoll_ennen_koul_ka_osuus], 0.0)
	+ [tyopaikkakysely_pisteet_osuus_paino] * coalesce([tyopaikkakysely_pisteet_osuus], 0.0)
	+ [tyopaikkaohjaajakysely_painotetut_pisteet_osuus_paino] * coalesce([tyopaikkaohjaajakysely_painotetut_pisteet_osuus], 0.0)
	+ [aloituskysely_painotetut_pisteet_osuus_paino] * coalesce([aloituskysely_painotetut_pisteet_osuus], 0.0)
	+ [paattokysely_painotetut_pisteet_osuus_paino] * coalesce([paattokysely_painotetut_pisteet_osuus], 0.0)
WHERE Varainhoitovuosi = @maxVuosi

	
--2.c-d) vuosikohtainen tasauskerroin sekä järjestäjäkohtaisen rajoitekerroin ja rahoitusosuudet yhteensä (siirtymäajan rajoitteet huomioiden)

--järjestäjäkohtaisten rajoitekertoimien ääriarvot													   
UPDATE [dw].[f_amos_koonti_rahoitusperusteet]
SET rajoitekerroin_minimi = 
		cast(
			cast(muutos_minimikerroin as decimal(3,2)) 
			* 
			cast(
				cast(nullif(laskennallinen_rahoitus_osuus_ed_v, 0.0) as decimal(16,15)) 
				/ cast(nullif(laskennallinen_rahoitus_osuus_ilman_rajoitteita, 0.0) as decimal(16,15))
				as decimal(33,30)	
			) 
			as decimal(30,27)
		)
	,rajoitekerroin_maksimi = 
		cast(
			cast(muutos_maksimikerroin as decimal(3,2)) 
			* 
			cast(
				cast(nullif(laskennallinen_rahoitus_osuus_ed_v, 0.0) as decimal(16,15)) 
				/ cast(nullif(laskennallinen_rahoitus_osuus_ilman_rajoitteita, 0.0) as decimal(16,15))
				as decimal(33,30)	
			) 
			as decimal(30,27)
		)
WHERE Varainhoitovuosi = @maxVuosi
;


--2.c) vuosikohtainen tasauskerroin

DROP TABLE IF EXISTS #rajatapaukset2

SELECT 
	parametri = rajoitekerroin_minimi
	,budjetti = cast(null as decimal(30,27))
INTO #rajatapaukset2
FROM [dw].[f_amos_koonti_rahoitusperusteet]
WHERE Varainhoitovuosi = @maxVuosi

UNION 

SELECT 
	rajoitekerroin_maksimi
	,null
FROM [dw].[f_amos_koonti_rahoitusperusteet]
WHERE Varainhoitovuosi = @maxVuosi
;

--suhteellinen budjetti em. ääriarvoissa
update t
set budjetti = coalesce(ca.a, 0.0) + coalesce(ca2.b, 0.0) + t.parametri * coalesce(ca3.c, 0.0)
from #rajatapaukset2 t
cross apply (
	select 
		a = sum(f.muutos_minimikerroin * f.laskennallinen_rahoitus_osuus_ed_v)
	from [dw].[f_amos_koonti_rahoitusperusteet] f
	where Varainhoitovuosi = @maxVuosi 
	and (
		coalesce(f.laskennallinen_rahoitus_osuus_ilman_rajoitteita, 0.0) = 0.0
		or t.parametri < f.rajoitekerroin_minimi --* f.laskennallinen_rahoitus_osuus_ilman_rajoitteita < f.muutos_minimikerroin * f.laskennallinen_rahoitus_osuus_ed_v
	)
) ca
cross apply (
	select 
		b = sum(f.muutos_maksimikerroin * f.laskennallinen_rahoitus_osuus_ed_v)
	from [dw].[f_amos_koonti_rahoitusperusteet] f
	where Varainhoitovuosi = @maxVuosi 
	and t.parametri > f.rajoitekerroin_maksimi --* f.laskennallinen_rahoitus_osuus_ilman_rajoitteita > f.muutos_maksimikerroin * f.laskennallinen_rahoitus_osuus_ed_v
) ca2
cross apply (
	select 
		c = sum(f.laskennallinen_rahoitus_osuus_ilman_rajoitteita)
	from [dw].[f_amos_koonti_rahoitusperusteet] f
	where Varainhoitovuosi = @maxVuosi 
	and (
		coalesce(f.laskennallinen_rahoitus_osuus_ed_v, 0.0) = 0.0
		or t.parametri between f.rajoitekerroin_minimi and f.rajoitekerroin_maksimi --* f.laskennallinen_rahoitus_osuus_ilman_rajoitteita between f.muutos_minimikerroin * f.laskennallinen_rahoitus_osuus_ed_v and f.muutos_maksimikerroin * f.laskennallinen_rahoitus_osuus_ed_v
	)
) ca3
;

--haarukoidaan väli, jolla budjettitasapaino kääntyy
DROP TABLE IF EXISTS #vali2;

WITH orderedRows AS (
	SELECT 
		parametri_alaraja = parametri
		,parametri_ylaraja = LEAD(parametri) OVER (ORDER BY parametri)
		,SignCheck = (budjetti-1) * LEAD(budjetti-1) OVER (ORDER BY parametri)
	FROM #rajatapaukset2
)
SELECT top 1 
	parametri_alaraja
	,parametri_ylaraja
	,parametri = cast(null as decimal(30,29))
INTO #vali2
FROM orderedRows
WHERE SignCheck <= 0
ORDER BY parametri_alaraja
;

--ratkaistaan em. väliltä yleinen tasauskerroin budjettitasapainossa																	  
UPDATE t
SET parametri = cast((1.0 - (coalesce(ca.a, 0.0) + coalesce(ca2.b, 0.0))) as decimal(15,14)) / ca3.c
FROM #vali2 t
CROSS APPLY (
	select 
		a = sum(cast(f.muutos_minimikerroin as decimal(15,12)) * cast(f.laskennallinen_rahoitus_osuus_ed_v as decimal(15,14)))
	from [dw].[f_amos_koonti_rahoitusperusteet] f
	where Varainhoitovuosi = @maxVuosi 
	and (
		coalesce(f.laskennallinen_rahoitus_osuus_ilman_rajoitteita, 0.0) = 0.0
		or t.parametri_alaraja < f.rajoitekerroin_minimi 
	)
) ca
CROSS APPLY (
	select 
		b = sum(cast(f.muutos_maksimikerroin as decimal(15,12)) * cast(f.laskennallinen_rahoitus_osuus_ed_v as decimal(15,14)))
	from [dw].[f_amos_koonti_rahoitusperusteet] f
	where Varainhoitovuosi = @maxVuosi 
	and t.parametri_ylaraja > f.rajoitekerroin_maksimi 
) ca2
CROSS APPLY (
	select 
		c = cast(sum(f.laskennallinen_rahoitus_osuus_ilman_rajoitteita) as decimal(15,14))
	from [dw].[f_amos_koonti_rahoitusperusteet] f
	where Varainhoitovuosi = @maxVuosi 
	and (
		coalesce(f.laskennallinen_rahoitus_osuus_ed_v, 0.0) = 0.0
		or (
			t.parametri_alaraja >= f.rajoitekerroin_minimi
			and t.parametri_ylaraja <= f.rajoitekerroin_maksimi
		)
	)
) ca3

SET @t = (select parametri from #vali2)
;


--2.d) järjestäjäkohtainen rajoitekerroin sekä rahoitusosuudet yhteensä (siirtymäajan rajoitteet huomioiden)
UPDATE [dw].[f_amos_koonti_rahoitusperusteet]
SET laskennallinen_rahoitus_rajoitekerroin_estimaatti = 
	case
		when @t < rajoitekerroin_minimi then rajoitekerroin_minimi
		when @t > rajoitekerroin_maksimi then rajoitekerroin_maksimi
		when coalesce(laskennallinen_rahoitus_osuus_ilman_rajoitteita, 0.0) = 0.0 then null
		else @t
	end
WHERE Varainhoitovuosi = @maxVuosi
;

UPDATE [dw].[f_amos_koonti_rahoitusperusteet]
SET laskennallinen_rahoitus_osuus_estimaatti = 
	coalesce(
		cast(laskennallinen_rahoitus_rajoitekerroin_estimaatti as decimal(15,12)) * cast(laskennallinen_rahoitus_osuus_ilman_rajoitteita as decimal(15,14))
		,cast(muutos_minimikerroin as decimal(15,12)) * cast(laskennallinen_rahoitus_osuus_ed_v as decimal(15,14))
	)
WHERE Varainhoitovuosi = @maxVuosi
;

DROP TABLE #rajatapaukset2
DROP TABLE #vali2

GO
