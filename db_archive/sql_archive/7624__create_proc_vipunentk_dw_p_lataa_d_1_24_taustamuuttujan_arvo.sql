USE [VipunenTK_DW]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









CREATE OR ALTER PROCEDURE [dbo].[p_lataa_d_1_24_taustamuuttujan_arvo] AS

truncate table [VipunenTK].[dbo].[d_1_24_taustamuuttujan_arvo]

insert [VipunenTK].[dbo].[d_1_24_taustamuuttujan_arvo] (
	[id],
	[luotu],
	[perusjoukko],
	[perusjoukko_FI],
	[perusjoukko_SV],
	[perusjoukko_EN],
	[taustamuuttuja],
	[taustamuuttuja_FI],
	[taustamuuttuja_SV],
	[taustamuuttuja_EN],
	[taustamuuttujan_arvo],
	[taustamuuttujan_arvo_FI],
	[taustamuuttujan_arvo_SV],
	[taustamuuttujan_arvo_EN],
	[taustamuuttuja_2],
	[taustamuuttuja_2_FI],
	[taustamuuttuja_2_SV],
	[taustamuuttuja_2_EN],
	[taustamuuttujan_2_arvo],
	[taustamuuttujan_2_arvo_FI],
	[taustamuuttujan_2_arvo_SV],
	[taustamuuttujan_2_arvo_EN],
	[jarjestys],
	[jarjestys2],
	[virhetilanne],
	[poistettu],
	[tietolahde],
	[kommentti]
)
select distinct 
	id = dense_rank() over (
			order by 
			aineisto
			,perusjoukko
			,taustamuuttuja
			,taustamuuttuja_2
			,isnumeric(taustamuuttujan_arvo)
			,case when taustamuuttuja = 'tol2008_1_v3' then nullif(taustamuuttujan_arvo, 'SS') else taustamuuttujan_arvo end
			,isnumeric(taustamuuttujan_2_arvo)
			,taustamuuttujan_2_arvo
	)
	,luotu = '2023-03-23'
	,perusjoukko
	,perusjoukko_fi = case perusjoukko when 'palkansaajat' then 'Palkansaajat 25–64 v.' when 'tyolliset' then 'Työlliset 25–64 v.' when 'vaesto' then 'Väestö 25–64 v.' end
	,perusjoukko_sv = case perusjoukko when 'palkansaajat' then 'Löntagare 25–64 år' when 'tyolliset' then 'Sysselsatta 25–64 år' when 'vaesto' then 'Befolkning 25–64 år' end
	,perusjoukko_en = case perusjoukko when 'palkansaajat' then 'Employees aged 25–64' when 'tyolliset' then 'Employed aged 25–64' when 'vaesto' then 'Population aged 25–64' end
	--1
	,taustamuuttuja
	,taustamuuttuja_fi = 
		case taustamuuttuja 
			when 'sose_v2' then 'Sosioekonominen asema' 
			when 'tol2008_1_v3' then 'Toimiala' 
			when 'tsekt_v2' then 'Työnantajasektori'
			when 'avi' then 'Alue' 
			when 'syntyp' then 'Syntyperä' 
			when 'sp' then 'Sukupuoli' 
			when 'ikar6' then 'Ikäryhmä' 
			when 'kaste_t0' then 'Koulutustaso' 
		end
	,taustamuuttuja_sv = 
		case taustamuuttuja 
			when 'sose_v2' then 'Sosioekonomisk ställning' 
			when 'tol2008_1_v3' then 'Bransch' 
			when 'tsekt_v2' then 'Arbetsgivarens sektor'
			when 'avi' then 'Område' 
			when 'syntyp' then 'Härkomst' 
			when 'sp' then 'Kön' 
			when 'ikar6' then 'Åldersgrupp' 
			when 'kaste_t0' then 'Utbildningsnivå' 
		end
	,taustamuuttuja_en = 
		case taustamuuttuja 
			when 'sose_v2' then 'Socio-economic group' 
			when 'tol2008_1_v3' then 'Sector' 
			when 'tsekt_v2' then 'Employer sector'
			when 'avi' then 'Area' 
			when 'syntyp' then 'Origin' 
			when 'sp' then 'Gender' 
			when 'ikar6' then 'Age group' 
			when 'kaste_t0' then 'Level of education' 
		end
	,taustamuuttujan_arvo
	,taustamuuttujan_arvo_fi = 
		case taustamuuttuja
			when 'sose_v2' then (
				case taustamuuttujan_arvo 
					when 'S' then 'Palkansaajat yhteensä' 
					when '1' then 'Toimihenkilöt yhteensä' 
					when '2' then 'Ylemmät toimihenkilöt' 
					when '3' then 'Alemmat toimihenkilöt' 
					when '4' then 'Työntekijät' 
				end
			)
			when 'avi' then (
				case taustamuuttujan_arvo 
					when 'S' then 'Koko Suomi (ml. Ahvenanmaan valtionvirasto)'
					when '1' then 'Etelä-Suomen AVI' 
					when '2' then 'Lounais-Suomen AVI' 
					when '3' then 'Itä-Suomen AVI'
					when '4' then 'Länsi- ja Sisä-Suomen AVI' 
					when '5' then 'Pohjois-Suomen AVI' 
					when '6' then 'Lapin AVI'  
				end
			)
			when 'tsekt_v2' then (
				case taustamuuttujan_arvo 
					when 'S' then 'Työnantajasektorit yhteensä' 
					when '1' then 'Valtio' 
					when '2' then 'Kunta' 
					when '3' then 'Julkinen sektori yhteensä' 
					when '4' then 'Yksityinen' 
				end
			)
			when 'syntyp' then (
				case taustamuuttujan_arvo 
					when 'S' then 'Yhteensä (syntyperä)' 
					when '1' then 'Suomalaistaustaiset' 
					when '2' then 'Ulkomaalaistaustaiset' 
				end
			)
			when 'sp' then (
				case sp
					when 'S' then 'Yhteensä (sukupuoli)'
					when '1' then 'Miehet'
					when '2' then 'Naiset'
				end
			)
			when 'ikar6' then (
				case ikar6
					when 'SS' then 'Yhteensä (ikäryhmä)'
					when '25' then '25–34-vuotiaat' 
					when '35' then '35–44-vuotiaat' 
					when '45' then '45–54-vuotiaat' 
					when '55' then '55–64-vuotiaat'
				end
			)
			when 'kaste_t0' then (
				case kaste_t0
					when 'S' then 'Yhteensä (koulutustaso)'
					when '1' then 'Perusaste tai ei perusasteen jälkeistä koulutusta' 
					when '2' then 'Toinen aste'
					when '3' then 'Korkea-aste'
				end
			)
			when 'tol2008_1_v3' then (
				case taustamuuttujan_arvo 
					when 'SS' then 'Toimialat yhteensä (00-99)'
					when 'A-B' then 'Maatalous, metsätalous, kalatalous; kaivostoiminta (01-09)'
					when 'C-E' then 'Teollisuus; sähkö-, lämpö-, vesi- ja jätehuolto yms. (10-39)'
					when 'F' then 'Rakentaminen (41-43)'
					when 'G' then 'Tukku- ja vähittäiskauppa; moottoriajoneuvojen ja moottoripyörien korjaus (45-47)'
					when 'H' then 'Kuljetus ja varastointi (49-53)'
					when 'I' then 'Majoitus- ja ravitsemistoiminta (55-56)'
					when 'J' then 'Informaatio ja viestintä (58-63)'
					when 'K-L' then 'Rahoitus- ja vakuutustoiminta; kiinteistöala (64-68)'
					when 'M-N' then 'Liike-elämän palvelut (69-82)'
					when 'O' then 'Julkinen hallinto ja maanpuolustus; pakollinen sosiaalivakuutus (84)'
					when 'P' then 'Koulutus (85)'
					when 'Q' then 'Terveys- ja sosiaalipalvelut (86-88)'
					when 'R-U' then 'Taiteet, viihde ja virkistys; muu palvelutoiminta (90-99)'
				end
			)
		end
	,taustamuuttujan_arvo_sv =
		case taustamuuttuja
			when 'sose_v2' then (
				case taustamuuttujan_arvo 
					when 'S' then 'Löntagare totalt' 
					when '1' then 'Tjänstemän totalt' 
					when '2' then 'Högre tjänstemän' 
					when '3' then 'Lägre tjänstemän' 
					when '4' then 'Arbetstagare'
				end
			)
			when 'avi' then (
				case taustamuuttujan_arvo 
					when 'S' then 'Totalt (inkl. Statens ämbetsverk på Åland)'
					when '1' then 'Södra Finlands RFV' 
					when '2' then 'Sydvästra Finlands RFV' 
					when '3' then 'Östra Finlands RFV'
					when '4' then 'Västra och Inre Finlands RFV' 
					when '5' then 'Norra Finlands RFV' 
					when '6' then 'Lapplands RFV'  
				end
			)
			when 'tsekt_v2' then (
				case taustamuuttujan_arvo  
					when 'S' then 'Arbetsgivarnas sektorer totalt' 
					when '1' then 'Staten' 
					when '2' then 'Kommunen' 
					when '3' then 'Offentliga sektorn totalt' 
					when '4' then 'Privat'
				end
			)
			when 'syntyp' then (
				case taustamuuttujan_arvo 
					when 'S' then 'Totalt (härkomst)' 
					when '1' then 'Finska bakgrund' 
					when '2' then 'Utländsk bakgrund' 
				end
			)
			when 'sp' then (
				case sp
					when 'S' then 'Totalt (kön)'
					when '1' then 'Män'
					when '2' then 'Kvinnor'
				end
			)
			when 'ikar6' then (
				case ikar6
					when 'SS' then 'Totalt (åldersgrupp)'
					when '25' then '25–34-åriga' 
					when '35' then '35–44-åriga' 
					when '45' then '45–54-åriga' 
					when '55' then '55–64-åriga'
				end
			)
			when 'kaste_t0' then (
				case kaste_t0
					when 'S' then 'Totalt (utbildningsnivå)'
					when '1' then 'Grundnivå eller ingen examen efter den grundläggande utbildningen' 
					when '2' then 'Andra stadiet'
					when '3' then 'Högre nivå'
				end
			)
			when 'tol2008_1_v3' then (
				case taustamuuttujan_arvo 
					when 'SS' then 'Näringsgrenar totalt (00-99)'
					when 'A-B' then 'Jordbruk, skogsbruk och fiske; utvinning av mineral (01-09)'
					when 'C-E' then 'Tillverkning; försörjning av el, värme, vatten och avlopp etc. (10-39)'
					when 'F' then 'Byggverksamhet (41-43)'
					when 'G' then 'Handel; reparation av motorfordon och motorcyklar (45-47)'
					when 'H' then 'Transport och magasinering (49-53)'
					when 'I' then 'Hotell- och restaurangverksamhet (55-56)'
					when 'J' then 'Informations- och kommunikationsverksamhet (58-63)'
					when 'K-L' then 'Finans- och försäkringsverksamhet; fastighetsverksamhet (64-68)'
					when 'M-N' then 'Företagstjänster (69-82)'
					when 'O' then 'Offentlig förvaltning och försvar; obligatorisk socialförsäkring (84)'
					when 'P' then 'Utbildning (85)'
					when 'Q' then 'Vård och omsorg; sociala tjänster (86-88)'
					when 'R-U' then 'Kultur, nöje och fritid; annan serviceverksamhet (90-99)'
				end
			)
		end
	,taustamuuttujan_arvo_en =
		case taustamuuttuja
			when 'sose_v2' then (
				case taustamuuttujan_arvo 
					when 'S' then 'Employees total' 
					when '1' then 'Upper- and lower-level employees with administrative etc. occupations total' 
					when '2' then 'Upper-level employees with administrative, managerial, professional and related occupations' 
					when '3' then 'Lower-level employees with administrative and clerical occupations' 
					when '4' then 'Manual workers' 
				end
			)
			when 'avi' then (
				case taustamuuttujan_arvo 
					when 'S' then 'Total (incl. State Department of Åland)' 
					when '1' then 'Southern Finland AVI' 
					when '2' then 'Southwestern Finland AVI' 
					when '3' then 'Eastern Finland AVI'
					when '4' then 'Western and Inland Finland AVI' 
					when '5' then 'Northern Finland AVI' 
					when '6' then 'Lapland AVI' 
				end
			)
			when 'tsekt_v2' then (
				case taustamuuttujan_arvo 
					when 'S' then 'Employer sectors total' 
					when '1' then 'State' 
					when '2' then 'Local government' 
					when '3' then 'Public sector total' 
					when '4' then 'Private' 
				end
			)
			when 'syntyp' then (
				case taustamuuttujan_arvo 
					when 'S' then 'Total (origin)' 
					when '1' then 'Finnish background' 
					when '2' then 'Foreign background' 
				end
			)
			when 'sp' then (
				case sp
					when 'S' then 'Total (gender)'
					when '1' then 'Men'
					when '2' then 'Women'
				end
			)
			when 'ikar6' then (
				case ikar6
					when 'SS' then 'Total (age group)'
					when '25' then 'Aged 25–34' 
					when '35' then 'Aged 35–44' 
					when '45' then 'Aged 45–54' 
					when '55' then 'Aged 55–64'
				end
			)
			when 'kaste_t0' then (
				case kaste_t0
					when 'S' then 'Totalt (utbildningsnivå)'
					when '1' then 'Basic education or no degree after basic education' 
					when '2' then 'Upper secondary education'
					when '3' then 'Tertiary education'
				end
			)
			when 'tol2008_1_v3' then (
				case taustamuuttujan_arvo 
					when 'SS' then 'Sectors total (00-99)'
					when 'A-B' then 'Agriculture, forestry and fishing; mining (01-09)'
					when 'C-E' then 'Manufacturing; electricity, steam and water supply, waste management and such (10-39)'
					when 'F' then 'Construction (41-43)'
					when 'G' then 'Wholesale and retail trade; repair of motor vehicles and motorcycles (45-47)'
					when 'H' then 'Transportation and storage (49-53)'
					when 'I' then 'Accommodation and food service activities (55-56)'
					when 'J' then 'Information and communication (58-63)'
					when 'K-L' then 'Financial and insurance activities; real estate activities (64-68)'
					when 'M-N' then 'Business services (69-82)'
					when 'O' then 'Public administration and defence; compulsory social security (84)'
					when 'P' then 'Education (85)'
					when 'Q' then 'Human health and social work activities (86-88)'
					when 'R-U' then 'Arts, entertainment and recreation; other service activities (90-99)'
				end
			)
		end
	--2
	,taustamuuttuja_2
	,taustamuuttuja_2_fi = 
		case taustamuuttuja_2
			when 'sp' then 'Sukupuoli' 
			when 'ikar6' then 'Ikäryhmä' 
			when 'kaste_t0' then 'Koulutustaso'
			else ''
		end
	,taustamuuttuja_2_sv = 
		case taustamuuttuja_2
			when 'sp' then 'Kön' 
			when 'ikar6' then 'Åldersgrupp' 
			when 'kaste_t0' then 'Utbildningsnivå'
			else ''
		end
	,taustamuuttuja_2_en = 
		case taustamuuttuja_2
			when 'sp' then 'Gender' 
			when 'ikar6' then 'Age group' 
			when 'kaste_t0' then 'Level of education'
			else ''
		end
	,taustamuuttujan_2_arvo
	,taustamuuttujan_2_arvo_fi = 
		case taustamuuttuja_2
			when 'sp' then (
				case sp
					when 'S' then 'Yhteensä (sukupuoli)'
					when '1' then 'Miehet'
					when '2' then 'Naiset'
				end
			)
			when 'ikar6' then (
				case ikar6
					when 'SS' then 'Yhteensä (ikäryhmä)'
					when '25' then '25–34-vuotiaat' 
					when '35' then '35–44-vuotiaat' 
					when '45' then '45–54-vuotiaat' 
					when '55' then '55–64-vuotiaat'
				end
			)
			when 'kaste_t0' then (
				case kaste_t0
					when 'S' then 'Yhteensä (koulutustaso)'
					when '1' then 'Perusaste tai ei perusasteen jälkeistä koulutusta' 
					when '2' then 'Toinen aste'
					when '3' then 'Korkea-aste'
				end
			)
			else ''
		end
	,taustamuuttujan_2_arvo_sv =
		case taustamuuttuja_2
			when 'sp' then (
				case sp
					when 'S' then 'Totalt (kön)'
					when '1' then 'Män'
					when '2' then 'Kvinnor'
				end
			)
			when 'ikar6' then (
				case ikar6
					when 'SS' then 'Totalt (åldersgrupp)'
					when '25' then '25–34-åriga' 
					when '35' then '35–44-åriga' 
					when '45' then '45–54-åriga' 
					when '55' then '55–64-åriga'
				end
			)
			when 'kaste_t0' then (
				case kaste_t0
					when 'S' then 'Totalt (utbildningsnivå)'
					when '1' then 'Grundnivå eller ingen examen efter den grundläggande utbildningen' 
					when '2' then 'Andra stadiet'
					when '3' then 'Högre nivå'
				end
			)
			else ''
		end
	,taustamuuttujan_2_arvo_en =
		case taustamuuttuja_2
			when 'sp' then (
				case sp
					when 'S' then 'Total (gender)'
					when '1' then 'Men'
					when '2' then 'Women'
				end
			)
			when 'ikar6' then (
				case ikar6
					when 'SS' then 'Total (age group)'
					when '25' then 'Aged 25–34' 
					when '35' then 'Aged 35–44' 
					when '45' then 'Aged 45–54' 
					when '55' then 'Aged 55–64'
				end
			)
			when 'kaste_t0' then (
				case kaste_t0
					when 'S' then 'Totalt (utbildningsnivå)'
					when '1' then 'Basic education or no degree after basic education' 
					when '2' then 'Upper secondary education'
					when '3' then 'Tertiary education'
				end
			)
			else ''
		end
	,jarjestys = dense_rank() over (
			order by 
			taustamuuttuja
			,isnumeric(taustamuuttujan_arvo)
			,case when taustamuuttuja = 'tol2008_1_v3' then nullif(taustamuuttujan_arvo, 'SS') else taustamuuttujan_arvo end
	)
	,jarjestys2 = dense_rank() over (
			order by 
			taustamuuttuja_2
			,isnumeric(taustamuuttujan_2_arvo)
			,taustamuuttujan_2_arvo
	)
	,virhetilanne = 'E'
	,poistettu = ' '
	,tietolahde = 'TK ' + aineisto
	,kommentti = 'CSC Juha'
	
from [VipunenTK_SA].[dbo].[v_sa_1_24_Jatkuva_oppiminen_tutk_joht_tai_kurssikoul_osallistuneet]
