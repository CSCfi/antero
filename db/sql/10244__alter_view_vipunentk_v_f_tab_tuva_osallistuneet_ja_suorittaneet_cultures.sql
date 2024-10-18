USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_tuva_osallistuneet_ja_suorittaneet_cultures]    Script Date: 18.10.2024 16:38:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




















ALTER   VIEW [dbo].[v_f_tab_tuva_osallistuneet_ja_suorittaneet_cultures] AS
SELECT --TOP 200
       tilastointivuosi AS tilastovuosi_fi
	  ,d2.koulutuksen_jarjestaja AS koulutuksen_jarjestaja_fi
      ,d2.koulutuksen_jarjestajan_omistajatyyppi AS koulutuksen_jarjestajan_omistajatyyppi_fi
      ,d2.koulutuksen_jarjestajan_kieli koulutuksen_jarjestajan_kieli_fi
      ,d2.koulutuksen_jarjestajan_sijaintikunta AS koulutuksen_jarjestajan_kunta_fi

	  ,d13.hyvinvointialue as koulutuksen_jarjestajan_hyvinvointialue_fi
	  ,d13.maakunta as koulutuksen_jarjestajan_maakunta_fi

	  ,d3.oppilaitos AS oppilaitos_fi
      ,d3.oppilaitostyyppi AS oppilaitostyyppi_fi
      ,d3.opetuskieli AS oppilaitoksen_opetuskieli_fi
	  ,d3.oppilaitoksen_sijaintikunta AS oppilaitoksen_kunta_fi

	  ,d12.hyvinvointialue as oppilaitoksen_hyvinvointialue_fi
	  ,d12.maakunta as oppilaitoksen_maakunta_fi
	  ,d12.avi as oppilaitoksen_avi_fi
	  ,d12.ely as oppilaitoksen_ely_fi

	  ,d4.rahoitusjarjestelma AS rahoitusjarjestelma_fi

	  ,d5.vuosiselite AS koulutuksen_aloitusvuosi_fi
	  ,d5.lukuvuosikausiselite AS koulutuksen_aloituslukukausi_fi
  
	  ,d6.vuosiselite AS koulutuksen_suoritusvuosi_fi
	  ,d6.lukuvuosikausiselite AS koulutuksen_suorituslukukausi_fi

      ,koulutuksen_pituus_kk AS koulutuksen_kesto_kuukausina_fi
	  ,d7.sukupuoli AS sukupuoli_fi
	  ,d8.ika AS ikaryhma_fi
	  ,d9.aidinkieli_versio1 AS aidinkieli_fi

	  ,d10.maakunta AS asuinmaakunta_fi
	  ,d10.avi AS asuinalueen_avi_fi
      ,d10.ely AS asuinalueen_ely_fi
	  ,d11.maakunta AS tilastovuotta_edeltava_asuinmaakunta_fi
	  ,d11.avi AS tilastovuotta_edeltava_avi_fi
      ,d11.ely AS tilastovuotta_edeltava_ely_fi

	  --ruotsi

	  ,tilastointivuosi AS tilastovuosi_sv
	  ,d2.koulutuksen_jarjestaja_SV AS koulutuksen_jarjestaja_sv
	  ,d2.koulutuksen_jarjestajan_omistajatyyppi_SV AS koulutuksen_jarjestajan_omistajatyyppi_sv
	  ,d2.koulutuksen_jarjestajan_kieli_SV AS koulutuksen_jarjestajan_kieli_sv
	  ,d2.koulutuksen_jarjestajan_sijaintikunta_SV AS koulutuksen_jarjestajan_kunta_sv

	  ,d13.hyvinvointialue_SV as koulutuksen_jarjestajan_hyvinvointialue_sv
	  ,d13.maakunta_SV as koulutuksen_jarjestajan_maakunta_sv

	  ,d3.oppilaitos_SV AS oppilaitos_sv
	  ,d3.oppilaitostyyppi_SV AS oppilaitostyyppi_sv
	  ,d3.opetuskieli_SV AS oppilaitoksen_opetuskieli_sv
	  ,d3.oppilaitoksen_sijaintikunta_SV AS oppilaitoksen_kunta_sv

	  ,d12.hyvinvointialue_SV as oppilaitoksen_hyvinvointialue_sv
	  ,d12.maakunta_SV as oppilaitoksen_maakunta_sv
	  ,d12.avi_SV as oppilaitoksen_avi_sv
	  ,d12.ely_SV as oppilaitoksen_ely_sv

	  ,d4.rahoitusjarjestelma_SV AS rahoitusjarjestelma_sv

	  ,d5.vuosiselite_SV AS koulutuksen_aloitusvuosi_sv
	  ,d5.lukuvuosikausiselite_SV AS koulutuksen_aloituslukukausi_sv

	  ,d6.vuosiselite_SV AS koulutuksen_suoritusvuosi_sv
	  ,d6.lukuvuosikausiselite_SV as koulutuksen_suorituslukukausi_sv

	  ,koulutuksen_pituus_kk AS koulutuksen_kesto_kuukausina_sv
	  ,d7.sukupuoli_SV AS sukupuoli_sv
	  ,d8.ika_SV AS ikaryhma_sv
	  ,d9.aidinkieli_versio1_SV AS aidinkieli_sv

	  ,d10.maakunta_SV AS asuinmaakunta_sv
	  ,d10.avi_SV AS asuinalueen_avi_sv
	  ,d10.ely_SV AS asuinalueen_ely_sv
	  ,d11.maakunta_SV AS tilastovuotta_edeltava_asuinmaakunta_sv
	  ,d11.avi_SV AS tilastovuotta_edeltava_avi_sv
	  ,d11.ely_SV AS tilastovuotta_edeltava_ely_sv

	  --englanti

	  ,[tilastointivuosi] AS tilastovuosi_en
	  ,d2.koulutuksen_jarjestaja_EN AS koulutuksen_jarjestaja_en
	  ,d2.koulutuksen_jarjestajan_omistajatyyppi_EN AS koulutuksen_jarjestajan_omistajatyyppi_en
	  ,d2.koulutuksen_jarjestajan_kieli_EN AS koulutuksen_jarjestajan_kieli_en
	  ,d2.koulutuksen_jarjestajan_sijaintikunta_EN AS koulutuksen_jarjestajan_kunta_en

	  ,d13.hyvinvointialue_EN as koulutuksen_jarjestajan_hyvinvointialue_en
	  ,d13.maakunta_EN as koulutuksen_jarjestajan_maakunta_en

	  ,d3.oppilaitos_EN AS oppilaitos_en
	  ,d3.oppilaitostyyppi_EN AS oppilaitostyyppi_en
	  ,d3.opetuskieli_EN AS oppilaitoksen_opetuskieli_en
	  ,d3.oppilaitoksen_sijaintikunta_EN AS oppilaitoksen_kunta_en

	  ,d12.hyvinvointialue_EN as oppilaitoksen_hyvinvointialue_en
	  ,d12.maakunta_EN as oppilaitoksen_maakunta_en
	  ,d12.avi_EN as oppilaitoksen_avi_en
	  ,d12.ely_EN as oppilaitoksen_ely_en

	  ,d4.rahoitusjarjestelma_EN AS rahoitusjarjestelma_en

	  ,d5.vuosiselite_EN AS koulutuksen_aloitusvuosi_en
	  ,d5.lukuvuosikausiselite_EN AS koulutuksen_aloituslukukausi_en

	  ,d6.vuosiselite_EN AS koulutuksen_suoritusvuosi_en
	  ,d6.lukuvuosikausiselite_EN AS koulutuksen_suorituslukukausi_en

	  ,koulutuksen_pituus_kk AS koulutuksen_kesto_kuukausina_en
	  ,d7.sukupuoli_EN AS sukupuoli_en
	  ,d8.ika_EN AS ikaryhma_en
	  ,d9.aidinkieli_versio1_EN AS aidinkieli_en

	  ,d10.maakunta_EN AS asuinmaakunta_en
	  ,d10.avi_EN AS asuinalueen_avi_en
	  ,d10.ely_EN AS asuinalueen_ely_en
	  ,d11.maakunta_EN AS tilastovuotta_edeltava_asuinmaakunta_en
	  ,d11.avi_EN AS tilastovuotta_edeltava_avi_en
	  ,d11.ely_EN AS tilastovuotta_edeltava_ely_en


      --järjestysmuuttujat

	  ,d2.jarjestys_koulutuksen_jarjestaja
	  ,d2.jarjestys_koulutuksen_jarjestajan_kieli
	  ,d2.jarjestys_sijaintikunta_koulutuksenjarjestaja as jarjestys_koulutuksen_jarjestajan_kunta

	  ,d13.jarjestys_hyvinvointialue as jarjestys_koulutuksen_jarjestajan_hyvinvointialue
	  ,d13.jarjestys_maakunta as jarjestys_koulutuksen_jarjestajan_maakunta

	  ,d3.jarjestys_oppilaitos
	  ,d3.jarjestys_oppilaitostyyppi
	  ,d3.jarjestys_opetuskieli
	  ,d3.jarjestys_sijaintikunta as jarjestys_oppilaitoksen_kunta

	  ,d12.jarjestys_hyvinvointialue as jarjestys_oppilaitoksen_hyvinvointialue
	  ,d12.jarjestys_maakunta as jarjestys_oppilaitoksen_maakunta
	  ,d12.jarjestys_avi as jarjestys_oppilaitoksen_avi
	  ,d12.jarjestys_ely as jarjestys_oppilaitoksen_ely 

	  ,d4.jarjestys AS jarjestys_rahoitusjärjestelmä

	  ,d5.vuosi AS jarjestys_koulutuksen_aloitusvuosi
	  ,d5.lukukausi AS jarjestys_koulutuksen_aloituslukukausi
	  ,d6.vuosi AS jarjestys_koulutuksen_suoritusvuosi
	  ,d6.lukukausi AS jarjestys_koulutuksen_suorituslukukausi

	  ,d7.jarjestys AS jarjestys_sukupuoli
	  ,d8.jarjestys_ika AS jarjestys_ikaryhma
	  ,d9.jarjestys AS jarjestys_aidinkieli

	  ,d10.jarjestys_maakunta AS jarjestys_asuinmaakunta
	  ,d10.jarjestys_avi AS jarjestys_asuinalueen_avi
	  ,d10.jarjestys_ely AS jarjestys_asuinalueen_ely
	  ,d11.jarjestys_maakunta AS jarjestys_tilastovuotta_edeltava_asuinmaakunta
	  ,d11.jarjestys_avi AS jarjestys_tilastovuotta_edeltava_avi
	  ,d11.jarjestys_ely AS jarjestys_tilastovuotta_edeltava_ely

	  --Koodimuuttujat

	  ,d2.koulutuksen_jarjestajakoodi AS koodit_koulutuksen_jarjestaja
	  ,d2.koulutuksen_jarjestajan_kielikoodi AS koodit_koulutuksen_jarjestajan_kieli
	  ,d2.koulutuksen_jarjestajan_ksijaintikuntakoodi AS koodit_koulutuksen_jarjestajan_kunta

	  ,d13.hyvinvointialue_koodi as koodit_koulutuksen_jarjestajan_hyvinvointialue
	  ,d13.maakunta_koodi as koodit_koulutuksen_jarjestajan_maakunta

	  ,d3.oppilaitoskoodi AS koodit_oppilaitos
	  ,d3.oppilaitostyyppikoodi AS koodit_oppilaitostyyppi
	  ,d3.opetuskielikoodi AS koodit_opetuskieli
	  ,d3.sijaintikuntakoodi AS koodit_oppilaitoksen_kunta

	  ,d12.hyvinvointialue_koodi as koodit_oppilaitoksen_hyvinvointialue
	  ,d12.maakunta_koodi as koodit_oppilaitoksen_maakunta
	  ,d12.avi_koodi as koodit_oppilaitoksen_avi
	  ,d12.ely_koodi as koodit_oppilaitoksen_ely

	  ,d4.rahoitusjarjestelma_koodi AS koodit_rahoitusjarjestelma

	  ,d7.sukupuoli_koodi AS koodit_sukupuoli
	  ,d9.aidinkieli_versio1_koodi AS koodit_aidinkieli

	  ,d10.maakunta_koodi AS koodit_asuinmaakunta
	  ,d10.avi_koodi AS koodit_asuinalueen_avi
	  ,d10.ely_koodi AS koodit_asuinalueen_ely
	  ,d11.maakunta_koodi AS koodit_tilastovuotta_edeltava_asuinmaakunta
	  ,d11.avi_koodi AS koodit_tilastovuotta_edeltava_avi_fi
      ,d11.ely_koodi AS koodit_tilastovuotta_edeltava_ely_fi


	  --Lukumäärämuuttujat
	  ,[uusien_lkm]
      ,[osallistuneiden_lkm]
      ,[suorittaneiden_lkm]

  FROM [VipunenTK].[dbo].[f_TUVA_osallistuneet_ja_suorittaneet_2_24] f

  LEFT JOIN VipunenTK..d_lahde d1 ON d1.id = f.lahde_id
  LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot AS d2 ON d2.id = f.koulutuksen_jarjestaja_id
  LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot AS d3 ON d3.id = f.oppilaitos_id

  LEFT JOIN VipunenTK..d_tuva_rahoitusjarjestelma d4 ON d4.id = f.tuva_rahoitusjarjestelma_id
  LEFT JOIN VipunenTK..d_kausi d5 ON d5.kausi_id = f.aloituskausikoodi_id
  LEFT JOIN VipunenTK..d_kausi d6 ON d6.kausi_id = f.suorituskausikoodi_id

  LEFT JOIN VipunenTK..d_sukupuoli  AS d7 ON d7.id = f.sukupuoli_id
  LEFT JOIN VipunenTK..d_ika d8 ON d8.id = f.ikaryhma9_id
  LEFT JOIN VipunenTK..d_aidinkieli_versio1 AS d9 ON d9.id = f.aidinkieli_versio1_id
  LEFT JOIN VipunenTK..d_alueluokitus AS d10 ON d10.id = asuinmaakunta_id
  LEFT JOIN VipunenTK..d_alueluokitus AS d11 ON d11.id = asuinmaakuntax_id

  LEFT JOIN VipunenTK..d_alueluokitus AS d12 ON d12.kunta_koodi = d3.sijaintikuntakoodi
  LEFT JOIN VipunenTK..d_alueluokitus AS d13 ON d13.kunta_koodi = d2.sijaintikuntakoodi

GO


