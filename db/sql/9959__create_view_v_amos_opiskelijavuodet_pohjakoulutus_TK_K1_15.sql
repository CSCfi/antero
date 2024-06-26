USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [dw].[v_amos_opiskelijavuodet_pohjakoulutus_TK_K1_15] AS 

--huom. lähdenäkymässä hieman tuunattu dataa. JS 24.6.2024

SELECT 
	[Tilastovuosi] = v.[tilv]

	,[Ikäryhmä] = d0.ika

	,[Koulutuksen järjestäjä] = v.[jarjnim]
	,[Koul. järj. omistajatyyppi] = --ei raportille toistaiseksi tällä päättelyllä, mahd. selvitetään erikseen saisiko organisaatiopalvelusta
		coalesce(
			d1b.koulutuksen_jarjestajan_omistajatyyppi
			,case when d1.organisaatio_fi like '% Oy' then 'Yksityinen' end
			,'Tieto puuttuu'
		)
	,[Koul. järj. opetuskieli] = coalesce(d1c.opetuskieli_fi, 'Tieto puuttuu')
	,[Koul. järj. maakunta] = d2.maakunta_fi
	,[Koul. järj. kunta] = d2.kunta_fi
	
	,[Koulutuksen alkamisvuosi] = v.[alvv]
	,[Tutkintotyyppi] = 
		case [tutktyyp]
			when '1' then 'Ammatillinen perustutkinto'
			when '2' then 'Ammattitutkinto'
			when '3' then 'Erikoisammattitutkinto'
			when '4' then 'Muu ammatillinen koulutus'
			when '5' then 'Valmentava koulutus'
		end
	,[Tutkinto] = d4.koulutusluokitus_fi
	,[Koulutusala, taso 1] = d4.koulutusalataso1_fi
	,[Koulutusala, taso 2] = d4.koulutusalataso2_fi
	,[Koulutusala, taso 3] = d4.koulutusalataso3_fi
	,[Rahoitusmuoto] = d5.selite_fi
	
	,[Pohjakoulutus (Suomessa)] = 
		case 
			when v.[pohjakoulutus] = '3' then 'On pohjakoulutus, muu kuin ylioppilastutkinto (Suomessa)'
			when v.[pohjakoulutus] = '2' then 'On pohjakoulutus, vain ylioppilastutkinto (Suomessa)'
			when v.[pohjakoulutus] = '1' then 'Ei pohjakoulutusta (Suomessa)'
		end
	,[Pohjakoul. taso (Suomessa)] = v.[kaste_t2ni_e]
	,[Pohjakoul. ala (Suomessa)] = v.[kala_t2ni_e]
	,[Pohjakoulutus (ulkomailla)] =
		case
			when v.[pohjakoulutus_ulkom] = '3' then 'On pohjakoulutus, muu kuin ylioppilastutkinto (ulkomailla)'
			when v.[pohjakoulutus_ulkom] = '2' then 'On pohjakoulutus, vain ylioppilastutkinto (ulkomailla)'
			when v.[pohjakoulutus_ulkom] = '1' then 'Ei pohjakoulutusta (ulkomailla)'
		end
	,[Pohjakoul. taso (ulkomailla)] = v.[kaste_t2ni_e_ulkom]
	,[Pohjakoul. ala (ulkomailla)] = v.[kala_t2ni_e_ulkom]

	--johdetut, Suomi priorisoitu (tarvittaessa siirretään koodien muodostus jo lähdenäkymään)
	,[Pohjakoulutus (yhdistetty)] = 
		case
			when v.[pohjakoulutus_ulkom] = '3' or v.[pohjakoulutus] = '3' then 'On pohjakoulutus, muu kuin ylioppilastutkinto (yhdistetty)'
			when v.[pohjakoulutus_ulkom] = '2' or v.[pohjakoulutus] = '2' then 'On pohjakoulutus, vain ylioppilastutkinto (yhdistetty)'
			when v.[pohjakoulutus_ulkom] = '1' and v.[pohjakoulutus] = '1' then 'Ei pohjakoulutusta (yhdistetty)'
		end
	,[Pohjakoul. taso (yhdistetty)] = 
		case
			when v.[kaste_t2_e] = '99' and v.[kaste_t2_e_ulkom] = '99' then v.[kaste_t2ni_e]
			when v.[kaste_t2_e] != '99' and (v.[kaste_t2_e] >= v.[kaste_t2_e_ulkom] or v.[kaste_t2_e_ulkom] = '99') then v.[kaste_t2ni_e]
			when v.[kaste_t2_e_ulkom] != '99' and (v.[kaste_t2_e_ulkom] > v.[kaste_t2_e] or v.[kaste_t2_e] = '99') then v.[kaste_t2ni_e_ulkom]
		end
	,[Pohjakoul. ala (yhdistetty)] = 
		case
			when v.[kaste_t2_e] = '99' and v.[kaste_t2_e_ulkom] = '99' then v.[kala_t2ni_e]
			when v.[kaste_t2_e] != '99' and (v.[kaste_t2_e] >= v.[kaste_t2_e_ulkom] or v.[kaste_t2_e_ulkom] = '99') then v.[kala_t2ni_e]
			when v.[kaste_t2_e_ulkom] != '99' and (v.[kaste_t2_e_ulkom] > v.[kaste_t2_e] or v.[kaste_t2_e] = '99') then v.[kala_t2ni_e_ulkom]
		end
	,[Korkeimman tutkinnon suoritusmaa] = 
		case
			when v.[kaste_t2_e] = '99' and v.[kaste_t2_e_ulkom] = '99' then 'Ei perusasteen jälkeistä koulutusta tai tutkinto tuntematon'
			when v.[kaste_t2_e] != '99' and (v.[kaste_t2_e] >= v.[kaste_t2_e_ulkom] or v.[kaste_t2_e_ulkom] = '99') then 'Suomi'
			when v.[kaste_t2_e_ulkom] != '99' and (v.[kaste_t2_e_ulkom] > v.[kaste_t2_e] or v.[kaste_t2_e] = '99') then 'Ulkomaat'
		end

	--
	,[Koodit Koulutuksen järjestäjä] = v.[jarj]
	,[Koodit Tutkinto] = v.[koulk]

	--
	,[jarjestys Koul. järj. omistajatyyppi] = coalesce(d1b.koulutuksen_jarjestajan_omistajatyyppikoodi, case when d1.organisaatio_fi like '% Oy' then 1 end, 99)
	,[jarjestys Koul. järj. opetuskieli] = coalesce(10 + d1c.opetuskieli_koodi, 99)
	,[jarjestys Koul. järj. maakunta] = d2.jarjestys_maakunta_koodi
	,[jarjestys Tutkintotyyppi] = v.[tutktyyp]
	,[jarjestys Koulutusala, taso 1] = d4.jarjestys_koulutusalataso1_koodi
	,[jarjestys Koulutusala, taso 2] = d4.jarjestys_koulutusalataso2_koodi
	,[jarjestys Koulutusala, taso 3] = d4.jarjestys_koulutusalataso3_koodi
	,[jarjestys Rahoitusmuoto] = d5.jarjestys_koodi
	,[jarjestys Pohjakoul. taso (Suomessa)] = coalesce(nullif(v.[kaste_t2_e], '99'), '00')
	,[jarjestys Pohjakoul. ala (Suomessa)] = v.[kala_t2_e]
	,[jarjestys Pohjakoul. taso (ulkomailla)] = coalesce(nullif(v.[kaste_t2_e_ulkom], '99'), '00')
	,[jarjestys Pohjakoul. ala (ulkomailla)] = v.[kala_t2_e_ulkom]
	,[jarjestys Pohjakoul. taso (yhdistetty)] = 
		case
			when v.[kaste_t2_e] = '99' and v.[kaste_t2_e_ulkom] = '99' then coalesce(nullif(v.[kaste_t2_e], '99'), '00')
			when v.[kaste_t2_e] != '99' and (v.[kaste_t2_e] >= v.[kaste_t2_e_ulkom] or v.[kaste_t2_e_ulkom] = '99') then v.[kaste_t2_e]
			when v.[kaste_t2_e_ulkom] != '99' and (v.[kaste_t2_e_ulkom] > v.[kaste_t2_e] or v.[kaste_t2_e] = '99') then v.[kaste_t2_e_ulkom]
		end
	,[jarjestys Pohjakoul. ala (yhdistetty)] = 
		case
			when v.[kaste_t2_e] = '99' and v.[kaste_t2_e_ulkom] = '99' then v.[kala_t2_e]
			when v.[kaste_t2_e] != '99' and (v.[kaste_t2_e] >= v.[kaste_t2_e_ulkom] or v.[kaste_t2_e_ulkom] = '99') then v.[kala_t2_e]
			when v.[kaste_t2_e_ulkom] != '99' and (v.[kaste_t2_e_ulkom] > v.[kaste_t2_e] or v.[kaste_t2_e] = '99') then v.[kala_t2_e_ulkom]
		end

	--
	,[apusarake_opiskelijavuodet] = v.opiskelijavuodet

FROM [dw].[v_TK_K1_15] v
LEFT JOIN VipunenTK.dbo.d_ika d0 ON d0.ika_avain = coalesce('ikar8_' + v.[ikar8], '-1')
LEFT JOIN dw.d_organisaatioluokitus d1 ON d1.organisaatio_koodi = v.jarj
LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot d1b ON d1b.oppilaitos_avain = v.jarj
LEFT JOIN dw.d_oiva_amm_jarjestaja_opetuskieli d1c ON d1c.organisaatio_koodi = v.jarj
LEFT JOIN dw.d_alueluokitus d2 ON d2.kunta_koodi = coalesce(d1.kunta_koodi, '-1')
LEFT JOIN dw.d_koulutusluokitus d4 ON d4.koulutusluokitus_koodi = coalesce(v.koulk, '-1')
LEFT JOIN dw.d_opintojenrahoitus d5 ON d5.koodi = v.rahoitus

GO
