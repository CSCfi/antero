USE [VipunenTK_DW]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_AP_f_2_1_R2_22_Peruskoulutiedosto_kieltenmaara_oppilasmaarat]    Script Date: 12.12.2019 8:33:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[p_lataa_AP_f_2_1_R2_22_Peruskoulutiedosto_kieltenmaara_oppilasmaarat] AS

/* Lauseet siirtoon VipunenTK-kantaan nopeaa testiä varten

EXECUTE [p_lataa_AP_f_2_1_R2_22_Peruskoulutiedosto_kieltenmaara_oppilasmaarat]

Välitaulun luonti
DROP TABLE [f_Ainevalinnat_2_1_Peruskoulutiedosto]
SELECT * INTO dbo.[f_Ainevalinnat_2_1_Peruskoulutiedosto] FROM [v_f_Ainevalinnat_2_1_Peruskoulutiedosto]

DROP TABLE f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk
SELECT * INTO dbo.f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk FROM v_f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk


*/

-- Täytetään ensin välitaulu unpivot-muodossa


TRUNCATE Table [f_Ainevalinnat_2_1_Peruskoulutiedosto]
INSERT INTO [f_Ainevalinnat_2_1_Peruskoulutiedosto]
SELECT * FROM [v_f_Ainevalinnat_2_1_Peruskoulutiedosto]


Truncate table VipunenTK_DW.dbo.f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk
Insert into VipunenTK_DW.dbo.f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk
Select * from [v_f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] 

-- Tyhjennetään ja täytetään VipunenTK.dbo.f_ainevalinnat_perusopetuksessa
TRUNCATE TABLE VipunenTK.dbo.f_ainevalinnat_perusopetuksessa
INSERT INTO VipunenTK.dbo.f_ainevalinnat_perusopetuksessa
SELECT [tilv]
      ,[aine_koodi]=f.aine_koodi
      ,[kielentaso_koodi]=f.kielentaso_koodi
      ,[oppilaitos_koodi]
      ,[lkm_yht]
      ,[lkm_pojat]
      ,[lkm_tytot]
      ,[vuosiluokka_koodi]=f.vuosiluokka_koodi
      ,[kieltenmäärä_koodi]=f.kieltenmäärä_koodi
      ,[oppilaitoksensijainti_historia_koodi]
      ,[vuosiluokka_id]=ISNULL(d1.id,-2)
      ,[tilv_date]
      ,[aineisto]
      ,[laatu_id]=0
      ,[ainevalinta_id]=ISNULL(d2.id,-2)
      ,[kieltenmaara_id]=ISNULL(d3.id,-2)
      ,[oppilaitos_historia_id]=ISNULL(d4h.id,-2)
      ,[oppilaitos_id]=ISNULL(d4.id,-2)
      ,[oppilaitoksensijainti_historia_id]=ISNULL(d5h.id,-2)
      ,[oppilaitoksensijainti_id]=ISNULL(d5.id,-2)


	
FROM

(

SELECT 
      [tilv]
      ,tilv_date
      --,[jarj]
      --,[tiedtype]
      --,[tunn]
      --,[edesi]
      --,[edala]
      --,[edyla]
      --,[edlisa]
      --,[edainep]
      --,[syesi]
      --,[syala]
      --,[syyla]
      --,[sylisa]
      --,[symamu]
      --,[sylukio]
      --,[syamm]
      --,[symuu]
      --,[aku]
      --,[kaytto]
      --,[tietolahde]
      --,[rivinumero]
      --,[lkm_arvo]
      --,[lkm_id]
      
      ,vuosiluokka_koodi = Cast(vuosiluokka_koodi as nvarchar(10))
      ,aine_koodi = Cast(aine_koodi as nvarchar(10))
      ,kielentaso_koodi = Cast(kielentaso_koodi as nvarchar(10))
      ,kieltenmäärä_koodi = Cast(kieltenmäärä_koodi as nvarchar(10))
      ,oppilaitos_koodi = CAST(oppilaitos_koodi as nvarchar(5))
      ,oppilaitoksensijainti_historia_koodi = CAST(ol.sijaintikuntakoodi as nvarchar(21)) --CAST('-1' as nvarchar(21))
      ,lkm_yht
      ,lkm_pojat
      ,lkm_tytot
      ,aineisto = CAST('2.1' as nvarchar(8))
FROM (

SELECT 
      [tilv]
      ,tilv_date
      ,vuosiluokka_koodi = 'lk1'
      ,aine_koodi = 'englanti'
      ,kielentaso_koodi = 'A1'
      ,kieltenmäärä_koodi = '-1'
      ,oppilaitos_koodi = tunn
      ,lkm_yht = lkm_arvo --vain yhdellä lkm-kentällä voi olla lkm_arvo, muilla pitää olla NULL
      ,lkm_pojat = lkm_arvo --vain yhdellä lkm-kentällä voi olla lkm_arvo, muilla pitää olla NULL
      ,lkm_tytot = lkm_arvo --vain yhdellä lkm-kentällä voi olla lkm_arvo, muilla pitää olla NULL
      ,lähde='eng1'
FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto]
WHERE lkm_id='<kentännimi>'
--suoraan aineistosta saatavat
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'kats_evlut', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja aev, rivi 259' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='aev' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_10', 'kats_evlut', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yev, rivi 260' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yev' 		
		
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'kats_ortod', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja aort, rivi 262' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='aort' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_10', 'kats_ortod', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yort, rivi 263' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yort' 		
		
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'kats_elama', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja aet, rivi 265' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='aet' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_10', 'kats_elama', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yet, rivi 266' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yet' 		
		
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'kats_muut', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja amu, rivi 268' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='amu' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_10', 'kats_muut', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ymu, rivi 269' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ymu' 		
		
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'kats_ei', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja aeos, rivi 271' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='aeos' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_10', 'kats_ei', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yeos, rivi 272' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yeos' 		
		
		
		
		
		
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'suomi2', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja asv, rivi 278' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='asv' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_10', 'suomi2', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ysv, rivi 279' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ysv' 		
		
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'ruotsi2', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja arv, rivi 281' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='arv' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_10', 'ruotsi2', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yrv, rivi 282' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yrv' 		
		
		
		
		
		
UNION ALL SELECT tilv, tilv_date, 'lk1', 'englanti', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja eng1, rivi 288' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='eng1' 		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'englanti', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja eng2, rivi 289' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='eng2' 		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'englanti', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja eng3, rivi 290' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='eng3' 		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'englanti', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja eng4, rivi 291' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='eng4' 		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'englanti', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja eng5, rivi 292' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='eng5' 		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'englanti', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja eng6, rivi 293' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='eng6' 		
	UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'englanti', 'A1', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f2 
 WHERE lkm_id='enn'AND f2.rivinumero=f1.rivinumero),0), NULL, 'muuttuja eny, rivi 294' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f1 WHERE f1.lkm_id='eny' 	
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'englanti', 'A1', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja enn, rivi 295' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='enn' 		
UNION ALL SELECT tilv, tilv_date, 'lk1', 'ruotsi', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ru1, rivi 296' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ru1' 		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'ruotsi', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ru2, rivi 297' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ru2' 		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'ruotsi', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ru3, rivi 298' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ru3' 		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'ruotsi', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ru4, rivi 299' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ru4' 		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'ruotsi', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ru5, rivi 300' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ru5' 		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'ruotsi', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ru6, rivi 301' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ru6' 		
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'ruotsi', 'A1', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f2 
 WHERE lkm_id='run'AND f2.rivinumero=f1.rivinumero),0), NULL, 'muuttuja ruy, rivi 302' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f1 WHERE f1.lkm_id='ruy' 	
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'ruotsi', 'A1', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja run, rivi 303' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='run' 		
UNION ALL SELECT tilv, tilv_date, 'lk1', 'suomi', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja su1, rivi 304' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='su1' 		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'suomi', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja su2, rivi 305' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='su2' 		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'suomi', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja su3, rivi 306' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='su3' 		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'suomi', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja su4, rivi 307' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='su4' 		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'suomi', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja su5, rivi 308' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='su5' 		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'suomi', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja su6, rivi 309' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='su6' 		
	UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'suomi', 'A1', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f2 
 WHERE lkm_id='sun'AND f2.rivinumero=f1.rivinumero),0), NULL, 'muuttuja suy, rivi 310' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f1 WHERE f1.lkm_id='suy' 	
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'suomi', 'A1', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja sun, rivi 311' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='sun' 		
UNION ALL SELECT tilv, tilv_date, 'lk1', 'ranska', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ra1, rivi 312' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ra1' 		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'ranska', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ra2, rivi 313' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ra2' 		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'ranska', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ra3, rivi 314' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ra3' 		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'ranska', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ra4, rivi 315' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ra4' 		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'ranska', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ra5, rivi 316' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ra5' 		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'ranska', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ra6, rivi 317' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ra6' 		
	UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'ranska', 'A1', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f2 
 WHERE lkm_id='ran'AND f2.rivinumero=f1.rivinumero),0), NULL, 'muuttuja ray, rivi 318' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f1 WHERE f1.lkm_id='ray' 	
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'ranska', 'A1', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja ran, rivi 319' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ran' 		
UNION ALL SELECT tilv, tilv_date, 'lk1', 'saksa', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja sa1, rivi 320' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='sa1' 		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'saksa', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja sa2, rivi 321' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='sa2' 		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'saksa', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja sa3, rivi 322' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='sa3' 		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'saksa', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja sa4, rivi 323' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='sa4' 		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'saksa', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja sa5, rivi 324' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='sa5' 		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'saksa', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja sa6, rivi 325' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='sa6' 		
	UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'saksa', 'A1', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f2 
 WHERE lkm_id='san'AND f2.rivinumero=f1.rivinumero),0), NULL, 'muuttuja say, rivi 326' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f1 WHERE f1.lkm_id='say' 	
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'saksa', 'A1', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja san, rivi 327' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='san' 		
UNION ALL SELECT tilv, tilv_date, 'lk1', 'venaja', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ve1, rivi 328' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ve1' 		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'venaja', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ve2, rivi 329' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ve2' 		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'venaja', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ve3, rivi 330' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ve3' 		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'venaja', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ve4, rivi 331' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ve4' 		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'venaja', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ve5, rivi 332' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ve5' 		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'venaja', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ve6, rivi 333' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ve6' 		
	UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'venaja', 'A1', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f2 
 WHERE lkm_id='ven'AND f2.rivinumero=f1.rivinumero),0), NULL, 'muuttuja vey, rivi 334' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f1 WHERE f1.lkm_id='vey' 	
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'venaja', 'A1', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja ven, rivi 335' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ven' 		
UNION ALL SELECT tilv, tilv_date, 'lk1', 'saame', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja saa1, rivi 336' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='saa1' 		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'saame', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja saa2, rivi 337' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='saa2' 		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'saame', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja saa3, rivi 338' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='saa3' 		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'saame', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja saa4, rivi 339' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='saa4' 		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'saame', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja saa5, rivi 340' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='saa5' 		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'saame', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja saa6, rivi 341' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='saa6' 		
	UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'saame', 'A1', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f2 
 WHERE lkm_id='saan'AND f2.rivinumero=f1.rivinumero),0), NULL, 'muuttuja saay, rivi 342' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f1 WHERE f1.lkm_id='saay' 	
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'saame', 'A1', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja saan, rivi 343' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='saan' 		
UNION ALL SELECT tilv, tilv_date, 'lk1', 'muu_kieli', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja mu1, rivi 344' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='mu1' 		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'muu_kieli', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja mu2, rivi 345' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='mu2' 		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'muu_kieli', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja mu3, rivi 346' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='mu3' 		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'muu_kieli', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja mu4, rivi 347' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='mu4' 		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'muu_kieli', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja mu5, rivi 348' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='mu5' 		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'muu_kieli', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja mu6, rivi 349' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='mu6' 		
	UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'muu_kieli', 'A1', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f2 
 WHERE lkm_id='mun'AND f2.rivinumero=f1.rivinumero),0), NULL, 'muuttuja muy, rivi 350' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f1 WHERE f1.lkm_id='muy' 	
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'muu_kieli', 'A1', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja mun, rivi 351' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='mun' 		
UNION ALL SELECT tilv, tilv_date, 'lk1', 'ei_kielta', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja eopis1, rivi 352' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='eopis1' 		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'ei_kielta', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja eopis2, rivi 353' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='eopis2' 		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'ei_kielta', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja eopis3, rivi 354' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='eopis3' 		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'ei_kielta', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja eopis4, rivi 355' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='eopis4' 		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'ei_kielta', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja eopis5, rivi 356' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='eopis5' 		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'ei_kielta', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja eopis6, rivi 357' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='eopis6' 		
	UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'ei_kielta', 'A1', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f2 
 WHERE lkm_id='eopisn'AND f2.rivinumero=f1.rivinumero),0), NULL, 'muuttuja eopisy, rivi 358' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f1 WHERE f1.lkm_id='eopisy' 	
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'ei_kielta', 'A1', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja eopisn, rivi 359' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='eopisn' 		
		
		
		
		
		
		
		
		
UNION ALL SELECT tilv, tilv_date, 'lk1', 'englanti', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ven1, rivi 368' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ven1' 		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'englanti', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ven2, rivi 369' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ven2' 		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'englanti', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ven3, rivi 370' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ven3' 		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'englanti', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ven4, rivi 371' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ven4' 		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'englanti', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ven5, rivi 372' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ven5' 		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'englanti', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ven6, rivi 373' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ven6' 		
	UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'englanti', 'A2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f2 
 WHERE lkm_id='venn'AND f2.rivinumero=f1.rivinumero),0), NULL, 'muuttuja veny, rivi 374' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f1 WHERE f1.lkm_id='veny' 	
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'englanti', 'A2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja venn, rivi 375' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='venn' 		
UNION ALL SELECT tilv, tilv_date, 'lk1', 'ruotsi', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vru1, rivi 376' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vru1' 		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'ruotsi', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vru2, rivi 377' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vru2' 		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'ruotsi', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vru3, rivi 378' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vru3' 		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'ruotsi', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vru4, rivi 379' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vru4' 		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'ruotsi', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vru5, rivi 380' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vru5' 		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'ruotsi', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vru6, rivi 381' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vru6' 		
	UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'ruotsi', 'A2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f2 
 WHERE lkm_id='vrun'AND f2.rivinumero=f1.rivinumero),0), NULL, 'muuttuja vruy, rivi 382' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f1 WHERE f1.lkm_id='vruy' 	
UNION ALL SELECT tilv, tilv_date, 'lk1', 'suomi', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vsu1, rivi 383' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vsu1' 		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'suomi', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vsu2, rivi 384' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vsu2' 		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'suomi', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vsu3, rivi 385' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vsu3' 		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'suomi', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vsu4, rivi 386' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vsu4' 		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'suomi', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vsu5, rivi 387' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vsu5' 		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'suomi', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vsu6, rivi 388' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vsu6' 		
	UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'suomi', 'A2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f2 
 WHERE lkm_id='vsun'AND f2.rivinumero=f1.rivinumero),0), NULL, 'muuttuja vsuy, rivi 389' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f1 WHERE f1.lkm_id='vsuy' 	
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'suomi', 'A2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja vsun, rivi 390' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vsun' 		
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'ruotsi', 'A2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja vrun, rivi 391' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vrun' 		
UNION ALL SELECT tilv, tilv_date, 'lk1', 'ranska', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vra1, rivi 392' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vra1' 		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'ranska', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vra2, rivi 393' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vra2' 		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'ranska', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vra3, rivi 394' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vra3' 		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'ranska', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vra4, rivi 395' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vra4' 		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'ranska', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vra5, rivi 396' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vra5' 		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'ranska', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vra6, rivi 397' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vra6' 		
	UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'ranska', 'A2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f2 
 WHERE lkm_id='vran'AND f2.rivinumero=f1.rivinumero),0), NULL, 'muuttuja vray, rivi 398' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f1 WHERE f1.lkm_id='vray' 	
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'ranska', 'A2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja vran, rivi 399' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vran' 		
UNION ALL SELECT tilv, tilv_date, 'lk1', 'saksa', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vsa1, rivi 400' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vsa1' 		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'saksa', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vsa2, rivi 401' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vsa2' 		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'saksa', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vsa3, rivi 402' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vsa3' 		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'saksa', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vsa4, rivi 403' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vsa4' 		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'saksa', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vsa5, rivi 404' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vsa5' 		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'saksa', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vsa6, rivi 405' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vsa6' 		
	UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'saksa', 'A2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f2 
 WHERE lkm_id='vsan'AND f2.rivinumero=f1.rivinumero),0), NULL, 'muuttuja vsay, rivi 406' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f1 WHERE f1.lkm_id='vsay' 	
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'saksa', 'A2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja vsan, rivi 407' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vsan' 		
UNION ALL SELECT tilv, tilv_date, 'lk1', 'venaja', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vve1, rivi 408' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vve1' 		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'venaja', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vve2, rivi 409' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vve2' 		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'venaja', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vve3, rivi 410' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vve3' 		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'venaja', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vve4, rivi 411' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vve4' 		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'venaja', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vve5, rivi 412' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vve5' 		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'venaja', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vve6, rivi 413' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vve6' 		
	UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'venaja', 'A2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f2 
 WHERE lkm_id='vven'AND f2.rivinumero=f1.rivinumero),0), NULL, 'muuttuja vvey, rivi 414' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f1 WHERE f1.lkm_id='vvey' 	
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'venaja', 'A2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja vven, rivi 415' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vven' 		
UNION ALL SELECT tilv, tilv_date, 'lk1', 'saame', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vsaa1, rivi 416' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vsaa1' 		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'saame', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vsaa2, rivi 417' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vsaa2' 		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'saame', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vsaa3, rivi 418' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vsaa3' 		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'saame', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vsaa4, rivi 419' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vsaa4' 		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'saame', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vsaa5, rivi 420' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vsaa5' 		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'saame', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vsaa6, rivi 421' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vsaa6' 		
	UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'saame', 'A2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f2 
 WHERE lkm_id='vsaan'AND f2.rivinumero=f1.rivinumero),0), NULL, 'muuttuja vsaay, rivi 422' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f1 WHERE f1.lkm_id='vsaay' 	
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'saame', 'A2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja vsaan, rivi 423' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vsaan' 		
UNION ALL SELECT tilv, tilv_date, 'lk1', 'muu_kieli', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vmu1, rivi 424' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vmu1' 		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'muu_kieli', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vmu2, rivi 425' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vmu2' 		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'muu_kieli', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vmu3, rivi 426' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vmu3' 		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'muu_kieli', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vmu4, rivi 427' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vmu4' 		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'muu_kieli', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vmu5, rivi 428' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vmu5' 		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'muu_kieli', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vmu6, rivi 429' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vmu6' 		
	UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'muu_kieli', 'A2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f2 
 WHERE lkm_id='vmun'AND f2.rivinumero=f1.rivinumero),0), NULL, 'muuttuja vmuy, rivi 430' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f1 WHERE f1.lkm_id='vmuy' 	
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'muu_kieli', 'A2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja vmun, rivi 431' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='vmun' 		
		
		
		
		
		
		
		
		
		
		
		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'englanti', 'A1', '-1', tunn, lkm_arvo, lkm_arvo, NULL, 'muuttuja yaen1m, rivi 448' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yaen1m' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'englanti', 'B1', '-1', tunn, lkm_arvo, lkm_arvo, NULL, 'muuttuja yyenm, rivi 449' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yyenm' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'englanti', 'B2', '-1', tunn, lkm_arvo, lkm_arvo, NULL, 'muuttuja yenm, rivi 450' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yenm' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'englanti', 'A2', '-1', tunn, lkm_arvo, lkm_arvo, NULL, 'muuttuja yaen2m, rivi 451' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yaen2m' 		
		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'englanti', 'A1', '-1', tunn, lkm_arvo, NULL, lkm_arvo, 'muuttuja yaen1n, rivi 453' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yaen1n' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'englanti', 'B1', '-1', tunn, lkm_arvo, NULL, lkm_arvo, 'muuttuja yyenn, rivi 454' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yyenn' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'englanti', 'B2', '-1', tunn, lkm_arvo, NULL, lkm_arvo, 'muuttuja yenn, rivi 455' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yenn' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'englanti', 'A2', '-1', tunn, lkm_arvo, NULL, lkm_arvo, 'muuttuja yaen2n, rivi 456' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yaen2n' 		
		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ruotsi', 'A1', '-1', tunn, lkm_arvo, lkm_arvo, NULL, 'muuttuja yaru1m, rivi 458' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yaru1m' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ruotsi', 'B1', '-1', tunn, lkm_arvo, lkm_arvo, NULL, 'muuttuja yyrum, rivi 459' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yyrum' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ruotsi', 'B2', '-1', tunn, lkm_arvo, lkm_arvo, NULL, 'muuttuja yrum, rivi 460' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yrum' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ruotsi', 'A2', '-1', tunn, lkm_arvo, lkm_arvo, NULL, 'muuttuja yaru2m, rivi 461' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yaru2m' 		
		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ruotsi', 'A1', '-1', tunn, lkm_arvo, NULL, lkm_arvo, 'muuttuja yaru1n, rivi 463' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yaru1n' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ruotsi', 'B1', '-1', tunn, lkm_arvo, NULL, lkm_arvo, 'muuttuja yyrun, rivi 464' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yyrun' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ruotsi', 'B2', '-1', tunn, lkm_arvo, NULL, lkm_arvo, 'muuttuja yrun, rivi 465' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yrun' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ruotsi', 'A2', '-1', tunn, lkm_arvo, NULL, lkm_arvo, 'muuttuja yaru2n, rivi 466' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yaru2n' 		
		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'suomi', 'A1', '-1', tunn, lkm_arvo, lkm_arvo, NULL, 'muuttuja yasu1m, rivi 468' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yasu1m' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'suomi', 'B1', '-1', tunn, lkm_arvo, lkm_arvo, NULL, 'muuttuja yysum, rivi 469' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yysum' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'suomi', 'B2', '-1', tunn, lkm_arvo, lkm_arvo, NULL, 'muuttuja ysum, rivi 470' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ysum' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'suomi', 'A2', '-1', tunn, lkm_arvo, lkm_arvo, NULL, 'muuttuja yasu2m, rivi 471' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yasu2m' 		
		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'suomi', 'A1', '-1', tunn, lkm_arvo, NULL, lkm_arvo, 'muuttuja yasu1n, rivi 473' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yasu1n' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'suomi', 'B1', '-1', tunn, lkm_arvo, NULL, lkm_arvo, 'muuttuja yysun, rivi 474' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yysun' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'suomi', 'B2', '-1', tunn, lkm_arvo, NULL, lkm_arvo, 'muuttuja ysun, rivi 475' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ysun' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'suomi', 'A2', '-1', tunn, lkm_arvo, NULL, lkm_arvo, 'muuttuja yasu2n, rivi 476' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yasu2n' 		
		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ranska', 'A1', '-1', tunn, lkm_arvo, lkm_arvo, NULL, 'muuttuja yara1m, rivi 478' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yara1m' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ranska', 'B1', '-1', tunn, lkm_arvo, lkm_arvo, NULL, 'muuttuja yyram, rivi 479' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yyram' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ranska', 'B2', '-1', tunn, lkm_arvo, lkm_arvo, NULL, 'muuttuja yram, rivi 480' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yram' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ranska', 'A2', '-1', tunn, lkm_arvo, lkm_arvo, NULL, 'muuttuja yara2m, rivi 481' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yara2m' 		
		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ranska', 'A1', '-1', tunn, lkm_arvo, NULL, lkm_arvo, 'muuttuja yara1n, rivi 483' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yara1n' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ranska', 'B1', '-1', tunn, lkm_arvo, NULL, lkm_arvo, 'muuttuja yyran, rivi 484' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yyran' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ranska', 'B2', '-1', tunn, lkm_arvo, NULL, lkm_arvo, 'muuttuja yran, rivi 485' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yran' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ranska', 'A2', '-1', tunn, lkm_arvo, NULL, lkm_arvo, 'muuttuja yara2n, rivi 486' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yara2n' 		
		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'saksa', 'A1', '-1', tunn, lkm_arvo, lkm_arvo, NULL, 'muuttuja yasa1m, rivi 488' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yasa1m' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'saksa', 'B1', '-1', tunn, lkm_arvo, lkm_arvo, NULL, 'muuttuja yysam, rivi 489' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yysam' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'saksa', 'B2', '-1', tunn, lkm_arvo, lkm_arvo, NULL, 'muuttuja ysam, rivi 490' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ysam' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'saksa', 'A2', '-1', tunn, lkm_arvo, lkm_arvo, NULL, 'muuttuja yasa2m, rivi 491' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yasa2m' 		
		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'saksa', 'A1', '-1', tunn, lkm_arvo, NULL, lkm_arvo, 'muuttuja yasa1n, rivi 493' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yasa1n' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'saksa', 'B1', '-1', tunn, lkm_arvo, NULL, lkm_arvo, 'muuttuja yysan, rivi 494' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yysan' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'saksa', 'B2', '-1', tunn, lkm_arvo, NULL, lkm_arvo, 'muuttuja ysan, rivi 495' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ysan' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'saksa', 'A2', '-1', tunn, lkm_arvo, NULL, lkm_arvo, 'muuttuja yasa2n, rivi 496' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yasa2n' 		
		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'venaja', 'A1', '-1', tunn, lkm_arvo, lkm_arvo, NULL, 'muuttuja yave1m, rivi 498' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yave1m' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'venaja', 'B2', '-1', tunn, lkm_arvo, lkm_arvo, NULL, 'muuttuja yvem, rivi 499' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yvem' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'venaja', 'A2', '-1', tunn, lkm_arvo, lkm_arvo, NULL, 'muuttuja yave2m, rivi 500' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yave2m' 		
		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'venaja', 'A1', '-1', tunn, lkm_arvo, NULL, lkm_arvo, 'muuttuja yave1n, rivi 502' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yave1n' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'venaja', 'B2', '-1', tunn, lkm_arvo, NULL, lkm_arvo, 'muuttuja yven, rivi 503' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yven' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'venaja', 'A2', '-1', tunn, lkm_arvo, NULL, lkm_arvo, 'muuttuja yave2n, rivi 504' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yave2n' 		
		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'saame', 'A1', '-1', tunn, lkm_arvo, lkm_arvo, NULL, 'muuttuja yasaa1m, rivi 506' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yasaa1m' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'saame', 'B2', '-1', tunn, lkm_arvo, lkm_arvo, NULL, 'muuttuja ysaam, rivi 507' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ysaam' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'saame', 'A2', '-1', tunn, lkm_arvo, lkm_arvo, NULL, 'muuttuja yasaa2m, rivi 508' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yasaa2m' 		
		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'saame', 'A1', '-1', tunn, lkm_arvo, NULL, lkm_arvo, 'muuttuja yasaa1n, rivi 510' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yasaa1n' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'saame', 'B2', '-1', tunn, lkm_arvo, NULL, lkm_arvo, 'muuttuja ysaan, rivi 511' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ysaan' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'saame', 'A2', '-1', tunn, lkm_arvo, NULL, lkm_arvo, 'muuttuja yasaa2n, rivi 512' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yasaa2n' 		
		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'latina', 'A1', '-1', tunn, lkm_arvo, lkm_arvo, NULL, 'muuttuja yalat1m, rivi 514' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yalat1m' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'latina', 'B2', '-1', tunn, lkm_arvo, lkm_arvo, NULL, 'muuttuja ylatm, rivi 515' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ylatm' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'latina', 'A2', '-1', tunn, lkm_arvo, lkm_arvo, NULL, 'muuttuja yalat2m, rivi 516' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yalat2m' 		
		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'latina', 'A1', '-1', tunn, lkm_arvo, NULL, lkm_arvo, 'muuttuja yalat1n, rivi 518' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yalat1n' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'latina', 'B2', '-1', tunn, lkm_arvo, NULL, lkm_arvo, 'muuttuja ylatn, rivi 519' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ylatn' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'latina', 'A2', '-1', tunn, lkm_arvo, NULL, lkm_arvo, 'muuttuja yalat2n, rivi 520' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yalat2n' 		
		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'muu_kieli', 'A1', '-1', tunn, lkm_arvo, lkm_arvo, NULL, 'muuttuja yamuu1m, rivi 522' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yamuu1m' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'muu_kieli', 'B2', '-1', tunn, lkm_arvo, lkm_arvo, NULL, 'muuttuja ymuum, rivi 523' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ymuum' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'muu_kieli', 'A2', '-1', tunn, lkm_arvo, lkm_arvo, NULL, 'muuttuja yamuu2m, rivi 524' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yamuu2m' 		
		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'muu_kieli', 'A1', '-1', tunn, lkm_arvo, NULL, lkm_arvo, 'muuttuja yamuu1n, rivi 526' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yamuu1n' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'muu_kieli', 'B2', '-1', tunn, lkm_arvo, NULL, lkm_arvo, 'muuttuja ymuun, rivi 527' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ymuun' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'muu_kieli', 'A2', '-1', tunn, lkm_arvo, NULL, lkm_arvo, 'muuttuja yamuu2n, rivi 528' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yamuu2n' 		
		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ei_kielta', 'A1', '-1', tunn, lkm_arvo, lkm_arvo, NULL, 'muuttuja yaei1m, rivi 530' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yaei1m' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ei_kielta', 'B1', '-1', tunn, lkm_arvo, lkm_arvo, NULL, 'muuttuja yyeim, rivi 531' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yyeim' 		
		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ei_kielta', 'A1', '-1', tunn, lkm_arvo, NULL, lkm_arvo, 'muuttuja yaei1n, rivi 533' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yaei1n' 		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ei_kielta', 'B1', '-1', tunn, lkm_arvo, NULL, lkm_arvo, 'muuttuja yyein, rivi 534' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='yyein' 		

) olapdata

-- haetaan sijainnin kuntakoodi

left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot ol
 on ol.oppilaitoskoodi = olapdata.oppilaitos_koodi
 --and olapdata.tilv_date between ol.alkaa and ol.paattyy

) f 

  LEFT JOIN VipunenTK..d_perusopetuksen_vuosiluokat d1
	on d1.vuosiluokka_koodi=f.vuosiluokka_koodi
	and f.tilv_date between d1.alkaa and d1.paattyy
  LEFT JOIN VipunenTK..d_perusopetuksen_ainevalinnat d2
	on d2.aine_koodi=f.aine_koodi
	and d2.kielen_taso_koodi=f.kielentaso_koodi
	and f.tilv_date between d2.alkaa and d2.paattyy
  LEFT JOIN VipunenTK..d_perusopetuksen_kieltenmaara d3
	on d3.kieltenmäärä_koodi=f.kieltenmäärä_koodi
	and f.tilv_date between d3.alkaa and d3.paattyy

  LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia d4h
	on d4h.oppilaitos_avain=f.oppilaitos_koodi
	and f.tilv_date between d4h.alkaa and d4h.paattyy


  LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot d4
	on d4.oppilaitos_avain=f.oppilaitos_koodi
	--and f.tilv_date between d4.alkaa and d4.paattyy

  LEFT JOIN VipunenTK..d_alueluokitus_historia d5h
	on d5h.alueluokitus_avain=d4.sijaintikuntakoodi
	and f.tilv_date between d5h.alkaa and d5h.paattyy  

  LEFT JOIN VipunenTK..d_alueluokitus d5
	on d5.alueluokitus_avain=d4.sijaintikuntakoodi
	

-- Tyhjennetään ja täytetään VipunenTK.dbo.f_perusopetuksen_kieltenmaara
TRUNCATE TABLE VipunenTK.dbo.f_perusopetuksen_kieltenmaara
INSERT INTO VipunenTK.dbo.f_perusopetuksen_kieltenmaara
SELECT [tilv]
      --,[aine_koodi]=f.aine_koodi
      --,[kielentaso_koodi]=f.kielentaso_koodi
      ,[oppilaitos_koodi]
      ,[lkm_yht]
      ,[lkm_pojat]
      ,[lkm_tytot]
      ,[vuosiluokka_koodi]=f.vuosiluokka_koodi
      ,[kieltenmäärä_koodi]=f.kieltenmäärä_koodi
      ,lkm_kielivalinnat
      ,[oppilaitoksensijainti_historia_koodi]
      ,[vuosiluokka_id]=isnull(d1.id, -2)
      ,[tilv_date]
      ,[aineisto]
      ,[laatu_id]=0
      --,[ainevalinta_id]=d2.id
      ,[kieltenmaara_id]=isnull(d3.id,-2)
      ,[oppilaitos_historia_id]=isnull(d4h.id,-2)
      ,[oppilaitos_id]=isnull(d4.id,-2)
      ,[oppilaitoksensijainti_historia_id]=isnull(d5h.id,-2)
      ,[oppilaitoksensijainti_id]=isnull(d5.id,-2)



FROM

(

SELECT 
      [tilv]
      ,tilv_date
      --,[jarj]
      --,[tiedtype]
      --,[tunn]
      --,[edesi]
      --,[edala]
      --,[edyla]
      --,[edlisa]
      --,[edainep]
      --,[syesi]
      --,[syala]
      --,[syyla]
      --,[sylisa]
      --,[symamu]
      --,[sylukio]
      --,[syamm]
      --,[symuu]
      --,[aku]
      --,[kaytto]
      --,[tietolahde]
      --,[rivinumero]
      --,[lkm_arvo]
      --,[lkm_id]
      
      ,vuosiluokka_koodi = Cast(vuosiluokka_koodi as nvarchar(10))
      --,aine_koodi = Cast(aine_koodi as nvarchar(10))
      --,kielentaso_koodi = Cast(kielentaso_koodi as nvarchar(10))
      ,kieltenmäärä_koodi = Cast(kieltenmäärä_koodi as nvarchar(10))
      ,oppilaitos_koodi = CAST(oppilaitos_koodi as nvarchar(5))
      ,oppilaitoksensijainti_historia_koodi = CAST(ol.sijaintikuntakoodi as nvarchar(21)) --CAST('-1' as nvarchar(21))
      ,lkm_yht
      ,lkm_pojat
      ,lkm_tytot
      ,lkm_kielivalinnat
      ,aineisto = CAST('2.1' as nvarchar(8))
FROM (

SELECT 
      [tilv]
      ,tilv_date
      ,vuosiluokka_koodi = 'lk1'
      ,oppilaitos_koodi = tunn
      ,lkm_yht = lkm_arvo --vain yhdellä lkm-kentällä voi olla lkm_arvo, muilla pitää olla NULL
      ,lkm_pojat = lkm_arvo --vain yhdellä lkm-kentällä voi olla lkm_arvo, muilla pitää olla NULL
      ,lkm_tytot = lkm_arvo --vain yhdellä lkm-kentällä voi olla lkm_arvo, muilla pitää olla NULL
	  ,kieltenmäärä_koodi = '0'
      ,lkm_kielivalinnat = lkm_arvo --vain yhdellä lkm-kentällä voi olla lkm_arvo, muilla pitää olla NULL
      ,lähde='eng1'
FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto]
WHERE lkm_id='<kentännimi>'
--suoraan aineistosta saatavat

--kielivalintojen lukumäärät SQL7
UNION ALL SELECT tilv, tilv_date, 'lk7_9', tunn, NULL, NULL, NULL, '0', lkm_arvo, 'muuttuja kieli0' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='kieli0'
UNION ALL SELECT tilv, tilv_date, 'lk7_9', tunn, NULL, NULL, NULL, '1', lkm_arvo, 'muuttuja kieli1' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='kieli1'
UNION ALL SELECT tilv, tilv_date, 'lk7_9', tunn, NULL, NULL, NULL, '2', lkm_arvo, 'muuttuja kieli2' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='kieli2'
UNION ALL SELECT tilv, tilv_date, 'lk7_9', tunn, NULL, NULL, NULL, '3', lkm_arvo, 'muuttuja kieli3' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='kieli3'
UNION ALL SELECT tilv, tilv_date, 'lk7_9', tunn, NULL, NULL, NULL, '4', lkm_arvo, 'muuttuja kieli4' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='kieli4'

) olapdata

-- haetaan sijainnin kuntakoodi

left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot ol
 on ol.oppilaitoskoodi = olapdata.oppilaitos_koodi
-- and olapdata.tilv_date between ol.alkaa and ol.paattyy

) f

  JOIN VipunenTK..d_perusopetuksen_vuosiluokat d1
	on d1.vuosiluokka_koodi=f.vuosiluokka_koodi
	and f.tilv_date between d1.alkaa and d1.paattyy
  JOIN VipunenTK..d_perusopetuksen_kieltenmaara d3
	on d3.kieltenmäärä_koodi=f.kieltenmäärä_koodi
	and f.tilv_date between d3.alkaa and d3.paattyy

  JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia d4h
	on d4h.oppilaitos_avain=f.oppilaitos_koodi
	and f.tilv_date between d4h.alkaa and d4h.paattyy

  JOIN VipunenTK..d_oppilaitoksen_taustatiedot d4
	on d4.oppilaitos_avain=f.oppilaitos_koodi
	--and f.tilv_date between d4.alkaa and d4.paattyy
 
  
  JOIN VipunenTK..d_alueluokitus_historia d5h
	on d5h.alueluokitus_avain=d4.sijaintikuntakoodi
	and f.tilv_date between d5h.alkaa and d5h.paattyy  

  JOIN VipunenTK..d_alueluokitus d5
	on d5.alueluokitus_avain=d4.sijaintikuntakoodi





-- Tyhjennetään ja täytetään VipunenTK.dbo.f_perusopetuksen_oppilasmaarat
TRUNCATE TABLE VipunenTK.dbo.f_perusopetuksen_oppilasmaarat
INSERT INTO VipunenTK.dbo.f_perusopetuksen_oppilasmaarat
SELECT [tilv]
      --,[aine_koodi]=f.aine_koodi
      --,[kielentaso_koodi]=f.kielentaso_koodi
      ,[oppilaitos_koodi]
      ,[lkm_yht]
      ,[lkm_pojat]
      ,[lkm_tytot]
      ,[vuosiluokka_koodi]=f.vuosiluokka_koodi
      ,[kieltenmäärä_koodi]=f.kieltenmäärä_koodi
      ,lkm_kielivalinnat
      ,[oppilaitoksensijainti_historia_koodi]
      ,[vuosiluokka_id]=isnull(d1.id, -2)
      ,[tilv_date]
      ,[aineisto]
      ,[laatu_id]=0
      --,[ainevalinta_id]=d2.id
      ,[kieltenmaara_id]=isnull(d3.id, -2)
      ,[oppilaitos_historia_id]=isnull(d4h.id, -2)
      ,[oppilaitos_id]=isnull(d4.id, -2)
      ,[oppilaitoksensijainti_historia_id]=isnull(d5h.id, -2)
      ,[oppilaitoksensijainti_id]=isnull(d5.id, -2)


FROM 

(

SELECT 
      [tilv]
      ,tilv_date
      --,[jarj]
      --,[tiedtype]
      --,[tunn]
      --,[edesi]
      --,[edala]
      --,[edyla]
      --,[edlisa]
      --,[edainep]
      --,[syesi]
      --,[syala]
      --,[syyla]
      --,[sylisa]
      --,[symamu]
      --,[sylukio]
      --,[syamm]
      --,[symuu]
      --,[aku]
      --,[kaytto]
      --,[tietolahde]
      --,[rivinumero]
      --,[lkm_arvo]
      --,[lkm_id]
      
      ,vuosiluokka_koodi = Cast(vuosiluokka_koodi as nvarchar(10))
      --,aine_koodi = Cast(aine_koodi as nvarchar(10))
      --,kielentaso_koodi = Cast(kielentaso_koodi as nvarchar(10))
      ,kieltenmäärä_koodi = Cast(kieltenmäärä_koodi as nvarchar(10))
      ,oppilaitos_koodi = CAST(oppilaitos_koodi as nvarchar(5))
      ,oppilaitoksensijainti_historia_koodi = CAST(ol.sijaintikuntakoodi as nvarchar(21)) --CAST('-1' as nvarchar(21))
      ,lkm_yht
      ,lkm_pojat
      ,lkm_tytot
      ,lkm_kielivalinnat
      ,aineisto = CAST('2.1' as nvarchar(8))
FROM (

SELECT 
      [tilv]
      ,tilv_date
      ,vuosiluokka_koodi = 'lk1'
      ,oppilaitos_koodi = tunn
      ,lkm_yht = lkm_arvo --vain yhdellä lkm-kentällä voi olla lkm_arvo, muilla pitää olla NULL
      ,lkm_pojat = lkm_arvo --vain yhdellä lkm-kentällä voi olla lkm_arvo, muilla pitää olla NULL
      ,lkm_tytot = lkm_arvo --vain yhdellä lkm-kentällä voi olla lkm_arvo, muilla pitää olla NULL
	  ,kieltenmäärä_koodi = '0'
      ,lkm_kielivalinnat = lkm_arvo --vain yhdellä lkm-kentällä voi olla lkm_arvo, muilla pitää olla NULL
      ,lähde='eng1'
FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto]
WHERE lkm_id='<kentännimi>'
--suoraan aineistosta saatavat
--tyttöjen lukumäärät
--SQL5
UNION ALL SELECT tilv, tilv_date, 'lk1', tunn, NULL, NULL, lkm_arvo, '-1', NULL, 'muuttuja ov1n' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ov1n'

UNION ALL SELECT tilv, tilv_date, 'lk2', tunn, NULL, NULL, lkm_arvo, '-1', NULL, 'muuttuja ov2n' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ov2n'

UNION ALL SELECT tilv, tilv_date, 'lk3', tunn, NULL, NULL, lkm_arvo, '-1', NULL, 'muuttuja ov3n' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ov3n'

UNION ALL SELECT tilv, tilv_date, 'lk4', tunn, NULL, NULL, lkm_arvo, '-1', NULL, 'muuttuja ov4n' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ov4n'

UNION ALL SELECT tilv, tilv_date, 'lk5', tunn, NULL, NULL, lkm_arvo, '-1', NULL, 'muuttuja ov5n' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ov5n'

UNION ALL SELECT tilv, tilv_date, 'lk6', tunn, NULL, NULL, lkm_arvo, '-1', NULL, 'muuttuja ov6n' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ov6n'

UNION ALL SELECT tilv, tilv_date, 'lk7', tunn, NULL, NULL, lkm_arvo, '-1', NULL, 'muuttuja ov7n' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ov7n'

UNION ALL SELECT tilv, tilv_date, 'lk8', tunn, NULL, NULL, lkm_arvo, '-1', NULL, 'muuttuja ov8n' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ov8n'

UNION ALL SELECT tilv, tilv_date, 'lk9', tunn, NULL, NULL, lkm_arvo, '-1', NULL, 'muuttuja ov9n' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ov9n'

UNION ALL SELECT tilv, tilv_date, 'lk10', tunn, NULL, NULL, lkm_arvo, '-1', NULL, 'muuttuja ov10n' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] WHERE lkm_id='ov10n'

--Lasketut
--Poikien lukumäärät
--SQL6
UNION ALL SELECT tilv, tilv_date, 'lk1', tunn, NULL, f1.lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f2 
 WHERE lkm_id='ov1n' AND f2.rivinumero=f1.rivinumero),0), NULL, '-1', NULL, 'muuttuja ov1, rivi 75' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f1 WHERE f1.lkm_id='ov1' 

UNION ALL SELECT tilv, tilv_date, 'lk2', tunn, NULL, f1.lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f2 
 WHERE lkm_id='ov2n' AND f2.rivinumero=f1.rivinumero),0), NULL, '-1', NULL, 'muuttuja ov2, rivi 77' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f1 WHERE f1.lkm_id='ov2' 

UNION ALL SELECT tilv, tilv_date, 'lk3', tunn, NULL, f1.lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f2 
 WHERE lkm_id='ov3n' AND f2.rivinumero=f1.rivinumero),0), NULL, '-1', NULL, 'muuttuja ov3, rivi 79' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f1 WHERE f1.lkm_id='ov3' 

UNION ALL SELECT tilv, tilv_date, 'lk4', tunn, NULL, f1.lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f2 
 WHERE lkm_id='ov4n' AND f2.rivinumero=f1.rivinumero),0), NULL, '-1', NULL, 'muuttuja ov4, rivi 81' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f1 WHERE f1.lkm_id='ov4' 

UNION ALL SELECT tilv, tilv_date, 'lk5', tunn, NULL, f1.lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f2 
 WHERE lkm_id='ov5n' AND f2.rivinumero=f1.rivinumero),0), NULL, '-1', NULL, 'muuttuja ov5, rivi 83' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f1 WHERE f1.lkm_id='ov5' 

UNION ALL SELECT tilv, tilv_date, 'lk6', tunn, NULL, f1.lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f2 
 WHERE lkm_id='ov6n' AND f2.rivinumero=f1.rivinumero),0), NULL, '-1', NULL, 'muuttuja ov6, rivi 85' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f1 WHERE f1.lkm_id='ov6' 

UNION ALL SELECT tilv, tilv_date, 'lk7', tunn, NULL, f1.lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f2 
 WHERE lkm_id='ov7n' AND f2.rivinumero=f1.rivinumero),0), NULL, '-1', NULL, 'muuttuja ov7, rivi 87' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f1 WHERE f1.lkm_id='ov7' 

UNION ALL SELECT tilv, tilv_date, 'lk8', tunn, NULL, f1.lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f2 
 WHERE lkm_id='ov8n' AND f2.rivinumero=f1.rivinumero),0), NULL, '-1', NULL, 'muuttuja ov8, rivi 89' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f1 WHERE f1.lkm_id='ov8' 

UNION ALL SELECT tilv, tilv_date, 'lk9', tunn, NULL, f1.lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f2 
 WHERE lkm_id='ov9n' AND f2.rivinumero=f1.rivinumero),0), NULL, '-1', NULL, 'muuttuja ov9, rivi 91' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f1 WHERE f1.lkm_id='ov9' 

UNION ALL SELECT tilv, tilv_date, 'lk10', tunn, NULL, f1.lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f2 
 WHERE lkm_id='ov10n' AND f2.rivinumero=f1.rivinumero),0), NULL, '-1', NULL, 'muuttuja ov10, rivi 93' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto] f1 WHERE f1.lkm_id='ov10' 


) olapdata

-- haetaan sijainnin kuntakoodi

left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot ol
 on ol.oppilaitoskoodi = olapdata.oppilaitos_koodi
 --and olapdata.tilv_date between ol.alkaa and ol.paattyy

) f

  JOIN VipunenTK..d_perusopetuksen_vuosiluokat d1
	on d1.vuosiluokka_koodi=f.vuosiluokka_koodi
	and f.tilv_date between d1.alkaa and d1.paattyy
  JOIN VipunenTK..d_perusopetuksen_kieltenmaara d3
	on d3.kieltenmäärä_koodi=f.kieltenmäärä_koodi
	and f.tilv_date between d3.alkaa and d3.paattyy

  JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia d4h
	on d4h.oppilaitos_avain=f.oppilaitos_koodi
	and f.tilv_date between d4h.alkaa and d4h.paattyy

  JOIN VipunenTK..d_oppilaitoksen_taustatiedot d4
	on d4.oppilaitos_avain=f.oppilaitos_koodi
	--and f.tilv_date between d4.alkaa and d4.paattyy
  JOIN VipunenTK..d_alueluokitus_historia d5h
	on d5h.alueluokitus_avain=d4.sijaintikuntakoodi
	and f.tilv_date between d5h.alkaa and d5h.paattyy  

  JOIN VipunenTK..d_alueluokitus d5
	on d5.alueluokitus_avain=d4.sijaintikuntakoodi




INSERT INTO VipunenTK.dbo.f_ainevalinnat_perusopetuksessa
SELECT [tilv]
      ,[aine_koodi]=f.aine_koodi
      ,[kielentaso_koodi]=f.kielentaso_koodi
      ,[oppilaitos_koodi]
      ,[lkm_yht]
      ,[lkm_pojat]
      ,[lkm_tytot]
      ,[vuosiluokka_koodi]=f.vuosiluokka_koodi
      ,[kieltenmäärä_koodi]=f.kieltenmäärä_koodi
      ,[oppilaitoksensijainti_historia_koodi] 
      ,[vuosiluokka_id]=ISNULL(d1.id,-2)
      ,[tilv_date]
      ,[aineisto]
      ,[laatu_id]=0
      ,[ainevalinta_id]=ISNULL(d2.id,-2)
      ,[kieltenmaara_id]=ISNULL(d3.id,-2)
      ,[oppilaitos_historia_id]=ISNULL(d4h.id,-2)
      ,[oppilaitos_id]=ISNULL(d4.id,-2)
      ,[oppilaitoksensijainti_historia_id]=ISNULL(d5h.id,-2)
      ,[oppilaitoksensijainti_id]=ISNULL(d5.id,-2)



FROM

(

SELECT 
      [tilv]
      ,tilv_date
      --,[jarj]
      --,[tiedtype]
      --,[tunn]
      --,[edesi]
      --,[edala]
      --,[edyla]
      --,[edlisa]
      --,[edainep]
      --,[syesi]
      --,[syala]
      --,[syyla]
      --,[sylisa]
      --,[symamu]
      --,[sylukio]
      --,[syamm]
      --,[symuu]
      --,[aku]
      --,[kaytto]
      --,[tietolahde]
      --,[rivinumero]
      --,[lkm_arvo]
      --,[lkm_id]
      
      ,vuosiluokka_koodi = Cast(vuosiluokka_koodi as nvarchar(10))
      ,aine_koodi = Cast(aine_koodi as nvarchar(10))
      ,kielentaso_koodi = Cast(kielentaso_koodi as nvarchar(10))
      ,kieltenmäärä_koodi = Cast(kieltenmäärä_koodi as nvarchar(10))
      ,oppilaitos_koodi
      ,oppilaitoksensijainti_historia_koodi = CAST(ol.sijaintikuntakoodi as nvarchar(21)) --CAST('-1' as nvarchar(21))
      ,lkm_yht
      ,lkm_pojat
      ,lkm_tytot
      ,aineisto = CAST('R2.22' as nvarchar(8))
FROM (

SELECT 
      [tilv]
      ,tilv_date
      ,vuosiluokka_koodi = 'lk1'
      ,aine_koodi = 'englanti'
      ,kielentaso_koodi = 'A1'
      ,kieltenmäärä_koodi = '-1'
      ,oppilaitos_koodi = tunn
      ,lkm_yht = lkm_arvo --vain yhdellä lkm-kentällä voi olla lkm_arvo, muilla pitää olla NULL
      ,lkm_pojat = lkm_arvo --vain yhdellä lkm-kentällä voi olla lkm_arvo, muilla pitää olla NULL
      ,lkm_tytot = lkm_arvo --vain yhdellä lkm-kentällä voi olla lkm_arvo, muilla pitää olla NULL
      ,lähde='eng1'
FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] 
WHERE lkm_id='<kentännimi>'

		
--Kielivalinnat 1-6
		
UNION ALL SELECT tilv, tilv_date, 'lk1', 'englanti', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja eng1, rivi 1001' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='eng1' --1001		
UNION ALL SELECT tilv, tilv_date, 'lk1', 'ruotsi', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ru1, rivi 1002' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ru1' --1002		
UNION ALL SELECT tilv, tilv_date, 'lk1', 'suomi', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja su1, rivi 1003' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='su1' --1003		
UNION ALL SELECT tilv, tilv_date, 'lk1', 'ranska', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ra1, rivi 1004' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ra1' --1004		
UNION ALL SELECT tilv, tilv_date, 'lk1', 'saksa', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja sa1, rivi 1005' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='sa1' --1005		
UNION ALL SELECT tilv, tilv_date, 'lk1', 'venaja', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ve1, rivi 1006' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ve1' --1006		
UNION ALL SELECT tilv, tilv_date, 'lk1', 'espanja', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja es1, rivi 1007' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='es1' --1007		
UNION ALL SELECT tilv, tilv_date, 'lk1', 'italia', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja it1, rivi 1008' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='it1' --1008		
UNION ALL SELECT tilv, tilv_date, 'lk1', 'saame', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja saa1, rivi 1009' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='saa1' --1009		
UNION ALL SELECT tilv, tilv_date, 'lk1', 'muu_kieli', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja mu1, rivi 1010' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='mu1' --1010		
UNION ALL SELECT tilv, tilv_date, 'lk1', 'ei_kielta', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja eopis1, rivi 1011' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='eopis1' --1011		
		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'englanti', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja eng2, rivi 1013' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='eng2' --1013		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'ruotsi', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ru2, rivi 1014' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ru2' --1014		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'suomi', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja su2, rivi 1015' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='su2' --1015		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'ranska', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ra2, rivi 1016' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ra2' --1016		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'saksa', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja sa2, rivi 1017' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='sa2' --1017		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'venaja', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ve2, rivi 1018' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ve2' --1018		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'espanja', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja es2, rivi 1019' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='es2' --1019		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'italia', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja it2, rivi 1020' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='it2' --1020		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'saame', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja saa2, rivi 1021' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='saa2' --1021		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'muu_kieli', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja mu2, rivi 1022' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='mu2' --1022		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'ei_kielta', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja eopis2, rivi 1023' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='eopis2' --1023		
		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'englanti', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja eng3, rivi 1025' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='eng3' --1025		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'ruotsi', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ru3, rivi 1026' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ru3' --1026		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'suomi', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja su3, rivi 1027' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='su3' --1027		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'ranska', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ra3, rivi 1028' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ra3' --1028		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'saksa', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja sa3, rivi 1029' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='sa3' --1029		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'venaja', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ve3, rivi 1030' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ve3' --1030		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'espanja', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja es3, rivi 1031' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='es3' --1031		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'italia', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja it3, rivi 1032' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='it3' --1032		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'saame', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja saa3, rivi 1033' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='saa3' --1033		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'muu_kieli', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja mu3, rivi 1034' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='mu3' --1034		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'ei_kielta', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja eopis3, rivi 1035' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='eopis3' --1035		
		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'englanti', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja eng4, rivi 1037' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='eng4' --1037		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'ruotsi', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ru4, rivi 1038' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ru4' --1038		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'suomi', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja su4, rivi 1039' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='su4' --1039		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'ranska', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ra4, rivi 1040' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ra4' --1040		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'saksa', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja sa4, rivi 1041' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='sa4' --1041		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'venaja', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ve4, rivi 1042' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ve4' --1042		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'espanja', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja es4, rivi 1043' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='es4' --1043		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'italia', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja it4, rivi 1044' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='it4' --1044		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'saame', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja saa4, rivi 1045' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='saa4' --1045		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'muu_kieli', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja mu4, rivi 1046' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='mu4' --1046		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'ei_kielta', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja eopis4, rivi 1047' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='eopis4' --1047		
		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'englanti', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja eng5, rivi 1049' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='eng5' --1049		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'ruotsi', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ru5, rivi 1050' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ru5' --1050		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'suomi', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja su5, rivi 1051' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='su5' --1051		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'ranska', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ra5, rivi 1052' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ra5' --1052		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'saksa', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja sa5, rivi 1053' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='sa5' --1053		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'venaja', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ve5, rivi 1054' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ve5' --1054		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'espanja', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja es5, rivi 1055' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='es5' --1055		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'italia', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja it5, rivi 1056' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='it5' --1056		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'saame', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja saa5, rivi 1057' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='saa5' --1057		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'muu_kieli', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja mu5, rivi 1058' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='mu5' --1058		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'ei_kielta', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja eopis5, rivi 1059' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='eopis5' --1059		
		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'englanti', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja eng6, rivi 1061' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='eng6' --1061		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'ruotsi', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ru6, rivi 1062' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ru6' --1062		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'suomi', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja su6, rivi 1063' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='su6' --1063		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'ranska', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ra6, rivi 1064' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ra6' --1064		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'saksa', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja sa6, rivi 1065' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='sa6' --1065		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'venaja', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ve6, rivi 1066' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ve6' --1066		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'espanja', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja es6, rivi 1067' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='es6' --1067		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'italia', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja it6, rivi 1068' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='it6' --1068		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'saame', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja saa6, rivi 1069' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='saa6' --1069		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'muu_kieli', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja mu6, rivi 1070' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='mu6' --1070		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'ei_kielta', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja eopis6, rivi 1071' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='eopis6' --1071		
		
	UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'englanti', 'A1', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='enn'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja eny, rivi 1073' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='eny' 	
		
	UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'ruotsi', 'A1', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='run'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja ruy, rivi 1075' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='ruy' 	
		
	UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'suomi', 'A1', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='sun'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja suy, rivi 1077' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='suy' 	
		
	UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'ranska', 'A1', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='ran'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja ray, rivi 1079' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='ray' 	
		
	UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'saksa', 'A1', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='san'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja say, rivi 1081' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='say' 	
		
	UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'venaja', 'A1', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='ven'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja vey, rivi 1083' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='vey' 	
		
	UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'espanja', 'A1', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='esn'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja esy, rivi 1085' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='esy' 	
		
	UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'italia', 'A1', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='itn'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja ity, rivi 1087' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='ity' 	
		
	UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'saame', 'A1', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='saan'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja saay, rivi 1089' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='saay' 	
		
	UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'muu_kieli', 'A1', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='mun'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja muy, rivi 1091' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='muy' 	
		
		
		
		
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'englanti', 'A1', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja enn, rivi 1096' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='enn' --1096		
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'ruotsi', 'A1', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja run, rivi 1097' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='run' --1097		
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'suomi', 'A1', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja sun, rivi 1098' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='sun' --1098		
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'ranska', 'A1', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja ran, rivi 1099' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ran' --1099		
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'saksa', 'A1', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja san, rivi 1100' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='san' --1100		
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'venaja', 'A1', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja ven, rivi 1101' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ven' --1101		
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'espanja', 'A1', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja esn, rivi 1102' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='esn' --1102		
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'italia', 'A1', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja itn, rivi 1103' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='itn' --1103		
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'saame', 'A1', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja saan, rivi 1104' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='saan' --1104		
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'muu_kieli', 'A1', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja mun, rivi 1105' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='mun' --1105		
		
		
UNION ALL SELECT tilv, tilv_date, 'lk1', 'englanti', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ven1, rivi 1108' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ven1' --1108		
UNION ALL SELECT tilv, tilv_date, 'lk1', 'ruotsi', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vru1, rivi 1109' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vru1' --1109		
UNION ALL SELECT tilv, tilv_date, 'lk1', 'suomi', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vsu1, rivi 1110' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vsu1' --1110		
UNION ALL SELECT tilv, tilv_date, 'lk1', 'ranska', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vra1, rivi 1111' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vra1' --1111		
UNION ALL SELECT tilv, tilv_date, 'lk1', 'saksa', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vsa1, rivi 1112' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vsa1' --1112		
UNION ALL SELECT tilv, tilv_date, 'lk1', 'venaja', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vve1, rivi 1113' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vve1' --1113		
UNION ALL SELECT tilv, tilv_date, 'lk1', 'espanja', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ves1, rivi 1114' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ves1' --1114		
UNION ALL SELECT tilv, tilv_date, 'lk1', 'italia', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vit1, rivi 1115' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vit1' --1115		
UNION ALL SELECT tilv, tilv_date, 'lk1', 'saame', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vsaa1, rivi 1116' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vsaa1' --1116		
UNION ALL SELECT tilv, tilv_date, 'lk1', 'muu_kieli', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vmu1, rivi 1117' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vmu1' --1117		
		
		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'englanti', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ven2, rivi 1120' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ven2' --1120		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'ruotsi', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vru2, rivi 1121' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vru2' --1121		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'suomi', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vsu2, rivi 1122' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vsu2' --1122		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'ranska', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vra2, rivi 1123' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vra2' --1123		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'saksa', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vsa2, rivi 1124' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vsa2' --1124		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'venaja', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vve2, rivi 1125' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vve2' --1125		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'espanja', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ves2, rivi 1126' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ves2' --1126		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'italia', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vit2, rivi 1127' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vit2' --1127		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'saame', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vsaa2, rivi 1128' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vsaa2' --1128		
UNION ALL SELECT tilv, tilv_date, 'lk2', 'muu_kieli', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vmu2, rivi 1129' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vmu2' --1129		
		
		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'englanti', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ven3, rivi 1132' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ven3' --1132		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'ruotsi', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vru3, rivi 1133' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vru3' --1133		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'suomi', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vsu3, rivi 1134' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vsu3' --1134		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'ranska', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vra3, rivi 1135' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vra3' --1135		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'saksa', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vsa3, rivi 1136' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vsa3' --1136		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'venaja', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vve3, rivi 1137' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vve3' --1137		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'espanja', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ves3, rivi 1138' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ves3' --1138		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'italia', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vit3, rivi 1139' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vit3' --1139		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'saame', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vsaa3, rivi 1140' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vsaa3' --1140		
UNION ALL SELECT tilv, tilv_date, 'lk3', 'muu_kieli', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vmu3, rivi 1141' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vmu3' --1141		
		
		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'englanti', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ven4, rivi 1144' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ven4' --1144		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'ruotsi', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vru4, rivi 1145' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vru4' --1145		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'suomi', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vsu4, rivi 1146' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vsu4' --1146		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'ranska', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vra4, rivi 1147' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vra4' --1147		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'saksa', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vsa4, rivi 1148' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vsa4' --1148		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'venaja', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vve4, rivi 1149' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vve4' --1149		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'espanja', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ves4, rivi 1150' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ves4' --1150		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'italia', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vit4, rivi 1151' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vit4' --1151		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'saame', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vsaa4, rivi 1152' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vsaa4' --1152		
UNION ALL SELECT tilv, tilv_date, 'lk4', 'muu_kieli', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vmu4, rivi 1153' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vmu4' --1153		
		
		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'englanti', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ven5, rivi 1156' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ven5' --1156		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'ruotsi', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vru5, rivi 1157' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vru5' --1157		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'suomi', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vsu5, rivi 1158' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vsu5' --1158		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'ranska', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vra5, rivi 1159' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vra5' --1159		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'saksa', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vsa5, rivi 1160' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vsa5' --1160		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'venaja', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vve5, rivi 1161' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vve5' --1161		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'espanja', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ves5, rivi 1162' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ves5' --1162		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'italia', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vit5, rivi 1163' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vit5' --1163		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'saame', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vsaa5, rivi 1164' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vsaa5' --1164		
UNION ALL SELECT tilv, tilv_date, 'lk5', 'muu_kieli', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vmu5, rivi 1165' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vmu5' --1165		
		
		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'englanti', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ven6, rivi 1168' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ven6' --1168		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'ruotsi', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vru6, rivi 1169' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vru6' --1169		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'suomi', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vsu6, rivi 1170' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vsu6' --1170		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'ranska', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vra6, rivi 1171' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vra6' --1171		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'saksa', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vsa6, rivi 1172' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vsa6' --1172		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'venaja', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vve6, rivi 1173' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vve6' --1173		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'espanja', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ves6, rivi 1174' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ves6' --1174		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'italia', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vit6, rivi 1175' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vit6' --1175		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'saame', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vsaa6, rivi 1176' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vsaa6' --1176		
UNION ALL SELECT tilv, tilv_date, 'lk6', 'muu_kieli', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja vmu6, rivi 1177' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vmu6' --1177		
		
		
	UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'englanti', 'A2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='venn'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja veny, rivi 1180' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='veny' 	
		
	UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'ruotsi', 'A2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='vrun'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja vruy, rivi 1182' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='vruy' 	
		
	UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'suomi', 'A2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='vsun'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja vsuy, rivi 1184' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='vsuy' 	
		
	UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'ranska', 'A2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='vran'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja vray, rivi 1186' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='vray' 	
		
	UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'saksa', 'A2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='vsan'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja vsay, rivi 1188' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='vsay' 	
		
	UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'venaja', 'A2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='vven'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja vvey, rivi 1190' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='vvey' 	
		
	UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'espanja', 'A2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='vesn'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja vesy, rivi 1192' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='vesy' 	
		
	UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'italia', 'A2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='vitn'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja vity, rivi 1194' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='vity' 	
		
	UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'saame', 'A2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='vsaan'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja vsaay, rivi 1196' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='vsaay' 	
		
	UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'muu_kieli', 'A2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='vmun'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja vmuy, rivi 1198' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='vmuy' 	
		
		
			
		
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'englanti', 'A2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja venn, rivi 1204' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='venn' --1204		
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'ruotsi', 'A2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja vrun, rivi 1205' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vrun' --1205		
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'suomi', 'A2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja vsun, rivi 1206' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vsun' --1206		
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'ranska', 'A2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja vran, rivi 1207' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vran' --1207		
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'saksa', 'A2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja vsan, rivi 1208' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vsan' --1208		
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'venaja', 'A2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja vven, rivi 1209' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vven' --1209		
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'espanja', 'A2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja vesn, rivi 1210' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vesn' --1210		
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'italia', 'A2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja vitn, rivi 1211' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vitn' --1211		
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'saame', 'A2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja vsaan, rivi 1212' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vsaan' --1212		
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'muu_kieli', 'A2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja vmun, rivi 1213' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='vmun' --1213		
		
		
		
		
		
		
		
--Kielivalinnat 7-9		
		
		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'englanti', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yaen1, rivi 1224' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yaen1' --1224		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ruotsi', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yaru1, rivi 1225' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yaru1' --1225		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'suomi', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yasu1, rivi 1226' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yasu1' --1226		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ranska', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yara1, rivi 1227' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yara1' --1227		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'saksa', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yasa1, rivi 1228' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yasa1' --1228		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'venaja', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yave1, rivi 1229' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yave1' --1229		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'espanja', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yaes1, rivi 1230' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yaes1' --1230		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'italia', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yait1, rivi 1231' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yait1' --1231		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'saame', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yasaa1, rivi 1232' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yasaa1' --1232		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'latina', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yalat1, rivi 1233' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yalat1' --1233		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'muu_kieli', 'A1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yamuu1, rivi 1234' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yamuu1' --1234		
		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'englanti', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yaen2, rivi 1236' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yaen2' --1236		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ruotsi', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yaru2, rivi 1237' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yaru2' --1237		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'suomi', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yasu2, rivi 1238' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yasu2' --1238		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ranska', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yara2, rivi 1239' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yara2' --1239		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'saksa', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yasa2, rivi 1240' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yasa2' --1240		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'venaja', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yave2, rivi 1241' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yave2' --1241		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'espanja', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yaes2, rivi 1242' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yaes2' --1242		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'italia', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yait2, rivi 1243' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yait2' --1243		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'saame', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yasaa2, rivi 1244' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yasaa2' --1244		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'latina', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yalat2, rivi 1245' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yalat2' --1245		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'muu_kieli', 'A2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yamuu2, rivi 1246' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yamuu2' --1246		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'englanti', 'B1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yyen, rivi 1247' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yyen' --1247		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ruotsi', 'B1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yyru, rivi 1248' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yyru' --1248		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'suomi', 'B1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yysu, rivi 1249' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yysu' --1249		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ranska', 'B1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yyra, rivi 1250' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yyra' --1250		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'saksa', 'B1', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yysa, rivi 1251' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yysa' --1251		
		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'englanti', 'B2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yen, rivi 1253' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yen' --1253		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ruotsi', 'B2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yru, rivi 1254' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yru' --1254		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'suomi', 'B2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ysu, rivi 1255' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ysu' --1255		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ranska', 'B2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yra, rivi 1256' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yra' --1256		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'saksa', 'B2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ysa, rivi 1257' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ysa' --1257		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'venaja', 'B2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yve, rivi 1258' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yve' --1258		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'espanja', 'B2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yes, rivi 1259' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yes' --1259		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'italia', 'B2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yit, rivi 1260' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yit' --1260		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'saame', 'B2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ysaa, rivi 1261' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ysaa' --1261		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'latina', 'B2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ylat, rivi 1262' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ylat' --1262		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'muu_kieli', 'B2', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ymuu, rivi 1263' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ymuu' --1263		
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'englanti', 'A1', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='yaen1n'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja yaen1, rivi 1264' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='yaen1' 	
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ruotsi', 'A1', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='yaru1n'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja yaru1, rivi 1265' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='yaru1' 	
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'suomi', 'A1', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='yasu1n'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja yasu1, rivi 1266' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='yasu1' 	
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ranska', 'A1', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='yara1n'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja yara1, rivi 1267' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='yara1' 	
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'saksa', 'A1', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='yasa1n'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja yasa1, rivi 1268' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='yasa1' 	
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'venaja', 'A1', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='yave1n'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja yave1, rivi 1269' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='yave1' 	
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'espanja', 'A1', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='yaes1n'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja yaes1, rivi 1270' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='yaes1' 	
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'italia', 'A1', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='yait1n'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja yait1, rivi 1271' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='yait1' 	
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'saame', 'A1', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='yasaa1n'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja yasaa1, rivi 1272' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='yasaa1' 	
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'latina', 'A1', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='yalat1n'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja yalat1, rivi 1273' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='yalat1' 	
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'muu_kieli', 'A1', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='yamuu1n'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja yamuu1, rivi 1274' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='yamuu1' 	
		
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'englanti', 'A2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='yaen2n'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja yaen2, rivi 1276' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='yaen2' 	
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ruotsi', 'A2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='yaru2n'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja yaru2, rivi 1277' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='yaru2' 	
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'suomi', 'A2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='yasu2n'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja yasu2, rivi 1278' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='yasu2' 	
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ranska', 'A2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='yara2n'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja yara2, rivi 1279' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='yara2' 	
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'saksa', 'A2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='yasa2n'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja yasa2, rivi 1280' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='yasa2' 	
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'venaja', 'A2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='yave2n'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja yave2, rivi 1281' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='yave2' 	
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'espanja', 'A2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='yaes2n'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja yaes2, rivi 1282' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='yaes2' 	
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'italia', 'A2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='yait2n'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja yait2, rivi 1283' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='yait2' 	
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'saame', 'A2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='yasaa2n'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja yasaa2, rivi 1284' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='yasaa2' 	
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'latina', 'A2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='yalat2n'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja yalat2, rivi 1285' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='yalat2' 	
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'muu_kieli', 'A2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='yamuu2n'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja yamuu2, rivi 1286' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='yamuu2' 	
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'englanti', 'B1', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='yyenn'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja yyen, rivi 1287' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='yyen' 	
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ruotsi', 'B1', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='yyrun'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja yyru, rivi 1288' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='yyru' 	
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'suomi', 'B1', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='yysun'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja yysu, rivi 1289' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='yysu' 	
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ranska', 'B1', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='yyran'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja yyra, rivi 1290' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='yyra' 	
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'saksa', 'B1', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='yysan'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja yysa, rivi 1291' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='yysa' 	
		
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'englanti', 'B2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='yenn'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja yen, rivi 1293' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='yen' 	
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ruotsi', 'B2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='yrun'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja yru, rivi 1294' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='yru' 	
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'suomi', 'B2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='ysun'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja ysu, rivi 1295' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='ysu' 	
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ranska', 'B2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='yran'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja yra, rivi 1296' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='yra' 	
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'saksa', 'B2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='ysan'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja ysa, rivi 1297' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='ysa' 	
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'venaja', 'B2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='yven'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja yve, rivi 1298' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='yve' 	
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'espanja', 'B2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='yesn'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja yes, rivi 1299' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='yes' 	
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'italia', 'B2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='yitn'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja yit, rivi 1300' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='yit' 	
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'saame', 'B2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='ysaan'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja ysaa, rivi 1301' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='ysaa' 	
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'latina', 'B2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='ylatn'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja ylat, rivi 1302' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='ylat' 	
	UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'muu_kieli', 'B2', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='ymuun'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja ymuu, rivi 1303' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='ymuu' 	
		
		
		

		
		
		
		
		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'englanti', 'A1', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja yaen1n, rivi 1328' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yaen1n' --1328		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ruotsi', 'A1', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja yaru1n, rivi 1329' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yaru1n' --1329		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'suomi', 'A1', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja yasu1n, rivi 1330' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yasu1n' --1330		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ranska', 'A1', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja yara1n, rivi 1331' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yara1n' --1331		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'saksa', 'A1', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja yasa1n, rivi 1332' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yasa1n' --1332		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'venaja', 'A1', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja yave1n, rivi 1333' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yave1n' --1333		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'espanja', 'A1', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja yaes1n, rivi 1334' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yaes1n' --1334		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'italia', 'A1', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja yait1n, rivi 1335' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yait1n' --1335		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'saame', 'A1', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja yasaa1n, rivi 1336' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yasaa1n' --1336		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'latina', 'A1', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja yalat1n, rivi 1337' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yalat1n' --1337		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'muu_kieli', 'A1', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja yamuu1n, rivi 1338' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yamuu1n' --1338		
		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'englanti', 'A2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja yaen2n, rivi 1340' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yaen2n' --1340		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ruotsi', 'A2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja yaru2n, rivi 1341' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yaru2n' --1341		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'suomi', 'A2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja yasu2n, rivi 1342' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yasu2n' --1342		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ranska', 'A2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja yara2n, rivi 1343' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yara2n' --1343		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'saksa', 'A2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja yasa2n, rivi 1344' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yasa2n' --1344		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'venaja', 'A2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja yave2n, rivi 1345' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yave2n' --1345		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'espanja', 'A2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja yaes2n, rivi 1346' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yaes2n' --1346		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'italia', 'A2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja yait2n, rivi 1347' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yait2n' --1347		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'saame', 'A2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja yasaa2n, rivi 1348' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yasaa2n' --1348		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'latina', 'A2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja yalat2n, rivi 1349' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yalat2n' --1349		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'muu_kieli', 'A2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja yamuu2n, rivi 1350' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yamuu2n' --1350		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'englanti', 'B1', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja yyenn, rivi 1351' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yyenn' --1351		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ruotsi', 'B1', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja yyrun, rivi 1352' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yyrun' --1352		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'suomi', 'B1', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja yysun, rivi 1353' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yysun' --1353		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ranska', 'B1', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja yyran, rivi 1354' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yyran' --1354		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'saksa', 'B1', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja yysan, rivi 1355' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yysan' --1355		
		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'englanti', 'B2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja yenn, rivi 1357' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yenn' --1357		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ruotsi', 'B2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja yrun, rivi 1358' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yrun' --1358		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'suomi', 'B2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja ysun, rivi 1359' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ysun' --1359		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ranska', 'B2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja yran, rivi 1360' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yran' --1360		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'saksa', 'B2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja ysan, rivi 1361' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ysan' --1361		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'venaja', 'B2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja yven, rivi 1362' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yven' --1362		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'espanja', 'B2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja yesn, rivi 1363' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yesn' --1363		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'italia', 'B2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja yitn, rivi 1364' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yitn' --1364		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'saame', 'B2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja ysaan, rivi 1365' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ysaan' --1365		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'latina', 'B2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja ylatn, rivi 1366' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ylatn' --1366		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'muu_kieli', 'B2', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja ymuun, rivi 1367' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ymuun' --1367		
		
		
		
		
--Suomi tai ruotsi toisena kielenä	
		
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'suomi2', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja asv, rivi 1393' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='asv' --1393		
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'ruotsi2', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja arv, rivi 1394' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='arv' --1394		
		
		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'suomi2', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ysv, rivi 1397' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ysv' --1397		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'ruotsi2', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yrv, rivi 1398' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yrv' --1398		
		
		
		
	
--Katsomusaineet		
		
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'kats_evlut', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja aev, rivi 1408' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='aev' --1408		
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'kats_ortod', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja aort, rivi 1409' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='aort' --1409		
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'kats_islam', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja aisl, rivi 1410' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='aisl' --1410		
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'kats_muut', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja amu, rivi 1411' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='amu' --1411		
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'kats_elama', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja aet, rivi 1412' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='aet' --1412		
UNION ALL SELECT tilv, tilv_date, 'lk1_6', 'kats_ei', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja aeos, rivi 1413' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='aeos' --1413		
			
		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'kats_evlut', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yev, rivi 1418' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yev' --1418		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'kats_ortod', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yort, rivi 1419' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yort' --1419		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'kats_islam', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yisl, rivi 1420' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yisl' --1420		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'kats_muut', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ymu, rivi 1421' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ymu' --1421		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'kats_elama', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yet, rivi 1422' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yet' --1422		
UNION ALL SELECT tilv, tilv_date, 'lk7_9', 'kats_ei', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yeos, rivi 1423' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yeos' --1423		
		
		
		
		
		
		
--Valinnaisaineet 8-9 lk			
		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'aidinkieli', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ai, rivi 1451' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ai' --1451		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'toinenkoti', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja rsb, rivi 1452' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='rsb' --1452		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'matematiik', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ma, rivi 1453' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ma' --1453		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'ymparisto', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yl, rivi 1454' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yl' --1454		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'biologia', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja bi, rivi 1455' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='bi' --1455		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'maantieto', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ge, rivi 1456' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ge' --1456		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'fysiikka', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja fy, rivi 1457' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='fy' --1457		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'kemia', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ke, rivi 1458' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ke' --1458		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'terveystie', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ter, rivi 1459' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ter' --1459		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'uskonto', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ue, rivi 1460' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ue' --1460		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'elamankats', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja eti, rivi 1461' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='eti' --1461		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'historia', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja hi, rivi 1462' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='hi' --1462		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'yhteiskunt', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yh, rivi 1463' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yh' --1463		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'musiikki', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja mus, rivi 1464' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='mus' --1464		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'kuvataide', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ku, rivi 1465' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ku' --1465		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'tekninenty', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja tt, rivi 1466' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='tt' --1466		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'tekstiilit', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ts, rivi 1467' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ts' --1467		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'liikunta', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja li, rivi 1468' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='li' --1468		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'kotitalous', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ko, rivi 1469' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ko' --1469		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'muutaineet', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja yhd, rivi 1470' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yhd' --1470		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'kasityo', '0', '-1', tunn, lkm_arvo, NULL, NULL, 'muuttuja ks, rivi 1471' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ks' --1471		
		
	UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'aidinkieli', '0', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='ain'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja ai, rivi 1472' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='ai' 	
	UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'toinenkoti', '0', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='rsbn'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja rsb, rivi 1473' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='rsb' 	
	UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'matematiik', '0', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='man'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja ma, rivi 1474' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='ma' 	
	UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'ymparisto', '0', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='yln'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja yl, rivi 1475' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='yl' 	
	UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'biologia', '0', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='bin'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja bi, rivi 1476' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='bi' 	
	UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'maantieto', '0', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='gen'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja ge, rivi 1477' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='ge' 	
	UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'fysiikka', '0', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='fyn'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja fy, rivi 1478' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='fy' 	
	UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'kemia', '0', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='ken'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja ke, rivi 1479' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='ke' 	
	UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'terveystie', '0', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='tern'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja ter, rivi 1480' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='ter' 	
	UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'uskonto', '0', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='uen'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja ue, rivi 1481' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='ue' 	
	UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'elamankats', '0', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='etin'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja eti, rivi 1482' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='eti' 	
	UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'historia', '0', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='hin'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja hi, rivi 1483' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='hi' 	
	UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'yhteiskunt', '0', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='yhn'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja yh, rivi 1484' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='yh' 	
	UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'musiikki', '0', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='musn'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja mus, rivi 1485' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='mus' 	
	UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'kuvataide', '0', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='kun'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja ku, rivi 1486' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='ku' 	
	UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'tekninenty', '0', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='ttn'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja tt, rivi 1487' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='tt' 	
	UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'tekstiilit', '0', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='tsn'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja ts, rivi 1488' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='ts' 	
	UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'liikunta', '0', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='lin'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja li, rivi 1489' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='li' 	
	UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'kotitalous', '0', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='kon'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja ko, rivi 1490' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='ko' 	
	UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'muutaineet', '0', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='yhdn'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja yhd, rivi 1491' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='yhd' 	
	UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'kasityo', '0', '-1', tunn, NULL, lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='ksn'AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, 'muuttuja ks, rivi 1492' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='ks' 	
		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'aidinkieli', '0', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja ain, rivi 1493' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ain' --1493		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'toinenkoti', '0', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja rsbn, rivi 1494' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='rsbn' --1494		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'matematiik', '0', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja man, rivi 1495' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='man' --1495		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'ymparisto', '0', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja yln, rivi 1496' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yln' --1496		
		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'biologia', '0', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja bin, rivi 1498' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='bin' --1498		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'maantieto', '0', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja gen, rivi 1499' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='gen' --1499		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'fysiikka', '0', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja fyn, rivi 1500' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='fyn' --1500		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'kemia', '0', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja ken, rivi 1501' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ken' --1501		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'terveystie', '0', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja tern, rivi 1502' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='tern' --1502		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'uskonto', '0', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja uen, rivi 1503' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='uen' --1503		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'elamankats', '0', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja etin, rivi 1504' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='etin' --1504		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'historia', '0', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja hin, rivi 1505' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='hin' --1505		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'yhteiskunt', '0', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja yhn, rivi 1506' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yhn' --1506		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'musiikki', '0', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja musn, rivi 1507' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='musn' --1507		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'kuvataide', '0', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja kun, rivi 1508' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='kun' --1508		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'tekninenty', '0', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja ttn, rivi 1509' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ttn' --1509		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'tekstiilit', '0', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja tsn, rivi 1510' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='tsn' --1510		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'liikunta', '0', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja lin, rivi 1511' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='lin' --1511		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'kotitalous', '0', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja kon, rivi 1512' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='kon' --1512		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'muutaineet', '0', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja yhdn, rivi 1513' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='yhdn' --1513		
UNION ALL SELECT tilv, tilv_date, 'lk8_9', 'kasityo', '0', '-1', tunn, NULL, NULL, lkm_arvo, 'muuttuja ksn, rivi 1514' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ksn' --1514		

) olapdata


-- haetaan sijainnin kuntakoodi

left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot ol
 on ol.oppilaitos_avain = olapdata.oppilaitos_koodi
-- and olapdata.tilv_date between ol.alkaa and ol.paattyy

) f

  LEFT JOIN VipunenTK..d_perusopetuksen_vuosiluokat d1
	on d1.vuosiluokka_koodi=f.vuosiluokka_koodi
	and f.tilv_date between d1.alkaa and d1.paattyy
  LEFT JOIN VipunenTK..d_perusopetuksen_ainevalinnat d2
	on d2.aine_koodi=f.aine_koodi
	and d2.kielen_taso_koodi=f.kielentaso_koodi
	and f.tilv_date between d2.alkaa and d2.paattyy
  LEFT JOIN VipunenTK..d_perusopetuksen_kieltenmaara d3
	on d3.kieltenmäärä_koodi=f.kieltenmäärä_koodi
	and f.tilv_date between d3.alkaa and d3.paattyy
  
  LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia d4h
	on d4h.oppilaitos_avain=f.oppilaitos_koodi
	and f.tilv_date between d4h.alkaa and d4h.paattyy
  
  LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot d4
	on d4.oppilaitos_avain=f.oppilaitos_koodi

	--and f.tilv_date between d4.alkaa and d4.paattyy
  LEFT JOIN VipunenTK..d_alueluokitus_historia d5h
	on d5h.alueluokitus_avain=d4.sijaintikuntakoodi
	and f.tilv_date between d5h.alkaa and d5h.paattyy    

  LEFT JOIN VipunenTK..d_alueluokitus d5
	on d5.alueluokitus_avain=d4.sijaintikuntakoodi

where tilv<>2010






INSERT INTO VipunenTK.dbo.f_perusopetuksen_kieltenmaara

SELECT [tilv]
      --,[aine_koodi]=f.aine_koodi
      --,[kielentaso_koodi]=f.kielentaso_koodi
      ,[oppilaitos_koodi]
      ,[lkm_yht]
      ,[lkm_pojat]
      ,[lkm_tytot]
      ,[vuosiluokka_koodi]=f.vuosiluokka_koodi
      ,[kieltenmäärä_koodi]=f.kieltenmäärä_koodi
      ,lkm_kielivalinnat
      ,[oppilaitoksensijainti_historia_koodi]
      ,[vuosiluokka_id]=isnull(d1.id, -2)
      ,[tilv_date]
      ,[aineisto]
      ,[laatu_id]=0
      --,[ainevalinta_id]=d2.id
      ,[kieltenmaara_id]=isnull(d3.id, -2)
      ,[oppilaitos_historia_id]=ISNULL(d4h.id, -2)
      ,[oppilaitos_id]=ISNULL(d4.id, -2)
      ,[oppilaitoksensijainti_historia_id]=ISNULL(d5h.id, -2)
      ,[oppilaitoksensijainti_id]=ISNULL(d5.id, -2)


FROM

(

SELECT 
      [tilv]
      ,tilv_date
      --,[jarj]
      --,[tiedtype]
      --,[tunn]
      --,[edesi]
      --,[edala]
      --,[edyla]
      --,[edlisa]
      --,[edainep]
      --,[syesi]
      --,[syala]
      --,[syyla]
      --,[sylisa]
      --,[symamu]
      --,[sylukio]
      --,[syamm]
      --,[symuu]
      --,[aku]
      --,[kaytto]
      --,[tietolahde]
      --,[rivinumero]
      --,[lkm_arvo]
      --,[lkm_id]
      
      ,vuosiluokka_koodi = Cast(vuosiluokka_koodi as nvarchar(10))
      --,aine_koodi = Cast(aine_koodi as nvarchar(10))
      --,kielentaso_koodi = Cast(kielentaso_koodi as nvarchar(10))
      ,kieltenmäärä_koodi = Cast(kieltenmäärä_koodi as nvarchar(10))
      ,oppilaitos_koodi
      ,oppilaitoksensijainti_historia_koodi = CAST(ol.sijaintikuntakoodi as nvarchar(21)) --CAST('-1' as nvarchar(21))
      ,lkm_yht
      ,lkm_pojat
      ,lkm_tytot
      ,lkm_kielivalinnat
      ,aineisto = CAST('R2.22' as nvarchar(8))
FROM (

SELECT 
      [tilv]
      ,tilv_date
      ,vuosiluokka_koodi = 'lk1'
      --,aine_koodi = 'englanti'
      --,kielentaso_koodi = 'A1'
      --,kieltenmäärä_koodi = '-1'
      ,oppilaitos_koodi = tunn
      ,lkm_yht = lkm_arvo --vain yhdellä lkm-kentällä voi olla lkm_arvo, muilla pitää olla NULL
      ,lkm_pojat = lkm_arvo --vain yhdellä lkm-kentällä voi olla lkm_arvo, muilla pitää olla NULL
      ,lkm_tytot = lkm_arvo --vain yhdellä lkm-kentällä voi olla lkm_arvo, muilla pitää olla NULL
	  ,kieltenmäärä_koodi = '0'
      ,lkm_kielivalinnat = lkm_arvo --vain yhdellä lkm-kentällä voi olla lkm_arvo, muilla pitää olla NULL
      ,lähde='eng1'
FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE lkm_id='<kentännimi>'

--kielivalintojen lukumäärät SQL7
UNION ALL SELECT tilv, tilv_date, 'lk1_6', tunn, NULL, NULL, NULL, '0', lkm_arvo, 'muuttuja alkieli0' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='alkieli0'
UNION ALL SELECT tilv, tilv_date, 'lk1_6', tunn, NULL, NULL, NULL, '1', lkm_arvo, 'muuttuja alkieli1' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='alkieli1'
UNION ALL SELECT tilv, tilv_date, 'lk1_6', tunn, NULL, NULL, NULL, '2', lkm_arvo, 'muuttuja alkieli2' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='alkieli2'
UNION ALL SELECT tilv, tilv_date, 'lk1_6', tunn, NULL, NULL, NULL, '3', lkm_arvo, 'muuttuja alkieli3' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='alkieli3'
UNION ALL SELECT tilv, tilv_date, 'lk1_6', tunn, NULL, NULL, NULL, '4', lkm_arvo, 'muuttuja alkieli4' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='alkieli4'



UNION ALL SELECT tilv, tilv_date, 'lk7_9', tunn, NULL, NULL, NULL, '0', lkm_arvo, 'muuttuja ylkieli0' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ylkieli0'
UNION ALL SELECT tilv, tilv_date, 'lk7_9', tunn, NULL, NULL, NULL, '1', lkm_arvo, 'muuttuja ylkieli1' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ylkieli1'
UNION ALL SELECT tilv, tilv_date, 'lk7_9', tunn, NULL, NULL, NULL, '2', lkm_arvo, 'muuttuja ylkieli2' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ylkieli2'
UNION ALL SELECT tilv, tilv_date, 'lk7_9', tunn, NULL, NULL, NULL, '3', lkm_arvo, 'muuttuja ylkieli3' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ylkieli3'
UNION ALL SELECT tilv, tilv_date, 'lk7_9', tunn, NULL, NULL, NULL, '4', lkm_arvo, 'muuttuja ylkieli4' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ylkieli4'
UNION ALL SELECT tilv, tilv_date, 'lk7_9', tunn, NULL, NULL, NULL, '5', lkm_arvo, 'muuttuja ylkieli5' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ylkieli5'

) olapdata


-- haetaan sijainnin kuntakoodi

left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot ol
 on ol.oppilaitoskoodi = olapdata.oppilaitos_koodi
-- and olapdata.tilv_date between ol.alkaa and ol.paattyy

) f

  LEFT JOIN VipunenTK..d_perusopetuksen_vuosiluokat d1
	on d1.vuosiluokka_koodi=f.vuosiluokka_koodi
	and f.tilv_date between d1.alkaa and d1.paattyy
  LEFT JOIN VipunenTK..d_perusopetuksen_kieltenmaara d3
	on d3.kieltenmäärä_koodi=f.kieltenmäärä_koodi
	and f.tilv_date between d3.alkaa and d3.paattyy

  LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia d4h
	on d4h.oppilaitos_avain=f.oppilaitos_koodi
	and f.tilv_date between d4h.alkaa and d4h.paattyy

  LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot d4
	on d4.oppilaitos_avain=f.oppilaitos_koodi
	--and f.tilv_date between d4.alkaa and d4.paattyy
  LEFT JOIN VipunenTK..d_alueluokitus_historia d5h
	on d5h.alueluokitus_avain=d4.sijaintikuntakoodi
	and f.tilv_date between d5h.alkaa and d5h.paattyy   

  LEFT JOIN VipunenTK..d_alueluokitus d5
	on d5.alueluokitus_avain=d4.sijaintikuntakoodi



INSERT INTO VipunenTK.dbo.f_perusopetuksen_oppilasmaarat

SELECT [tilv]
      --,[aine_koodi]=f.aine_koodi
      --,[kielentaso_koodi]=f.kielentaso_koodi
      ,[oppilaitos_koodi]
      ,[lkm_yht]
      ,[lkm_pojat]
      ,[lkm_tytot]
      ,[vuosiluokka_koodi]=f.vuosiluokka_koodi
      ,[kieltenmäärä_koodi]=f.kieltenmäärä_koodi
      ,lkm_kielivalinnat
      ,[oppilaitoksensijainti_historia_koodi]
      ,[vuosiluokka_id]=isnull(d1.id, -2)
      ,[tilv_date]
      ,[aineisto]
      ,[laatu_id]=0
      --,[ainevalinta_id]=d2.id
      ,[kieltenmaara_id]=isnull(d3.id, -2)
      ,[oppilaitos_historia_id]=ISNULL(d4h.id, -2)
      ,[oppilaitos_id]=ISNULL(d4.id, -2)
      ,[oppilaitoksensijainti_historia_id]=ISNULL(d5h.id, -2)
      ,[oppilaitoksensijainti_id]=ISNULL(d5.id, -2)


FROM

(

SELECT 
      [tilv]
      ,tilv_date
      --,[jarj]
      --,[tiedtype]
      --,[tunn]
      --,[edesi]
      --,[edala]
      --,[edyla]
      --,[edlisa]
      --,[edainep]
      --,[syesi]
      --,[syala]
      --,[syyla]
      --,[sylisa]
      --,[symamu]
      --,[sylukio]
      --,[syamm]
      --,[symuu]
      --,[aku]
      --,[kaytto]
      --,[tietolahde]
      --,[rivinumero]
      --,[lkm_arvo]
      --,[lkm_id]
      
      ,vuosiluokka_koodi = Cast(vuosiluokka_koodi as nvarchar(10))
      --,aine_koodi = Cast(aine_koodi as nvarchar(10))
      --,kielentaso_koodi = Cast(kielentaso_koodi as nvarchar(10))
      ,kieltenmäärä_koodi = Cast(kieltenmäärä_koodi as nvarchar(10))
      ,oppilaitos_koodi
      ,oppilaitoksensijainti_historia_koodi = CAST(ol.sijaintikuntakoodi as nvarchar(21)) --CAST('-1' as nvarchar(21))
      ,lkm_yht
      ,lkm_pojat
      ,lkm_tytot
      ,lkm_kielivalinnat
      ,aineisto = CAST('R2.22' as nvarchar(8))
FROM (

SELECT 
      [tilv]
      ,tilv_date
      ,vuosiluokka_koodi = 'lk1'
      --,aine_koodi = 'englanti'
      --,kielentaso_koodi = 'A1'
      --,kieltenmäärä_koodi = '-1'
      ,oppilaitos_koodi = tunn
      ,lkm_yht = lkm_arvo --vain yhdellä lkm-kentällä voi olla lkm_arvo, muilla pitää olla NULL
      ,lkm_pojat = lkm_arvo --vain yhdellä lkm-kentällä voi olla lkm_arvo, muilla pitää olla NULL
      ,lkm_tytot = lkm_arvo --vain yhdellä lkm-kentällä voi olla lkm_arvo, muilla pitää olla NULL
	  ,kieltenmäärä_koodi = '0'
      ,lkm_kielivalinnat = lkm_arvo --vain yhdellä lkm-kentällä voi olla lkm_arvo, muilla pitää olla NULL
      ,lähde='eng1'
FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE lkm_id='<kentännimi>' 

--tyttöjen lkm SQL5
UNION ALL SELECT tilv, tilv_date, 'lk1', tunn, NULL, NULL, lkm_arvo, '-1', NULL, 'muuttuja ov1n' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ov1n'

UNION ALL SELECT tilv, tilv_date, 'lk2', tunn, NULL, NULL, lkm_arvo, '-1', NULL, 'muuttuja ov2n' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ov2n'
UNION ALL SELECT tilv, tilv_date, 'lk3', tunn, NULL, NULL, lkm_arvo, '-1', NULL, 'muuttuja ov3n' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ov3n'
UNION ALL SELECT tilv, tilv_date, 'lk4', tunn, NULL, NULL, lkm_arvo, '-1', NULL, 'muuttuja ov4n' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ov4n'
UNION ALL SELECT tilv, tilv_date, 'lk5', tunn, NULL, NULL, lkm_arvo, '-1', NULL, 'muuttuja ov5n' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ov5n'
UNION ALL SELECT tilv, tilv_date, 'lk6', tunn, NULL, NULL, lkm_arvo, '-1', NULL, 'muuttuja ov6n' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ov6n'
UNION ALL SELECT tilv, tilv_date, 'lk7', tunn, NULL, NULL, lkm_arvo, '-1', NULL, 'muuttuja ov7n' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ov7n'
UNION ALL SELECT tilv, tilv_date, 'lk8', tunn, NULL, NULL, lkm_arvo, '-1', NULL, 'muuttuja ov8n' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ov8n'
UNION ALL SELECT tilv, tilv_date, 'lk9', tunn, NULL, NULL, lkm_arvo, '-1', NULL, 'muuttuja ov9n' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ov9n'
UNION ALL SELECT tilv, tilv_date, 'lk10', tunn, NULL, NULL, lkm_arvo, '-1', NULL, 'muuttuja ov10n' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] WHERE lkm_id='ov10n'


--laskettavat lisärivit
--poikien lkm SQL6
UNION ALL SELECT tilv, tilv_date, 'lk1', tunn, NULL, f1.lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='ov1n' AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, '-1', NULL, 'muuttuja ov1 , rivi 189' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='ov1 ' 

UNION ALL SELECT tilv, tilv_date, 'lk2', tunn, NULL, f1.lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='ov2n' AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, '-1', NULL, 'muuttuja ov2, rivi 191' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='ov2' 
UNION ALL SELECT tilv, tilv_date, 'lk3', tunn, NULL, f1.lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='ov3n' AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, '-1', NULL, 'muuttuja ov3, rivi 192' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='ov3' 
UNION ALL SELECT tilv, tilv_date, 'lk4', tunn, NULL, f1.lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='ov4n' AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, '-1', NULL, 'muuttuja ov4, rivi 193' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='ov4' 
UNION ALL SELECT tilv, tilv_date, 'lk5', tunn, NULL, f1.lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='ov5n' AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, '-1', NULL, 'muuttuja ov5 , rivi 194' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='ov5 ' 
UNION ALL SELECT tilv, tilv_date, 'lk6', tunn, NULL, f1.lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='ov6n' AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, '-1', NULL, 'muuttuja ov6, rivi 195' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='ov6' 
UNION ALL SELECT tilv, tilv_date, 'lk7', tunn, NULL, f1.lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='ov7n' AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, '-1', NULL, 'muuttuja ov7, rivi 196' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='ov7' 
UNION ALL SELECT tilv, tilv_date, 'lk8', tunn, NULL, f1.lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='ov8n' AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, '-1', NULL, 'muuttuja ov8, rivi 197' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='ov8' 
UNION ALL SELECT tilv, tilv_date, 'lk9', tunn, NULL, f1.lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='ov9n' AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, '-1', NULL, 'muuttuja ov9, rivi 198' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='ov9' 
UNION ALL SELECT tilv, tilv_date, 'lk10', tunn, NULL, f1.lkm_arvo-ISNULL((SELECT lkm_arvo 
 FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f2 
 WHERE lkm_id='ov10n' AND f2.rivinumero=f1.rivinumero and f2.tilv=f1.tilv),0), NULL, '-1', NULL, 'muuttuja ov10, rivi 199' FROM [VipunenTK_DW].[dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk] f1 WHERE f1.lkm_id='ov10' 

) olapdata


-- haetaan sijainnin kuntakoodi

left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot ol
 on ol.oppilaitoskoodi = olapdata.oppilaitos_koodi
-- and olapdata.tilv_date between ol.alkaa and ol.paattyy

) f

  LEFT JOIN VipunenTK..d_perusopetuksen_vuosiluokat d1
	on d1.vuosiluokka_koodi=f.vuosiluokka_koodi
	and f.tilv_date between d1.alkaa and d1.paattyy
  LEFT JOIN VipunenTK..d_perusopetuksen_kieltenmaara d3
	on d3.kieltenmäärä_koodi=f.kieltenmäärä_koodi
	and f.tilv_date between d3.alkaa and d3.paattyy

  LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia d4h
	on d4h.oppilaitos_avain=f.oppilaitos_koodi
	and f.tilv_date between d4h.alkaa and d4h.paattyy


  LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot d4
	on d4.oppilaitos_avain=f.oppilaitos_koodi
--	and f.tilv_date between d4.alkaa and d4.paattyy

  LEFT JOIN VipunenTK..d_alueluokitus_historia d5h
	on d5h.alueluokitus_avain=d4.sijaintikuntakoodi
	and f.tilv_date between d5h.alkaa and d5h.paattyy   

  LEFT JOIN VipunenTK..d_alueluokitus d5
	on d5.alueluokitus_avain=d4.sijaintikuntakoodi
where tilv<>2010


GO
USE [ANTERO]