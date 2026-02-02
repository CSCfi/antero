USE [ANTERO]
GO

/****** Object:  View [dw].[v_ehoks_tutkinnon_suorittaneet_cultures]    Script Date: 2.2.2026 10.06.51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER VIEW [dw].[v_ehoks_tutkinnon_suorittaneet_cultures] AS



SELECT 
	
	 [tilastovuosi_koulutuksen_paattymisvuosi] = year(vahvistuspaiva)
	,[koulutuksen_alkamisvuosi] = [alkamisvuosi]
	,[ika_alkamisvuonna] = d3.ika_fi

	--fi
	,[sukupuoli_fi] = d2.sukupuoli_fi
	,[ikaryhma_alkamisvuonna_fi] = d3.ikaryhma3_fi
	,[aidinkieli_fi] = d15.kieliryhma2_fi
	,[kansalaisuus_maanosa_fi] = d16.maanosa5_fi

	,[osaamisen_hankkimistavat_fi] = d5.selite_fi
	,[osaamisen_hankkimistapa_fi] = d6.selite_fi
	,[opiskelijalla_tutkinnon_osakohtaisia_jaksoja_hoksissa_fi] = d4.kytkin_fi

	,[tutkintotyypin_ryhma_fi] = ca1.tutkintotyypin_ryhma_fi
	,[tutkintotyyppi_fi] = ca1.tutkintotyyppi_fi
	,[koulutusala_taso_1_fi] = d1.koulutusalataso1_fi
	,[koulutusala_taso_2_fi] = d1.koulutusalataso2_fi
	,[koulutusala_taso_3_fi] = d1.koulutusalataso3_fi
	,[tutkinto_fi] = d1.koulutusluokitus_fi
	,[suorituksen_tyyppi_fi] = d9.selite_fi
	,[oppisopimuskoulutuksen_osuus_fi] = ca1.oppisopimuskoulutuksen_osuus
	,[koulutussopimuskoulutuksen_osuus_fi] = ca1.koulutussopimuskoulutuksen_osuus
		
	,[koulutuksen_jarjestaja_fi] = d10.organisaatio_fi
	,[koulutuksen_jarjestajan_kunta_fi] = d10a.kunta_fi
	,[koulutuksen_jarjestajan_maakunta_fi] = d10a.maakunta_fi

	,[tyopaikka_fi] = coalesce(d14.toiminimi,'Tieto puuttuu')
	,[tyonantajan_toimiala_taso_1_fi] = d11.taso_1_selite_fi
	,[tyonantajan_toimiala_taso_2_fi] = d11.taso_2_selite_fi

	--sv
	,[sukupuoli_sv] = d2.sukupuoli_sv
	,[ikaryhma_alkamisvuonna_sv] = d3.ikaryhma3_sv
	,[aidinkieli_sv] = d15.kieliryhma2_sv
	,[kansalaisuus_maanosa_sv] = d16.maanosa5_sv

	,[osaamisen_hankkimistavat_sv] = d5.selite_sv
	,[osaamisen_hankkimistapa_sv] = d6.selite_sv
	,[opiskelijalla_tutkinnon_osakohtaisia_jaksoja_hoksissa_sv] = d4.kytkin_sv

	,[tutkintotyypin_ryhma_sv] = ca1.tutkintotyypin_ryhma_sv
	,[tutkintotyyppi_sv] = ca1.tutkintotyyppi_sv
	,[koulutusala_taso_1_sv] = d1.koulutusalataso1_sv
	,[koulutusala_taso_2_sv] = d1.koulutusalataso2_sv
	,[koulutusala_taso_3_sv] = d1.koulutusalataso3_sv
	,[tutkinto_sv] = d1.koulutusluokitus_sv
	,[suorituksen_tyyppi_sv] = d9.selite_sv
	,[oppisopimuskoulutuksen_osuus_sv] = ca1.oppisopimuskoulutuksen_osuus
	,[koulutussopimuskoulutuksen_osuus_sv] = ca1.koulutussopimuskoulutuksen_osuus
		
	,[koulutuksen_jarjestaja_sv] = d10.organisaatio_sv
	,[koulutuksen_jarjestajan_kunta_sv] = d10a.kunta_sv
	,[koulutuksen_jarjestajan_maakunta_sv] = d10a.maakunta_sv

	,[tyopaikka_sv] = coalesce(d14.toiminimi,'Information saknas')
	,[tyonantajan_toimiala_taso_1_sv] = d11.taso_1_selite_sv
	,[tyonantajan_toimiala_taso_2_sv] = d11.taso_2_selite_sv

	--apusarakkeet
	,[apusarake_oppija_oid] = f.master_oid
	,[apusarake_opiskeluoikeus_oid] = f.opiskeluoikeus_oid
	,[apusarake_lkm] = 1
	,[apusarake_opiskeluoikeuden_kesto_kaikki] = f.opiskeluoikeuden_kesto_paivia_kaikki_tilat
	,[apusarake_opiskeluoikeuden_kesto] = f.opiskeluoikeuden_kesto_paivia
	,[apusarake_hankkimistavan_kesto] = f.paivat_hankkimistapa
	,[apusarake_paivat] = f.paivat_kaikki
	,[apusarake_paivat_tyopaikka] = f.paivat_tyopaikka
    ,[apusarake_sopimusten_lkm_opiskeluoikeus_yritys] = f.sopimusten_lkm_opiskeluoikeus_yritys
	,[apusarake_generoitu] = f.generoitu

	--koodit
	,[koodit_koulutuksen_jarjestaja] = d10.organisaatio_koodi
	,[koodit_tyopaikka] = f.ytunnus
	,[koodit_tutkinto] = d1.koulutusluokitus_koodi

	--järjestykset
	,[jarjestys_tutkintotyyppi] = case when d1.koulutusluokitus_fi like '%VALMA%' then '92' when d1.koulutusluokitus_fi like '%TELMA%' then '93' when d24.kytkin_koodi = 1 then '99' else d1.jarjestys_tutkintotyyppi_koodi end
	,[jarjestys_tutkintotyypin_ryhma] = ca1.tutkintotyypin_ryhma_jarjestys
	,[jarjestys_koulutusala_taso_1] = d1.jarjestys_koulutusalataso1_koodi
	,[jarjestys_koulutusala_taso_2] = d1.jarjestys_koulutusalataso2_koodi
	,[jarjestys_koulutusala_taso_3] = d1.jarjestys_koulutusalataso3_koodi
	,[jarjestys_suorituksen_tyyppi] = d9.jarjestys
	,[jarjestys_hankkimistapa] = d6.jarjestys
	,[jarjestys_osaamisen_hankkimistavat] = d5.jarjestys
	,[jarjestys_aidinkieli] = d15.jarjestys_kieliryhma2
	,[jarjestys_kansalaisuus_maanosa] = d16.jarjestys_maanosa5_koodi
	
FROM [dw].[f_ehoks_tutkinnon_suorittaneet] f
LEFT JOIN dw.d_koulutusluokitus d1 on d1.id = f.d_koulutusluokitus_id
LEFT JOIN dw.d_sukupuoli d2 on d2.id = f.d_sukupuoli_id
LEFT JOIN dw.d_ika d3 on d3.id = f.d_ika_alkamisvuonna_id
LEFT JOIN dw.d_kytkin d4 on d4.id = f.d_kytkin_tutkinnon_osakohtaisia_jaksoja_hoksissa_id
LEFT JOIN dw.d_osaamisen_hankkimistavat d5 on d5.id = f.d_osaamisen_hankkimistavat_id
LEFT JOIN dw.d_osaamisen_hankkimistapa d6 on d6.id = f.d_osaamisen_hankkimistapa_id
LEFT JOIN dw.d_suorituksen_tyyppi d9 on d9.id = f.d_suorituksen_tyyppi_id
LEFT JOIN dw.d_organisaatioluokitus d10 on d10.id = f.d_organisaatioluokitus_jarj_id
LEFT JOIN dw.d_alueluokitus d10a on d10a.kunta_koodi = d10.kunta_koodi
LEFT JOIN dw.d_toimialaluokitus2008 d11 on d11.id = f.d_toimiala_id
LEFT JOIN dw.d_kytkin d24 on d24.id = f.d_kytkin_muu_ammatillinen_id
LEFT JOIN dw.d_ytj_yritystiedot d14 on d14.ytunnus=f.ytunnus
LEFT JOIN dw.d_kieli d15 on d15.id = f.d_aidinkieli_id
LEFT JOIN dw.d_maatjavaltiot2 d16 on d16.id = f.d_kansalaisuus_id
CROSS APPLY (
	SELECT 
		oppisopimuskoulutuksen_osuus = 
			case 
				when f.oppisopimuksen_osuus = 0 then '0 %' -- Muutettu asteikot 16.1 Tiketti CSCVIPUNEN-4827
				when f.oppisopimuksen_osuus < 0.25 then '1 - 24 %'
				when f.oppisopimuksen_osuus < 0.50 then '25 - 49 %'
				when f.oppisopimuksen_osuus < 0.75 then '50 - 74 %'
				else '75 - 100 %'
			end
		,koulutussopimuskoulutuksen_osuus = 
			case 
				when f.koulutussopimuksen_osuus = 0 then '0 %'
				when f.koulutussopimuksen_osuus < 0.25 then '1 - 24 %'
				when f.koulutussopimuksen_osuus < 0.50 then '25 - 49 %'
				when f.koulutussopimuksen_osuus < 0.75 then '50 - 74 %'
				else '75 - 100 %'
			end
		,tutkintotyypin_ryhma_fi = 
			case 
				when d1.tutkintotyyppi_koodi = '-1' and d9.koodi = '3' then concat(d1.tutkintotyyppi_fi,' (',lower(d9.selite_fi),')') 
				when d24.kytkin_koodi = 1 then (select distinct tutkintotyypin_ryhma_fi from [ANTERO].[dw].[d_koulutusluokitus] where tutkintotyypin_ryhma_koodi = '09') 
				else d1.tutkintotyypin_ryhma_fi 
			end  
		,tutkintotyyppi_fi = 
			case 
				when d1.tutkintotyyppi_koodi = '-1' and d9.koodi = '3' then concat(d1.tutkintotyyppi_fi,' (',lower(d9.selite_fi),')') 
				when d1.koulutusluokitus_fi like '%VALMA%' then 'VALMA' 
				when d1.koulutusluokitus_fi like '%TELMA%' then 'TELMA' 
				when d24.kytkin_koodi =  1 then (select distinct tutkintotyypin_ryhma_fi from [ANTERO].[dw].[d_koulutusluokitus] where tutkintotyypin_ryhma_koodi = '09') 
				else d1.tutkintotyyppi_fi 
			end
		,tutkintotyypin_ryhma_sv = 
			case 
				when d1.tutkintotyyppi_koodi = '-1' and d9.koodi = '3' then concat(d1.tutkintotyyppi_sv,' (',lower(d9.selite_sv),')') 
				when d24.kytkin_koodi = 1 then (select distinct tutkintotyypin_ryhma_sv from [ANTERO].[dw].[d_koulutusluokitus] where tutkintotyypin_ryhma_koodi = '09') 
				else d1.tutkintotyypin_ryhma_sv 
			end  
		,tutkintotyyppi_sv = 
			case 
				when d1.tutkintotyyppi_koodi = '-1' and d9.koodi = '3' then concat(d1.tutkintotyyppi_sv,' (',lower(d9.selite_sv),')') 
				when d1.koulutusluokitus_sv like '%VALMA%' then 'VALMA' 
				when d1.koulutusluokitus_sv like '%TELMA%' then 'TELMA' 
				when d24.kytkin_koodi =  1 then (select distinct tutkintotyypin_ryhma_sv from [ANTERO].[dw].[d_koulutusluokitus] where tutkintotyypin_ryhma_koodi = '09') 
				else d1.tutkintotyyppi_sv 
			end
		,tutkintotyypin_ryhma_jarjestys = 
			case 
				when d1.tutkintotyyppi_koodi = '-1' and d9.koodi = '3' then 99
				when d24.kytkin_koodi = 1 then 98--(select distinct jarjestys_tutkintotyypin_ryhma_koodi from [ANTERO].[dw].[d_koulutusluokitus] where tutkintotyypin_ryhma_koodi = '09') 
				else d1.jarjestys_tutkintotyypin_ryhma_koodi
			end  
) ca1
