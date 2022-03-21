USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_lukio_ainevalinnat_kurssit]    Script Date: 12.1.2021 6:41:21 ******/
DROP VIEW IF EXISTS [dw].[v_koski_lukio_ainevalinnat_kurssit]
GO

/****** Object:  View [dw].[v_koski_lukio_ainevalinnat_kurssit]    Script Date: 12.1.2021 6:41:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dw].[v_koski_lukio_ainevalinnat_kurssit] AS

--jos lisätään oppiaine-/kurssimuuttujia, vastaavat lisättävä kuution mittarin "Oppimäärän suorittaneet" all-ehtoihin
--huom. all-ehdot myös mahdollisissa käännöksissä

SELECT
	
	[Tilastovuosi]
	,[lkm]
	--,[Opiskeltujen kielten määrä] = case when kielet_lkm > 5 then '6 tai enemmän' else cast(kielet_lkm as nvarchar) end

  --lukion oppimäärä			
	,[paatason_suoritus_id]
    ,[Lukion oppimäärä] = case lukionoppimaara when 'nuortenops' then 'Nuorten OPS' when 'aikuistenops' then 'Aikuisten OPS' else lukionoppimaara end
    ,[Lukion oppimäärän suorituskieli] = d3.kieliryhma1_fi

  --henkilö
	,[Sukupuoli] = d9.sukupuoli_fi
	--,[Ikä] = d10.ika_fi
	--,[Ikäryhmä] = d10.ikaryhma2_fi
	--,[Äidinkieli] = d11.kieliryhma1_fi
	--,[Kansalaisuus] = case kansalaisuus when '246' then 'Suomi' when '999' then 'Tuntematon' else 'Muu' end
	
  --organisaatio
	,[Oppilaitoksen opetuskieli] = d0a.oppilaitoksenopetuskieli_fi
    ,[Oppilaitosnumero] = d0a.organisaatio_koodi
	,[Oppilaitos] = d0a.organisaatio_fi
	,[Oppilaitoksen kunta] = d2.kunta_fi
	,[Oppilaitoksen kuntaryhmä] = d2.kuntaryhma_fi
	,[Oppilaitoksen maakunta] = d2.maakunta_fi
	,[Koulutuksen järjestäjä] = d0b.organisaatio_fi
	,[Koulutuksen järjestäjän opiskelijamäärä] = case 
													when d1.yopp21 + d1.yopp22 > 699 then '700 –   '
													when d1.yopp21 + d1.yopp22 > 499 then '500 – 699'
													when d1.yopp21 + d1.yopp22 > 299 then '300 – 499'
													when d1.yopp21 + d1.yopp22 > 99 then '100 – 299'
													when d1.yopp21 + d1.yopp22 > 49 then ' 50 – 99 '
													when d1.yopp21 + d1.yopp22 > 0 then '    – 49 '
													else 'Ei tietoa'
												 end
  --aine ja oppimäärä
    --,[osasuoritus_id]
	,[Oppiaineryhmä] = d4.ryhma_nimi
    ,[Oppiaine] = case d4.ryhma_koodi when 'kie' then left(d4.nimi, CHARINDEX(',', d4.nimi) - 1) else d4.nimi end --", väh./alle X kurssia" pois
    ,[Oppimäärä tai kieli] = d5.nimi
    --,[Oppiaineen suorituskieli] = d6.kieli_fi

  --kurssit
	,[Kurssin koodisto] = kurssi_koodisto
	,[Kurssikoodi] = kurssi
	,[Kurssi] = kurssi + ' ' + coalesce(d13.nimi,'')
	,[Kurssin OPS] = case kurssi_paikallinen_OPS_0_1 when 1 then 'Paikallinen' when 0 then 'Valtakunnallinen' end
    ,[Kurssin tyyppi] = d7.nimi
    ,[Kurssin suorituskieli] = d8.kieliryhma1_fi
	,[Kurssin arvosana] = kurssi_arvosana

  --jarj
	,[jarj_oppilaitoksen_kuntaryhma] = coalesce(d2.jarjestys_kuntaryhma_koodi, 9999)
	,[jarj_oppilaitoksen_maakunta] = coalesce(d2.jarjestys_maakunta_koodi, 9999)

	--,[jarj_ika] = d10.jarjestys_ika
	--,[jarj_ikaryhma] = d10.jarjestys_ikaryhma2
	--,[jarj_aidinkieli] = d11.jarjestys_kieliryhma1
	--,[jarj_kansalaisuus] = case when kansalaisuus in ('246','999') then kansalaisuus else '666' end

	,[jarj_lukion_suorituskieli] = d3.jarjestys_kieliryhma1
	,[jarj_oppiaineryhma] = coalesce(d4.jarjestys_ryhma, 9999)
	,[jarj_oppiaine] = coalesce(d4.jarjestys, 9999)
	,[jarj_oppimaara_tai_kieli] = coalesce(d5.jarjestys, 9999)
	,[jarj_kurssin_ops] = coalesce(kurssi_paikallinen_OPS_0_1, 2)
	,[jarj_kurssin_tyyppi] = coalesce(d7.jarjestys, 9999)
	,[jarj_kurssin_suorituskieli] = d8.jarjestys_kieliryhma1
	,[jarj_kurssin_koodisto] = coalesce(kurssi_koodisto, 'öööö')
	,[jarj_kurssi] = coalesce(d13.jarjestys, 'öööö'+kurssi)

  --sv,en

FROM VipunenTK_SA.dbo.v_sa_TK_Koski_lukio_ainevalinnat_kurssit

--LEFT JOIN dw.d_organisaatioluokitus d0 on d0.organisaatio_oid = f.toimipiste_oid
LEFT JOIN dw.d_organisaatioluokitus d0a on d0a.organisaatio_oid = oppilaitos_oid
LEFT JOIN dw.d_organisaatioluokitus d0b on d0b.organisaatio_oid = koulutustoimija_oid
LEFT JOIN dw.d_jarjestajankoko d1 on d1.jarj = d0b.organisaatio_koodi AND d1.tilv = Tilastovuosi - 1
LEFT JOIN dw.d_alueluokitus d2 on d2.alueluokitus_avain = ('kunta_' + d0a.kunta_koodi) 
LEFT JOIN dw.d_kieli d3 on d3.kieli_koodi = lukionoppimaara_suorituskieli
LEFT JOIN dw.d_lukio_oppiaine_ja_oppimaara d4 on d4.koodi = aine AND d4.koodisto = aine_koodisto
LEFT JOIN dw.d_lukio_oppiaine_ja_oppimaara d5 on d5.koodi = aineenoppimaara AND d5.koodisto = aineenoppimaara_koodisto
--LEFT JOIN dw.d_kieli d6 on d6.kieli_koodi = aine_suorituskieli
LEFT JOIN dw.d_lukio_kurssintyyppi d7 on d7.koodi = kurssi_tyyppi
LEFT JOIN dw.d_kieli d8 on d8.kieli_koodi = kurssi_suorituskieli
LEFT JOIN dw.d_sukupuoli d9 on d9.sukupuoli_koodi = sukupuoli
--LEFT JOIN dw.d_ika d10 on d10.ika_avain = ika
--LEFT JOIN dw.d_kieli d11 on d11.kieli_koodi = aidinkieli
--LEFT JOIN dw.d_maatjavaltiot2 d12 on d12.maatjavaltiot2_koodi = kansalaisuus
LEFT JOIN dw.d_lukio_kurssit d13 on d13.koodisto = kurssi_koodisto AND d13.koodi = kurssi

WHERE kurssi_arvosana <> 'O'


GO

