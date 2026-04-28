USE [ANTERO]
GO

/****** Object:  View [dw].[v_haku_ja_valinta_yoarvosanat]    Script Date: 27.4.2026 14.50.32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER   VIEW [dw].[v_haku_ja_valinta_yoarvosanat] AS


SELECT DISTINCT 
	 [Koulutuksen alkamisvuosi] = f.koulutuksen_alkamisvuosi
	,[Koulutuksen alkamiskausi] = d2.selite_fi

	,[Sukupuoli] = d7.sukupuoli_fi
	,[Ensikertaisena kohdeltava hakija] = CASE f.ensikertalainen WHEN 0 THEN 'Ei ensikertainen hakija' WHEN 1 THEN 'Ensikertainen hakija' ELSE 'Tieto puuttuu' END
	--YO-arvosanat
	,[Valmistumisvuosi] = valmistumisvuosi
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
	--,[Kirjoitettu reaaliaine] = reaali
	,[Kirjoitettu matematiikka] = CASE WHEN d48.id is null THEN 'Ei matematiikkaa' ELSE concat(d48.aine_selite_fi,', ',d48.laajuus_fi) END
	--,[Kirjoitettu kieli] = CASE WHEN d47.aineryhma_selite_fi = 'KIELI' then d47.aine_selite_fi ELSE
	,[Kirjoitettujen reaaliaineiden lkm] = reaali_lkm
	,[Kirjoitettujen kielten lkm] = kielet_lkm
	,[Arvosanojen lkm L] = l_lkm
	,[Arvosanojen lkm E/L] = el_lkm
	,[Arvosanojen lkm M/E/L] = mel_lkm
	,[Arvosanojen keskiarvo] = arvosana_keskiarvo

	,[Hakutoive] = f.hakutoive
	,[Haku AMK/YO] = d46.selite_fi
	,[Hakukohde] = d10.selite_fi
	,[Hakutapa] = case d25.hakutapa_fi when 'Jatkuva haku' then 'Erillishaku' else d25.hakutapa_fi end
	,[Hakutyyppi] = d25.hakutyyppi_fi
	,[Korkeakoulu] = d16b.organisaatio_fi
	,[Hakukohteen maakunta] = d19.maakunta_fi
	,[Hakukohteen kunta] = d19.kunta_fi
	  
	,[Sektori] = case when d10.selite_fi like 'Ammatillinen opettajankoulutus%' then 'Ammattikorkeakoulukoulutus' else d20.koulutussektori_fi end --coalesce(case when d10.hakukohde like 'Ammatillinen opettajankoulutus%' or d10.hakukohde in ('Ammatillinen erityisopettajankoulutus','Ammatillinen opinto-ohjaajankoulutus') then 'Ammattikorkeakoulutus' else f.sektori_kk end, 'Tuntematon')
	,[Koulutusaste, taso 1 (hakukohde)] = d20.koulutusastetaso1_fi
	,[Koulutusaste, taso 2 (hakukohde)] = d20.koulutusastetaso2_fi
	,[Koulutusala, taso 1 (hakukohde)] = d20.koulutusalataso1_fi
	,[Koulutusala, taso 2 (hakukohde)] = d20.koulutusalataso2_fi
	,[Koulutusala, taso 3 (hakukohde)] = d20.koulutusalataso3_fi
	,[OKM ohjauksen ala (hakukohde)] = d20.okmohjauksenala_fi
	,[Pääasiallinen tutkinto (hakukohde)] = d20.koulutusluokitus_fi
	
	,[Koulutuksen kieli] = d27.selite_fi
	,[Tutkinnon taso (hakukohde)] = d45.selite_fi
	,[Tutkinnon aloitussykli (hakukohde)] = d44.selite_fi 

	,[Henkilö OID] = f.master_oid
	,[Henkilö OID_Koulutuksen alkamisvuosi] = concat(f.master_oid, '_', cast(f.koulutuksen_alkamisvuosi as varchar))

	,[valittu] = f.valittu
	,[vastaanottanut paikan] = f.vastaanottanut_paikan
	,[Valintatapajonon tyyppi] = coalesce(d51.selite_fi, 'Tieto puuttuu')

	,[Valittu ensisijaiseen hakukohteeseen] = CASE WHEN f.valittu_ensisijaiseen_kohteeseen = 1 THEN 'Kyllä' ELSE 'Ei' END
	,[Valittu ensisijaiselle koulutusalalle] = CASE WHEN f.valittu_ensisijaisen_kohteen_koulutusalalle = 1 THEN 'Kyllä' WHEN valittu_ensisijaisen_kohteen_koulutusalalle = 0 THEN 'Ei' ELSE 'Tieto puuttuu' END
	,[Arvosanojen L lkm] = CASE WHEN l_lkm < 3 THEN cast(l_lkm as varchar) ELSE '3 tai enemmän' END
	,[Arvosanojen E/L lkm] = CASE WHEN el_lkm < 3 THEN cast(el_lkm as varchar) ELSE '3 tai enemmän' END
	,[Arvosanojen M/E/L lkm] = CASE WHEN mel_lkm < 3 THEN cast(mel_lkm as varchar) ELSE '3 tai enemmän' END

	--Järjestys-kentät
	,[Jarjestys Sukupuoli] = d7.jarjestys_sukupuoli_koodi
	,[Jarjestys Ensikertainen hakija] = coalesce(f.ensikertalainen,2)
	,[Jarjestys Kirjoitettu aine] = NULL
	,[Jarjestys Kirjoitettu matikka] = CASE WHEN d48.koodi = 'M' THEN 1 WHEN d48.koodi = 'N' THEN 2 ELSE 3 END

	,[Jarjestys Haku AMK/YO] = d46.jarjestys_koodi
	,[Jarjestys Hakutoive] = f.hakutoive
	,[Jarjestys Hakutapa] = case when d25.hakutapa_fi='Yhteishaku' then 1 when d25.hakutapa_fi in ('Jatkuva haku','Erillishaku') then 2 else 99 end
	,[Jarjestys Hakutyyppi] = d25.jarjestys_hakutyyppi
	,[Jarjestys Hakukohteen maakunta] = d19.jarjestys_maakunta_koodi

	,[Jarjestys Sektori] = d20.jarjestys_koulutussektori_koodi
	,[Jarjestys Koulutusaste, taso 1] = d20.jarjestys_koulutusastetaso1_koodi
	,[Jarjestys Koulutusaste, taso 2] = d20.jarjestys_koulutusastetaso2_koodi
	,[Jarjestys Koulutusala, taso 1] = d20.jarjestys_koulutusalataso1_koodi
	,[Jarjestys Koulutusala, taso 2] = d20.jarjestys_koulutusalataso2_koodi
	,[Jarjestys Koulutusala, taso 3] = d20.jarjestys_koulutusalataso3_koodi
	,[Jarjestys OKM ohjauksen ala] = d20.jarjestys_okmohjauksenala_koodi
	,[Jarjestys Koulutuksen kieli] = d27.jarjestys
	,[Jarjestys Tutkinnon taso (hakukohde)] = d45.jarjestys_koodi
	,[Jarjestys Tutkinnon aloitussykli (hakukohde)] = d44.jarjestys_koodi

	--Koodimuuttujat
	,[Koodit Aine] = d47.koodi
	,[Koodit Aineen laajuus] = NULL
	,[Koodit Kirjoitettu matematiikka] = d48.koodi
	,[Koodit Pääasiallinen koulutusnimike] = d20.koulutusluokitus_koodi

FROM ANTERO.dw.f_haku_ja_valinta_hakeneet_korkea_aste f
INNER JOIN ANTERO.sa.sa_haku_ja_valinta_vuosikello_korkea_aste d1 on d1.id = f.sa_haku_ja_valinta_vuosikello_korkea_aste_id --on ((d1.haku_oid=d25.haku_oid and d1.haku_oid is not null) OR (d1.koulutuksen_alkamiskausi=cast(f.koulutuksen_alkamisvuosi as varchar)+cast(d2.jarjestys as varchar) and d25.hakutapa_koodi <> '01' and d1.haku_oid is null)) and f.loadtime >= d1.hakijat
INNER JOIN ANTERO.dw.f_haku_ja_valinta_yoarvosanat f2 ON f2.master_oid = f.master_oid
LEFT JOIN ANTERO.dw.d_haku d25 ON d25.id = f.d_haku_id
LEFT JOIN ANTERO.dw.d_kausi d2 ON d2.id = f.d_kausi_koulutuksen_alkamiskausi_id
LEFT JOIN ANTERO.dw.d_alueluokitus d6 ON d6.id = f.d_alueluokitus_kotikunta_id
LEFT JOIN ANTERO.dw.d_sukupuoli d7 ON d7.id = f.d_sukupuoli_id
LEFT JOIN ANTERO.dw.d_hakukohde d10 ON d10.id = f.d_hakukohde_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d16b ON d16b.id = f.d_organisaatioluokitus_oppilaitos_id
LEFT JOIN ANTERO.dw.d_alueluokitus d19 ON d19.id = f.d_alueluokitus_hakukohde_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d20 ON d20.id = f.d_koulutusluokitus_id
LEFT JOIN ANTERO.dw.d_oppilaitoksenopetuskieli d27 ON d27.id=f.d_oppilaitoksenopetuskieli_koulutuksen_kieli_id
LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d44 ON d44.id=f.d_tutkinnon_aloitussykli_kk_id
LEFT JOIN ANTERO.dw.d_tutkinnon_taso_kk d45 ON d45.id=f.d_tutkinnon_taso_kk_id
LEFT JOIN ANTERO.dw.d_haku_amk_yo d46 ON d46.id=f.d_haku_amk_yo_id
LEFT JOIN ANTERO.dw.d_koskiyokokeet d47 ON d47.id = f2.d_koskiyokokeet_id
LEFT JOIN ANTERO.dw.d_koskiyokokeet d48 ON d48.id = f2.d_koskiyokokeet_matematiikka_id
LEFT JOIN ANTERO.dw.d_valintatapajonon_tyyppi d51 on d51.id = f.d_valintatapajonon_tyyppi_id
WHERE f.koulutuksen_alkamisvuosi >= 2015 AND f2.valmistumisvuosi >= 2010 AND f.loadtime >= d1.valitut