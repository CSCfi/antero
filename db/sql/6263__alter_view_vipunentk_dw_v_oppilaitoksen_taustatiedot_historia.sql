USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_oppilaitoksen_taustatiedot_historia]    Script Date: 21.6.2022 22:48:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[v_oppilaitoksen_taustatiedot_historia] AS

/* 
3.1.2014 Jarmo. Muutettu ainoan oppilaitoksen haku koskemaan vain yliopistoja ja ammattikorkeakouluja
24.2.2014 Jarmo. Lisätty oppilaitos_avain-kenttä ja sen vaatima käsittely.
21.6.2022 Juha. Muutettu ainoan oppilaitoksen päättely vaatimaan yhden rivin sijaan yhtä korvaavaa/oppilaitoskoodia, koska toinen LAB-järjestäjä säilyi "yhdistymisessä".

--Aletaan käyttää historia- ja nykytilaversioita
Drop table VipunenTK.dbo.d_oppilaitoksen_taustatiedot_historia
Select * into VipunenTK.dbo.d_oppilaitoksen_taustatiedot_historia from v_oppilaitoksen_taustatiedot_historia
Truncate table VipunenTK.dbo.d_oppilaitoksen_taustatiedot_historia
Delete from VipunenTK.dbo.d_oppilaitoksen_taustatiedot_historia
Insert into VipunenTK.dbo.d_oppilaitoksen_taustatiedot_historia
  Select * from v_oppilaitoksen_taustatiedot_historia
*/

SELECT [id]
      ,[oppilaitos_avain]
      ,[oppilaitoskoodi]
      ,[oppilaitoksen_korvaavakoodi]
      ,[alkaa]
      ,[paattyy]
      ,[oppilaitos]
      ,[oppilaitos_SV]
      ,[oppilaitos_EN]
      ,[sairaalakoulukoodi]
      ,[sairaalakoulu]
      ,[sairaalakoulu_SV]
      ,[sairaalakoulu_EN]
      ,[oppilaitostyyppikoodi]
      ,[oppilaitostyyppi]
      ,[oppilaitostyyppi_SV]
      ,[oppilaitostyyppi_EN]
      ,[peruskoulujen_ryhmityskoodi]
      ,[peruskoulujen_ryhmitys]
      ,[peruskoulujen_ryhmitys_SV]
      ,[peruskoulujen_ryhmitys_EN]
      ,[peruskoulujen_vuosilkskoodi]
      ,[peruskoulujen_vuosilks]
      ,[peruskoulujen_vuosilks_SV]
      ,[peruskoulujen_vuosilks_EN]
      ,[oppilaitoksen_omistajatyyppikoodi]
      ,[oppilaitoksen_omistajatyyppi]
      ,[oppilaitoksen_omistajatyyppi_SV]
      ,[oppilaitoksen_omistajatyyppi_EN]
      ,[opetuskielikoodi]
      ,[opetuskieli]
      ,[opetuskieli_SV]
      ,[opetuskieli_EN]
      ,[sijaintikuntakoodi]
      ,[oppilaitoksen_sijaintikunta]
      ,[oppilaitoksen_sijaintikunta_SV]
      ,[oppilaitoksen_sijaintikunta_EN]
      ,[koordinaatti_itakoodi]
      ,[koordinaatti_pohjoiskoodi]
      ,[postinumerokoodi]
      ,jarjestys_oppilaitos = Cast(Left(Isnull(Nullif([oppilaitos],'Tuntematon'),'ööö'),10) as nvarchar(10)) --ol.[jarjestys]
      ,[jarjestys_sairaalakoulu] = Cast(Left(Isnull(Nullif([sairaalakoulukoodi],'-1'),'ööö'),10) as nvarchar(10)) --ol.[jarjestys_sairaalakoulu]
      ,jarjestys_oppilaitostyyppi = Cast(Left(Isnull(Nullif([oppilaitostyyppikoodi],'-1'),'ööö'),10) as nvarchar(10)) --ol.[jarjestys_oppilaitostyyppi]
      ,jarjestys_peruskoulujen_ryhmitys = Cast(Left(Isnull(Nullif([peruskoulujen_ryhmityskoodi],'-1'),'ööö'),10) as nvarchar(10)) --ol.[jarjestys_peruskoulujen_ryhmitys]
      ,jarjestys_peruskoulujen_vuosilks = Cast(Left(Isnull(Nullif([peruskoulujen_vuosilkskoodi],'-1'),'ööö'),10) as nvarchar(10)) --ol.[jarjestys_peruskoulujen_vuosilks]
      ,jarjestys_omistajatyyppi = Cast(Left(Isnull(Nullif([oppilaitoksen_omistajatyyppikoodi],'-1'),'ööö'),10) as nvarchar(10)) --ol.[jarjestys_omistajatyyppi]
      ,jarjestys_opetuskieli = Cast(Left(Isnull(Nullif([opetuskielikoodi],'-1'),'ööö'),10) as nvarchar(10)) --ol.[jarjestys_opetuskieli]
      ,jarjestys_koulutuksen_jarjestaja = Cast(Left(Isnull(Nullif([koulutuksen_jarjestaja],'Tuntematon'),'ööö'),10) as nvarchar(10)) --ol.[jarjestys_koulutuksen_jarjestaja]
      ,[jarjestys_sijaintikunta] = Cast(Left(Isnull(Nullif([oppilaitoksen_sijaintikunta],'Tuntematon'),'ööö'),10) as nvarchar(10)) --ol.[jarjestys_sijaintikunta]
      ,jarjestys_koordinaatti_ita = Cast(Left(Isnull(Nullif([koordinaatti_itakoodi],'-1'),'ööö'),10) as nvarchar(10)) --ol.[jarjestys_koordinaatti_ita]
      ,jarjestys_koordinaatti_pohjois = Cast(Left(Isnull(Nullif([koordinaatti_pohjoiskoodi],'-1'),'ööö'),10) as nvarchar(10)) --ol.[jarjestys_koordinaatti_pohjois]
      ,jarjestys_postinumero = Cast(Left(Isnull(Nullif([postinumerokoodi],'-1'),'ööö'),10) as nvarchar(10)) --ol.[jarjestys_postinumero]
      ,[tietolahde_oppilaitos]
      ,[koulutuksen_jarjestajakoodi]
      ,[koulutuksen_jarjestajan_korvaavakoodi]
      ,[koulutuksen_jarjestaja]
      ,[koulutuksen_jarjestaja_SV]
      ,[koulutuksen_jarjestaja_EN]
      ,[koulutuksen_jarjestajan_omistajatyyppikoodi]
      ,[koulutuksen_jarjestajan_omistajatyyppi]
      ,[koulutuksen_jarjestajan_omistajatyyppi_SV]
      ,[koulutuksen_jarjestajan_omistajatyyppi_EN]
      ,[koulutuksen_jarjestajan_kielikoodi]
      ,[koulutuksen_jarjestajan_kieli]
      ,[koulutuksen_jarjestajan_kieli_SV]
      ,[koulutuksen_jarjestajan_kieli_EN]
      ,[koulutuksen_jarjestajan_ksijaintikuntakoodi]
      ,[koulutuksen_jarjestajan_sijaintikunta]
      ,[koulutuksen_jarjestajan_sijaintikunta_SV]
      ,[koulutuksen_jarjestajan_sijaintikunta_EN]
      ,[jarjestys_koulutuksenjarjestaja] = Cast(Left(Isnull(Nullif([koulutuksen_jarjestaja],'Tuntematon'),'ööö'),10) as nvarchar(10)) --COALESCE(kj_alkaa.[jarjestys], kj_paattyy.[jarjestys], kj_tuntematon.jarjestys)
      ,jarjestys_koulutuksen_jarjestajan_kieli = Cast(Left(Isnull(Nullif([koulutuksen_jarjestajan_kielikoodi],'-1'),'ööö'),10) as nvarchar(10)) --[jarjestys_koulutuksen_jarjestajan_kieli] = COALESCE(kj_alkaa.[jarjestys_koulutuksen_jarjestajan_kieli], kj_paattyy.[jarjestys_koulutuksen_jarjestajan_kieli], kj_tuntematon.jarjestys_koulutuksen_jarjestajan_kieli)
      ,[jarjestys_sijaintikunta_koulutuksenjarjestaja] = Cast(Left(Isnull(Nullif([koulutuksen_jarjestajan_sijaintikunta],'Tuntematon'),'ööö'),10) as nvarchar(10)) --COALESCE(kj_alkaa.[jarjestys_sijaintikunta], kj_paattyy.[jarjestys_sijaintikunta], kj_tuntematon.jarjestys_sijaintikunta)
      ,[tietolahde_koulutuksenjarjestaja]
      ,[koulutuksen_jarjestajan_ainoa_oppilaitos]
  FROM ( --kaikki

SELECT 
-- oppilaitos
       ol.[id]
      ,[oppilaitos_avain] = Cast(ol.[oppilaitos_avain] as nvarchar(10))
      ,[oppilaitoskoodi] = Cast(ol.[oppilaitoskoodi] as nvarchar(10))
      ,oppilaitoksen_korvaavakoodi = ol.[korvaavakoodi]
      ,ol.[alkaa]
      ,[paattyy] = ISNULL(ol.[paattyy], Cast('9999-01-01' as date))
      --,[viimeisin_tilv]
      ,[oppilaitos] = ol.[oppilaitosselite_FI]
      ,[oppilaitos_SV] = ol.[oppilaitosselite_SV]
      ,[oppilaitos_EN] = ol.[oppilaitosselite_EN]
      ,ol.[sairaalakoulukoodi]
      ,[sairaalakoulu] = ol.[sairaalakouluselite_FI]
      ,[sairaalakoulu_SV] = ol.[sairaalakouluselite_SV]
      ,[sairaalakoulu_EN] = ol.[sairaalakouluselite_EN]
      ,ol.[oppilaitostyyppikoodi]
      ,[oppilaitostyyppi] = ol.[oppilaitostyyppiselite_FI]
      ,[oppilaitostyyppi_SV] = ol.[oppilaitostyyppiselite_SV]
      ,[oppilaitostyyppi_EN] = ol.[oppilaitostyyppiselite_EN]
      ,ol.[peruskoulujen_ryhmityskoodi]
      ,peruskoulujen_ryhmitys = ol.[peruskoulujen_ryhmitysselite_FI]
      ,peruskoulujen_ryhmitys_SV = ol.[peruskoulujen_ryhmitysselite_SV]
      ,peruskoulujen_ryhmitys_EN = ol.[peruskoulujen_ryhmitysselite_EN]
      ,ol.[peruskoulujen_vuosilkskoodi]
      ,peruskoulujen_vuosilks = ol.[peruskoulujen_vuosilksselite_FI]
      ,peruskoulujen_vuosilks_SV = ol.[peruskoulujen_vuosilksselite_SV]
      ,peruskoulujen_vuosilks_EN = ol.[peruskoulujen_vuosilksselite_EN]
      ,oppilaitoksen_omistajatyyppikoodi = ol.[omistajatyyppikoodi]
      ,oppilaitoksen_omistajatyyppi = ol.[omistajatyyppiselite_FI]
      ,oppilaitoksen_omistajatyyppi_SV = ol.[omistajatyyppiselite_SV]
      ,oppilaitoksen_omistajatyyppi_EN = ol.[omistajatyyppiselite_EN]
      ,ol.[opetuskielikoodi]
      ,opetuskieli = ol.[opetuskieliselite_FI]
      ,opetuskieli_SV = ol.[opetuskieliselite_SV]
      ,opetuskieli_EN = ol.[opetuskieliselite_EN]
      --,ol.[koulutuksen_jarjestajakoodi]
      --,ol.[koulutuksen_jarjestajaselite_FI]
      --,ol.[koulutuksen_jarjestajaselite_SV]
      --,ol.[koulutuksen_jarjestajaselite_EN]
      ,ol.[sijaintikuntakoodi]
      ,[oppilaitoksen_sijaintikunta] = ol.[sijaintikuntaselite_FI]
      ,[oppilaitoksen_sijaintikunta_SV] = ol.[sijaintikuntaselite_SV]
      ,[oppilaitoksen_sijaintikunta_EN] = ol.[sijaintikuntaselite_EN]
      ,ol.[koordinaatti_itakoodi]
      ,ol.[koordinaatti_pohjoiskoodi]
      ,ol.[postinumerokoodi]
      --,[SCD_alkaa]
      --,[SCD_paattyy]
      ,jarjestys_oppilaitos = Isnull(Nullif(ol.[oppilaitosselite_FI],'Tuntematon'),'ööö') --ol.[jarjestys]
      ,[jarjestys_sairaalakoulu] = Isnull(Nullif(ol.[sairaalakoulukoodi],'-1'),'ööö') --ol.[jarjestys_sairaalakoulu]
      ,jarjestys_oppilaitostyyppi = Isnull(Nullif(ol.[sairaalakoulukoodi],'-1'),'ööö') --ol.[jarjestys_oppilaitostyyppi]
      ,jarjestys_peruskoulujen_ryhmitys = Isnull(Nullif(ol.[sairaalakoulukoodi],'-1'),'ööö') --ol.[jarjestys_peruskoulujen_ryhmitys]
      ,jarjestys_peruskoulujen_vuosilks = Isnull(Nullif(ol.[peruskoulujen_vuosilkskoodi],'-1'),'ööö') --ol.[jarjestys_peruskoulujen_vuosilks]
      ,jarjestys_omistajatyyppi = Isnull(Nullif(ol.[omistajatyyppikoodi],'-1'),'ööö') --ol.[jarjestys_omistajatyyppi]
      ,jarjestys_opetuskieli = Isnull(Nullif(ol.[opetuskielikoodi],'-1'),'ööö') --ol.[jarjestys_opetuskieli]
      ,jarjestys_koulutuksen_jarjestaja = Isnull(Nullif(COALESCE(kj_alkaa.[koulutuksen_jarjestajaselite_FI], kj_paattyy.[koulutuksen_jarjestajaselite_FI], kj_tuntematon.koulutuksen_jarjestajaselite_FI),'Tuntematon'),'ööö') --ol.[jarjestys_koulutuksen_jarjestaja]
      ,[jarjestys_sijaintikunta] = Isnull(Nullif(ol.[sijaintikuntaselite_FI],'Tuntematon'),'ööö') --ol.[jarjestys_sijaintikunta]
      ,jarjestys_koordinaatti_ita = Isnull(Nullif(ol.[koordinaatti_itakoodi],'-1'),'ööö') --ol.[jarjestys_koordinaatti_ita]
      ,jarjestys_koordinaatti_pohjois = Isnull(Nullif(ol.[koordinaatti_pohjoiskoodi],'-1'),'ööö') --ol.[jarjestys_koordinaatti_pohjois]
      ,jarjestys_postinumero = Isnull(Nullif(ol.[postinumerokoodi],'-1'),'ööö') --ol.[jarjestys_postinumero]
      ,tietolahde_oppilaitos = ol.[tietolahde]

-- koulutuksen järjestäjä      
      --SELECT [id]
      ,[koulutuksen_jarjestajakoodi] = COALESCE(kj_alkaa.koulutuksen_jarjestajakoodi, kj_paattyy.koulutuksen_jarjestajakoodi, kj_tuntematon.koulutuksen_jarjestajakoodi)
      ,[koulutuksen_jarjestajan_korvaavakoodi] = COALESCE(nullif(kj_alkaa.[korvaavakoodi],''), nullif(kj_paattyy.[korvaavakoodi],''), kj_tuntematon.korvaavakoodi) --lisätty nulliffit, Anssi 17.10.2016
      --,[alkaa]
      --,[paattyy]
      --,[viimeisin_tilv]
      ,[koulutuksen_jarjestaja] = COALESCE(kj_alkaa.[koulutuksen_jarjestajaselite_FI], kj_paattyy.[koulutuksen_jarjestajaselite_FI], kj_tuntematon.koulutuksen_jarjestajaselite_FI)
      ,[koulutuksen_jarjestaja_SV] = COALESCE(kj_alkaa.[koulutuksen_jarjestajaselite_SV], kj_paattyy.[koulutuksen_jarjestajaselite_SV], kj_tuntematon.koulutuksen_jarjestajaselite_SV)
      ,[koulutuksen_jarjestaja_EN] = COALESCE(kj_alkaa.[koulutuksen_jarjestajaselite_EN], kj_paattyy.[koulutuksen_jarjestajaselite_EN], kj_tuntematon.koulutuksen_jarjestajaselite_EN)
      ,[koulutuksen_jarjestajan_omistajatyyppikoodi] = COALESCE(kj_alkaa.[omistajatyyppikoodi], kj_paattyy.[omistajatyyppikoodi], kj_tuntematon.omistajatyyppikoodi)
      ,[koulutuksen_jarjestajan_omistajatyyppi] = COALESCE(kj_alkaa.[omistajatyyppiselite_FI], kj_paattyy.[omistajatyyppiselite_FI], kj_tuntematon.omistajatyyppiselite_FI)
      ,[koulutuksen_jarjestajan_omistajatyyppi_SV] = COALESCE(kj_alkaa.[omistajatyyppiselite_SV], kj_paattyy.[omistajatyyppiselite_SV], kj_tuntematon.omistajatyyppiselite_SV)
      ,[koulutuksen_jarjestajan_omistajatyyppi_EN] = COALESCE(kj_alkaa.[omistajatyyppiselite_EN], kj_paattyy.[omistajatyyppiselite_EN], kj_tuntematon.omistajatyyppiselite_EN)
      ,[koulutuksen_jarjestajan_kielikoodi] = COALESCE(kj_alkaa.[koulutuksen_jarjestajan_kielikoodi], kj_paattyy.[koulutuksen_jarjestajan_kielikoodi], kj_tuntematon.koulutuksen_jarjestajan_kielikoodi)
      ,[koulutuksen_jarjestajan_kieli] = COALESCE(kj_alkaa.[koulutuksen_jarjestajan_kieliselite_FI], kj_paattyy.[koulutuksen_jarjestajan_kieliselite_FI], kj_tuntematon.koulutuksen_jarjestajan_kieliselite_FI)
      ,[koulutuksen_jarjestajan_kieli_SV] = COALESCE(kj_alkaa.[koulutuksen_jarjestajan_kieliselite_SV], kj_paattyy.[koulutuksen_jarjestajan_kieliselite_SV], kj_tuntematon.koulutuksen_jarjestajan_kieliselite_SV)
      ,[koulutuksen_jarjestajan_kieli_EN] = COALESCE(kj_alkaa.[koulutuksen_jarjestajan_kieliselite_EN], kj_paattyy.[koulutuksen_jarjestajan_kieliselite_EN], kj_tuntematon.koulutuksen_jarjestajan_kieliselite_EN)
      ,[koulutuksen_jarjestajan_ksijaintikuntakoodi] = COALESCE(kj_alkaa.[sijaintikuntakoodi], kj_paattyy.[sijaintikuntakoodi], kj_tuntematon.sijaintikuntakoodi)
      ,[koulutuksen_jarjestajan_sijaintikunta] = COALESCE(kj_alkaa.[sijaintikuntaselite_FI], kj_paattyy.[sijaintikuntaselite_FI], kj_tuntematon.sijaintikuntaselite_FI)
      ,[koulutuksen_jarjestajan_sijaintikunta_SV] = COALESCE(kj_alkaa.[sijaintikuntaselite_SV], kj_paattyy.[sijaintikuntaselite_SV], kj_tuntematon.sijaintikuntaselite_SV)
      ,[koulutuksen_jarjestajan_sijaintikunta_EN] = COALESCE(kj_alkaa.[sijaintikuntaselite_EN], kj_paattyy.[sijaintikuntaselite_EN], kj_tuntematon.sijaintikuntaselite_EN)
      --,[SCD_alkaa]
      --,[SCD_paattyy]
      ,[jarjestys_koulutuksenjarjestaja] = Isnull(Nullif(COALESCE(kj_alkaa.[koulutuksen_jarjestajaselite_FI], kj_paattyy.[koulutuksen_jarjestajaselite_FI], kj_tuntematon.koulutuksen_jarjestajaselite_FI),'Tuntematon'),'ööö') --COALESCE(kj_alkaa.[jarjestys], kj_paattyy.[jarjestys], kj_tuntematon.jarjestys)
      --,[jarjestys_omistajatyyppi] = COALESCE(kj_alkaa.[jarjestys_omistajatyyppi], kj_paattyy.[jarjestys_omistajatyyppi])
      ,jarjestys_koulutuksen_jarjestajan_kieli = Isnull(Nullif(COALESCE(kj_alkaa.[omistajatyyppikoodi], kj_paattyy.[omistajatyyppikoodi], kj_tuntematon.omistajatyyppikoodi),'-1'),'ööö') --[jarjestys_koulutuksen_jarjestajan_kieli] = COALESCE(kj_alkaa.[jarjestys_koulutuksen_jarjestajan_kieli], kj_paattyy.[jarjestys_koulutuksen_jarjestajan_kieli], kj_tuntematon.jarjestys_koulutuksen_jarjestajan_kieli)
      ,[jarjestys_sijaintikunta_koulutuksenjarjestaja] = Isnull(Nullif(COALESCE(kj_alkaa.[sijaintikuntaselite_FI], kj_paattyy.[sijaintikuntaselite_FI], kj_tuntematon.sijaintikuntaselite_FI),'Tuntematon'),'ööö') --COALESCE(kj_alkaa.[jarjestys_sijaintikunta], kj_paattyy.[jarjestys_sijaintikunta], kj_tuntematon.jarjestys_sijaintikunta)
      ,[tietolahde_koulutuksenjarjestaja] = COALESCE(kj_alkaa.[tietolahde], kj_paattyy.[tietolahde], kj_tuntematon.tietolahde)
      ,[koulutuksen_jarjestajan_ainoa_oppilaitos] = CAST(NULL as nvarchar(20))

      
FROM [VipunenTK_DW].[dbo].[d_oppilaitos] ol -- (17422 row(s) affected)
LEFT JOIN [VipunenTK_DW].[dbo].d_koulutuksen_jarjestaja kj_alkaa
	ON kj_alkaa.koulutuksen_jarjestajakoodi = ol.koulutuksen_jarjestajakoodi
	AND ol.alkaa between kj_alkaa.alkaa and isnull(kj_alkaa.paattyy,'9999-01-01') --(121193 row(s) affected)
LEFT JOIN [VipunenTK_DW].[dbo].d_koulutuksen_jarjestaja kj_paattyy
	ON kj_paattyy.koulutuksen_jarjestajakoodi = ol.koulutuksen_jarjestajakoodi
	AND isnull(ol.paattyy, GETDATE()) between kj_paattyy.alkaa and isnull(kj_paattyy.paattyy,'9999-01-01') --(121193 row(s) affected)
LEFT JOIN [VipunenTK_lisatiedot].[dbo].koulutuksen_jarjestaja kj_tuntematon
	ON kj_tuntematon.koulutuksen_jarjestajakoodi='-1'

 
UNION ALL

SELECT 
-- oppilaitos
       ol_virhe.[id]
      ,ol_virhe.[oppilaitoskoodi]
      ,ol_virhe.[oppilaitoskoodi]
      ,oppilaitoksen_korvaavakoodi = ol_virhe.[korvaavakoodi]
      ,ol_virhe.[alkaa]
      ,ol_virhe.[paattyy]
      --,[viimeisin_tilv]
      ,[oppilaitos] = ol_virhe.[oppilaitosselite_FI]
      ,[oppilaitos_SV] = ol_virhe.[oppilaitosselite_SV]
      ,[oppilaitos_EN] = ol_virhe.[oppilaitosselite_EN]
      ,ol_virhe.[sairaalakoulukoodi]
      ,[sairaalakoulu] = ol_virhe.[sairaalakouluselite_FI]
      ,[sairaalakoulu_SV] = ol_virhe.[sairaalakouluselite_SV]
      ,[sairaalakoulu_EN] = ol_virhe.[sairaalakouluselite_EN]
      ,ol_virhe.[oppilaitostyyppikoodi]
      ,[oppilaitostyyppi] = ol_virhe.[oppilaitostyyppiselite_FI]
      ,[oppilaitostyyppi_SV] = ol_virhe.[oppilaitostyyppiselite_SV]
      ,[oppilaitostyyppi_EN] = ol_virhe.[oppilaitostyyppiselite_EN]
      ,ol_virhe.[peruskoulujen_ryhmityskoodi]
      ,peruskoulujen_ryhmitys = ol_virhe.[peruskoulujen_ryhmitysselite_FI]
      ,peruskoulujen_ryhmitys_SV = ol_virhe.[peruskoulujen_ryhmitysselite_SV]
      ,peruskoulujen_ryhmitys_EN = ol_virhe.[peruskoulujen_ryhmitysselite_EN]
      ,ol_virhe.[peruskoulujen_vuosilkskoodi]
      ,peruskoulujen_vuosilks = ol_virhe.[peruskoulujen_vuosilksselite_FI]
      ,peruskoulujen_vuosilks_SV = ol_virhe.[peruskoulujen_vuosilksselite_SV]
      ,peruskoulujen_vuosilks_EN = ol_virhe.[peruskoulujen_vuosilksselite_EN]
      ,oppilaitoksen_omistajatyyppikoodi = ol_virhe.[omistajatyyppikoodi]
      ,oppilaitoksen_omistajatyyppi = ol_virhe.[omistajatyyppiselite_FI]
      ,oppilaitoksen_omistajatyyppi_SV = ol_virhe.[omistajatyyppiselite_SV]
      ,oppilaitoksen_omistajatyyppi_EN = ol_virhe.[omistajatyyppiselite_EN]
      ,ol_virhe.[opetuskielikoodi]
      ,opetuskieli = ol_virhe.[opetuskieliselite_FI]
      ,opetuskieli_SV = ol_virhe.[opetuskieliselite_SV]
      ,opetuskieli_EN = ol_virhe.[opetuskieliselite_EN]
      --,ol_virhe.[koulutuksen_jarjestajakoodi]
      --,ol_virhe.[koulutuksen_jarjestajaselite_FI]
      --,ol_virhe.[koulutuksen_jarjestajaselite_SV]
      --,ol_virhe.[koulutuksen_jarjestajaselite_EN]
      ,ol_virhe.[sijaintikuntakoodi]
      ,[oppilaitoksen_sijaintikunta] = ol_virhe.[sijaintikuntaselite_FI]
      ,[oppilaitoksen_sijaintikunta_SV] = ol_virhe.[sijaintikuntaselite_SV]
      ,[oppilaitoksen_sijaintikunta_EN] = ol_virhe.[sijaintikuntaselite_EN]
      ,ol_virhe.[koordinaatti_itakoodi]
      ,ol_virhe.[koordinaatti_pohjoiskoodi]
      ,ol_virhe.[postinumerokoodi]
      --,[SCD_alkaa]
      --,[SCD_paattyy]
      ,jarjestys_oppilaitos = ol_virhe.[jarjestys]
      ,ol_virhe.[jarjestys_sairaalakoulu]
      ,ol_virhe.[jarjestys_oppilaitostyyppi]
      ,ol_virhe.[jarjestys_peruskoulujen_ryhmitys]
      ,ol_virhe.[jarjestys_peruskoulujen_vuosilks]
      ,ol_virhe.[jarjestys_omistajatyyppi]
      ,ol_virhe.[jarjestys_opetuskieli]
      ,ol_virhe.[jarjestys_koulutuksen_jarjestaja]
      ,ol_virhe.[jarjestys_sijaintikunta]
      ,ol_virhe.[jarjestys_koordinaatti_ita]
      ,ol_virhe.[jarjestys_koordinaatti_pohjois]
      ,ol_virhe.[jarjestys_postinumero]
      ,tietolahde_oppilaitos = ol_virhe.[tietolahde]

-- koulutuksen järjestäjä      
      --SELECT [id]
      ,kj_virhe.[koulutuksen_jarjestajakoodi]
      ,kj_virhe.[korvaavakoodi]
      --,[alkaa]
      --,[paattyy]
      --,[viimeisin_tilv]
      ,kj_virhe.[koulutuksen_jarjestajaselite_FI]
      ,kj_virhe.[koulutuksen_jarjestajaselite_SV]
      ,kj_virhe.[koulutuksen_jarjestajaselite_EN]
      ,kj_virhe.[omistajatyyppikoodi]
      ,kj_virhe.[omistajatyyppiselite_FI]
      ,kj_virhe.[omistajatyyppiselite_SV]
      ,kj_virhe.[omistajatyyppiselite_EN]
      ,kj_virhe.[koulutuksen_jarjestajan_kielikoodi]
      ,kj_virhe.[koulutuksen_jarjestajan_kieliselite_FI]
      ,kj_virhe.[koulutuksen_jarjestajan_kieliselite_SV]
      ,kj_virhe.[koulutuksen_jarjestajan_kieliselite_EN]
      ,kj_virhe.[sijaintikuntakoodi]
      ,kj_virhe.[sijaintikuntaselite_FI]
      ,kj_virhe.[sijaintikuntaselite_SV]
      ,kj_virhe.[sijaintikuntaselite_EN]
      --,[SCD_alkaa]
      --,[SCD_paattyy]
      ,kj_virhe.[jarjestys]
      --,[jarjestys_omistajatyyppi] = ISNULL(kj_alkaa.[jarjestys_omistajatyyppi], kj_paattyy.[jarjestys_omistajatyyppi])
      ,kj_virhe.[jarjestys_koulutuksen_jarjestajan_kieli]
      ,kj_virhe.[jarjestys_sijaintikunta]
      ,kj_virhe.[tietolahde]
      ,[koulutuksen_jarjestajan_ainoa_oppilaitos] = CAST(NULL as nvarchar(20))

      
FROM VipunenTK_lisatiedot.dbo.oppilaitos ol_virhe -- (17422 row(s) affected)
JOIN VipunenTK_lisatiedot.dbo.koulutuksen_jarjestaja kj_virhe
	ON kj_virhe.koulutuksen_jarjestajakoodi = ol_virhe.koulutuksen_jarjestajakoodi
WHERE ol_virhe.virhetilanne='K'

--Luodaan koulutuksen järjestäjistä rivit
UNION ALL
SELECT 
-- oppilaitos
       id = (Select MAX(id) from [VipunenTK_DW].[dbo].[d_oppilaitos]) + kj.[id] + 100
      ,[oppilaitos_avain] = kj.koulutuksen_jarjestajakoodi
      ,'-1' --kj.koulutuksen_jarjestajakoodi --ol.[oppilaitoskoodi]
      ,oppilaitoksen_korvaavakoodi = ol.[korvaavakoodi]
      ,kj.[alkaa]
      ,[paattyy] = ISNULL(kj.[paattyy], Cast('9999-01-01' as date))
      --,[viimeisin_tilv]
      ,[oppilaitos] = ol.[oppilaitosselite_FI]
      ,[oppilaitos_SV] = ol.[oppilaitosselite_SV]
      ,[oppilaitos_EN] = ol.[oppilaitosselite_EN]
      ,ol.[sairaalakoulukoodi]
      ,[sairaalakoulu] = ol.[sairaalakouluselite_FI]
      ,[sairaalakoulu_SV] = ol.[sairaalakouluselite_SV]
      ,[sairaalakoulu_EN] = ol.[sairaalakouluselite_EN]
      ,ol.[oppilaitostyyppikoodi]
      ,[oppilaitostyyppi] = ol.[oppilaitostyyppiselite_FI]
      ,[oppilaitostyyppi_SV] = ol.[oppilaitostyyppiselite_SV]
      ,[oppilaitostyyppi_EN] = ol.[oppilaitostyyppiselite_EN]
      ,ol.[peruskoulujen_ryhmityskoodi]
      ,peruskoulujen_ryhmitys = ol.[peruskoulujen_ryhmitysselite_FI]
      ,peruskoulujen_ryhmitys_SV = ol.[peruskoulujen_ryhmitysselite_SV]
      ,peruskoulujen_ryhmitys_EN = ol.[peruskoulujen_ryhmitysselite_EN]
      ,ol.[peruskoulujen_vuosilkskoodi]
      ,peruskoulujen_vuosilks = ol.[peruskoulujen_vuosilksselite_FI]
      ,peruskoulujen_vuosilks_SV = ol.[peruskoulujen_vuosilksselite_SV]
      ,peruskoulujen_vuosilks_EN = ol.[peruskoulujen_vuosilksselite_EN]
      ,oppilaitoksen_omistajatyyppikoodi = ol.[omistajatyyppikoodi]
      ,oppilaitoksen_omistajatyyppi = ol.[omistajatyyppiselite_FI]
      ,oppilaitoksen_omistajatyyppi_SV = ol.[omistajatyyppiselite_SV]
      ,oppilaitoksen_omistajatyyppi_EN = ol.[omistajatyyppiselite_EN]
      ,ol.[opetuskielikoodi]
      ,opetuskieli = ol.[opetuskieliselite_FI]
      ,opetuskieli_SV = ol.[opetuskieliselite_SV]
      ,opetuskieli_EN = ol.[opetuskieliselite_EN]
      --,ol.[koulutuksen_jarjestajakoodi]
      --,ol.[koulutuksen_jarjestajaselite_FI]
      --,ol.[koulutuksen_jarjestajaselite_SV]
      --,ol.[koulutuksen_jarjestajaselite_EN]
      ,kj.[sijaintikuntakoodi]    -- korjattu ol.sijantikuntakoodista, joka palautti -1:stä - Lasse 23.5.2014
      ,[oppilaitoksen_sijaintikunta] = ol.[sijaintikuntaselite_FI]
      ,[oppilaitoksen_sijaintikunta_SV] = ol.[sijaintikuntaselite_SV]
      ,[oppilaitoksen_sijaintikunta_EN] = ol.[sijaintikuntaselite_EN]
      ,ol.[koordinaatti_itakoodi]
      ,ol.[koordinaatti_pohjoiskoodi]
      ,ol.[postinumerokoodi]
      --,[SCD_alkaa]
      --,[SCD_paattyy]
      ,jarjestys_oppilaitos = ol.[jarjestys]
      ,ol.[jarjestys_sairaalakoulu]
      ,ol.[jarjestys_oppilaitostyyppi]
      ,ol.[jarjestys_peruskoulujen_ryhmitys]
      ,ol.[jarjestys_peruskoulujen_vuosilks]
      ,ol.[jarjestys_omistajatyyppi]
      ,ol.[jarjestys_opetuskieli]
      ,ol.[jarjestys_koulutuksen_jarjestaja]
      ,ol.[jarjestys_sijaintikunta]
      ,ol.[jarjestys_koordinaatti_ita]
      ,ol.[jarjestys_koordinaatti_pohjois]
      ,ol.[jarjestys_postinumero]
      ,tietolahde_oppilaitos = ol.[tietolahde]

-- koulutuksen järjestäjä      
      --SELECT [id]
      ,kj.[koulutuksen_jarjestajakoodi]
      ,[koulutuksen_jarjestajan_korvaavakoodi] = kj.korvaavakoodi --oli aiemmin null, Anssi 17.10.2016
      --,[alkaa]
      --,[paattyy]
      --,[viimeisin_tilv]
      
      ,[koulutuksen_jarjestaja] = kj.[koulutuksen_jarjestajaselite_FI]
      ,[koulutuksen_jarjestaja_SV] = kj.[koulutuksen_jarjestajaselite_SV]
      ,[koulutuksen_jarjestaja_EN] = kj.[koulutuksen_jarjestajaselite_EN]
      ,[koulutuksen_jarjestajan_omistajatyyppikoodi] = kj.[omistajatyyppikoodi]
      ,[koulutuksen_jarjestajan_omistajatyyppi] = kj.[omistajatyyppiselite_FI]
      ,[koulutuksen_jarjestajan_omistajatyyppi_SV] = kj.[omistajatyyppiselite_SV]
      ,[koulutuksen_jarjestajan_omistajatyyppi_EN] = kj.[omistajatyyppiselite_EN]
      ,[koulutuksen_jarjestajan_kielikoodi] = kj.[koulutuksen_jarjestajan_kielikoodi]
      ,[koulutuksen_jarjestajan_kieli] = kj.[koulutuksen_jarjestajan_kieliselite_FI]
      ,[koulutuksen_jarjestajan_kieli_SV] = kj.[koulutuksen_jarjestajan_kieliselite_SV]
      ,[koulutuksen_jarjestajan_kieli_EN] = kj.[koulutuksen_jarjestajan_kieliselite_EN]
      ,[koulutuksen_jarjestajan_ksijaintikuntakoodi] = kj.[sijaintikuntakoodi]
      ,[koulutuksen_jarjestajan_sijaintikunta] = kj.[sijaintikuntaselite_FI]
      ,[koulutuksen_jarjestajan_sijaintikunta_SV] = kj.[sijaintikuntaselite_SV]
      ,[koulutuksen_jarjestajan_sijaintikunta_EN] = kj.[sijaintikuntaselite_EN]
      --,[SCD_alkaa]
      --,[SCD_paattyy]
      ,[jarjestys_koulutuksenjarjestaja] = kj.[jarjestys]
      --,[jarjestys_omistajatyyppi] = ISNULL(kj_alkaa.[jarjestys_omistajatyyppi], kj_paattyy.[jarjestys_omistajatyyppi])
      ,[jarjestys_koulutuksen_jarjestajan_kieli] = kj.[jarjestys_koulutuksen_jarjestajan_kieli]
      ,[jarjestys_sijaintikunta_koulutuksenjarjestaja] = kj.[jarjestys_sijaintikunta]
      ,[tietolahde_koulutuksenjarjestaja] = kj.[tietolahde]
      ,[koulutuksen_jarjestajan_ainoa_oppilaitos] = CAST(Case 
			when 1 = (
				Select COUNT(distinct coalesce(nullif(ol_lkm.korvaavakoodi,''),ol_lkm.oppilaitoskoodi)) 
				from [VipunenTK_DW].[dbo].[d_oppilaitos] ol_lkm
				Where ol_lkm.koulutuksen_jarjestajakoodi = kj.koulutuksen_jarjestajakoodi
				and kj.alkaa between ol_lkm.alkaa and isnull(ol_lkm.paattyy,'9999-01-01')
				and kj.koulutuksen_jarjestajakoodi IS not null
				and kj.koulutuksen_jarjestajakoodi not IN ('-1', '-2') 
				--3.1.2014 Jarmo haku saa toimia vain amkien ja yliopistojen osalta
				and ol_lkm.oppilaitostyyppikoodi in ('41', '42')
				)
		    then (
				Select top 1 coalesce(nullif(ol_lkm.korvaavakoodi,''),ol_lkm.oppilaitoskoodi) 
				from [VipunenTK_DW].[dbo].[d_oppilaitos] ol_lkm
				Where ol_lkm.koulutuksen_jarjestajakoodi = kj.koulutuksen_jarjestajakoodi
				and kj.alkaa between ol_lkm.alkaa and isnull(ol_lkm.paattyy,'9999-01-01') 
				and kj.koulutuksen_jarjestajakoodi IS not null
				and kj.koulutuksen_jarjestajakoodi not IN ('-1', '-2') 
				--3.1.2014 Jarmo haku saa toimia vain amkien ja yliopistojen osalta
				and ol_lkm.oppilaitostyyppikoodi in ('41', '42')
				)
			else NULL
			end
       as nvarchar(10))
      
FROM [VipunenTK_DW].[dbo].d_koulutuksen_jarjestaja kj
JOIN VipunenTK_lisatiedot.dbo.oppilaitos ol
	ON ol.id = -1

) kaikki




GO


