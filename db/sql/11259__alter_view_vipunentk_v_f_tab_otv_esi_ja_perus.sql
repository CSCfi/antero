USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_otv_esi_ja_perus]    Script Date: 6.10.2025 11.02.23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


















CREATE OR ALTER  VIEW [dbo].[v_f_tab_otv_esi_ja_perus] AS

SELECT --TOP 100
	[Tilastovuosi] = tilastointivuosi
	,[Sukupuoli] = case d1.sukupuoli when 'Mies' then 'Pojat' when 'Nainen' then 'Tytöt' else 'Tuntematon' end
	,[Oppilaitoksen omistajatyyppi] = d2.oppilaitoksen_omistajatyyppi
	,[Oppilaitostyyppi] = d2.oppilaitostyyppi
	,[Oppilaitos] = d2.oppilaitos + ' (' + d2.oppilaitoskoodi + ')'
	,[Oppilaitoksen AVI] = d3.avi
	,[Oppilaitoksen ELY] = d3.ely
	,[Oppilaitoksen maakunta] = d3.maakunta
	,[Oppilaitoksen seutukunta] = d3.seutukunta
	,[Oppilaitoksen sijaintikunnan kuntaryhmä] = d3.kuntaryhma
	,[Oppilaitoksen kunta] = d3.kunta
	,[Oppilaitoksen opetuskieli] = d2.opetuskieli
	,[Opetuksen järjestäjä] = coalesce(nullif(d2a.koulutuksen_jarjestaja,''),d2.koulutuksen_jarjestaja)
	--Historia
	,[Oppilaitoksen omistajatyyppi _] = d2b.oppilaitoksen_omistajatyyppi
	,[Oppilaitostyyppi _] = d2b.oppilaitostyyppi
	,[Oppilaitos _] =  d2b.oppilaitos + ' (' + d2b.oppilaitoskoodi + ')'
	,[Oppilaitoskoodi] = d2b.oppilaitoskoodi
	,[Oppilaitoksen opetuskieli _] = d2b.opetuskieli
	,[Koulutuksen järjestäjä _] = d2b.koulutuksen_jarjestaja
	,[Opetuksen järjestäjä _] = d2b.koulutuksen_jarjestaja


	--mittarit
	,[Esiopetuksen oppilaat] = sum(f.ove)
	--,[Varhaiskasvatuksen yhteydessä annetun esiopetuksen oppilaat] = 0 --tietojen yhdistämistä varten; yllä vain opetustoimen esiopetus. JS 25.9.2023
	,[Varhaiskasvatuksen esiopetusoppilaat] = 0 --tietojen yhdistämistä varten; yllä vain opetustoimen esiopetus. JS 25.9.2023
	,[1. luokan oppilaat] = sum(f.ov1)
	,[2. luokan oppilaat] = sum(f.ov2)
	,[3. luokan oppilaat] = sum(f.ov3)
	,[4. luokan oppilaat] = sum(f.ov4)
	,[5. luokan oppilaat] = sum(f.ov5)
	,[6. luokan oppilaat] = sum(f.ov6)
	,[7. luokan oppilaat] = sum(f.ov7)
	,[8. luokan oppilaat] = sum(f.ov8)
	,[9. luokan oppilaat] = sum(f.ov9)
	,[Lisäopetuksen oppilaat] = sum(f.ov10)
	,[1.-6. luokkien oppilaat] = sum(isnull(f.ov1,0))+sum(isnull(f.ov2,0))+sum(isnull(f.ov3,0))+sum(isnull(f.ov4,0))+sum(isnull(f.ov5,0))+sum(isnull(f.ov6,0))
	,[7.-9. luokkien oppilaat] = sum(isnull(f.ov7,0))+sum(isnull(f.ov8,0))+sum(isnull(f.ov9,0))
	,[Perusopetuksen suorittaneet] = sum(isnull(f.tod,0))+sum(isnull(f.tutkt,0))
	,[1. luokalle jääneet] = sum(f.luok1)
	,[2. luokalle jääneet] = sum(f.luok2)
	,[3. luokalle jääneet] = sum(f.luok3)
	,[4. luokalle jääneet] = sum(f.luok4)
	,[5. luokalle jääneet] = sum(f.luok5)
	,[6. luokalle jääneet] = sum(f.luok6)
	,[7. luokalle jääneet] = sum(f.luok7)
	,[8. luokalle jääneet] = sum(f.luok8)
	,[9. luokalle jääneet] = sum(f.luok9)

	--Ruotsi
	,[Statistikår] = tilastointivuosi
	,[Kön] = case d1.sukupuoli_SV when 'Man' then 'Pojkar' when 'Kvinna' then 'Flickor' else 'Okänd' end
	,[Läroanstaltens ägartyp] = d2.oppilaitoksen_omistajatyyppi_SV
	,[Läroanstaltstyp] = d2.oppilaitostyyppi_SV
	,[Läroanstalt] = d2.oppilaitos_SV + ' (' + d2.oppilaitoskoodi + ')'
	,[Läroanstaltens RFV-område] = d3.avi_SV
	,[Läroanstaltens NMT-område] = d3.ely_SV
	,[Läroanstaltens landskap] = d3.maakunta_SV
	,[Läroanstaltens ekonomisk region] = d3.seutukunta_SV
	,[Läroanstaltens kommungrupp] = d3.kuntaryhma_SV
	,[Läroanstaltens kommun] = d3.kunta_SV
	,[Läroanstaltens undervisningsspråk] = d2.opetuskieli_SV
	,[Utbildningsordnare] = d2.koulutuksen_jarjestaja_SV --Utbildningsanordnare
	--Historia
	,[Läroanstaltens ägartyp _] = d2b.oppilaitoksen_omistajatyyppi_SV
	,[Läroanstaltstyp _] = d2b.oppilaitostyyppi_SV
	,[Läroanstalt _] = d2b.oppilaitos_SV + ' (' + d2b.oppilaitoskoodi + ')'
	,[Läroanstaltens undervisningsspråk _] = d2b.opetuskieli_SV
	,[Utbildningsordnare _] = d2b.koulutuksen_jarjestaja_SV
	,[Undervisningsanordnare _] = d2b.koulutuksen_jarjestaja_SV

	--Englanti
	,[Statistical year] = tilastointivuosi
	,[Gender] = case d1.sukupuoli_EN when 'Male' then 'Boys' when 'Female' then 'Girls' else 'Unknown' end
	,[Type of institution owner] = d2.oppilaitoksen_omistajatyyppi_EN
	,[Type of institution] = d2.oppilaitostyyppi_EN
	,[Educational institution] = d2.oppilaitos_EN + ' (' + d2.oppilaitoskoodi + ')'
	,[AVI area of the institution] = d3.avi_EN
	,[ELY area of the institution] = d3.ely_EN
	,[Region of the institution] = d3.maakunta_EN
	,[Subregion of the institution] = d3.seutukunta_EN
	,[Municipality group of the institution] = d3.kuntaryhma_EN
	,[Municipality of the institution] = d3.kunta_EN
	,[Language of the institution] = d2.opetuskieli_EN
	,[Education provider] = d2.koulutuksen_jarjestaja_EN
	--Historia
	,[Type of institution owner _] = d2b.oppilaitoksen_omistajatyyppi_EN
	,[Type of institution _] = d2b.oppilaitostyyppi_EN
	,[Educational institution _] = d2b.oppilaitos_EN + ' (' + d2b.oppilaitoskoodi + ')'
	,[Language of the institution _] = d2b.opetuskieli_EN
	,[Education provider _] = d2b.koulutuksen_jarjestaja_EN

	--koodimuuttujat
	,[Koodit Oppilaitoksen maakunta] = d3.maakunta_koodi
	,[Koodit Oppilaitoksen kunta] = d3.kunta_koodi

	--järjestys
	,[Sukupuoli jarj] = d1.jarjestys
	,[Oppilaitoksen omistajatyyppi jarj] = d2.jarjestys_omistajatyyppi
	,[Oppilaitostyyppi jarj] = d2.jarjestys_oppilaitostyyppi
	,[Oppilaitoksen AVI jarj] = d3.jarjestys_avi
	,[Oppilaitoksen maakunta jarj] = d3.jarjestys_maakunta
	,[Oppilaitoksen opetuskieli jarj] = d2.jarjestys_opetuskieli
	--Historia
	,[Oppil. omistajatyyppi jarj] = d2b.jarjestys_omistajatyyppi
	,[Oppilaitoksen tyyppi jarj] = d2b.jarjestys_oppilaitostyyppi
	,[Oppil. maakunta jarj] = d3b.jarjestys_maakunta
	,[Oppil. opetuskieli jarj] = d2b.jarjestys_opetuskieli

from [dbo].[f_OTV_2_1_R2_22_Peruskoulutiedosto_Oppilaitostason_oppil_ja_opisk] f
left join VipunenTK.dbo.d_sukupuoli d1 on d1.id=f.sukupuoli_id
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d2 on d2.id=f.oppilaitos_id
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d2a on d2a.oppilaitos_avain=d2.koulutuksen_jarjestajan_korvaavakoodi
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot_historia d2b on d2b.id=f.oppilaitos_historia_id
left join VipunenTK.dbo.d_alueluokitus d3 on d3.id=f.oppilaitoksen_sijaintikunta_id
left join VipunenTK.dbo.d_alueluokitus_historia d3b on d3b.id=f.oppilaitoksen_sijaintikunta_historia_id
where f.oppilaitoksen_sijaintikunta<>200 and d1.sukupuoli<>'Tuntematon'

group by tilastointivuosi
	,d1.sukupuoli
	,d2.oppilaitoksen_omistajatyyppi
	,d2.oppilaitostyyppi
	,d2.oppilaitos
	,d3.avi
	,d3.maakunta
	,d3.kunta
	,d2.opetuskieli
	,d1.jarjestys
	,d2.jarjestys_omistajatyyppi
	,d2.jarjestys_oppilaitostyyppi
	,d3.jarjestys_avi
	,d3.jarjestys_maakunta
	,d2.jarjestys_opetuskieli
	,d1.sukupuoli_SV
	,d2.oppilaitoksen_omistajatyyppi_SV 
	,d2.oppilaitostyyppi_SV
	,d2.oppilaitos_SV
	,d3.avi_SV
	,d3.maakunta_SV
	,d3.kunta_SV
	,d2.opetuskieli_SV
	,d1.sukupuoli_EN
	,d2.oppilaitoksen_omistajatyyppi_EN
	,d2.oppilaitostyyppi_EN
	,d2.oppilaitos_EN
	,d3.avi_EN
	,d3.maakunta_EN
	,d3.kunta_EN
	,d2.opetuskieli_EN
	,d3.maakunta_koodi
	,d3.kunta_koodi
	,d3.ely
	,d3.seutukunta
	,d3.kuntaryhma
	,d3.ely_SV
	,d3.seutukunta_SV
	,d3.kuntaryhma_SV
	,d3.ely_EN
	,d3.seutukunta_EN
	,d3.kuntaryhma_EN
	,d2.koulutuksen_jarjestaja
	,d2.koulutuksen_jarjestaja_SV
	,d2.koulutuksen_jarjestaja_EN
	,d2b.oppilaitoksen_omistajatyyppi_SV
	,d2b.oppilaitostyyppi_SV
	,d2b.oppilaitos_SV
	,d3b.avi_SV
	,d3b.ely_SV
	,d3b.maakunta_SV
	,d3b.seutukunta_SV
	,d3b.kuntaryhma_SV
	,d3b.kunta_SV
	,d2b.opetuskieli_SV
	,d2b.koulutuksen_jarjestaja_SV
	,d2b.oppilaitoksen_omistajatyyppi_EN
	,d2b.oppilaitostyyppi_EN
	,d2b.oppilaitos_EN
	,d3b.avi_EN
	,d3b.ely_EN
	,d3b.maakunta_EN
	,d3b.seutukunta_EN
	,d3b.kuntaryhma_EN
	,d3b.kunta_EN
	,d2b.opetuskieli_EN
	,d2b.koulutuksen_jarjestaja_EN
	,d2b.oppilaitoksen_omistajatyyppi
	,d2b.oppilaitostyyppi
	,d2b.oppilaitos
	,d2b.oppilaitoskoodi
	,d2b.opetuskieli
	,d2b.koulutuksen_jarjestaja
	,d2b.jarjestys_omistajatyyppi
	,d2b.jarjestys_oppilaitostyyppi
	,d3b.jarjestys_maakunta
	,d2b.jarjestys_opetuskieli
	,d2a.koulutuksen_jarjestaja
	,d2.oppilaitoskoodi

having sum(f.ove)>0 
	or sum(f.ov1)>0
	or sum(f.ov2)>0
	or sum(f.ov3)>0
	or sum(f.ov4)>0
	or sum(f.ov5)>0
	or sum(f.ov6)>0
	or sum(f.ov7)>0
	or sum(f.ov8)>0
	or sum(f.ov9)>0
	or sum(f.ov10)>0
	or sum(f.tod)>0
	or sum(f.tutkt)>0
	or sum(f.luok1)>0
	or sum(f.luok2)>0
	or sum(f.luok3)>0
	or sum(f.luok4)>0
	or sum(f.luok5)>0
	or sum(f.luok6)>0
	or sum(f.luok7)>0
	or sum(f.luok8)>0
	or sum(f.luok9)>0


  UNION ALL


SELECT --TOP 100
    [Tilastovuosi] = [tilv]
	,[Sukupuoli] = case d1.sukupuoli when 'Mies' then 'Pojat' when 'Nainen' then 'Tytöt' else 'Tuntematon' end
	,[Oppilaitoksen omistajatyyppi] = d2.[koulutuksen_jarjestajan_omistajatyyppi]
	,[Oppilaitostyyppi] = 'Varhaiskasvatuksen toimipiste'
	,[Oppilaitos] = d2.koulutuksen_jarjestaja + ' (' + d2.koulutuksen_jarjestajakoodi + ')'
	,[Oppilaitoksen AVI] = d4.avi
	,[Oppilaitoksen ELY] = d4.ely
	,[Oppilaitoksen maakunta] = d4.maakunta
	,[Oppilaitoksen seutukunta] = d4.seutukunta
	,[Oppilaitoksen sijaintikunnan kuntaryhmä] = d4.kuntaryhma
	,[Oppilaitoksen kunta] = d4.kunta
	,[Oppilaitoksen opetuskieli] = d7.opetuskieli
	--,[Oppilaitoksen opetuskieli] = case d2.[koulutuksen_jarjestajan_kieli]
	--   when 'Suomenkielinen' then 'suomi'
	--   when 'Kaksikielinen (pääosin suomenkielinen)' then 'suomi/ruotsi'
	--   when 'Kaksikielinen (pääosin ruotsinkielinen)' then 'suomi/ruotsi'
	--   when 'Ruotsinkielinen' then 'ruotsi'
	--   else 'Tuntematon' end
	,[Opetuksen järjestäjä] = coalesce(nullif(d3.koulutuksen_jarjestaja,''), d2.koulutuksen_jarjestaja)

    --Historia
	,[Oppilaitoksen omistajatyyppi _] = d5.koulutuksen_jarjestajan_omistajatyyppi
	,[Oppilaitostyyppi _] = 'Varhaiskasvatus'
	,[Oppilaitos _] =  d5.koulutuksen_jarjestaja + ' (' + d5.koulutuksen_jarjestajakoodi + ')'
	,[Oppilaitoskoodi] = d2.koulutuksen_jarjestajakoodi
	,[Oppilaitoksen opetuskieli _] = d5.opetuskieli
	--,[Oppilaitoksen opetuskieli _] = case d5.[koulutuksen_jarjestajan_kieli]
	--   when 'Suomenkielinen' then 'suomi'
	--   when 'Kaksikielinen (pääosin suomenkielinen)' then 'suomi/ruotsi'
	--   when 'Kaksikielinen (pääosin ruotsinkielinen)' then 'suomi/ruotsi'
	--   when 'Ruotsinkielinen' then 'ruotsi'
	--   else 'Tuntematon' end
	,[Koulutuksen järjestäjä _] = d5.koulutuksen_jarjestaja
	,[Opetuksen järjestäjä _] = d5.koulutuksen_jarjestaja

	--mittarit
	,[Esiopetuksen oppilaat] = 0
	--,[Varhaiskasvatuksen yhteydessä annetun esiopetuksen oppilaat] = lkm --tietojen yhdistämistä varten; yllä vain opetustoimen esiopetus. JS 25.9.2023
	,[Varhaiskasvatuksen esiopetusoppilaat] = lkm --tietojen yhdistämistä varten; yllä vain opetustoimen esiopetus. JS 25.9.2023
	,[1. luokan oppilaat] = 0
	,[2. luokan oppilaat] = 0
	,[3. luokan oppilaat] = 0
	,[4. luokan oppilaat] = 0
	,[5. luokan oppilaat] = 0
	,[6. luokan oppilaat] = 0
	,[7. luokan oppilaat] = 0
	,[8. luokan oppilaat] = 0
	,[9. luokan oppilaat] = 0
	,[Lisäopetuksen oppilaat] = 0
	,[1.-6. luokkien oppilaat] = 0
	,[7.-9. luokkien oppilaat] = 0
	,[Perusopetuksen suorittaneet] = 0
	,[1. luokalle jääneet] = 0
	,[2. luokalle jääneet] = 0
	,[3. luokalle jääneet] = 0
	,[4. luokalle jääneet] = 0
	,[5. luokalle jääneet] = 0
	,[6. luokalle jääneet] = 0
	,[7. luokalle jääneet] = 0
	,[8. luokalle jääneet] = 0
	,[9. luokalle jääneet] = 0

	--Ruotsi
	,[Statistikår] = [tilv]
	,[Kön] = case d1.sukupuoli_SV when 'Man' then 'Pojkar' when 'Kvinna' then 'Flickor' else 'Okänd' end
	,[Läroanstaltens ägartyp] = d2.oppilaitoksen_omistajatyyppi_SV
	,[Läroanstaltstyp] = 'Småbarnspedagogik'
	,[Läroanstalt] = d2.koulutuksen_jarjestaja_SV + ' (' + d2.koulutuksen_jarjestajakoodi + ')'
	,[Läroanstaltens RFV-område] = d4.avi_SV
	,[Läroanstaltens NMT-område] = d4.ely_SV
	,[Läroanstaltens landskap] = d4.maakunta_SV
	,[Läroanstaltens ekonomisk region] = d4.seutukunta_SV
	,[Läroanstaltens kommungrupp] = d4.kuntaryhma_SV
	,[Läroanstaltens kommun] = d4.kunta_SV
	,[Läroanstaltens undervisningsspråk] = d7.opetuskieli_SV
	--,[Läroanstaltens undervisningsspråk] = case d2.[koulutuksen_jarjestajan_kieli]
	--   when 'Suomenkielinen' then 'finska'
	--   when 'Kaksikielinen (pääosin suomenkielinen)' then 'finska/svenska'
	--   when 'Kaksikielinen (pääosin ruotsinkielinen)' then 'finska/svenska'
	--   when 'Ruotsinkielinen' then 'svenska'
	--   else 'Okänd' end
	,[Utbildningsordnare] = d2.koulutuksen_jarjestaja_SV --Utbildningsanordnare
	--Historia
	,[Läroanstaltens ägartyp _] = d5.koulutuksen_jarjestajan_omistajatyyppi_SV
	,[Läroanstaltstyp _] = 'Småbarnspedagogik'
	,[Läroanstalt _] = d5.koulutuksen_jarjestaja_SV + ' (' + d5.koulutuksen_jarjestajakoodi + ')'
	,[Läroanstaltens undervisningsspråk _] = d5.opetuskieli_SV
	--,[Läroanstaltens undervisningsspråk _] = case d5.koulutuksen_jarjestajan_kieli
	--   when 'Suomenkielinen' then 'finska'
	--   when 'Kaksikielinen (pääosin suomenkielinen)' then 'finska/svenska'
	--   when 'Kaksikielinen (pääosin ruotsinkielinen)' then 'finska/svenska'
	--   when 'Ruotsinkielinen' then 'svenska'
	--   else 'Okänd' end
	,[Utbildningsordnare _] = d5.koulutuksen_jarjestaja_SV
	,[Undervisningsanordnare _] = d5.koulutuksen_jarjestaja_SV


	--Englanti
	,[Statistical year] = [tilv]
	,[Gender] = case d1.sukupuoli_EN when 'Male' then 'Boys' when 'Female' then 'Girls' else 'Unknown' end
	,[Type of institution owner] = d2.oppilaitoksen_omistajatyyppi_EN
	,[Type of institution] = 'Pre-primary education'
	,[Educational institution] = d2.koulutuksen_jarjestaja_EN + ' (' + d2.koulutuksen_jarjestajakoodi + ')'
	,[AVI area of the institution] = d4.avi_EN
	,[ELY area of the institution] = d4.ely_EN
	,[Region of the institution] = d4.maakunta_EN
	,[Subregion of the institution] = d4.seutukunta_EN
	,[Municipality group of the institution] = d4.kuntaryhma_EN
	,[Municipality of the institution] = d4.kunta_EN
	,[Language of the institution] = d7.opetuskieli_EN
	--,[Language of the institution] = case d2.koulutuksen_jarjestajan_kieli
	--   when 'Suomenkielinen' then 'Finnish'
	--   when 'Kaksikielinen (pääosin suomenkielinen)' then 'Finnish/Swedish'
	--   when 'Kaksikielinen (pääosin ruotsinkielinen)' then 'Finnish/Swedish'
	--   when 'Ruotsinkielinen' then 'Swedish'
	--   else 'Unknown' end
	,[Education provider] = d2.koulutuksen_jarjestaja_EN
	--Historia
	,[Type of institution owner _] = d5.oppilaitoksen_omistajatyyppi_EN
	,[Type of institution _] = 'Pre-primary education'
	,[Educational institution _] = d5.koulutuksen_jarjestaja_EN + ' (' + d5.koulutuksen_jarjestajakoodi + ')'
	,[Language of the institution _] = d5.opetuskieli_EN
	--,[Language of the institution _] = case d5.koulutuksen_jarjestajan_kieli
	--   when 'Suomenkielinen' then 'Finnish'
	--   when 'Kaksikielinen (pääosin suomenkielinen)' then 'Finnish/Swedish'
	--   when 'Kaksikielinen (pääosin ruotsinkielinen)' then 'Finnish/Swedish'
	--   when 'Ruotsinkielinen' then 'Swedish'
	--   else 'Unknown' end
	,[Education provider _] = d5.koulutuksen_jarjestaja_EN
	
	--koodimuuttujat
	,[Koodit Oppilaitoksen maakunta] = d4.maakunta_koodi
	,[Koodit Oppilaitoksen kunta] = d4.kunta_koodi

	--järjestys
	,[Sukupuoli jarj] = d1.jarjestys
	,[Oppilaitoksen omistajatyyppi jarj] = case d2.koulutuksen_jarjestajan_omistajatyyppi
	   when 'Yksityinen' then '1'
	   when 'Valtio' then '2'
	   when 'Kunta' then '3'
	   when 'Kuntayhtymä' then '4'
	   else 'öö' end
	,[Oppilaitostyyppi jarj] = '10'
	,[Oppilaitoksen AVI jarj] = d4.jarjestys_avi
	,[Oppilaitoksen maakunta jarj] = d4.jarjestys_maakunta
	,[Oppilaitoksen opetuskieli jarj] = d7.jarjestys
	--,[Oppilaitoksen opetuskieli jarj] = case d2.[koulutuksen_jarjestajan_kieli]
	--   when 'Suomenkielinen' then '1'
	--   when 'Kaksikielinen (pääosin suomenkielinen)' then '3'
	--   when 'Kaksikielinen (pääosin ruotsinkielinen)' then '3'
	--   when 'Ruotsinkielinen' then '2'
	--   else 'öö' end

	--Historia
	,[Oppil. omistajatyyppi jarj] = case d5.koulutuksen_jarjestajan_omistajatyyppi
	   when 'Yksityinen' then '1'
	   when 'Valtio' then '2'
	   when 'Kunta' then '3'
	   when 'Kuntayhtymä' then '4'
	   else 'öö' end
	,[Oppilaitoksen tyyppi jarj] = '10'
	,[Oppil. maakunta jarj] = d6.jarjestys_maakunta
	,[Oppil. opetuskieli jarj] = d5.jarjestys_opetuskieli
	--,[Oppil. opetuskieli jarj] = case d5.[koulutuksen_jarjestajan_kieli]
	--   when 'Suomenkielinen' then '1'
	--   when 'Kaksikielinen (pääosin suomenkielinen)' then '3'
	--   when 'Kaksikielinen (pääosin ruotsinkielinen)' then '3'
	--   when 'Ruotsinkielinen' then '2'
	--   else 'öö' end
  
FROM v_f_varhaiskasvatuksen_esiopetukseen_osallistujat

LEFT JOIN VipunenTK..d_sukupuoli AS d1 ON d1.sukupuoli_koodi=sp AND tilv_date between d1.alkaa and d1.paattyy
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot AS d2 ON d2.id = oppilaitoksen_taustatiedot_id
LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot d3 on d3.oppilaitos_avain=d2.koulutuksen_jarjestajan_korvaavakoodi
LEFT JOIN VipunenTK..d_alueluokitus AS d4 ON d4.id = alueluokitus_id

LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia AS d5 ON d5.id = oppilaitoksen_taustatiedot_historia_id
LEFT JOIN VipunenTK..d_alueluokitus AS d6 ON d6.id = alueluokitus_historia_id
LEFT JOIN VipunenTK..d_opetuskieli AS d7 ON d7.id = opetuskieli_id








GO


