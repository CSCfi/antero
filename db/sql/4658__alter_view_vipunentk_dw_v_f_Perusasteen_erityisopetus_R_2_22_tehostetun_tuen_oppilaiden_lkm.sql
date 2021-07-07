USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_Perusasteen_erityisopetus_R_2_22_tehostetun_tuen_oppilaiden_lkm]    Script Date: 6.7.2021 17:22:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[v_f_Perusasteen_erityisopetus_R_2_22_tehostetun_tuen_oppilaiden_lkm] AS

SELECT 
  tilv,
  oppilaitos=tunn,
  oppilaitoksen_taustatiedot_id=ISNULL(d6.id,-2),
  oppilaitoksen_sijainti_id=ISNULL(d9.id,-2),
  tiedtype,
  perusopetuksen_vuosiluokat,
  perusopetuksen_vuosiluokat_id=ISNULL(d1.id,-2),
  fakta.sukupuoli,
  sukupuoli_id=ISNULL(d2.id,-2),
  fakta.perusopetuksen_erityisen_tuen_paatos,
  perusopetuksen_erityisen_tuen_paatos_id=ISNULL(d3.id,-2),
  fakta.perusopetuksen_pidennetty_oppivelvollisuus,
  perusopetuksen_pidennetty_oppivelvollisuus_id=ISNULL(d4.id,-2),
  fakta.perusopetuksen_tehostettu_tuki,
  perusopetuksen_tehostettu_tuki_id=ISNULL(d5.id,-2),
  tehostetun_tuen_oppilaat
  
  FROM
  
(  

--2.22c
--2.22b:n saapuessa lisättävä se sekä vastaavat 2.22c negatiivisena tai muulla tavoin muodostettava lopun "kaatoluokat"
--tehdään sa-näkymä ja sen kohdetaulu vasta sopv22, jolloin aineisto ja raportointitoiveet toivottavasti vakiintuneet
SELECT 
  tilv,
  tunn,
  tiedtype = null,
  sukupuoli = '-1', 
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='-1',
  perusopetuksen_vuosiluokat='lk0',
  perusopetuksen_tehostettu_tuki='ertu_teho',
  tehostetun_tuen_oppilaat=tehoesi
FROM [TK_H9098_CSC].[dbo].[TK_K2_22c_sopv_21]
WHERE tehoesi>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  sukupuoli = '-1', 
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='-1',
  perusopetuksen_vuosiluokat='lk1_6',
  perusopetuksen_tehostettu_tuki='ertu_teho',
  tehostetun_tuen_oppilaat=teho16
FROM [TK_H9098_CSC].[dbo].[TK_K2_22c_sopv_21]
WHERE teho16>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  sukupuoli = '-1', 
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='-1',
  perusopetuksen_vuosiluokat='lk7_9',
  perusopetuksen_tehostettu_tuki='ertu_teho',
  tehostetun_tuen_oppilaat=teho79
FROM [TK_H9098_CSC].[dbo].[TK_K2_22c_sopv_21] 
WHERE teho79>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  sukupuoli = '-1', 
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='-1',
  perusopetuksen_vuosiluokat='lk10',
  perusopetuksen_tehostettu_tuki='ertu_teho',
  tehostetun_tuen_oppilaat=teholisa
FROM [TK_H9098_CSC].[dbo].[TK_K2_22c_sopv_21]
WHERE teholisa>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  sukupuoli = '-1', 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='-1',
  perusopetuksen_vuosiluokat='lk0',
  perusopetuksen_tehostettu_tuki='ertu_muu',
  tehostetun_tuen_oppilaat=ertuesi
FROM [TK_H9098_CSC].[dbo].[TK_K2_22c_sopv_21]
WHERE ertuesi>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  sukupuoli = '-1', 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='-1',
  perusopetuksen_vuosiluokat='lk1_6',
  perusopetuksen_tehostettu_tuki='ertu_muu',
  tehostetun_tuen_oppilaat=ertu16
FROM [TK_H9098_CSC].[dbo].[TK_K2_22c_sopv_21]
WHERE ertu16>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  sukupuoli = '-1', 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='-1',
  perusopetuksen_vuosiluokat='lk7_9',
  perusopetuksen_tehostettu_tuki='ertu_muu',
  tehostetun_tuen_oppilaat=ertu79
FROM [TK_H9098_CSC].[dbo].[TK_K2_22c_sopv_21] 
WHERE ertu79>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype = null,
  sukupuoli = '-1', 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='-1',
  perusopetuksen_vuosiluokat='lk10',
  perusopetuksen_tehostettu_tuki='ertu_muu',
  tehostetun_tuen_oppilaat=ertulisa
FROM [TK_H9098_CSC].[dbo].[TK_K2_22c_sopv_21]
WHERE ertulisa>0

UNION ALL

--2.22
SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, --nainen
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E',
  perusopetuksen_vuosiluokat='lk0', --esiopetus
  perusopetuksen_tehostettu_tuki='ertu_teho',
  tehostetun_tuen_oppilaat=tehoen
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE tehoen>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, --nainen
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk1',
  perusopetuksen_tehostettu_tuki='ertu_teho',
  tehostetun_tuen_oppilaat=teho1n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE teho1n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, --nainen
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk2',
  perusopetuksen_tehostettu_tuki='ertu_teho',
  tehostetun_tuen_oppilaat=teho2n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE teho2n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, --nainen
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk3',
  perusopetuksen_tehostettu_tuki='ertu_teho',
  tehostetun_tuen_oppilaat=teho3n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE teho3n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, --nainen
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk4',
  perusopetuksen_tehostettu_tuki='ertu_teho',
  tehostetun_tuen_oppilaat=teho4n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE teho4n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, --nainen
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk5',
  perusopetuksen_tehostettu_tuki='ertu_teho',
  tehostetun_tuen_oppilaat=teho5n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE teho5n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, --nainen
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk6',
  perusopetuksen_tehostettu_tuki='ertu_teho',
  tehostetun_tuen_oppilaat=teho6n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE teho6n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, --nainen
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk7',
  perusopetuksen_tehostettu_tuki='ertu_teho',
  tehostetun_tuen_oppilaat=teho7n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE teho7n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, --nainen
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk8',
  perusopetuksen_tehostettu_tuki='ertu_teho',
  tehostetun_tuen_oppilaat=teho8n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE teho8n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, --nainen
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk9',
  perusopetuksen_tehostettu_tuki='ertu_teho',
  tehostetun_tuen_oppilaat=teho9n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE teho9n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, --nainen
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk10',
  perusopetuksen_tehostettu_tuki='ertu_teho',
  tehostetun_tuen_oppilaat=teho10n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE teho10n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1,
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk0', --esiopetus
  perusopetuksen_tehostettu_tuki='ertu_teho',
  tehostetun_tuen_oppilaat=tehoe-tehoen
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE tehoe-tehoen>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1,
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk1',
  perusopetuksen_tehostettu_tuki='ertu_teho',
  tehostetun_tuen_oppilaat=teho1-teho1n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE teho1-teho1n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1,
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk2',
  perusopetuksen_tehostettu_tuki='ertu_teho',
  tehostetun_tuen_oppilaat=teho2-teho2n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE teho2-teho2n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1,
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk3',
  perusopetuksen_tehostettu_tuki='ertu_teho',
  tehostetun_tuen_oppilaat=teho3-teho3n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE teho3-teho3n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1,
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk4',
  perusopetuksen_tehostettu_tuki='ertu_teho',
  tehostetun_tuen_oppilaat=teho4-teho4n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE teho4-teho4n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1,
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk5',
  perusopetuksen_tehostettu_tuki='ertu_teho',
  tehostetun_tuen_oppilaat=teho5-teho5n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE teho5-teho5n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, 
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk6',
  perusopetuksen_tehostettu_tuki='ertu_teho',
  tehostetun_tuen_oppilaat=teho6-teho6n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE teho6-teho6n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, 
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk7',
  perusopetuksen_tehostettu_tuki='ertu_teho',
  tehostetun_tuen_oppilaat=teho7-teho7n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE teho7-teho7n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1,
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk8',
  perusopetuksen_tehostettu_tuki='ertu_teho',
  tehostetun_tuen_oppilaat=teho8-teho8n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE teho8-teho8n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, 
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk9',
  perusopetuksen_tehostettu_tuki='ertu_teho',
  tehostetun_tuen_oppilaat=teho9-teho9n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE teho9-teho9n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, --mies
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk10',
  perusopetuksen_tehostettu_tuki='ertu_teho',
  tehostetun_tuen_oppilaat=teho10-teho10n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE teho10-teho10n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, --nainen
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='E',
  perusopetuksen_vuosiluokat='lk0', --esiopetus
  perusopetuksen_tehostettu_tuki='ertu_muu',
  tehostetun_tuen_oppilaat=eipiden
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE eipiden>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, --nainen
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk1',
  perusopetuksen_tehostettu_tuki='ertu_muu',
  tehostetun_tuen_oppilaat=eipid1n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE eipid1n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, --nainen
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk2',
  perusopetuksen_tehostettu_tuki='ertu_muu',
  tehostetun_tuen_oppilaat=eipid2n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE eipid2n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, --nainen
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk3',
  perusopetuksen_tehostettu_tuki='ertu_muu',
  tehostetun_tuen_oppilaat=eipid3n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE eipid3n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, --nainen
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk4',
  perusopetuksen_tehostettu_tuki='ertu_muu',
  tehostetun_tuen_oppilaat=eipid4n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE eipid4n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, --nainen
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk5',
  perusopetuksen_tehostettu_tuki='ertu_muu',
  tehostetun_tuen_oppilaat=eipid5n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE eipid5n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, --nainen
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk6',
  perusopetuksen_tehostettu_tuki='ertu_muu',
  tehostetun_tuen_oppilaat=eipid6n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE eipid6n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, --nainen
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk7',
  perusopetuksen_tehostettu_tuki='ertu_muu',
  tehostetun_tuen_oppilaat=eipid7n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE eipid7n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, --nainen
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk8',
  perusopetuksen_tehostettu_tuki='ertu_muu',
  tehostetun_tuen_oppilaat=eipid8n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE eipid8n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, --nainen
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk9',
  perusopetuksen_tehostettu_tuki='ertu_muu',
  tehostetun_tuen_oppilaat=eipid9n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE eipid9n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, --nainen
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk10',
  perusopetuksen_tehostettu_tuki='ertu_muu',
  tehostetun_tuen_oppilaat=eipid10n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE eipid10n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='E',
  perusopetuksen_vuosiluokat='lk0', --esiopetus
  perusopetuksen_tehostettu_tuki='ertu_muu',
  tehostetun_tuen_oppilaat=eipide-eipiden
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE eipide-eipiden>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk1',
  perusopetuksen_tehostettu_tuki='ertu_muu',
  tehostetun_tuen_oppilaat=eipid1-eipid1n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE eipid1-eipid1n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk2',
  perusopetuksen_tehostettu_tuki='ertu_muu',
  tehostetun_tuen_oppilaat=eipid2-eipid2n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE eipid2-eipid2n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk3',
  perusopetuksen_tehostettu_tuki='ertu_muu',
  tehostetun_tuen_oppilaat=eipid3-eipid3n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE eipid3-eipid3n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk4',
  perusopetuksen_tehostettu_tuki='ertu_muu',
  tehostetun_tuen_oppilaat=eipid4-eipid4n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE eipid4-eipid4n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk5',
  perusopetuksen_tehostettu_tuki='ertu_muu',
  tehostetun_tuen_oppilaat=eipid5-eipid5n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE eipid5-eipid5n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk6',
  perusopetuksen_tehostettu_tuki='ertu_muu',
  tehostetun_tuen_oppilaat=eipid6-eipid6n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE eipid6-eipid6n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1,
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk7',
  perusopetuksen_tehostettu_tuki='ertu_muu',
  tehostetun_tuen_oppilaat=eipid7-eipid7n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE eipid7-eipid7n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk8',
  perusopetuksen_tehostettu_tuki='ertu_muu',
  tehostetun_tuen_oppilaat=eipid8-eipid8n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE eipid8-eipid8n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk9',
  perusopetuksen_tehostettu_tuki='ertu_muu',
  tehostetun_tuen_oppilaat=eipid9-eipid9n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE eipid9-eipid9n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk10',
  perusopetuksen_tehostettu_tuki='ertu_muu',
  tehostetun_tuen_oppilaat=eipid10-eipid10n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE eipid10-eipid10n>0


UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk0',
  perusopetuksen_tehostettu_tuki='ertu_v',
  tehostetun_tuen_oppilaat=ertuven
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertuven>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk1',
  perusopetuksen_tehostettu_tuki='ertu_v',
  tehostetun_tuen_oppilaat=ertuv1n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertuv1n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk2',
  perusopetuksen_tehostettu_tuki='ertu_v',
  tehostetun_tuen_oppilaat=ertuv2n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertuv2n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk3',
  perusopetuksen_tehostettu_tuki='ertu_v',
  tehostetun_tuen_oppilaat=ertuv3n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertuv3n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk4',
  perusopetuksen_tehostettu_tuki='ertu_v',
  tehostetun_tuen_oppilaat=ertuv4n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertuv4n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk5',
  perusopetuksen_tehostettu_tuki='ertu_v',
  tehostetun_tuen_oppilaat=ertuv5n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertuv5n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk6',
  perusopetuksen_tehostettu_tuki='ertu_v',
  tehostetun_tuen_oppilaat=ertuv6n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertuv6n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk7',
  perusopetuksen_tehostettu_tuki='ertu_v',
  tehostetun_tuen_oppilaat=ertuv7n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertuv7n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk8',
  perusopetuksen_tehostettu_tuki='ertu_v',
  tehostetun_tuen_oppilaat=ertuv8n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertuv8n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk9',
  perusopetuksen_tehostettu_tuki='ertu_v',
  tehostetun_tuen_oppilaat=ertuv9n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertuv9n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk10',
  perusopetuksen_tehostettu_tuki='ertu_v',
  tehostetun_tuen_oppilaat=ertuv10n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertuv10n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk0',
  perusopetuksen_tehostettu_tuki='ertu_v',
  tehostetun_tuen_oppilaat=ertuve-ertuven
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertuve-ertuven>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk1',
  perusopetuksen_tehostettu_tuki='ertu_v',
  tehostetun_tuen_oppilaat=ertuv1-ertuv1n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertuv1-ertuv1n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk2',
  perusopetuksen_tehostettu_tuki='ertu_v',
  tehostetun_tuen_oppilaat=ertuv2-ertuv2n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertuv2-ertuv2n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk3',
  perusopetuksen_tehostettu_tuki='ertu_v',
  tehostetun_tuen_oppilaat=ertuv3-ertuv3n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertuv3-ertuv3n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk4',
  perusopetuksen_tehostettu_tuki='ertu_v',
  tehostetun_tuen_oppilaat=ertuv4-ertuv4n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertuv4-ertuv4n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk5',
  perusopetuksen_tehostettu_tuki='ertu_v',
  tehostetun_tuen_oppilaat=ertuv5-ertuv5n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertuv5-ertuv5n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk6',
  perusopetuksen_tehostettu_tuki='ertu_v',
  tehostetun_tuen_oppilaat=ertuv6-ertuv6n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertuv6-ertuv6n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk7',
  perusopetuksen_tehostettu_tuki='ertu_v',
  tehostetun_tuen_oppilaat=ertuv7-ertuv7n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertuv7-ertuv7n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk8',
  perusopetuksen_tehostettu_tuki='ertu_v',
  tehostetun_tuen_oppilaat=ertuv8-ertuv8n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertuv8-ertuv8n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk9',
  perusopetuksen_tehostettu_tuki='ertu_v',
  tehostetun_tuen_oppilaat=ertuv9-ertuv9n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertuv9-ertuv9n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk10',
  perusopetuksen_tehostettu_tuki='ertu_v',
  tehostetun_tuen_oppilaat=ertuv10-ertuv10n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertuv10-ertuv10n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk0',
  perusopetuksen_tehostettu_tuki='ertu_m',
  tehostetun_tuen_oppilaat=ertumen
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertumen>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk1',
  perusopetuksen_tehostettu_tuki='ertu_m',
  tehostetun_tuen_oppilaat=ertum1n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertum1n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk2',
  perusopetuksen_tehostettu_tuki='ertu_m',
  tehostetun_tuen_oppilaat=ertum2n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertum2n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk3',
  perusopetuksen_tehostettu_tuki='ertu_m',
  tehostetun_tuen_oppilaat=ertum3n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertum3n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk4',
  perusopetuksen_tehostettu_tuki='ertu_m',
  tehostetun_tuen_oppilaat=ertum4n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertum4n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk5',
  perusopetuksen_tehostettu_tuki='ertu_m',
  tehostetun_tuen_oppilaat=ertum5n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertum5n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk6',
  perusopetuksen_tehostettu_tuki='ertu_m',
  tehostetun_tuen_oppilaat=ertum6n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertum6n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk7',
  perusopetuksen_tehostettu_tuki='ertu_m',
  tehostetun_tuen_oppilaat=ertum7n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertum7n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk8',
  perusopetuksen_tehostettu_tuki='ertu_m',
  tehostetun_tuen_oppilaat=ertum8n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertum8n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk9',
  perusopetuksen_tehostettu_tuki='ertu_m',
  tehostetun_tuen_oppilaat=ertum9n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertum9n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk10',
  perusopetuksen_tehostettu_tuki='ertu_m',
  tehostetun_tuen_oppilaat=ertum10n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertum10n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk0',
  perusopetuksen_tehostettu_tuki='ertu_m',
  tehostetun_tuen_oppilaat=ertume-ertumen
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertume-ertumen>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk1',
  perusopetuksen_tehostettu_tuki='ertu_m',
  tehostetun_tuen_oppilaat=ertum1-ertum1n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertum1-ertum1n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk2',
  perusopetuksen_tehostettu_tuki='ertu_m',
  tehostetun_tuen_oppilaat=ertum2-ertum2n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertum2-ertum2n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk3',
  perusopetuksen_tehostettu_tuki='ertu_m',
  tehostetun_tuen_oppilaat=ertum3-ertum3n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertum3-ertum3n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk4',
  perusopetuksen_tehostettu_tuki='ertu_m',
  tehostetun_tuen_oppilaat=ertum4-ertum4n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertum4-ertum4n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk5',
  perusopetuksen_tehostettu_tuki='ertu_m',
  tehostetun_tuen_oppilaat=ertum5-ertum5n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertum5-ertum5n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk6',
  perusopetuksen_tehostettu_tuki='ertu_m',
  tehostetun_tuen_oppilaat=ertum6-ertum6n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertum6-ertum6n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk7',
  perusopetuksen_tehostettu_tuki='ertu_m',
  tehostetun_tuen_oppilaat=ertum7-ertum7n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertum7-ertum7n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk8',
  perusopetuksen_tehostettu_tuki='ertu_m',
  tehostetun_tuen_oppilaat=ertum8-ertum8n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertum8-ertum8n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk9',
  perusopetuksen_tehostettu_tuki='ertu_m',
  tehostetun_tuen_oppilaat=ertum9-ertum9n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertum9-ertum9n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, 
  perusopetuksen_erityisen_tuen_paatos='K',
  perusopetuksen_pidennetty_oppivelvollisuus='K', 
  perusopetuksen_vuosiluokat='lk10',
  perusopetuksen_tehostettu_tuki='ertu_m',
  tehostetun_tuen_oppilaat=ertum10-ertum10n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE ertum10-ertum10n>0


--kaatoluokat

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, --nainen
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E',
  perusopetuksen_vuosiluokat='lk0', --esiopetus
  perusopetuksen_tehostettu_tuki='ertu_ei',
  tehostetun_tuen_oppilaat=tavoven
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE tavoven>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, --nainen
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk1',
  perusopetuksen_tehostettu_tuki='ertu_ei',
  tehostetun_tuen_oppilaat=tavov1n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE tavov1n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, --nainen
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk2',
  perusopetuksen_tehostettu_tuki='ertu_ei',
  tehostetun_tuen_oppilaat=tavov2n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE tavov2n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, --nainen
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk3',
  perusopetuksen_tehostettu_tuki='ertu_ei',
  tehostetun_tuen_oppilaat=tavov3n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE tavov3n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, --nainen
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk4',
  perusopetuksen_tehostettu_tuki='ertu_ei',
  tehostetun_tuen_oppilaat=tavov4n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE tavov4n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, --nainen
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk5',
  perusopetuksen_tehostettu_tuki='ertu_ei',
  tehostetun_tuen_oppilaat=tavov5n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE tavov5n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, --nainen
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk6',
  perusopetuksen_tehostettu_tuki='ertu_ei',
  tehostetun_tuen_oppilaat=tavov6n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE tavov6n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, --nainen
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk7',
  perusopetuksen_tehostettu_tuki='ertu_ei',
  tehostetun_tuen_oppilaat=tavov7n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE tavov7n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, --nainen
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk8',
  perusopetuksen_tehostettu_tuki='ertu_ei',
  tehostetun_tuen_oppilaat=tavov8n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE tavov8n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, --nainen
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk9',
  perusopetuksen_tehostettu_tuki='ertu_ei',
  tehostetun_tuen_oppilaat=tavov9n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE tavov9n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=2, --nainen
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk10',
  perusopetuksen_tehostettu_tuki='ertu_ei',
  tehostetun_tuen_oppilaat=tavov10n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE tavov10n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, --mies
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E',
  perusopetuksen_vuosiluokat='lk0', --esiopetus
  perusopetuksen_tehostettu_tuki='ertu_ei',
  tehostetun_tuen_oppilaat=tavove-tavoven
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE tavove-tavoven>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1, 
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk1',
  perusopetuksen_tehostettu_tuki='ertu_ei',
  tehostetun_tuen_oppilaat=tavov1-tavov1n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE tavov1-tavov1n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1,
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk2',
  perusopetuksen_tehostettu_tuki='ertu_ei',
  tehostetun_tuen_oppilaat=tavov2-tavov2n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE tavov2-tavov2n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1,
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk3',
  perusopetuksen_tehostettu_tuki='ertu_ei',
  tehostetun_tuen_oppilaat=tavov3-tavov3n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE tavov3-tavov3n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1,
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk4',
  perusopetuksen_tehostettu_tuki='ertu_ei',
  tehostetun_tuen_oppilaat=tavov4-tavov4n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE tavov4-tavov4n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1,
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk5',
  perusopetuksen_tehostettu_tuki='ertu_ei',
  tehostetun_tuen_oppilaat=tavov5-tavov5n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE tavov5-tavov5n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1,
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk6',
  perusopetuksen_tehostettu_tuki='ertu_ei',
  tehostetun_tuen_oppilaat=tavov6-tavov6n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE tavov6-tavov6n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1,
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk7',
  perusopetuksen_tehostettu_tuki='ertu_ei',
  tehostetun_tuen_oppilaat=tavov7-tavov7n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE tavov7-tavov7n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1,
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk8',
  perusopetuksen_tehostettu_tuki='ertu_ei',
  tehostetun_tuen_oppilaat=tavov8-tavov8n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE tavov8-tavov8n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1,
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk9',
  perusopetuksen_tehostettu_tuki='ertu_ei',
  tehostetun_tuen_oppilaat=tavov9-tavov9n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE tavov9-tavov9n>0

UNION ALL

SELECT 
  tilv,
  tunn,
  tiedtype,
  sukupuoli=1,
  perusopetuksen_erityisen_tuen_paatos='E',
  perusopetuksen_pidennetty_oppivelvollisuus='E', 
  perusopetuksen_vuosiluokat='lk10',
  perusopetuksen_tehostettu_tuki='ertu_ei',
  tehostetun_tuen_oppilaat=tavov10-tavov10n
FROM [VipunenTK_DW].[dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
WHERE tavov10-tavov10n>0


) fakta


LEFT JOIN VipunenTK.dbo.d_perusopetuksen_vuosiluokat d1
ON d1.vuosiluokka_koodi=fakta.perusopetuksen_vuosiluokat 
 
LEFT JOIN VipunenTK.dbo.d_sukupuoli d2
ON d2.sukupuoli_koodi=fakta.sukupuoli

LEFT JOIN  VipunenTK.dbo.d_perusopetuksen_erityisen_tuen_paatos d3
ON d3.perusopetuksen_erityisen_tuen_paatos_koodi=fakta.perusopetuksen_erityisen_tuen_paatos

LEFT JOIN  VipunenTK.dbo.d_perusopetuksen_pidennetty_oppivelvollisuus d4
ON d4.perusopetuksen_pidennetty_oppivelvollisuus_koodi=fakta.perusopetuksen_pidennetty_oppivelvollisuus

LEFT JOIN VipunenTK.dbo.d_perusopetuksen_tehostettu_tuki d5
ON d5.perusopetuksen_tehostettu_tuki_koodi=fakta.perusopetuksen_tehostettu_tuki

LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot d6
ON d6.oppilaitoskoodi=fakta.tunn

LEFT JOIN VipunenTK.dbo.d_alueluokitus d9
ON d9.alueluokitus_avain=d6.sijaintikuntakoodi




GO


