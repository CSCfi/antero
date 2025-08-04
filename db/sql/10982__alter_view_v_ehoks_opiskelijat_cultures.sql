USE [ANTERO]
GO

/****** Object:  View [dw].[v_ehoks_opiskelijat_cultures]    Script Date: 30.7.2025 11.47.01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER VIEW [dw].[v_ehoks_opiskelijat_cultures] AS

SELECT 
	
	 [koulutuksen_alkamisvuosi_fi] = [alkamisvuosi]

	,[sukupuoli_fi] = d2.sukupuoli_fi
	,[ika_alkamisvuonna_fi] = d3.ika_fi
	,[ikaryhma_alkamisvuonna_fi] = d3.ikaryhma3_fi
	,[aidinkieli_fi] = d15.kieliryhma2_fi
	,[kansalaisuus_maanosa_fi] = d16.maanosa5_fi

	,[aika_alkamisesta_hoksin_ensihyvaksymiseen_kk_fi] = [ensikertainen_hyvaksyminen_kk]
	,[osaamisen_hankkimistavat_fi] = d13.selite_fi
	,[opiskeluvalmiuksia_tukevat_opinnot_fi] = d7.kytkin_fi
	,[osaamisen_hankkimisen_tarve_fi] = d8.kytkin_fi
	,[urasuunnitelma_fi] = urasuunnitelma
	,[hoksia_paivitetty_ensihyvaksymisen_jalkeen_fi] = d12.kytkin_fi
	,[olennainen_seikka_ammatillinen_tutkinnon_osa_fi] = d5.kytkin_fi
	,[olennainen_seikka_yhteinen tutkinnon_osa_fi] = d6.kytkin_fi
	,[yhteinen_tutkinnon_osa_fi] = coalesce(t.nimi_fi, 'Ei yhteinen tutkinnon osa')
	
	,[tutkintotyypin_ryhma_fi] = case when d24.kytkin_koodi = 1 then (select distinct tutkintotyypin_ryhma_fi from dw.d_koulutusluokitus where tutkintotyypin_ryhma_koodi = '09') else d1.tutkintotyypin_ryhma_fi end  
	,[tutkintotyyppi_fi] = case when d1.koulutusluokitus_fi like '%VALMA%' then 'VALMA' when d1.koulutusluokitus_fi like '%TELMA%' then 'TELMA' when d24.kytkin_koodi = 1 then (select distinct tutkintotyypin_ryhma_fi from dw.d_koulutusluokitus where tutkintotyypin_ryhma_koodi = '09') else d1.tutkintotyyppi_fi end
	,[koulutusala_taso_1_fi] = d1.koulutusalataso1_fi
	,[koulutusala_taso_2_fi] = d1.koulutusalataso2_fi
	,[koulutusala_taso_3_fi] = d1.koulutusalataso3_fi
	,[tutkinto_fi] = d1.koulutusluokitus_fi
	,[suorituksen_tyyppi_fi] = d9.selite_fi
	
	,[koulutuksen_jarjestaja_fi] = d10.organisaatio_fi
	,[koulutuksen_jarjestajan_kunta_fi] = d14.kunta_fi
	,[koulutuksen_jarjestajan_maakunta_fi] = d14.maakunta_fi

	,[nimetty_vastuullinen_tyopaikkaohjaaja_fi] = d4.kytkin_fi
	,[tyopaikan_toimiala_taso_1_fi] = d11.taso_1_selite_fi
	,[tyopaikan_toimiala_taso_2_fi] = d11.taso_2_selite_fi

	--sv
	,[koulutuksen_alkamisvuosi_sv] = [alkamisvuosi]

	,[sukupuoli_sv] = d2.sukupuoli_sv
	,[ika_alkamisvuonna_sv] = d3.ika_sv
	,[ikaryhma_alkamisvuonna_sv] = d3.ikaryhma3_sv
	,[aidinkieli_sv] = d15.kieliryhma2_sv
	,[kansalaisuus_maanosa_sv] = d16.maanosa5_sv

	,[aika_alkamisesta_hoksin_ensihyvaksymiseen_kk_sv] = [ensikertainen_hyvaksyminen_kk]
	,[osaamisen_hankkimistavat_sv] = d13.selite_sv
	,[opiskeluvalmiuksia_tukevat_opinnot_sv] = d7.kytkin_sv
	,[osaamisen_hankkimisen_tarve_sv] = d8.kytkin_sv
	,[urasuunnitelma_sv] = urasuunnitelma
	,[hoksia_paivitetty_ensihyvaksymisen_jalkeen_sv] = d12.kytkin_sv
	,[olennainen_seikka_ammatillinen_tutkinnon_osa_sv] = d5.kytkin_sv
	,[olennainen_seikka_yhteinen tutkinnon_osa_sv] = d6.kytkin_sv
	,[yhteinen_tutkinnon_osa_sv] = t.nimi_sv
	
	,[tutkintotyypin_ryhma_sv] = case when d24.kytkin_koodi = 1 then (select distinct tutkintotyypin_ryhma_sv from dw.d_koulutusluokitus where tutkintotyypin_ryhma_koodi = '09') else d1.tutkintotyypin_ryhma_sv end  
	,[tutkintotyyppi_sv] = case when d1.koulutusluokitus_sv like '%VALMA%' then 'VALMA' when d1.koulutusluokitus_sv like '%TELMA%' then 'TELMA' when d24.kytkin_koodi =  1 then (select distinct tutkintotyypin_ryhma_sv from dw.d_koulutusluokitus where tutkintotyypin_ryhma_koodi = '09') else d1.tutkintotyyppi_sv end
	,[koulutusala_taso_1_sv] = d1.koulutusalataso1_sv
	,[koulutusala_taso_2_sv] = d1.koulutusalataso2_sv
	,[koulutusala_taso_3_sv] = d1.koulutusalataso3_sv
	,[tutkinto_sv] = d1.koulutusluokitus_sv
	,[suorituksen_tyyppi_sv] = d9.selite_sv
	
	,[koulutuksen_jarjestaja_sv] = d10.organisaatio_sv
	,[koulutuksen_jarjestajan_kunta_sv] = d14.kunta_sv
	,[koulutuksen_jarjestajan_maakunta_sv] = d14.maakunta_sv

	,[nimetty_vastuullinen_tyopaikkaohjaaja_sv] = d4.kytkin_sv
	,[tyopaikan_toimiala_taso_1_sv] = d11.taso_1_selite_sv
	,[tyopaikan_toimiala_taso_2_sv] = d11.taso_2_selite_sv

	--apusarakkeet
	,[apusarake_oppija_oid] = master_oid
	,[apusarake_opiskeluoikeus_oid] = opiskeluoikeus_oid

	--koodit
	,[koodit_koulutuksen_jarjestaja] = d10.organisaatio_koodi
	,[koodit_tutkinto] = d1.koulutusluokitus_koodi

	--jarjestykset
	,[jarjestys_tutkintotyypin_ryhma] = case when d24.kytkin_koodi = 1 then '99' else d1.jarjestys_tutkintotyypin_ryhma_koodi end  
	,[jarjestys_tutkintotyyppi] = case when d1.koulutusluokitus_fi like '%VALMA%' then '92' when d1.koulutusluokitus_fi like '%TELMA%' then '93' when d24.kytkin_koodi = 1 then '99' else d1.jarjestys_tutkintotyyppi_koodi end
	,[jarjestys_koulutusala_taso_1] = d1.jarjestys_koulutusalataso1_koodi
	,[jarjestys_koulutusala_taso_2] = d1.jarjestys_koulutusalataso2_koodi
	,[jarjestys_koulutusala_taso_3] = d1.jarjestys_koulutusalataso3_koodi
	,[jarjestys_suorituksen_tyyppi] = d9.jarjestys
	,[jarjestys_osaamisen_hankkimistavat] = d13.jarjestys
	,[jarjestys_urasuunnitelma] = left(coalesce(nullif(urasuunnitelma, 'Tieto puuttuu'),'ööö'),3)
	,[jarjestys_koulutuksen_jarjestajan_maakunta] = d14.jarjestys_maakunta_koodi
	,[jarjestys_aidinkieli] = d15.jarjestys_kieliryhma2
	,[jarjestys_kansalaisuus_maanosa] = d16.jarjestys_maanosa5_koodi

FROM [ANTERO].[dw].[f_ehoks_opiskelijat] f
LEFT JOIN dw.d_koulutusluokitus d1 on d1.id = f.d_koulutusluokitus_id
LEFT JOIN dw.d_sukupuoli d2 on d2.id = f.d_sukupuoli_id
LEFT JOIN dw.d_ika d3 on d3.id = f.d_ika_alkamisvuonna_id
LEFT JOIN dw.d_kytkin d4 on d4.id = f.d_kytkin_nimetty_vastuullinen_tyopaikkaohjaaja_id
LEFT JOIN dw.d_kytkin d5 on d5.id = f.d_kytkin_olennainen_seikka_hato_id
LEFT JOIN dw.d_kytkin d6 on d6.id = f.d_kytkin_olennainen_seikka_hyto_id
LEFT JOIN dw.d_kytkin d7 on d7.id = f.d_kytkin_opiskeluvalmiuksia_tukevat_opinnot_id
LEFT JOIN dw.d_kytkin d8 on d8.id = f.d_kytkin_osaamisen_hankkimisen_tarve_id
LEFT JOIN dw.d_suorituksen_tyyppi d9 on d9.id = f.d_suorituksen_tyyppi_id
LEFT JOIN dw.d_organisaatioluokitus d10 on d10.id = f.d_organisaatioluokitus_jarj_id
LEFT JOIN dw.d_toimialaluokitus2008 d11 on d11.id = f.d_toimiala_id
LEFT JOIN dw.d_kytkin d12 on d12.id = f.d_kytkin_ehoks_paivitetty_id
LEFT JOIN dw.d_kytkin d24 on d24.id = f.d_kytkin_muu_ammatillinen_id
LEFT JOIN Koski_SA.sa.sa_eperusteet_tutkinnonosat t on t.id = f.d_tutkinnon_osat_id
LEFT JOIN dw.d_osaamisen_hankkimistavat d13 on d13.id = f.d_osaamisen_hankkimistavat_id
LEFT JOIN dw.d_alueluokitus d14 on d14.kunta_koodi = d10.kunta_koodi
LEFT JOIN dw.d_kieli d15 on d15.id = f.d_aidinkieli_id
LEFT JOIN dw.d_maatjavaltiot2 d16 on d16.id = f.d_kansalaisuus_id

GO


