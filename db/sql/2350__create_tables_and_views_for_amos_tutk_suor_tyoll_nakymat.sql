USE [ANTERO]
GO
/*

AMOS rahoitusperusteraportointi - Työllistyneet ja jatko-opiskelijat
Näkymien ja taulujen luontilauseet ANTERO-kantaan


Juha Helminen 30.5.2019, 5.8.2019
--drop-lauseet lisätty 
--Githubissa tämä skripti nimellä
2350___AMOS_tutk_suor_tyoll_nakymat_ja_taulut
*/



/****** Object:  View [dw].[v_amos_organisaatioliitokset]    Script Date: 30.5.2019 9:36:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON

DROP VIEW IF EXISTS 
[dw].[v_amos_organisaatioliitokset]
GO 

CREATE VIEW [dw].[v_amos_organisaatioliitokset]


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


