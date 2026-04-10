USE [Koski_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE [dbo].[p_lataa_esi_ja_perus_oppilaat_aipe_lukukausittain] AS

/*
SYNOPSIS
1) perusjoukon alustus; jos Kosken alkuvaihe löytyy, generoidaan tälle myös lukutaitovaiheen rivi
2) vaiheittaiset kurssikertymät
3) lopullisten ja priorisoitujen vaihekoodien päättely
4) vain priorisoidun vaiheen mukaisen tietojoukon muodostus

Vaihekoodisto:
1.0: lukutaitovaihe 
2.0: alkuvaihe
2.5: lukutaitovaihe tai alkuvaihe (ei tiedossa)
3.0: päättövaihe
null: vaihe ei tiedossa
*/

DECLARE 
	@minPvm date = '2020-08-01' --oppilaiden tilastointi alkaa liveraportoinnissa
	,@maxPvm date = (
		select 
			pvm = max(eomonth(datefromparts(vuosi, kuukausi, 1)))
		from [dbo].[esi_ja_perus_oppilaat_ja_paattaneet_valitaulu]
	)
;

--1)

drop table if exists [dbo].[temp_esi_ja_perus_oppilaat_aipe_lukukausittain]

select distinct
	lukukausi_alku = concat(t.vuosi, '-', right('0' + case when t.kuukausi between 1 and 7 then '1' else '8' end, 2) + '-01')
	,lukukausi_loppu = concat(t.vuosi, '-', right('0' + case when t.kuukausi between 1 and 7 then '7' else '12' end, 2) + '-31')
	,opiskeluoikeus_oid
	,paatason_suoritus_id
	,vaihe_koodi = coalesce(q.lukutaito_ja_alkuvaihe_koodi, 3)

into [dbo].[temp_esi_ja_perus_oppilaat_aipe_lukukausittain]

from [dbo].[esi_ja_perus_oppilaat_ja_paattaneet_valitaulu] t
left join antero.dw.d_kalenteri d on d.paivays = datefromparts(t.vuosi, t.kuukausi, 1)
left join (
	select 1 as lukutaito_ja_alkuvaihe_koodi union
	select 2
) q on t.suorituksen_tyyppi = 'aikuistenperusopetuksenoppimaaranalkuvaihe'

where 1=1
and suorituksen_tyyppi in ('aikuistenperusopetuksenoppimaara', 'aikuistenperusopetuksenoppimaaranalkuvaihe')
and datefromparts(t.vuosi, t.kuukausi, 1) >= @minPvm
and opisk = 1
;


--2)

drop table if exists [dbo].[esi_ja_perus_oppilaat_aipe_lukukausittain]

select
	lukukausi_alku
	,t.[opiskeluoikeus_oid]
	,t.[paatason_suoritus_id]
	,vaihe_koodi = cast(vaihe_koodi as decimal(2,1))
	,vaihe_koodi_priorisoitu = cast(null as decimal(2,1))
	
	,kurssit = 
		count(
			distinct 
				case
					when vaihe_koodi = 1
						and os.suorituksen_tyyppi = 'aikuistenperusopetuksenalkuvaiheenkurssi'
						and left(os.koulutusmoduuli_koodiarvo, 1) = 'L' 
						then os.osasuoritus_id
					when vaihe_koodi = 2
						and os.suorituksen_tyyppi = 'aikuistenperusopetuksenalkuvaiheenkurssi'
						and left(os.koulutusmoduuli_koodiarvo, 1) in ('A','I') 
						then os.osasuoritus_id	
					when vaihe_koodi = 3
						and os.suorituksen_tyyppi = 'aikuistenperusopetuksenkurssi' 
						then os.osasuoritus_id
				end
		)
		
	,kurssit_alkuvaihe_tai_lukutaitovaihe = 
		count(
			distinct 
				case
					when vaihe_koodi in (1,2)
						and os.suorituksen_tyyppi = 'aikuistenperusopetuksenalkuvaiheenkurssi'
						and left(os.koulutusmoduuli_koodiarvo, 1) not in ('L','A','I') 
						then os.osasuoritus_id
				end
		)

into [dbo].[esi_ja_perus_oppilaat_aipe_lukukausittain]

from [dbo].[temp_esi_ja_perus_oppilaat_aipe_lukukausittain] t
left join sa.sa_koski_osasuoritus os on 
	os.paatason_suoritus_id = t.paatason_suoritus_id
	and os.suorituksen_tyyppi in ('aikuistenperusopetuksenalkuvaiheenkurssi', 'aikuistenperusopetuksenkurssi')
	and os.arviointi_paiva between lukukausi_alku and least(lukukausi_loppu, @maxPvm)
	and os.tunnustettu = 0

group by 
	lukukausi_alku
	,t.[opiskeluoikeus_oid]
	,t.[paatason_suoritus_id]
	,vaihe_koodi


drop table [dbo].[temp_esi_ja_perus_oppilaat_aipe_lukukausittain]
;


--3)

update t
set vaihe_koodi = 
		case 
			when t.kurssit > 0 then 1.0 * t.vaihe_koodi 
			else coalesce(1.0 * oa.vaihe_koodi_priorisoitu, case when q.kurssit_alkuvaihe_tai_lukutaitovaihe_oo > 0 then 2.5 end)
		end
	,vaihe_koodi_priorisoitu = coalesce(1.0 * oa.vaihe_koodi_priorisoitu, case when q.kurssit_alkuvaihe_tai_lukutaitovaihe_oo > 0 then 2.5 end)
	
from [dbo].[esi_ja_perus_oppilaat_aipe_lukukausittain] t
left join (
	select 
		lukukausi_alku
		,opiskeluoikeus_oid
		,vaihe_koodi
		,max_kurssit_oo = max(kurssit) over (partition by opiskeluoikeus_oid, lukukausi_alku)
		,kurssit_alkuvaihe_tai_lukutaitovaihe_oo = max(kurssit_alkuvaihe_tai_lukutaitovaihe) over (partition by opiskeluoikeus_oid, lukukausi_alku)
	from [dbo].[esi_ja_perus_oppilaat_aipe_lukukausittain] t
) q on q.lukukausi_alku = t.lukukausi_alku
	and q.opiskeluoikeus_oid = t.opiskeluoikeus_oid
	and q.vaihe_koodi = t.vaihe_koodi
outer apply (
	select 
		vaihe_koodi_priorisoitu = max(vaihe_koodi)
	from [dbo].[esi_ja_perus_oppilaat_aipe_lukukausittain]
	where 1=1
	and lukukausi_alku = q.lukukausi_alku
	and opiskeluoikeus_oid = q.opiskeluoikeus_oid
	and kurssit = q.max_kurssit_oo
	and q.max_kurssit_oo > 0
) oa
;


drop table if exists [dbo].[esi_ja_perus_oppilaat_aipe_lukukausittain_vaihe_priorisoitu]

select distinct
	vuosi = year(lukukausi_alku)
	,d.lukuvuosi
	,t.[opiskeluoikeus_oid]
	,t.[paatason_suoritus_id]
	,vaihe_koodi_priorisoitu

into [dbo].[esi_ja_perus_oppilaat_aipe_lukukausittain_vaihe_priorisoitu]

from [dbo].[esi_ja_perus_oppilaat_aipe_lukukausittain] t
left join antero.dw.d_kalenteri d on d.paivays = t.lukukausi_alku


drop table if exists [dbo].[esi_ja_perus_oppilaat_aipe_lukukausittain]
;
