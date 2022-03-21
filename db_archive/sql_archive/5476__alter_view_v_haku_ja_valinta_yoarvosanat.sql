USE [ANTERO]
GO

/****** Object:  View [dw].[v_haku_ja_valinta_yoarvosanat]    Script Date: 24.1.2022 18:18:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER VIEW [dw].[v_haku_ja_valinta_yoarvosanat] AS


SELECT DISTINCT 
	 [Koulutuksen alkamisvuosi] = f.koulutuksen_alkamisvuosi
	,[Koulutuksen alkamiskausi] = d2.selite_fi

	,[Sukupuoli] = d7.sukupuoli_fi
	,[Ensikertaisena kohdeltava hakija] = f.ensikertainen_hakija	
	--YO-arvosanat
	,[Valmistumisvuosi] = valmistumisvuosi
	,[Aineryhmä] = d47.aineryhma_selite_fi
	,[Aine] = d47.aine_selite_fi
	,[Aineen laajuus] = d48.selite_fi
	,[Aine + laajuus] = d47.aine_selite_fi + CASE WHEN f2.d_ytl_aine_laajuus_id != -1 THEN CONCAT(', ', d48.selite_fi) ELSE '' END
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
	,[Kirjoitettu matematiikka] = d49.aine_selite_fi
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
	,[Tutkinto (hakukohde)] = d20.koulutusluokitus_fi
	
	,[Koulutuksen kieli] = d27.kieli_fi
	,[Tutkinnon taso (hakukohde)] = d45.selite_fi
	,[Tutkinnon aloitussykli (hakukohde)] = d44.selite_fi 

	,[Henkilö OID] = f.henkilo_oid					

	,[valittu] = CASE WHEN f.valinnan_tila IN ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT') THEN 1 ELSE 0 END
	,[vastaanottanut paikan] = CASE WHEN f.vastaanoton_tila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') THEN 1 ELSE 0 END
	,[Valintatapajonon tyyppi] = 
	  Case
		when f.valinnan_tila NOT IN ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT') and f.vastaanoton_tila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT')
			then coalesce(d51.selite_fi, 'Tieto puuttuu')
		when f.valinnan_tila NOT IN ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT')
			then 'Ei valittu'
		Else coalesce(d51.selite_fi, 'Tieto puuttuu')
	  End
	,[Valittu ensisijaiseen hakukohteeseen] = CASE WHEN f.d_valittu_ensisijaiseen_kohteeseen_id = '1' THEN 'Kyllä' ELSE 'Ei' END
	,[Valittu ensisijaiselle koulutusalalle] = CASE WHEN f.d_valittu_ensisijaisen_kohteen_koulutusalalle_id = '1' THEN 'Kyllä' WHEN f.d_valittu_ensisijaisen_kohteen_koulutusalalle_id = '0' THEN 'Ei' ELSE 'Tieto puuttuu' END
	,[Arvosanojen L lkm] = CASE WHEN l_lkm < 3 THEN cast(l_lkm as varchar) ELSE '3 tai enemmän' END
	,[Arvosanojen E/L lkm] = CASE WHEN el_lkm < 3 THEN cast(el_lkm as varchar) ELSE '3 tai enemmän' END
	,[Arvosanojen M/E/L lkm] = CASE WHEN mel_lkm < 3 THEN cast(mel_lkm as varchar) ELSE '3 tai enemmän' END

	--Järjestys-kentät
	,[Jarjestys Sukupuoli] = d7.jarjestys_sukupuoli_koodi
	,[Jarjestys Ensikertainen hakija] = left(f.ensikertainen_hakija,2)
	,[Jarjestys Kirjoitettu aine] = d47.jarjestys
	,[Jarjestys Kirjoitettu matikka] = d49.jarjestys

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
	,[Jarjestys Koulutuksen kieli] = d27.kieli_koodi
	,[Jarjestys Tutkinnon taso (hakukohde)] = d45.jarjestys_koodi
	,[Jarjestys Tutkinnon aloitussykli (hakukohde)] = d44.jarjestys_koodi

	--Koodimuuttujat
	,[Koodit Aine] = d47.koodi
	,[Koodit Aineen laajuus] = d48.koodi
	,[Koodit Kirjoitettu matematiikka] = d49.koodi

FROM ANTERO.dw.f_haku_ja_valinta_hakeneet_korkea_aste f
INNER JOIN ANTERO.sa.sa_haku_ja_valinta_vuosikello_korkea_aste d1 on d1.id = f.sa_haku_ja_valinta_vuosikello_korkea_aste_id --on ((d1.haku_oid=d25.haku_oid and d1.haku_oid is not null) OR (d1.koulutuksen_alkamiskausi=cast(f.koulutuksen_alkamisvuosi as varchar)+cast(d2.jarjestys as varchar) and d25.hakutapa_koodi <> '01' and d1.haku_oid is null)) and f.loadtime >= d1.hakijat
INNER JOIN ANTERO.dw.f_haku_ja_valinta_yoarvosanat f2 ON f2.HenkiloOID = f.henkilo_oid
LEFT JOIN ANTERO.dw.d_haku d25 ON d25.id = f.d_haku_id
LEFT JOIN ANTERO.dw.d_kausi d2 ON d2.id = f.d_kausi_koulutuksen_alkamiskausi_id
LEFT JOIN ANTERO.dw.d_alueluokitus d6 ON d6.id = f.d_alueluokitus_kotipaikka_id
LEFT JOIN ANTERO.dw.d_sukupuoli d7 ON d7.id = f.d_sukupuoli_id
LEFT JOIN ANTERO.dw.d_hakukohde d10 ON d10.id = f.d_hakukohde_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d16b ON d16b.id = f.d_organisaatio_oppilaitos_id
LEFT JOIN ANTERO.dw.d_alueluokitus d19 ON d19.id = f.d_alueluokitus_hakukohde_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d20 ON d20.id = f.d_koulutusluokitus_hakukohde_id
LEFT JOIN ANTERO.dw.d_kieli d27 ON d27.id=f.d_kieli_koulutus_id
LEFT JOIN ANTERO.dw.d_hakuaika d31 ON d31.id=f.d_hakuaika_id
LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d44 ON d44.id=f.d_tutkinnon_aloitussykli_kk_id
LEFT JOIN ANTERO.dw.d_tutkinnon_taso_kk d45 ON d45.id=f.d_tutkinnon_taso_kk_id
LEFT JOIN ANTERO.dw.d_haku_amk_yo d46 ON d46.id=f.d_haku_amk_yo_id
LEFT JOIN ANTERO.dw.d_ytl_aine d47 ON d47.id = f2.d_ytl_aine_id
LEFT JOIN ANTERO.dw.d_ytl_aine_laajuus d48 ON d48.id = f2.d_ytl_aine_laajuus_id
LEFT JOIN ANTERO.dw.d_ytl_aine d49 ON d49.id = f2.d_ytl_aine_matikka_id
LEFT JOIN ANTERO.dw.f_haku_ja_valinta_korkea_aste_valintatapajonot d50 on d50.henkilo_oid = f.henkilo_oid and d50.d_hakukohde_id = f.d_hakukohde_id and d50.haku_oid=d25.haku_oid
LEFT JOIN ANTERO.dw.d_valintatapajono d51 on d51.id = d50.d_valintatapajono_id

WHERE f.koulutuksen_alkamisvuosi >= 2015 AND f2.valmistumisvuosi >= 2010
AND f.loadtime >= d1.valitut
  



GO


