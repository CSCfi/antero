USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dw].[v_amos_tyoelamapalaute] AS

SELECT 
	generoitu
	,varainhoitovuosi = right(d6.rahoituskausi_amm, 4) + 1
	,rahoituskausi = d6.rahoituskausi_amm
	,suorituskausi = d6.rahoituskausi_amm
	,tilastovuosi = d6.vuosi
	,tilastokuukausi = d6.kuukausi_fi

	,kysely_fi = kyselypohja_tarkenne_fi
	
	,[Tutkinto] = d2.koulutusluokitus_fi
	,[Tutkintotyyppi] = d2.tutkintotyyppi_fi
	,[Koulutusala, taso 1] = d2.koulutusalataso1_fi
	,[Koulutusala, taso 2] = d2.koulutusalataso2_fi
	,[Koulutusala, taso 3] = d2.koulutusalataso3_fi

	,koulutuksen_jarjestaja_fi = d.nimi_amos_spl
	,koulutuksen_jarjestajan_kunta_fi = d3.kunta_fi
	,koulutuksen_jarjestajan_maakunta_fi = d3.maakunta_fi
	,koulutuksen_jarjestajan_hyvinvointialue_fi = d3.hyvinvointialue_fi
	,koulutuksen_jarjestajan_avi_fi = d3.avi_fi
	,koulutuksen_jarjestajan_ely_fi = d3.ely_fi
	,koulutuksen_jarjestajan_opetuskieli_fi = d4.opetuskieli_fi
	,d.[Toiminnanohjauksen kokeilu]
	,d.[Koul. järjestäjän PILKE-alue (kokeilu)]
	,[Oppilaitos] = d1.organisaatio_fi
	,[Oppilaitoksen kunta] = d5.kunta_fi
	,[Oppilaitoksen maakunta] = d5.maakunta_fi

	,koodit_koulutuksen_jarjestaja = coalesce(d.ytunnus_amos_spl, f.ytunnus) --coalesce(d.ytunnus_amos_spl, d.ytunnus_avain)
	,[Koodit Oppilaitos] = f.organisaatio_oppilaitos_koodi --d1.organisaatio_koodi
	,[Koodit Tutkinto] = f.koulutusluokitus_koodi --d2.koulutusluokitus_koodi

	,jarjestys_tilastokuukausi = d6.kuukausi
	,jarjestys_koulutuksen_jarjestajan_maakunta = d3.jarjestys_maakunta_koodi
	,jarjestys_koulutuksen_jarjestajan_hyvinvointialue = d3.jarjestys_hyvinvointialue_koodi
	,jarjestys_koulutuksen_jarjestajan_avi = d3.jarjestys_avi_koodi
	,jarjestys_koulutuksen_jarjestajan_ely = d3.jarjestys_ely_koodi
	,jarjestys_koulutuksen_jarjestajan_opetuskieli = coalesce(nullif(d4.opetuskieli_koodi, '-1'), '99')
	,d.[jarjestys Toiminnanohjauksen kokeilu]
	,d.[jarjestys Koul. järjestäjän PILKE-alue (kokeilu)]
	,[jarjestys Oppilaitoksen maakunta] = d5.jarjestys_maakunta_koodi
	,[jarjestys Tutkintotyyppi] = d2.jarjestys_tutkintotyyppi_koodi
	,[jarjestys Koulutusala, taso 1] = d2.jarjestys_koulutusalataso1_koodi
	,[jarjestys Koulutusala, taso 2] = d2.jarjestys_koulutusalataso2_koodi
	,[jarjestys Koulutusala, taso 3] = d2.jarjestys_koulutusalataso3_koodi

	,apusarake_kohteet = kohteet
	,apusarake_vastanneet = vastanneet
	,apusarake_vastausosuus = vastausosuus
	,apusarake_katokorjauskerroin = katokorjauskerroin
	,apusarake_keskiarvo = keskiarvo
	,apusarake_pisteet = pisteet
	,apusarake_painotetut_pisteet = katokorjauskerroin * pisteet

	,d.sisaltyy_amos_spl

FROM [dw].[f_amos_tyoelamapalaute] f
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d ON d.ytunnus_avain = f.ytunnus
LEFT JOIN dw.d_organisaatioluokitus d1 ON d1.organisaatio_koodi = f.organisaatio_oppilaitos_koodi AND d1.organisaatio_avain like 'oppilaitos_%'
LEFT JOIN dw.d_koulutusluokitus d2 ON d2.koulutusluokitus_koodi = f.koulutusluokitus_koodi
LEFT JOIN dw.d_alueluokitus d3 ON d3.kunta_koodi = coalesce(d.kunta_koodi, '-1')
LEFT JOIN dw.d_oiva_amm_jarjestaja_opetuskieli d4 ON d4.organisaatio_koodi = f.ytunnus
LEFT JOIN dw.d_alueluokitus d5 ON d5.kunta_koodi = coalesce(d1.kunta_koodi, '-1')
LEFT JOIN dw.d_kalenteri d6 ON d6.kalenteri_avain = datefromparts(f.vuosi, f.kuukausi, 1)

GO
