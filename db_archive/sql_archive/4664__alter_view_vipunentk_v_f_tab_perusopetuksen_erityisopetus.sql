USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_perusopetuksen_erityisopetus]    Script Date: 7.7.2021 13:54:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[v_f_tab_perusopetuksen_erityisopetus] AS
SELECT [Tilastovuosi]
      ,[Oppilaitos] = [Oppilaitos] + ' (' + [Oppilaitoskoodi] + ')'
	  ,[Opetuksen järjestäjä]
	  ,[Oppilaitostyypi]
	  ,[Oppilaitoksen omistajatyyppi]
	  ,[Oppilaitoksen opetuskieli]
	  ,[Oppilaitoksen kunta]
	  ,[Oppilaitoksen maakunta]
      ,[Vuosiluokka]
	  ,[Erityisen tuen päätös]
	  ,[Opetuksen toteutuspaikka]
	  ,[Oppimäärän yksilöllistäminen]
	  ,[Pidennetty oppivelvollisuus]
	  ,[Joustava perusopetus]
	  ,[Kuljetusetuus]
	  ,[Majoitusetuus]
	  ,[Tehostettu tuki]
	  ,[Tukimuoto]
	  ,[Vieraskielisyys]
	  ,[Sukupuoli]
      ,[lkm]
	  ,[Faktataulu]

	  --ruotsi
	  ,[Statistikår]
      ,[Läroanstalt] = [Läroanstalt] + ' (' + [Oppilaitoskoodi] + ')'
	  ,[Utbildningsanordnare]
	  ,[Läroanstaltstyp]
	  ,[Läroanstaltens ägartyp]
	  ,[Läroanstaltens undervisningsspråk]
	  ,[Läroanstaltens kommun] 
	  ,[Läroanstaltens landskap] 
      ,[Åldersklass] 
	  ,[Beslut om särskilt stöd]
	  ,[Undervisning plats]
	  ,[Individualiserad lärokurs]
	  ,[Förlängd läroplikt] 
	  ,[Flexibel grundläggande utbildning]
	  ,[Skolskjuts, förmån] 
	  ,[Inkvarteringsförmån] 
	  ,[Intensifierat stöd] 
	  ,[Form av stöd]
	  ,[Främmande modersmål] 
	  ,[Kön]

	  --englanti
	  ,[Statistical year] 
      ,[Educational institution] = [Educational institution] + ' (' + [Oppilaitoskoodi] + ')'
	  ,[Education provider] 
	  ,[Type of institution] 
	  ,[Type of institution owner] 
	  ,[Language of the institution] 
	  ,[Municipality of the institution] 
	  ,[Region of the institution] 
      ,[Year class] 
	  ,[Resolution on special support] 
	  ,[Teaching location] 
	  ,[Individualization of curriculum] 
	  ,[Extended compulsory ed.] 
	  ,[Flexible basic education] 
	  ,[Transport benefit] 
	  ,[Accommodation benefit] 
	  ,[Intensified support] 
	  ,[Form of support] 
	  ,[Foreign language] 
	  ,[Gender]

	  ,[Oppilaitostyypi jarjestys]
	  ,[Oppilaitoksen omistajatyyppi jarjestys]
	  ,[Oppilaitoksen opetuskieli jarjestys]
	  ,[Oppilaitoksen kunta jarjestys]
	  ,[Oppilaitoksen maakunta jarjestys]
      ,[Vuosiluokka jarjestys]
	  ,[Erityisen tuen päätös jarjestys]
	  ,[Opetuksen toteutuspaikka jarjestys]
	  ,[Oppimäärän yksilöllistäminen jarjestys]
	  ,[Pidennetty oppivelvollisuus jarjestys]
	  ,[Joustava perusopetus jarjestys]
	  ,[Kuljetusetuus jarjestys]
	  ,[Majoitusetuus jarjestys]
	  ,[Tehostettu tuki jarjestys]
	  ,[Tukimuoto jarjestys]
	  ,[Vieraskielisyys jarjestys]
	  ,[Sukupuoli jarjestys]
FROM
(SELECT 
	   [Tilastovuosi] = f.tilv
      ,[Oppilaitos] = d1.oppilaitos, [Oppilaitoskoodi] = d1.oppilaitoskoodi
	  ,[Opetuksen järjestäjä] = d1.koulutuksen_jarjestaja
	  ,[Oppilaitostyypi] = d1.oppilaitostyyppi
	  ,[Oppilaitoksen omistajatyyppi] = d1.oppilaitoksen_omistajatyyppi
	  ,[Oppilaitoksen opetuskieli] = d1.opetuskieli
	  ,[Oppilaitoksen kunta] = d2.kunta
	  ,[Oppilaitoksen maakunta] = d2.maakunta
      ,[Vuosiluokka] = d3.luokkajako_16_79
	  ,[Erityisen tuen päätös] = d4.perusopetuksen_erityisen_tuen_paatos
	  ,[Opetuksen toteutuspaikka] = d5.perusopetuksen_yleisopetuksen_osuus
	  ,[Oppimäärän yksilöllistäminen] = null
	  ,[Pidennetty oppivelvollisuus] = null
	  ,[Joustava perusopetus] = null
	  ,[Kuljetusetuus] = null
	  ,[Majoitusetuus] = null
	  ,[Tehostettu tuki] = null
	  ,[Tukimuoto] = null
	  ,[Vieraskielisyys] = null
	  ,[Sukupuoli] = null
      ,[lkm] = f.erityisen_tuen_oppilaiden_opetus
	  ,[Faktataulu] = 'Opetuksen toteutuspaikka'

	  --ruotsi
	  ,[Statistikår] = f.tilv
      ,[Läroanstalt] = d1.oppilaitos_SV
	  ,[Utbildningsanordnare] = d1.koulutuksen_jarjestaja_SV
	  ,[Läroanstaltstyp] = d1.oppilaitostyyppi_SV
	  ,[Läroanstaltens ägartyp] = d1.oppilaitoksen_omistajatyyppi_SV
	  ,[Läroanstaltens undervisningsspråk] = d1.opetuskieli_SV
	  ,[Läroanstaltens kommun] = d2.kunta_SV
	  ,[Läroanstaltens landskap] = d2.maakunta_SV
      ,[Åldersklass] = d3.luokkajako_16_79_SV
	  ,[Beslut om särskilt stöd] = d4.perusopetuksen_erityisen_tuen_paatos_SV
	  ,[Undervisning plats] = d5.perusopetuksen_yleisopetuksen_osuus_SV
	  ,[Individualiserad lärokurs] = null
	  ,[Förlängd läroplikt] = null
	  ,[Flexibel grundläggande utbildning] = null
	  ,[Skolskjuts, förmån] = null
	  ,[Inkvarteringsförmån] = null
	  ,[Intensifierat stöd] = null
	  ,[Form av stöd] = null
	  ,[Främmande modersmål] = null
	  ,[Kön] = null

	  --englanti
	  ,[Statistical year] = f.tilv
      ,[Educational institution] = d1.oppilaitos_EN
	  ,[Education provider] = d1.koulutuksen_jarjestaja_EN
	  ,[Type of institution] = d1.oppilaitostyyppi_EN
	  ,[Type of institution owner] = d1.oppilaitoksen_omistajatyyppi_EN
	  ,[Language of the institution] = d1.opetuskieli_EN
	  ,[Municipality of the institution] = d2.kunta_EN
	  ,[Region of the institution] = d2.maakunta_EN
      ,[Year class] = d3.luokkajako_16_79_EN
	  ,[Resolution on special support] = d4.perusopetuksen_erityisen_tuen_paatos_EN
	  ,[Teaching location] = d5.perusopetuksen_yleisopetuksen_osuus_EN
	  ,[Individualization of curriculum] = null
	  ,[Extended compulsory ed.] = null
	  ,[Flexible basic education] = null
	  ,[Transport benefit] = null
	  ,[Accommodation benefit] = null
	  ,[Intensified support] = null
	  ,[Form of support] = null
	  ,[Foreign language] = null
	  ,[Gender] = null

	  ,[Oppilaitostyypi jarjestys] = d1.jarjestys_oppilaitostyyppi
	  ,[Oppilaitoksen omistajatyyppi jarjestys] = d1.jarjestys_omistajatyyppi
	  ,[Oppilaitoksen opetuskieli jarjestys] = d1.jarjestys_opetuskieli
	  ,[Oppilaitoksen kunta jarjestys] = d2.kunta
	  ,[Oppilaitoksen maakunta jarjestys] = d2.jarjestys_maakunta
      ,[Vuosiluokka jarjestys] = d3.luokkajako_16_79_jarjestys
	  ,[Erityisen tuen päätös jarjestys] = d4.jarjestys
	  ,[Opetuksen toteutuspaikka jarjestys] = d5.jarjestys
	  ,[Oppimäärän yksilöllistäminen jarjestys] = 99
	  ,[Pidennetty oppivelvollisuus jarjestys] = 99
	  ,[Joustava perusopetus jarjestys] = 99
	  ,[Kuljetusetuus jarjestys] = 99
	  ,[Majoitusetuus jarjestys] = 99
	  ,[Tehostettu tuki jarjestys] = 99
	  ,[Tukimuoto jarjestys] = 99
	  ,[Vieraskielisyys jarjestys] = 99
	  ,[Sukupuoli jarjestys] = 99
  FROM [VipunenTK].[dbo].[f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus] f
  LEFT JOIN dbo.d_oppilaitoksen_taustatiedot d1 on d1.id=f.oppilaitoksen_taustatiedot_id
  LEFT JOIN dbo.d_alueluokitus d2 on d2.id=f.oppilaitoksen_sijainti_id
  LEFT JOIN dbo.d_perusopetuksen_vuosiluokat d3 on d3.id=f.perusopetuksen_vuosiluokat_id
  LEFT JOIN dbo.d_perusopetuksen_erityisen_tuen_paatos d4 on d4.id=f.perusopetuksen_erityisen_tuen_paatos_id
  LEFT JOIN dbo.d_perusopetuksen_yleisopetuksen_osuus d5 on d5.id=f.perusopetuksen_yleisopetuksen_osuus_id

  UNION ALL

  SELECT 
	   [Tilastovuosi] = f.tilv
      ,[Oppilaitos] = d1.oppilaitos, [Oppilaitoskoodi] = d1.oppilaitoskoodi
	  ,[Opetuksen järjestäjä] = d1.koulutuksen_jarjestaja
	  ,[Oppilaitostyypi] = d1.oppilaitostyyppi
	  ,[Oppilaitoksen omistajatyyppi] = d1.oppilaitoksen_omistajatyyppi
	  ,[Oppilaitoksen opetuskieli] = d1.opetuskieli
	  ,[Oppilaitoksen kunta] = d2.kunta
	  ,[Oppilaitoksen maakunta] = d2.maakunta
      ,[Vuosiluokka] = d3.luokkajako_16_79
	  ,[Erityisen tuen päätös] = d4.perusopetuksen_erityisen_tuen_paatos
	  ,[Opetuksen toteutuspaikka] = null
	  ,[Oppimäärän yksilöllistäminen] = d6.perusopetuksen_oppimaaran_yksilollistaminen
	  ,[Pidennetty oppivelvollisuus] = null
	  ,[Joustava perusopetus] = null
	  ,[Kuljetusetuus] = null
	  ,[Majoitusetuus] = null
	  ,[Tehostettu tuki] = null
	  ,[Tukimuoto] = null
	  ,[Vieraskielisyys] = null
	  ,[Sukupuoli] = null
      ,[lkm] = f.erityisen_tuen_oppilaiden_oppimaara
	  ,[Osa] = 'Opetuksen yksilöllistäminen'

	  --ruotsi
	  ,[Statistikår] = f.tilv
      ,[Läroanstalt] = d1.oppilaitos_SV
	  ,[Utbildningsanordnare] = d1.koulutuksen_jarjestaja_SV
	  ,[Läroanstaltstyp] = d1.oppilaitostyyppi_SV
	  ,[Läroanstaltens ägartyp] = d1.oppilaitoksen_omistajatyyppi_SV
	  ,[Läroanstaltens undervisningsspråk] = d1.opetuskieli_SV
	  ,[Läroanstaltens kommun] = d2.kunta_SV
	  ,[Läroanstaltens landskap] = d2.maakunta_SV
      ,[Åldersklass] = d3.luokkajako_16_79_SV
	  ,[Beslut om särskilt stöd] = d4.perusopetuksen_erityisen_tuen_paatos_SV
	  ,[Undervisning plats] = null
	  ,[Individualiserad lärokurs] = d6.perusopetuksen_oppimaaran_yksilollistaminen_SV
	  ,[Förlängd läroplikt] = null
	  ,[Flexibel grundläggande utbildning] = null
	  ,[Skolskjuts, förmån] = null
	  ,[Inkvarteringsförmån] = null
	  ,[Intensifierat stöd] = null
	  ,[Form av stöd] = null
	  ,[Främmande modersmål] = null
	  ,[Kön] = null

	  --englanti
	  ,[Statistical year] = f.tilv
      ,[Educational institution] = d1.oppilaitos_EN
	  ,[Education provider] = d1.koulutuksen_jarjestaja_EN
	  ,[Type of institution] = d1.oppilaitostyyppi_EN
	  ,[Type of institution owner] = d1.oppilaitoksen_omistajatyyppi_EN
	  ,[Language of the institution] = d1.opetuskieli_EN
	  ,[Municipality of the institution] = d2.kunta_EN
	  ,[Region of the institution] = d2.maakunta_EN
      ,[Year class] = d3.luokkajako_16_79_EN
	  ,[Resolution on special support] = d4.perusopetuksen_erityisen_tuen_paatos_EN
	  ,[Teaching location] = null
	  ,[Individualization of curriculum] = d6.perusopetuksen_oppimaaran_yksilollistaminen_EN
	  ,[Extended compulsory ed.] = null
	  ,[Flexible basic education] = null
	  ,[Transport benefit] = null
	  ,[Accommodation benefit] = null
	  ,[Intensified support] = null
	  ,[Form of support] = null
	  ,[Foreign language] = null
	  ,[Gender] = null

	  ,[Oppilaitostyypi jarjestys] = d1.jarjestys_oppilaitostyyppi
	  ,[Oppilaitoksen omistajatyyppi jarjestys] = d1.jarjestys_omistajatyyppi
	  ,[Oppilaitoksen opetuskieli jarjestys] = d1.jarjestys_opetuskieli
	  ,[Oppilaitoksen kunta jarjestys] = d2.kunta
	  ,[Oppilaitoksen maakunta jarjestys] = d2.jarjestys_maakunta
      ,[Vuosiluokka jarjestys] = d3.luokkajako_16_79_jarjestys
	  ,[Erityisen tuen päätös jarjestys] = d4.jarjestys
	  ,[Opetuksen toteutuspaikka jarjestys] = 99
	  ,[Oppimäärän yksilöllistäminen jarjestys] = d6.jarjestys
	  ,[Pidennetty oppivelvollisuus jarjestys] = 99
	  ,[Joustava perusopetus jarjestys] = 99
	  ,[Kuljetusetuus jarjestys] = 99
	  ,[Majoitusetuus jarjestys] = 99
	  ,[Tehostettu tuki jarjestys] = 99
	  ,[Tukimuoto jarjestys] = 99
	  ,[Vieraskielisyys jarjestys] = 99
	  ,[Sukupuoli jarjestys] = 99
  FROM [VipunenTK].[dbo].[f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_oppimaara] f
  LEFT JOIN dbo.d_oppilaitoksen_taustatiedot d1 on d1.id=f.oppilaitoksen_taustatiedot_id
  LEFT JOIN dbo.d_alueluokitus d2 on d2.id=f.oppilaitoksen_sijainti_id
  LEFT JOIN dbo.d_perusopetuksen_vuosiluokat d3 on d3.id=f.perusopetuksen_vuosiluokat_id
  LEFT JOIN dbo.d_perusopetuksen_erityisen_tuen_paatos d4 on d4.id=f.perusopetuksen_erityisen_tuen_paatos_id
  --LEFT JOIN dbo.d_perusopetuksen_yleisopetuksen_osuus d5 on d5.id=f.perusopetuksen_yleisopetuksen_osuus_id
  LEFT JOIN dbo.d_perusopetuksen_oppimaaran_yksilollistaminen d6 on d6.id=f.perusopetuksen_oppimaaran_yksilollistaminen_id

  UNION ALL

    SELECT 
	   [Tilastovuosi] = f.tilv
      ,[Oppilaitos] = d1.oppilaitos, [Oppilaitoskoodi] = d1.oppilaitoskoodi
	  ,[Opetuksen järjestäjä] = d1.koulutuksen_jarjestaja
	  ,[Oppilaitostyypi] = d1.oppilaitostyyppi
	  ,[Oppilaitoksen omistajatyyppi] = d1.oppilaitoksen_omistajatyyppi
	  ,[Oppilaitoksen opetuskieli] = d1.opetuskieli
	  ,[Oppilaitoksen kunta] = d2.kunta
	  ,[Oppilaitoksen maakunta] = d2.maakunta
      ,[Vuosiluokka] = d3.luokkajako_16_79
	  ,[Erityisen tuen päätös] = d4.perusopetuksen_erityisen_tuen_paatos
	  ,[Opetuksen toteutuspaikka] = null
	  ,[Oppimäärän yksilöllistäminen] = null
	  ,[Pidennetty oppivelvollisuus] = d7.perusopetuksen_pidennetty_oppivelvollisuus
	  ,[Joustava perusopetus] = d8.joustava_perusopetus
	  ,[Kuljetusetuus] = null
	  ,[Majoitusetuus] = null
	  ,[Tehostettu tuki] = null
	  ,[Tukimuoto] = null
	  ,[Vieraskielisyys] = null
	  ,[Sukupuoli] = case d11.sukupuoli when 'Mies' then 'Pojat' when 'Nainen' then 'Tytöt' else 'Tuntematon' end
      ,[lkm] = f.jopo_oppilaat
	  ,[Osa] = 'Jopo'

	  --ruotsi
	  ,[Statistikår] = f.tilv
      ,[Läroanstalt] = d1.oppilaitos_SV
	  ,[Utbildningsanordnare] = d1.koulutuksen_jarjestaja_SV
	  ,[Läroanstaltstyp] = d1.oppilaitostyyppi_SV
	  ,[Läroanstaltens ägartyp] = d1.oppilaitoksen_omistajatyyppi_SV
	  ,[Läroanstaltens undervisningsspråk] = d1.opetuskieli_SV
	  ,[Läroanstaltens kommun] = d2.kunta_SV
	  ,[Läroanstaltens landskap] = d2.maakunta_SV
      ,[Åldersklass] = d3.luokkajako_16_79_SV
	  ,[Beslut om särskilt stöd] = d4.perusopetuksen_erityisen_tuen_paatos_SV
	  ,[Undervisning plats] = null
	  ,[Individualiserad lärokurs] = null
	  ,[Förlängd läroplikt] = d7.perusopetuksen_pidennetty_oppivelvollisuus_SV
	  ,[Flexibel grundläggande utbildning] = d8.joustava_perusopetus_SV
	  ,[Skolskjuts, förmån] = null
	  ,[Inkvarteringsförmån] = null
	  ,[Intensifierat stöd] = null
	  ,[Form av stöd] = null
	  ,[Främmande modersmål] = null
	  ,[Kön] = case d11.sukupuoli when 'Mies' then 'Pojkar' when 'Nainen' then 'Flickor' else 'Tuntematon' end

	  --englanti
	  ,[Statistical year] = f.tilv
      ,[Educational institution] = d1.oppilaitos_EN
	  ,[Education provider] = d1.koulutuksen_jarjestaja_EN
	  ,[Type of institution] = d1.oppilaitostyyppi_EN
	  ,[Type of institution owner] = d1.oppilaitoksen_omistajatyyppi_EN
	  ,[Language of the institution] = d1.opetuskieli_EN
	  ,[Municipality of the institution] = d2.kunta_EN
	  ,[Region of the institution] = d2.maakunta_EN
      ,[Year class] = d3.luokkajako_16_79_EN
	  ,[Resolution on special support] = d4.perusopetuksen_erityisen_tuen_paatos_EN
	  ,[Teaching location] = null
	  ,[Individualization of curriculum] = null
	  ,[Extended compulsory ed.] = d7.perusopetuksen_pidennetty_oppivelvollisuus_EN
	  ,[Flexible basic education] = d8.joustava_perusopetus_EN
	  ,[Transport benefit] = null
	  ,[Accommodation benefit] = null
	  ,[Intensified support] = null
	  ,[Form of support] = null
	  ,[Foreign language] = null
	  ,[Gender] = case d11.sukupuoli when 'Mies' then 'Boys' when 'Nainen' then 'Girls' else 'Tuntematon' end

	  ,[Oppilaitostyypi jarjestys] = d1.jarjestys_oppilaitostyyppi
	  ,[Oppilaitoksen omistajatyyppi jarjestys] = d1.jarjestys_omistajatyyppi
	  ,[Oppilaitoksen opetuskieli jarjestys] = d1.jarjestys_opetuskieli
	  ,[Oppilaitoksen kunta jarjestys] = d2.kunta
	  ,[Oppilaitoksen maakunta jarjestys] = d2.jarjestys_maakunta
      ,[Vuosiluokka jarjestys] = d3.luokkajako_16_79_jarjestys
	  ,[Erityisen tuen päätös jarjestys] = d4.jarjestys
	  ,[Opetuksen toteutuspaikka jarjestys] = 99
	  ,[Oppimäärän yksilöllistäminen jarjestys] = 99
	  ,[Pidennetty oppivelvollisuus jarjestys] = d7.jarjestys
	  ,[Joustava perusopetus jarjestys] = d8.jarjestys
	  ,[Kuljetusetuus jarjestys] = 99
	  ,[Majoitusetuus jarjestys] = 99
	  ,[Tehostettu tuki jarjestys] = 99
	  ,[Tukimuoto jarjestys] = 99
	  ,[Vieraskielisyys jarjestys] = 99
	  ,[Sukupuoli jarjestys] = d11.jarjestys
  FROM [VipunenTK].[dbo].[f_Perusasteen_erityisopetus_jopo_oppilaat] f
  LEFT JOIN dbo.d_oppilaitoksen_taustatiedot d1 on d1.id=f.oppilaitoksen_taustatiedot_id
  LEFT JOIN dbo.d_alueluokitus d2 on d2.id=f.oppilaitoksen_sijainti_id
  LEFT JOIN dbo.d_perusopetuksen_vuosiluokat d3 on d3.id=f.perusopetuksen_vuosiluokat_id
  LEFT JOIN dbo.d_perusopetuksen_erityisen_tuen_paatos d4 on d4.id=f.perusopetuksen_erityisen_tuen_paatos_id
  --LEFT JOIN dbo.d_perusopetuksen_yleisopetuksen_osuus d5 on d5.id=f.perusopetuksen_yleisopetuksen_osuus_id
  --LEFT JOIN dbo.d_perusopetuksen_oppimaaran_yksilollistaminen d6 on d6.id=f.perusopetuksen_oppimaaran_yksilollistaminen_id
  LEFT JOIN dbo.d_perusopetuksen_pidennetty_oppivelvollisuus d7 on d7.id=f.perusopetuksen_pidennetty_oppivelvollisuus_id
  LEFT JOIN dbo.d_joustava_perusopetus d8 on d8.id=f.joustava_perusopetus_id
  LEFT JOIN d_sukupuoli d11 on d11.id=f.sukupuoli_id
  where d2.kunta<>'Ulkomaat'
  
  UNION ALL

    SELECT 
	   [Tilastovuosi] = f.tilv
      ,[Oppilaitos] = d1.oppilaitos, [Oppilaitoskoodi] = d1.oppilaitoskoodi
	  ,[Opetuksen järjestäjä] = d1.koulutuksen_jarjestaja
	  ,[Oppilaitostyypi] = d1.oppilaitostyyppi
	  ,[Oppilaitoksen omistajatyyppi] = d1.oppilaitoksen_omistajatyyppi
	  ,[Oppilaitoksen opetuskieli] = d1.opetuskieli
	  ,[Oppilaitoksen kunta] = d2.kunta
	  ,[Oppilaitoksen maakunta] = d2.maakunta
      ,[Vuosiluokka] = d3.luokkajako_0_19_10
	  ,[Erityisen tuen päätös] = d4.perusopetuksen_erityisen_tuen_paatos
	  ,[Opetuksen toteutuspaikka] = null
	  ,[Oppimäärän yksilöllistäminen] = null
	  ,[Pidennetty oppivelvollisuus] = d7.perusopetuksen_pidennetty_oppivelvollisuus
	  ,[Joustava perusopetus] = null
	  ,[Kuljetusetuus] = d9.perusopetuksen_kuljetusetuus
	  ,[Majoitusetuus] = null
	  ,[Tehostettu tuki] = d10.perusopetuksen_tehostettu_tuki
	  ,[Tukimuoto] = null
	  ,[Vieraskielisyys] = null
	  ,[Sukupuoli] = null
      ,[lkm] = f.kuljetusetuutta_saavat_oppilaat
	  ,[Osa] = 'Kuljetusetuus'

	  --ruotsi
	  ,[Statistikår] = f.tilv
      ,[Läroanstalt] = d1.oppilaitos_SV
	  ,[Utbildningsanordnare] = d1.koulutuksen_jarjestaja_SV
	  ,[Läroanstaltstyp] = d1.oppilaitostyyppi_SV
	  ,[Läroanstaltens ägartyp] = d1.oppilaitoksen_omistajatyyppi_SV
	  ,[Läroanstaltens undervisningsspråk] = d1.opetuskieli_SV
	  ,[Läroanstaltens kommun] = d2.kunta_SV
	  ,[Läroanstaltens landskap] = d2.maakunta_SV
      ,[Åldersklass] = d3.luokkajako_0_19_10_SV
	  ,[Beslut om särskilt stöd] = d4.perusopetuksen_erityisen_tuen_paatos_SV
	  ,[Undervisning plats] = null
	  ,[Individualiserad lärokurs] = null
	  ,[Förlängd läroplikt] = d7.perusopetuksen_pidennetty_oppivelvollisuus_SV
	  ,[Flexibel grundläggande utbildning] = null
	  ,[Skolskjuts, förmån] = d9.perusopetuksen_kuljetusetuus_SV
	  ,[Inkvarteringsförmån] = null
	  ,[Intensifierat stöd] = d10.perusopetuksen_tehostettu_tuki_SV
	  ,[Form av stöd] = null
	  ,[Främmande modersmål] = null
	  ,[Kön] = null

	  --englanti
	  ,[Statistical year] = f.tilv
      ,[Educational institution] = d1.oppilaitos_EN
	  ,[Education provider] = d1.koulutuksen_jarjestaja_EN
	  ,[Type of institution] = d1.oppilaitostyyppi_EN
	  ,[Type of institution owner] = d1.oppilaitoksen_omistajatyyppi_EN
	  ,[Language of the institution] = d1.opetuskieli_EN
	  ,[Municipality of the institution] = d2.kunta_EN
	  ,[Region of the institution] = d2.maakunta_EN
      ,[Year class] = d3.luokkajako_0_19_10_EN
	  ,[Resolution on special support] = d4.perusopetuksen_erityisen_tuen_paatos_EN
	  ,[Teaching location] = null
	  ,[Individualization of curriculum] = null
	  ,[Extended compulsory ed.] = d7.perusopetuksen_pidennetty_oppivelvollisuus_EN
	  ,[Flexible basic education] = null
	  ,[Transport benefit] = d9.perusopetuksen_kuljetusetuus_EN
	  ,[Accommodation benefit] = null
	  ,[Intensified support] = d10.perusopetuksen_tehostettu_tuki_EN
	  ,[Form of support] = null
	  ,[Foreign language] = null
	  ,[Gender] = null

	  ,[Oppilaitostyypi jarjestys] = d1.jarjestys_oppilaitostyyppi
	  ,[Oppilaitoksen omistajatyyppi jarjestys] = d1.jarjestys_omistajatyyppi
	  ,[Oppilaitoksen opetuskieli jarjestys] = d1.jarjestys_opetuskieli
	  ,[Oppilaitoksen kunta jarjestys] = d2.kunta
	  ,[Oppilaitoksen maakunta jarjestys] = d2.jarjestys_maakunta
      ,[Vuosiluokka jarjestys] = d3.luokkajako_0_19_10_jarjestys
	  ,[Erityisen tuen päätös jarjestys] = d4.jarjestys
	  ,[Opetuksen toteutuspaikka jarjestys] = 99
	  ,[Oppimäärän yksilöllistäminen jarjestys] = 99
	  ,[Pidennetty oppivelvollisuus jarjestys] = d7.jarjestys
	  ,[Joustava perusopetus jarjestys] = 99
	  ,[Kuljetusetuus jarjestys] = d9.jarjestys
	  ,[Majoitusetuus jarjestys] = 99
	  ,[Tehostettu tuki jarjestys] = d10.jarjestys
	  ,[Tukimuoto jarjestys] = 99
	  ,[Vieraskielisyys jarjestys] = 99
	  ,[Sukupuoli jarjestys] = 99
  FROM [VipunenTK].[dbo].[f_Perusasteen_erityisopetus_kuljetusetuutta_saavien_oppilaiden_lkm] f
  LEFT JOIN dbo.d_oppilaitoksen_taustatiedot d1 on d1.id=f.oppilaitoksen_taustatiedot_id
  LEFT JOIN dbo.d_alueluokitus d2 on d2.id=f.oppilaitoksen_sijainti_id
  LEFT JOIN dbo.d_perusopetuksen_vuosiluokat d3 on d3.id=f.perusopetuksen_vuosiluokat_id
  LEFT JOIN dbo.d_perusopetuksen_erityisen_tuen_paatos d4 on d4.id=f.perusopetuksen_erityisen_tuen_paatos_id
  --LEFT JOIN dbo.d_perusopetuksen_yleisopetuksen_osuus d5 on d5.id=f.perusopetuksen_yleisopetuksen_osuus_id
  --LEFT JOIN dbo.d_perusopetuksen_oppimaaran_yksilollistaminen d6 on d6.id=f.perusopetuksen_oppimaaran_yksilollistaminen_id
  LEFT JOIN dbo.d_perusopetuksen_pidennetty_oppivelvollisuus d7 on d7.id=f.perusopetuksen_pidennetty_oppivelvollisuus_id
  --LEFT JOIN dbo.d_joustava_perusopetus d8 on d8.id=f.joustava_perusopetus_id
  LEFT JOIN dbo.d_perusopetuksen_kuljetusetuus d9 on d9.id=f.perusopetuksen_kuljetusetuus_id
  LEFT JOIN dbo.d_perusopetuksen_tehostettu_tuki d10 on d10.id=f.perusopetuksen_tehostettu_tuki_id
  where d2.kunta<>'Ulkomaat'
    
  UNION ALL

    SELECT 
	   [Tilastovuosi] = f.tilv
      ,[Oppilaitos] = d1.oppilaitos, [Oppilaitoskoodi] = d1.oppilaitoskoodi
	  ,[Opetuksen järjestäjä] = d1.koulutuksen_jarjestaja
	  ,[Oppilaitostyypi] = d1.oppilaitostyyppi
	  ,[Oppilaitoksen omistajatyyppi] = d1.oppilaitoksen_omistajatyyppi
	  ,[Oppilaitoksen opetuskieli] = d1.opetuskieli
	  ,[Oppilaitoksen kunta] = d2.kunta
	  ,[Oppilaitoksen maakunta] = d2.maakunta
      ,[Vuosiluokka] = d3.luokkajako_0_19_10
	  ,[Erityisen tuen päätös] = d4.perusopetuksen_erityisen_tuen_paatos
	  ,[Opetuksen toteutuspaikka] = null
	  ,[Oppimäärän yksilöllistäminen] = null
	  ,[Pidennetty oppivelvollisuus] = d7.perusopetuksen_pidennetty_oppivelvollisuus
	  ,[Joustava perusopetus] = null
	  ,[Kuljetusetuus] = null
	  ,[Majoitusetuus] = d9.perusopetuksen_majoitusetuus
	  ,[Tehostettu tuki] = d10.perusopetuksen_tehostettu_tuki
	  ,[Tukimuoto] = null
	  ,[Vieraskielisyys] = null
	  ,[Sukupuoli] = null
      ,[lkm] = f.majoitusetuutta_saavat_oppilaat
	  ,[Osa] = 'Majoitusetuus'

	  --ruotsi
	  ,[Statistikår] = f.tilv
      ,[Läroanstalt] = d1.oppilaitos_SV
	  ,[Utbildningsanordnare] = d1.koulutuksen_jarjestaja_SV
	  ,[Läroanstaltstyp] = d1.oppilaitostyyppi_SV
	  ,[Läroanstaltens ägartyp] = d1.oppilaitoksen_omistajatyyppi_SV
	  ,[Läroanstaltens undervisningsspråk] = d1.opetuskieli_SV
	  ,[Läroanstaltens kommun] = d2.kunta_SV
	  ,[Läroanstaltens landskap] = d2.maakunta_SV
      ,[Åldersklass] = d3.luokkajako_0_19_10_SV
	  ,[Beslut om särskilt stöd] = d4.perusopetuksen_erityisen_tuen_paatos_SV
	  ,[Undervisning plats] = null
	  ,[Individualiserad lärokurs] = null
	  ,[Förlängd läroplikt] = d7.perusopetuksen_pidennetty_oppivelvollisuus_SV
	  ,[Flexibel grundläggande utbildning] = null
	  ,[Skolskjuts, förmån] = null
	  ,[Inkvarteringsförmån] = d9.perusopetuksen_majoitusetuus_SV
	  ,[Intensifierat stöd] = d10.perusopetuksen_tehostettu_tuki_SV
	  ,[Form av stöd] = null
	  ,[Främmande modersmål] = null
	  ,[Kön] = null

	  --englanti
	  ,[Statistical year] = f.tilv
      ,[Educational institution] = d1.oppilaitos_EN
	  ,[Education provider] = d1.koulutuksen_jarjestaja_EN
	  ,[Type of institution] = d1.oppilaitostyyppi_EN
	  ,[Type of institution owner] = d1.oppilaitoksen_omistajatyyppi_EN
	  ,[Language of the institution] = d1.opetuskieli_EN
	  ,[Municipality of the institution] = d2.kunta_EN
	  ,[Region of the institution] = d2.maakunta_EN
      ,[Year class] = d3.luokkajako_0_19_10_EN
	  ,[Resolution on special support] = d4.perusopetuksen_erityisen_tuen_paatos_EN
	  ,[Teaching location] = null
	  ,[Individualization of curriculum] = null
	  ,[Extended compulsory ed.] = d7.perusopetuksen_pidennetty_oppivelvollisuus_EN
	  ,[Flexible basic education] = null
	  ,[Transport benefit] = null
	  ,[Accommodation benefit] = d9.perusopetuksen_majoitusetuus_EN
	  ,[Intensified support] = d10.perusopetuksen_tehostettu_tuki_EN
	  ,[Form of support] = null
	  ,[Foreign language] = null
	  ,[Gender] = null

	  ,[Oppilaitostyypi jarjestys] = d1.jarjestys_oppilaitostyyppi
	  ,[Oppilaitoksen omistajatyyppi jarjestys] = d1.jarjestys_omistajatyyppi
	  ,[Oppilaitoksen opetuskieli jarjestys] = d1.jarjestys_opetuskieli
	  ,[Oppilaitoksen kunta jarjestys] = d2.kunta
	  ,[Oppilaitoksen maakunta jarjestys] = d2.jarjestys_maakunta
      ,[Vuosiluokka jarjestys] = d3.luokkajako_0_19_10_jarjestys
	  ,[Erityisen tuen päätös jarjestys] = d4.jarjestys
	  ,[Opetuksen toteutuspaikka jarjestys] = 99
	  ,[Oppimäärän yksilöllistäminen jarjestys] = 99
	  ,[Pidennetty oppivelvollisuus jarjestys] = d7.jarjestys
	  ,[Joustava perusopetus jarjestys] = 99
	  ,[Kuljetusetuus jarjestys] = 99
	  ,[Majoitusetuus jarjestys] = d9.jarjestys
	  ,[Tehostettu tuki jarjestys] = d10.jarjestys
	  ,[Tukimuoto jarjestys] = 99
	  ,[Vieraskielisyys jarjestys] = 99
	  ,[Sukupuoli jarjestys] = 99
  FROM [VipunenTK].[dbo].[f_Perusasteen_erityisopetus_majoitusetuutta_saavien_oppilaiden_lkm] f
  LEFT JOIN dbo.d_oppilaitoksen_taustatiedot d1 on d1.id=f.oppilaitoksen_taustatiedot_id
  LEFT JOIN dbo.d_alueluokitus d2 on d2.id=f.oppilaitoksen_sijainti_id
  LEFT JOIN dbo.d_perusopetuksen_vuosiluokat d3 on d3.id=f.perusopetuksen_vuosiluokat_id
  LEFT JOIN dbo.d_perusopetuksen_erityisen_tuen_paatos d4 on d4.id=f.perusopetuksen_erityisen_tuen_paatos_id
  --LEFT JOIN dbo.d_perusopetuksen_yleisopetuksen_osuus d5 on d5.id=f.perusopetuksen_yleisopetuksen_osuus_id
  --LEFT JOIN dbo.d_perusopetuksen_oppimaaran_yksilollistaminen d6 on d6.id=f.perusopetuksen_oppimaaran_yksilollistaminen_id
  LEFT JOIN dbo.d_perusopetuksen_pidennetty_oppivelvollisuus d7 on d7.id=f.perusopetuksen_pidennetty_oppivelvollisuus_id
  --LEFT JOIN dbo.d_joustava_perusopetus d8 on d8.id=f.joustava_perusopetus_id
  LEFT JOIN dbo.d_perusopetuksen_majoitusetuus d9 on d9.id=f.perusopetuksen_majoitusetuus_id
  LEFT JOIN dbo.d_perusopetuksen_tehostettu_tuki d10 on d10.id=f.perusopetuksen_tehostettu_tuki_id
  where d2.kunta<>'Ulkomaat'

  UNION ALL

    SELECT 
	   [Tilastovuosi] = f.tilv
      ,[Oppilaitos] = d1.oppilaitos, [Oppilaitoskoodi] = d1.oppilaitoskoodi
	  ,[Opetuksen järjestäjä] = d1.koulutuksen_jarjestaja
	  ,[Oppilaitostyypi] = d1.oppilaitostyyppi
	  ,[Oppilaitoksen omistajatyyppi] = d1.oppilaitoksen_omistajatyyppi
	  ,[Oppilaitoksen opetuskieli] = d1.opetuskieli
	  ,[Oppilaitoksen kunta] = d2.kunta
	  ,[Oppilaitoksen maakunta] = d2.maakunta
      ,[Vuosiluokka] = d3.luokkajako_0_19_10
	  ,[Erityisen tuen päätös] = null
	  ,[Opetuksen toteutuspaikka] = null
	  ,[Oppimäärän yksilöllistäminen] = null
	  ,[Pidennetty oppivelvollisuus] = null
	  ,[Joustava perusopetus] = null
	  ,[Kuljetusetuus] = null
	  ,[Majoitusetuus] = null
	  ,[Tehostettu tuki] = null
	  ,[Tukimuoto] = null
	  ,[Vieraskielisyys] = null
	  ,[Sukupuoli] = case d11.sukupuoli when 'Mies' then 'Pojat' when 'Nainen' then 'Tytöt' else 'Tuntematon' end
      ,[lkm] = f.oppilaiden_lkm
	  ,[Osa] = 'Oppilaat'

	  --ruotsi
	  ,[Statistikår] = f.tilv
      ,[Läroanstalt] = d1.oppilaitos_SV
	  ,[Utbildningsanordnare] = d1.koulutuksen_jarjestaja_SV
	  ,[Läroanstaltstyp] = d1.oppilaitostyyppi_SV
	  ,[Läroanstaltens ägartyp] = d1.oppilaitoksen_omistajatyyppi_SV
	  ,[Läroanstaltens undervisningsspråk] = d1.opetuskieli_SV
	  ,[Läroanstaltens kommun] = d2.kunta_SV
	  ,[Läroanstaltens landskap] = d2.maakunta_SV
      ,[Åldersklass] = d3.luokkajako_0_19_10_SV
	  ,[Beslut om särskilt stöd] = null
	  ,[Undervisning plats] = null
	  ,[Individualiserad lärokurs] = null
	  ,[Förlängd läroplikt] = null
	  ,[Flexibel grundläggande utbildning] = null
	  ,[Skolskjuts, förmån] = null
	  ,[Inkvarteringsförmån] = null
	  ,[Intensifierat stöd] = null
	  ,[Form av stöd] = null
	  ,[Främmande modersmål] = null
	  ,[Kön] = case d11.sukupuoli when 'Mies' then 'Pojkar' when 'Nainen' then 'Flickor' else 'Tuntematon' end

	  --englanti
	  ,[Statistical year] = f.tilv
      ,[Educational institution] = d1.oppilaitos_EN
	  ,[Education provider] = d1.koulutuksen_jarjestaja_EN
	  ,[Type of institution] = d1.oppilaitostyyppi_EN
	  ,[Type of institution owner] = d1.oppilaitoksen_omistajatyyppi_EN
	  ,[Language of the institution] = d1.opetuskieli_EN
	  ,[Municipality of the institution] = d2.kunta_EN
	  ,[Region of the institution] = d2.maakunta_EN
      ,[Year class] = d3.luokkajako_0_19_10_EN
	  ,[Resolution on special support] = null
	  ,[Teaching location] = null
	  ,[Individualization of curriculum] = null
	  ,[Extended compulsory ed.] = null
	  ,[Flexible basic education] = null
	  ,[Transport benefit] = null
	  ,[Accommodation benefit] = null
	  ,[Intensified support] = null
	  ,[Form of support] = null
	  ,[Foreign language] = null
	  ,[Gender] = case d11.sukupuoli when 'Mies' then 'Boys' when 'Nainen' then 'Girls' else 'Tuntematon' end

	  ,[Oppilaitostyypi jarjestys] = d1.jarjestys_oppilaitostyyppi
	  ,[Oppilaitoksen omistajatyyppi jarjestys] = d1.jarjestys_omistajatyyppi
	  ,[Oppilaitoksen opetuskieli jarjestys] = d1.jarjestys_opetuskieli
	  ,[Oppilaitoksen kunta jarjestys] = d2.kunta
	  ,[Oppilaitoksen maakunta jarjestys] = d2.jarjestys_maakunta
      ,[Vuosiluokka jarjestys] = d3.luokkajako_0_19_10_jarjestys
	  ,[Erityisen tuen päätös jarjestys] = 99
	  ,[Opetuksen toteutuspaikka jarjestys] = 99
	  ,[Oppimäärän yksilöllistäminen jarjestys] = 99
	  ,[Pidennetty oppivelvollisuus jarjestys] = 99
	  ,[Joustava perusopetus jarjestys] = 99
	  ,[Kuljetusetuus jarjestys] = 99
	  ,[Majoitusetuus jarjestys] = 99
	  ,[Tehostettu tuki jarjestys] = 99
	  ,[Tukimuoto jarjestys] = 99
	  ,[Vieraskielisyys jarjestys] = 99
	  ,[Sukupuoli jarjestys] = d11.jarjestys
  FROM [VipunenTK].[dbo].[f_Perusasteen_erityisopetus_oppilaiden_lkm] f
  LEFT JOIN dbo.d_oppilaitoksen_taustatiedot d1 on d1.id=f.oppilaitoksen_taustatiedot_id
  LEFT JOIN dbo.d_alueluokitus d2 on d2.id=f.oppilaitoksen_sijainti_id
  LEFT JOIN dbo.d_perusopetuksen_vuosiluokat d3 on d3.id=f.perusopetuksen_vuosiluokat_id
  --LEFT JOIN dbo.d_perusopetuksen_erityisen_tuen_paatos d4 on d4.id=f.perusopetuksen_erityisen_tuen_paatos_id
  --LEFT JOIN dbo.d_perusopetuksen_yleisopetuksen_osuus d5 on d5.id=f.perusopetuksen_yleisopetuksen_osuus_id
  --LEFT JOIN dbo.d_perusopetuksen_oppimaaran_yksilollistaminen d6 on d6.id=f.perusopetuksen_oppimaaran_yksilollistaminen_id
  --LEFT JOIN dbo.d_perusopetuksen_oppimaaran_yksilollistaminen d7 on d7.id=f.perusopetuksen_pidennetty_oppivelvollisuus_id
  --LEFT JOIN dbo.d_joustava_perusopetus d8 on d8.id=f.joustava_perusopetus_id
  --LEFT JOIN dbo.d_perusopetuksen_majoitusetuus d9 on d9.id=f.perusopetuksen_majoitusetuus_id
  --LEFT JOIN dbo.d_perusopetuksen_tehostettu_tuki d10 on d10.id=f.perusopetuksen_tehostettu_tuki_id
  LEFT JOIN d_sukupuoli d11 on d11.id=f.sukupuoli_id
  
  UNION ALL

    SELECT 
	   [Tilastovuosi] = f.tilv
      ,[Oppilaitos] = d1.oppilaitos, [Oppilaitoskoodi] = d1.oppilaitoskoodi
	  ,[Opetuksen järjestäjä] = d1.koulutuksen_jarjestaja
	  ,[Oppilaitostyypi] = d1.oppilaitostyyppi
	  ,[Oppilaitoksen omistajatyyppi] = d1.oppilaitoksen_omistajatyyppi
	  ,[Oppilaitoksen opetuskieli] = d1.opetuskieli
	  ,[Oppilaitoksen kunta] = d2.kunta
	  ,[Oppilaitoksen maakunta] = d2.maakunta
      ,[Vuosiluokka] = case when f.tilv < 2020 then d3.vuosiluokka else d3.luokkajako_16_79 end
	  ,[Erityisen tuen päätös] = d4.perusopetuksen_erityisen_tuen_paatos
	  ,[Opetuksen toteutuspaikka] = null
	  ,[Oppimäärän yksilöllistäminen] = null
	  ,[Pidennetty oppivelvollisuus] = d7.perusopetuksen_pidennetty_oppivelvollisuus
	  ,[Joustava perusopetus] = null
	  ,[Kuljetusetuus] = null
	  ,[Majoitusetuus] = null
	  ,[Tehostettu tuki] = d10.perusopetuksen_tehostettu_tuki
	  ,[Tukimuoto] = null
	  ,[Vieraskielisyys] = null
	  ,[Sukupuoli] = case d11.sukupuoli when 'Mies' then 'Pojat' when 'Nainen' then 'Tytöt' else 'Tuntematon' end
      ,[lkm] = f.tehostetun_tuen_oppilaat
	  ,[Osa] = 'Tehostettu tuki'

	  --ruotsi
	  ,[Statistikår] = f.tilv
      ,[Läroanstalt] = d1.oppilaitos_SV
	  ,[Utbildningsanordnare] = d1.koulutuksen_jarjestaja_SV
	  ,[Läroanstaltstyp] = d1.oppilaitostyyppi_SV
	  ,[Läroanstaltens ägartyp] = d1.oppilaitoksen_omistajatyyppi_SV
	  ,[Läroanstaltens undervisningsspråk] = d1.opetuskieli_SV
	  ,[Läroanstaltens kommun] = d2.kunta_SV
	  ,[Läroanstaltens landskap] = d2.maakunta_SV
      ,[Åldersklass] = case when f.tilv < 2020 then d3.vuosiluokka_SV else d3.luokkajako_16_79_SV end
	  ,[Beslut om särskilt stöd] = d4.perusopetuksen_erityisen_tuen_paatos_SV
	  ,[Undervisning plats] = null
	  ,[Individualiserad lärokurs] = null
	  ,[Förlängd läroplikt] = d7.perusopetuksen_pidennetty_oppivelvollisuus_SV
	  ,[Flexibel grundläggande utbildning] = null
	  ,[Skolskjuts, förmån] = null
	  ,[Inkvarteringsförmån] = null
	  ,[Intensifierat stöd] = d10.perusopetuksen_tehostettu_tuki_SV
	  ,[Form av stöd] = null
	  ,[Främmande modersmål] = null
	  ,[Kön] = case d11.sukupuoli when 'Mies' then 'Pojkar' when 'Nainen' then 'Flickor' else 'Tuntematon' end

	  --englanti
	  ,[Statistical year] = f.tilv
      ,[Educational institution] = d1.oppilaitos_EN
	  ,[Education provider] = d1.koulutuksen_jarjestaja_EN
	  ,[Type of institution] = d1.oppilaitostyyppi_EN
	  ,[Type of institution owner] = d1.oppilaitoksen_omistajatyyppi_EN
	  ,[Language of the institution] = d1.opetuskieli_EN
	  ,[Municipality of the institution] = d2.kunta_EN
	  ,[Region of the institution] = d2.maakunta_EN
      ,[Year class] = case when f.tilv < 2020 then d3.vuosiluokka_EN else d3.luokkajako_16_79_EN end
	  ,[Resolution on special support] = d4.perusopetuksen_erityisen_tuen_paatos_EN
	  ,[Teaching location] = null
	  ,[Individualization of curriculum] = null
	  ,[Extended compulsory ed.] = d7.perusopetuksen_pidennetty_oppivelvollisuus_EN
	  ,[Flexible basic education] = null
	  ,[Transport benefit] = null
	  ,[Accommodation benefit] = null
	  ,[Intensified support] = d10.perusopetuksen_tehostettu_tuki_EN
	  ,[Form of support] = null
	  ,[Foreign language] = null
	  ,[Gender] = case d11.sukupuoli when 'Mies' then 'Boys' when 'Nainen' then 'Girls' else 'Tuntematon' end

	  ,[Oppilaitostyypi jarjestys] = d1.jarjestys_oppilaitostyyppi
	  ,[Oppilaitoksen omistajatyyppi jarjestys] = d1.jarjestys_omistajatyyppi
	  ,[Oppilaitoksen opetuskieli jarjestys] = d1.jarjestys_opetuskieli
	  ,[Oppilaitoksen kunta jarjestys] = d2.kunta
	  ,[Oppilaitoksen maakunta jarjestys] = d2.jarjestys_maakunta
      ,[Vuosiluokka jarjestys] = d3.jarjestys
	  ,[Erityisen tuen päätös jarjestys] = d4.jarjestys
	  ,[Opetuksen toteutuspaikka jarjestys] = 99
	  ,[Oppimäärän yksilöllistäminen jarjestys] = 99
	  ,[Pidennetty oppivelvollisuus jarjestys] = d7.jarjestys
	  ,[Joustava perusopetus jarjestys] = 99
	  ,[Kuljetusetuus jarjestys] = 99
	  ,[Majoitusetuus jarjestys] = 99
	  ,[Tehostettu tuki jarjestys] = d10.jarjestys
	  ,[Tukimuoto jarjestys] = 99
	  ,[Vieraskielisyys jarjestys] = 99
	  ,[Sukupuoli jarjestys] = d11.jarjestys
  FROM [VipunenTK].[dbo].[f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm] f
  LEFT JOIN dbo.d_oppilaitoksen_taustatiedot d1 on d1.id=f.oppilaitoksen_taustatiedot_id
  LEFT JOIN dbo.d_alueluokitus d2 on d2.id=f.oppilaitoksen_sijainti_id
  LEFT JOIN dbo.d_perusopetuksen_vuosiluokat d3 on d3.id=f.perusopetuksen_vuosiluokat_id
  LEFT JOIN dbo.d_perusopetuksen_erityisen_tuen_paatos d4 on d4.id=f.perusopetuksen_erityisen_tuen_paatos_id
  --LEFT JOIN dbo.d_perusopetuksen_yleisopetuksen_osuus d5 on d5.id=f.perusopetuksen_yleisopetuksen_osuus_id
  --LEFT JOIN dbo.d_perusopetuksen_oppimaaran_yksilollistaminen d6 on d6.id=f.perusopetuksen_oppimaaran_yksilollistaminen_id
  LEFT JOIN dbo.d_perusopetuksen_pidennetty_oppivelvollisuus d7 on d7.id=f.perusopetuksen_pidennetty_oppivelvollisuus_id
  --LEFT JOIN dbo.d_joustava_perusopetus d8 on d8.id=f.joustava_perusopetus_id
  --LEFT JOIN dbo.d_perusopetuksen_majoitusetuus d9 on d9.id=f.perusopetuksen_majoitusetuus_id
  LEFT JOIN dbo.d_perusopetuksen_tehostettu_tuki d10 on d10.id=f.perusopetuksen_tehostettu_tuki_id
  LEFT JOIN d_sukupuoli d11 on d11.id=f.sukupuoli_id
  where f.tehostetun_tuen_oppilaat<>0 and f.tehostetun_tuen_oppilaat is not null
   
  UNION ALL

    SELECT 
	   [Tilastovuosi] = f.tilv
      ,[Oppilaitos] = d1.oppilaitos, [Oppilaitoskoodi] = d1.oppilaitoskoodi
	  ,[Opetuksen järjestäjä] = d1.koulutuksen_jarjestaja
	  ,[Oppilaitostyypi] = d1.oppilaitostyyppi
	  ,[Oppilaitoksen omistajatyyppi] = d1.oppilaitoksen_omistajatyyppi
	  ,[Oppilaitoksen opetuskieli] = d1.opetuskieli
	  ,[Oppilaitoksen kunta] = d2.kunta
	  ,[Oppilaitoksen maakunta] = d2.maakunta
      ,[Vuosiluokka] = null
	  ,[Erityisen tuen päätös] = d4.perusopetuksen_erityisen_tuen_paatos
	  ,[Opetuksen toteutuspaikka] = null
	  ,[Oppimäärän yksilöllistäminen] = null
	  ,[Pidennetty oppivelvollisuus] = null
	  ,[Joustava perusopetus] = null
	  ,[Kuljetusetuus] = null
	  ,[Majoitusetuus] = null
	  ,[Tehostettu tuki] = d10.perusopetuksen_tehostettu_tuki
	  ,[Tukimuoto] = d12.perusopetuksen_tukimuoto
	  ,[Vieraskielisyys] = null
	  ,[Sukupuoli] = null
      ,[lkm] = f.tukea_saavat_oppilaat
	  ,[Osa] = 'Tukea saavat'

	  --ruotsi
	  ,[Statistikår] = f.tilv
      ,[Läroanstalt] = d1.oppilaitos_SV
	  ,[Utbildningsanordnare] = d1.koulutuksen_jarjestaja_SV
	  ,[Läroanstaltstyp] = d1.oppilaitostyyppi_SV
	  ,[Läroanstaltens ägartyp] = d1.oppilaitoksen_omistajatyyppi_SV
	  ,[Läroanstaltens undervisningsspråk] = d1.opetuskieli_SV
	  ,[Läroanstaltens kommun] = d2.kunta_SV
	  ,[Läroanstaltens landskap] = d2.maakunta_SV
      ,[Åldersklass] = null
	  ,[Beslut om särskilt stöd] = d4.perusopetuksen_erityisen_tuen_paatos_SV
	  ,[Undervisning plats] = null
	  ,[Individualiserad lärokurs] = null
	  ,[Förlängd läroplikt] = null
	  ,[Flexibel grundläggande utbildning] = null
	  ,[Skolskjuts, förmån] = null
	  ,[Inkvarteringsförmån] = null
	  ,[Intensifierat stöd] = d10.perusopetuksen_tehostettu_tuki_SV
	  ,[Form av stöd] = d12.perusopetuksen_tukimuoto_SV
	  ,[Främmande modersmål] = null
	  ,[Kön] = null

	  --englanti
	  ,[Statistical year] = f.tilv
      ,[Educational institution] = d1.oppilaitos_EN
	  ,[Education provider] = d1.koulutuksen_jarjestaja_EN
	  ,[Type of institution] = d1.oppilaitostyyppi_EN
	  ,[Type of institution owner] = d1.oppilaitoksen_omistajatyyppi_EN
	  ,[Language of the institution] = d1.opetuskieli_EN
	  ,[Municipality of the institution] = d2.kunta_EN
	  ,[Region of the institution] = d2.maakunta_EN
      ,[Year class] = null
	  ,[Resolution on special support] = d4.perusopetuksen_erityisen_tuen_paatos_EN
	  ,[Teaching location] = null
	  ,[Individualization of curriculum] = null
	  ,[Extended compulsory ed.] = null
	  ,[Flexible basic education] = null
	  ,[Transport benefit] = null
	  ,[Accommodation benefit] = null
	  ,[Intensified support] = d10.perusopetuksen_tehostettu_tuki_EN
	  ,[Form of support] = d12.perusopetuksen_tukimuoto_EN
	  ,[Foreign language] = null
	  ,[Gender] = null

	  ,[Oppilaitostyypi jarjestys] = d1.jarjestys_oppilaitostyyppi
	  ,[Oppilaitoksen omistajatyyppi jarjestys] = d1.jarjestys_omistajatyyppi
	  ,[Oppilaitoksen opetuskieli jarjestys] = d1.jarjestys_opetuskieli
	  ,[Oppilaitoksen kunta jarjestys] = d2.kunta
	  ,[Oppilaitoksen maakunta jarjestys] = d2.jarjestys_maakunta
      ,[Vuosiluokka jarjestys] = 99
	  ,[Erityisen tuen päätös jarjestys] = d4.jarjestys
	  ,[Opetuksen toteutuspaikka jarjestys] = 99
	  ,[Oppimäärän yksilöllistäminen jarjestys] = 99
	  ,[Pidennetty oppivelvollisuus jarjestys] = 99
	  ,[Joustava perusopetus jarjestys] = 99
	  ,[Kuljetusetuus jarjestys] = 99
	  ,[Majoitusetuus jarjestys] = 99
	  ,[Tehostettu tuki jarjestys] = d10.jarjestys
	  ,[Tukimuoto jarjestys] = d12.jarjestys
	  ,[Vieraskielisyys jarjestys] = 99
	  ,[Sukupuoli jarjestys] = 99
  FROM [VipunenTK].[dbo].[f_Perusasteen_erityisopetus_tukea_saavien_oppilaiden_lkm] f
  LEFT JOIN dbo.d_oppilaitoksen_taustatiedot d1 on d1.id=f.oppilaitoksen_taustatiedot_id
  LEFT JOIN dbo.d_alueluokitus d2 on d2.id=f.oppilaitoksen_sijainti_id
  --LEFT JOIN dbo.d_perusopetuksen_vuosiluokat d3 on d3.id=f.perusopetuksen_vuosiluokat_id
  LEFT JOIN dbo.d_perusopetuksen_erityisen_tuen_paatos d4 on d4.id=f.perusopetuksen_erityisen_tuen_paatos_id
  --LEFT JOIN dbo.d_perusopetuksen_yleisopetuksen_osuus d5 on d5.id=f.perusopetuksen_yleisopetuksen_osuus_id
  --LEFT JOIN dbo.d_perusopetuksen_oppimaaran_yksilollistaminen d6 on d6.id=f.perusopetuksen_oppimaaran_yksilollistaminen_id
  --LEFT JOIN dbo.d_perusopetuksen_pidennetty_oppivelvollisuus d7 on d7.id=f.perusopetuksen_pidennetty_oppivelvollisuus_id
  --LEFT JOIN dbo.d_joustava_perusopetus d8 on d8.id=f.joustava_perusopetus_id
  --LEFT JOIN dbo.d_perusopetuksen_majoitusetuus d9 on d9.id=f.perusopetuksen_majoitusetuus_id
  LEFT JOIN dbo.d_perusopetuksen_tehostettu_tuki d10 on d10.id=f.perusopetuksen_tehostettu_tuki_id
  --LEFT JOIN d_sukupuoli d11 on d11.id=f.sukupuoli_id
  LEFT JOIN d_perusopetuksen_tukimuoto d12 on d12.id=f.perusopetuksen_tukimuoto_id
    
  UNION ALL

    SELECT 
	   [Tilastovuosi] = f.tilv
      ,[Oppilaitos] = d1.oppilaitos, [Oppilaitoskoodi] = d1.oppilaitoskoodi
	  ,[Opetuksen järjestäjä] = d1.koulutuksen_jarjestaja
	  ,[Oppilaitostyypi] = d1.oppilaitostyyppi
	  ,[Oppilaitoksen omistajatyyppi] = d1.oppilaitoksen_omistajatyyppi
	  ,[Oppilaitoksen opetuskieli] = d1.opetuskieli
	  ,[Oppilaitoksen kunta] = d2.kunta
	  ,[Oppilaitoksen maakunta] = d2.maakunta
      ,[Vuosiluokka] = d3.luokkajako_0_19_10
	  ,[Erityisen tuen päätös] = d4.perusopetuksen_erityisen_tuen_paatos
	  ,[Opetuksen toteutuspaikka] = null
	  ,[Oppimäärän yksilöllistäminen] = null
	  ,[Pidennetty oppivelvollisuus] = d7.perusopetuksen_pidennetty_oppivelvollisuus
	  ,[Joustava perusopetus] = null
	  ,[Kuljetusetuus] = null
	  ,[Majoitusetuus] = null
	  ,[Tehostettu tuki] = d10.perusopetuksen_tehostettu_tuki
	  ,[Tukimuoto] = null
	  ,[Vieraskielisyys] = d13.vieraskielisyys
	  ,[Sukupuoli] = null
      ,[lkm] = f.vieraskieliset_tehostetun_tuen_oppilaat
	  ,[Osa] = 'Vieraskieliset'

	  --ruotsi
	  ,[Statistikår] = f.tilv
      ,[Läroanstalt] = d1.oppilaitos_SV
	  ,[Utbildningsanordnare] = d1.koulutuksen_jarjestaja_SV
	  ,[Läroanstaltstyp] = d1.oppilaitostyyppi_SV
	  ,[Läroanstaltens ägartyp] = d1.oppilaitoksen_omistajatyyppi_SV
	  ,[Läroanstaltens undervisningsspråk] = d1.opetuskieli_SV
	  ,[Läroanstaltens kommun] = d2.kunta_SV
	  ,[Läroanstaltens landskap] = d2.maakunta_SV
      ,[Åldersklass] = d3.luokkajako_0_19_10_SV
	  ,[Beslut om särskilt stöd] = d4.perusopetuksen_erityisen_tuen_paatos_SV
	  ,[Undervisning plats] = null
	  ,[Individualiserad lärokurs] = null
	  ,[Förlängd läroplikt] = d7.perusopetuksen_pidennetty_oppivelvollisuus_SV
	  ,[Flexibel grundläggande utbildning] = null
	  ,[Skolskjuts, förmån] = null
	  ,[Inkvarteringsförmån] = null
	  ,[Intensifierat stöd] = d10.perusopetuksen_tehostettu_tuki_SV
	  ,[Form av stöd] = null
	  ,[Främmande modersmål] = d13.vieraskielisyys_SV
	  ,[Kön] = null

	  --englanti
	  ,[Statistical year] = f.tilv
      ,[Educational institution] = d1.oppilaitos_EN
	  ,[Education provider] = d1.koulutuksen_jarjestaja_EN
	  ,[Type of institution] = d1.oppilaitostyyppi_EN
	  ,[Type of institution owner] = d1.oppilaitoksen_omistajatyyppi_EN
	  ,[Language of the institution] = d1.opetuskieli_EN
	  ,[Municipality of the institution] = d2.kunta_EN
	  ,[Region of the institution] = d2.maakunta_EN
      ,[Year class] = d3.luokkajako_0_19_10_EN
	  ,[Resolution on special support] = d4.perusopetuksen_erityisen_tuen_paatos_EN
	  ,[Teaching location] = null
	  ,[Individualization of curriculum] = null
	  ,[Extended compulsory ed.] = d7.perusopetuksen_pidennetty_oppivelvollisuus_EN
	  ,[Flexible basic education] = null
	  ,[Transport benefit] = null
	  ,[Accommodation benefit] = null
	  ,[Intensified support] = d10.perusopetuksen_tehostettu_tuki_EN
	  ,[Form of support] = null
	  ,[Foreign language] = d13.vieraskielisyys_EN
	  ,[Gender] = null

	  ,[Oppilaitostyypi jarjestys] = d1.jarjestys_oppilaitostyyppi
	  ,[Oppilaitoksen omistajatyyppi jarjestys] = d1.jarjestys_omistajatyyppi
	  ,[Oppilaitoksen opetuskieli jarjestys] = d1.jarjestys_opetuskieli
	  ,[Oppilaitoksen kunta jarjestys] = d2.kunta
	  ,[Oppilaitoksen maakunta jarjestys] = d2.jarjestys_maakunta
      ,[Vuosiluokka jarjestys] = d3.luokkajako_0_19_10_jarjestys
	  ,[Erityisen tuen päätös jarjestys] = d4.jarjestys
	  ,[Opetuksen toteutuspaikka jarjestys] = 99
	  ,[Oppimäärän yksilöllistäminen jarjestys] = 99
	  ,[Pidennetty oppivelvollisuus jarjestys] = d7.jarjestys
	  ,[Joustava perusopetus jarjestys] = 99
	  ,[Kuljetusetuus jarjestys] = 99
	  ,[Majoitusetuus jarjestys] = 99
	  ,[Tehostettu tuki jarjestys] = d10.jarjestys
	  ,[Tukimuoto jarjestys] = 99
	  ,[Vieraskielisyys jarjestys] = d13.jarjestys
	  ,[Sukupuoli jarjestys] = 99
  FROM [VipunenTK].[dbo].[f_Perusasteen_erityisopetus_vieraskielisten_tehostetun_tuen_oppilaiden_lkm] f
  LEFT JOIN dbo.d_oppilaitoksen_taustatiedot d1 on d1.id=f.oppilaitoksen_taustatiedot_id
  LEFT JOIN dbo.d_alueluokitus d2 on d2.id=f.oppilaitoksen_sijainti_id
  LEFT JOIN dbo.d_perusopetuksen_vuosiluokat d3 on d3.id=f.perusopetuksen_vuosiluokat_id
  LEFT JOIN dbo.d_perusopetuksen_erityisen_tuen_paatos d4 on d4.id=f.perusopetuksen_erityisen_tuen_paatos_id
  --LEFT JOIN dbo.d_perusopetuksen_yleisopetuksen_osuus d5 on d5.id=f.perusopetuksen_yleisopetuksen_osuus_id
  --LEFT JOIN dbo.d_perusopetuksen_oppimaaran_yksilollistaminen d6 on d6.id=f.perusopetuksen_oppimaaran_yksilollistaminen_id
  LEFT JOIN dbo.d_perusopetuksen_pidennetty_oppivelvollisuus d7 on d7.id=f.perusopetuksen_pidennetty_oppivelvollisuus_id
  --LEFT JOIN dbo.d_joustava_perusopetus d8 on d8.id=f.joustava_perusopetus_id
  --LEFT JOIN dbo.d_perusopetuksen_majoitusetuus d9 on d9.id=f.perusopetuksen_majoitusetuus_id
  LEFT JOIN dbo.d_perusopetuksen_tehostettu_tuki d10 on d10.id=f.perusopetuksen_tehostettu_tuki_id
  --LEFT JOIN d_sukupuoli d11 on d11.id=f.sukupuoli_id
  --LEFT JOIN d_perusopetuksen_tukimuoto d12 on d12.id=f.perusopetuksen_tukimuoto_id
  LEFT JOIN d_vieraskielisyys d13 on d13.id=f.vieraskielisyys_id
  where d2.kunta<>'Ulkomaat'
  
  
  ) a
  where Tilastovuosi>2010



GO


