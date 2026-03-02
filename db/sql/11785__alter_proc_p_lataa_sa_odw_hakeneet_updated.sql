USE [ANTERO]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_sa_odw_hakeneet_updated]    Script Date: 4.2.2026 8.36.06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [sa].[p_lataa_sa_odw_hakeneet_updated] AS

DROP TABLE IF EXISTS ANTERO.sa.temp_odw_valintatapajono
DROP TABLE IF EXISTS ANTERO.sa.temp_kouta_hakukohteet
DROP TABLE IF EXISTS ANTERO.sa.temp_kouta_kielet
DROP TABLE IF EXISTS ANTERO.sa.temp_odw_pohjakoulutukset

SELECT 
	HenkiloOID,
	HakukohdeOID,
	concat('odw_',id) as valintatapajono_oid, 
	JonoTyyppi, 
	Kokonaispisteet,
	JonoNimi,
	ValintatapaJononAlinHyvaksyttyPistemaara,
	MAX(Kokonaispisteet) OVER (PARTITION BY HakukohdeOID, JonoTyyppi) as ValintatapaJononYlinHyvaksyttyPistemaara,
	rank() OVER (PARTITION BY HenkiloOID, HakukohdeOID ORDER BY CASE WHEN Kokonaispisteet < ValintatapaJononAlinHyvaksyttyPistemaara THEN 1 ELSE 0 END, Kokonaispisteet DESC, id) as rnk
INTO ANTERO.sa.temp_odw_valintatapajono
FROM ANTERO.sa.sa_odw_valintatapajono

SELECT
	f.hakukohde_oid,
	f.koulutuksen_alkamisvuosi,
	f.koulutuksen_alkamiskausi,
	k.koulutuskoodi_arvo,
	k.opintojenLaajuusarvo_arvo as laajuus,
	f.hakukohteenNimi,
	coalesce(h.nimi, h.nimi_sv, h.nimi_en) as haun_nimi,
	h.korkeakouluHaku,
	f.hakukohdekoulutus_nro 
INTO ANTERO.sa.temp_kouta_hakukohteet
FROM (
	SELECT distinct
		oid as hakukohde_oid,
		hakuOid,
		koulutuksenAlkamisvuosi as koulutuksen_alkamisvuosi,
		substring(koulutuksenAlkamiskausiUri,charindex('_',koulutuksenAlkamiskausiUri)+1,1) as koulutuksen_alkamiskausi,
		hk.hakukohteenNimi,
		hk.opetusKielet,
		LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(pilkotut.value, '"', ''), '[',''),']',''), ', ',',')) as hakukohdekoulutus_oid,
		ROW_NUMBER() OVER(PARTITION BY oid ORDER BY LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(pilkotut.value, '"', ''), '[',''),']',''), ', ',','))) as hakukohdekoulutus_nro
	FROM [ANTERO].[sa].[koulutustarjonta_hakukohde] hk
	cross apply string_split(cast(hakukohdekoulutusoids as varchar(max)), ',') pilkotut
	cross apply string_split(cast(tarjoajaOids as varchar(max)), ',') pilkotut2
) f
LEFT JOIN ANTERO.sa.koulutustarjonta_koulutus k on k.oid = f.hakukohdekoulutus_oid
LEFT JOIN ANTERO.sa.koulutustarjonta_haku h on h.oid = f.hakuOid
UNION ALL
SELECT DISTINCT
	s2.hakukohdeOid,
	coalesce(s2.koulutuksenAlkamisvuosi, coalesce(year(s2.koulutuksenAlkamispaivamaara), s3.alkamisvuosi)) as alkamisvuosi,
		coalesce(
		substring(s2.koulutuksenAlkamiskausiKoodiUri, charindex('_', s2.koulutuksenAlkamiskausiKoodiUri)+1,1),
		coalesce(case when MONTH(CAST(LEFT(s2.koulutuksenAlkamispaivamaara, 10) as date)) < 8 then 'k' else 's' end,
		substring(s3.alkamiskausiKoodiUri, charindex('_', s3.alkamiskausiKoodiUri)+1,1))
	) as kausi,
	[koulutuksetKoodi],
	[opintojenLaajuusKoodi],
	coalesce(s2.nimi_fi,s2.nimi_sv, s2.nimi_en) as nimi,
	coalesce(s3.nimi_fi, s3.nimi_sv, s3.nimi_en) as haun_nimi,
	case k5.koodi when '12' then 1 else 0 end as korkeakouluhaku,
	ROW_NUMBER() OVER(PARTITION BY s2.hakukohdeOid ORDER BY s2.hakukohdeOid, s.koulutusOid, COALESCE(s.koulutuksetKoodi,999999)) as hakukohdekoulutus_nro
FROM ANTERO.sa.sa_kouta_hakukohteet s2 
LEFT JOIN [ANTERO].[sa].[sa_kouta_koulutus] s on s.toteutusOid = s2.toteutusOid
LEFT JOIN ANTERO.sa.sa_kouta_haku s3 on s2.hakuOid = s3.hakuOid
LEFT JOIN ANTERO.dw.d_koulutusluokitus s4 on s.koulutuksetKoodi = s4.koulutusluokitus_koodi
LEFT JOIN ANTERO.sa.sa_koodistot k5 on k5.koodi=substring(s3.kohdejoukkoKoodiUri,CHARINDEX('_',s3.kohdejoukkoKoodiUri)+1,2) and k5.koodisto='haunkohdejoukko'
WHERE coalesce(s2.koulutuksenAlkamisvuosi, coalesce(year(s2.koulutuksenAlkamispaivamaara), s3.alkamisvuosi)) is not null

SELECT
	k.oid as hakukohde_oid,
	STRING_AGG(k.kieli, '') WITHIN GROUP (ORDER BY k.kieli) as opetuksen_kieli
INTO ANTERO.sa.temp_kouta_kielet
FROM (
	SELECT DISTINCT
		oid,
		CASE
			LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(pilkotut.value, '"', ''), '[',''),']',''), ', ',','))
			WHEN 'kieli_fi' THEN 1
			WHEN 'kieli_sv' THEN 2
			WHEN 'kieli_en' THEN 4
			WHEN 'kieli_se' THEN 5
			ELSE 9
		END as kieli
	FROM [ANTERO].[sa].[koulutustarjonta_hakukohde]
	cross apply string_split(cast(opetusKielet as varchar(max)), ',') pilkotut
	UNION ALL
	SELECT distinct
		hk.hakukohdeOid as oid,
		LEFT(REPLACE(REPLACE(LTRIM(REPLACE(REPLACE(REPLACE(REPLACE(pilkotut.value, '"', ''), '[',''),']',''), ', ',',')),'oppilaitoksenopetuskieli_',''),'''',''),1) as kieli
	FROM [ANTERO].[sa].[sa_kouta_koulutus] k
	LEFT JOIN ANTERO.sa.sa_kouta_hakukohteet hk on k.toteutusOid = hk.toteutusOid
	cross apply string_split(cast(opetuskieliKoodiUrit as varchar(max)), ',') pilkotut
) k
GROUP BY k.oid

SELECT
	HakukohdeOID, 
	HakemusOid,
	STRING_AGG(PohjakoulutusvaatimusKoodi, '_') WITHIN GROUP (ORDER BY PohjakoulutusvaatimusKoodi) as pohjakoulutusvaatimus_koodi
INTO ANTERO.sa.temp_odw_pohjakoulutukset
FROM (
	SELECT DISTINCT
		HakemusOid, 
		HakukohdeOID,
		PohjakoulutusvaatimusKoodi
	FROM ANTERO.sa.sa_odw_hakeneet
) f
GROUP BY f.HakemusOid, f.HakukohdeOID 

DROP TABLE IF EXISTS [ANTERO].[sa].[sa_odw_hakeneet_updated]

SELECT DISTINCT
	 h.HakemusOID as hakemus_oid
    ,oh.master_oid
    ,h.HakuOid as haku_oid
    ,h.hakemus_luotu
    ,h.hakemus_paivitetty as hakemus_muokattu
    ,[koulutuksen_alkamisvuosi]
    ,[koulutuksen_alkamiskausi]
    ,h.HakukohdeOID as [hakukohde_oid]
    ,h.HakutoiveNumero as hakutoive
    ,h.ensikertalainen
    ,h.KotikuntaKoodi as kotikunta
    ,h.SukupuoliKoodi as sukupuoli
    ,h.AidinkieliKoodi as aidinkieli
    ,h.KansalaisuusKoodi as kansalaisuus
    ,h.Ika
    ,korkeakouluHaku as kk_haku
    ,hk.koulutuskoodi_arvo as koulutuskoodi
    ,h.hakukohteen_tutkinnon_taso_kk_sykli
    ,h.hakukohteen_tutkinnon_taso_kk
    ,h.jatkotutkintohaku
    ,h.koulutusaste
    ,h.KoulutusToimijaOID as koulutustoimija_oid
    ,MAX(h.OppilaitosOID) OVER (PARTITION BY h.HakukohdeOID) as oppilaitos_oid
    ,MAX(h.ToimipisteOID) OVER (PARTITION BY h.HakukohdeOID) as toimipiste_oid
    ,CASE
		WHEN hk.laajuus in ('','---') THEN NULL
		WHEN hk.laajuus like '180+120%' THEN 300
		WHEN hk.laajuus = '180+180' THEN 360
		WHEN hk.laajuus in ('210+120','180+150') THEN 330
		ELSE cast(hk.laajuus as int)
	END as laajuus
    ,kk.opetuksen_kieli
    ,CASE
		WHEN h.ValinnanTila not in ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT') THEN 'ev'
		WHEN v.JonoTyyppi is null AND (v.JonoNimi like 'Avoim%' OR v.JonoNimi like '%Avoin%' OR 
			 hk.haun_nimi like '%Avoi%' OR hk.haun_nimi like '%Öppna%' OR hk.haun_nimi like '%Öppen%' OR
			 hk.hakukohteenNimi like '%Avoi%' OR hk.hakukohteenNimi like '%Öppen%' OR hk.hakukohteenNimi like '%Öppna%' OR hk.hakukohteenNimi like '%Open%')
		THEN 'av'
		WHEN v.JonoTyyppi is null AND (hk.hakukohteenNimi like '%Rolling%admission%' OR hk.hakukohteenNimi like '%Jatkuva%haku%' OR
			 hk.haun_nimi like '%Rolling%admission%' OR hk.haun_nimi like '%Jatkuva%haku') 
		THEN 'jh'
		ELSE v.JonoTyyppi
	END as valintatapajonon_tyyppi
    ,v.valintatapajono_oid
    ,CASE 
		WHEN h.ValinnanTila in ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT') THEN 1
		ELSE 0
	END as valittu
    ,CASE
		WHEN h.VastaanotonTila in ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') THEN 1
		ELSE 0
	END as vastaanottanut_paikan
    ,CASE
		WHEN h.IlmoittautumisenTila in ('LASNA','LASNA_KOKO_LUKUVUOSI','LASNA_SYKSY') THEN 1
		ELSE 0
	END as ilmoittautunut
    ,v.Kokonaispisteet as pisteet
    ,v.ValintatapaJononAlinHyvaksyttyPistemaara as alinhyvaksyttypistemaara
    ,v.ValintatapaJononYlinHyvaksyttyPistemaara as ylinhyvaksyttypistemaara
    ,h.PohjakoulutusKoodi as pohjakoulutus
	,CASE 
		WHEN h.PohjakoulutusKoodi is null THEN NULL 
		ELSE h.PohjakoulutuksenSuoritusvuosi 
	END as pohjakoulutuksen_vuosi
    ,h.luokkataso
    ,h.LahtokouluOid as lahtokoulu
    ,h.Yo_Amk_YoAmk
    ,pk.pohjakoulutusvaatimus_koodi
	,h.PohjakoulutusKKLomakeKoodi
	,h.KiinnostunutOppisopimuksesta as kiinnostunut_oppisopimuksesta
	,MAX(h.ToisenAsteenKoulutuksenSuoritusvuosi) OVER (PARTITION BY h.HakemusOid, h.PohjakoulutusKKLomakeKoodi) as ToisenAsteenKoulutuksenSuoritusvuosi
    ,RANK() OVER (PARTITION BY h.HakemusOid, h.HakukohdeOid ORDER BY 
		h.HakutoiveNumero,
		CASE WHEN h.VastaanotonTila in ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') THEN 1 ELSE 0 END DESC,
		CASE WHEN h.ValinnanTila in ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT') THEN 1 ELSE 0 END DESC, 
		CASE WHEN h.IlmoittautumisenTila in ('LASNA','LASNA_KOKO_LUKUVUOSI','LASNA_SYKSY') THEN 1 ELSE 0 END DESC, 
		h.PohjakoulutusKoodi DESC,
		h.luokkataso DESC,
		h.LahtokouluOID DESC,
		h.PohjakoulutuksenSuoritusvuosi DESC,
		h.PohjakoulutusKKLomakeKoodi
	) as rnk
	,GETDATE() as loadtime
INTO [ANTERO].[sa].[sa_odw_hakeneet_updated]
FROM [ANTERO].[sa].[sa_odw_hakeneet] h
LEFT JOIN ANTERO.sa.temp_odw_valintatapajono v on h.HenkiloOID = v.HenkiloOID and h.HakukohdeOID = v.HakukohdeOID and v.rnk = 1
LEFT JOIN ANTERO.sa.temp_kouta_hakukohteet hk on h.HakukohdeOID = hk.hakukohde_oid and hk.hakukohdekoulutus_nro = 1
LEFT JOIN ANTERO.sa.temp_kouta_kielet kk on kk.hakukohde_oid = h.HakukohdeOID
LEFT JOIN ANTERO.sa.temp_odw_pohjakoulutukset pk on pk.HakemusOid = h.HakemusOid and pk.HakukohdeOID = h.HakukohdeOID
LEFT JOIN ANTERO.sa.sa_ovara_onr_henkilo oh on oh.henkilo_oid = h.HenkiloOID

DROP TABLE IF EXISTS ANTERO.sa.temp_odw_valintatapajono
DROP TABLE IF EXISTS ANTERO.sa.temp_kouta_hakukohteet
DROP TABLE IF EXISTS ANTERO.sa.temp_kouta_kielet
DROP TABLE IF EXISTS ANTERO.sa.temp_odw_pohjakoulutukset

UPDATE ANTERO.sa.sa_odw_hakeneet_updated
SET valintatapajono_oid = null
WHERE valintatapajonon_tyyppi = 'ev' and valintatapajono_oid is not null