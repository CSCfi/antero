USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_korkeakoulutus_hakeneet_ja_paikan_vastaanottaneet_esilataus]    Script Date: 9.1.2026 8.31.16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER   PROCEDURE [dw].[p_lataa_api_korkeakoulutus_hakeneet_ja_paikan_vastaanottaneet_esilataus] as

DROP TABLE IF EXISTS ANTERO.sa.temp_haku_ja_valinta_api 
DROP TABLE IF EXISTS ANTERO.sa.temp_haku_ja_valinta_api2 

SELECT DISTINCT
	[koulutuksen_alkamisvuosi] = f.koulutuksen_alkamisvuosi
	,[koulutuksen_alkamiskausi] = d2.selite_fi

	,[hakukohde] = d10.selite_fi
	,[hakutapa] = d25.hakutapa2_fi
	,[hakutyyppi] = d25.hakutyyppi_fi
	,[valintatapajonon_tyyppi] = 
		Case
			when f.valinnan_tila NOT IN ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT') and f.vastaanoton_tila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT')
				then coalesce(d48.selite_fi, 'Tieto puuttuu')
			when f.valinnan_tila NOT IN ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT')
				then 'Ei valittu'
			Else coalesce(d48.selite_fi, 'Tieto puuttuu')
		End
	
	,[koulutusaste_taso_1] = d20.koulutusastetaso1_fi
	,[koulutusaste_taso_2] = d20.koulutusastetaso2_fi
	,[koulutusala_taso_1] = d20.koulutusalataso1_fi
	,[koulutusala_taso_2] = d20.koulutusalataso2_fi
	,[koulutusala_taso_3] = d20.koulutusalataso3_fi
	,[okm_ohjauksen_ala] = d20.okmohjauksenala_fi
	,[koulutusala_2002] = d20.koulutusala2002_fi
	,[opintoala_2002] = d20.opintoala2002_fi
	,[paaasiallinen_tutkinto_hakukohde] = d20.koulutusluokitus_fi
	,[koulutuksen_kieli] = d27.kieli_fi
	,[maakunta_hakukohde] = d19.maakunta_fi
	,[kunta_hakukohde] = d19.kunta_fi

	,[sektori] = d20.koulutussektori_fi 
	,[tutkinnon_aloitussykli] = d44.selite_fi  
	 
	,[korkeakoulu] = d16b.organisaatio_fi
	,[toimipiste] = d16c.organisaatio_fi

	,[koodit_paaasiallinen_tutkinto_hakukohde] = d20.koulutusluokitus_koodi
	,[koodit_korkeakoulu] = d16b.organisaatio_nykyinen_koodi
	,[koodit_kunta_hakukohde] = d19.kunta_koodi
	,[koodit_hakukohde] = d10.oid

	,CASE WHEN f.valinnan_tila NOT IN ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT') THEN NULL ELSE d47.kokonaispisteet end kokonaispisteet
	,f.henkilo_oid
	,case when hakutoive='1' then 1 else 0 end as ensisijainen_hakija						
	,case when f.loadtime>=d1.valitut and f.valinnan_tila IN ('HYVAKSYTTY','VARASIJALTA_HYVAKSYTTY','PERUNUT') then 1 else 0 end as valittu
	,case when f.loadtime>=d1.vastaanottaneet and f.vastaanoton_tila IN ('VASTAANOTTANUT_SITOVASTI','EHDOLLISESTI_VASTAANOTTANUT') then 1 else 0 end as paikan_vastaanottanut			
	,case when f.loadtime>=d1.aloittaneet and f.ilmoittautumisen_tila in ('LASNA','LASNA_KOKO_LUKUVUOSI','LASNA_SYKSY') then 1 else 0 end as aloittanut
	,null as aloituspaikat

INTO ANTERO.sa.temp_haku_ja_valinta_api 
FROM ANTERO.dw.f_haku_ja_valinta_hakeneet_korkea_aste f
INNER JOIN ANTERO.sa.sa_haku_ja_valinta_vuosikello_korkea_aste d1 on d1.id=f.sa_haku_ja_valinta_vuosikello_korkea_aste_id
LEFT JOIN ANTERO.dw.d_kausi d2 ON d2.id = f.d_kausi_koulutuksen_alkamiskausi_id
LEFT JOIN ANTERO.dw.d_hakukohde d10 ON d10.id = f.d_hakukohde_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d16b ON d16b.id = f.d_organisaatio_oppilaitos_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d16c ON d16c.id = f.d_organisaatio_toimipiste_id
LEFT JOIN ANTERO.dw.d_alueluokitus d19 ON d19.id = f.d_alueluokitus_hakukohde_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d20 ON d20.id = f.d_koulutusluokitus_hakukohde_id
LEFT JOIN ANTERO.dw.d_pohjakoulutus d22 ON d22.id = f.d_pohjakoulutuskk_id
LEFT JOIN ANTERO.dw.d_haku d25 ON d25.id = f.d_haku_id
LEFT JOIN ANTERO.dw.d_kieli d27 ON d27.id=f.d_kieli_koulutus_id
LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d44 on d44.id=f.d_tutkinnon_aloitussykli_kk_id
LEFT JOIN ANTERO.dw.f_haku_ja_valinta_korkea_aste_valintatapajonot d47 on d47.henkilo_oid = f.henkilo_oid and d47.d_hakukohde_id = f.d_hakukohde_id and d47.haku_oid=d25.haku_oid
LEFT JOIN ANTERO.dw.d_valintatapajono d48 on d48.id = d47.d_valintatapajono_id

SELECT 
	*, 
	ROW_NUMBER() 
		OVER(
			PARTITION BY koodit_hakukohde, henkilo_oid 
			ORDER BY ensisijainen_hakija desc, valittu desc, paikan_vastaanottanut desc, aloittanut desc, kokonaispisteet desc, valintatapajonon_tyyppi
		) as rnk
INTO ANTERO.sa.temp_haku_ja_valinta_api2
FROM ANTERO.sa.temp_haku_ja_valinta_api

TRUNCATE TABLE AnteroAPI.dw.api_korkeakoulutus_hakeneet_ja_paikan_vastaanottaneet

INSERT INTO AnteroAPI.dw.api_korkeakoulutus_hakeneet_ja_paikan_vastaanottaneet 
SELECT 
	f.koulutuksen_alkamisvuosi
	,f.koulutuksen_alkamiskausi

	,f.hakukohde
	,f.hakutapa
	,f.hakutyyppi
	,f.valintatapajonon_tyyppi
	
	,f.koulutusaste_taso_1
	,f.koulutusaste_taso_2
	,f.koulutusala_taso_1
	,f.koulutusala_taso_2
	,f.koulutusala_taso_3
	,f.okm_ohjauksen_ala
	,f.koulutusala_2002
	,f.opintoala_2002
	,f.paaasiallinen_tutkinto_hakukohde
	,f.koulutuksen_kieli
	,f.maakunta_hakukohde
	,f.kunta_hakukohde

	,f.sektori
	,f.tutkinnon_aloitussykli
	 
	,f.korkeakoulu
	,f.toimipiste

	,f.koodit_paaasiallinen_tutkinto_hakukohde
	,f.koodit_korkeakoulu
	,f.koodit_kunta_hakukohde
	,f.koodit_hakukohde

	,f.aloituspaikat_lkm
	,f.kaikki_hakijat_lkm
	,f.ensisijaiset_hakijat_lkm						
	,f.valitut_lkm
	,f.paikan_vastaanottaneet_lkm			
	,f.aloittaneet_lkm
	,f.alin_hyvaksytty_pistemaara
	,f.ylin_hyvaksytty_pistemaara
FROM (
	SELECT
		 f.koulutuksen_alkamisvuosi
		,f.koulutuksen_alkamiskausi

		,f.hakukohde
		,f.hakutapa
		,f.hakutyyppi
		,f.valintatapajonon_tyyppi
	
		,f.koulutusaste_taso_1
		,f.koulutusaste_taso_2
		,f.koulutusala_taso_1
		,f.koulutusala_taso_2
		,f.koulutusala_taso_3
		,f.okm_ohjauksen_ala
		,f.koulutusala_2002
		,f.opintoala_2002
		,f.paaasiallinen_tutkinto_hakukohde
		,f.koulutuksen_kieli
		,f.maakunta_hakukohde
		,f.kunta_hakukohde

		,f.sektori
		,f.tutkinnon_aloitussykli
	 
		,f.korkeakoulu
		,f.toimipiste

		,f.koodit_paaasiallinen_tutkinto_hakukohde
		,f.koodit_korkeakoulu
		,f.koodit_kunta_hakukohde
		,f.koodit_hakukohde

		,NULL as aloituspaikat_lkm
		,COUNT(*) as kaikki_hakijat_lkm
		,SUM(ensisijainen_hakija) as ensisijaiset_hakijat_lkm						
		,SUM(valittu) as valitut_lkm
		,SUM(paikan_vastaanottanut) as paikan_vastaanottaneet_lkm			
		,SUM(aloittanut) as aloittaneet_lkm
		,MIN(f.kokonaispisteet) alin_hyvaksytty_pistemaara
		,MAX(f.kokonaispisteet) ylin_hyvaksytty_pistemaara
	
	FROM ANTERO.sa.temp_haku_ja_valinta_api2  f
	WHERE rnk = 1
	GROUP BY 
	f.koulutuksen_alkamisvuosi
	,f.koulutuksen_alkamiskausi
	,f.hakukohde
	,f.hakutapa
	,f.hakutyyppi
	,f.valintatapajonon_tyyppi
	,f.koulutusaste_taso_1
	,f.koulutusaste_taso_2
	,f.koulutusala_taso_1
	,f.koulutusala_taso_2
	,f.koulutusala_taso_3
	,f.okm_ohjauksen_ala
	,f.koulutusala_2002
	,f.opintoala_2002
	,f.paaasiallinen_tutkinto_hakukohde
	,f.koulutuksen_kieli
	,f.maakunta_hakukohde
	,f.kunta_hakukohde
	,f.sektori
	,f.tutkinnon_aloitussykli
	,f.korkeakoulu
	,f.toimipiste
	,f.koodit_paaasiallinen_tutkinto_hakukohde
	,f.koodit_korkeakoulu
	,f.koodit_kunta_hakukohde
	,f.koodit_hakukohde
) f
WHERE f.kaikki_hakijat_lkm IS NOT NULL

INSERT INTO AnteroAPI.dw.api_korkeakoulutus_hakeneet_ja_paikan_vastaanottaneet
SELECT
	 [koulutuksen_alkamisvuosi] = f.koulutuksen_alkamisvuosi
	,[koulutuksen_alkamiskausi] = d9.selite_fi

	,[hakukohde] = d3.selite_fi
	,[hakutapa] = d1.hakutapa2_fi
	,[hakutyyppi] = d1.hakutyyppi_fi
	,[valintatapajonon_tyyppi] = NULL
	
	,[koulutusaste_taso_1] = d20.koulutusastetaso1_fi
	,[koulutusaste_taso_2] = d20.koulutusastetaso2_fi
	,[koulutusala_taso_1] = d20.koulutusalataso1_fi
	,[koulutusala_taso_2] = d20.koulutusalataso2_fi
	,[koulutusala_taso_3] = d20.koulutusalataso3_fi
	,[okm_ohjauksen_ala] = d20.okmohjauksenala_fi
	,[koulutusala_2002] = d20.koulutusala2002_fi
	,[opintoala_2002] = d20.opintoala2002_fi
	,[paaasiallinen_tutkinto_hakukohde] = d20.koulutusluokitus_fi
	,[koulutuksen_kieli] = d7.kieli_fi
	,[maakunta_hakukohde] = d5.maakunta_fi
	,[kunta_hakukohde] = d5.kunta_fi

	,[sektori] = d20.koulutussektori_fi 
	,[tutkinnon_aloitussykli] = d44.selite_fi  
	 
	,[korkeakoulu] = d8b.organisaatio_fi
	,[toimipiste] = d8c.organisaatio_fi

	,[koodit_paaasiallinen_tutkinto_hakukohde] = d20.koulutusluokitus_koodi
	,[koodit_korkeakoulu] = d8b.organisaatio_nykyinen_koodi
	,[koodit_kunta_hakukohde] = d5.kunta_koodi
	,[koodit_hakukohde] = d3.oid

	,f.aloituspaikat as aloituspaikat_lkm
	,NULL as kaikki_hakijat_lkm
	,NULL as ensisijaiset_hakijat_lkm						
	,NULL as valitut_lkm
	,NULL as paikan_vastaanottaneet_lkm			
	,NULL as aloittaneet_lkm
	,NULL as alin_hyvaksytty_pistemaara
	,NULL as ylin_hyvaksytty_pistemaara

FROM ANTERO.[dw].[f_haku_ja_valinta_aloituspaikat_ja_pistemaarat] f
LEFT JOIN ANTERO.dw.d_haku d1 on d1.id=f.d_haku_id
LEFT JOIN ANTERO.dw.d_kausi d9 on d9.id=f.d_kausi_koulutuksen_alkamiskausi_id
INNER JOIN ANTERO.sa.sa_haku_ja_valinta_vuosikello_korkea_aste d4 on ((d4.haku_oid=d1.haku_oid and d4.haku_oid is not null) OR (d4.koulutuksen_alkamiskausi=cast(f.koulutuksen_alkamisvuosi as varchar)+cast(d9.jarjestys as varchar) and d1.hakutapa_koodi <> '01' and d4.haku_oid is null)) and f.loadtime >= d4.aloituspaikat	
LEFT JOIN ANTERO.dw.d_hakukohde d3 on d3.id=f.d_hakukohde_id
LEFT JOIN ANTERO.dw.d_alueluokitus d5 on d5.id=f.d_alueluokitus_hakukohde_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d20 on d20.id=f.d_koulutusluokitus_hakukohde_id
LEFT JOIN ANTERO.dw.d_kieli d7 on d7.id=f.d_kieli_koulutus_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d8b on d8b.id=d_organisaatio_oppilaitos_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d8c on d8c.id=d_organisaatio_toimipiste_id
LEFT JOIN ANTERO.dw.d_tutkinnon_aloitussykli_kk d44 on d44.id=f.d_tutkinnon_aloitussykli_kk_id
where (f.koulutuksen_alkamisvuosi > 2016 OR (f.koulutuksen_alkamisvuosi = 2016 and d9.selite_fi = 'Syksy')) and d1.korkeakouluhaku = 1

DROP TABLE IF EXISTS ANTERO.sa.temp_haku_ja_valinta_api 
DROP TABLE IF EXISTS ANTERO.sa.temp_haku_ja_valinta_api2

GO