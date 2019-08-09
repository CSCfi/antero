USE [ANTERO]
GO

/****** Object:  View [dw].[v_amos_spl_koski_opiskeluoikeus_piirteet]    Script Date: 9.8.2019 16:43:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER view [dw].[v_amos_spl_koski_opiskeluoikeus_piirteet] AS


/****** 
Tämä näkymä on pohja jolla luodaan ja täytetään sp-laskennan piirretaulu.
/jhe 2019-02-08,jhe 2019-02-08, jhe 2019-04-29, 11.5.2019, 12.5.2019,16.5.2019, 17.5.2019, 24.5, 28.5, 29.5, 3.6, 4.6, 5.6, 12.6


DROP TABLE [dw].[f_koski_opiskeluoikeus_piirteet_spl]
SELECT * 
INTO [dw].[f_koski_opiskeluoikeus_piirteet_spl]
FROM [dw].[v_amos_spl_koski_opiskeluoikeus_piirteet]


 ******/

select distinct

	oo.oppija_oid
	--,oo.opiskeluoikeus_oid as opiskeluoikeus_oid_alkup
	,isnull(oo.sisaltyy_opiskeluoikeuteen_oid,oo.opiskeluoikeus_oid) as opiskeluoikeus_oid
	,case when oo.sisaltyy_opiskeluoikeuteen_oid is not null then 1 else 0 end as sisaltyy_toiseen
	--,oo.opiskeluoikeus_oid as opiskeluoikeus_oid --AP 20.6.2019 muutettu
	--,ps.paatason_suoritus_id
	,coalesce(oo2.oppilaitos_oid,oo.oppilaitos_oid) as oppilaitos_oid
	,coalesce(oo2.koulutustoimija_oid,oo.koulutustoimija_oid) as koulutustoimija_oid
	--12.5.2019 diaarinumero haettava data-kentän jsonista, per mikkonen email pe 10.5.2019 11.21
	--16.5.2019 siivotaan välilyönnit diaarinumeroista (uloin replace)
	,coalesce(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi) as tutkinto_koodi
	,replace(replace(replace(replace(substring(ps.data,CHARINDEX('"perusteenDiaarinumero": ',ps.data)+26,15),'}',''),'"',''),',',''),' ','') as diaarinumero
	,NULL /* replace(replace(replace(replace(substring(ps.data,CHARINDEX('"perusteenDiaarinumero": ',ps.data)+26,15),'}',''),'"',''),',',''),' ','')+'_'+ps.koulutusmoduuli_koodiarvo */ as diaarinumero_tutkinto_koodi

	,/* case 
		when ps.osaamisala_koodiarvo is null then replace(replace(replace(replace(substring(ps.data,CHARINDEX('"perusteenDiaarinumero": ',ps.data)+26,15),'}',''),'"',''),',',''),' ','')+'_'+ps.koulutusmoduuli_koodiarvo
		else replace(replace(replace(replace(substring(ps.data,CHARINDEX('"perusteenDiaarinumero": ',ps.data)+26,15),'}',''),'"',''),',',''),' ','')+'_'+ps.koulutusmoduuli_koodiarvo+'_'+ps.osaamisala_koodiarvo 
	 end */ NULL as diaarinumero_tutkinto_osaamisala_koodi

	,NULL /* ps.osaamisala_koodiarvo */ AS osaamisala_koodiarvo
	--AP 20.6.2019 muokattu opintojen rahoitusta niin että katsotaan edeltävästä jaksosta jos tieto puuttuu. 
	,case
		when ooa.opintojen_rahoitus is null then coalesce(ooa.opintojen_rahoitus, ooa2.opintojen_rahoitus)
		else ooa.opintojen_rahoitus
	 end as opintojen_rahoitus_koodi

	-- 2.4.2019 Sepon palaute, tutkintotyyppi korjattava osaa suorittavien kohdalla piirretaulussa
	,case 
		when ps.suorituksen_tyyppi <> 'ammatillinentutkinto' then '1' 
		else kl.tutkintotyyppi_koodi 
	 end as tutkintotyyppi_koodi
	/*,case when ps.suorituksen_tyyppi <> 'ammatillinentutkinto' then '1' 
	else kl.tutkintotyyppi_fi +' - suorittaa osaa' end as tutkintotyyppi_fi*/

	,NULL AS tila --ooa.tila
	,oo.koulutusmuoto
	,NULL AS tila_alkanut --ooa.tila_alkanut
	,ooa.alku
	,ooa.loppu
	/*			,year(ooa.tila_alkanut) as vuosi_tila_alkanut_int
	,month(ooa.tila_alkanut) as kuukausi_tila_alkanut_int
	,convert(varchar(4),year(ooa.tila_alkanut)) as vuosi_tila_alkanut
	,convert(varchar(2),month(ooa.tila_alkanut)) as kuukausi_tila_alkanut
	, DATEDIFF(DAY,ooa.loppu,ooa.tila_alkanut) as datediff_ooaloppu_ooaalkanut
	, CONVERT(VARCHAR(10), getdate(), 23) as tanaan
	, DATEDIFF(DAY,getdate(),ooa.tila_alkanut) as datediff_tanaan_ooaalkanut
	, DATEDIFF(DAY,getdate(),ooa.loppu) as datediff_tanaan_ooaloppu
	*/

	--20.2.2019 Kari K: Kustannusryhmä
	-- 2.4.2019 Sepon palaute, suorituksien osien kr määrättävä piirretaulussa
	--kustannusryhmä

	-- suorittaa tutkinnon_osa_tai_osia, kr vaihdettava 1:een
	,case 
		when ps.suorituksen_tyyppi <> 'ammatillinentutkinto' then '1' 
		else okr.kustannusryhma_koodi 
	end as kustannusryhma_koodi

	,CASE 
		--suorittaa tutkinnon_osa_tai_osia, kr vaihdettava 1:een
		WHEN ps.suorituksen_tyyppi <> 'ammatillinentutkinto' then '1' 
		WHEN ooa.opiskeluvalmiuksia_tukevat_opinnot = 1 THEN 'ot' 
		ELSE COALESCE(okr.kustannusryhma_koodi, tkr.kustannusryhma_koodi) 
	END AS kustannusryhma

	-- valma ja telma
	,CASE WHEN ps.suorituksen_tyyppi in ('valma','telma') THEN  1 else 0 end as valma_telma
	-- opiskeluvalmiuksia tukevat opinnot
	,ooa.opiskeluvalmiuksia_tukevat_opinnot


	--20.2.2019 Kari K: Muu ammatillinen koulutus (pl. VALMA, TELMA)
	,CASE WHEN kl.tutkintotyyppi_koodi='09' AND ps.suorituksen_tyyppi not in ('telma','valma') then 1 else 0 end as muu_ammatillinen_koul_pl_telma_ja_valma

	--20.2.2019 Kari K: Tutkintotyyppi/Onko oppisopimuskoulutusta vai ei. Oppisopimuskoulutuksella ei ole tällä hetkellä omaa painotusta, erottelu on vain varauksena tässä
	--jhe 5.6.2019 oppis sääntö aiheuttaa kahden kr:n merkitsemistä yhdelle opiskeluoikeudelle, disabloidaan oppis analyysi toistaiseksi
	--,CASE WHEN kl.tutkintotyyppi_koodi='02' and ooa.oppisopimus_jossain_paatason_suorituksessa=0 then 1 else 0 end as perustutkinnot_pl_oppisopimuskoulutus
	--,CASE WHEN kl.tutkintotyyppi_koodi in ('19','20') and ooa.oppisopimus_jossain_paatason_suorituksessa=0 then 1 else 0 end as ammatti_ja_erikoisammattitutkinnot_pl_oppisopimuskoulutus
	--jhe 5.6.2019 oppis sääntö aiheuttaa kahden kr:n merkitsemistä yhdelle opiskeluoikeudelle, disabloidaan oppis sääntö toistaiseksi
	--,CASE WHEN kl.tutkintotyyppi_koodi='02' and ooa.oppisopimus_jossain_paatason_suorituksessa=1 then 1 else 0 end as perustutkinnot_oppisopimuskoulutus
	--,CASE WHEN kl.tutkintotyyppi_koodi in ('19','20') and ooa.oppisopimus_jossain_paatason_suorituksessa=1 then 1 else 0 end as ammatti_ja_erikoisammattitutkinnot_oppisopimuskoulutus

	--4.6.2019 Seppo: muuttujat, joissa mukana myös oppis
	,CASE WHEN kl.tutkintotyyppi_koodi='02' then 1 else 0 end as perustutkinnot_ml_oppisopimuskoulutus
	,CASE WHEN kl.tutkintotyyppi_koodi in ('19','20') then 1 else 0 end as ammatti_ja_erikoisammattitutkinnot_ml_oppisopimuskoulutus


	--29.4.2019 lisää muuttujia Karin raporttimäärityksestä (Tutk. ja tutk. osat painotetut)
	,CASE WHEN kl.tutkintotyyppi_koodi='02' and ooa.oppisopimus_jossain_paatason_suorituksessa=0 AND ps.suorituksen_tyyppi <> 'ammatillinentutkinto' then 1 else 0 end as perustutkinnot_tutkinnonosat_pl_oppisopimuskoulutus
	,CASE WHEN kl.tutkintotyyppi_koodi in ('19','20') and ooa.oppisopimus_jossain_paatason_suorituksessa=0 AND ps.suorituksen_tyyppi <> 'ammatillinentutkinto' then 1 else 0 end as ammatti_ja_erikoisammattitutkinnot_tutkinnonosat_pl_oppisopimuskoulutus
	,CASE WHEN kl.tutkintotyyppi_koodi = ('02') THEN 'Perustutkintokoulutus' WHEN kl.tutkintotyyppi_koodi in ('19','20') THEN 'Ammatti- ja erikoisammattitutkintokoulutus' ELSE 'Muu' END as tutkintotyypin_ryhma
	,kl.tutkintotyyppi_fi AS tutkintotyyppi
	--,ooa.oppisopimus_jossain_paatason_suorituksessa AS oppisopimuskoulutus

	--4.6.2019 Seppo: muuttujat, joissa mukana myös oppis
	,CASE WHEN kl.tutkintotyyppi_koodi='02' AND ps.suorituksen_tyyppi <> 'ammatillinentutkinto' then 1 else 0 end as perustutkinnot_tutkinnonosat_ml_oppisopimuskoulutus
	,CASE WHEN kl.tutkintotyyppi_koodi in ('19','20') AND ps.suorituksen_tyyppi <> 'ammatillinentutkinto' then 1 else 0 end as ammatti_ja_erikoisammattitutkinnot_tutkinnonosat_ml_oppisopimuskoulutus


	--20.2.2019 Kari K: Erityisopetus; Ei erityisen tuen tehtävää
	,CASE WHEN (ooa.erityinen_tuki=1 or hojks=1) and ooa.vaativan_erityisen_tuen_erityinen_tehtava=0 and ps.suorituksen_tyyppi not in ('telma','valma') THEN 1 ELSE 0 end as erityisopiskelija_ilman_erit_tuen_tehtävaa_tutkintoon_johtava
	,CASE WHEN (ooa.erityinen_tuki=1 or hojks=1) and ooa.vaativan_erityisen_tuen_erityinen_tehtava=0 and ps.suorituksen_tyyppi in ('telma','valma') THEN 1 ELSE 0 END AS erityisopiskelija_ilman_erit_tuen_tehtävaa_tutkintoon_valmentava 

	--20.2.2019 Kari K: Erityisopetus; Vaativan erityisen tuen tehtävä, tutkintoon johtava
	-- erityisopiskelija, tutkintoon johtava
	,CASE WHEN ooa.vaativan_erityisen_tuen_erityinen_tehtava=1 and ps.suorituksen_tyyppi not in ('telma','valma') /*and ooa.erityinen_tuki=1*/ THEN 1 ELSE 0 END AS erityisopiskelija_tutkintoon_johtava
	--erityisopiskelija, vaikeasti vammainen
	,CASE WHEN /*ooa.vaativan_erityisen_tuen_erityinen_tehtava=1 and*/ ps.suorituksen_tyyppi not in ('telma','valma') and ooa.vaikeasti_vammainen=1 THEN 1 ELSE 0 END AS erityisopiskelija_vaikeasti_vammainen_tutkintoon_johtava
	--erityisopiskelija, vammainen + avustaja
	,CASE WHEN /*ooa.vaativan_erityisen_tuen_erityinen_tehtava=1 and*/ ps.suorituksen_tyyppi not in ('telma','valma') and ooa.vammainen_ja_avustaja=1 THEN 1 ELSE 0 END AS erityisopiskelija_vammainen_ja_avustaja_tutkintoon_johtava


	--20.2.2019 Kari K: Erityisopetus; Vaativan erityisen tuen tehtävä, ei tutkintoon johtava
	-- erityisopiskelija, TELMA&VALMA
	,CASE WHEN ooa.vaativan_erityisen_tuen_erityinen_tehtava=1 and ps.suorituksen_tyyppi in ('telma','valma') /*and ooa.erityinen_tuki=1*/ THEN 1 ELSE 0 END AS erityisopiskelija_telma_ja_valma_ei_tutkintoon_johtava 
	-- erityisopiskelija, vaikeasti vammainen
	,CASE WHEN /*ooa.vaativan_erityisen_tuen_erityinen_tehtava=1 and*/ ps.suorituksen_tyyppi in ('telma','valma') and ooa.vaikeasti_vammainen=1 THEN 1 ELSE 0 END AS erityisopiskelija_vaikeasti_vammainen_ei_tutkintoon_johtava
	-- erityisopiskelija, vammainen + avustaja
	,CASE WHEN /*ooa.vaativan_erityisen_tuen_erityinen_tehtava=1 and*/ ps.suorituksen_tyyppi in ('telma','valma') and ooa.vammainen_ja_avustaja=1 THEN 1 ELSE 0 END AS erityisopiskelija_vammainen_ja_avustaja_ei_tutkintoon_johtava

	--20.2.2019 Kari K: Majoitusetu
	--Ryhmä1 (majoitus)
	,ooa.majoitus
	--Ryhmä2 (sisaoppilaitosmainen_majoitus)
	,ooa.sisaoppilaitosmainen_majoitus
	--Ryhmä3 (vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus)
	,ooa.vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus


	--20.2.2019 Kari K: Vankilaopetus
	,ooa.vankilaopetuksessa AS vankilaopetus

	--20.2.2019 Kari K: Henkilöstökoulutus
	--Tutkintoon johtava koulutus
	,CASE WHEN oo.lisatiedot_henkilostokoulutus=1 and ps.suorituksen_tyyppi = 'ammatillinentutkinto' THEN 1 ELSE 0 END AS henkilostokoulutus_tutkintoon_johtava
	--Muu kuin tutkintoon johtava koulutus
	,CASE WHEN oo.lisatiedot_henkilostokoulutus=1 and ps.suorituksen_tyyppi <> 'ammatillinentutkinto' THEN 1 ELSE 0 END AS henkilostokoulutus_muu_kuin_tutkintoon_johtava

	--20.2.2019 Kari K: Työvoimakoulutus
	,CASE WHEN ooa.opintojen_rahoitus in ('10','2','3') THEN 1 ELSE 0 END AS tyovoimakoulutus


	,ooa.erityinen_tuki
	,hojks --AP 16.6.2019 poistettu oletusarvo 1
	,ooa.vaativan_erityisen_tuen_erityinen_tehtava
	,ooa.vaikeasti_vammainen
	,ooa.vammainen_ja_avustaja


	,CASE
		WHEN ps.suorituksen_tyyppi = 'ammatillinentutkinto' then 1 
		else 0 
	end as ammatillinen_tutkinto
	,CASE
		WHEN ps.suorituksen_tyyppi <> 'ammatillinentutkinto' then 1 
		else 0 
	end as tutkinnon_osa_tai_osia

	,ps.suorituksen_tyyppi

	-- anssin versio:,CASE WHEN ooa.osa_aikaisuus = 100 OR ooa.osa_aikaisuus is NULL THEN 2 ELSE 1 END AS osa_aikaisuus
	--11.5.2019 komm pois
	--			,CASE WHEN ooa.osa_aikaisuus = 100 OR ooa.osa_aikaisuus is NULL THEN 1 ELSE 0 END AS osa_aikaisuus

	,ooa.oppisopimus_jossain_paatason_suorituksessa AS oppisopimus
			
				
	,CASE WHEN ps.suorituksen_tyyppi in ('telma') THEN  1 else 0 end as telma
	,CASE WHEN ps.suorituksen_tyyppi in ('valma') THEN  1 else 0 end as valma
			
	,ps.vahvistus_paiva	

	,ps.paatason_suoritus_id

FROM Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa 
INNER JOIN Koski_SA.sa.sa_koski_paatason_suoritus ps ON ps.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
INNER JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo ON oo.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid 
LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo2 ON oo2.opiskeluoikeus_oid = oo.sisaltyy_opiskeluoikeuteen_oid
LEFT JOIN sa.sa_amos_osaamisala_kustannusryhma okr ON okr.osaamisala_koodi = ps.osaamisala_koodiarvo 
LEFT JOIN dw.d_koulutusluokitus kl ON kl.koulutusluokitus_koodi = COALESCE(NULLIF(ps.koulutusmoduuli_koodiarvo, '999904'), ps.tutkinto_koodiarvo)
LEFT JOIN sa.sa_amos_tutkinto_kustannusryhma tkr ON tkr.tutkinto_koodi = COALESCE(kl.uusi_eat_koodi,kl.koulutusluokitus_koodi) --AP 20.6.2019 lisätty coalesce
--puuttuva rahoitus otetaan edellisestä läsnäolojaksosta AP 20.6.2019
LEFT JOIN (
		SELECT 
		     opiskeluoikeus_oid
			,loppu
			,opintojen_rahoitus
		FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus_aikajakso] 
		WHERE tila='lasna' 
		--and opiskeluvalmiuksia_tukevat_opinnot = 0
) ooa2 on ooa2.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid and DATEDIFF(DAY,ooa2.loppu,ooa.tila_alkanut) = 1

--jhe 3.6.2019 karsitaan eivos-opiskeluoikeudet tässä vaiheessa
LEFT JOIN (
	SELECT distinct
		opiskeluoikeus_oid
	FROM dw.d_amos_spl_koski_liputa_ei_vos_rahoitettu_koulutus
	WHERE (tieto = 'opiskeluoikeus')
) eivos on isnull(oo.sisaltyy_opiskeluoikeuteen_oid,oo.opiskeluoikeus_oid) = eivos.opiskeluoikeus_oid

where 1=1
AND (oo.koulutusmuoto = 'ammatillinenkoulutus') 
--AND (ooa.tila = 'lasna') --AP 19.6.2019 parempi ottaa tässä vaiheessa kaikki tilat
AND (kl.tutkintotyyppi_koodi IN ( '02'/*,'09'*/,'19', '20' )) 
AND (ps.suorituksen_tyyppi <> 'nayttotutkintoonvalmistavakoulutus') --jhe 17.5.2019 Juhon meili:"Eli sun pitää pudottaa sieltä pois kaikki päätason suoritukset, joiden tyyppi on ”nayttotutkintoonvalmistavakoulutus". Niistä ei tarvi katsoa ollenkaan osasuorituksia."
AND eivos.opiskeluoikeus_oid is null --jhe 3.6.2019 karsitaan ei-vos oikeudet tässä vaiheessa



