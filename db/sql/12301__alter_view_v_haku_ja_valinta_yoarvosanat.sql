USE [ANTERO]
GO

/****** Object:  View [dw].[v_haku_ja_valinta_yoarvosanat_visualisointi]    Script Date: 13.10.2026 16.17.27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER    VIEW [dw].[v_haku_ja_valinta_yoarvosanat_visualisointi] AS


SELECT DISTINCT 
	 [Koulutuksen alkamisvuosi] = f.koulutuksen_alkamisvuosi
	,[Koulutuksen alkamiskausi] = d2.selite_fi
	,[Aineryhmä] = d47.aineryhma_selite_fi
	,[Aine] = d47.aine_selite_fi
	,[Aineen laajuus] = d47.laajuus_fi
	,[Aine + laajuus] = d47.aine_selite_fi + CASE WHEN d47.laajuus_fi is not null THEN CONCAT(', ', d47.laajuus_fi) ELSE '' END
	,[Arvosana, kirjain] = f2.arvosana_kirjain
	,[Arvosana, numero] = f2.arvosana_numero
	,[Arvosana, numero (0-7)] = CASE WHEN f2.arvosana_numero = '5' THEN '2'
								WHEN f2.arvosana_numero = '6' THEN '3'
								WHEN f2.arvosana_numero = '7' THEN '4'
								WHEN f2.arvosana_numero = '8' THEN '5'
								WHEN f2.arvosana_numero = '9' THEN '6'
								WHEN f2.arvosana_numero = '10' THEN '7'
								ELSE '0' END 
	,[Kirjoitettu matematiikka] = CASE WHEN d48.id is null THEN 'Ei matematiikkaa' ELSE concat(d48.aine_selite_fi,', ',d48.laajuus_fi) END
	,[Kirjoitettujen reaaliaineiden lkm] = reaali_lkm
	,[Kirjoitettujen kielten lkm] = kielet_lkm
	,[Arvosanojen lkm L] = l_lkm
	,[Arvosanojen lkm E/L] = el_lkm
	,[Arvosanojen lkm M/E/L] = mel_lkm
	,[Hakutoive] = f.hakutoive
	,[Hakutapa] = case d25.hakutapa_fi when 'Jatkuva haku' then 'Erillishaku' else d25.hakutapa_fi end
	,[Korkeakoulu] = d16b.organisaatio_fi
	,[Sektori] = case when d10.selite_fi like 'Ammatillinen opettajankoulutus%' then 'Ammattikorkeakoulukoulutus' else d20.koulutussektori_fi end --coalesce(case when d10.hakukohde like 'Ammatillinen opettajankoulutus%' or d10.hakukohde in ('Ammatillinen erityisopettajankoulutus','Ammatillinen opinto-ohjaajankoulutus') then 'Ammattikorkeakoulutus' else f.sektori_kk end, 'Tuntematon')
	,[OKM ohjauksen ala (hakukohde)] = d20.okmohjauksenala_fi
	,[Henkilö OID] = CAST(HASHBYTES('SHA2_256', vs.salt + f.master_oid) as varchar)
	,[valittu] = f.valittu
	,[vastaanottanut paikan] = case when f.loadtime>=d1.vastaanottaneet then f.vastaanottanut_paikan else 0 end
	,[Valintatapajonon tyyppi] = coalesce(d51.selite_fi, 'Tieto puuttuu')
	,[Valittu ensisijaiseen hakukohteeseen] = CASE WHEN f.valittu_ensisijaiseen_kohteeseen = 1 THEN 'Kyllä' ELSE 'Ei' END
	,[Valittu ensisijaiselle koulutusalalle] = CASE WHEN f.valittu_ensisijaisen_kohteen_koulutusalalle = 1 THEN 'Kyllä' WHEN valittu_ensisijaisen_kohteen_koulutusalalle = 0 THEN 'Ei' ELSE 'Tieto puuttuu' END
	,[Arvosanojen L lkm] = CASE WHEN l_lkm < 3 THEN cast(l_lkm as varchar) ELSE '3 tai enemmän' END
	,[Arvosanojen E/L lkm] = CASE WHEN el_lkm < 3 THEN cast(el_lkm as varchar) ELSE '3 tai enemmän' END
	,[Arvosanojen M/E/L lkm] = CASE WHEN mel_lkm < 3 THEN cast(mel_lkm as varchar) ELSE '3 tai enemmän' END
FROM ANTERO.dw.f_haku_ja_valinta_hakeneet_korkea_aste f
INNER JOIN ANTERO.sa.sa_haku_ja_valinta_vuosikello_korkea_aste d1 on d1.id = f.sa_haku_ja_valinta_vuosikello_korkea_aste_id
INNER JOIN ANTERO.dw.f_haku_ja_valinta_yoarvosanat f2 ON f2.master_oid = f.master_oid
LEFT JOIN ANTERO.dw.d_haku d25 ON d25.id = f.d_haku_id
LEFT JOIN ANTERO.dw.d_kausi d2 ON d2.id = f.d_kausi_koulutuksen_alkamiskausi_id
LEFT JOIN ANTERO.dw.d_hakukohde d10 ON d10.id = f.d_hakukohde_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d16b ON d16b.id = f.d_organisaatioluokitus_oppilaitos_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d20 ON d20.id = f.d_koulutusluokitus_id
LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d44 ON d44.id=f.d_tutkinnon_aloitussykli_kk_id
LEFT JOIN ANTERO.dw.d_koskiyokokeet d47 ON d47.id = f2.d_koskiyokokeet_id
LEFT JOIN ANTERO.dw.d_koskiyokokeet d48 ON d48.id = f2.d_koskiyokokeet_matematiikka_id
LEFT JOIN ANTERO.dw.d_valintatapajonon_tyyppi d51 on d51.id = f.d_valintatapajonon_tyyppi_id
LEFT JOIN dbo.view_salt vs on vs.[view] = CONCAT('v_haku_ja_valinta_yoarvosanat_visualisointi', '_', f.koulutuksen_alkamisvuosi)
WHERE 
d1.visualisoinnit <= cast(getdate() as date) and 
f.koulutuksen_alkamisvuosi > 2015
AND f2.valmistumisvuosi >= 2010 AND 
d44.selite_fi = 'I sykli' and case when d10.selite_fi like 'Ammatillinen opettajankoulutus%' then 'Ammattikorkeakoulukoulutus' else d20.koulutussektori_fi end != 'Tieto puuttuu'