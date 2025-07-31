USE [Koski_SA]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_duplikaatit]    Script Date: 30.7.2025 17.34.01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_duplikaatit] AS

--
--Duplikaattitutkintojen (sama tutkinto suoritettu samalla järjestäjällä saman vuoden aikana vähintään kahdesti) tunnistus
--

DROP TABLE IF EXISTS #cte;
DROP TABLE IF EXISTS #dupl;

--Perusjoukko temp-tauluun
SELECT 
	vt.id
	,master_oid
	,opiskeluoikeus_oid
	,vt.paatason_suoritus_id
	,vuosi
	,koulutustoimija_oid = oa.jarj_oid
	,vahvistus_paiva
	,tutkinto_koodi
	,osaamisala_koodiarvo
	,tutkintonimike_koodiarvo
	,dupl = null
	,oa2.avain
	,rnk_paiva = row_number () over (
		partition by master_oid, oa.jarj_oid, tutkinto_koodi, vahvistus_paiva, coalesce(tutkintonimike_koodiarvo,'99999'), coalesce(osaamisala_koodiarvo,'9999')
		order by vt.id 
	)
	,cnt_tutknimike = count(coalesce(tn.tutkintonimike_koodiarvo,'99999')) over (
		partition by master_oid, oa.jarj_oid, vt.paatason_suoritus_id, tutkinto_koodi, vahvistus_paiva
	)
INTO #cte
FROM dbo.tutkinnot_ja_tutkinnonosat_valitaulu vt
LEFT JOIN sa.sa_koski_paatason_suoritus_tutkintonimike tn on tn.paatason_suoritus_id = vt.paatason_suoritus_id
LEFT JOIN ANTERO.dw.d_amos_spl_jarjestaja_linkki jl on jl.oid_avain = vt.koulutustoimija_oid
LEFT JOIN ANTERO.dw.d_opintojenrahoitus d on d.koodi = vt.opintojen_rahoitus_koodi
OUTER APPLY (select jarj_oid = coalesce(jl.oid_amos_spl,jl.oid_avain)) oa
OUTER APPLY (select avain = concat(master_oid,'|',oa.jarj_oid,'|',vuosi,'|',tutkinto_koodi)) oa2
WHERE 1=1
and paataso = 1 
and suorittaa_koko_tutkintoa = 1
and d.sisaltyy_okm_suoritusrahoitus = 1
and oa2.avain in (
	select concat(master_oid,'|',coalesce(spl.oid_amos_spl,spl.oid_avain),'|',vuosi,'|',tutkinto_koodi)
	from dbo.tutkinnot_ja_tutkinnonosat_valitaulu vt2 
	left join ANTERO.dw.d_amos_spl_jarjestaja_linkki spl on spl.oid_avain = vt2.koulutustoimija_oid
	left join ANTERO.dw.d_opintojenrahoitus d2 on d2.koodi = vt2.opintojen_rahoitus_koodi
	where 1=1
	and vt2.paataso = 1
	and vt2.suorittaa_koko_tutkintoa = 1
	and d2.sisaltyy_okm_suoritusrahoitus = 1
	group by master_oid, coalesce(spl.oid_amos_spl,spl.oid_avain), vuosi, tutkinto_koodi 
	having count(*) > 1
)


/*
--Testitapauksien luonti
INSERT INTO #cte (id,master_oid,opiskeluoikeus_oid,paatason_suoritus_id,vuosi,koulutustoimija_oid,vahvistus_paiva,tutkinto_koodi,osaamisala_koodiarvo,tutkintonimike_koodiarvo,rnk_paiva,cnt_tutknimike)
VALUES (999998,'1.2.246.562.24.94592415178','1.2.246.562.15.27730102773','21211461',2018,'1.2.246.562.10.45042175963','2018-05-30 00:00:00.000','351407',null,null,1,1),
	   (999999,'1.2.246.562.24.94592415178','1.2.246.562.15.27730102773','21211462',2018,'1.2.246.562.10.45042175963','2018-05-31 00:00:00.000','351407',null,null,1,1);
VALUES (999998,'1.2.246.562.24.94592415178','1.2.246.562.15.27730102773','21211461',2018,'1.2.246.562.10.45042175963','2018-05-31 00:00:00.000','351407','2454','10111',1,1),
	   (999999,'1.2.246.562.24.94592415178','1.2.246.562.15.27730102773','21211461',2018,'1.2.246.562.10.45042175963','2018-05-31 00:00:00.000','351407','2454',null,1,1);
VALUES (999998,'1.2.246.562.24.94592415178','1.2.246.562.15.27730102773','21211461',2018,'1.2.246.562.10.45042175963','2018-05-31 00:00:00.000','351407','2454','10111',1,1),
	   (999999,'1.2.246.562.24.94592415178','1.2.246.562.15.27730102773','21211462',2018,'1.2.246.562.10.45042175963','2018-05-31 00:00:00.000','351407','2454','10111',2,1);
VALUES (999998,'1.2.246.562.24.94592415178','1.2.246.562.15.27730102773','21211461',2018,'1.2.246.562.10.45042175963','2018-05-30 00:00:00.000','351407','2454','10111',1,1),
	   (999999,'1.2.246.562.24.94592415178','1.2.246.562.15.27730102773','21211462',2018,'1.2.246.562.10.45042175963','2018-05-31 00:00:00.000','351407','2454','10111',1,2),
	   (999999,'1.2.246.562.24.94592415178','1.2.246.562.15.27730102773','21211462',2018,'1.2.246.562.10.45042175963','2018-05-31 00:00:00.000','351407','2454','10113',1,2);
VALUES (999998,'1.2.246.562.24.94592415178','1.2.246.562.15.27730102773','21211461',2018,'1.2.246.562.10.45042175963','2018-05-31 00:00:00.000','351407','2454','10111',1,1),
	   (999999,'1.2.246.562.24.94592415178','1.2.246.562.15.27730102773','21211462',2018,'1.2.246.562.10.45042175963','2018-05-30 00:00:00.000','351407','2454','10111',1,2),
	   (999999,'1.2.246.562.24.94592415178','1.2.246.562.15.27730102773','21211462',2018,'1.2.246.562.10.45042175963','2018-05-30 00:00:00.000','351407','2454','10113',1,2);
VALUES (999998,'1.2.246.562.24.94592415178','1.2.246.562.15.27730102773','21211461',2018,'1.2.246.562.10.45042175963','2018-05-31 00:00:00.000','351407','2454','10111',1,2),
	   (999998,'1.2.246.562.24.94592415178','1.2.246.562.15.27730102773','21211461',2018,'1.2.246.562.10.45042175963','2018-05-31 00:00:00.000','351407','2454','10113',1,2),
	   (999999,'1.2.246.562.24.94592415178','1.2.246.562.15.27730102773','21211462',2018,'1.2.246.562.10.45042175963','2018-05-31 00:00:00.000','351407','2453','10111',1,1);

--Testiopiskelija
select * from #cte where master_oid='1.2.246.562.24.94592415178'
*/


--Duplikaattien päättely
SELECT distinct
	id
	,master_oid, opiskeluoikeus_oid, koulutustoimija_oid, tutkinto_koodi, vuosi, vahvistus_paiva, rnk_paiva
	,dupl =
		--Ei duplikaatti
		----Jos molemmat epätyhjiä
		----Jos toinen tyhjä ja toinen epätyhjä
		----Jos molemmat tyhjiä
		case 	
			--Molemmat epätyhjiä
			when 
				c1.osaamisala_koodiarvo is not null and c1.tutkintonimike_koodiarvo is not null 
				and ( 
					--ei aiempaa samaa osaamisalaa
					not exists (
						select 1 
						from #cte as c2 
						where c2.avain = c1.avain
						and c2.vahvistus_paiva <= c1.vahvistus_paiva 
						and c2.id != c1.id
						and c2.osaamisala_koodiarvo = c1.osaamisala_koodiarvo
						and c2.rnk_paiva = 1
					) or 
					--ei aiempaa samaa tutkintonimikettä
					not exists (
						select 1 
						from #cte as c2 
						where c2.avain = c1.avain
						and c2.vahvistus_paiva <= c1.vahvistus_paiva 
						and c2.id != c1.id
						and c2.tutkintonimike_koodiarvo = c1.tutkintonimike_koodiarvo
						and c2.rnk_paiva = 1
					) or
					--aiemmin sama osaamisala ja sama tutkintonimike mutta vähemmän tutkintonimikkeitä
					exists (
						select 1 
						from #cte as c2 
						where c2.avain = c1.avain
						and c2.vahvistus_paiva <= c1.vahvistus_paiva 
						and c2.id != c1.id
						and c2.tutkintonimike_koodiarvo = c1.tutkintonimike_koodiarvo
						and c2.osaamisala_koodiarvo = c1.osaamisala_koodiarvo
						and c2.cnt_tutknimike < c1.cnt_tutknimike
					) 
				)
				--ei myöhemmin sama osaamisala ja sama tutkintonimike ja enemmän tutkintonimikkeitä
				and not exists (
					select 1 
					from #cte as c2 
					where c2.avain = c1.avain
					and c2.vahvistus_paiva >= c1.vahvistus_paiva 
					and c2.id != c1.id
					and c2.tutkintonimike_koodiarvo = c1.tutkintonimike_koodiarvo
					and c2.osaamisala_koodiarvo = c1.osaamisala_koodiarvo
					and c2.cnt_tutknimike > c1.cnt_tutknimike
				) 
				then 0

			--Toinen tyhjä ja toinen epätyhjä
			when 
				(
					c1.osaamisala_koodiarvo is null and c1.tutkintonimike_koodiarvo is not null 
					--ei aiempaa samaa tutkintonimikettä
					and not exists (
						select 1 
						from #cte as c2 
						where c2.avain = c1.avain
						and c2.vahvistus_paiva <= c1.vahvistus_paiva 
						and c2.id != c1.id
						and c2.tutkintonimike_koodiarvo = c1.tutkintonimike_koodiarvo
						and (c2.cnt_tutknimike > c1.cnt_tutknimike or (c2.cnt_tutknimike = c1.cnt_tutknimike and c2.rnk_paiva = 1))
					) 
					--ei myöhempää samaa tutkintonimikettä ja (enemmän tutkintonimikkeitä tai osaamisala epätyhjä)
					and not exists (
						select 1 
						from #cte as c2 
						where c2.avain = c1.avain
						and c2.vahvistus_paiva > c1.vahvistus_paiva 
						and c2.id != c1.id
						and c2.tutkintonimike_koodiarvo = c1.tutkintonimike_koodiarvo
						and ((c2.cnt_tutknimike = c1.cnt_tutknimike and c2.osaamisala_koodiarvo is not null) or c2.cnt_tutknimike > c1.cnt_tutknimike)
					) 
				) 
				or
				(
					c1.tutkintonimike_koodiarvo is null and c1.osaamisala_koodiarvo is not null 
					--ei aiempaa samaa osaamisala
					and not exists (
						select 1 
						from #cte as c2 
						where c2.avain = c1.avain
						and c2.vahvistus_paiva <= c1.vahvistus_paiva 
						and c2.id != c1.id
						and c2.osaamisala_koodiarvo = c1.osaamisala_koodiarvo
						and c2.rnk_paiva = 1
					) 
					--ei myöhempää samaa osaamisalaa ja epätyhjää tutkintonimikettä
					and not exists (
						select 1 
						from #cte as c2 
						where c2.avain = c1.avain
						and c2.id != c1.id
						and c2.osaamisala_koodiarvo = c1.osaamisala_koodiarvo
						and c2.tutkintonimike_koodiarvo is not null
					) 
				) 
				then 0

			--Molemmat tyhjiä
			when 
				c1.osaamisala_koodiarvo is null and c1.tutkintonimike_koodiarvo is null 
				--ei aiempaa suoritusta tai samalta päivältä korkeampaa prioriteettia
				and not exists (
					select 1 
					from #cte as c2 
					where c2.avain = c1.avain
					and (c2.vahvistus_paiva < c1.vahvistus_paiva or (c2.vahvistus_paiva = c1.vahvistus_paiva and c2.rnk_paiva < c1.rnk_paiva))
					and c2.id != c1.id
				)
				--ei sellaista aiempaa tai myöhempää suoritusta jossa oa tai tn epätyhjä
				and not exists (
					select 1 
					from #cte as c2 
					where c2.avain = c1.avain
					and c2.id != c1.id
					and (c2.osaamisala_koodiarvo is not null or c2.tutkintonimike_koodiarvo is not null)
				) 
				then 0
		
			else 1

		end
INTO #dupl
FROM #cte as c1


/* 
--Tietty oppija
SELECT d.id,d.master_oid,d.opiskeluoikeus_oid,c.paatason_suoritus_id,d.vuosi,d.koulutustoimija_oid,d.vahvistus_paiva,d.tutkinto_koodi,c.osaamisala_koodiarvo,c.tutkintonimike_koodiarvo,d.dupl 
FROM #dupl d
JOIN #cte c on c.id = d.id and c.rnk_paiva=d.rnk_paiva
WHERE 1=1
and d.master_oid = '1.2.246.562.24.10480571181'
ORDER BY vuosi desc,master_oid,koulutustoimija_oid,vahvistus_paiva,tutkinto_koodi,d.rnk_paiva

--Sellaiset, joilla kaikki suoritukset menee duplikaateiksi
SELECT d.*,c.osaamisala_koodiarvo,c.tutkintonimike_koodiarvo FROM (
	SELECT *,min_dupl=min(dupl) over (partition by master_oid,vuosi,koulutustoimija_oid,tutkinto_koodi) FROM #dupl
) d
JOIN #cte c on c.id = d.id and c.rnk_paiva=d.rnk_paiva
WHERE min_dupl=1
ORDER BY master_oid

--Id:t jotka saa sekä arvon dupl=0 että dupl=1
SELECT id FROM #dupl GROUP BY id HAVING count(distinct dupl)>1

--Koko setti
SELECT * FROM #dupl ORDER BY vuosi desc,id
*/

UPDATE vt
SET vt.duplikaatti = 1
FROM dbo.tutkinnot_ja_tutkinnonosat_valitaulu vt
LEFT JOIN #dupl d on d.id = vt.id
WHERE d.dupl = 1


DROP TABLE #cte;
DROP TABLE #dupl;

GO
