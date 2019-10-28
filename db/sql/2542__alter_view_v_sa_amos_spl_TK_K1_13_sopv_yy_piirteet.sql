USE [ANTERO]
GO

/****** Object:  View [sa].[v_sa_amos_spl_TK_K1_13_sopv_yy_piirteet]    Script Date: 23.10.2019 13:46:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [sa].[v_sa_amos_spl_TK_K1_13_sopv_yy_piirteet]
/*
Päivitetty 8.8.2019 jhe, 2.9.2019 
*/

AS

			 SELECT 
			 --jhe 22.5. kommentoitu pois aluetietoja, joita ei tarvita raportilla ainakaan toistaiseksi
			 
						 id, t.tilv, aineisto, jarj_opisk, jarjnimi_opisk/*, jarj_tutk, jarjnimi_tutk*/, jarjmaak, jarjmaaknimi/*, tutkmaak, tutkmaaknimi*/,alvv,


						 kytkin_allk.selite AS allk, t.allk_kytkin,
						 kytkin_amas_tilvseur.selite AS amas_tilvseur, t.amas_tilvseur_kytkin,
						 kytkin_amase.selite AS amase, t.amase_kytkin,
						 kytkin_amash.selite AS amash, t.amash_kytkin,
						 kytkin_maassaolo_tilvseur.selite AS maassaolo_tilvseur, t.maassaolo_tilvseur_kytkin,
						 kytkin_oppis.selite AS oppis, t.oppis_kytkin,
						 kytkin_prioriteetti.selite AS prioriteetti, t.prioriteetti_kytkin,
						 kytkin_ptoim1r2e.selite AS ptoim1r2e, t.ptoim1r2e_kytkin,--
						 kytkin_ptoim1r2h.selite AS ptoim1r2h, t.ptoim1r2h_kytkin,
						 kytkin_ptoim1r2_tilvseur.selite AS ptoim1r2_tilvseur, t.ptoim1r2_tilvseur_kytkin,
						 kytkin_toteuma_tutk.selite AS toteuma_tutk, t.toteuma_tutk_kytkin,
						 kytkin_tutklaja.selite AS tutklaja, t.tutklaja_kytkin,
						 kytkin_tyov.selite AS tyov, t.tyov_kytkin,
						 kytkin_tsekt.selite AS tsekt, t.tsekt_kytkin,

kaste_t2, kaste_t2ni, iscfibroad2013, kala_t1ni
,kaste_t2_e, kaste_t2ni_e, kaste_t2_evj, kaste_t2ni_evj, 
kaste_t2_avh, kaste_t2ni_avh, kaste_t2_tilvseur, kaste_t2ni_tilvseur, 
iscfibroad2013_tilvseur, kala_t1ni_tilvseur, 
/*
tutk_suor_1, tutk_suor_2, tutk_suor_3, tutk_suor_4, tutk_osia_suor_1, 
                                                    tutk_osia_suor_2, tutk_osia_suor_3, tutk_osia_suor_4, tutk_suor_5, tutk_suor_6, tutk_suor_7, tutk_suor_8, tutk_osia_suor_5, tutk_osia_suor_6, tutk_osia_suor_7, tutk_osia_suor_8, lkm
*/

case when toteuma_tutk=1 then lkm else 0 end as suor_koko_tutk, 
case when toteuma_tutk=2 then lkm else 0 end  as suor_tutk_osia, 
tutk_suor_1*lkm as tutk_suor_1, 
tutk_suor_2*lkm as tutk_suor_2, 
tutk_suor_3*lkm as tutk_suor_3, 
tutk_suor_4*lkm as tutk_suor_4, 
tutk_osia_suor_1*lkm as tutk_osia_suor_1, 
tutk_osia_suor_2*lkm as tutk_osia_suor_2, 
tutk_osia_suor_3*lkm as tutk_osia_suor_3, 
tutk_osia_suor_4*lkm as tutk_osia_suor_4, 
tutk_suor_5*lkm as tutk_suor_5, 
tutk_suor_6*lkm as tutk_suor_6, 
tutk_suor_7*lkm as tutk_suor_7, 
tutk_suor_8*lkm as tutk_suor_8, 
tutk_osia_suor_5*lkm as tutk_osia_suor_5, 
tutk_osia_suor_6*lkm as tutk_osia_suor_6, 
tutk_osia_suor_7*lkm as tutk_osia_suor_7, 
tutk_osia_suor_8*lkm as tutk_osia_suor_8,
lkm


/* Kertoimet
 Karin speksi 2019-04-05
Työllistyminen ja jatko-opiskelu raporttimalli 2019 04 05.xlsx
 .. välilehti: Painotettujen laskentasäännöt
Työlliset ja opiskelijat
*/
,CASE
WHEN tutk_suor_1=1 THEN lkm
WHEN tutk_suor_2=1 THEN lkm
WHEN tutk_osia_suor_1=1 THEN lkm
WHEN tutk_osia_suor_2=1 THEN lkm
WHEN tutk_suor_5=1 THEN lkm
WHEN tutk_suor_6=1 THEN lkm
WHEN tutk_osia_suor_5=1 THEN lkm
WHEN tutk_osia_suor_6=1 THEN lkm else 0 END
 as tyolliset_ja_opiskelijat													

 --Työlliset
,CASE
WHEN tutk_suor_1=1 THEN lkm
WHEN tutk_osia_suor_1=1 THEN lkm
WHEN tutk_suor_5=1 THEN lkm
WHEN tutk_osia_suor_5=1 THEN lkm else 0 END
 as tyolliset			
 
--Opiskelijat
,CASE
WHEN tutk_suor_2=1 THEN lkm
WHEN tutk_osia_suor_2=1 THEN lkm
WHEN tutk_suor_6=1 THEN lkm
WHEN tutk_osia_suor_6=1 THEN lkm else 0 END
 as opiskelijat

 
--Työlliset, opiskelijat ja työttömät
,CASE
WHEN tutk_suor_1=1 THEN lkm
WHEN tutk_suor_2=1 THEN lkm
WHEN tutk_suor_3=1 THEN lkm
WHEN tutk_osia_suor_1=1 THEN lkm
WHEN tutk_osia_suor_2=1 THEN lkm
WHEN tutk_osia_suor_3=1 THEN lkm
WHEN tutk_suor_5=1 THEN lkm
WHEN tutk_suor_6=1 THEN lkm
WHEN tutk_suor_7=1 THEN lkm
WHEN tutk_osia_suor_5=1 THEN lkm
WHEN tutk_osia_suor_6=1 THEN lkm
WHEN tutk_osia_suor_7=1 THEN lkm else 0 END
 as tyolliset_opiskelijat_ja_tyottomat													

--Statuskerroin
,CASE
WHEN tutk_suor_1=1 THEN 4 
WHEN tutk_suor_2=1 THEN 4
WHEN tutk_osia_suor_1=1 THEN 2
WHEN tutk_osia_suor_2=1 THEN 2
WHEN tutk_suor_5=1 THEN 2
WHEN tutk_suor_6=1 THEN 2
WHEN tutk_osia_suor_5=1 THEN 1
WHEN tutk_osia_suor_6=1 THEN 1 ELSE 0 END
as statuskerroin

-- # Välilehti: Suoriteraportti 2
-- Työllistyneet, ei työllisenä ennen koulutusta
,CASE
WHEN tutk_suor_1=1 THEN lkm
WHEN tutk_osia_suor_1=1 THEN lkm
else 0 END
 as tyollistyneet_ei_tyollisena_ennen_koulutusta

 -- Työllistyneet, työllisenä ennen koulutusta
,CASE
WHEN tutk_suor_5=1 THEN lkm
WHEN tutk_osia_suor_5=1 THEN lkm
else 0 END
 as tyollistyneet_tyollisena_ennen_koulutusta

 --Jatko-opiskelijat, ei työllisenä ennen koulutusta
,CASE
WHEN tutk_suor_2=1 THEN lkm
WHEN tutk_osia_suor_2=1 THEN lkm
else 0 END
 as jatko_opiskelijat_ei_tyollisena_ennen_koulutusta

 --Jatko-opiskelijat, työllisenä ennen koulutusta
,CASE
WHEN tutk_suor_6=1 THEN lkm
WHEN tutk_osia_suor_6=1 THEN lkm
else 0 END
 as jatko_opiskelijat_tyollisena_ennen_koulutusta


--Työttömät ja muussa toiminnassa
-- Karin speksi 2019-07-02, lisatty 2019-08-08 jhe
-- Työll+jatko-opisk.lisäraportti2

,CASE 
WHEN tutk_suor_3 = 1 THEN lkm
WHEN tutk_osia_suor_3 = 1 THEN lkm
WHEN tutk_suor_7 = 1 THEN lkm
WHEN tutk_osia_suor_7 = 1 THEN lkm ELSE 0 END 
 as tyoton

 --,CASE WHEN ptoim1r2e_kytkin='ptoim_99' THEN lkm ELSE 0 END 
-- jhe 2.9.2019
/*Kari 13.8.2019: ”Muussa toiminnassa” sisältää kaikki loput tutkinnon suorittaneet, jotka eivät ole työllistyneet tai jatko-opiskelijat sarakkeissa. Ei siis pelkästään 99:t.*/
 ,CASE 
 WHEN tutk_suor_4 = 1 THEN lkm
WHEN tutk_osia_suor_4 = 1 THEN lkm
WHEN tutk_suor_8 = 1 THEN lkm
WHEN tutk_osia_suor_8 = 1 THEN lkm 
WHEN (tutk_suor_1 = '0'
AND	tutk_suor_2 = '0'
AND	tutk_suor_3 = '0'
AND	tutk_suor_4 = '0'
AND	tutk_suor_5 = '0'
AND	tutk_suor_6 = '0'
AND	tutk_suor_7 = '0'
AND	tutk_suor_8 = '0'
AND	tutk_osia_suor_1 = '0'
AND	tutk_osia_suor_2 = '0'
AND	tutk_osia_suor_3 = '0'
AND	tutk_osia_suor_4 = '0'
AND	tutk_osia_suor_5 = '0'
AND	tutk_osia_suor_6 = '0'
AND	tutk_osia_suor_7 = '0'
AND	tutk_osia_suor_8 = '0') THEN lkm 
ELSE 0 END
as muu_tai_tuntematon

-- Karin speksi 2019-04-05 , 2019-07-02


--jhe 27.5.2019, aluekertoimen oletusarvoksi 1 (oli 0)
,isnull(tk_4_2.aluekerroin,1) as aluekerroin

--kertoimet

, luontipvm, source, username, loadtime
						 
FROM            (SELECT        id, tilv, aineisto, jarj_opisk, jarjnimi_opisk/*, jarj_tutk, jarjnimi_tutk*/, jarjmaak, jarjmaaknimi/*, tutkmaak, tutkmaaknimi*/, alvv

, allk, 'allk' + '_' + CAST(allk AS char(5)) AS allk_kytkin
, amas_tilvseur, 'amas' + '_' + CAST(amas_tilvseur AS char(5)) AS amas_tilvseur_kytkin
, amase, 'amas' + '_' + CAST(amase AS char(5)) AS amase_kytkin
, amash, 'amas' + '_' + CAST(amash AS char(5)) AS amash_kytkin
, maassaolo_tilvseur, 'maassaolo' + '_' + CAST(maassaolo_tilvseur AS char(5)) AS maassaolo_tilvseur_kytkin 
,oppis, 'oppis' + '_' + CAST(oppis AS char(5)) AS oppis_kytkin
, prioriteetti, 'prioriteetti' + '_' + CAST(prioriteetti AS char(5)) AS prioriteetti_kytkin
, ptoim1r2e, 'ptoim' + '_' + CAST(ptoim1r2e AS char(5)) AS ptoim1r2e_kytkin
, ptoim1r2h, 'ptoim' + '_' + CAST(ptoim1r2h AS char(5)) AS ptoim1r2h_kytkin
, ptoim1r2_tilvseur, 'ptoim' + '_' + CAST(ptoim1r2_tilvseur AS char(5)) AS ptoim1r2_tilvseur_kytkin
, toteuma_tutk, 'toteuma_tutk' + '_' + CAST(toteuma_tutk AS char(5)) AS toteuma_tutk_kytkin
,tutklaja, 'tutklaja' + '_' + CAST(tutklaja AS char(5)) AS tutklaja_kytkin
, tyov, 'tyov' + '_' + CAST(tyov AS char(5)) AS tyov_kytkin
, tsekt, 'tsekt' + '_' + CAST(tsekt AS char(5)) AS tsekt_kytkin

, case when toteuma_tutk='1' then 1 else 0 end as suor_koko_tutk
, case when toteuma_tutk='2' then 1 else 0 end as suor_tutk_osia
, kaste_t2, kaste_t2ni, iscfibroad2013, kala_t1ni
,kaste_t2_e, kaste_t2ni_e, kaste_t2_evj, kaste_t2ni_evj, kaste_t2_avh, kaste_t2ni_avh, kaste_t2_tilvseur, kaste_t2ni_tilvseur, iscfibroad2013_tilvseur, kala_t1ni_tilvseur, tutk_suor_1, tutk_suor_2, tutk_suor_3, tutk_suor_4, tutk_osia_suor_1, 
                                                    tutk_osia_suor_2, tutk_osia_suor_3, tutk_osia_suor_4, tutk_suor_5, tutk_suor_6, tutk_suor_7, tutk_suor_8, tutk_osia_suor_5, tutk_osia_suor_6, tutk_osia_suor_7, tutk_osia_suor_8, lkm, luontipvm, 
                                                    source, username, loadtime
                          FROM            [sa].[v_sa_amos_spl_TK_K1_13_sopv_yy]) AS t 

LEFT JOIN [dw].[v_amos_spl_tk_4_2abc_paa_asiallinen_toiminta_maak_indeksoitu] AS tk_4_2 ON t.jarjmaak = tk_4_2.tilvasmaak
LEFT OUTER JOIN sa.v_d_amos_tk_attribuutit AS kytkin_allk ON t.allk_kytkin = kytkin_allk.kytkin
LEFT OUTER JOIN sa.v_d_amos_tk_attribuutit AS kytkin_amas_tilvseur ON t.amas_tilvseur_kytkin = kytkin_amas_tilvseur.kytkin
LEFT OUTER JOIN sa.v_d_amos_tk_attribuutit AS kytkin_amase ON t.amase_kytkin = kytkin_amase.kytkin
LEFT OUTER JOIN sa.v_d_amos_tk_attribuutit AS kytkin_amash ON t.amash_kytkin = kytkin_amash.kytkin
LEFT OUTER JOIN sa.v_d_amos_tk_attribuutit AS kytkin_maassaolo_tilvseur ON t.maassaolo_tilvseur_kytkin = kytkin_maassaolo_tilvseur.kytkin
LEFT OUTER JOIN sa.v_d_amos_tk_attribuutit AS kytkin_oppis ON t.oppis_kytkin = kytkin_oppis.kytkin
LEFT OUTER JOIN sa.v_d_amos_tk_attribuutit AS kytkin_prioriteetti ON t.prioriteetti_kytkin = kytkin_prioriteetti.kytkin
LEFT OUTER JOIN sa.v_d_amos_tk_attribuutit AS kytkin_ptoim1r2e ON t.ptoim1r2e_kytkin = kytkin_ptoim1r2e.kytkin
LEFT OUTER JOIN sa.v_d_amos_tk_attribuutit AS kytkin_ptoim1r2h ON t.ptoim1r2h_kytkin = kytkin_ptoim1r2h.kytkin
LEFT OUTER JOIN sa.v_d_amos_tk_attribuutit AS kytkin_ptoim1r2_tilvseur ON t.ptoim1r2_tilvseur_kytkin = kytkin_ptoim1r2_tilvseur.kytkin
LEFT OUTER JOIN sa.v_d_amos_tk_attribuutit AS kytkin_toteuma_tutk ON t.toteuma_tutk_kytkin = kytkin_toteuma_tutk.kytkin
LEFT OUTER JOIN sa.v_d_amos_tk_attribuutit AS kytkin_tutklaja ON t.tutklaja_kytkin = kytkin_tutklaja.kytkin
LEFT OUTER JOIN sa.v_d_amos_tk_attribuutit AS kytkin_tyov ON t.tyov_kytkin = kytkin_tyov.kytkin
LEFT OUTER JOIN sa.v_d_amos_tk_attribuutit AS kytkin_tsekt ON t.tsekt_kytkin = kytkin_tsekt.kytkin








GO


