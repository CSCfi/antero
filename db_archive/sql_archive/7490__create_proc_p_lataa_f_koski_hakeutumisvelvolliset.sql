USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_hakeutumisvelvolliset_uusi]    Script Date: 28.11.2022 12:17:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







--exec [dw].[p_lataa_f_koski_hakeutumisvelvolliset]

CREATE OR ALTER PROCEDURE [dw].[p_lataa_f_koski_hakeutumisvelvolliset] AS

drop table if exists dw.f_koski_hakeutumisvelvolliset

select * into dw.f_koski_hakeutumisvelvolliset 
from
(
	select distinct

	--apu
	hv.[oppija_oid]
	,[hakenut_ensisijaisesti_1_0] = case when ht.HakutoiveNumero = 1 then 1 else 0 end
	,[hakenut_1_0] = case when ht.HenkiloOID is not null then 1 else 0 end
	,[valittu_1_0] = case when ht.ValinnanTila in ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT') then 1 else 0 end
	,[vastaanottanut_1_0] = case when ht.VastaanotonTila in ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') then 1 else 0 end
	,[ilmoittautunut_1_0] = case when ht.IlmoittautumisenTila in ('LASNA','LASNA_KOKO_LUKUVUOSI','LASNA_SYKSY') then 1 else 0 end
	/*
	,hv.koodit_koulutusnimike_hv
	,koodit_koulutusnimike_hv_opiskelutiedot = coalesce(ot.koodit_koulutusnimike_hv_opiskelutiedot, '-1')
	,koodit_koulutusnimike_hv_hakutiedot = coalesce(ht.koodit_koulutusnimike_hv_hakutiedot, '-1')
	,hv.koulutusmuoto_hv
	,koulutusmuoto_hv_opiskelutiedot = coalesce(ot.koulutusmuoto_hv_opiskelutiedot, '-1')
	,hv.suorituksen_tyyppi_hv
	,suorituksen_tyyppi_hv_opiskelutiedot = coalesce(ot.suorituksen_tyyppi_hv_opiskelutiedot, '-1')
	*/

	--aika
	,hv.Tilastovuosi
    ,hv.[Hak.velv. tarkasteluhetki]
	,[Opiskelun tarkasteluhetki] = coalesce(ot.[Opiskelun tarkasteluhetki], 'Viimeisin / Ei vielä tarkastelua tilastovuonna')
	,[Koul. alkamiskausi (hakukohde)] = case ht.koulutuksen_alkamiskausi when 'k' then 'Kevät' when 's' then 'Syksy' else 'Tieto puuttuu' end

	--hlö
    ,hv.[Sukupuoli]
    ,hv.[Ikä]
	,[Täyttänyt 18 v. (opiskelun tarkasteluhetki)] = coalesce(ot.[Täyttänyt 18 v. (opiskelun tarkasteluhetki)], 'Ei / Ei vielä tarkastelua tilastovuonna')
    ,hv.[Syntymävuosi]
    ,hv.[Äidinkieli (ryhmä)]
    ,hv.[Kansalaisuus (ryhmä)]
    ,hv.[Kotikunta]
    ,hv.[Kotimaakunta]
    ,hv.[Perusop. suoritusvuosi]
	,hv.[Perusop. suorituskausi]
	,[Perusop. suor. til.v. keväänä] = case when hv.[Perusop. suoritusvuosi] = cast(hv.Tilastovuosi as varchar) and hv.[Perusop. suorituskausi] = 'Kevät' then 'Kyllä' else 'Ei' end
    ,hv.[Perusop. suorituskunta]
    ,hv.[Perusop. suoritusmaakunta]
	
	--haku
	,[Hakutoiminta] = case when ht.HenkiloOID is not null then 'Hakenut tilastovuonna alkavaan koulutukseen' else 'Ei ole hakenut tilastovuonna alkavaan koulutukseen' end
	,[Hakutapa] = coalesce(ht.Hakutapa, 'Tieto puuttuu')
	,[Hakutyyppi] = coalesce(ht.Hakutyyppi, 'Tieto puuttuu')
	,[Hakutoivenumero] = coalesce(cast(ht.HakutoiveNumero as varchar), 'Tieto puuttuu')
	,[Hakutoiveen tila] = 
		CASE 
			WHEN ht.IlmoittautumisenTila in ('LASNA','LASNA_KOKO_LUKUVUOSI','LASNA_SYKSY') THEN 'Ilmoittautunut'
			WHEN ht.VastaanotonTila in ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') THEN 'Vastaanottanut'
			WHEN ht.ValinnanTila in ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT') THEN 'Valittu'
			WHEN ht.HenkiloOID is not null THEN 'Hakenut'
			ELSE 'Ei ole hakenut'
		END

	--koulutus
	,[Oppiv. suor. kelp. koul. (hak.velv. tarkasteluhetki)]
    ,[Oppiv. suor. kelp. koul. (opiskelun tarkasteluhetki)] = coalesce(ot.[Oppiv. suor. kelp. koul. (opiskelun tarkasteluhetki)], 'Ei')
	,[Vaativa erityinen tuki (hakukohde)] = case when ht.[ammatillinen_perustutkinto_erityisopetuksena] = 1 then 'Kyllä' else 'Ei' end
	,[Koulutustyyppi (hakukohde)] = coalesce(ht.[Koulutustyyppi (hakukohde)], 'Tieto puuttuu')
	,[Koulutustyyppi (opiskelun tarkasteluhetki)] = coalesce(ot.[Koulutustyyppi (opiskelun tarkasteluhetki)], 'Tieto puuttuu')
	,[Koulutusmuoto (hak.velv. tarkasteluhetki)]
	,[Koulutusmuoto (opiskelun tarkasteluhetki)] = coalesce(ot.[Koulutusmuoto (opiskelun tarkasteluhetki)], 'Tieto puuttuu')
	,[Suorituksen tyyppi (hak.velv. tarkasteluhetki)]
	,[Suorituksen tyyppi (opiskelun tarkasteluhetki)] = coalesce(ot.[Suorituksen tyyppi (opiskelun tarkasteluhetki)], 'Tieto puuttuu')
	
	--jarjestys
    ,hv.jarjestys_hak_velv_tarkasteluhetki
	,jarjestys_opiskelun_tarkasteluhetki = ot.jarjestys_opiskelun_tarkasteluhetki
	,jarjestys_koulutuksen_alkamiskausi = coalesce(ht.koulutuksen_alkamiskausi, 't')
	,hv.jarjestys_sukupuoli
	,hv.jarjestys_aidinkieli_ryhma
	,hv.jarjestys_kansalaisuus_ryhma
	,hv.jarjestys_kotimaakunta
    ,hv.jarjestys_perusop_suoritusmaakunta
	,hv.jarjestys_perusop_suoritusvuosi
	,jarjestys_perusop_suorituskausi = left(hv.[Perusop. suorituskausi], 1)
	,jarjestys_hakutapa = coalesce(ht.jarjestys_hakutapa, '99999')
	,jarjestys_hakutyyppi = coalesce(ht.jarjestys_hakutyyppi, '99999')																							  
	,jarjestys_hakutoiveen_tila = 
		CASE 
			WHEN ht.IlmoittautumisenTila in ('LASNA','LASNA_KOKO_LUKUVUOSI','LASNA_SYKSY') THEN 1
			WHEN ht.VastaanotonTila in ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') THEN 2
			WHEN ht.ValinnanTila in ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT') THEN 3
			WHEN ht.HenkiloOID is not null THEN 4
			ELSE 5
		END
	,jarjestys_koulutustyyppi_hakukohde = coalesce(nullif([Koulutustyyppi (hakukohde)], 'Tieto puuttuu'), 'öööö')
	,jarjestys_koulutustyyppi_opiskelun_tarkasteluhetki = coalesce(nullif([Koulutustyyppi (opiskelun tarkasteluhetki)], 'Tieto puuttuu'), 'öööö')
	,hv.jarjestys_koulutusmuoto_hak_velv_tarkasteluhetki
	,jarjestys_koulutusmuoto_opiskelun_tarkasteluhetki = coalesce(ot.jarjestys_koulutusmuoto_opiskelun_tarkasteluhetki, 9999)
	,hv.jarjestys_suorituksen_tyyppi_hak_velv_tarkasteluhetki
	,jarjestys_suorituksen_tyyppi_opiskelun_tarkasteluhetki = coalesce(ot.jarjestys_suorituksen_tyyppi_opiskelun_tarkasteluhetki, 9999)

	FROM dw._temp_koski_hakeutumisvelvolliset hv
	LEFT JOIN dw._temp_koski_hakeutumisvelvolliset_hakutiedot ht on ht.HenkiloOID = hv.oppija_oid and ht.koulutuksen_alkamisvuosi = hv.tilastovuosi
	LEFT JOIN dw._temp_koski_hakeutumisvelvolliset_opiskelutiedot ot on ot.oppija_oid = hv.oppija_oid and ot.tilastovuosi = hv.tilastovuosi

) q

GO
