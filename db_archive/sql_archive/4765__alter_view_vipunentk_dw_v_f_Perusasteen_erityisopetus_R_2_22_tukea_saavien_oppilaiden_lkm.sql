USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_Perusasteen_erityisopetus_R_2_22_tukea_saavien_oppilaiden_lkm]    Script Date: 6.7.2021 17:22:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[v_f_Perusasteen_erityisopetus_R_2_22_tukea_saavien_oppilaiden_lkm] AS

SELECT

  tilv,
  oppilaitos=tunn,
  oppilaitoksen_taustatiedot_id=ISNULL(d6.id,-2),
  oppilaitoksen_sijainti_id=ISNULL(d9.id,-2),
  tiedtype,
  fakta.perusopetuksen_erityisen_tuen_paatos,
  perusopetuksen_erityisen_tuen_paatos_id=ISNULL(d1.id,-2),
  fakta.perusopetuksen_tehostettu_tuki,
  perusopetuksen_tehostettu_tuki_id=ISNULL(d2.id,-2),
  fakta.perusopetuksen_tukimuoto,
  perusopetuksen_tukimuoto_id=ISNULL(d3.id,-2),
  tukea_saavat_oppilaat
  
  FROM
  
(  

--2.22c
--vaihdetaan alla oleva sa-näkymäksi ja -tauluksi sopv22

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_tehostettu_tuki='ertu_teho',
  perusopetuksen_tukimuoto='tuki_osa',
  tukea_saavat_oppilaat=tehoosa
FROM [TK_H9098_CSC].[dbo].[TK_K2_22c_sopv_21]
WHERE tehoosa>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_tehostettu_tuki='-1',
  perusopetuksen_tukimuoto='tuki_osa',
  tukea_saavat_oppilaat=ertuosa
FROM [TK_H9098_CSC].[dbo].[TK_K2_22c_sopv_21]
WHERE ertuosa>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_tehostettu_tuki='ertu_teho',
  perusopetuksen_tukimuoto='tuki_tuki',
  tukea_saavat_oppilaat=tehotuki
FROM [TK_H9098_CSC].[dbo].[TK_K2_22c_sopv_21]
WHERE tehotuki>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_tehostettu_tuki='-1',
  perusopetuksen_tukimuoto='tuki_tuki',
  tukea_saavat_oppilaat=ertutuki
FROM [TK_H9098_CSC].[dbo].[TK_K2_22c_sopv_21]
WHERE ertutuki>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_tehostettu_tuki='ertu_teho',
  perusopetuksen_tukimuoto='tuki_avus',
  tukea_saavat_oppilaat=tehoavus
FROM [TK_H9098_CSC].[dbo].[TK_K2_22c_sopv_21]
WHERE tehoavus>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_tehostettu_tuki='-1',
  perusopetuksen_tukimuoto='tuki_avus',
  tukea_saavat_oppilaat=ertuavus
FROM [TK_H9098_CSC].[dbo].[TK_K2_22c_sopv_21]
WHERE ertuavus>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_tehostettu_tuki='ertu_teho',
  perusopetuksen_tukimuoto='tuki_tulk',
  tukea_saavat_oppilaat=tehotulk
FROM [TK_H9098_CSC].[dbo].[TK_K2_22c_sopv_21]
WHERE tehotulk>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_tehostettu_tuki='-1',
  perusopetuksen_tukimuoto='tuki_tulk',
  tukea_saavat_oppilaat=ertutulk
FROM [TK_H9098_CSC].[dbo].[TK_K2_22c_sopv_21]
WHERE ertutulk>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_tehostettu_tuki='ertu_teho',
  perusopetuksen_tukimuoto='tuki_apuv',
  tukea_saavat_oppilaat=tehoapuv
FROM [TK_H9098_CSC].[dbo].[TK_K2_22c_sopv_21]
WHERE tehoapuv>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_tehostettu_tuki='-1',
  perusopetuksen_tukimuoto='tuki_apuv',
  tukea_saavat_oppilaat=ertuapuv
FROM [TK_H9098_CSC].[dbo].[TK_K2_22c_sopv_21]
WHERE ertuapuv>0



UNION ALL



--2.22
SELECT 
  tilv,
  tunn,
  tiedtype,
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_tehostettu_tuki='ertu_teho',
  perusopetuksen_tukimuoto='tuki_osa',
  tukea_saavat_oppilaat=tehoosa
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE tehoosa>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_tehostettu_tuki='ertu_muu',
  perusopetuksen_tukimuoto='tuki_osa',
  tukea_saavat_oppilaat=ertuosa
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertuosa>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  perusopetuksen_erityisen_tuen_paatos='E',
  --perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_tehostettu_tuki='ertu_teho',
  perusopetuksen_tukimuoto='tuki_tuki',
  tukea_saavat_oppilaat=tehotuki
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE tehotuki>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_tehostettu_tuki='ertu_muu',
  perusopetuksen_tukimuoto='tuki_tuki',
  tukea_saavat_oppilaat=ertutuki
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertutuki>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  perusopetuksen_erityisen_tuen_paatos='E',
  --perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_tehostettu_tuki='ertu_teho',
  perusopetuksen_tukimuoto='tuki_avu',
  tukea_saavat_oppilaat=tehoavu
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE tehoavu>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_tehostettu_tuki='ertu_muu',
  perusopetuksen_tukimuoto='tuki_avu',
  tukea_saavat_oppilaat=ertuavu
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertuavu>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  perusopetuksen_erityisen_tuen_paatos='E',
 -- perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_tehostettu_tuki='ertu_teho',
  perusopetuksen_tukimuoto='tuki_muu',
  tukea_saavat_oppilaat=tehomuu
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE tehomuu>0


UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_tehostettu_tuki='ertu_muu',
  perusopetuksen_tukimuoto='tuki_muu',
  tukea_saavat_oppilaat=ertumuu
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertumuu>0

/* Ei voi ottaa mukaan, yksi henkilö voi saada montaa tukimuotoa (?)
UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  perusopetuksen_erityisen_tuen_paatos='E',
 -- perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_tehostettu_tuki='ertu_teho',
  perusopetuksen_tukimuoto='tuki_ei',
  tukea_saavat_oppilaat=tehoy-tehoosa-tehotuki-tehoavu-tehomuu
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE tehoy-tehoosa-tehotuki-tehoavu-tehomuu>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_tehostettu_tuki='ertu_muu',
  perusopetuksen_tukimuoto='tuki_ei',
  tukea_saavat_oppilaat=ertuyc-ertuosa-ertutuki-ertuavu-ertumuu
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertuyc-ertuosa-ertutuki-ertuavu-ertumuu>0


UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_tehostettu_tuki='ertu_ei',
  perusopetuksen_tukimuoto='tuki_ei',
  tukea_saavat_oppilaat=ovy-tehoy-ertuyc
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ovy-tehoy-ertuyc>0
*/


) fakta

LEFT JOIN  VipunenTK.dbo.d_perusopetuksen_erityisen_tuen_paatos d1
ON d1.perusopetuksen_erityisen_tuen_paatos_koodi=fakta.perusopetuksen_erityisen_tuen_paatos


LEFT JOIN VipunenTK.dbo.d_perusopetuksen_tehostettu_tuki d2
ON d2.perusopetuksen_tehostettu_tuki_koodi=fakta.perusopetuksen_tehostettu_tuki

LEFT JOIN VipunenTK.dbo.d_perusopetuksen_tukimuoto d3
ON d3.perusopetuksen_tukimuoto_koodi=fakta.perusopetuksen_tukimuoto

LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot d6
ON d6.oppilaitoskoodi=fakta.tunn

LEFT JOIN VipunenTK.dbo.d_alueluokitus d9
ON d9.alueluokitus_avain=d6.sijaintikuntakoodi



GO


