USE [VipunenTK_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[p_lataa_esi_ja_perus_yksilollistaminen_perusjoukko_ja_aidinkielen_oppimaara]
	@jaadytyspvm nvarchar(8) = '' --ex.g. '02102023'
	,@viive int = 0 --vvvv-tilv
	,@linkedServerAlias nvarchar(50) = '' --empty for testing, 'DWIVIPUARCH' for real
AS

--muokkaa parametrien mukaisesti temp-proseduurin ja ajaa sen yhteiseen kohdetauluun (tämä emo-proc mukana versionhallinnassa)

DECLARE @linkedServerPrefix nvarchar(50) = case when @linkedServerAlias = '' then '' else @linkedServerAlias + '.' end
DECLARE @pvmPaate nvarchar(9) = case when @jaadytyspvm = '' then '' else '_' + @jaadytyspvm end

DECLARE @tilv nvarchar(4) = case when @jaadytyspvm = '' then year(getdate()) - @viive else right(@jaadytyspvm,4) - @viive end
DECLARE @lvAlku nvarchar(10) = cast(@tilv-1 as varchar) + '-08-01'
DECLARE @lvLoppu nvarchar(10) = cast(@tilv as varchar) + '-07-31'

DECLARE @taulu nvarchar(100) = 'dbo.esi_ja_perus_yksilollistaminen_perusjoukko_ja_aidinkielen_oppimaara'
DECLARE @proc nvarchar(100) = 'dbo.p_lataa_esi_ja_perus_yksilollistaminen_perusjoukko_ja_aidinkielen_oppimaara_temp'

DECLARE @createProc nvarchar(max) = '
create or alter proc ' + @proc + ' as 

delete from ' + @taulu + ' where tilastovuosi = ' + @tilv + ' 

insert ' + @taulu + ' 

select 
	tilastovuosi = ' + @tilv + '
		
	,ps.opiskeluoikeus_oid
	,paatason_suoritus_id = concat(''' + @tilv + ''', ''_'', ps.paatason_suoritus_id)
	,[vuosiluokka] = case when ps.suorituksen_tyyppi = ''perusopetuksenoppimaara'' then ''9'' else ps.koulutusmoduuli_koodiarvo end
		
	,oo.oppilaitos_oid
		
	,h.master_oid
	,h.aidinkieli
	,h.sukupuoli 
	,kansalaisuus = left(h.kansalaisuus, 3)
	,ika = ' + @tilv + ' - year(h.syntymaaika)

	,erityisen_tuen_paatos = max(case when aj.erityinen_tuki = 1 or aj.hojks = 1 then 1 else 0 end)
	,erityinen_tuki_johdettu = --TK-dimensio 
		max(
			case 
				when aj.vaikeasti_vammainen = 1 then ''ertu_v'' 
				when aj.vammainen = 1 or aj.vammainen_ja_avustaja = 1 then ''ertu_m'' 
				when aj.erityinen_tuki = 1 or aj.hojks = 1 then ''ertu_muu'' 
				else ''ertu_eiei'' 
			end
		)
	,pidennetty_oppivelvollisuus = max(case when aj.pidennetty_oppivelvollisuus = 1 then 1 else 0 end)
	,opiskelee_toiminta_alueittain = max(case when et.opiskelee_toiminta_alueittain = 1 then 1 else 0 end)

	,[AI_oppimaara] = os.kieli_koodiarvo
	,[AI_oppimaara_yksilollistetty] = max(cast(os.yksilollistetty_oppimaara as int))

from ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate + '.sa.sa_koski_paatason_suoritus ps 
join ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate + '.sa.sa_koski_opiskeluoikeus oo on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid 
left join ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate + '.sa.sa_koski_henkilo_master h on h.master_oid = oo.master_oid 
left join ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate + '.sa.sa_koski_opiskeluoikeus_aikajakso aj on aj.opiskeluoikeus_oid = ps.opiskeluoikeus_oid and aj.alku <= ''' + @lvLoppu + ''' and aj.loppu >= ''' + @lvAlku + ''' 
left join ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate + '.sa.sa_koski_opiskeluoikeus_aikajakso_erityisen_tuen_paatos et on et.opiskeluoikeus_oid = ps.opiskeluoikeus_oid and et.alku <= ''' + @lvLoppu + ''' and et.loppu >= ''' + @lvAlku + ''' 
left join ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate + '.sa.sa_koski_osasuoritus os 
	on os.paatason_suoritus_id = ps.paatason_suoritus_id 
	and os.koulutusmoduuli_koodiarvo = ''AI'' 
	and os.koulutusmoduuli_koodisto = ''koskioppiaineetyleissivistava'' 
	and os.suorituksen_tyyppi = ''perusopetuksenoppiaine'' 
	and os.arviointi_hyvaksytty = 1 

where ps.vahvistus_paiva between datefromparts(' + @tilv + ', 1, 1) and ''' + @lvLoppu + ''' 
and (
	(ps.suorituksen_tyyppi = ''perusopetuksenvuosiluokka'' and ps.koulutusmoduuli_koodiarvo != ''9'') 
	or ps.suorituksen_tyyppi = ''perusopetuksenoppimaara''
)

group by ps.opiskeluoikeus_oid 
	,ps.paatason_suoritus_id 
	,ps.suorituksen_tyyppi 
	,ps.koulutusmoduuli_koodiarvo 
	,oo.oppilaitos_oid 
	,h.master_oid 
	,h.aidinkieli 
	,h.sukupuoli 
	,left(h.kansalaisuus, 3) 
	,year(h.syntymaaika) 
	,os.kieli_koodiarvo
'

EXEC (@createProc);
EXEC sp_executesql @proc;

GO
