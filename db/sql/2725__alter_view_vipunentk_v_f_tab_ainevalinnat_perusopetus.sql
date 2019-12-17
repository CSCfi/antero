USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_ainevalinnat_perusopetus]    Script Date: 17.12.2019 21:44:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO













ALTER view [dbo].[v_f_tab_ainevalinnat_perusopetus] as

/*ainevalinnat*/

select 
	[Tilastovuosi] = f.tilv

	,[Sukupuoli] = 'Pojat'

	,[Aine] = d1.aine
	,[Aineryhmä] = d1.aineryhmä
	,[Kielen taso] = case when d1.kielen_taso='A1' and tilv<2010 then 'A-kieli (A1 ja A2)' else d1.kielen_taso end
	,[Vuosiluokat] = d2.luokkajako_16_79
	,[Vuosiluokka] = d2.vuosiluokka

	,[Opetuksen järjestäjä] = d3.koulutuksen_jarjestaja
	,[Oppilaitoksen omistajatyyppi] = d3.oppilaitoksen_omistajatyyppi
	,[Oppilaitostyyppi] = d3.oppilaitostyyppi
	,[Oppilaitoksen maakunta] = d4.maakunta
	,[Oppilaitoksen kunta] = d4.kunta
	,[Oppilaitos] = d3.oppilaitos + ' (' + d3.oppilaitoskoodi + ')'
	,[Oppilaitoksen opetuskieli] = d3.opetuskieli

	--,[ainevalinnat pojat] = f.lkm_pojat
	--,[ainevalinnat tytöt] = f.lkm_tytot
	,[ainevalinnat yht] = f.lkm_pojat
	--,[pojat lkm] = 0
	--,[tytöt lkm] = 0
	,[yht lkm] = 0

	--ruotsi
	,[Statistikår] = f.tilv
	,[Kön] = 'Pojkar'
	,[Ämne] = d1.aine_SV
	,[Ämnesgrupp] = d1.aineryhmä_SV
	,[Språknivå] = d1.kielen_taso_SV
	,[Årsklasser] = d2.luokkajako_16_79_SV
	,[Årsklass] = d2.vuosiluokka_SV
	,[Utbildningsanordnare] = d3.koulutuksen_jarjestaja_SV
	,[Läroanstaltens ägartyp] = d3.oppilaitoksen_omistajatyyppi_SV
	,[Läroanstaltstyp] = d3.oppilaitostyyppi_SV
	,[Läroanstaltens landskap] = d4.maakunta_SV
	,[Läroanstaltens kommun] = d4.kunta_SV
	,[Läroanstalt] = d3.oppilaitos_SV + ' (' + d3.oppilaitoskoodi + ')' + ' (' + d3.oppilaitoskoodi + ')'
	,[Läroanstaltens undervisningsspråk] = d3.opetuskieli_SV

	--englanti
	,[Statistical year] = f.tilv
	,[Gender] = 'Boys'
	,[Subject] = d1.aine_EN
	,[Subject group] = d1.aineryhmä_EN
	,[Language level] = d1.kielen_taso_EN
	,[Year groups] = d2.luokkajako_16_79_EN
	,[Year group] = d2.vuosiluokka_EN
	,[Education provider] = d3.koulutuksen_jarjestaja_EN
	,[Type of institution owner] = d3.oppilaitoksen_omistajatyyppi_EN
	,[Type of institution] = d3.oppilaitostyyppi_EN
	,[Region of the institution] = d4.maakunta_EN
	,[Municipality of the institution] = d4.kunta_EN
	,[Educational institution] = d3.oppilaitos_EN + ' (' + d3.oppilaitoskoodi + ')' + ' (' + d3.oppilaitoskoodi + ')'
	,[Language of the institution] = d3.opetuskieli_EN

	--koodit
	,[Koodit Opetuksen järjestäjä] = d3.koulutuksen_jarjestajakoodi
	,[Koodit Oppilaitos] = d3.oppilaitoskoodi
	,[Koodit Oppilaitoksen maakunta] = d4.maakunta_koodi
	,[Koodit Oppilaitoksen kunta] = d4.kunta_koodi

	--järjestys
	,[Sukupuoli järj] = 1
	,[Aine järj] = case d1.aine when 'Elämänkatsomustieto' then 4034 else d1.aine_jarjestys end
	,[Aineryhmä järj] = d1.aineryhmä_jarjestys
	,[Kielen taso järj] = d1.kielen_taso_jarjestys
	,[Vuosiluokka järj] = d2.jarjestys
	,[Vuosiluokat järj] = d2.luokkajako_16_79_jarjestys
	,[Oppilaitoksen omistajatyyppi järj] = d3.jarjestys_omistajatyyppi
	,[Oppilaitostyyppi järj] = d3.jarjestys_oppilaitostyyppi
	,[Oppilaitoksen maakunta järj] = d4.jarjestys_maakunta
	,[Oppilaitoksen opetuskieli järj] = d3.jarjestys_opetuskieli
	

from dbo.f_ainevalinnat_perusopetuksessa f
inner join d_perusopetuksen_ainevalinnat d1 on d1.id=f.ainevalinta_id
inner join d_perusopetuksen_vuosiluokat d2 on d2.id=f.vuosiluokka_id
inner join d_oppilaitoksen_taustatiedot d3 on d3.id=f.oppilaitos_id
inner join d_alueluokitus d4 on d4.id=f.oppilaitoksensijainti_id
where f.lkm_pojat>0 and d1.aine<>'ei yhtään kieltä'

UNION ALL

select 
	[Tilastovuosi] = f.tilv

	,[Sukupuoli] = 'Tytöt'

	,[Aine] = d1.aine
	,[Aineryhmä] = d1.aineryhmä
	,[Kielen taso] = case when d1.kielen_taso='A1' and tilv<2010 then 'A-kieli (A1 ja A2)' else d1.kielen_taso end
	,[Vuosiluokat] = d2.luokkajako_16_79
	,[Vuosiluokka] = d2.vuosiluokka

	,[Opetuksen järjestäjä] = d3.koulutuksen_jarjestaja
	,[Oppilaitoksen omistajatyyppi] = d3.oppilaitoksen_omistajatyyppi
	,[Oppilaitostyyppi] = d3.oppilaitostyyppi
	,[Oppilaitoksen maakunta] = d4.maakunta
	,[Oppilaitoksen kunta] = d4.kunta
	,[Oppilaitos] = d3.oppilaitos + ' (' + d3.oppilaitoskoodi + ')'
	,[Oppilaitoksen opetuskieli] = d3.opetuskieli

	--,[ainevalinnat pojat] = f.lkm_pojat
	--,[ainevalinnat tytöt] = f.lkm_tytot
	,[ainevalinnat yht] = f.lkm_tytot
	--,[pojat lkm] = 0
	--,[tytöt lkm] = 0
	,[yht lkm] = 0

	--ruotsi
	,[Statistikår] = f.tilv
	,[Kön] = 'Flickor'
	,[Ämne] = d1.aine_SV
	,[Ämnesgrupp] = d1.aineryhmä_SV
	,[Språknivå] = d1.kielen_taso_SV
	,[Årsklasser] = d2.luokkajako_16_79_SV
	,[Årsklass] = d2.vuosiluokka_SV
	,[Utbildningsanordnare] = d3.koulutuksen_jarjestaja_SV
	,[Läroanstaltens ägartyp] = d3.oppilaitoksen_omistajatyyppi_SV
	,[Läroanstaltstyp] = d3.oppilaitostyyppi_SV
	,[Läroanstaltens landskap] = d4.maakunta_SV
	,[Läroanstaltens kommun] = d4.kunta_SV
	,[Läroanstalt] = d3.oppilaitos_SV + ' (' + d3.oppilaitoskoodi + ')'
	,[Läroanstaltens undervisningsspråk] = d3.opetuskieli_SV

	--englanti
	,[Statistical year] = f.tilv
	,[Gender] = 'Girls'
	,[Subject] = d1.aine_EN
	,[Subject group] = d1.aineryhmä_EN
	,[Language level] = d1.kielen_taso_EN
	,[Year groups] = d2.luokkajako_16_79_EN
	,[Year group] = d2.vuosiluokka_EN
	,[Education provider] = d3.koulutuksen_jarjestaja_EN
	,[Type of institution owner] = d3.oppilaitoksen_omistajatyyppi_EN
	,[Type of institution] = d3.oppilaitostyyppi_EN
	,[Region of the institution] = d4.maakunta_EN
	,[Municipality of the institution] = d4.kunta_EN
	,[Educational institution] = d3.oppilaitos_EN + ' (' + d3.oppilaitoskoodi + ')'
	,[Language of the institution] = d3.opetuskieli_EN

	--koodit
	,[Koodit Opetuksen järjestäjä] = d3.koulutuksen_jarjestajakoodi
	,[Koodit Oppilaitos] = d3.oppilaitoskoodi
	,[Koodit Oppilaitoksen maakunta] = d4.maakunta_koodi
	,[Koodit Oppilaitoksen kunta] = d4.kunta_koodi

	--järjestys
	,[Sukupuoli järj] = 2
	,[Aine järj] = case d1.aine when 'Elämänkatsomustieto' then 4034 else d1.aine_jarjestys end
	,[Aineryhmä järj] = d1.aineryhmä_jarjestys
	,[Kielen taso järj] = d1.kielen_taso_jarjestys
	,[Vuosiluokka järj] = d2.jarjestys
	,[Vuosiluokat järj] = d2.luokkajako_16_79_jarjestys
	,[Oppilaitoksen omistajatyyppi järj] = d3.jarjestys_omistajatyyppi
	,[Oppilaitostyyppi järj] = d3.jarjestys_oppilaitostyyppi
	,[Oppilaitoksen maakunta järj] = d4.jarjestys_maakunta
	,[Oppilaitoksen opetuskieli järj] = d3.jarjestys_opetuskieli
	

from dbo.f_ainevalinnat_perusopetuksessa f
inner join d_perusopetuksen_ainevalinnat d1 on d1.id=f.ainevalinta_id
inner join d_perusopetuksen_vuosiluokat d2 on d2.id=f.vuosiluokka_id
inner join d_oppilaitoksen_taustatiedot d3 on d3.id=f.oppilaitos_id
inner join d_alueluokitus d4 on d4.id=f.oppilaitoksensijainti_id
where f.lkm_tytot>0 and d1.aine<>'ei yhtään kieltä'

UNION ALL
--sukupuoli tuntematon
select 
	[Tilastovuosi] = f.tilv

	,[Sukupuoli] = 'Tuntematon'

	,[Aine] = d1.aine
	,[Aineryhmä] = d1.aineryhmä
	,[Kielen taso] = d1.kielen_taso
	,[Vuosiluokat] = d2.luokkajako_16_79
	,[Vuosiluokka] = d2.vuosiluokka

	,[Opetuksen järjestäjä] = d3.koulutuksen_jarjestaja
	,[Oppilaitoksen omistajatyyppi] = d3.oppilaitoksen_omistajatyyppi
	,[Oppilaitostyyppi] = d3.oppilaitostyyppi
	,[Oppilaitoksen maakunta] = d4.maakunta
	,[Oppilaitoksen kunta] = d4.kunta
	,[Oppilaitos] = d3.oppilaitos + ' (' + d3.oppilaitoskoodi + ')'
	,[Oppilaitoksen opetuskieli] = d3.opetuskieli

	--,[ainevalinnat pojat] = f.lkm_pojat
	--,[ainevalinnat tytöt] = f.lkm_tytot
	,[ainevalinnat yht] = f.lkm_yht
	--,[pojat lkm] = 0
	--,[tytöt lkm] = 0
	,[yht lkm] = 0

	--ruotsi
	,[Statistikår] = f.tilv
	,[Kön] = 'Okänd'
	,[Ämne] = d1.aine_SV
	,[Ämnesgrupp] = d1.aineryhmä_SV
	,[Språknivå] = d1.kielen_taso_SV
	,[Årsklasser] = d2.luokkajako_16_79_SV
	,[Årsklass] = d2.vuosiluokka_SV
	,[Utbildningsanordnare] = d3.koulutuksen_jarjestaja_SV
	,[Läroanstaltens ägartyp] = d3.oppilaitoksen_omistajatyyppi_SV
	,[Läroanstaltstyp] = d3.oppilaitostyyppi_SV
	,[Läroanstaltens landskap] = d4.maakunta_SV
	,[Läroanstaltens kommun] = d4.kunta_SV
	,[Läroanstalt] = d3.oppilaitos_SV + ' (' + d3.oppilaitoskoodi + ')'
	,[Läroanstaltens undervisningsspråk] = d3.opetuskieli_SV

	--englanti
	,[Statistical year] = f.tilv
	,[Gender] = 'Unknown'
	,[Subject] = d1.aine_EN
	,[Subject group] = d1.aineryhmä_EN
	,[Language level] = d1.kielen_taso_EN
	,[Year groups] = d2.luokkajako_16_79_EN
	,[Year group] = d2.vuosiluokka_EN
	,[Education provider] = d3.koulutuksen_jarjestaja_EN
	,[Type of institution owner] = d3.oppilaitoksen_omistajatyyppi_EN
	,[Type of institution] = d3.oppilaitostyyppi_EN
	,[Region of the institution] = d4.maakunta_EN
	,[Municipality of the institution] = d4.kunta_EN
	,[Educational institution] = d3.oppilaitos_EN + ' (' + d3.oppilaitoskoodi + ')'
	,[Language of the institution] = d3.opetuskieli_EN

	--koodit
	,[Koodit Opetuksen järjestäjä] = d3.koulutuksen_jarjestajakoodi
	,[Koodit Oppilaitos] = d3.oppilaitoskoodi
	,[Koodit Oppilaitoksen maakunta] = d4.maakunta_koodi
	,[Koodit Oppilaitoksen kunta] = d4.kunta_koodi

	--järjestys
	,[Sukupuoli järj] = 99
	,[Aine järj] = case d1.aine when 'Elämänkatsomustieto' then 4034 else d1.aine_jarjestys end
	,[Aineryhmä järj] = d1.aineryhmä_jarjestys
	,[Kielen taso järj] = d1.kielen_taso_jarjestys
	,[Vuosiluokka järj] = d2.jarjestys
	,[Vuosiluokat järj] = d2.luokkajako_16_79_jarjestys
	,[Oppilaitoksen omistajatyyppi järj] = d3.jarjestys_omistajatyyppi
	,[Oppilaitostyyppi järj] = d3.jarjestys_oppilaitostyyppi
	,[Oppilaitoksen maakunta järj] = d4.jarjestys_maakunta
	,[Oppilaitoksen opetuskieli järj] = d3.jarjestys_opetuskieli
	

from dbo.f_ainevalinnat_perusopetuksessa f
inner join d_perusopetuksen_ainevalinnat d1 on d1.id=f.ainevalinta_id
inner join d_perusopetuksen_vuosiluokat d2 on d2.id=f.vuosiluokka_id
inner join d_oppilaitoksen_taustatiedot d3 on d3.id=f.oppilaitos_id
inner join d_alueluokitus d4 on d4.id=f.oppilaitoksensijainti_id
where (f.lkm_tytot is null or f.lkm_tytot=0) and 
	  (f.lkm_pojat is null or f.lkm_pojat=0) and 
	  f.lkm_yht>0 and 
	  (d1.aineryhmä in ('Suomi tai ruotsi toisena kielenä','Katsomusaineet') and d1.aine<>'ei yhtään kieltä')

UNION ALL

select 
	[Tilastovuosi] = f.tilv

	,[Sukupuoli] = 'Tuntematon'

	,[Aine] = d1.aine
	,[Aineryhmä] = d1.aineryhmä
	,[Kielen taso] = d1.kielen_taso
	,[Vuosiluokat] = d2.luokkajako_16_79
	,[Vuosiluokka] = d2.vuosiluokka

	,[Opetuksen järjestäjä] = d3.koulutuksen_jarjestaja
	,[Oppilaitoksen omistajatyyppi] = d3.oppilaitoksen_omistajatyyppi
	,[Oppilaitostyyppi] = d3.oppilaitostyyppi
	,[Oppilaitoksen maakunta] = d4.maakunta
	,[Oppilaitoksen kunta] = d4.kunta
	,[Oppilaitos] = d3.oppilaitos + ' (' + d3.oppilaitoskoodi + ')'
	,[Oppilaitoksen opetuskieli] = d3.opetuskieli

	--,[ainevalinnat pojat] = f.lkm_pojat
	--,[ainevalinnat tytöt] = f.lkm_tytot
	,[ainevalinnat yht] = f.lkm_yht
	--,[pojat lkm] = 0
	--,[tytöt lkm] = 0
	,[yht lkm] = 0

	--ruotsi
	,[Statistikår] = f.tilv
	,[Kön] = 'Okänd'
	,[Ämne] = d1.aine_SV
	,[Ämnesgrupp] = d1.aineryhmä_SV
	,[Språknivå] = d1.kielen_taso_SV
	,[Årsklasser] = d2.luokkajako_16_79_SV
	,[Årsklass] = d2.vuosiluokka_SV
	,[Utbildningsanordnare] = d3.koulutuksen_jarjestaja_SV
	,[Läroanstaltens ägartyp] = d3.oppilaitoksen_omistajatyyppi_SV
	,[Läroanstaltstyp] = d3.oppilaitostyyppi_SV
	,[Läroanstaltens landskap] = d4.maakunta_SV
	,[Läroanstaltens kommun] = d4.kunta_SV
	,[Läroanstalt] = d3.oppilaitos_SV + ' (' + d3.oppilaitoskoodi + ')'
	,[Läroanstaltens undervisningsspråk] = d3.opetuskieli_SV

	--englanti
	,[Statistical year] = f.tilv
	,[Gender] = 'Unknown'
	,[Subject] = d1.aine_EN
	,[Subject group] = d1.aineryhmä_EN
	,[Language level] = d1.kielen_taso_EN
	,[Year groups] = d2.luokkajako_16_79_EN
	,[Year group] = d2.vuosiluokka_EN
	,[Education provider] = d3.koulutuksen_jarjestaja_EN
	,[Type of institution owner] = d3.oppilaitoksen_omistajatyyppi_EN
	,[Type of institution] = d3.oppilaitostyyppi_EN
	,[Region of the institution] = d4.maakunta_EN
	,[Municipality of the institution] = d4.kunta_EN
	,[Educational institution] = d3.oppilaitos_EN + ' (' + d3.oppilaitoskoodi + ')'
	,[Language of the institution] = d3.opetuskieli_EN

	--koodit
	,[Koodit Opetuksen järjestäjä] = d3.koulutuksen_jarjestajakoodi
	,[Koodit Oppilaitos] = d3.oppilaitoskoodi
	,[Koodit Oppilaitoksen maakunta] = d4.maakunta_koodi
	,[Koodit Oppilaitoksen kunta] = d4.kunta_koodi

	--järjestys
	,[Sukupuoli järj] = 99
	,[Aine järj] = case d1.aine when 'Elämänkatsomustieto' then 4034 else d1.aine_jarjestys end
	,[Aineryhmä järj] = d1.aineryhmä_jarjestys
	,[Kielen taso järj] = d1.kielen_taso_jarjestys
	,[Vuosiluokka järj] = d2.jarjestys
	,[Vuosiluokat järj] = d2.luokkajako_16_79_jarjestys
	,[Oppilaitoksen omistajatyyppi järj] = d3.jarjestys_omistajatyyppi
	,[Oppilaitostyyppi järj] = d3.jarjestys_oppilaitostyyppi
	,[Oppilaitoksen maakunta järj] = d4.jarjestys_maakunta
	,[Oppilaitoksen opetuskieli järj] = d3.jarjestys_opetuskieli
	

from dbo.f_ainevalinnat_perusopetuksessa f
inner join d_perusopetuksen_ainevalinnat d1 on d1.id=f.ainevalinta_id
inner join d_perusopetuksen_vuosiluokat d2 on d2.id=f.vuosiluokka_id
inner join d_oppilaitoksen_taustatiedot d3 on d3.id=f.oppilaitos_id
inner join d_alueluokitus d4 on d4.id=f.oppilaitoksensijainti_id
where (f.lkm_tytot is null or f.lkm_tytot=0) and 
	  (f.lkm_pojat is null or f.lkm_pojat=0) and 
	  f.lkm_yht>0 and 
	  (d1.aineryhmä = 'Kielivalinnat' and d2.luokkajako_16_79='Luokat 1-6' and d2.vuosiluokka<>'Tietoa ei kerätty (1-6)' and d1.aine<>'ei yhtään kieltä')

UNION ALL


/* Oppilaiden määrät */

select 
	[Tilastovuosi] = tilv

	,[Sukupuoli] = 'Pojat'

	,[Aine] = null
	,[Aineryhmä] = null
	,[Kielen taso] = null
	,[Vuosiluokat] = d2.luokkajako_16_79
	,[Vuosiluokka] = 'Tietoa ei kerätty (1-6)'

	,[Opetuksen järjestäjä] = d3.koulutuksen_jarjestaja
	,[Oppilaitoksen omistajatyyppi] = d3.oppilaitoksen_omistajatyyppi
	,[Oppilaitostyyppi] = d3.oppilaitostyyppi
	,[Oppilaitoksen maakunta] = d4.maakunta
	,[Oppilaitoksen kunta] = d4.kunta
	,[Oppilaitos] = d3.oppilaitos + ' (' + d3.oppilaitoskoodi + ')'
	,[Oppilaitoksen opetuskieli] = d3.opetuskieli

	--,[ainevalinnat pojat] = 0
	--,[ainevalinnat tytöt] = 0
	,[ainevalinnat yht] = 0
	--,[pojat] = f.lkm_pojat
	--,[tytöt] = f.lkm_tytot
	,[yht] = f.lkm_pojat

	--ruotsi
	,[Statistikår] = tilv
	,[Kön] = 'Pojkar'
	,[Ämne] = null
	,[Ämnesgrupp] = null
	,[Språknivå] = null
	,[Årsklasser] = d2.luokkajako_16_79_SV
	,[Årsklass] = 'Uppgifter har inte samlats in (1–6)'
	,[Utbildningsanordnare] = d3.koulutuksen_jarjestaja_SV
	,[Läroanstaltens ägartyp] = d3.oppilaitoksen_omistajatyyppi_SV
	,[Läroanstaltstyp] = d3.oppilaitostyyppi_SV
	,[Läroanstaltens landskap] = d4.maakunta_SV
	,[Läroanstaltens kommun] = d4.kunta_SV
	,[Läroanstalt] = d3.oppilaitos_SV + ' (' + d3.oppilaitoskoodi + ')'
	,[Läroanstaltens undervisningsspråk] = d3.opetuskieli_SV

	--englanti
	,[Statistical year] = tilv
	,[Gender] = 'Boys'
	,[Subject] = null
	,[Subject group] = null
	,[Language level] = null
	,[Year groups] = d2.luokkajako_16_79_EN
	,[Year group] = 'Data not collected (1-6)'
	,[Education provider] = d3.koulutuksen_jarjestaja_EN
	,[Type of institution owner] = d3.oppilaitoksen_omistajatyyppi_EN
	,[Type of institution] = d3.oppilaitostyyppi_EN
	,[Region of the institution] = d4.maakunta_EN
	,[Municipality of the institution] = d4.kunta_EN
	,[Educational institution] = d3.oppilaitos_EN + ' (' + d3.oppilaitoskoodi + ')'
	,[Language of the institution] = d3.opetuskieli_EN

	--koodit
	,[Koodit Opetuksen järjestäjä] = d3.koulutuksen_jarjestajakoodi
	,[Koodit Oppilaitos] = d3.oppilaitoskoodi
	,[Koodit Oppilaitoksen maakunta] = d4.maakunta_koodi
	,[Koodit Oppilaitoksen kunta] = d4.kunta_koodi

	--järjestys
	,[Sukupuoli järj] = 1
	,[Aine järj] = 99999
	,[Aineryhmä järj] = 99999
	,[Kielen taso järj] = 99999
	,[Vuosiluokka järj] = d2.jarjestys
	,[Vuosiluokat järj] = d2.luokkajako_16_79_jarjestys
	,[Oppilaitoksen omistajatyyppi järj] = d3.jarjestys_omistajatyyppi
	,[Oppilaitostyyppi järj] = d3.jarjestys_oppilaitostyyppi
	,[Oppilaitoksen maakunta järj] = d4.jarjestys_maakunta
	,[Oppilaitoksen opetuskieli järj] = d3.jarjestys_opetuskieli
	

from dbo.f_perusopetuksen_oppilasmaarat f
inner join d_perusopetuksen_vuosiluokat d2 on d2.id=f.vuosiluokka_id
inner join d_oppilaitoksen_taustatiedot d3 on d3.id=f.oppilaitos_id
inner join d_alueluokitus d4 on d4.id=f.oppilaitoksensijainti_id
where f.lkm_pojat>0 and d2.luokkajako_16_79='Luokat 1-6'

UNION ALL

select 
	[Tilastovuosi] = tilv

	,[Sukupuoli] = 'Tytöt'

	,[Aine] = null
	,[Aineryhmä] = null
	,[Kielen taso] = null
	,[Vuosiluokat] = d2.luokkajako_16_79
	,[Vuosiluokka] = 'Tietoa ei kerätty (1-6)'

	,[Opetuksen järjestäjä] = d3.koulutuksen_jarjestaja
	,[Oppilaitoksen omistajatyyppi] = d3.oppilaitoksen_omistajatyyppi
	,[Oppilaitostyyppi] = d3.oppilaitostyyppi
	,[Oppilaitoksen maakunta] = d4.maakunta
	,[Oppilaitoksen kunta] = d4.kunta
	,[Oppilaitos] = d3.oppilaitos + ' (' + d3.oppilaitoskoodi + ')'
	,[Oppilaitoksen opetuskieli] = d3.opetuskieli

	--,[ainevalinnat pojat] = 0
	--,[ainevalinnat tytöt] = 0
	,[ainevalinnat yht] = 0
	--,[pojat] = f.lkm_pojat
	--,[tytöt] = f.lkm_tytot
	,[yht] = f.lkm_tytot

	--ruotsi
	,[Statistikår] = tilv
	,[Kön] = 'Flickor'
	,[Ämne] = null
	,[Ämnesgrupp] = null
	,[Språknivå] = null
	,[Årsklasser] = d2.luokkajako_16_79_SV
	,[Årsklass] = 'Uppgifter har inte samlats in (1–6)'
	,[Utbildningsanordnare] = d3.koulutuksen_jarjestaja_SV
	,[Läroanstaltens ägartyp] = d3.oppilaitoksen_omistajatyyppi_SV
	,[Läroanstaltstyp] = d3.oppilaitostyyppi_SV
	,[Läroanstaltens landskap] = d4.maakunta_SV
	,[Läroanstaltens kommun] = d4.kunta_SV
	,[Läroanstalt] = d3.oppilaitos_SV + ' (' + d3.oppilaitoskoodi + ')'
	,[Läroanstaltens undervisningsspråk] = d3.opetuskieli_SV

	--englanti
	,[Statistical year] = tilv
	,[Gender] = 'Girls'
	,[Subject] = null
	,[Subject group] = null
	,[Language level] = null
	,[Year groups] = d2.luokkajako_16_79_EN
	,[Year group] = 'Data not collected (1-6)'
	,[Education provider] = d3.koulutuksen_jarjestaja_EN
	,[Type of institution owner] = d3.oppilaitoksen_omistajatyyppi_EN
	,[Type of institution] = d3.oppilaitostyyppi_EN
	,[Region of the institution] = d4.maakunta_EN
	,[Municipality of the institution] = d4.kunta_EN
	,[Educational institution] = d3.oppilaitos_EN + ' (' + d3.oppilaitoskoodi + ')'
	,[Language of the institution] = d3.opetuskieli_EN

	--koodit
	,[Koodit Opetuksen järjestäjä] = d3.koulutuksen_jarjestajakoodi
	,[Koodit Oppilaitos] = d3.oppilaitoskoodi
	,[Koodit Oppilaitoksen maakunta] = d4.maakunta_koodi
	,[Koodit Oppilaitoksen kunta] = d4.kunta_koodi

	--järjestys
	,[Sukupuoli järj] = 2
	,[Aine järj] = 99999
	,[Aineryhmä järj] = 99999
	,[Kielen taso järj] = 99999
	,[Vuosiluokka järj] = d2.jarjestys
	,[Vuosiluokat järj] = d2.luokkajako_16_79_jarjestys
	,[Oppilaitoksen omistajatyyppi järj] = d3.jarjestys_omistajatyyppi
	,[Oppilaitostyyppi järj] = d3.jarjestys_oppilaitostyyppi
	,[Oppilaitoksen maakunta järj] = d4.jarjestys_maakunta
	,[Oppilaitoksen opetuskieli järj] = d3.jarjestys_opetuskieli
	

from dbo.f_perusopetuksen_oppilasmaarat f
inner join d_perusopetuksen_vuosiluokat d2 on d2.id=f.vuosiluokka_id
inner join d_oppilaitoksen_taustatiedot d3 on d3.id=f.oppilaitos_id
inner join d_alueluokitus d4 on d4.id=f.oppilaitoksensijainti_id
where f.lkm_tytot>0 and d2.luokkajako_16_79='Luokat 1-6'

UNION ALL
--1-6 luokkien kielivalintoja varten, sukupuoli asetetaan tuntemattomaksi
select 
	[Tilastovuosi] = tilv

	,[Sukupuoli] = 'Tuntematon'

	,[Aine] = null
	,[Aineryhmä] = 'Kielivalinnat'
	,[Kielen taso] = null
	,[Vuosiluokat] = 'Luokat 1–6'
	,[Vuosiluokka] = d2.vuosiluokka

	,[Opetuksen järjestäjä] = d3.koulutuksen_jarjestaja
	,[Oppilaitoksen omistajatyyppi] = d3.oppilaitoksen_omistajatyyppi
	,[Oppilaitostyyppi] = d3.oppilaitostyyppi
	,[Oppilaitoksen maakunta] = d4.maakunta
	,[Oppilaitoksen kunta] = d4.kunta
	,[Oppilaitos] = d3.oppilaitos + ' (' + d3.oppilaitoskoodi + ')'
	,[Oppilaitoksen opetuskieli] = d3.opetuskieli

	--,[ainevalinnat pojat] = 0
	--,[ainevalinnat tytöt] = 0
	,[ainevalinnat yht] = 0
	--,[pojat] = f.lkm_pojat
	--,[tytöt] = f.lkm_tytot
	,[yht] = isnull(f.lkm_pojat,0)+isnull(f.lkm_tytot,0)

	--ruotsi
	,[Statistikår] = tilv
	,[Kön] = 'Okänd'
	,[Ämne] = null
	,[Ämnesgrupp] = 'Språkval'
	,[Språknivå] = null
	,[Årsklasser] = 'Årskurserna 1–6'
	,[Årsklass] = d2.vuosiluokka_SV
	,[Utbildningsanordnare] = d3.koulutuksen_jarjestaja_SV
	,[Läroanstaltens ägartyp] = d3.oppilaitoksen_omistajatyyppi_SV
	,[Läroanstaltstyp] = d3.oppilaitostyyppi_SV
	,[Läroanstaltens landskap] = d4.maakunta_SV
	,[Läroanstaltens kommun] = d4.kunta_SV
	,[Läroanstalt] = d3.oppilaitos_SV + ' (' + d3.oppilaitoskoodi + ')'
	,[Läroanstaltens undervisningsspråk] = d3.opetuskieli_SV

	--englanti
	,[Statistical year] = tilv
	,[Gender] = 'Unknown'
	,[Subject] = null
	,[Subject group] = 'Language choices'
	,[Language level] = null
	,[Year groups] = 'Grades 1-6'
	,[Year group] = d2.vuosiluokka_EN
	,[Education provider] = d3.koulutuksen_jarjestaja_EN
	,[Type of institution owner] = d3.oppilaitoksen_omistajatyyppi_EN
	,[Type of institution] = d3.oppilaitostyyppi_EN
	,[Region of the institution] = d4.maakunta_EN
	,[Municipality of the institution] = d4.kunta_EN
	,[Educational institution] = d3.oppilaitos_EN + ' (' + d3.oppilaitoskoodi + ')'
	,[Language of the institution] = d3.opetuskieli_EN

	--koodit
	,[Koodit Opetuksen järjestäjä] = d3.koulutuksen_jarjestajakoodi
	,[Koodit Oppilaitos] = d3.oppilaitoskoodi
	,[Koodit Oppilaitoksen maakunta] = d4.maakunta_koodi
	,[Koodit Oppilaitoksen kunta] = d4.kunta_koodi

	--järjestys
	,[Sukupuoli järj] = 1
	,[Aine järj] = 99999
	,[Aineryhmä järj] = 99999
	,[Kielen taso järj] = 99999
	,[Vuosiluokka järj] = d2.jarjestys
	,[Vuosiluokat järj] = d2.luokkajako_16_79_jarjestys
	,[Oppilaitoksen omistajatyyppi järj] = d3.jarjestys_omistajatyyppi
	,[Oppilaitostyyppi järj] = d3.jarjestys_oppilaitostyyppi
	,[Oppilaitoksen maakunta järj] = d4.jarjestys_maakunta
	,[Oppilaitoksen opetuskieli järj] = d3.jarjestys_opetuskieli
	

from dbo.f_perusopetuksen_oppilasmaarat f
inner join d_perusopetuksen_vuosiluokat d2 on d2.id=f.vuosiluokka_id
inner join d_oppilaitoksen_taustatiedot d3 on d3.id=f.oppilaitos_id
inner join d_alueluokitus d4 on d4.id=f.oppilaitoksensijainti_id
where (f.lkm_pojat>0 or f.lkm_tytot>0) and d2.luokkajako_16_79='Luokat 1-6'

--UNION ALL
/* 17.12.2019 / jsyrjala: tämä otetaan kielivalinnoista, joiden ainevalintoihin saadaan tieto sukupuolesta */

----7-9 luokkien katsomus ja suomi/ruotsi -valintoja varten, sukupuoli asetetaan tuntemattomaksi 
--select 
--	[Tilastovuosi] = tilv

--	,[Sukupuoli] = 'Tuntematon'

--	,[Aine] = null
--	,[Aineryhmä] = 'Katsomusaineet'
--	,[Kielen taso] = null
--	,[Vuosiluokat] = 'Luokat 7-9'
--	,[Vuosiluokka] = 'Tietoa ei kerätty (7-9)'

--	,[Opetuksen järjestäjä] = d3.koulutuksen_jarjestaja
--	,[Oppilaitoksen omistajatyyppi] = d3.oppilaitoksen_omistajatyyppi
--	,[Oppilaitostyyppi] = d3.oppilaitostyyppi
--	,[Oppilaitoksen maakunta] = d4.maakunta
--	,[Oppilaitoksen kunta] = d4.kunta
--	,[Oppilaitos] = d3.oppilaitos + ' (' + d3.oppilaitoskoodi + ')'
--	,[Oppilaitoksen opetuskieli] = d3.opetuskieli

--	--,[ainevalinnat pojat] = 0
--	--,[ainevalinnat tytöt] = 0
--	,[ainevalinnat yht] = 0
--	--,[pojat] = f.lkm_pojat
--	--,[tytöt] = f.lkm_tytot
--	,[yht] = isnull(f.lkm_pojat,0)+isnull(f.lkm_tytot,0)

--	--ruotsi
--	,[Statistikår] = tilv
--	,[Kön] = 'Okänd'
--	,[Ämne] = null
--	,[Ämnesgrupp] = 'Åskådningsämnen'
--	,[Språknivå] = null
--	,[Årsklasser] = 'Årskurserna 7–9'
--	,[Årsklass] = 'Uppgifter har inte samlats in (7–9)'
--	,[Utbildningsanordnare] = d3.koulutuksen_jarjestaja_SV
--	,[Läroanstaltens ägartyp] = d3.oppilaitoksen_omistajatyyppi_SV
--	,[Läroanstaltstyp] = d3.oppilaitostyyppi_SV
--	,[Läroanstaltens landskap] = d4.maakunta_SV
--	,[Läroanstaltens kommun] = d4.kunta_SV
--	,[Läroanstalt] = d3.oppilaitos_SV + ' (' + d3.oppilaitoskoodi + ')'
--	,[Läroanstaltens undervisningsspråk] = d3.opetuskieli_SV

--	--englanti
--	,[Statistical year] = tilv
--	,[Gender] = 'Unknown'
--	,[Subject] = null
--	,[Subject group] = 'Ethical subjects'
--	,[Language level] = null
--	,[Year groups] = 'Grades 7-9'
--	,[Year group] = 'Data not collected (7-9)'
--	,[Education provider] = d3.koulutuksen_jarjestaja_EN
--	,[Type of institution owner] = d3.oppilaitoksen_omistajatyyppi_EN
--	,[Type of institution] = d3.oppilaitostyyppi_EN
--	,[Region of the institution] = d4.maakunta_EN
--	,[Municipality of the institution] = d4.kunta_EN
--	,[Educational institution] = d3.oppilaitos_EN + ' (' + d3.oppilaitoskoodi + ')'
--	,[Language of the institution] = d3.opetuskieli_EN

--	--koodit
--	,[Koodit Opetuksen järjestäjä] = d3.koulutuksen_jarjestajakoodi
--	,[Koodit Oppilaitos] = d3.oppilaitoskoodi
--	,[Koodit Oppilaitoksen maakunta] = d4.maakunta_koodi
--	,[Koodit Oppilaitoksen kunta] = d4.kunta_koodi

--	--järjestys
--	,[Sukupuoli järj] = 1
--	,[Aine järj] = 99999
--	,[Aineryhmä järj] = 99999
--	,[Kielen taso järj] = 99999
--	,[Vuosiluokka järj] = d2.jarjestys
--	,[Vuosiluokat järj] = d2.luokkajako_16_79_jarjestys
--	,[Oppilaitoksen omistajatyyppi järj] = d3.jarjestys_omistajatyyppi
--	,[Oppilaitostyyppi järj] = d3.jarjestys_oppilaitostyyppi
--	,[Oppilaitoksen maakunta järj] = d4.jarjestys_maakunta
--	,[Oppilaitoksen opetuskieli järj] = d3.jarjestys_opetuskieli
	

--from dbo.f_perusopetuksen_oppilasmaarat f
--inner join d_perusopetuksen_vuosiluokat d2 on d2.id=f.vuosiluokka_id
--inner join d_oppilaitoksen_taustatiedot d3 on d3.id=f.oppilaitos_id
--inner join d_alueluokitus d4 on d4.id=f.oppilaitoksensijainti_id
--where (f.lkm_pojat>0 or f.lkm_tytot>0) and d2.luokkajako_16_79='Luokat 7-9'

union all
--lisäopetuksen oppilaiden määrä katsomus ja suomi/ruotsi valintoja varten, vuosi 2010
select 
	[Tilastovuosi] = tilv

	,[Sukupuoli] = 'Tuntematon'

	,[Aine] = null
	,[Aineryhmä] = 'Katsomusaineet'
	,[Kielen taso] = null
	,[Vuosiluokat] = 'Lisäopetus'
	,[Vuosiluokka] = 'Tietoa ei kerätty (7-9 ja 10)'

	,[Opetuksen järjestäjä] = d3.koulutuksen_jarjestaja
	,[Oppilaitoksen omistajatyyppi] = d3.oppilaitoksen_omistajatyyppi
	,[Oppilaitostyyppi] = d3.oppilaitostyyppi
	,[Oppilaitoksen maakunta] = d4.maakunta
	,[Oppilaitoksen kunta] = d4.kunta
	,[Oppilaitos] = d3.oppilaitos + ' (' + d3.oppilaitoskoodi + ')'
	,[Oppilaitoksen opetuskieli] = d3.opetuskieli

	--,[ainevalinnat pojat] = 0
	--,[ainevalinnat tytöt] = 0
	,[ainevalinnat yht] = 0
	--,[pojat] = f.lkm_pojat
	--,[tytöt] = f.lkm_tytot
	,[yht] = isnull(f.lkm_pojat,0)+isnull(f.lkm_tytot,0)

	--ruotsi
	,[Statistikår] = tilv
	,[Kön] = 'Okänd'
	,[Ämne] = null
	,[Ämnesgrupp] = 'Åskådningsämnen'
	,[Språknivå] = null
	,[Årsklasser] = 'Tilläggsundervisning'
	,[Årsklass] = 'Uppgifter har inte samlats in (7–9 och 10)'
	,[Utbildningsanordnare] = d3.koulutuksen_jarjestaja_SV
	,[Läroanstaltens ägartyp] = d3.oppilaitoksen_omistajatyyppi_SV
	,[Läroanstaltstyp] = d3.oppilaitostyyppi_SV
	,[Läroanstaltens landskap] = d4.maakunta_SV
	,[Läroanstaltens kommun] = d4.kunta_SV
	,[Läroanstalt] = d3.oppilaitos_SV + ' (' + d3.oppilaitoskoodi + ')'
	,[Läroanstaltens undervisningsspråk] = d3.opetuskieli_SV

	--englanti
	,[Statistical year] = tilv
	,[Gender] = 'Unknown'
	,[Subject] = null
	,[Subject group] = 'Ethical subjects'
	,[Language level] = null
	,[Year groups] = 'Voluntary additional basic education'
	,[Year group] = 'Data not collected (7-9 and 10)'
	,[Education provider] = d3.koulutuksen_jarjestaja_EN
	,[Type of institution owner] = d3.oppilaitoksen_omistajatyyppi_EN
	,[Type of institution] = d3.oppilaitostyyppi_EN
	,[Region of the institution] = d4.maakunta_EN
	,[Municipality of the institution] = d4.kunta_EN
	,[Educational institution] = d3.oppilaitos_EN + ' (' + d3.oppilaitoskoodi + ')'
	,[Language of the institution] = d3.opetuskieli_EN

	--koodit
	,[Koodit Opetuksen järjestäjä] = d3.koulutuksen_jarjestajakoodi
	,[Koodit Oppilaitos] = d3.oppilaitoskoodi
	,[Koodit Oppilaitoksen maakunta] = d4.maakunta_koodi
	,[Koodit Oppilaitoksen kunta] = d4.kunta_koodi

	--järjestys
	,[Sukupuoli järj] = 1
	,[Aine järj] = 99999
	,[Aineryhmä järj] = 99999
	,[Kielen taso järj] = 99999
	,[Vuosiluokka järj] = d2.jarjestys
	,[Vuosiluokat järj] = d2.luokkajako_16_79_jarjestys
	,[Oppilaitoksen omistajatyyppi järj] = d3.jarjestys_omistajatyyppi
	,[Oppilaitostyyppi järj] = d3.jarjestys_oppilaitostyyppi
	,[Oppilaitoksen maakunta järj] = d4.jarjestys_maakunta
	,[Oppilaitoksen opetuskieli järj] = d3.jarjestys_opetuskieli
	

from dbo.f_perusopetuksen_oppilasmaarat f
inner join d_perusopetuksen_vuosiluokat d2 on d2.id=f.vuosiluokka_id
inner join d_oppilaitoksen_taustatiedot d3 on d3.id=f.oppilaitos_id
inner join d_alueluokitus d4 on d4.id=f.oppilaitoksensijainti_id
where (f.lkm_pojat>0 or f.lkm_tytot>0) and d2.vuosiluokka='Lisäopetus' and tilv=2010


UNION ALL
--8-9 luokkien valinnaisainevalintoja varten, pojat
select 
	[Tilastovuosi] = tilv

	,[Sukupuoli] = 'Pojat'

	,[Aine] = null
	,[Aineryhmä] = 'Muut valinnaisaineet'
	,[Kielen taso] = null
	,[Vuosiluokat] = 'Luokat 7-9'
	,[Vuosiluokka] = 'Tietoa ei kerätty (8-9)'

	,[Opetuksen järjestäjä] = d3.koulutuksen_jarjestaja
	,[Oppilaitoksen omistajatyyppi] = d3.oppilaitoksen_omistajatyyppi
	,[Oppilaitostyyppi] = d3.oppilaitostyyppi
	,[Oppilaitoksen maakunta] = d4.maakunta
	,[Oppilaitoksen kunta] = d4.kunta
	,[Oppilaitos] = d3.oppilaitos + ' (' + d3.oppilaitoskoodi + ')'
	,[Oppilaitoksen opetuskieli] = d3.opetuskieli

	--,[ainevalinnat pojat] = 0
	--,[ainevalinnat tytöt] = 0
	,[ainevalinnat yht] = 0
	--,[pojat] = f.lkm_pojat
	--,[tytöt] = f.lkm_tytot
	,[yht] = f.lkm_pojat

	--ruotsi
	,[Statistikår] = tilv
	,[Kön] = 'Pojkar'
	,[Ämne] = null
	,[Ämnesgrupp] = 'Övriga tillvalsämnen'
	,[Språknivå] = null
	,[Årsklasser] = 'Årskurserna 7–9'
	,[Årsklass] = 'Uppgifter har inte samlats in (8–9)'
	,[Utbildningsanordnare] = d3.koulutuksen_jarjestaja_SV
	,[Läroanstaltens ägartyp] = d3.oppilaitoksen_omistajatyyppi_SV
	,[Läroanstaltstyp] = d3.oppilaitostyyppi_SV
	,[Läroanstaltens landskap] = d4.maakunta_SV
	,[Läroanstaltens kommun] = d4.kunta_SV
	,[Läroanstalt] = d3.oppilaitos_SV + ' (' + d3.oppilaitoskoodi + ')'
	,[Läroanstaltens undervisningsspråk] = d3.opetuskieli_SV

	--englanti
	,[Statistical year] = tilv
	,[Gender] = 'Boys'
	,[Subject] = null
	,[Subject group] = 'Other optional subjects'
	,[Language level] = null
	,[Year groups] = 'Grades 7-9'
	,[Year group] = 'Data not collected (8-9)'
	,[Education provider] = d3.koulutuksen_jarjestaja_EN
	,[Type of institution owner] = d3.oppilaitoksen_omistajatyyppi_EN
	,[Type of institution] = d3.oppilaitostyyppi_EN
	,[Region of the institution] = d4.maakunta_EN
	,[Municipality of the institution] = d4.kunta_EN
	,[Educational institution] = d3.oppilaitos_EN + ' (' + d3.oppilaitoskoodi + ')'
	,[Language of the institution] = d3.opetuskieli_EN

	--koodit
	,[Koodit Opetuksen järjestäjä] = d3.koulutuksen_jarjestajakoodi
	,[Koodit Oppilaitos] = d3.oppilaitoskoodi
	,[Koodit Oppilaitoksen maakunta] = d4.maakunta_koodi
	,[Koodit Oppilaitoksen kunta] = d4.kunta_koodi

	--järjestys
	,[Sukupuoli järj] = 1
	,[Aine järj] = 99999
	,[Aineryhmä järj] = 99999
	,[Kielen taso järj] = 99999
	,[Vuosiluokka järj] = d2.jarjestys
	,[Vuosiluokat järj] = d2.luokkajako_16_79_jarjestys
	,[Oppilaitoksen omistajatyyppi järj] = d3.jarjestys_omistajatyyppi
	,[Oppilaitostyyppi järj] = d3.jarjestys_oppilaitostyyppi
	,[Oppilaitoksen maakunta järj] = d4.jarjestys_maakunta
	,[Oppilaitoksen opetuskieli järj] = d3.jarjestys_opetuskieli
	

from dbo.f_perusopetuksen_oppilasmaarat f
inner join d_perusopetuksen_vuosiluokat d2 on d2.id=f.vuosiluokka_id
inner join d_oppilaitoksen_taustatiedot d3 on d3.id=f.oppilaitos_id
inner join d_alueluokitus d4 on d4.id=f.oppilaitoksensijainti_id
where f.lkm_pojat>0 and (d2.vuosiluokka in ('8. luokka','9. luokka'))

UNION ALL
--8-9 luokkien valinnaisainevalintoja varten, tytöt
select 
	[Tilastovuosi] = tilv

	,[Sukupuoli] = 'Tytöt'

	,[Aine] = null
	,[Aineryhmä] = 'Muut valinnaisaineet'
	,[Kielen taso] = null
	,[Vuosiluokat] = 'Luokat 7-9'
	,[Vuosiluokka] = 'Tietoa ei kerätty (8-9)'

	,[Opetuksen järjestäjä] = d3.koulutuksen_jarjestaja
	,[Oppilaitoksen omistajatyyppi] = d3.oppilaitoksen_omistajatyyppi
	,[Oppilaitostyyppi] = d3.oppilaitostyyppi
	,[Oppilaitoksen maakunta] = d4.maakunta
	,[Oppilaitoksen kunta] = d4.kunta
	,[Oppilaitos] = d3.oppilaitos + ' (' + d3.oppilaitoskoodi + ')'
	,[Oppilaitoksen opetuskieli] = d3.opetuskieli

	--,[ainevalinnat pojat] = 0
	--,[ainevalinnat tytöt] = 0
	,[ainevalinnat yht] = 0
	--,[pojat] = f.lkm_pojat
	--,[tytöt] = f.lkm_tytot
	,[yht] = f.lkm_tytot

	--ruotsi
	,[Statistikår] = tilv
	,[Kön] = 'Flickor'
	,[Ämne] = null
	,[Ämnesgrupp] = 'Övriga tillvalsämnen'
	,[Språknivå] = null
	,[Årsklasser] = 'Årskurserna 7–9'
	,[Årsklass] = 'Uppgifter har inte samlats in (8–9)'
	,[Utbildningsanordnare] = d3.koulutuksen_jarjestaja_SV
	,[Läroanstaltens ägartyp] = d3.oppilaitoksen_omistajatyyppi_SV
	,[Läroanstaltstyp] = d3.oppilaitostyyppi_SV
	,[Läroanstaltens landskap] = d4.maakunta_SV
	,[Läroanstaltens kommun] = d4.kunta_SV
	,[Läroanstalt] = d3.oppilaitos_SV + ' (' + d3.oppilaitoskoodi + ')'
	,[Läroanstaltens undervisningsspråk] = d3.opetuskieli_SV

	--englanti
	,[Statistical year] = tilv
	,[Gender] = 'Girls'
	,[Subject] = null
	,[Subject group] = 'Other optional subjects'
	,[Language level] = null
	,[Year groups] = 'Grades 7-9'
	,[Year group] = 'Data not collected (8-9)'
	,[Education provider] = d3.koulutuksen_jarjestaja_EN
	,[Type of institution owner] = d3.oppilaitoksen_omistajatyyppi_EN
	,[Type of institution] = d3.oppilaitostyyppi_EN
	,[Region of the institution] = d4.maakunta_EN
	,[Municipality of the institution] = d4.kunta_EN
	,[Educational institution] = d3.oppilaitos_EN + ' (' + d3.oppilaitoskoodi + ')'
	,[Language of the institution] = d3.opetuskieli_EN

	--koodit
	,[Koodit Opetuksen järjestäjä] = d3.koulutuksen_jarjestajakoodi
	,[Koodit Oppilaitos] = d3.oppilaitoskoodi
	,[Koodit Oppilaitoksen maakunta] = d4.maakunta_koodi
	,[Koodit Oppilaitoksen kunta] = d4.kunta_koodi

	--järjestys
	,[Sukupuoli järj] = 1
	,[Aine järj] = 99999
	,[Aineryhmä järj] = 99999
	,[Kielen taso järj] = 99999
	,[Vuosiluokka järj] = d2.jarjestys
	,[Vuosiluokat järj] = d2.luokkajako_16_79_jarjestys
	,[Oppilaitoksen omistajatyyppi järj] = d3.jarjestys_omistajatyyppi
	,[Oppilaitostyyppi järj] = d3.jarjestys_oppilaitostyyppi
	,[Oppilaitoksen maakunta järj] = d4.jarjestys_maakunta
	,[Oppilaitoksen opetuskieli järj] = d3.jarjestys_opetuskieli
	

from dbo.f_perusopetuksen_oppilasmaarat f
inner join d_perusopetuksen_vuosiluokat d2 on d2.id=f.vuosiluokka_id
inner join d_oppilaitoksen_taustatiedot d3 on d3.id=f.oppilaitos_id
inner join d_alueluokitus d4 on d4.id=f.oppilaitoksensijainti_id
where f.lkm_tytot>0 and (d2.vuosiluokka in ('8. luokka','9. luokka'))

union all
--7-9 luokkien kielivalintoja varten, pojat
select 
	[Tilastovuosi] = tilv

	,[Sukupuoli] = 'Pojat'

	,[Aine] = null
	,[Aineryhmä] = 'Kielivalinnat'
	,[Kielen taso] = null
	,[Vuosiluokat] = 'Luokat 7-9'
	,[Vuosiluokka] = 'Tietoa ei kerätty (7-9)'

	,[Opetuksen järjestäjä] = d3.koulutuksen_jarjestaja
	,[Oppilaitoksen omistajatyyppi] = d3.oppilaitoksen_omistajatyyppi
	,[Oppilaitostyyppi] = d3.oppilaitostyyppi
	,[Oppilaitoksen maakunta] = d4.maakunta
	,[Oppilaitoksen kunta] = d4.kunta
	,[Oppilaitos] = d3.oppilaitos + ' (' + d3.oppilaitoskoodi + ')'
	,[Oppilaitoksen opetuskieli] = d3.opetuskieli

	--,[ainevalinnat pojat] = 0
	--,[ainevalinnat tytöt] = 0
	,[ainevalinnat yht] = 0
	--,[pojat] = f.lkm_pojat
	--,[tytöt] = f.lkm_tytot
	,[yht] = f.lkm_pojat

	--ruotsi
	,[Statistikår] = tilv
	,[Kön] = 'Pojkar'
	,[Ämne] = null
	,[Ämnesgrupp] = 'Språkval'
	,[Språknivå] = null
	,[Årsklasser] = 'Årskurserna 7–9'
	,[Årsklass] = 'Uppgifter har inte samlats in (7–9)'
	,[Utbildningsanordnare] = d3.koulutuksen_jarjestaja_SV
	,[Läroanstaltens ägartyp] = d3.oppilaitoksen_omistajatyyppi_SV
	,[Läroanstaltstyp] = d3.oppilaitostyyppi_SV
	,[Läroanstaltens landskap] = d4.maakunta_SV
	,[Läroanstaltens kommun] = d4.kunta_SV
	,[Läroanstalt] = d3.oppilaitos_SV + ' (' + d3.oppilaitoskoodi + ')'
	,[Läroanstaltens undervisningsspråk] = d3.opetuskieli_SV

	--englanti
	,[Statistical year] = tilv
	,[Gender] = 'Boys'
	,[Subject] = null
	,[Subject group] = 'Language choices'
	,[Language level] = null
	,[Year groups] = 'Grades 7-9'
	,[Year group] = 'Data not collected (7-9)'
	,[Education provider] = d3.koulutuksen_jarjestaja_EN
	,[Type of institution owner] = d3.oppilaitoksen_omistajatyyppi_EN
	,[Type of institution] = d3.oppilaitostyyppi_EN
	,[Region of the institution] = d4.maakunta_EN
	,[Municipality of the institution] = d4.kunta_EN
	,[Educational institution] = d3.oppilaitos_EN + ' (' + d3.oppilaitoskoodi + ')'
	,[Language of the institution] = d3.opetuskieli_EN

	--koodit
	,[Koodit Opetuksen järjestäjä] = d3.koulutuksen_jarjestajakoodi
	,[Koodit Oppilaitos] = d3.oppilaitoskoodi
	,[Koodit Oppilaitoksen maakunta] = d4.maakunta_koodi
	,[Koodit Oppilaitoksen kunta] = d4.kunta_koodi

	--järjestys
	,[Sukupuoli järj] = 1
	,[Aine järj] = 99999
	,[Aineryhmä järj] = 99999
	,[Kielen taso järj] = 99999
	,[Vuosiluokka järj] = d2.jarjestys
	,[Vuosiluokat järj] = d2.luokkajako_16_79_jarjestys
	,[Oppilaitoksen omistajatyyppi järj] = d3.jarjestys_omistajatyyppi
	,[Oppilaitostyyppi järj] = d3.jarjestys_oppilaitostyyppi
	,[Oppilaitoksen maakunta järj] = d4.jarjestys_maakunta
	,[Oppilaitoksen opetuskieli järj] = d3.jarjestys_opetuskieli


from dbo.f_perusopetuksen_oppilasmaarat f
inner join d_perusopetuksen_vuosiluokat d2 on d2.id=f.vuosiluokka_id
inner join d_oppilaitoksen_taustatiedot d3 on d3.id=f.oppilaitos_id
inner join d_alueluokitus d4 on d4.id=f.oppilaitoksensijainti_id
where f.lkm_pojat>0 and d2.luokkajako_16_79='Luokat 7-9'

union all

--7-9 luokkien kielivalintoja varten, tytöt
select 
	[Tilastovuosi] = tilv

	,[Sukupuoli] = 'Tytöt'

	,[Aine] = null
	,[Aineryhmä] = 'Kielivalinnat'
	,[Kielen taso] = null
	,[Vuosiluokat] = 'Luokat 7-9'
	,[Vuosiluokka] = 'Tietoa ei kerätty (7-9)'

	,[Opetuksen järjestäjä] = d3.koulutuksen_jarjestaja
	,[Oppilaitoksen omistajatyyppi] = d3.oppilaitoksen_omistajatyyppi
	,[Oppilaitostyyppi] = d3.oppilaitostyyppi
	,[Oppilaitoksen maakunta] = d4.maakunta
	,[Oppilaitoksen kunta] = d4.kunta
	,[Oppilaitos] = d3.oppilaitos + ' (' + d3.oppilaitoskoodi + ')'
	,[Oppilaitoksen opetuskieli] = d3.opetuskieli

	--,[ainevalinnat pojat] = 0
	--,[ainevalinnat tytöt] = 0
	,[ainevalinnat yht] = 0
	--,[pojat] = f.lkm_pojat
	--,[tytöt] = f.lkm_tytot
	,[yht] = f.lkm_tytot

	--ruotsi
	,[Statistikår] = tilv
	,[Kön] = 'Flickor'
	,[Ämne] = null
	,[Ämnesgrupp] = 'Språkval'
	,[Språknivå] = null
	,[Årsklasser] = 'Årskurserna 7–9'
	,[Årsklass] = 'Uppgifter har inte samlats in (7–9)'
	,[Utbildningsanordnare] = d3.koulutuksen_jarjestaja_SV
	,[Läroanstaltens ägartyp] = d3.oppilaitoksen_omistajatyyppi_SV
	,[Läroanstaltstyp] = d3.oppilaitostyyppi_SV
	,[Läroanstaltens landskap] = d4.maakunta_SV
	,[Läroanstaltens kommun] = d4.kunta_SV
	,[Läroanstalt] = d3.oppilaitos_SV + ' (' + d3.oppilaitoskoodi + ')'
	,[Läroanstaltens undervisningsspråk] = d3.opetuskieli_SV

	--englanti
	,[Statistical year] = tilv
	,[Gender] = 'Girls'
	,[Subject] = null
	,[Subject group] = 'Language choices'
	,[Language level] = null
	,[Year groups] = 'Grades 7-9'
	,[Year group] = 'Data not collected (7-9)'
	,[Education provider] = d3.koulutuksen_jarjestaja_EN
	,[Type of institution owner] = d3.oppilaitoksen_omistajatyyppi_EN
	,[Type of institution] = d3.oppilaitostyyppi_EN
	,[Region of the institution] = d4.maakunta_EN
	,[Municipality of the institution] = d4.kunta_EN
	,[Educational institution] = d3.oppilaitos_EN + ' (' + d3.oppilaitoskoodi + ')'
	,[Language of the institution] = d3.opetuskieli_EN

	--koodit
	,[Koodit Opetuksen järjestäjä] = d3.koulutuksen_jarjestajakoodi
	,[Koodit Oppilaitos] = d3.oppilaitoskoodi
	,[Koodit Oppilaitoksen maakunta] = d4.maakunta_koodi
	,[Koodit Oppilaitoksen kunta] = d4.kunta_koodi

	--järjestys
	,[Sukupuoli järj] = 1
	,[Aine järj] = 99999
	,[Aineryhmä järj] = 99999
	,[Kielen taso järj] = 99999
	,[Vuosiluokka järj] = d2.jarjestys
	,[Vuosiluokat järj] = d2.luokkajako_16_79_jarjestys
	,[Oppilaitoksen omistajatyyppi järj] = d3.jarjestys_omistajatyyppi
	,[Oppilaitostyyppi järj] = d3.jarjestys_oppilaitostyyppi
	,[Oppilaitoksen maakunta järj] = d4.jarjestys_maakunta
	,[Oppilaitoksen opetuskieli järj] = d3.jarjestys_opetuskieli


from dbo.f_perusopetuksen_oppilasmaarat f
inner join d_perusopetuksen_vuosiluokat d2 on d2.id=f.vuosiluokka_id
inner join d_oppilaitoksen_taustatiedot d3 on d3.id=f.oppilaitos_id
inner join d_alueluokitus d4 on d4.id=f.oppilaitoksensijainti_id
where f.lkm_tytot>0 and d2.luokkajako_16_79='Luokat 7-9'







GO


USE [ANTERO]