USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut_uusi_unpivot] AS

/*
SYNOPSIS
- irrotetaan korotusten käsittely, jottei näiden luvattomuus/hylkääminen estä opiskelijavuosien ilmenemistä muissa kriteereissä
- generoidaan korotusten luvattomuudesta/hylkäämisestä aiheutuvat komplementtikertymät
- samalla populoidaan kr&tt mukaan painotettujen opv apusarake kuutiolaskentaa varten
*/

--irrotetaan korotukset temp-tauluun muokkauksia varten
drop table if exists dw.temp_opiskelijavuodet_painotetut_hylattavat_korotukset

select *
into dw.temp_opiskelijavuodet_painotetut_hylattavat_korotukset 
from dw.f_amos_opiskelijavuodet_painotetut_uusi
where 1=0 
or d_amos_luvaton_korotustekija_id = 3 --jätetään luvaton korotustekijä luvattomaksi
or [opiskelijavuodet_painotettu_erityistuki] > [opiskelijavuodet_painotettu_erityistuki_hyv] --muodostetaan enimmäismäärän ylittävä komplementti ja tälle hylkäämisperuste
or d_amos_luvaton_majoitus_id = 1 --muodostetaan luvattomuudesta aiheutuva luvaton komplementti
;

--muokataan alkuperäisessä taulussa muut opv-tiedot kuin luvattomat korotukset hyväksytyksi (sisäopp.majoituksessa jo huomioitu luvattoman alempi kerroin)
update dw.f_amos_opiskelijavuodet_painotetut_uusi
set d_amos_luvaton_majoitus_id = 0
where d_amos_luvaton_majoitus_id = 1

update dw.f_amos_opiskelijavuodet_painotetut_uusi
set d_amos_luvaton_korotustekija_id = 0
	,[opiskelijavuodet_painotettu_erityistuki] = 0.0
	,[opiskelijavuodet_painotettu_erityistuki_hyv] = 0.0
where d_amos_luvaton_korotustekija_id = 3
;

--nollataan temp-taulussa muut ja palautetaan alkuperäiseen tauluun luvaton korotustekijä luvattomana (ei enimmäismäärää -> ei generoitavaa komplementtia)
update dw.temp_opiskelijavuodet_painotetut_hylattavat_korotukset
set [opiskelijavuodet_painottamaton] = 0.0
	,[opiskelijavuodet_hylatty_painottamaton] = 0.0
	,[opiskelijavuodet_painotettu_lahtotaso] = 0.0
	,[opiskelijavuodet_painotettu_pt] = 0.0
	,[opiskelijavuodet_painotettu_at_eat] = 0.0
	,[opiskelijavuodet_painotettu_valma_telma] = 0.0
	,[opiskelijavuodet_painotettu_muu] = 0.0

insert dw.f_amos_opiskelijavuodet_painotetut_uusi
select *
from dw.temp_opiskelijavuodet_painotetut_hylattavat_korotukset 
where d_amos_luvaton_korotustekija_id = 3 

delete from dw.temp_opiskelijavuodet_painotetut_hylattavat_korotukset
where d_amos_luvaton_korotustekija_id = 3
;

--lasketaan temp-tauluun korotusten hylättävät komplementit ja viedään ne alkuperäiseen tauluun
update dw.temp_opiskelijavuodet_painotetut_hylattavat_korotukset
set [opiskelijavuodet_painotettu_erityistuki] = 0.0
	,[opiskelijavuodet_painotettu_erityistuki_hyv] = cast(
		[opiskelijavuodet_painotettu_erityistuki] - [opiskelijavuodet_painotettu_erityistuki_hyv] as decimal(30,20)
	)
    ,[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id] = 
		case
			when [opiskelijavuodet_painotettu_erityistuki] > [opiskelijavuodet_painotettu_erityistuki_hyv] then
				(select id from dw.d_amos_spl_opiskelijavuodet_hylkaamisperuste where koodi = '8')
			else [d_amos_spl_opiskelijavuodet_hylkaamisperuste_id]
		end
	,[opiskelijavuodet_painotettu_majoitus] = 0.0
	,[opiskelijavuodet_painotettu_majoitus_hyv] = cast(
		[opiskelijavuodet_painotettu_majoitus] - [opiskelijavuodet_painotettu_majoitus_hyv] as decimal(30,20)
	)

insert dw.f_amos_opiskelijavuodet_painotetut_uusi
select *
from dw.temp_opiskelijavuodet_painotetut_hylattavat_korotukset

drop table dw.temp_opiskelijavuodet_painotetut_hylattavat_korotukset
;

--populoidaan yhteensä-sarake kuutiolaskentaa varten
update dw.f_amos_opiskelijavuodet_painotetut_uusi
set [opiskelijavuodet_painotettu_kr_ja_tt_yhteensa] = 
	cast(
		[opiskelijavuodet_painotettu_pt]
		+ [opiskelijavuodet_painotettu_at_eat]
		+ [opiskelijavuodet_painotettu_valma_telma]
		+ [opiskelijavuodet_painotettu_muu]
		as decimal(30,20)
	)
;
	
GO
