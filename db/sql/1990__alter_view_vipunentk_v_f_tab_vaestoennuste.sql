USE [VipunenTK]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER view [dbo].[v_f_tab_vaestoennuste] as

Select
      [Ennustevuosi] = f.ennv
	  
	  ,[Kunta] = d1.kunta
	  ,[Maakunta] = d1.maakunta
	  ,[Seutukunta] = d1.seutukunta
	  ,[Kuntaryhmitys] = d1.kuntaryhma
	  ,[AVI] = d1.avi
	  ,[ELY] = d1.ely
	  ,[Suuralue] = d1.suuralue

      ,[Sukupuoli] = d2.sukupuoli
	  ,[Ikä] = d3.ika
	  ,[Ikäryhmä I] = d3.ika5v
	  ,[Ikäryhmä II] = d10.ika
	  ,[Ennustemalli] = f.ennustemalli
	  /*
						case 
							when d3.ika in ('0','1','2') then '0-2-vuotiaat'
							when d3.ika in ('3','4','5') then '3-5-vuotiaat'
							when d3.ika='6' then '6-vuotiaat'
							when d3.ika in ('7','8','9','10','11','12') then '7-12-vuotiaat'
							when d3.ika in ('13','14','15') then '13-15-vuotiaat'
							when d3.ika in ('16','17','18') then '16-18-vuotiaat'
							when d3.ika in ('19','20','21') then '19-21-vuotiaat'
							when d3.ika in ('22','23','24') then '22-24-vuotiaat'
							when d3.ika in ('25','26','27','28','29') then '25-29-vuotiaat'
							when d3.ika in ('30','31','32','33','34') then '30-34-vuotiaat'
							when d3.ika in ('35','36','37','38','39') then '35-39-vuotiaat'
							when d3.ika in ('40','41','42','43','44') then '40-44-vuotiaat'
							when d3.ika in ('45','46','47','48','49') then '45-49-vuotiaat'
							when d3.ika in ('50','51','52','53','54') then '50-54-vuotiaat'
							when d3.ika in ('55','56','57','58','59') then '55-59-vuotiaat'
							when d3.ika in ('60','61','62','63','64') then '60-64-vuotiaat'
							when d3.ika > '64' or d3.ika like '10%' then 'yli 64-vuotiaat'
							else 'Tuntematon'
						end
		*/			

	  ,[Lukumäärä] = f.lkm

	  --Ruotsi
	  ,[Prognosår] = f.ennv
	  ,[Kommun] = d1.kunta_SV
	  ,[Landskap] = d1.maakunta_SV
	  ,[Ekonomisk region] = d1.seutukunta_SV
	  ,[Kommungruppering] = d1.kuntaryhma_SV
	  ,[RFV] = d1.avi_SV
	  ,[NTM] = d1.ely_SV
	  ,[Storområde] = d1.suuralue_SV
	  ,[Kön] = d2.sukupuoli_SV
	  ,[Ålder] = d3.ika_SV
	  ,[Åldersgrupp I] = d3.ika5v_SV
	  ,[Åldersgrupp II] = d10.ika_SV
	  ,[Prognosmodell] = case 
							when f.ennustemalli='Ennuste 2015' then 'Prognos 2015'
							when f.ennustemalli='Ennuste 2018' then 'Prognos 2018'
							else f.ennustemalli
						end

	  --Englanti
	  ,[Year] = f.ennv
	  ,[Municipality] = d1.kunta_EN
	  ,[Region] = d1.maakunta_EN
	  ,[Subregion] = d1.seutukunta_EN
	  ,[Municipality type] = d1.kuntaryhma_EN
	  ,[AVI area] = d1.avi_EN
	  ,[ELY area] = d1.ely_EN
	  ,[Major region] = d1.suuralue_EN
	  ,[Gender] = d2.sukupuoli_EN
	  ,[Age] = d3.ika_EN
	  ,[Age group I] = d3.ika5v_EN
	  ,[Age group II] = d10.ika_EN
	  ,[Forecast model] = case 
							when f.ennustemalli='Ennuste 2015' then 'Forecast 2015'
							when f.ennustemalli='Ennuste 2018' then 'Forecast 2018'
							else f.ennustemalli
						end

	  --Järjestys
	  ,[Maakunta järjestys] = d1.jarjestys_maakunta
	  ,[Kuntaryhmä järjestys] = d1.jarjestys_kuntaryhma
	  ,[Seutukunta järjestys] = d1.jarjestys_seutukunta
	  ,[AVI järjestys] = d1.jarjestys_avi
	  ,[ELY järjestys] = d1.jarjestys_ely
	  ,[Suuralue järjestys] = d1.jarjestys_suuralue
      ,[Sukupuoli järjestys] = d2.jarjestys
	  ,[Ikä järjestys] = d3.jarjestys_ika
	  ,[Ikäryhmä I järjestys] = d3.jarjestys_ika5v
	  ,[Ikäryhmä II järjestys] = CAST(
						case 
							when d3.ika in ('0','1','2') then 1
							when d3.ika in ('3','4','5') then 2
							when d3.ika='6' then 3
							when d3.ika in ('7','8','9','10','11','12') then 4
							when d3.ika in ('13','14','15') then 5
							when d3.ika in ('16','17','18') then 6
							when d3.ika in ('19','20','21') then 7
							when d3.ika in ('22','23','24') then 8
							when d3.ika in ('25','26','27','28','29') then 9
							when d3.ika in ('30','31','32','33','34') then 10
							when d3.ika in ('35','36','37','38','39') then 11
							when d3.ika in ('40','41','42','43','44') then 12
							when d3.ika in ('45','46','47','48','49') then 13
							when d3.ika in ('50','51','52','53','54') then 14
							when d3.ika in ('55','56','57','58','59') then 15
							when d3.ika in ('60','61','62','63','64') then 16
							when d3.ika > '64' or d3.ika like '10%' then 17
							else 18
						end
						AS int)

	  --Koodit
	  ,[Koodit Kotikunta] = d1.kunta_koodi
	  ,[Koodit Kotimaakunta] = d1.maakunta_koodi

FROM [dbo].[f_Vaestoennuste] f
LEFT JOIN VipunenTK.dbo.d_alueluokitus d1 on d1.id=f.tilvaskun_id
LEFT JOIN VipunenTK.dbo.d_sukupuoli d2 on d2.id=f.sp_id
LEFT JOIN VipunenTK.dbo.d_ika d3 on d3.id=f.ika_id
LEFT JOIN VipunenTK.dbo.d_ika d10 on d10.ika_avain=
						case 
							when d3.ika in ('0','1','2') then 'ikar2b_2'
							when d3.ika in ('3','4','5') then 'ikar2b_5'
							when d3.ika='6' then 'ikar2b_6'
							when d3.ika in ('7','8','9','10','11','12') then 'ikar2b_12'
							when d3.ika in ('13','14','15') then 'ikar2b_15'
							when d3.ika in ('16','17','18') then 'ikar2b_18'
							when d3.ika in ('19','20','21') then 'ikar2b_21'
							when d3.ika in ('22','23','24') then 'ikar2b_24'
							when d3.ika in ('25','26','27','28','29') then 'ikaryh2_29'
							when d3.ika in ('30','31','32','33','34') then 'ikaryh2_34'
							when d3.ika in ('35','36','37','38','39') then 'ikaryh2_39'
							when d3.ika in ('40','41','42','43','44') then 'ikaryh2_44'
							when d3.ika in ('45','46','47','48','49') then 'ikaryh2_49'
							when d3.ika in ('50','51','52','53','54') then 'ikaryh2_54'
							when d3.ika in ('55','56','57','58','59') then 'ikaryh2_59'
							when d3.ika in ('60','61','62','63','64') then 'ikaryh2_64'
							when d3.ika > '64' or d3.ika like '10%' then 'ikaryh2_65'
							else '-1'
						end

where lkm>0 --AND d3.ika<>'Tuntematon'

GO


USE [ANTERO]
