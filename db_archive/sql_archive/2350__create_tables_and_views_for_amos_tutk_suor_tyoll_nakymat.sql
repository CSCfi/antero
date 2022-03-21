/*

AMOS rahoitusperusteraportointi - Työllistyneet ja jatko-opiskelijat
Näkymien ja taulujen luontilauseet ANTERO-kantaan


Juha Helminen 30.5.2019, 5.8.2019, 12.8.
--drop-lauseet lisätty 
--Githubissa tämä skripti nimellä
2350___AMOS_tutk_suor_tyoll_nakymat_ja_taulut
*/

---------------------# next # ---------------------
USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON

DROP VIEW IF EXISTS 
[dw].[v_amos_organisaatioliitokset]
GO 

CREATE VIEW [dw].[v_amos_organisaatioliitokset]

/*
drop table [dw].[d_amos_rajapinta_organisaatioliitokset]
go
select *
into [dw].[d_amos_rajapinta_organisaatioliitokset]
from [dw].[v_amos_organisaatioliitokset]

select count(*) 
from [dw].[d_amos_rajapinta_organisaatioliitokset]

select top 10 *
from [dw].[d_amos_rajapinta_organisaatioliitokset]


*/


AS (
select 
  poistuva_ytunnus, 
  uusi_ytunnus,
  kytkin_muutos_voimassa, 
  count(distinct poistuva_ytunnus) as vanha_lkm, 
  count(distinct poistuva_ytunnus) as uusi_lkm, 
  tiedostot 
from 
  (
    SELECT 
      left(vanha, 9) as poistuva_ytunnus, 
      left(uusi, 9) as uusi_ytunnus, 
      CASE WHEN voimaan_alkaen <= CAST(CURRENT_TIMESTAMP AS DATE) THEN 1 ELSE 0 END AS kytkin_muutos_voimassa, count(distinct tiedostonimi) as tiedostot 
    FROM 
      sa.sa_amos_siirtotiedosto_okm1 
    WHERE 
      (
        voimaan_alkaen <= CAST(CURRENT_TIMESTAMP AS DATE)
      ) 
    group by 
      left(vanha, 9), 
      left(uusi, 9),
	  voimaan_alkaen
  ) t 
group by 
 poistuva_ytunnus, 
  uusi_ytunnus,
  kytkin_muutos_voimassa, 
  tiedostot
)



GO
---------------------# next # ---------------------

drop table  IF EXISTS[dw].[d_amos_rajapinta_organisaatioliitokset]
go
select *
into [dw].[d_amos_rajapinta_organisaatioliitokset]
from [dw].[v_amos_organisaatioliitokset]
go
---------------------# next # ---------------------
USE [ANTERO]
GO 
SET 
  ANSI_NULLS ON 
  GO 
SET 
  QUOTED_IDENTIFIER ON
  GO 

DROP VIEW IF EXISTS 
[sa].[v_amos_spl_jarjestajien_nimet_ja_maakunnat]
GO 
 
  create view [sa].[v_amos_spl_jarjestajien_nimet_ja_maakunnat] as 
SELECT 
  DISTINCT ol.organisaatio_koodi AS ytunnus, 
  ol.organisaatio_fi AS jarjestaja_nimi, 
  CASE WHEN okm8.paa_asiallinen_toiminta_maakunta_koodi = '' THEN '-' WHEN okm8.paa_asiallinen_toiminta_maakunta_koodi is null THEN ol.maakunta_koodi ELSE okm8.paa_asiallinen_toiminta_maakunta_koodi END AS paa_asiallinen_toiminta_maakunta_koodi, 
  CASE WHEN okm8.paa_asiallinen_toiminta_maakunta_koodi = '00' THEN 'Valtakunnallinen' WHEN okm8.paa_asiallinen_toiminta_maakunta_koodi = '99' THEN 'Ei määritelty' WHEN okm8.paa_asiallinen_toiminta_maakunta_koodi IS NULL THEN 'Ei määritelty' ELSE ol.maakunta_fi END AS maakunta_fi 
FROM 
  [sa].[sa_amos_siirtotiedosto_okm8] AS okm8 
  left JOIN (
    SELECT 
      DISTINCT ol.organisaatio_koodi, 
      ol.organisaatio_fi, 
      al.maakunta_koodi, 
      al.maakunta_fi 
    FROM 
      dw.d_alueluokitus AS al 
      INNER JOIN dw.d_organisaatioluokitus AS ol ON al.kunta_koodi = ol.kunta_koodi 
    WHERE 
      (
        LEN(ol.organisaatio_koodi) = 9
      ) 
      AND (ol.organisaatio_koodi LIKE '%-%')
  ) AS ol ON okm8.koul_jarj = ol.organisaatio_koodi 
  GO
---------------------# next # ---------------------
USE [ANTERO]
GO


DROP VIEW IF EXISTS 
[sa].[v_sa_amos_spl_TK_K1_13_sopv_yy]
GO 

CREATE VIEW [sa].[v_sa_amos_spl_TK_K1_13_sopv_yy] AS 
SELECT 
  t.id, 
  t.tilv, 
  t.aineisto, 
  t.prioriteetti, 
  t.toteuma_tutk, 
  t.tyov, 
  t.tsekt, 
  t.jarj_opisk, 
  jnm.jarjestaja_nimi as jarjnimi_opisk, 
  jnm.paa_asiallinen_toiminta_maakunta_koodi AS jarjmaak, 
  jnm.maakunta_fi AS jarjmaaknimi, 
  t.kaste_t2, 
  t.kaste_t2ni, 
  t.iscfibroad2013, 
  t.kala_t1ni, 
  t.oppis, 
  t.tutklaja, 
  t.alvv, 
  t.allk, 
  t.kaste_t2_e, 
  t.kaste_t2ni_e, 
  t.ptoim1r2e, 
  t.kaste_t2_evj, 
  t.kaste_t2ni_evj, 
  t.amase, 
  t.ptoim1r2h, 
  t.kaste_t2_avh, 
  t.kaste_t2ni_avh, 
  t.amash, 
  t.ptoim1r2_tilvseur, 
  t.maassaolo_tilvseur, 
  t.amas_tilvseur, 
  t.kaste_t2_tilvseur, 
  t.kaste_t2ni_tilvseur, 
  t.iscfibroad2013_tilvseur, 
  t.kala_t1ni_tilvseur, 
  t.tutk_suor_1, 
  t.tutk_suor_2, 
  t.tutk_suor_3, 
  t.tutk_suor_4, 
  t.tutk_osia_suor_1, 
  t.tutk_osia_suor_2, 
  t.tutk_osia_suor_3, 
  t.tutk_osia_suor_4, 
  t.tutk_suor_5, 
  t.tutk_suor_6, 
  t.tutk_suor_7, 
  t.tutk_suor_8, 
  t.tutk_osia_suor_5, 
  t.tutk_osia_suor_6, 
  t.tutk_osia_suor_7, 
  t.tutk_osia_suor_8, 
  t.lkm, 
  t.luontipvm, 
  t.source, 
  t.username, 
  t.loadtime 
FROM 
  (
    SELECT 
      '' AS id, 
      tk.tilv, 
      tk.aineisto, 
      tk.prioriteetti, 
      tk.toteuma_tutk, 
      tk.tyov, 
      '' AS tsekt, 
      CASE WHEN aol.poistuva_ytunnus = tk.jarj_opisk THEN aol.uusi_ytunnus ELSE tk.jarj_opisk END AS jarj_opisk, 
      tk.kaste_t2, 
      tk.kaste_t2ni, 
      tk.iscfibroad2013, 
      tk.kala_t1ni, 
      tk.oppis, 
      tk.tutklaja, 
      tk.alvv, 
      tk.allk, 
      tk.kaste_t2_e, 
      tk.kaste_t2ni_e, 
      tk.ptoim1r2e, 
      tk.kaste_t2_evj, 
      tk.kaste_t2ni_evj, 
      tk.amase, 
      tk.ptoim1r2h, 
      tk.kaste_t2_avh, 
      tk.kaste_t2ni_avh, 
      tk.amash, 
      tk.ptoim1r2_tilvseur, 
      tk.maassaolo_tilvseur, 
      tk.amas_tilvseur, 
      tk.kaste_t2_tilvseur, 
      tk.kaste_t2ni_tilvseur, 
      tk.iscfibroad2013_tilvseur, 
      tk.kala_t1ni_tilvseur, 
      tk.tutk_suor_1, 
      tk.tutk_suor_2, 
      tk.tutk_suor_3, 
      tk.tutk_suor_4, 
      tk.tutk_osia_suor_1, 
      tk.tutk_osia_suor_2, 
      tk.tutk_osia_suor_3, 
      tk.tutk_osia_suor_4, 
      tk.tutk_suor_5, 
      tk.tutk_suor_6, 
      tk.tutk_suor_7, 
      tk.tutk_suor_8, 
      tk.tutk_osia_suor_5, 
      tk.tutk_osia_suor_6, 
      tk.tutk_osia_suor_7, 
      tk.tutk_osia_suor_8, 
      tk.lkm, 
      tk.luontipvm, 
      '' AS source, 
      '' AS username, 
      '' AS loadtime 
    FROM 
      TK_H9098_CSC.dbo.TK_K1_13_sopv_19 AS tk 
      LEFT OUTER JOIN [dw].[d_amos_rajapinta_organisaatioliitokset] AS aol ON tk.jarj_opisk = aol.poistuva_ytunnus 
    WHERE 
      (tk.jarj_tutk <> '9999999-9') 
      AND (tk.toteuma_tutk = '1')
  ) t 
  INNER JOIN [sa].[v_amos_spl_jarjestajien_nimet_ja_maakunnat] as jnm ON t.jarj_opisk = jnm.ytunnus 
  
  GO

---------------------# next # ---------------------

DROP VIEW IF EXISTS 
[dw].[v_amos_spl_TK_4_2abc_sopv_18]
GO 

  create view [dw].[v_amos_spl_TK_4_2abc_sopv_18] as 
  /*
  DROP TABLE
  dw.d_amos_spl_TK_4_2abc_sopv_18
  go
  
  select *
  into dw.d_amos_spl_TK_4_2abc_sopv_18
  from dw.v_amos_spl_TK_4_2abc_sopv_18
  
  select count(*)
  from dw.d_amos_spl_TK_4_2abc_sopv_18
  
  select top 10 *
  from dw.d_amos_spl_TK_4_2abc_sopv_18
  
  */
SELECT 
  'a' as toimitus, 
  'a. pääasiallinen toiminta 2017, lopullinen (toimitus: joulukuu)' as toimitus_kuvaus, 
  * 
FROM 
  [TK_H9098_CSC].[dbo].[TK_4_2a_sopv_18] 
UNION 
SELECT 
  'b' as toimitus, 
  'b. koulutusrakenne 2018 (toimitus: joulukuu)' as toimitus_kuvaus, 
  null AS [ptoim1r6], 
  null AS [amm2010], 
  null AS [tsekt], 
  * 
FROM 
  [TK_H9098_CSC].[dbo].[TK_4_2b_sopv_18] 
UNION 
SELECT 
  'c' as toimitus, 
  'c. pääasiallinen toiminta 2017, lopullinen ilman ammattia ja työpaikkatietoja (toimitus: huhtikuu)' as toimitus_kuvaus, 
  null AS [amm2010], 
  null AS [tsekt], 
  * 
FROM 
  [TK_H9098_CSC].[dbo].[TK_4_2c_sopv_18] 
  GO
		
---------------------# next # ---------------------
  DROP TABLE
  dw.d_amos_spl_TK_4_2abc_sopv_18
  go
  
  select *
  into dw.d_amos_spl_TK_4_2abc_sopv_18
  from dw.v_amos_spl_TK_4_2abc_sopv_18
  GO

---------------------# next # ---------------------
/* AMOS-attribuutit tuovat koodeille selitteet, mutta taulua ylläpidettävä käsin. Tässä haettu samaa
kytkin-tyyppistä ideaa kuin Vipus-raporteilla. Onko tarpeen? Ehkä ei. Taulu siis luotu manuaalisesti
erikseen sekä testiin että tuotantoon. Insert-lauseet eivät ole mukana tässä skriptissä.
-- jhe 5.8.2019

USE [ANTERO]
GO

DROP TABLE [sa].[d_amos_tk_attribuutit]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[d_amos_tk_attribuutit](
	[muuttuja] [nvarchar](255) NULL,
	[tieto] [char](10) NULL,
	[selite] [nvarchar](max) NULL
) 

GO

DROP VIEW IF EXISTS 
[sa].[v_d_amos_tk_attribuutit]
GO 

CREATE VIEW [sa].[v_d_amos_tk_attribuutit]
AS
SELECT        muuttuja, tieto, muuttuja + '_' + CAST(tieto AS char(5)) AS kytkin, selite
FROM            sa.d_amos_tk_attribuutit

GO
*/

---------------------# next # ---------------------

DROP VIEW IF EXISTS 
[dw].[v_amos_spl_tk_4_2abc_paa_asiallinen_toiminta_maak]
GO 

CREATE VIEW [dw].[v_amos_spl_tk_4_2abc_paa_asiallinen_toiminta_maak] AS 
SELECT 
  tilvasmaak, 
  paatoiminen_tyollinen, 
  tyoton, 
  tyollinen_opiskelija, 
  tyolliset, 
  yhteensa, 
  Cast(tyolliset AS FLOAT) / Cast(yhteensa AS FLOAT) AS tyolliset_per_yhteensa, 
  fixed_key 
FROM 
  (
    SELECT 
      'key' AS fixed_key, 
      tilvasmaak, 
      paatoiminen_tyollinen, 
      tyoton, 
      tyollinen_opiskelija, 
      paatoiminen_tyollinen + tyollinen_opiskelija AS tyolliset, 
      tyoton + paatoiminen_tyollinen + tyollinen_opiskelija AS yhteensa 
    FROM 
      (
        SELECT 
          tilvasmaak, 
          Sum(
            CASE WHEN ptoim1r6 = 10 THEN lkm ELSE 0 END
          ) AS paatoiminen_tyollinen, 
          Sum(
            CASE WHEN ptoim1r6 = 12 THEN lkm ELSE 0 END
          ) AS tyoton, 
          Sum(
            CASE WHEN ptoim1r6 = 13 THEN lkm ELSE 0 END
          ) AS tyollinen_opiskelija, 
          Sum(lkm) AS lkm 
        FROM 
          (
            SELECT 
              tilvasmaak, 
              ptoim1r6, 
              selite, 
              Sum(lkm) AS lkm 
            FROM 
              (
                SELECT 
                  tk_4_2.tilv, 
                  tk_4_2.tilvasmaak, 
                  tk_4_2.ptoim1r6, 
                  attr.muuttuja, 
                  attr.selite, 
                  tk_4_2.lkm 
                FROM 
                  dw.d_amos_spl_tk_4_2abc_sopv_18 AS tk_4_2 
                  INNER JOIN sa.v_d_amos_tk_attribuutit AS attr ON tk_4_2.ptoim1r6 = attr.tieto 
                WHERE 
                  (toimitus = 'a') 
                  AND (attr.muuttuja = N'ptoim') 
                  AND (
                    tk_4_2.ptoim1r6 IN (10, 12, 13)
                  ) 
                  AND (tk_4_2.tilvasmaak <> '')
              ) AS t 
            GROUP BY 
              tilvasmaak, 
              ptoim1r6, 
              selite
          ) AS t2 
        GROUP BY 
          tilvasmaak
      ) AS t3
  ) AS t4
GO
---------------------# next # ---------------------

DROP VIEW IF EXISTS 
[dw].[v_amos_spl_tk_4_2abc_paa_asiallinen_toiminta_maak_indeksoitu]
GO 

CREATE VIEW [dw].[v_amos_spl_tk_4_2abc_paa_asiallinen_toiminta_maak_indeksoitu] 
AS 
SELECT 
  t3.tilvasmaak, 
  t3.paatoiminen_tyollinen, 
  t3.tyoton, 
  t3.tyollinen_opiskelija, 
  t3.tyolliset, 
  t3.yhteensa, 
  t3.tyolliset_per_yhteensa, 
  t2.indeksi_jakaja, 
  t2.indeksi_jakaja / t3.tyolliset_per_yhteensa AS aluekerroin 
FROM 
  (
    SELECT 
      DISTINCT fixed_key, 
      CAST(
        SUM(tyolliset) AS float
      ) / CAST(
        SUM(yhteensa) AS float
      ) AS indeksi_jakaja 
    FROM 
      dw.v_amos_spl_tk_4_2abc_paa_asiallinen_toiminta_maak AS t1 
    GROUP BY 
      fixed_key
  ) AS t2 
  INNER JOIN dw.v_amos_spl_tk_4_2abc_paa_asiallinen_toiminta_maak AS t3 ON t2.fixed_key = t3.fixed_key
GO
---------------------# next # ---------------------

DROP VIEW IF EXISTS 
[sa].[v_sa_amos_spl_TK_K1_13_sopv_yy_piirteet]
GO 

CREATE VIEW [sa].[v_sa_amos_spl_TK_K1_13_sopv_yy_piirteet]
/*
--Päivitetty 8.8.2019 jhe

drop table [sa].[d_sa_amos_spl_TK_K1_13_sopv_yy_piirteet]
go

select *
into [sa].[d_sa_amos_spl_TK_K1_13_sopv_yy_piirteet]
from [sa].[v_sa_amos_spl_TK_K1_13_sopv_yy_piirteet]

select count (*) from
[sa].[d_sa_amos_spl_TK_K1_13_sopv_yy_piirteet]

select top 10 * from [sa].[d_sa_amos_spl_TK_K1_13_sopv_yy_piirteet]

*/

AS

			 SELECT 
			 --jhe 22.5. kommentoitu pois aluetietoja, joita ei tarvita raportilla ainakaan toistaiseksi
			 
						 id, tilv, aineisto, jarj_opisk, jarjnimi_opisk/*, jarj_tutk, jarjnimi_tutk*/, jarjmaak, jarjmaaknimi/*, tutkmaak, tutkmaaknimi*/,alvv,


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


/* Kertoimet */
-- Karin speksi 2019-04-05
--https://jira.eduuni.fi/browse/CSCSUOLA-1
--Työllistyminen ja jatko-opiskelu raporttimalli 2019 04 05.xlsx
-- .. välilehti: Painotettujen laskentasäännöt
--Työlliset ja opiskelijat

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

,CASE WHEN ptoim1r2e_kytkin='ptoim_12' THEN lkm ELSE 0 END 
as tyoton

,CASE WHEN ptoim1r2e_kytkin='ptoim_99' THEN lkm ELSE 0 END 
as muu_tai_tuntematon

-- /Karin speksi 2019-04-05 , 2019-07-02


--jhe 27.5.2019, aluekertoimen oletusarvoksi 1 (oli 0)
,isnull(tk_4_2.aluekerroin,1) as aluekerroin

--/kertoimet

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


---------------------# next # ---------------------
DROP VIEW IF EXISTS 
[sa].[v_sa_amos_spl_TK_K1_13_sopv_yy_tabular]
GO 

CREATE VIEW [sa].[v_sa_amos_spl_TK_K1_13_sopv_yy_tabular] AS 

/*
--Päivitetty 8.8.2019, jhe

drop table [sa].[d_sa_amos_spl_TK_K1_13_sopv_yy_tabular]
go
select * 
into [sa].[d_sa_amos_spl_TK_K1_13_sopv_yy_tabular]
from [sa].[v_sa_amos_spl_TK_K1_13_sopv_yy_tabular]
go

select count(*) from [sa].[d_sa_amos_spl_TK_K1_13_sopv_yy_tabular]
select top 10 * from [sa].[d_sa_amos_spl_TK_K1_13_sopv_yy_tabular]

*/
SELECT 
  tilv, 
  aineisto, 
  jarj_opisk, 
  jarjnimi_opisk, 
  jarj_opisk + ' ' + jarjnimi_opisk as ytunnus_jarjnimi_opisk, 

--jhe 26.6.2019 Valtterin ja Ainon PBI-näkymiin pari kenttää lisää
  omistajatyyppi_koodi,
  omistajatyyppi,

  --jhe 22.5.2019 kommentoitu pois aluetietoa, jota ei ainakaan toistaiseksi raportilla tarvita 
  /*jarj_tutk,
         jarjnimi_tutk,*/
 
  jarjmaak, 
  jarjmaaknimi, 
  
  /*tutkmaak,
         tutkmaaknimi,*/
  alvv, 
  allk, 
  allk_kytkin, 
  amas_tilvseur, 
  amas_tilvseur_kytkin, 
  amase, 
  amase_kytkin, 
  amash, 
  amash_kytkin, 
  maassaolo_tilvseur, 
  maassaolo_tilvseur_kytkin, 
  oppis, 
  oppis_kytkin, 
  prioriteetti, 
  prioriteetti_kytkin, 
  ptoim1r2e, 
  ptoim1r2e_kytkin, 
  ptoim1r2h, 
  ptoim1r2h_kytkin, 
  ptoim1r2_tilvseur, 
  ptoim1r2_tilvseur_kytkin, 
  toteuma_tutk, 
  toteuma_tutk_kytkin, 
  tutklaja, 
  tutklaja_kytkin, 
  tyov, 
  tyov_kytkin, 
  kaste_t2, 
  kaste_t2ni, 
  iscfibroad2013, 
  kala_t1ni, 
  kaste_t2_e, 
  kaste_t2ni_e, 
  kaste_t2_evj, 
  kaste_t2ni_evj, 
  kaste_t2_avh, 
  kaste_t2ni_avh, 
  kaste_t2_tilvseur, 
  kaste_t2ni_tilvseur, 
  iscfibroad2013_tilvseur, 
  kala_t1ni_tilvseur, 
  suor_koko_tutk_yhteensa, 
  tyolliset_opiskelijat_ja_tyottomat_yhteensa, 
  jarjestajakerroin, 
  suor_koko_tutk, 
  suor_tutk_osia, 
  tutk_suor_1, 
  tutk_suor_2, 
  tutk_suor_3, 
  tutk_suor_4, 
  tutk_osia_suor_1, 
  tutk_osia_suor_2, 
  tutk_osia_suor_3, 
  tutk_osia_suor_4, 
  tutk_suor_5, 
  tutk_suor_6, 
  tutk_suor_7, 
  tutk_suor_8, 
  tutk_osia_suor_5, 
  tutk_osia_suor_6, 
  tutk_osia_suor_7, 
  tutk_osia_suor_8, 
  lkm, 
  tyolliset_ja_opiskelijat, 
  tyolliset, 
  opiskelijat, 
  tyolliset_opiskelijat_ja_tyottomat, 
  statuskerroin, 
  aluekerroin, 
  statuskerroin * aluekerroin * jarjestajakerroin * tyolliset AS tyollisten_painotetut_pisteet, 
  statuskerroin * jarjestajakerroin * opiskelijat AS opiskelijoiden_painotetut_pisteet, 
  tyollistyneet_ei_tyollisena_ennen_koulutusta, 
  tyollistyneet_tyollisena_ennen_koulutusta, 
  jatko_opiskelijat_ei_tyollisena_ennen_koulutusta, 
  jatko_opiskelijat_tyollisena_ennen_koulutusta, 
  --lisätty 8.8.2019 jhe
  tyoton,
  muu_tai_tuntematon,

  luontipvm 
FROM 
  (
    SELECT 
      t.tilv, 
      t.aineisto, 
      t.jarj_opisk, 
      t.jarjnimi_opisk, 
	  okm8.omistajatyyppi_koodi,
      okm8.omistajatyyppi,
      /*t.jarj_tutk,
                t.jarjnimi_tutk,*/
      t.jarjmaak, 
      t.jarjmaaknimi, 
      
      /*t.tutkmaak,
                t.tutkmaaknimi,*/
      t.alvv, 
      t.allk, 
      t.allk_kytkin, 
      t.amas_tilvseur, 
      t.amas_tilvseur_kytkin, 
      t.amase, 
      t.amase_kytkin, 
      t.amash, 
      t.amash_kytkin, 
      t.maassaolo_tilvseur, 
      t.maassaolo_tilvseur_kytkin, 
      t.oppis, 
      t.oppis_kytkin, 
      t.prioriteetti, 
      t.prioriteetti_kytkin, 
      t.ptoim1r2e, 
      t.ptoim1r2e_kytkin, 
      t.ptoim1r2h, 
      t.ptoim1r2h_kytkin, 
      t.ptoim1r2_tilvseur, 
      t.ptoim1r2_tilvseur_kytkin, 
      t.toteuma_tutk, 
      t.toteuma_tutk_kytkin, 
      t.tutklaja, 
      t.tutklaja_kytkin, 
      t.tyov, 
      t.tyov_kytkin, 
      t.kaste_t2, 
      t.kaste_t2ni, 
      t.iscfibroad2013, 
      t.kala_t1ni, 
      t.kaste_t2_e, 
      t.kaste_t2ni_e, 
      t.kaste_t2_evj, 
      t.kaste_t2ni_evj, 
      t.kaste_t2_avh, 
      t.kaste_t2ni_avh, 
      t.kaste_t2_tilvseur, 
      t.kaste_t2ni_tilvseur, 
      t.iscfibroad2013_tilvseur, 
      t.kala_t1ni_tilvseur, 
      j.suor_koko_tutk_yhteensa, 
      j.tyolliset_opiskelijat_ja_tyottomat_yhteensa, 
      j.jarjestajakerroin, 
      t.suor_koko_tutk, 
      t.suor_tutk_osia, 
      t.tutk_suor_1, 
      t.tutk_suor_2, 
      t.tutk_suor_3, 
      t.tutk_suor_4, 
      t.tutk_osia_suor_1, 
      t.tutk_osia_suor_2, 
      t.tutk_osia_suor_3, 
      t.tutk_osia_suor_4, 
      t.tutk_suor_5, 
      t.tutk_suor_6, 
      t.tutk_suor_7, 
      t.tutk_suor_8, 
      t.tutk_osia_suor_5, 
      t.tutk_osia_suor_6, 
      t.tutk_osia_suor_7, 
      t.tutk_osia_suor_8, 
      t.lkm, 
      t.tyolliset_ja_opiskelijat, 
      t.tyolliset, 
      t.opiskelijat, 
      t.tyolliset_opiskelijat_ja_tyottomat, 
      t.tyollistyneet_ei_tyollisena_ennen_koulutusta, 
      t.tyollistyneet_tyollisena_ennen_koulutusta, 
      t.jatko_opiskelijat_ei_tyollisena_ennen_koulutusta, 
      t.jatko_opiskelijat_tyollisena_ennen_koulutusta, 
	  --lisätty kaksi kenttaa 8.8.2019, jhe
	  t.tyoton,
	  t.muu_tai_tuntematon,

      t.statuskerroin, 
      t.aluekerroin, 
      t.luontipvm 
    FROM 
      sa.d_sa_amos_spl_TK_K1_13_sopv_yy_piirteet AS t 
      INNER JOIN sa.v_sa_amos_spl_TK_K1_13_sopv_yy_jarjestajakerroin AS j ON t.jarj_opisk = j.jarj_opisk
  LEFT JOIN [sa].[sa_amos_siirtotiedosto_okm8] as okm8
  on t.jarj_opisk=okm8.koul_jarj

  ) AS t_1
 

GO

---------------------# next # ---------------------
drop table IF EXISTS [sa].[d_sa_amos_spl_TK_K1_13_sopv_yy_tabular]
go
select * 
into [sa].[d_sa_amos_spl_TK_K1_13_sopv_yy_tabular]
from [sa].[v_sa_amos_spl_TK_K1_13_sopv_yy_tabular]
GO
