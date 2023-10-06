USE [VipunenTK_SA]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_esi_ja_perus_yksilollistaminen]	Script Date: 7.8.2023 16:01:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE [dbo].[p_lataa_esi_ja_perus_yksilollistaminen_oppiainesuoritukset]
	@jaadytyspvm nvarchar(8) = '' --ex.g. '02102023'
	,@viive int = 0 --vvvv-tilv
	,@linkedServerAlias nvarchar(50) = '' --empty for testing, 'DWIVIPUARCH' for real
AS

--muokkaa parametrien mukaisesti temp-proseduurin ja ajaa sen

DECLARE @linkedServerPrefix nvarchar(50) = case when @linkedServerAlias = '' then '' else @linkedServerAlias + '.' end
DECLARE @pvmPaate nvarchar(9) = case when @jaadytyspvm = '' then '' else '_' + @jaadytyspvm end

DECLARE @tilv nvarchar(4) = case when @jaadytyspvm = '' then year(getdate()) - @viive else right(@jaadytyspvm,4) - @viive end
DECLARE @lvAlku nvarchar(10) = cast(@tilv-1 as varchar) + '-08-01'
DECLARE @lvLoppu nvarchar(10) = cast(@tilv as varchar) + '-07-31'

DECLARE @taulu nvarchar(100) = 'dbo.esi_ja_perus_yksilollistaminen_oppiainesuoritukset'
DECLARE @proc nvarchar(100) = 'dbo.p_lataa_esi_ja_perus_yksilollistaminen_oppiainesuoritukset_temp'

DECLARE @createProc nvarchar(max) = '
create or alter proc ' + @proc + ' as 

delete from ' + @taulu + ' where tilastovuosi = ' + @tilv + ' 

insert ' + @taulu + ' 
	
select 
	[tilastovuosi] = year(ps.vahvistus_paiva)
	,ps.opiskeluoikeus_oid
	,paatason_suoritus_id = concat(''' + @tilv + ''', ''_'', ps.paatason_suoritus_id)
	,ps.vahvistus_paiva
	,[vuosiluokka] = case when ps.suorituksen_tyyppi = ''perusopetuksenoppimaara'' then ''9'' else ps.koulutusmoduuli_koodiarvo end
	,[oppiaineita_yksilollistetty_lkm] = count(distinct case when os.yksilollistetty_oppimaara = 1 then os.koulutusmoduuli_koodiarvo end)
	,[ei_oppiainesuorituksia] = max(case when os.koulutusmoduuli_koodiarvo is null then 1 else 0 end)
	,[MA_yksilollistetty] = max(case when os.koulutusmoduuli_koodiarvo = ''MA'' then 0 + os.yksilollistetty_oppimaara end)
	,[AI_yksilollistetty] = max(case when os.koulutusmoduuli_koodiarvo = ''AI'' then 0 + os.yksilollistetty_oppimaara end)

from ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate + '.sa.sa_koski_paatason_suoritus ps 
left join ' + @linkedServerPrefix + 'Koski_SA' + @pvmPaate + '.sa.sa_koski_osasuoritus os 
	on os.paatason_suoritus_id = ps.paatason_suoritus_id 
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
	,ps.vahvistus_paiva
'

EXEC (@createProc);
EXEC sp_executesql @proc;

GO
