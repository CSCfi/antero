USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dw].[v_amos_opiskelijapalaute_uusi] AS

SELECT 
	f.generoitu
	,[Varainhoitovuosi] = right(d5.rahoituskausi_amm, 4) + 1
	,[Rahoituskausi] = d5.rahoituskausi_amm
	,[Suorituskausi] = d5.rahoituskausi_amm
	,[Tilastovuosi] = d5.vuosi
	,[Tilastokuukausi] = d5.kuukausi_fi

	,[Kysely] = d4.kyselypohja_tarkenne_amis_fi
	,[Kyselyn kohderyhmä] = d4.kyselypohja_tarkenne_fi
	
	,[Tutkinto] = d1.koulutusluokitus_fi
	,[Tutkintotyyppi] = d1.tutkintotyyppi_fi
	,[Koulutusala, taso 1] = d1.koulutusalataso1_fi
	,[Koulutusala, taso 2] = d1.koulutusalataso2_fi
	,[Koulutusala, taso 3] = d1.koulutusalataso3_fi
	
	,[Järjestäjärakenne] = case when d.sisaltyy_amos_spl = 1 then 'Viimeisin suoritepäätös' else 'Poistuneet järjestäjät' end
	,[Koulutuksen järjestäjä] = d.nimi_amos_spl
	,[Koulutuksen järjestäjän kunta] = d2.kunta_fi
	,[Koulutuksen järjestäjän maakunta] = d2.maakunta_fi
	,d.[Toiminnanohjauksen kokeilu]
	,d.[Koul. järjestäjän PILKE-alue (kokeilu)]
	,[Oppilaitos] = d0.organisaatio_fi
	,[Oppilaitoksen kunta] = d3.kunta_fi
	,[Oppilaitoksen maakunta] = d3.maakunta_fi

	--koodit
	,[Koodit Koulutuksen järjestäjä] = coalesce(d.ytunnus_amos_spl, f.ytunnus)
	,[Koodit Tutkinto] = d1.koulutusluokitus_koodi

	--jarjestys
	,[jarjestys Tilastokuukausi] = d5.kuukausi
	,[jarj Koulutuksen järjestäjän maakunta] = d2.jarjestys_maakunta_koodi
	,d.[jarjestys Toiminnanohjauksen kokeilu]
	,d.[jarjestys Koul. järjestäjän PILKE-alue (kokeilu)]
	,[jarjestys Oppilaitoksen maakunta] = d3.jarjestys_maakunta_koodi
	,[jarjestys Tutkintotyyppi] = d1.jarjestys_tutkintotyyppi_koodi
	,[jarjestys Koulutusala, taso 1] = d1.jarjestys_koulutusalataso1_koodi
	,[jarjestys Koulutusala, taso 2] = d1.jarjestys_koulutusalataso2_koodi
	,[jarjestys Koulutusala, taso 3] = d1.jarjestys_koulutusalataso3_koodi

	--apusarakkeet
	,f.kohteet
	,f.vastanneet
	,f.vastausosuus
	,f.katokorjauskerroin
	,f.pisteet
	,[painotetut_pisteet] = f.katokorjauskerroin * f.pisteet
	
	,d.sisaltyy_amos_spl

FROM dw.f_amos_opiskelijapalaute f 
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d ON d.ytunnus_avain = f.ytunnus
LEFT JOIN dw.d_organisaatioluokitus d0 ON d0.organisaatio_koodi = f.organisaatio_oppilaitos_koodi AND d0.organisaatio_avain like 'oppilaitos_%'
LEFT JOIN dw.d_koulutusluokitus d1 ON d1.koulutusluokitus_koodi = f.koulutusluokitus_koodi
LEFT JOIN dw.d_alueluokitus d2 ON d2.kunta_koodi = coalesce(d.kunta_koodi, '-1')
LEFT JOIN dw.d_alueluokitus d3 ON d3.kunta_koodi = coalesce(d0.kunta_koodi, '-1')
LEFT JOIN dw.d_arvokyselykerta d4 ON d4.kyselyid = f.kyselyid
LEFT JOIN dw.d_kalenteri d5 ON d5.kalenteri_avain = datefromparts(f.vuosi, f.kuukausi, 1)

GO
