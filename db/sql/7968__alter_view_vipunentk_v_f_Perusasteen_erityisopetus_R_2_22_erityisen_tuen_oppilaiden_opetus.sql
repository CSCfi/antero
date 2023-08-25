USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_Perusasteen_erityisopetus_R_2_22_erityisen_tuen_oppilaiden_opetus]    Script Date: 25.8.2023 14:23:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER VIEW [dbo].[v_f_Perusasteen_erityisopetus_R_2_22_erityisen_tuen_oppilaiden_opetus] AS

SELECT
  tilv,
  oppilaitos=tunn,
  oppilaitoksen_taustatiedot_id=ISNULL(d4.id,-2),
  oppilaitoksen_sijainti_id=ISNULL(d5.id,-2),
  tiedtype,
  perusopetuksen_vuosiluokat,
  perusopetuksen_vuosiluokat_id=ISNULL(d1.id,-2),
  kaikki.perusopetuksen_erityisen_tuen_paatos,
  perusopetuksen_erityisen_tuen_paatos_id=ISNULL(d2.id,-2),
  kaikki.perusopetuksen_yleisopetuksen_osuus,
  perusopetuksen_yleisopetuksen_osuus_id=ISNULL(d3.id,-2),
  erityisen_tuen_oppilaiden_opetus
  
FROM

(

--2.22c

--esi
SELECT 
  tilv,
  tunn,
  tiedtype = null,
  perusopetuksen_vuosiluokat='lk0',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int0',
  erityisen_tuen_oppilaiden_opetus=totesi1
FROM [VipunenTK_SA].[dbo].[v_sa_2_22c_peruskoulujen_erityinen_tuki]
WHERE totesi1>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  perusopetuksen_vuosiluokat='lk0',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int1_uusi',
  erityisen_tuen_oppilaiden_opetus=totesi2
FROM [VipunenTK_SA].[dbo].[v_sa_2_22c_peruskoulujen_erityinen_tuki]
WHERE totesi2>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  perusopetuksen_vuosiluokat='lk0',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int2_uusi',
  erityisen_tuen_oppilaiden_opetus=totesi3
FROM [VipunenTK_SA].[dbo].[v_sa_2_22c_peruskoulujen_erityinen_tuki]
WHERE totesi3>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  perusopetuksen_vuosiluokat='lk0',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int3_uusi',
  erityisen_tuen_oppilaiden_opetus=totesi4
FROM [VipunenTK_SA].[dbo].[v_sa_2_22c_peruskoulujen_erityinen_tuki]
WHERE totesi4>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  perusopetuksen_vuosiluokat='lk0',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int4_uusi',
  erityisen_tuen_oppilaiden_opetus=totesi5
FROM [VipunenTK_SA].[dbo].[v_sa_2_22c_peruskoulujen_erityinen_tuki]
WHERE totesi5>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  perusopetuksen_vuosiluokat='lk0',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int_tuntem',
  erityisen_tuen_oppilaiden_opetus=totesi6
FROM [VipunenTK_SA].[dbo].[v_sa_2_22c_peruskoulujen_erityinen_tuki]
WHERE totesi6>0

UNION ALL

--1-6
SELECT 
  tilv,
  tunn,
  tiedtype = null,
  perusopetuksen_vuosiluokat='lk1_6',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int0',
  erityisen_tuen_oppilaiden_opetus=tot161
FROM [VipunenTK_SA].[dbo].[v_sa_2_22c_peruskoulujen_erityinen_tuki]
WHERE tot161>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  perusopetuksen_vuosiluokat='lk1_6',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int1_uusi',
  erityisen_tuen_oppilaiden_opetus=tot162
FROM [VipunenTK_SA].[dbo].[v_sa_2_22c_peruskoulujen_erityinen_tuki]
WHERE tot162>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  perusopetuksen_vuosiluokat='lk1_6',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int2_uusi',
  erityisen_tuen_oppilaiden_opetus=tot163
FROM [VipunenTK_SA].[dbo].[v_sa_2_22c_peruskoulujen_erityinen_tuki]
WHERE tot163>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  perusopetuksen_vuosiluokat='lk1_6',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int3_uusi',
  erityisen_tuen_oppilaiden_opetus=tot164
FROM [VipunenTK_SA].[dbo].[v_sa_2_22c_peruskoulujen_erityinen_tuki]
WHERE tot164>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  perusopetuksen_vuosiluokat='lk1_6',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int4_uusi',
  erityisen_tuen_oppilaiden_opetus=tot165
FROM [VipunenTK_SA].[dbo].[v_sa_2_22c_peruskoulujen_erityinen_tuki]
WHERE tot165>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  perusopetuksen_vuosiluokat='lk1_6',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int_tuntem',
  erityisen_tuen_oppilaiden_opetus=tot166
FROM [VipunenTK_SA].[dbo].[v_sa_2_22c_peruskoulujen_erityinen_tuki]
WHERE tot166>0


UNION ALL

--7-9
SELECT 
  tilv,
  tunn,
  tiedtype = null,
  perusopetuksen_vuosiluokat='lk7_9',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int0',
  erityisen_tuen_oppilaiden_opetus=tot791
FROM [VipunenTK_SA].[dbo].[v_sa_2_22c_peruskoulujen_erityinen_tuki]
WHERE tot791>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  perusopetuksen_vuosiluokat='lk7_9',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int1_uusi',
  erityisen_tuen_oppilaiden_opetus=tot792
FROM [VipunenTK_SA].[dbo].[v_sa_2_22c_peruskoulujen_erityinen_tuki]
WHERE tot792>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  perusopetuksen_vuosiluokat='lk7_9',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int2_uusi',
  erityisen_tuen_oppilaiden_opetus=tot793
FROM [VipunenTK_SA].[dbo].[v_sa_2_22c_peruskoulujen_erityinen_tuki]
WHERE tot793>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  perusopetuksen_vuosiluokat='lk7_9',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int3_uusi',
  erityisen_tuen_oppilaiden_opetus=tot794
FROM [VipunenTK_SA].[dbo].[v_sa_2_22c_peruskoulujen_erityinen_tuki]
WHERE tot794>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  perusopetuksen_vuosiluokat='lk7_9',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int4_uusi',
  erityisen_tuen_oppilaiden_opetus=tot795
FROM [VipunenTK_SA].[dbo].[v_sa_2_22c_peruskoulujen_erityinen_tuki]
WHERE tot795>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  perusopetuksen_vuosiluokat='lk7_9',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int_tuntem',
  erityisen_tuen_oppilaiden_opetus=tot796
FROM [VipunenTK_SA].[dbo].[v_sa_2_22c_peruskoulujen_erityinen_tuki]
WHERE tot796>0

UNION ALL

--lisä
SELECT 
  tilv,
  tunn,
  tiedtype = null,
  perusopetuksen_vuosiluokat='lk10',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int0',
  erityisen_tuen_oppilaiden_opetus=totlisa1
FROM [VipunenTK_SA].[dbo].[v_sa_2_22c_peruskoulujen_erityinen_tuki]
WHERE totlisa1>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  perusopetuksen_vuosiluokat='lk10',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int1_uusi',
  erityisen_tuen_oppilaiden_opetus=totlisa2
FROM [VipunenTK_SA].[dbo].[v_sa_2_22c_peruskoulujen_erityinen_tuki]
WHERE totlisa2>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  perusopetuksen_vuosiluokat='lk10',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int2_uusi',
  erityisen_tuen_oppilaiden_opetus=totlisa3
FROM [VipunenTK_SA].[dbo].[v_sa_2_22c_peruskoulujen_erityinen_tuki]
WHERE totlisa3>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  perusopetuksen_vuosiluokat='lk10',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int3_uusi',
  erityisen_tuen_oppilaiden_opetus=totlisa4
FROM [VipunenTK_SA].[dbo].[v_sa_2_22c_peruskoulujen_erityinen_tuki]
WHERE totlisa4>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  perusopetuksen_vuosiluokat='lk10',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int4_uusi',
  erityisen_tuen_oppilaiden_opetus=totlisa5
FROM [VipunenTK_SA].[dbo].[v_sa_2_22c_peruskoulujen_erityinen_tuki]
WHERE totlisa5>0

UNION ALL

--kaatoluokat
SELECT 
  tilv,
  tunn,
  tiedtype = null,
  perusopetuksen_vuosiluokat='lk0',
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_yleisopetuksen_osuus='int_ei',
  erityisen_tuen_oppilaiden_opetus=ove-ertuesi
FROM [VipunenTK_SA].[dbo].[v_sa_2_22c_peruskoulujen_erityinen_tuki]
WHERE ove-ertuesi>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  perusopetuksen_vuosiluokat='lk1_6',
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_yleisopetuksen_osuus='int_ei',
  erityisen_tuen_oppilaiden_opetus=ov16-ertu16
FROM [VipunenTK_SA].[dbo].[v_sa_2_22c_peruskoulujen_erityinen_tuki]
WHERE ov16-ertu16>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  perusopetuksen_vuosiluokat='lk7_9',
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_yleisopetuksen_osuus='int_ei',
  erityisen_tuen_oppilaiden_opetus=ov79-ertu79
FROM [VipunenTK_SA].[dbo].[v_sa_2_22c_peruskoulujen_erityinen_tuki]
WHERE ov79-ertu79>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  perusopetuksen_vuosiluokat='lk10',
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_yleisopetuksen_osuus='int_ei',
  erityisen_tuen_oppilaiden_opetus=ovlisa-ertulisa
FROM [VipunenTK_SA].[dbo].[v_sa_2_22c_peruskoulujen_erityinen_tuki]
WHERE ovlisa-ertulisa>0



UNION ALL



--2.22
SELECT 
  tilv,
  tunn,
  tiedtype,
  perusopetuksen_vuosiluokat='lk0',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int4',
  erityisen_tuen_oppilaiden_opetus=inte4
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE inte4>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  perusopetuksen_vuosiluokat='lk1_6',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int4',
  erityisen_tuen_oppilaiden_opetus=int164
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE int164>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  perusopetuksen_vuosiluokat='lk7_9',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int4',
  erityisen_tuen_oppilaiden_opetus=int794
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE int794>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  perusopetuksen_vuosiluokat='lk10',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int4',
  erityisen_tuen_oppilaiden_opetus=intl4
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE intl4>0

--
UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  perusopetuksen_vuosiluokat='lk0',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int3',
  erityisen_tuen_oppilaiden_opetus=inte3
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE inte3>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  perusopetuksen_vuosiluokat='lk1_6',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int3',
  erityisen_tuen_oppilaiden_opetus=int163
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE int163>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  perusopetuksen_vuosiluokat='lk7_9',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int3',
  erityisen_tuen_oppilaiden_opetus=int793
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE int793>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  perusopetuksen_vuosiluokat='lk10',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int3',
  erityisen_tuen_oppilaiden_opetus=intl3
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE intl3>0

--
UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  perusopetuksen_vuosiluokat='lk0',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int2',
  erityisen_tuen_oppilaiden_opetus=inte2
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE inte2>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  perusopetuksen_vuosiluokat='lk1_6',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int2',
  erityisen_tuen_oppilaiden_opetus=int162
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE int162>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  perusopetuksen_vuosiluokat='lk7_9',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int2',
  erityisen_tuen_oppilaiden_opetus=int792
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE int792>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  perusopetuksen_vuosiluokat='lk10',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int2',
  erityisen_tuen_oppilaiden_opetus=intl2
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE intl2>0

--
UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  perusopetuksen_vuosiluokat='lk0',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int1',
  erityisen_tuen_oppilaiden_opetus=inte1
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE inte1>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  perusopetuksen_vuosiluokat='lk1_6',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int1',
  erityisen_tuen_oppilaiden_opetus=int161
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE int161>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  perusopetuksen_vuosiluokat='lk7_9',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int1',
  erityisen_tuen_oppilaiden_opetus=int791
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE int791>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  perusopetuksen_vuosiluokat='lk10',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int1',
  erityisen_tuen_oppilaiden_opetus=intl1
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE intl1>0

--
UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  perusopetuksen_vuosiluokat='lk0',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int0',
  erityisen_tuen_oppilaiden_opetus=inte0
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE inte0>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  perusopetuksen_vuosiluokat='lk1_6',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int0',
  erityisen_tuen_oppilaiden_opetus=int160
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE int160>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  perusopetuksen_vuosiluokat='lk7_9',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int0',
  erityisen_tuen_oppilaiden_opetus=int790
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE int790>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  perusopetuksen_vuosiluokat='lk10',
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_yleisopetuksen_osuus='int0',
  erityisen_tuen_oppilaiden_opetus=intl0
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE intl0>0

UNION ALL

--kaatoluokat
SELECT 
  tilv,
  tunn,
  tiedtype,
  perusopetuksen_vuosiluokat='lk0',
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_yleisopetuksen_osuus='int_ei',
  erityisen_tuen_oppilaiden_opetus=ove-intey
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ove-intey>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  perusopetuksen_vuosiluokat='lk1_6',
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_yleisopetuksen_osuus='int_ei',
  erityisen_tuen_oppilaiden_opetus=ov1+ov2+ov3+ov4+ov5+ov6-int16y
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ov1+ov2+ov3+ov4+ov5+ov6-int16y>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  perusopetuksen_vuosiluokat='lk7_9',
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_yleisopetuksen_osuus='int_ei',
  erityisen_tuen_oppilaiden_opetus=ov7+ov8+ov9-int79y
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ov7+ov8+ov9-int79y>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  perusopetuksen_vuosiluokat='lk10',
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_yleisopetuksen_osuus='int_ei',
  erityisen_tuen_oppilaiden_opetus=ov10-intly
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ov10-intly>0


) kaikki


LEFT JOIN VipunenTK.dbo.d_perusopetuksen_vuosiluokat d1
ON d1.vuosiluokka_koodi=kaikki.perusopetuksen_vuosiluokat

LEFT JOIN VipunenTK.dbo.d_perusopetuksen_erityisen_tuen_paatos d2
ON d2.perusopetuksen_erityisen_tuen_paatos_koodi=kaikki.perusopetuksen_erityisen_tuen_paatos

LEFT JOIN VipunenTK.dbo.d_perusopetuksen_yleisopetuksen_osuus d3
ON d3.perusopetuksen_yleisopetuksen_osuus_koodi=kaikki.perusopetuksen_yleisopetuksen_osuus

LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot d4
ON d4.oppilaitoskoodi=kaikki.tunn

LEFT JOIN VipunenTK.dbo.d_alueluokitus d5
ON d5.alueluokitus_avain=d4.sijaintikuntakoodi





GO


