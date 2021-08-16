USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_Moninkertainen_haku_aiemmat_tutkinnot]    Script Date: 6.4.2021 20:46:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[v_f_Moninkertainen_haku_aiemmat_tutkinnot] AS
--Palauttaa moninkertaisen haun aineistosta K3.16 aiemmat tutkinnot
--Select * from VipunenTK_DW.dbo.v_f_Moninkertainen_haku_aiemmat_tutkinnot

--Delete from VipunenTK.dbo.f_Moninkertainen_haku_aiemmat_tutkinnot 
--Insert into VipunenTK.dbo.f_Moninkertainen_haku_aiemmat_tutkinnot Select * from VipunenTK_DW.dbo.v_f_Moninkertainen_haku_aiemmat_tutkinnot 

-- aiemmin suoritetut tutkinnot, yo
SELECT 
	   --CSC Jarmo 12.9.2014
	   --Kommentoidut tiedot löytyvät hakijan tiedoista. Niitä on turha monistaa joka faktatauluun. Rivinumero linkittää eri faktataulut.
	   --[Tilastovuosi]
    --  ,[tilv_date]
    --  ,[Sukupuoli_avain]
    --  ,sukupuoli_id = isnull(d_sp.id, -2)
    --  ,f.[Ika]
    --  ,Ika_id = isnull(d_ika.id, -2)
    --  ,[Syntymavuosi]
    --  ,[Aidinkielir1_avain]
    --  ,Aidinkielir1_id = isnull(d_ak.id, -2)
    --  ,[Kotikunta_vuotta_aiemmin_avain]
    --  ,Kotikunta_vuotta_aiemmin_id = isnull(d_al.id, -2)
    --  ,[Hetuntila_avain]
    --  ,Hetuntila_id = isnull(d_ho.id, -2)
    --  ,[Toiminta_vuotta_aiemmin_avain]
    --  ,Toiminta_vuotta_aiemmin_id = isnull(d_pt.id, -2)
    Aiemmin_suoritettu_tutkinto_oppilaitos_avain,
    Aiemmin_suoritettu_tutkinto_oppilaitos_id = isnull(d_ol.id, -2),
    Aiemmin_suoritettu_tutkinto_oppilaitoksen_alueluokitus_avain = d_ol.sijaintikuntakoodi,
    Aiemmin_suoritettu_tutkinto_oppilaitoksen_alueluokitus_id = isnull(d_ol_al.id, -2),
	Aiemmin_suoritettu_tutkinto_koulutusluokitus_avain,
	Aiemmin_suoritettu_tutkinto_koulutusluokitus_id = ISNULL(d_kl.id, -2),
	Aiemmin_suoritettu_tutkinto_suoritusvuosi,
	Aiemmin_suoritettu_tutkinto_ika,
	Aiemmin_suoritettu_tutkinto_ajankohta_id = ISNULL(d_sa.id, -2),
	Aiemmin_suoritettu_tutkinto_sektori,
	Aiemmin_suoritettu_tutkinto_sektori_id = ISNULL(d_tu.id, -2),
	Aiemmin_suoritettu_tutkinto_tuorein = Cast(Aiemmin_suoritettu_tutkinto_tuorein as nvarchar(50)),
	lkm, 
	f.tietolahde,
	rivinumero
FROM ( --f

SELECT 
Tilastovuosi, 
tilv_date, 
Sukupuoli_avain, 
Ika, 
Syntymavuosi, 
Aidinkielir1_avain, 
Kotikunta_vuotta_aiemmin_avain,  
Hetuntila_avain = htok,
Toiminta_vuotta_aiemmin_avain = ptoim1r3x,
Aiemmin_suoritettu_tutkinto_oppilaitos_avain = tunnyotutk,
Aiemmin_suoritettu_tutkinto_koulutusluokitus_avain = aikyotutkkoulk,
Aiemmin_suoritettu_tutkinto_suoritusvuosi = suvuosiyotutk,
Aiemmin_suoritettu_tutkinto_ika = Case when suvuosiyotutk <> '' then Cast(Tilastovuosi as integer) - Cast(suvuosiyotutk as integer) else NULL end,
Aiemmin_suoritettu_tutkinto_sektori = 'yo',
Aiemmin_suoritettu_tutkinto_tuorein = Case 
	when suvuosiyotutk <> '' 
	 and coalesce(suvuosiyotutk, 0) >= coalesce(suvuosiyotutk, 0)
	 and coalesce(suvuosiyotutk, 0) >= coalesce(suvuosiamm, 0)
	 and coalesce(suvuosiyotutk, 0) >= coalesce(suvuosiamk, 0)
	 and coalesce(suvuosiyotutk, 0) >= coalesce(suvuosiylamk, 0)
	 and coalesce(suvuosiyotutk, 0) >= coalesce(suvuosialkk, 0)
	 and coalesce(suvuosiyotutk, 0) >= coalesce(suvuosiylkk, 0)
	 and coalesce(suvuosiyotutk, 0) >= coalesce(suvuosilistri, 0)
	then 'K' else 'E' end,
lkm, 
tietolahde,
rivinumero
FROM VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
WHERE aikyotutk='K'

UNION ALL
-- aiemmin suoritetut tutkinnot, amm
SELECT 
Tilastovuosi, 
tilv_date, 
Sukupuoli_avain, 
Ika, 
Syntymavuosi, 
Aidinkielir1_avain, 
Kotikunta_vuotta_aiemmin_avain,  
Hetuntila_avain = htok,
Toiminta_vuotta_aiemmin_avain = ptoim1r3x,
Aiemmin_suoritettu_tutkinto_oppilaitos_avain = tunnamm,
Aiemmin_suoritettu_tutkinto_koulutusluokitus_avain = aikammkoulk,
Aiemmin_suoritettu_tutkinto_suoritusvuosi = suvuosiamm,
Aiemmin_suoritettu_tutkinto_ika = Case when suvuosiamm <> '' then Cast(Tilastovuosi as integer) - Cast(suvuosiamm as integer) else NULL end,
Aiemmin_suoritettu_tutkinto_sektori = 'amm',
Aiemmin_suoritettu_tutkinto_tuorein = Case 
	when suvuosiamm <> '' 
	 and coalesce(suvuosiamm, 0) >= coalesce(suvuosiyotutk, 0)
	 and coalesce(suvuosiamm, 0) >= coalesce(suvuosiamm, 0)
	 and coalesce(suvuosiamm, 0) >= coalesce(suvuosiamk, 0)
	 and coalesce(suvuosiamm, 0) >= coalesce(suvuosiylamk, 0)
	 and coalesce(suvuosiamm, 0) >= coalesce(suvuosialkk, 0)
	 and coalesce(suvuosiamm, 0) >= coalesce(suvuosiylkk, 0)
	 and coalesce(suvuosiamm, 0) >= coalesce(suvuosilistri, 0)
	then 'K' else 'E' end,
lkm, 
tietolahde,
rivinumero
FROM VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
WHERE aikamm='K'

UNION ALL
-- aiemmin suoritetut tutkinnot, amk
SELECT 
Tilastovuosi, 
tilv_date, 
Sukupuoli_avain, 
Ika, 
Syntymavuosi, 
Aidinkielir1_avain, 
Kotikunta_vuotta_aiemmin_avain,  
Hetuntila_avain = htok,
Toiminta_vuotta_aiemmin_avain = ptoim1r3x,
Aiemmin_suoritettu_tutkinto_oppilaitos_avain = tunnamk,
Aiemmin_suoritettu_tutkinto_koulutusluokitus_avain = aikamkkoulk,
Aiemmin_suoritettu_tutkinto_suoritusvuosi = suvuosiamk,
Aiemmin_suoritettu_tutkinto_ika = Case when suvuosiamk <> '' then Cast(Tilastovuosi as integer) - Cast(suvuosiamk as integer) else NULL end,
Aiemmin_suoritettu_tutkinto_sektori = 'amk',
Aiemmin_suoritettu_tutkinto_tuorein = Case 
	when suvuosiamk <> '' 
	 and coalesce(suvuosiamk, 0) >= coalesce(suvuosiyotutk, 0)
	 and coalesce(suvuosiamk, 0) >= coalesce(suvuosiamm, 0)
	 and coalesce(suvuosiamk, 0) >= coalesce(suvuosiamk, 0)
	 and coalesce(suvuosiamk, 0) >= coalesce(suvuosiylamk, 0)
	 and coalesce(suvuosiamk, 0) >= coalesce(suvuosialkk, 0)
	 and coalesce(suvuosiamk, 0) >= coalesce(suvuosiylkk, 0)
	 and coalesce(suvuosiamk, 0) >= coalesce(suvuosilistri, 0)
	then 'K' else 'E' end,
lkm, 
tietolahde,
rivinumero
FROM VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
WHERE aikamk='K'

UNION ALL
-- aiemmin suoritetut tutkinnot, ylamk
SELECT 
Tilastovuosi, 
tilv_date, 
Sukupuoli_avain, 
Ika, 
Syntymavuosi, 
Aidinkielir1_avain, 
Kotikunta_vuotta_aiemmin_avain,  
Hetuntila_avain = htok,
Toiminta_vuotta_aiemmin_avain = ptoim1r3x,
Aiemmin_suoritettu_tutkinto_oppilaitos_avain = tunnylamk,
Aiemmin_suoritettu_tutkinto_koulutusluokitus_avain = aikylamkkoulk,
Aiemmin_suoritettu_tutkinto_suoritusvuosi = suvuosiylamk,
Aiemmin_suoritettu_tutkinto_ika = Case when suvuosiylamk <> '' then Cast(Tilastovuosi as integer) - Cast(suvuosiylamk as integer) else NULL end,
Aiemmin_suoritettu_tutkinto_sektori = 'ylamk',
Aiemmin_suoritettu_tutkinto_tuorein = Case 
	when suvuosiylamk <> '' 
	 and coalesce(suvuosiylamk, 0) >= coalesce(suvuosiyotutk, 0)
	 and coalesce(suvuosiylamk, 0) >= coalesce(suvuosiamm, 0)
	 and coalesce(suvuosiylamk, 0) >= coalesce(suvuosiamk, 0)
	 and coalesce(suvuosiylamk, 0) >= coalesce(suvuosiylamk, 0)
	 and coalesce(suvuosiylamk, 0) >= coalesce(suvuosialkk, 0)
	 and coalesce(suvuosiylamk, 0) >= coalesce(suvuosiylkk, 0)
	 and coalesce(suvuosiylamk, 0) >= coalesce(suvuosilistri, 0)
	then 'K' else 'E' end,
lkm, 
tietolahde,
rivinumero
FROM VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
WHERE aikylamk='K'

UNION ALL
-- aiemmin suoritetut tutkinnot, alkk
SELECT 
Tilastovuosi, 
tilv_date, 
Sukupuoli_avain, 
Ika, 
Syntymavuosi, 
Aidinkielir1_avain, 
Kotikunta_vuotta_aiemmin_avain,  
Hetuntila_avain = htok,
Toiminta_vuotta_aiemmin_avain = ptoim1r3x,
Aiemmin_suoritettu_tutkinto_oppilaitos_avain = tunnalkk,
Aiemmin_suoritettu_tutkinto_koulutusluokitus_avain = aikalkkkoulk,
Aiemmin_suoritettu_tutkinto_suoritusvuosi = suvuosialkk,
Aiemmin_suoritettu_tutkinto_ika = Case when suvuosialkk <> '' then Cast(Tilastovuosi as integer) - Cast(suvuosialkk as integer) else NULL end,
Aiemmin_suoritettu_tutkinto_sektori = 'alkk',
Aiemmin_suoritettu_tutkinto_tuorein = Case 
	when suvuosialkk <> '' 
	 and coalesce(suvuosialkk, 0) >= coalesce(suvuosiyotutk, 0)
	 and coalesce(suvuosialkk, 0) >= coalesce(suvuosiamm, 0)
	 and coalesce(suvuosialkk, 0) >= coalesce(suvuosiamk, 0)
	 and coalesce(suvuosialkk, 0) >= coalesce(suvuosiylamk, 0)
	 and coalesce(suvuosialkk, 0) >= coalesce(suvuosialkk, 0)
	 and coalesce(suvuosialkk, 0) >= coalesce(suvuosiylkk, 0)
	 and coalesce(suvuosialkk, 0) >= coalesce(suvuosilistri, 0)
	then 'K' else 'E' end,
lkm, 
tietolahde,
rivinumero
FROM VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
WHERE aikalkk='K'

UNION ALL
-- aiemmin suoritetut tutkinnot, ylkk
SELECT 
Tilastovuosi, 
tilv_date, 
Sukupuoli_avain, 
Ika, 
Syntymavuosi, 
Aidinkielir1_avain, 
Kotikunta_vuotta_aiemmin_avain,  
Hetuntila_avain = htok,
Toiminta_vuotta_aiemmin_avain = ptoim1r3x,
Aiemmin_suoritettu_tutkinto_oppilaitos_avain = tunnylkk,
Aiemmin_suoritettu_tutkinto_koulutusluokitus_avain = aikylkkkoulk,
Aiemmin_suoritettu_tutkinto_suoritusvuosi = suvuosiylkk,
Aiemmin_suoritettu_tutkinto_ika = Case when suvuosiylkk <> '' then Cast(Tilastovuosi as integer) - Cast(suvuosiylkk as integer) else NULL end,
Aiemmin_suoritettu_tutkinto_sektori = 'ylkk',
Aiemmin_suoritettu_tutkinto_tuorein = Case 
	when suvuosiylkk <> '' 
	 and coalesce(suvuosiylkk, 0) >= coalesce(suvuosiyotutk, 0)
	 and coalesce(suvuosiylkk, 0) >= coalesce(suvuosiamm, 0)
	 and coalesce(suvuosiylkk, 0) >= coalesce(suvuosiamk, 0)
	 and coalesce(suvuosiylkk, 0) >= coalesce(suvuosiylamk, 0)
	 and coalesce(suvuosiylkk, 0) >= coalesce(suvuosialkk, 0)
	 and coalesce(suvuosiylkk, 0) >= coalesce(suvuosiylkk, 0)
	 and coalesce(suvuosiylkk, 0) >= coalesce(suvuosilistri, 0)
	then 'K' else 'E' end,
lkm, 
tietolahde,
rivinumero
FROM VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
WHERE aikylkk='K'

UNION ALL
-- aiemmin suoritetut tutkinnot, listri
SELECT 
Tilastovuosi, 
tilv_date, 
Sukupuoli_avain, 
Ika, 
Syntymavuosi, 
Aidinkielir1_avain, 
Kotikunta_vuotta_aiemmin_avain,  
Hetuntila_avain = htok,
Toiminta_vuotta_aiemmin_avain = ptoim1r3x,
Aiemmin_suoritettu_tutkinto_oppilaitos_avain = tunnlistri,
Aiemmin_suoritettu_tutkinto_koulutusluokitus_avain = aiklistrikoulk,
Aiemmin_suoritettu_tutkinto_suoritusvuosi = suvuosilistri,
Aiemmin_suoritettu_tutkinto_ika = Case when suvuosilistri <> '' then Cast(Tilastovuosi as integer) - Cast(suvuosilistri as integer) else NULL end,
Aiemmin_suoritettu_tutkinto_sektori = 'listri',
Aiemmin_suoritettu_tutkinto_tuorein = Case 
	when suvuosilistri <> '' 
	 and coalesce(suvuosilistri, 0) >= coalesce(suvuosiyotutk, 0)
	 and coalesce(suvuosilistri, 0) >= coalesce(suvuosiamm, 0)
	 and coalesce(suvuosilistri, 0) >= coalesce(suvuosiamk, 0)
	 and coalesce(suvuosilistri, 0) >= coalesce(suvuosiylamk, 0)
	 and coalesce(suvuosilistri, 0) >= coalesce(suvuosialkk, 0)
	 and coalesce(suvuosilistri, 0) >= coalesce(suvuosiylkk, 0)
	 and coalesce(suvuosilistri, 0) >= coalesce(suvuosilistri, 0)
	then 'K' else 'E' end,
lkm, 
tietolahde,
rivinumero
FROM VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
WHERE aiklistri='K'

UNION ALL
-- ei aiemmin suoritettuja tutkintoja
SELECT 
Tilastovuosi, 
tilv_date, 
Sukupuoli_avain, 
Ika, 
Syntymavuosi, 
Aidinkielir1_avain, 
Kotikunta_vuotta_aiemmin_avain,  
Hetuntila_avain = htok,
Toiminta_vuotta_aiemmin_avain = ptoim1r3x,
Aiemmin_suoritettu_tutkinto_oppilaitos_avain = '-1',
Aiemmin_suoritettu_tutkinto_koulutusluokitus_avain = '-1',
Aiemmin_suoritettu_tutkinto_suoritusvuosi = '-1',
Aiemmin_suoritettu_tutkinto_ika = -1,
Aiemmin_suoritettu_tutkinto_sektori = 'ei',
Aiemmin_suoritettu_tutkinto_tuorein = 'E',
lkm, 
tietolahde,
rivinumero
FROM VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
WHERE Coalesce(aikyotutk,'')<>'K' and Coalesce(aikamm,'')<>'K' and Coalesce(aikamk,'')<>'K' and Coalesce(aikylamk,'')<>'K' and Coalesce(aikalkk,'')<>'K' and Coalesce(aikylkk,'')<>'K' and Coalesce(aiklistri,'')<>'K'

) f
--LEFT JOIN VipunenTK.dbo.d_sukupuoli d_sp
--	ON d_sp.sukupuoli_koodi = f.sukupuoli_avain
--LEFT JOIN VipunenTK.dbo.d_ika 
--	ON d_ika.ika_avain = Cast(f.Ika as nvarchar(10))
--LEFT JOIN VipunenTK.dbo.d_aidinkieli_versio1 d_ak
--	ON d_ak.aidinkieli_versio1_koodi = f.Aidinkielir1_avain
--LEFT JOIN VipunenTK.dbo.d_alueluokitus d_al
--	ON d_al.alueluokitus_avain = f.Kotikunta_vuotta_aiemmin_avain
--LEFT JOIN VipunenTK.dbo.d_hetu_ok d_ho
--	ON d_ho.hetu_ok_avain = f.Hetuntila_avain
--LEFT JOIN VipunenTK.dbo.d_paaasiallinen_toiminta d_pt
--	ON d_pt.paaasiallinen_toiminta_koodi = f.Toiminta_vuotta_aiemmin_avain
LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot d_ol
	ON d_ol.oppilaitos_avain = f.Aiemmin_suoritettu_tutkinto_oppilaitos_avain
LEFT JOIN VipunenTK.dbo.d_alueluokitus d_ol_al
	ON d_ol_al.alueluokitus_avain = d_ol.sijaintikuntakoodi
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d_kl
	ON d_kl.koulutusluokitus_avain = f.Aiemmin_suoritettu_tutkinto_koulutusluokitus_avain
LEFT JOIN VipunenTK.dbo.d_tutkinto d_tu
	ON d_tu.tutkinto_avain = f.Aiemmin_suoritettu_tutkinto_sektori
LEFT JOIN VipunenTK.dbo.d_suhteellinen_ajankohta d_sa
	ON d_sa.suhteellinen_ajankohta_avain = 
		Cast(case 
			when f.Aiemmin_suoritettu_tutkinto_ika=-1 then 'tilv-ei'
			when f.Aiemmin_suoritettu_tutkinto_ika=0 then 'tilv'
			when f.Aiemmin_suoritettu_tutkinto_ika between 1 and 10 then 'tilv-' + Cast(f.Aiemmin_suoritettu_tutkinto_ika as nvarchar(2))
			when f.Aiemmin_suoritettu_tutkinto_ika>10 then 'tilv-yli10'
			else '-1' end as nvarchar(10))


GO


