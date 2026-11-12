USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [dw].[v_koski_amm_sopimusmuotoinen_koulutus] AS

SELECT 

-- AIKAMUUTTUJAT
	[Koul. aloitusvuosi] = d6.vuosi
	,[Koul. aloituskuukausi] = d6.kuukausi_fi
	,[Koul. p‰‰ttymisvuosi] = d7.vuosi
--	,[Koul. p‰‰ttymisvuosi] =
--		CASE
--			WHEN d7.vuosi = -1 THEN 'Tieto puuttuu'
--			ELSE d7.vuosi
--		END
	,[Koul. p‰‰ttymiskuukausi] = d7.kuukausi_fi
	,[Sopimuksen aloitusvuosi] = d8.vuosi
	,[Sopimuksen aloituskuukausi] = d8.kuukausi_fi
	,[Sopimuksen p‰‰ttymisvuosi] = d9.vuosi
	,[Sopimuksen p‰‰ttymiskuukausi] = d9.kuukausi_fi

-- LASKENTAMUUTTUJAT
	,oppija_oid = HASHBYTES('SHA2_256', vs.salt + f.oppija_oid)
	,opiskeluoikeus_oid = HASHBYTES('SHA2_256', vs.salt + f.opiskeluoikeus_oid)

    ,[sopimusjakso_loppunut]
    ,[sop_id]
    ,[paivat]
	,[paivat_tarkastettu]
	,kytkin_paivaysvirhe = 
		case 
			when d8.vuosi = -1 then 1
			when d9.vuosi = -1 then 1
			when paivat_tarkastettu < 0 then 1
			else 0 
		end
	
	,lkm = 1
    ,[Ensimm‰inen sopimus] = [ensimmainen_sopimus]
    ,[Ensimm‰inen sopimus yrityksess‰] = [ensimmainen_sopimus_yritys]
    ,[V‰h. kaksi sopimusta] = [vahintaan_kaksi_sopimusta]
    ,[V‰h. kaksi sopimusta yrityksess‰] = [vahintaan_kaksi_sopimusta_yritys]
    ,[sopimusten_lkm_opiskeluoikeudessa]
    ,[sopimusten_lkm_opiskeluoikeus_yritys]
    ,[Edellinen sopimus] = [edellinen_sopimus]
    ,[Edellinen sopimus yrityksess‰] = [edellinen_sopimus_sama_yritys]
    ,[edellinen_sopimus_koso]
    ,[edellinen_sopimus_opso]
    ,[edellinen_sopimus_koso_yritys]
    ,[edellinen_sopimus_opso_yritys]
	,[Kesto kuukausina] = 
		case 
			when d8.vuosi = -1 then 'Tieto puuttuu'
			when d9.vuosi = -1 then 'Tieto puuttuu'
			when paivat_tarkastettu < 0 then 'Tieto puuttuu'
			else CAST(CEILING(paivat_tarkastettu * 1.0 / 30.5) AS nvarchar(13)) 
		end
	,[Kesto viikkoina] = 
		case 
			when d8.vuosi = -1 then 'Tieto puuttuu'
			when d9.vuosi = -1 then 'Tieto puuttuu'
			when paivat_tarkastettu < 0 then 'Tieto puuttuu'
			else CAST(CEILING(paivat_tarkastettu * 1.0 / 7) AS nvarchar(13)) 
		end

-- HENKIL÷MUUTTUJAT
	,[Sukupuoli] = d1.sukupuoli_fi
	,[ƒidinkieli] = d2.kieli_fi
	,[Ik‰] = d3.ika_fi 
	,[Ik‰ryhm‰] = d3.ikaryhma3_fi

-- KOULUTUSMUUTTUJAT
	,[Tutkintotyypin ryhm‰] = d4.tutkintotyypin_ryhma_fi --case when d18.koodi = 'muu' then 'Muu ammatillinen koulutus' else d4a.tutkintotyypin_ryhma_fi end
    ,[Tutkintotyyppi] = d4.tutkintotyypin_ryhma_fi -- case when d18.koodi = 'muu' then 'Muu ammatillinen koulutus' else d4a.tutkintotyyppi_fi end
	,[Tutkinto] = d4.koulutusluokitus_fi  
	,[Koulutusala, taso 3] = d4.koulutusalataso3_fi  
    ,[Koulutusala, taso 2] = d4.koulutusalataso2_fi 
	,[Koulutusala, taso 1] = d4.koulutusalataso1_fi 
	,[Osaamisala] = d20.selite_fi
    ,[Suorituksen tyyppi] = d17.selite_fi
	,[Suorituskieli] = d13.kieli_fi

-- ORGANISAATIOMUUTTUJAT
	,[Oppilaitos] = d5.organisaatio_fi
	,[Koulutuksen j‰rjest‰j‰] = d11.organisaatio_fi
	,[Toimipiste] = d14.organisaatio_fi
	,[Oppilaitoksen kunta] = d10.kunta_fi
	,[Oppilaitoksen maakunta] = d10.maakunta_fi
	,[Oppilaitoksen AVI] = d10.avi_fi
	,[Oppilaitoksen ELY] = d10.ely_fi 
	,[Koul. j‰rjest‰j‰n kunta] = d12.kunta_fi 
	,[Koul. j‰rjest‰j‰n maakunta] = d12.maakunta_fi 
	,[Koul. j‰rjest‰j‰n ELY] = d12.ely_fi 
	,[Koul. j‰rjest‰j‰n AVI] = d12.avi_fi  

-- SOPIMUSKOULUTUSMUUTTUJAT
	,[Sopimus p‰‰ttynyt] =
		CASE
			WHEN sopimusjakso_loppunut = 1 THEN 'Kyll‰'
			WHEN sopimusjakso_loppunut = 0 THEN 'Ei'
		END
	,[Sopimusmuoto] = sopimusmuoto
	,[Yrityksen toiminimi] = d30.toiminimi
    ,[KJ:n kirjaama toiminimi] = f.sijainti
	,[Yrityksen yritysmuoto] = d30.yritysmuoto_seloste
	,[Yrityksen kunta] = d32.kunta_fi
	,[Yrityksen kieli] = d33.kieli_fi
	,[Yrityksen maakunta] = d32.maakunta_fi
	,[Yrityksen AVI] = d32.avi_fi
	,[Yrityksen ELY] = d32.ely_fi
	,[P‰‰toimiala] = d31.selite_fi
	,[P‰‰toimiala, taso 0] = d31.[taso_0_selite_fi]	
	,[P‰‰toimiala, taso 1] = d31.[taso_1_selite_fi]
	,[P‰‰toimiala, taso 2] = d31.[taso_2_selite_fi]
	,[P‰‰toimiala, taso 3] = d31.[taso_3_selite_fi]
	,[P‰‰toimiala, taso 4] = d31.[taso_4_selite_fi]
	,[P‰‰toimiala, taso 5] = d31.[taso_5_selite_fi]

-- JƒRJESTYSMUUTTUJAT
	,d1.jarjestys_sukupuoli_koodi AS jarj_sukupuoli

	,d6.kuukausi AS jarj_alkamiskuukausi
	,d7.kuukausi AS jarj_paattymiskuukausi
	,d8.kuukausi AS jarj_sop_alkamiskuukausi
	,d9.kuukausi AS jarj_sop_paattymiskuukausi

	,d3.jarjestys_ikaryhma3 AS jarj_ikaryhma
	,d3.ika_avain AS jarj_ika 
	,d4.jarjestys_koulutusalataso1_koodi AS jarj_koulutusala_taso1
	,d4.jarjestys_koulutusalataso2_koodi AS jarj_koulutusala_taso2
	,d4.jarjestys_koulutusalataso3_koodi AS jarj_koulutusala_taso3
	,d12.jarjestys_maakunta_koodi AS jarj_koul_jarj_maakunta
	,d12.jarjestys_avi_koodi AS jarj_koul_jarj_avi
	,d12.jarjestys_ely_koodi AS jarj_koul_jarj_ely
	,d10.jarjestys_maakunta_koodi AS jarj_oppilaitoksen_maakunta
	,d10.jarjestys_ely_koodi AS jarj_oppilaitoksen_ely
	,d10.jarjestys_avi_koodi AS jarj_oppilaitoksen_avi

	,d32.jarjestys_maakunta_koodi AS jarj_yrityksen_maakunta
	,d32.jarjestys_avi_koodi AS jarj_yrityksen_avi
	,d32.jarjestys_ely_koodi AS jarj_yrityksen_ely

    ,d31.[jarj_taso_1]
    ,d31.[jarj_taso_2]
    ,d31.[jarj_taso_3]
    ,d31.[jarj_taso_4]
    ,d31.[jarj_taso_5]
	,jarj_kesto_kuukausina = 
		case
			when d8.vuosi = -1 then -1
			when d9.vuosi = -1 then -1
			when paivat_tarkastettu < 0 then -1
			else CEILING(paivat_tarkastettu * 1.0 / 30.5) 
		end
	,jarj_kesto_viikkoina = 
		case
			when d8.vuosi = -1 then -1
			when d9.vuosi = -1 then -1
			when paivat_tarkastettu < 0 then -1
			else CEILING(paivat_tarkastettu * 1.0 / 7) 
		end

-- KOODIMUUTTUJAT
    ,[Koodi P‰‰toimiala] = d31.[toimiala_koodi]
	,[Koodi Yrityksen Y-tunnus] = d30.ytunnus
	,[Koodi Yritysmuoto] = d30.yritysmuoto_koodi

FROM [ANTERO].[dw].[f_koski_amm_sopimusmuotoinen_koulutus] f
LEFT JOIN dw.d_sukupuoli d1 ON d1.id= f.d_sukupuoli_id
LEFT JOIN dw.d_kieli d2 ON d2.id = f.d_kieli_aidinkieli_id
LEFT JOIN dw.d_ika d3 ON d3.id = f.d_ika_id
LEFT JOIN dw.d_koulutusluokitus d4 ON d4.id = f.d_koulutusluokitus_id
LEFT JOIN dw.d_organisaatioluokitus d5 ON d5.id = f.d_organisaatioluokitus_oppilaitos_id
LEFT JOIN dw.d_kalenteri d6 ON d6.id = f.d_kalenteri_koul_alku_id
LEFT JOIN dw.d_kalenteri d7 ON d7.id = f.d_kalenteri_koul_loppu_id
LEFT JOIN dw.d_kalenteri d8 ON d8.id = f.d_kalenteri_sop_alku_id
LEFT JOIN dw.d_kalenteri d9 ON d9.id = f.d_kalenteri_sop_loppu_id
LEFT JOIN dw.d_alueluokitus d10 ON d10.kunta_koodi = d5.kunta_koodi 
LEFT JOIN dw.d_organisaatioluokitus d11 ON d11.id = f.d_organisaatioluokitus_jarj_id
LEFT JOIN dw.d_alueluokitus d12 ON d12.kunta_koodi = d11.kunta_koodi
LEFT JOIN dw.d_kieli d13 ON d13.id = f.d_kieli_suorituskieli_id
LEFT JOIN dw.d_organisaatioluokitus d14 ON d14.id = f.d_organisaatioluokitus_toimipiste_id
--LEFT JOIN dw.d_erityisopetus d13 ON d13.id = f.d_erityisopetus_id
LEFT JOIN dw.d_suorituksen_tyyppi d17 ON d17.id = f.d_suorituksen_tyyppi_id
LEFT JOIN dw.d_osaamisala d20 ON d20.id = f.d_osaamisala_id
LEFT JOIN dw.d_ytj_yritystiedot d30 ON d30.id = f.d_ytj_yritystieto_id
LEFT JOIN dw.d_toimialaluokitus2008 d31 ON d31.id = f.d_toimialaluokitus2008_id
LEFT JOIN dw.d_alueluokitus d32 ON d32.id = f.d_alueluokitus_yrityksen_kunta_id
LEFT JOIN dw.d_kieli d33 ON d33.id = f.d_kieli_yritys_id
JOIN dbo.view_salt vs ON vs.[view] = 'v_koski_amm_sopimusmuotoinen_koulutus'

GO
