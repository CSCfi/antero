USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_Moninkertainen_haku_uudet_haut]    Script Date: 18.5.2018 10:32:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








ALTER VIEW [dbo].[v_f_Moninkertainen_haku_uudet_haut] AS
--Palauttaa moninkertaisen haun aineistosta K3.16 uudet haut
--Select * into VipunenTK.dbo.f_Moninkertainen_haku_uudet_haut from VipunenTK_DW.dbo.v_f_Moninkertainen_haku_uudet_haut

--Delete from VipunenTK.dbo.f_Moninkertainen_haku_uudet_haut 
--Insert into VipunenTK.dbo.f_Moninkertainen_haku_uudet_haut Select * from VipunenTK_DW.dbo.v_f_Moninkertainen_haku_uudet_haut 

-- Uudet haut, haku luamm, prioriteetti 1
SELECT 
	   --CSC Jarmo 11.9.2014
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
       Hakukohde_avain
      ,Hakukohde_id = ISNULL(d_hk.id, -2)
      ,Hakukohde_oppilaitos_avain
      ,Hakukohde_oppilaitos_id = isnull(d_ol.id, -2)
      ,Hakukohde_oppilaitoksen_alueluokitus_avain = d_ol.sijaintikuntakoodi
      ,Hakukohde_oppilaitoksen_alueluokitus_id = isnull(d_ol_al.id, -2)
      ,Hakukohde_koulutusaste2002_avain
	  ,Hakukohde_koulutusaste2002_id = isnull(d_ka02.id, -1)
	  ,Hakukohde_koulutusaste_taso2_avain
	  ,Hakukohde_koulutusaste_taso2_id = isnull(d_kastet2.id, -1)
	  ,Hakukohde_opintoala2002_avain
	  ,Hakukohde_opintoala2002_id = isnull(d_oa02.id, -1)
	  ,Hakukohde_opintoala1995_avain
	  ,Hakukohde_opintoala1995_id = isnull(d_oa95.id, -1)
	  ,Hakukohde_koulutusala_taso1_avain = Hakukohde_iscfibroad2013_avain
	  ,Hakukohde_koulutusala_taso1_id = isnull(d_iscfibroad.id, -1)
	  ,Hakukohde_prioriteetti_avain
	  ,Hakukohde_prioriteetti_id = isnull(d_hp.id, -2)
	  ,f.Hakukohde_hyvaksytty
	  ,f.Hakukohde_vastaanotettu
	  ,Hakukohteen_tulos_id = isnull(d_ht.id, -2)
	  ,f.Hakukohde_tutkinnon_taso
	  ,f.Hakukohde_tutkinnon_taso_tarkennus
	  ,Hakukohde_tutkinnon_taso_id = isnull(d_htt.id, -1)
	  ,f.Hakukohde_erillisvalinta
	  ,Hakukohde_erillisvalinta_id = isnull(d_hev.id, -1)
	  ,Hakukohde_koulutuksen_alkamislukukausi_avain
	  ,Hakukohde_koulutuksen_alkamislukukausi_id = isnull(d_kau.kausi_id, -2)

--Johdetut muuttujat
	  ,Johdettu_Sama_koulutusaste02_Aiempi_tutkinto_Haku = CAST(Johdettu_Sama_koulutusaste02_Aiempi_tutkinto_Haku as nvarchar(50))
	  ,Johdettu_Sama_koulutusaste02_Aiempi_opiskelu_Haku = CAST(Johdettu_Sama_koulutusaste02_Aiempi_opiskelu_Haku as nvarchar(50))
	  ,Johdettu_Sama_opintoala95_Aiempi_tutkinto_Haku = CAST(Johdettu_Sama_opintoala95_Aiempi_tutkinto_Haku as nvarchar(50))
	  ,Johdettu_Sama_opintoala95_Aiempi_opiskelu_Haku = CAST(Johdettu_Sama_opintoala95_Aiempi_opiskelu_Haku as nvarchar(50))
	  ,Johdettu_Sama_opintoala02_Aiempi_tutkinto_Haku = CAST(Johdettu_Sama_opintoala02_Aiempi_tutkinto_Haku as nvarchar(50))
	  ,Johdettu_Sama_opintoala02_Aiempi_opiskelu_Haku = CAST(Johdettu_Sama_opintoala02_Aiempi_opiskelu_Haku as nvarchar(50))
	  ,Johdettu_Sama_koulutusala95_Aiempi_tutkinto_Haku = CAST(Johdettu_Sama_koulutusala95_Aiempi_tutkinto_Haku as nvarchar(50))
	  ,Johdettu_Sama_koulutusala95_Aiempi_opiskelu_Haku = CAST(Johdettu_Sama_koulutusala95_Aiempi_opiskelu_Haku as nvarchar(50))
	  ,Johdettu_Sama_koulutusala02_Aiempi_tutkinto_Haku = CAST(Johdettu_Sama_koulutusala02_Aiempi_tutkinto_Haku as nvarchar(50))
	  ,Johdettu_Sama_koulutusala02_Aiempi_opiskelu_Haku = CAST(Johdettu_Sama_koulutusala02_Aiempi_opiskelu_Haku as nvarchar(50))
	  ,Johdettu_Sama_oppilaitos_Aiempi_tutkinto_Haku = CAST(Johdettu_Sama_oppilaitos_Aiempi_tutkinto_Haku as nvarchar(50))
	  ,Johdettu_Sama_oppilaitos_Aiempi_opiskelu_Haku = CAST(Johdettu_Sama_oppilaitos_Aiempi_opiskelu_Haku as nvarchar(50))
	  ,Johdettu_Sama_sektori_Aiempi_tutkinto_Haku = CAST(Johdettu_Sama_sektori_Aiempi_tutkinto_Haku as nvarchar(50))
	  ,Johdettu_Sama_sektori_Aiempi_opiskelu_Haku = CAST(Johdettu_Sama_sektori_Aiempi_opiskelu_Haku as nvarchar(50))
	  ,Johdettu_Sama_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = CAST(Johdettu_Sama_sektori_Aiempi_tutkinto_tai_opiskelu_Haku as nvarchar(50))
	  ,Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_Haku = CAST(Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_Haku as nvarchar(50))
	  ,Johdettu_Sama_laaja_sektori_Aiempi_opiskelu_Haku = CAST(Johdettu_Sama_laaja_sektori_Aiempi_opiskelu_Haku as nvarchar(50))
	  ,Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = CAST(Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_tai_opiskelu_Haku as nvarchar(50))
	  ,Johdettu_Hakenut_Amk_ja_Yo = Cast(Johdettu_Hakenut_Amk_ja_Yo as nvarchar(50))
	  ,Johdettu_Hakenut_Korkea_aste_ja_Toinen_aste = Cast(Johdettu_Hakenut_Korkea_aste_ja_Toinen_aste as nvarchar(50))
	  ,Johdettu_Hakenut_Lukio_ja_Ammatillinen_koulutus = Cast(Johdettu_Hakenut_Lukio_ja_Ammatillinen_koulutus as nvarchar(50))

	  ,[lkm]
      ,f.[tietolahde]
      ,[rivinumero]
FROM ( --f


-- Uudet haut, haku luamm, prioriteetti 1
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
Haku_avain = Case when luammhaku1_opmast='31' then 'lu' else 'amm' end, --'luamm',
Hakukohde_oppilaitos_avain = luammhaku1_tunn, 
Hakukohde_koulutusaste2002_avain = luammhaku1_opmast_avain, 
Hakukohde_koulutusaste_taso2_avain = luammhaku1_kaste_t2_avain, 
Hakukohde_opintoala2002_avain = luammhaku1_opmopa_avain, 
Hakukohde_opintoala1995_avain = luammhaku1_opm95opa_avain, 
Hakukohde_iscfibroad2013_avain = luammhaku1_iscfibroad2013_avain, 
Hakukohde_prioriteetti_avain = 'pr_1', 
Hakukohde_hyvaksytty = luammhaku1_hyv,
Hakukohde_vastaanotettu = luammhaku1_vastotto,
Hakukohde_tutkinnon_taso = '-1',
Hakukohde_tutkinnon_taso_tarkennus = '-1',
Hakukohde_erillisvalinta = '-1',
Hakukohde_koulutuksen_alkamislukukausi_avain = Koulutuksen_alkamislukukausi_avain,
--Johdettu_Hakija_opiskelee_hakukohteessa = Case when luammhaku1_tunn in (yotutkopisxtunn, ammopisxtunn) then 'K' else 'E' end,	
Johdettu_Sama_koulutusaste02_Aiempi_tutkinto_Haku = Case when luammhaku1_opmast in (aikyotutkkoulk_opmast, aikammkoulk_opmast, aikamkkoulk_opmast, aikylamkkoulk_opmast, aikalkkkoulk_opmast, aikylkkkoulk_opmast, aiklistrikoulk_opmast) then 'K' else 'E' end, 
Johdettu_Sama_koulutusaste02_Aiempi_opiskelu_Haku = Case when luammhaku1_opmast in (yotutkopisxkoulk_opmast, ammopisxkoulk_opmast, amkopisxkoulk1_opmast, amkopisxkoulk2_opmast, amkopisxkoulk3_opmast, yoopisxkoulk1_opmast, yoopisxkoulk2_opmast, yoopisxkoulk3_opmast) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_tutkinto_Haku = case when luammhaku1_opm95opa  in (aikyotutkkoulk_opm95opa, aikammkoulk_opm95opa, aikamkkoulk_opm95opa, aikylamkkoulk_opm95opa, aikalkkkoulk_opm95opa, aikylkkkoulk_opm95opa, aiklistrikoulk_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_opiskelu_Haku = Case when luammhaku1_opm95opa in (yotutkopisxkoulk_opm95opa, ammopisxkoulk_opm95opa, amkopisxkoulk1_opm95opa, amkopisxkoulk2_opm95opa, amkopisxkoulk3_opm95opa, yoopisxkoulk1_opm95opa, yoopisxkoulk2_opm95opa, yoopisxkoulk3_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_tutkinto_Haku = Case when luammhaku1_opmopa in (aikyotutkkoulk_opmopa, aikammkoulk_opmopa, aikamkkoulk_opmopa, aikylamkkoulk_opmopa, aikalkkkoulk_opmopa, aikylkkkoulk_opmopa, aiklistrikoulk_opmopa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_opiskelu_Haku = Case when luammhaku1_opmopa in (yotutkopisxkoulk_opmopa, ammopisxkoulk_opmopa, amkopisxkoulk1_opmopa, amkopisxkoulk2_opmopa, amkopisxkoulk3_opmopa, yoopisxkoulk1_opmopa, yoopisxkoulk2_opmopa, yoopisxkoulk3_opmopa) then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_tutkinto_Haku = case when luammhaku1_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2)  in (aikyotutkkoulk_opm95ala, aikammkoulk_opm95ala, aikamkkoulk_opm95ala, aikylamkkoulk_opm95ala, aikalkkkoulk_opm95ala, aikylkkkoulk_opm95ala, aiklistrikoulk_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_opiskelu_Haku = Case when luammhaku1_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2) in (yotutkopisxkoulk_opm95ala, ammopisxkoulk_opm95ala, amkopisxkoulk1_opm95ala, amkopisxkoulk2_opm95ala, amkopisxkoulk3_opm95ala, yoopisxkoulk1_opm95ala, yoopisxkoulk2_opm95ala, yoopisxkoulk3_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_tutkinto_Haku = Case when luammhaku1_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (aikyotutkkoulk_opmala, aikammkoulk_opmala, aikamkkoulk_opmala, aikylamkkoulk_opmala, aikalkkkoulk_opmala, aikylkkkoulk_opmala, aiklistrikoulk_opmala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_opiskelu_Haku = Case when luammhaku1_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (yotutkopisxkoulk_opmala, ammopisxkoulk_opmala, amkopisxkoulk1_opmala, amkopisxkoulk2_opmala, amkopisxkoulk3_opmala, yoopisxkoulk1_opmala, yoopisxkoulk2_opmala, yoopisxkoulk3_opmala))
  then 'K' else 'E' end,
Johdettu_Sama_oppilaitos_Aiempi_tutkinto_Haku = Case when luammhaku1_tunn in (tunnyotutk, tunnamm, tunnamk, tunnylamk, tunnalkk, tunnylkk, tunnlistri) then 'K' else 'E' end,	
Johdettu_Sama_oppilaitos_Aiempi_opiskelu_Haku = Case when luammhaku1_tunn in (yotutkopisxtunn, ammopisxtunn, amkopisxtunn1, amkopisxtunn2, amkopisxtunn3, yoopisxtunn1, yoopisxtunn2, yoopisxtunn3) then 'K' else 'E' end,	
Johdettu_Sama_sektori_Aiempi_tutkinto_Haku = Case when luammhaku1_opmast='31' 
	then --lu
	Case when 'K' in (aikyotutk) then 'K' else 'E' end
	else --amm
	Case when 'K' in (aikamm) then 'K' else 'E' end
	end,	
Johdettu_Sama_sektori_Aiempi_opiskelu_Haku = Case when luammhaku1_opmast='31' 
	then --lu
	Case when 'K' in (yotutkopisx) then 'K' else 'E' end
	else --amm
	Case when 'K' in (ammopisx) then 'K' else 'E' end
	end,
Johdettu_Sama_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when luammhaku1_opmast='31' 
	then --lu
	Case when 'K' in (aikyotutk, yotutkopisx) then 'K' else 'E' end
	else --amm
	Case when 'K' in (aikamm, ammopisx) then 'K' else 'E' end
	end,	
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_Haku = Case when 'K' in (aikyotutk, aikamm) then 'K' else 'E' end,	
Johdettu_Sama_laaja_sektori_Aiempi_opiskelu_Haku = Case when 'K' in (yotutkopisx, ammopisx) then 'K' else 'E' end,
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when 'K' in (yotutkopisx, ammopisx, aikyotutk, aikamm) then 'K' else 'E' end,
Johdettu_Hakenut_Amk_ja_Yo = Case when 
	(amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>'')
	and (yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Korkea_aste_ja_Toinen_aste = Case when 
	(luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'')
	and (amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>''
			or yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Lukio_ja_Ammatillinen_koulutus = Case when 
	((luammhaku1_tunn<>'' and luammhaku1_opmast='31') or (luammhaku2_tunn<>'' and luammhaku2_opmast='31') or (luammhaku3_tunn<>'' and luammhaku3_opmast='31') or (luammhaku4_tunn<>'' and luammhaku4_opmast='31') or (luammhaku5_tunn<>'' and luammhaku5_opmast='31'))
	and ((luammhaku1_tunn<>'' and luammhaku1_opmast<>'31') or (luammhaku2_tunn<>'' and luammhaku2_opmast<>'31') or (luammhaku3_tunn<>'' and luammhaku3_opmast<>'31') or (luammhaku4_tunn<>'' and luammhaku4_opmast<>'31') or (luammhaku5_tunn<>'' and luammhaku5_opmast<>'31'))
	then 'K' else 'E' end,
lkm, 
tietolahde,
rivinumero
FROM VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
WHERE luammhaku1_tunn<>''

UNION ALL
-- Uudet haut, haku luamm, prioriteetti 2
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
Haku_avain = Case when luammhaku2_opmast='31' then 'lu' else 'amm' end, --'luamm',
Hakukohde_oppilaitos_avain = luammhaku2_tunn, 
Hakukohde_koulutusaste2002_avain = luammhaku2_opmast_avain, 
Hakukohde_koulutusaste_taso2_avain = luammhaku2_kaste_t2_avain, 
Hakukohde_opintoala2002_avain = luammhaku2_opmopa_avain, 
Hakukohde_opintoala1995_avain = luammhaku2_opm95opa_avain, 
Hakukohde_iscfibroad2013_avain = luammhaku2_iscfibroad2013_avain, 
Hakukohde_prioriteetti_avain = 'pr_2', 
Hakukohde_hyvaksytty = luammhaku2_hyv,
Hakukohde_vastaanotettu = luammhaku2_vastotto,
Hakukohde_tutkinnon_taso = '-1',
Hakukohde_tutkinnon_taso_tarkennus = '-1',
Hakukohde_erillisvalinta = '-1',
Hakukohde_koulutuksen_alkamislukukausi_avain = Koulutuksen_alkamislukukausi_avain,
--Johdettu_Hakija_opiskelee_hakukohteessa = Case when luammhaku2_tunn in (yotutkopisxtunn, ammopisxtunn) then 'K' else 'E' end,	
Johdettu_Sama_koulutusaste02_Aiempi_tutkinto_Haku = Case when luammhaku2_opmast in (aikyotutkkoulk_opmast, aikammkoulk_opmast, aikamkkoulk_opmast, aikylamkkoulk_opmast, aikalkkkoulk_opmast, aikylkkkoulk_opmast, aiklistrikoulk_opmast) then 'K' else 'E' end,
Johdettu_Sama_koulutusaste02_Aiempi_opiskelu_Haku = Case when luammhaku2_opmast in (yotutkopisxkoulk_opmast, ammopisxkoulk_opmast, amkopisxkoulk1_opmast, amkopisxkoulk2_opmast, amkopisxkoulk3_opmast, yoopisxkoulk1_opmast, yoopisxkoulk2_opmast, yoopisxkoulk3_opmast) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_tutkinto_Haku = case when luammhaku2_opm95opa  in (aikyotutkkoulk_opm95opa, aikammkoulk_opm95opa, aikamkkoulk_opm95opa, aikylamkkoulk_opm95opa, aikalkkkoulk_opm95opa, aikylkkkoulk_opm95opa, aiklistrikoulk_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_opiskelu_Haku = Case when luammhaku2_opm95opa in (yotutkopisxkoulk_opm95opa, ammopisxkoulk_opm95opa, amkopisxkoulk1_opm95opa, amkopisxkoulk2_opm95opa, amkopisxkoulk3_opm95opa, yoopisxkoulk1_opm95opa, yoopisxkoulk2_opm95opa, yoopisxkoulk3_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_tutkinto_Haku = Case when luammhaku2_opmopa in (aikyotutkkoulk_opmopa, aikammkoulk_opmopa, aikamkkoulk_opmopa, aikylamkkoulk_opmopa, aikalkkkoulk_opmopa, aikylkkkoulk_opmopa, aiklistrikoulk_opmopa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_opiskelu_Haku = Case when luammhaku2_opmopa in (yotutkopisxkoulk_opmopa, ammopisxkoulk_opmopa, amkopisxkoulk1_opmopa, amkopisxkoulk2_opmopa, amkopisxkoulk3_opmopa, yoopisxkoulk1_opmopa, yoopisxkoulk2_opmopa, yoopisxkoulk3_opmopa) then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_tutkinto_Haku = case when luammhaku2_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2)  in (aikyotutkkoulk_opm95ala, aikammkoulk_opm95ala, aikamkkoulk_opm95ala, aikylamkkoulk_opm95ala, aikalkkkoulk_opm95ala, aikylkkkoulk_opm95ala, aiklistrikoulk_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_opiskelu_Haku = Case when luammhaku2_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2) in (yotutkopisxkoulk_opm95ala, ammopisxkoulk_opm95ala, amkopisxkoulk1_opm95ala, amkopisxkoulk2_opm95ala, amkopisxkoulk3_opm95ala, yoopisxkoulk1_opm95ala, yoopisxkoulk2_opm95ala, yoopisxkoulk3_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_tutkinto_Haku = Case when luammhaku2_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (aikyotutkkoulk_opmala, aikammkoulk_opmala, aikamkkoulk_opmala, aikylamkkoulk_opmala, aikalkkkoulk_opmala, aikylkkkoulk_opmala, aiklistrikoulk_opmala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_opiskelu_Haku = Case when luammhaku2_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (yotutkopisxkoulk_opmala, ammopisxkoulk_opmala, amkopisxkoulk1_opmala, amkopisxkoulk2_opmala, amkopisxkoulk3_opmala, yoopisxkoulk1_opmala, yoopisxkoulk2_opmala, yoopisxkoulk3_opmala))
  then 'K' else 'E' end,
Johdettu_Sama_oppilaitos_Aiempi_tutkinto_Haku = Case when luammhaku2_tunn in (tunnyotutk, tunnamm, tunnamk, tunnylamk, tunnalkk, tunnylkk, tunnlistri) then 'K' else 'E' end,	
Johdettu_Sama_oppilaitos_Aiempi_opiskelu_Haku = Case when luammhaku2_tunn in (yotutkopisxtunn, ammopisxtunn, amkopisxtunn1, amkopisxtunn2, amkopisxtunn3, yoopisxtunn1, yoopisxtunn2, yoopisxtunn3) then 'K' else 'E' end,	
Johdettu_Sama_sektori_Aiempi_tutkinto_Haku = Case when luammhaku2_opmast='31' 
	then --lu
	Case when 'K' in (aikyotutk) then 'K' else 'E' end
	else --amm
	Case when 'K' in (aikamm) then 'K' else 'E' end
	end,	
Johdettu_Sama_sektori_Aiempi_opiskelu_Haku = Case when luammhaku2_opmast='31' 
	then --lu
	Case when 'K' in (yotutkopisx) then 'K' else 'E' end
	else --amm
	Case when 'K' in (ammopisx) then 'K' else 'E' end
	end,
Johdettu_Sama_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when luammhaku2_opmast='31' 
	then --lu
	Case when 'K' in (aikyotutk, yotutkopisx) then 'K' else 'E' end
	else --amm
	Case when 'K' in (aikamm, ammopisx) then 'K' else 'E' end
	end,	
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_Haku = Case when 'K' in (aikyotutk, aikamm) then 'K' else 'E' end,	
Johdettu_Sama_laaja_sektori_Aiempi_opiskelu_Haku = Case when 'K' in (yotutkopisx, ammopisx) then 'K' else 'E' end,
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when 'K' in (yotutkopisx, ammopisx, aikyotutk, aikamm) then 'K' else 'E' end,
Johdettu_Hakenut_Amk_ja_Yo = Case when 
	(amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>'')
	and (yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Korkea_aste_ja_Toinen_aste = Case when 
	(luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'')
	and (amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>''
			or yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Lukio_ja_Ammatillinen_koulutus = Case when 
	((luammhaku1_tunn<>'' and luammhaku1_opmast='31') or (luammhaku2_tunn<>'' and luammhaku2_opmast='31') or (luammhaku3_tunn<>'' and luammhaku3_opmast='31') or (luammhaku4_tunn<>'' and luammhaku4_opmast='31') or (luammhaku5_tunn<>'' and luammhaku5_opmast='31'))
	and ((luammhaku1_tunn<>'' and luammhaku1_opmast<>'31') or (luammhaku2_tunn<>'' and luammhaku2_opmast<>'31') or (luammhaku3_tunn<>'' and luammhaku3_opmast<>'31') or (luammhaku4_tunn<>'' and luammhaku4_opmast<>'31') or (luammhaku5_tunn<>'' and luammhaku5_opmast<>'31'))
	then 'K' else 'E' end,
lkm, 
tietolahde,
rivinumero
FROM VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
WHERE luammhaku2_tunn<>''

UNION ALL
-- Uudet haut, haku luamm, prioriteetti 3
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
Haku_avain = Case when luammhaku3_opmast='31' then 'lu' else 'amm' end, --'luamm',
Hakukohde_oppilaitos_avain = luammhaku3_tunn, 
Hakukohde_koulutusaste2002_avain = luammhaku3_opmast_avain,
Hakukohde_koulutusaste_taso2_avain = luammhaku3_kaste_t2_avain,  
Hakukohde_opintoala2002_avain = luammhaku3_opmopa_avain, 
Hakukohde_opintoala1995_avain = luammhaku3_opm95opa_avain, 
Hakukohde_iscfibroad2013_avain = luammhaku3_iscfibroad2013_avain, 
Hakukohde_prioriteetti_avain = 'pr_3', 
Hakukohde_hyvaksytty = luammhaku3_hyv,
Hakukohde_vastaanotettu = luammhaku3_vastotto,
Hakukohde_tutkinnon_taso = '-1',
Hakukohde_tutkinnon_taso_tarkennus = '-1',
Hakukohde_erillisvalinta = '-1',
Hakukohde_koulutuksen_alkamislukukausi_avain = Koulutuksen_alkamislukukausi_avain,
--Johdettu_Hakija_opiskelee_hakukohteessa = Case when luammhaku3_tunn in (yotutkopisxtunn, ammopisxtunn) then 'K' else 'E' end,	
Johdettu_Sama_koulutusaste02_Aiempi_tutkinto_Haku = Case when luammhaku3_opmast in (aikyotutkkoulk_opmast, aikammkoulk_opmast, aikamkkoulk_opmast, aikylamkkoulk_opmast, aikalkkkoulk_opmast, aikylkkkoulk_opmast, aiklistrikoulk_opmast) then 'K' else 'E' end,
Johdettu_Sama_koulutusaste02_Aiempi_opiskelu_Haku = Case when luammhaku3_opmast in (yotutkopisxkoulk_opmast, ammopisxkoulk_opmast, amkopisxkoulk1_opmast, amkopisxkoulk2_opmast, amkopisxkoulk3_opmast, yoopisxkoulk1_opmast, yoopisxkoulk2_opmast, yoopisxkoulk3_opmast) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_tutkinto_Haku = case when luammhaku3_opm95opa  in (aikyotutkkoulk_opm95opa, aikammkoulk_opm95opa, aikamkkoulk_opm95opa, aikylamkkoulk_opm95opa, aikalkkkoulk_opm95opa, aikylkkkoulk_opm95opa, aiklistrikoulk_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_opiskelu_Haku = Case when luammhaku3_opm95opa in (yotutkopisxkoulk_opm95opa, ammopisxkoulk_opm95opa, amkopisxkoulk1_opm95opa, amkopisxkoulk2_opm95opa, amkopisxkoulk3_opm95opa, yoopisxkoulk1_opm95opa, yoopisxkoulk2_opm95opa, yoopisxkoulk3_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_tutkinto_Haku = Case when luammhaku3_opmopa in (aikyotutkkoulk_opmopa, aikammkoulk_opmopa, aikamkkoulk_opmopa, aikylamkkoulk_opmopa, aikalkkkoulk_opmopa, aikylkkkoulk_opmopa, aiklistrikoulk_opmopa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_opiskelu_Haku = Case when luammhaku3_opmopa in (yotutkopisxkoulk_opmopa, ammopisxkoulk_opmopa, amkopisxkoulk1_opmopa, amkopisxkoulk2_opmopa, amkopisxkoulk3_opmopa, yoopisxkoulk1_opmopa, yoopisxkoulk2_opmopa, yoopisxkoulk3_opmopa) then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_tutkinto_Haku = case when luammhaku3_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2)  in (aikyotutkkoulk_opm95ala, aikammkoulk_opm95ala, aikamkkoulk_opm95ala, aikylamkkoulk_opm95ala, aikalkkkoulk_opm95ala, aikylkkkoulk_opm95ala, aiklistrikoulk_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_opiskelu_Haku = Case when luammhaku3_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2) in (yotutkopisxkoulk_opm95ala, ammopisxkoulk_opm95ala, amkopisxkoulk1_opm95ala, amkopisxkoulk2_opm95ala, amkopisxkoulk3_opm95ala, yoopisxkoulk1_opm95ala, yoopisxkoulk2_opm95ala, yoopisxkoulk3_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_tutkinto_Haku = Case when luammhaku3_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (aikyotutkkoulk_opmala, aikammkoulk_opmala, aikamkkoulk_opmala, aikylamkkoulk_opmala, aikalkkkoulk_opmala, aikylkkkoulk_opmala, aiklistrikoulk_opmala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_opiskelu_Haku = Case when luammhaku3_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (yotutkopisxkoulk_opmala, ammopisxkoulk_opmala, amkopisxkoulk1_opmala, amkopisxkoulk2_opmala, amkopisxkoulk3_opmala, yoopisxkoulk1_opmala, yoopisxkoulk2_opmala, yoopisxkoulk3_opmala))
  then 'K' else 'E' end,
Johdettu_Sama_oppilaitos_Aiempi_tutkinto_Haku = Case when luammhaku3_tunn in (tunnyotutk, tunnamm, tunnamk, tunnylamk, tunnalkk, tunnylkk, tunnlistri) then 'K' else 'E' end,	
Johdettu_Sama_oppilaitos_Aiempi_opiskelu_Haku = Case when luammhaku3_tunn in (yotutkopisxtunn, ammopisxtunn, amkopisxtunn1, amkopisxtunn2, amkopisxtunn3, yoopisxtunn1, yoopisxtunn2, yoopisxtunn3) then 'K' else 'E' end,	
Johdettu_Sama_sektori_Aiempi_tutkinto_Haku = Case when luammhaku3_opmast='31' 
	then --lu
	Case when 'K' in (aikyotutk) then 'K' else 'E' end
	else --amm
	Case when 'K' in (aikamm) then 'K' else 'E' end
	end,	
Johdettu_Sama_sektori_Aiempi_opiskelu_Haku = Case when luammhaku3_opmast='31' 
	then --lu
	Case when 'K' in (yotutkopisx) then 'K' else 'E' end
	else --amm
	Case when 'K' in (ammopisx) then 'K' else 'E' end
	end,
Johdettu_Sama_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when luammhaku3_opmast='31' 
	then --lu
	Case when 'K' in (aikyotutk, yotutkopisx) then 'K' else 'E' end
	else --amm
	Case when 'K' in (aikamm, ammopisx) then 'K' else 'E' end
	end,	
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_Haku = Case when 'K' in (aikyotutk, aikamm) then 'K' else 'E' end,	
Johdettu_Sama_laaja_sektori_Aiempi_opiskelu_Haku = Case when 'K' in (yotutkopisx, ammopisx) then 'K' else 'E' end,
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when 'K' in (yotutkopisx, ammopisx, aikyotutk, aikamm) then 'K' else 'E' end,
Johdettu_Hakenut_Amk_ja_Yo = Case when 
	(amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>'')
	and (yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Korkea_aste_ja_Toinen_aste = Case when 
	(luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'')
	and (amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>''
			or yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Lukio_ja_Ammatillinen_koulutus = Case when 
	((luammhaku1_tunn<>'' and luammhaku1_opmast='31') or (luammhaku2_tunn<>'' and luammhaku2_opmast='31') or (luammhaku3_tunn<>'' and luammhaku3_opmast='31') or (luammhaku4_tunn<>'' and luammhaku4_opmast='31') or (luammhaku5_tunn<>'' and luammhaku5_opmast='31'))
	and ((luammhaku1_tunn<>'' and luammhaku1_opmast<>'31') or (luammhaku2_tunn<>'' and luammhaku2_opmast<>'31') or (luammhaku3_tunn<>'' and luammhaku3_opmast<>'31') or (luammhaku4_tunn<>'' and luammhaku4_opmast<>'31') or (luammhaku5_tunn<>'' and luammhaku5_opmast<>'31'))
	then 'K' else 'E' end,
lkm, 
tietolahde,
rivinumero
FROM VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
WHERE luammhaku3_tunn<>''

UNION ALL
-- Uudet haut, haku luamm, prioriteetti 4
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
Haku_avain = Case when luammhaku4_opmast='31' then 'lu' else 'amm' end, --'luamm',
Hakukohde_oppilaitos_avain = luammhaku4_tunn, 
Hakukohde_koulutusaste2002_avain = luammhaku4_opmast_avain, 
Hakukohde_koulutusaste_taso2_avain = luammhaku4_kaste_t2_avain, 
Hakukohde_opintoala2002_avain = luammhaku4_opmopa_avain, 
Hakukohde_opintoala1995_avain = luammhaku4_opm95opa_avain,
Hakukohde_iscfibroad2013_avain = luammhaku4_iscfibroad2013_avain,  
Hakukohde_prioriteetti_avain = 'pr_4', 
Hakukohde_hyvaksytty = luammhaku4_hyv,
Hakukohde_vastaanotettu = luammhaku4_vastotto,
Hakukohde_tutkinnon_taso = '-1',
Hakukohde_tutkinnon_taso_tarkennus = '-1',
Hakukohde_erillisvalinta = '-1',
Hakukohde_koulutuksen_alkamislukukausi_avain = Koulutuksen_alkamislukukausi_avain,
--Johdettu_Hakija_opiskelee_hakukohteessa = Case when luammhaku4_tunn in (yotutkopisxtunn, ammopisxtunn) then 'K' else 'E' end,	
Johdettu_Sama_koulutusaste02_Aiempi_tutkinto_Haku = Case when luammhaku4_opmast in (aikyotutkkoulk_opmast, aikammkoulk_opmast, aikamkkoulk_opmast, aikylamkkoulk_opmast, aikalkkkoulk_opmast, aikylkkkoulk_opmast, aiklistrikoulk_opmast) then 'K' else 'E' end,
Johdettu_Sama_koulutusaste02_Aiempi_opiskelu_Haku = Case when luammhaku4_opmast in (yotutkopisxkoulk_opmast, ammopisxkoulk_opmast, amkopisxkoulk1_opmast, amkopisxkoulk2_opmast, amkopisxkoulk3_opmast, yoopisxkoulk1_opmast, yoopisxkoulk2_opmast, yoopisxkoulk3_opmast) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_tutkinto_Haku = case when luammhaku4_opm95opa  in (aikyotutkkoulk_opm95opa, aikammkoulk_opm95opa, aikamkkoulk_opm95opa, aikylamkkoulk_opm95opa, aikalkkkoulk_opm95opa, aikylkkkoulk_opm95opa, aiklistrikoulk_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_opiskelu_Haku = Case when luammhaku4_opm95opa in (yotutkopisxkoulk_opm95opa, ammopisxkoulk_opm95opa, amkopisxkoulk1_opm95opa, amkopisxkoulk2_opm95opa, amkopisxkoulk3_opm95opa, yoopisxkoulk1_opm95opa, yoopisxkoulk2_opm95opa, yoopisxkoulk3_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_tutkinto_Haku = Case when luammhaku4_opmopa in (aikyotutkkoulk_opmopa, aikammkoulk_opmopa, aikamkkoulk_opmopa, aikylamkkoulk_opmopa, aikalkkkoulk_opmopa, aikylkkkoulk_opmopa, aiklistrikoulk_opmopa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_opiskelu_Haku = Case when luammhaku4_opmopa in (yotutkopisxkoulk_opmopa, ammopisxkoulk_opmopa, amkopisxkoulk1_opmopa, amkopisxkoulk2_opmopa, amkopisxkoulk3_opmopa, yoopisxkoulk1_opmopa, yoopisxkoulk2_opmopa, yoopisxkoulk3_opmopa) then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_tutkinto_Haku = case when luammhaku4_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2)  in (aikyotutkkoulk_opm95ala, aikammkoulk_opm95ala, aikamkkoulk_opm95ala, aikylamkkoulk_opm95ala, aikalkkkoulk_opm95ala, aikylkkkoulk_opm95ala, aiklistrikoulk_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_opiskelu_Haku = Case when luammhaku4_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2) in (yotutkopisxkoulk_opm95ala, ammopisxkoulk_opm95ala, amkopisxkoulk1_opm95ala, amkopisxkoulk2_opm95ala, amkopisxkoulk3_opm95ala, yoopisxkoulk1_opm95ala, yoopisxkoulk2_opm95ala, yoopisxkoulk3_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_tutkinto_Haku = Case when luammhaku4_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (aikyotutkkoulk_opmala, aikammkoulk_opmala, aikamkkoulk_opmala, aikylamkkoulk_opmala, aikalkkkoulk_opmala, aikylkkkoulk_opmala, aiklistrikoulk_opmala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_opiskelu_Haku = Case when luammhaku4_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (yotutkopisxkoulk_opmala, ammopisxkoulk_opmala, amkopisxkoulk1_opmala, amkopisxkoulk2_opmala, amkopisxkoulk3_opmala, yoopisxkoulk1_opmala, yoopisxkoulk2_opmala, yoopisxkoulk3_opmala))
  then 'K' else 'E' end,
Johdettu_Sama_oppilaitos_Aiempi_tutkinto_Haku = Case when luammhaku4_tunn in (tunnyotutk, tunnamm, tunnamk, tunnylamk, tunnalkk, tunnylkk, tunnlistri) then 'K' else 'E' end,	
Johdettu_Sama_oppilaitos_Aiempi_opiskelu_Haku = Case when luammhaku4_tunn in (yotutkopisxtunn, ammopisxtunn, amkopisxtunn1, amkopisxtunn2, amkopisxtunn3, yoopisxtunn1, yoopisxtunn2, yoopisxtunn3) then 'K' else 'E' end,	
Johdettu_Sama_sektori_Aiempi_tutkinto_Haku = Case when luammhaku4_opmast='31' 
	then --lu
	Case when 'K' in (aikyotutk) then 'K' else 'E' end
	else --amm
	Case when 'K' in (aikamm) then 'K' else 'E' end
	end,	
Johdettu_Sama_sektori_Aiempi_opiskelu_Haku = Case when luammhaku4_opmast='31' 
	then --lu
	Case when 'K' in (yotutkopisx) then 'K' else 'E' end
	else --amm
	Case when 'K' in (ammopisx) then 'K' else 'E' end
	end,
Johdettu_Sama_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when luammhaku4_opmast='31' 
	then --lu
	Case when 'K' in (aikyotutk, yotutkopisx) then 'K' else 'E' end
	else --amm
	Case when 'K' in (aikamm, ammopisx) then 'K' else 'E' end
	end,	
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_Haku = Case when 'K' in (aikyotutk, aikamm) then 'K' else 'E' end,	
Johdettu_Sama_laaja_sektori_Aiempi_opiskelu_Haku = Case when 'K' in (yotutkopisx, ammopisx) then 'K' else 'E' end,
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when 'K' in (yotutkopisx, ammopisx, aikyotutk, aikamm) then 'K' else 'E' end,
Johdettu_Hakenut_Amk_ja_Yo = Case when 
	(amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>'')
	and (yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Korkea_aste_ja_Toinen_aste = Case when 
	(luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'')
	and (amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>''
			or yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Lukio_ja_Ammatillinen_koulutus = Case when 
	((luammhaku1_tunn<>'' and luammhaku1_opmast='31') or (luammhaku2_tunn<>'' and luammhaku2_opmast='31') or (luammhaku3_tunn<>'' and luammhaku3_opmast='31') or (luammhaku4_tunn<>'' and luammhaku4_opmast='31') or (luammhaku5_tunn<>'' and luammhaku5_opmast='31'))
	and ((luammhaku1_tunn<>'' and luammhaku1_opmast<>'31') or (luammhaku2_tunn<>'' and luammhaku2_opmast<>'31') or (luammhaku3_tunn<>'' and luammhaku3_opmast<>'31') or (luammhaku4_tunn<>'' and luammhaku4_opmast<>'31') or (luammhaku5_tunn<>'' and luammhaku5_opmast<>'31'))
	then 'K' else 'E' end,
lkm, 
tietolahde,
rivinumero
FROM VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
WHERE luammhaku4_tunn<>''

UNION ALL
-- Uudet haut, haku luamm, prioriteetti 5
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
Haku_avain = Case when luammhaku5_opmast='31' then 'lu' else 'amm' end, --'luamm',
Hakukohde_oppilaitos_avain = luammhaku5_tunn, 
Hakukohde_koulutusaste2002_avain = luammhaku5_opmast_avain, 
Hakukohde_koulutusaste_taso2_avain = luammhaku5_kaste_t2_avain, 
Hakukohde_opintoala2002_avain = luammhaku5_opmopa_avain, 
Hakukohde_opintoala1995_avain = luammhaku5_opm95opa_avain, 
Hakukohde_iscfibroad2013_avain = luammhaku5_iscfibroad2013_avain, 
Hakukohde_prioriteetti_avain = 'pr_5', 
Hakukohde_hyvaksytty = luammhaku5_hyv,
Hakukohde_vastaanotettu = luammhaku5_vastotto,
Hakukohde_tutkinnon_taso = '-1',
Hakukohde_tutkinnon_taso_tarkennus = '-1',
Hakukohde_erillisvalinta = '-1',
Hakukohde_koulutuksen_alkamislukukausi_avain = Koulutuksen_alkamislukukausi_avain,
--Johdettu_Hakija_opiskelee_hakukohteessa = Case when luammhaku5_tunn in (yotutkopisxtunn, ammopisxtunn) then 'K' else 'E' end,	
Johdettu_Sama_koulutusaste02_Aiempi_tutkinto_Haku = Case when luammhaku5_opmast in (aikyotutkkoulk_opmast, aikammkoulk_opmast, aikamkkoulk_opmast, aikylamkkoulk_opmast, aikalkkkoulk_opmast, aikylkkkoulk_opmast, aiklistrikoulk_opmast) then 'K' else 'E' end,
Johdettu_Sama_koulutusaste02_Aiempi_opiskelu_Haku = Case when luammhaku5_opmast in (yotutkopisxkoulk_opmast, ammopisxkoulk_opmast, amkopisxkoulk1_opmast, amkopisxkoulk2_opmast, amkopisxkoulk3_opmast, yoopisxkoulk1_opmast, yoopisxkoulk2_opmast, yoopisxkoulk3_opmast) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_tutkinto_Haku = case when luammhaku5_opm95opa  in (aikyotutkkoulk_opm95opa, aikammkoulk_opm95opa, aikamkkoulk_opm95opa, aikylamkkoulk_opm95opa, aikalkkkoulk_opm95opa, aikylkkkoulk_opm95opa, aiklistrikoulk_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_opiskelu_Haku = Case when luammhaku5_opm95opa in (yotutkopisxkoulk_opm95opa, ammopisxkoulk_opm95opa, amkopisxkoulk1_opm95opa, amkopisxkoulk2_opm95opa, amkopisxkoulk3_opm95opa, yoopisxkoulk1_opm95opa, yoopisxkoulk2_opm95opa, yoopisxkoulk3_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_tutkinto_Haku = Case when luammhaku5_opmopa in (aikyotutkkoulk_opmopa, aikammkoulk_opmopa, aikamkkoulk_opmopa, aikylamkkoulk_opmopa, aikalkkkoulk_opmopa, aikylkkkoulk_opmopa, aiklistrikoulk_opmopa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_opiskelu_Haku = Case when luammhaku5_opmopa in (yotutkopisxkoulk_opmopa, ammopisxkoulk_opmopa, amkopisxkoulk1_opmopa, amkopisxkoulk2_opmopa, amkopisxkoulk3_opmopa, yoopisxkoulk1_opmopa, yoopisxkoulk2_opmopa, yoopisxkoulk3_opmopa) then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_tutkinto_Haku = case when luammhaku5_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2)  in (aikyotutkkoulk_opm95ala, aikammkoulk_opm95ala, aikamkkoulk_opm95ala, aikylamkkoulk_opm95ala, aikalkkkoulk_opm95ala, aikylkkkoulk_opm95ala, aiklistrikoulk_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_opiskelu_Haku = Case when luammhaku5_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2) in (yotutkopisxkoulk_opm95ala, ammopisxkoulk_opm95ala, amkopisxkoulk1_opm95ala, amkopisxkoulk2_opm95ala, amkopisxkoulk3_opm95ala, yoopisxkoulk1_opm95ala, yoopisxkoulk2_opm95ala, yoopisxkoulk3_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_tutkinto_Haku = Case when luammhaku5_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (aikyotutkkoulk_opmala, aikammkoulk_opmala, aikamkkoulk_opmala, aikylamkkoulk_opmala, aikalkkkoulk_opmala, aikylkkkoulk_opmala, aiklistrikoulk_opmala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_opiskelu_Haku = Case when luammhaku5_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (yotutkopisxkoulk_opmala, ammopisxkoulk_opmala, amkopisxkoulk1_opmala, amkopisxkoulk2_opmala, amkopisxkoulk3_opmala, yoopisxkoulk1_opmala, yoopisxkoulk2_opmala, yoopisxkoulk3_opmala))
  then 'K' else 'E' end,
Johdettu_Sama_oppilaitos_Aiempi_tutkinto_Haku = Case when luammhaku5_tunn in (tunnyotutk, tunnamm, tunnamk, tunnylamk, tunnalkk, tunnylkk, tunnlistri) then 'K' else 'E' end,	
Johdettu_Sama_oppilaitos_Aiempi_opiskelu_Haku = Case when luammhaku5_tunn in (yotutkopisxtunn, ammopisxtunn, amkopisxtunn1, amkopisxtunn2, amkopisxtunn3, yoopisxtunn1, yoopisxtunn2, yoopisxtunn3) then 'K' else 'E' end,	
Johdettu_Sama_sektori_Aiempi_tutkinto_Haku = Case when luammhaku5_opmast='31' 
	then --lu
	Case when 'K' in (aikyotutk) then 'K' else 'E' end
	else --amm
	Case when 'K' in (aikamm) then 'K' else 'E' end
	end,	
Johdettu_Sama_sektori_Aiempi_opiskelu_Haku = Case when luammhaku5_opmast='31' 
	then --lu
	Case when 'K' in (yotutkopisx) then 'K' else 'E' end
	else --amm
	Case when 'K' in (ammopisx) then 'K' else 'E' end
	end,
Johdettu_Sama_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when luammhaku5_opmast='31' 
	then --lu
	Case when 'K' in (aikyotutk, yotutkopisx) then 'K' else 'E' end
	else --amm
	Case when 'K' in (aikamm, ammopisx) then 'K' else 'E' end
	end,	
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_Haku = Case when 'K' in (aikyotutk, aikamm) then 'K' else 'E' end,	
Johdettu_Sama_laaja_sektori_Aiempi_opiskelu_Haku = Case when 'K' in (yotutkopisx, ammopisx) then 'K' else 'E' end,
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when 'K' in (yotutkopisx, ammopisx, aikyotutk, aikamm) then 'K' else 'E' end,
Johdettu_Hakenut_Amk_ja_Yo = Case when 
	(amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>'')
	and (yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Korkea_aste_ja_Toinen_aste = Case when 
	(luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'')
	and (amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>''
			or yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Lukio_ja_Ammatillinen_koulutus = Case when 
	((luammhaku1_tunn<>'' and luammhaku1_opmast='31') or (luammhaku2_tunn<>'' and luammhaku2_opmast='31') or (luammhaku3_tunn<>'' and luammhaku3_opmast='31') or (luammhaku4_tunn<>'' and luammhaku4_opmast='31') or (luammhaku5_tunn<>'' and luammhaku5_opmast='31'))
	and ((luammhaku1_tunn<>'' and luammhaku1_opmast<>'31') or (luammhaku2_tunn<>'' and luammhaku2_opmast<>'31') or (luammhaku3_tunn<>'' and luammhaku3_opmast<>'31') or (luammhaku4_tunn<>'' and luammhaku4_opmast<>'31') or (luammhaku5_tunn<>'' and luammhaku5_opmast<>'31'))
	then 'K' else 'E' end,
lkm, 
tietolahde,
rivinumero
FROM VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
WHERE luammhaku5_tunn<>''

UNION ALL
-- Uudet haut, haku amk, prioriteetti 1
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
Haku_avain = 'amk',
Hakukohde_oppilaitos_avain = amkhaku1_tunn, 
Hakukohde_koulutusaste2002_avain = amkhaku1_opmast_avain, 
Hakukohde_koulutusaste_taso2_avain = kkhaku1_kaste_t2_avain, 
Hakukohde_opintoala2002_avain = amkhaku1_opmopa_avain, 
Hakukohde_opintoala1995_avain = amkhaku1_opm95opa_avain, 
Hakukohde_iscfibroad2013_avain = kkhaku1_iscfibroad2013_avain, 
Hakukohde_prioriteetti_avain = 'pr_1', 
Hakukohde_hyvaksytty = amkhaku1_hyv,
Hakukohde_vastaanotettu = amkhaku1_vastotto,
Hakukohde_tutkinnon_taso = 
	Case 
		when tilastovuosi<2015 then
			case	
				when amkhaku1_koultyp <> '' then 'AMK' + amkhaku1_koultyp 
				else '-1' 
			end
		else 
			case
				when amkhaku1_opmast_avain='OPMAST62' then 'AMK1' when amkhaku1_opmast_avain='OPMAST71' then 'AMK3' 
				else '-1' 
			end
	end
,
Hakukohde_tutkinnon_taso_tarkennus = Case when amkhaku1_koultyp <> '' then 'AMKTA' + amkhaku1_koultyp else '-1' end,
Hakukohde_erillisvalinta = '-1',
Hakukohde_koulutuksen_alkamislukukausi_avain = Koulutuksen_alkamislukukausi_avain,
--Johdettu_Hakija_opiskelee_hakukohteessa = Case when amkhaku1_tunn in (amkopisxtunn1,amkopisxtunn2,amkopisxtunn3) then 'K' else 'E' end,	
Johdettu_Sama_koulutusaste02_Aiempi_tutkinto_Haku = Case when amkhaku1_opmast in (aikyotutkkoulk_opmast, aikammkoulk_opmast, aikamkkoulk_opmast, aikylamkkoulk_opmast, aikalkkkoulk_opmast, aikylkkkoulk_opmast, aiklistrikoulk_opmast) then 'K' else 'E' end,
Johdettu_Sama_koulutusaste02_Aiempi_opiskelu_Haku = Case when amkhaku1_opmast in (yotutkopisxkoulk_opmast, ammopisxkoulk_opmast, amkopisxkoulk1_opmast, amkopisxkoulk2_opmast, amkopisxkoulk3_opmast, yoopisxkoulk1_opmast, yoopisxkoulk2_opmast, yoopisxkoulk3_opmast) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_tutkinto_Haku = case when amkhaku1_opm95opa  in (aikyotutkkoulk_opm95opa, aikammkoulk_opm95opa, aikamkkoulk_opm95opa, aikylamkkoulk_opm95opa, aikalkkkoulk_opm95opa, aikylkkkoulk_opm95opa, aiklistrikoulk_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_opiskelu_Haku = Case when amkhaku1_opm95opa in (yotutkopisxkoulk_opm95opa, ammopisxkoulk_opm95opa, amkopisxkoulk1_opm95opa, amkopisxkoulk2_opm95opa, amkopisxkoulk3_opm95opa, yoopisxkoulk1_opm95opa, yoopisxkoulk2_opm95opa, yoopisxkoulk3_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_tutkinto_Haku = Case when amkhaku1_opmopa in (aikyotutkkoulk_opmopa, aikammkoulk_opmopa, aikamkkoulk_opmopa, aikylamkkoulk_opmopa, aikalkkkoulk_opmopa, aikylkkkoulk_opmopa, aiklistrikoulk_opmopa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_opiskelu_Haku = Case when amkhaku1_opmopa in (yotutkopisxkoulk_opmopa, ammopisxkoulk_opmopa, amkopisxkoulk1_opmopa, amkopisxkoulk2_opmopa, amkopisxkoulk3_opmopa, yoopisxkoulk1_opmopa, yoopisxkoulk2_opmopa, yoopisxkoulk3_opmopa) then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_tutkinto_Haku = case when amkhaku1_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2) in (aikyotutkkoulk_opm95ala, aikammkoulk_opm95ala, aikamkkoulk_opm95ala, aikylamkkoulk_opm95ala, aikalkkkoulk_opm95ala, aikylkkkoulk_opm95ala, aiklistrikoulk_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_opiskelu_Haku = Case when amkhaku1_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2) in (yotutkopisxkoulk_opm95ala, ammopisxkoulk_opm95ala, amkopisxkoulk1_opm95ala, amkopisxkoulk2_opm95ala, amkopisxkoulk3_opm95ala, yoopisxkoulk1_opm95ala, yoopisxkoulk2_opm95ala, yoopisxkoulk3_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_tutkinto_Haku = Case when amkhaku1_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (aikyotutkkoulk_opmala, aikammkoulk_opmala, aikamkkoulk_opmala, aikylamkkoulk_opmala, aikalkkkoulk_opmala, aikylkkkoulk_opmala, aiklistrikoulk_opmala)
 ) then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_opiskelu_Haku = Case when amkhaku1_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (yotutkopisxkoulk_opmala, ammopisxkoulk_opmala, amkopisxkoulk1_opmala, amkopisxkoulk2_opmala, amkopisxkoulk3_opmala, yoopisxkoulk1_opmala, yoopisxkoulk2_opmala, yoopisxkoulk3_opmala))
  then 'K' else 'E' end,
Johdettu_Sama_oppilaitos_Aiempi_tutkinto_Haku = Case when amkhaku1_tunn in (tunnyotutk, tunnamm, tunnamk, tunnylamk, tunnalkk, tunnylkk, tunnlistri) then 'K' else 'E' end,	
Johdettu_Sama_oppilaitos_Aiempi_opiskelu_Haku = Case when amkhaku1_tunn in (yotutkopisxtunn, ammopisxtunn, amkopisxtunn1, amkopisxtunn2, amkopisxtunn3, yoopisxtunn1, yoopisxtunn2, yoopisxtunn3) then 'K' else 'E' end,	
Johdettu_Sama_sektori_Aiempi_tutkinto_Haku = Case when 'K' in (aikamk, aikylamk) then 'K' else 'E' end,	
Johdettu_Sama_sektori_Aiempi_opiskelu_Haku = Case when 'K' in (amkopisx1, amkopisx2, amkopisx3) then 'K' else 'E' end,
Johdettu_Sama_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when 'K' in (aikamk, aikylamk, amkopisx1, amkopisx2, amkopisx3) then 'K' else 'E' end,	
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_Haku = Case when 'K' in (aikamk, aikylamk, aikalkk, aikylkk, aiklistri) then 'K' else 'E' end,	
Johdettu_Sama_laaja_sektori_Aiempi_opiskelu_Haku = Case when 'K' in (amkopisx1, amkopisx2, amkopisx3, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when 'K' in (aikamk, aikylamk, aikalkk, aikylkk, aiklistri, amkopisx1, amkopisx2, amkopisx3, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Hakenut_Amk_ja_Yo = Case when 
	(amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>'')
	and (yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Korkea_aste_ja_Toinen_aste = Case when 
	(luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'')
	and (amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>''
			or yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Lukio_ja_Ammatillinen_koulutus = Case when 
	((luammhaku1_tunn<>'' and luammhaku1_opmast='31') or (luammhaku2_tunn<>'' and luammhaku2_opmast='31') or (luammhaku3_tunn<>'' and luammhaku3_opmast='31') or (luammhaku4_tunn<>'' and luammhaku4_opmast='31') or (luammhaku5_tunn<>'' and luammhaku5_opmast='31'))
	and ((luammhaku1_tunn<>'' and luammhaku1_opmast<>'31') or (luammhaku2_tunn<>'' and luammhaku2_opmast<>'31') or (luammhaku3_tunn<>'' and luammhaku3_opmast<>'31') or (luammhaku4_tunn<>'' and luammhaku4_opmast<>'31') or (luammhaku5_tunn<>'' and luammhaku5_opmast<>'31'))
	then 'K' else 'E' end,
lkm, 
tietolahde,
rivinumero
FROM VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
WHERE amkhaku1_tunn<>''

UNION ALL
-- Uudet haut, haku amk, prioriteetti 2
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
Haku_avain = 'amk',
Hakukohde_oppilaitos_avain = amkhaku2_tunn, 
Hakukohde_koulutusaste2002_avain = amkhaku2_opmast_avain, 
Hakukohde_koulutusaste_taso2_avain = kkhaku2_kaste_t2_avain, 
Hakukohde_opintoala2002_avain = amkhaku2_opmopa_avain, 
Hakukohde_opintoala1995_avain = amkhaku2_opm95opa_avain, 
Hakukohde_iscfibroad2013_avain = kkhaku2_iscfibroad2013_avain, 
Hakukohde_prioriteetti_avain = 'pr_2', 
Hakukohde_hyvaksytty = amkhaku2_hyv,
Hakukohde_vastaanotettu = amkhaku2_vastotto,
Hakukohde_tutkinnon_taso = 
	Case 
		when tilastovuosi<2015 then
			case	
				when amkhaku2_koultyp <> '' then 'AMK' + amkhaku2_koultyp 
				else '-1' 
			end
		else 
			case
				when amkhaku2_opmast_avain='OPMAST62' then 'AMK1' when amkhaku2_opmast_avain='OPMAST71' then 'AMK3' 
				else '-1' 
			end
	end
,
Hakukohde_tutkinnon_taso_tarkennus = Case when amkhaku2_koultyp <> '' then 'AMKTA' + amkhaku2_koultyp else '-1' end,
Hakukohde_erillisvalinta = '-1',
Hakukohde_koulutuksen_alkamislukukausi_avain = Koulutuksen_alkamislukukausi_avain,
--Johdettu_Hakija_opiskelee_hakukohteessa = Case when amkhaku2_tunn in (amkopisxtunn1,amkopisxtunn2,amkopisxtunn3) then 'K' else 'E' end,	
Johdettu_Sama_koulutusaste02_Aiempi_tutkinto_Haku = Case when amkhaku2_opmast in (aikyotutkkoulk_opmast, aikammkoulk_opmast, aikamkkoulk_opmast, aikylamkkoulk_opmast, aikalkkkoulk_opmast, aikylkkkoulk_opmast, aiklistrikoulk_opmast) then 'K' else 'E' end,
Johdettu_Sama_koulutusaste02_Aiempi_opiskelu_Haku = Case when amkhaku2_opmast in (yotutkopisxkoulk_opmast, ammopisxkoulk_opmast, amkopisxkoulk1_opmast, amkopisxkoulk2_opmast, amkopisxkoulk3_opmast, yoopisxkoulk1_opmast, yoopisxkoulk2_opmast, yoopisxkoulk3_opmast) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_tutkinto_Haku = case when amkhaku2_opm95opa  in (aikyotutkkoulk_opm95opa, aikammkoulk_opm95opa, aikamkkoulk_opm95opa, aikylamkkoulk_opm95opa, aikalkkkoulk_opm95opa, aikylkkkoulk_opm95opa, aiklistrikoulk_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_opiskelu_Haku = Case when amkhaku2_opm95opa in (yotutkopisxkoulk_opm95opa, ammopisxkoulk_opm95opa, amkopisxkoulk1_opm95opa, amkopisxkoulk2_opm95opa, amkopisxkoulk3_opm95opa, yoopisxkoulk1_opm95opa, yoopisxkoulk2_opm95opa, yoopisxkoulk3_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_tutkinto_Haku = Case when amkhaku2_opmopa in (aikyotutkkoulk_opmopa, aikammkoulk_opmopa, aikamkkoulk_opmopa, aikylamkkoulk_opmopa, aikalkkkoulk_opmopa, aikylkkkoulk_opmopa, aiklistrikoulk_opmopa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_opiskelu_Haku = Case when amkhaku2_opmopa in (yotutkopisxkoulk_opmopa, ammopisxkoulk_opmopa, amkopisxkoulk1_opmopa, amkopisxkoulk2_opmopa, amkopisxkoulk3_opmopa, yoopisxkoulk1_opmopa, yoopisxkoulk2_opmopa, yoopisxkoulk3_opmopa) then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_tutkinto_Haku = case when amkhaku2_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2) in (aikyotutkkoulk_opm95ala, aikammkoulk_opm95ala, aikamkkoulk_opm95ala, aikylamkkoulk_opm95ala, aikalkkkoulk_opm95ala, aikylkkkoulk_opm95ala, aiklistrikoulk_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_opiskelu_Haku = Case when amkhaku2_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2) in (yotutkopisxkoulk_opm95ala, ammopisxkoulk_opm95ala, amkopisxkoulk1_opm95ala, amkopisxkoulk2_opm95ala, amkopisxkoulk3_opm95ala, yoopisxkoulk1_opm95ala, yoopisxkoulk2_opm95ala, yoopisxkoulk3_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_tutkinto_Haku = Case when amkhaku2_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (aikyotutkkoulk_opmala, aikammkoulk_opmala, aikamkkoulk_opmala, aikylamkkoulk_opmala, aikalkkkoulk_opmala, aikylkkkoulk_opmala, aiklistrikoulk_opmala)
 ) then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_opiskelu_Haku = Case when amkhaku2_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (yotutkopisxkoulk_opmala, ammopisxkoulk_opmala, amkopisxkoulk1_opmala, amkopisxkoulk2_opmala, amkopisxkoulk3_opmala, yoopisxkoulk1_opmala, yoopisxkoulk2_opmala, yoopisxkoulk3_opmala))
  then 'K' else 'E' end,
Johdettu_Sama_oppilaitos_Aiempi_tutkinto_Haku = Case when amkhaku2_tunn in (tunnyotutk, tunnamm, tunnamk, tunnylamk, tunnalkk, tunnylkk, tunnlistri) then 'K' else 'E' end,	
Johdettu_Sama_oppilaitos_Aiempi_opiskelu_Haku = Case when amkhaku2_tunn in (yotutkopisxtunn, ammopisxtunn, amkopisxtunn1, amkopisxtunn2, amkopisxtunn3, yoopisxtunn1, yoopisxtunn2, yoopisxtunn3) then 'K' else 'E' end,	
Johdettu_Sama_sektori_Aiempi_tutkinto_Haku = Case when 'K' in (aikamk, aikylamk) then 'K' else 'E' end,	
Johdettu_Sama_sektori_Aiempi_opiskelu_Haku = Case when 'K' in (amkopisx1, amkopisx2, amkopisx3) then 'K' else 'E' end,
Johdettu_Sama_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when 'K' in (aikamk, aikylamk, amkopisx1, amkopisx2, amkopisx3) then 'K' else 'E' end,	
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_Haku = Case when 'K' in (aikamk, aikylamk, aikalkk, aikylkk, aiklistri) then 'K' else 'E' end,	
Johdettu_Sama_laaja_sektori_Aiempi_opiskelu_Haku = Case when 'K' in (amkopisx1, amkopisx2, amkopisx3, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when 'K' in (aikamk, aikylamk, aikalkk, aikylkk, aiklistri, amkopisx1, amkopisx2, amkopisx3, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Hakenut_Amk_ja_Yo = Case when 
	(amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>'')
	and (yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Korkea_aste_ja_Toinen_aste = Case when 
	(luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'')
	and (amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>''
			or yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Lukio_ja_Ammatillinen_koulutus = Case when 
	((luammhaku1_tunn<>'' and luammhaku1_opmast='31') or (luammhaku2_tunn<>'' and luammhaku2_opmast='31') or (luammhaku3_tunn<>'' and luammhaku3_opmast='31') or (luammhaku4_tunn<>'' and luammhaku4_opmast='31') or (luammhaku5_tunn<>'' and luammhaku5_opmast='31'))
	and ((luammhaku1_tunn<>'' and luammhaku1_opmast<>'31') or (luammhaku2_tunn<>'' and luammhaku2_opmast<>'31') or (luammhaku3_tunn<>'' and luammhaku3_opmast<>'31') or (luammhaku4_tunn<>'' and luammhaku4_opmast<>'31') or (luammhaku5_tunn<>'' and luammhaku5_opmast<>'31'))
	then 'K' else 'E' end,
lkm, 
tietolahde,
rivinumero
FROM VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
WHERE amkhaku2_tunn<>''

UNION ALL
-- Uudet haut, haku amk, prioriteetti 3
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
Haku_avain = 'amk',
Hakukohde_oppilaitos_avain = amkhaku3_tunn, 
Hakukohde_koulutusaste2002_avain = amkhaku3_opmast_avain, 
Hakukohde_koulutusaste_taso2_avain = kkhaku3_kaste_t2_avain, 
Hakukohde_opintoala2002_avain = amkhaku3_opmopa_avain, 
Hakukohde_opintoala1995_avain = amkhaku3_opm95opa_avain, 
Hakukohde_iscfibroad2013_avain = kkhaku3_iscfibroad2013_avain, 
Hakukohde_prioriteetti_avain = 'pr_3', 
Hakukohde_hyvaksytty = amkhaku3_hyv,
Hakukohde_vastaanotettu = amkhaku3_vastotto,
Hakukohde_tutkinnon_taso = 
	Case 
		when tilastovuosi<2015 then
			case	
				when amkhaku3_koultyp <> '' then 'AMK' + amkhaku3_koultyp 
				else '-1' 
			end
		else 
			case
				when amkhaku3_opmast_avain='OPMAST62' then 'AMK1' when amkhaku3_opmast_avain='OPMAST71' then 'AMK3' 
				else '-1' 
			end
	end
,
Hakukohde_tutkinnon_taso_tarkennus = Case when amkhaku3_koultyp <> '' then 'AMKTA' + amkhaku3_koultyp else '-1' end,
Hakukohde_erillisvalinta = '-1',
Hakukohde_koulutuksen_alkamislukukausi_avain = Koulutuksen_alkamislukukausi_avain,
--Johdettu_Hakija_opiskelee_hakukohteessa = Case when amkhaku3_tunn in (amkopisxtunn1,amkopisxtunn2,amkopisxtunn3) then 'K' else 'E' end,	
Johdettu_Sama_koulutusaste02_Aiempi_tutkinto_Haku = Case when amkhaku3_opmast in (aikyotutkkoulk_opmast, aikammkoulk_opmast, aikamkkoulk_opmast, aikylamkkoulk_opmast, aikalkkkoulk_opmast, aikylkkkoulk_opmast, aiklistrikoulk_opmast) then 'K' else 'E' end,
Johdettu_Sama_koulutusaste02_Aiempi_opiskelu_Haku = Case when amkhaku3_opmast in (yotutkopisxkoulk_opmast, ammopisxkoulk_opmast, amkopisxkoulk1_opmast, amkopisxkoulk2_opmast, amkopisxkoulk3_opmast, yoopisxkoulk1_opmast, yoopisxkoulk2_opmast, yoopisxkoulk3_opmast) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_tutkinto_Haku = case when amkhaku3_opm95opa  in (aikyotutkkoulk_opm95opa, aikammkoulk_opm95opa, aikamkkoulk_opm95opa, aikylamkkoulk_opm95opa, aikalkkkoulk_opm95opa, aikylkkkoulk_opm95opa, aiklistrikoulk_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_opiskelu_Haku = Case when amkhaku3_opm95opa in (yotutkopisxkoulk_opm95opa, ammopisxkoulk_opm95opa, amkopisxkoulk1_opm95opa, amkopisxkoulk2_opm95opa, amkopisxkoulk3_opm95opa, yoopisxkoulk1_opm95opa, yoopisxkoulk2_opm95opa, yoopisxkoulk3_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_tutkinto_Haku = Case when amkhaku3_opmopa in (aikyotutkkoulk_opmopa, aikammkoulk_opmopa, aikamkkoulk_opmopa, aikylamkkoulk_opmopa, aikalkkkoulk_opmopa, aikylkkkoulk_opmopa, aiklistrikoulk_opmopa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_opiskelu_Haku = Case when amkhaku3_opmopa in (yotutkopisxkoulk_opmopa, ammopisxkoulk_opmopa, amkopisxkoulk1_opmopa, amkopisxkoulk2_opmopa, amkopisxkoulk3_opmopa, yoopisxkoulk1_opmopa, yoopisxkoulk2_opmopa, yoopisxkoulk3_opmopa) then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_tutkinto_Haku = case when amkhaku3_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2) in (aikyotutkkoulk_opm95ala, aikammkoulk_opm95ala, aikamkkoulk_opm95ala, aikylamkkoulk_opm95ala, aikalkkkoulk_opm95ala, aikylkkkoulk_opm95ala, aiklistrikoulk_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_opiskelu_Haku = Case when amkhaku3_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2) in (yotutkopisxkoulk_opm95ala, ammopisxkoulk_opm95ala, amkopisxkoulk1_opm95ala, amkopisxkoulk2_opm95ala, amkopisxkoulk3_opm95ala, yoopisxkoulk1_opm95ala, yoopisxkoulk2_opm95ala, yoopisxkoulk3_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_tutkinto_Haku = Case when amkhaku3_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (aikyotutkkoulk_opmala, aikammkoulk_opmala, aikamkkoulk_opmala, aikylamkkoulk_opmala, aikalkkkoulk_opmala, aikylkkkoulk_opmala, aiklistrikoulk_opmala)
 ) then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_opiskelu_Haku = Case when amkhaku3_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (yotutkopisxkoulk_opmala, ammopisxkoulk_opmala, amkopisxkoulk1_opmala, amkopisxkoulk2_opmala, amkopisxkoulk3_opmala, yoopisxkoulk1_opmala, yoopisxkoulk2_opmala, yoopisxkoulk3_opmala))
  then 'K' else 'E' end,
Johdettu_Sama_oppilaitos_Aiempi_tutkinto_Haku = Case when amkhaku3_tunn in (tunnyotutk, tunnamm, tunnamk, tunnylamk, tunnalkk, tunnylkk, tunnlistri) then 'K' else 'E' end,	
Johdettu_Sama_oppilaitos_Aiempi_opiskelu_Haku = Case when amkhaku3_tunn in (yotutkopisxtunn, ammopisxtunn, amkopisxtunn1, amkopisxtunn2, amkopisxtunn3, yoopisxtunn1, yoopisxtunn2, yoopisxtunn3) then 'K' else 'E' end,	
Johdettu_Sama_sektori_Aiempi_tutkinto_Haku = Case when 'K' in (aikamk, aikylamk) then 'K' else 'E' end,	
Johdettu_Sama_sektori_Aiempi_opiskelu_Haku = Case when 'K' in (amkopisx1, amkopisx2, amkopisx3) then 'K' else 'E' end,
Johdettu_Sama_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when 'K' in (aikamk, aikylamk, amkopisx1, amkopisx2, amkopisx3) then 'K' else 'E' end,	
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_Haku = Case when 'K' in (aikamk, aikylamk, aikalkk, aikylkk, aiklistri) then 'K' else 'E' end,	
Johdettu_Sama_laaja_sektori_Aiempi_opiskelu_Haku = Case when 'K' in (amkopisx1, amkopisx2, amkopisx3, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when 'K' in (aikamk, aikylamk, aikalkk, aikylkk, aiklistri, amkopisx1, amkopisx2, amkopisx3, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Hakenut_Amk_ja_Yo = Case when 
	(amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>'')
	and (yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Korkea_aste_ja_Toinen_aste = Case when 
	(luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'')
	and (amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>''
			or yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Lukio_ja_Ammatillinen_koulutus = Case when 
	((luammhaku1_tunn<>'' and luammhaku1_opmast='31') or (luammhaku2_tunn<>'' and luammhaku2_opmast='31') or (luammhaku3_tunn<>'' and luammhaku3_opmast='31') or (luammhaku4_tunn<>'' and luammhaku4_opmast='31') or (luammhaku5_tunn<>'' and luammhaku5_opmast='31'))
	and ((luammhaku1_tunn<>'' and luammhaku1_opmast<>'31') or (luammhaku2_tunn<>'' and luammhaku2_opmast<>'31') or (luammhaku3_tunn<>'' and luammhaku3_opmast<>'31') or (luammhaku4_tunn<>'' and luammhaku4_opmast<>'31') or (luammhaku5_tunn<>'' and luammhaku5_opmast<>'31'))
	then 'K' else 'E' end,
lkm, 
tietolahde,
rivinumero
FROM VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
WHERE amkhaku3_tunn<>''

UNION ALL
-- Uudet haut, haku amk, prioriteetti 4
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
Haku_avain = 'amk',
Hakukohde_oppilaitos_avain = amkhaku4_tunn, 
Hakukohde_koulutusaste2002_avain = amkhaku4_opmast_avain, 
Hakukohde_koulutusaste_taso2_avain = kkhaku4_kaste_t2_avain, 
Hakukohde_opintoala2002_avain = amkhaku4_opmopa_avain, 
Hakukohde_opintoala1995_avain = amkhaku4_opm95opa_avain, 
Hakukohde_iscfibroad2013_avain = kkhaku4_iscfibroad2013_avain, 
Hakukohde_prioriteetti_avain = 'pr_4', 
Hakukohde_hyvaksytty = amkhaku4_hyv,
Hakukohde_vastaanotettu = amkhaku4_vastotto,
Hakukohde_tutkinnon_taso = 
	Case 
		when tilastovuosi<2015 then
			case	
				when amkhaku4_koultyp <> '' then 'AMK' + amkhaku4_koultyp 
				else '-1' 
			end
		else 
			case
				when amkhaku4_opmast_avain='OPMAST62' then 'AMK1' when amkhaku4_opmast_avain='OPMAST71' then 'AMK3' 
				else '-1' 
			end
	end
,
Hakukohde_tutkinnon_taso_tarkennus = Case when amkhaku4_koultyp <> '' then 'AMKTA' + amkhaku4_koultyp else '-1' end,
Hakukohde_erillisvalinta = '-1',
Hakukohde_koulutuksen_alkamislukukausi_avain = Koulutuksen_alkamislukukausi_avain,
--Johdettu_Hakija_opiskelee_hakukohteessa = Case when amkhaku4_tunn in (amkopisxtunn1,amkopisxtunn2,amkopisxtunn3) then 'K' else 'E' end,	
Johdettu_Sama_koulutusaste02_Aiempi_tutkinto_Haku = Case when amkhaku4_opmast in (aikyotutkkoulk_opmast, aikammkoulk_opmast, aikamkkoulk_opmast, aikylamkkoulk_opmast, aikalkkkoulk_opmast, aikylkkkoulk_opmast, aiklistrikoulk_opmast) then 'K' else 'E' end,
Johdettu_Sama_koulutusaste02_Aiempi_opiskelu_Haku = Case when amkhaku4_opmast in (yotutkopisxkoulk_opmast, ammopisxkoulk_opmast, amkopisxkoulk1_opmast, amkopisxkoulk2_opmast, amkopisxkoulk3_opmast, yoopisxkoulk1_opmast, yoopisxkoulk2_opmast, yoopisxkoulk3_opmast) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_tutkinto_Haku = case when amkhaku4_opm95opa  in (aikyotutkkoulk_opm95opa, aikammkoulk_opm95opa, aikamkkoulk_opm95opa, aikylamkkoulk_opm95opa, aikalkkkoulk_opm95opa, aikylkkkoulk_opm95opa, aiklistrikoulk_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_opiskelu_Haku = Case when amkhaku4_opm95opa in (yotutkopisxkoulk_opm95opa, ammopisxkoulk_opm95opa, amkopisxkoulk1_opm95opa, amkopisxkoulk2_opm95opa, amkopisxkoulk3_opm95opa, yoopisxkoulk1_opm95opa, yoopisxkoulk2_opm95opa, yoopisxkoulk3_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_tutkinto_Haku = Case when amkhaku4_opmopa in (aikyotutkkoulk_opmopa, aikammkoulk_opmopa, aikamkkoulk_opmopa, aikylamkkoulk_opmopa, aikalkkkoulk_opmopa, aikylkkkoulk_opmopa, aiklistrikoulk_opmopa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_opiskelu_Haku = Case when amkhaku4_opmopa in (yotutkopisxkoulk_opmopa, ammopisxkoulk_opmopa, amkopisxkoulk1_opmopa, amkopisxkoulk2_opmopa, amkopisxkoulk3_opmopa, yoopisxkoulk1_opmopa, yoopisxkoulk2_opmopa, yoopisxkoulk3_opmopa) then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_tutkinto_Haku = case when amkhaku4_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2) in (aikyotutkkoulk_opm95ala, aikammkoulk_opm95ala, aikamkkoulk_opm95ala, aikylamkkoulk_opm95ala, aikalkkkoulk_opm95ala, aikylkkkoulk_opm95ala, aiklistrikoulk_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_opiskelu_Haku = Case when amkhaku4_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2) in (yotutkopisxkoulk_opm95ala, ammopisxkoulk_opm95ala, amkopisxkoulk1_opm95ala, amkopisxkoulk2_opm95ala, amkopisxkoulk3_opm95ala, yoopisxkoulk1_opm95ala, yoopisxkoulk2_opm95ala, yoopisxkoulk3_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_tutkinto_Haku = Case when amkhaku4_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (aikyotutkkoulk_opmala, aikammkoulk_opmala, aikamkkoulk_opmala, aikylamkkoulk_opmala, aikalkkkoulk_opmala, aikylkkkoulk_opmala, aiklistrikoulk_opmala)
 ) then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_opiskelu_Haku = Case when amkhaku4_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (yotutkopisxkoulk_opmala, ammopisxkoulk_opmala, amkopisxkoulk1_opmala, amkopisxkoulk2_opmala, amkopisxkoulk3_opmala, yoopisxkoulk1_opmala, yoopisxkoulk2_opmala, yoopisxkoulk3_opmala))
  then 'K' else 'E' end,
Johdettu_Sama_oppilaitos_Aiempi_tutkinto_Haku = Case when amkhaku4_tunn in (tunnyotutk, tunnamm, tunnamk, tunnylamk, tunnalkk, tunnylkk, tunnlistri) then 'K' else 'E' end,	
Johdettu_Sama_oppilaitos_Aiempi_opiskelu_Haku = Case when amkhaku4_tunn in (yotutkopisxtunn, ammopisxtunn, amkopisxtunn1, amkopisxtunn2, amkopisxtunn3, yoopisxtunn1, yoopisxtunn2, yoopisxtunn3) then 'K' else 'E' end,	
Johdettu_Sama_sektori_Aiempi_tutkinto_Haku = Case when 'K' in (aikamk, aikylamk) then 'K' else 'E' end,	
Johdettu_Sama_sektori_Aiempi_opiskelu_Haku = Case when 'K' in (amkopisx1, amkopisx2, amkopisx3) then 'K' else 'E' end,
Johdettu_Sama_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when 'K' in (aikamk, aikylamk, amkopisx1, amkopisx2, amkopisx3) then 'K' else 'E' end,	
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_Haku = Case when 'K' in (aikamk, aikylamk, aikalkk, aikylkk, aiklistri) then 'K' else 'E' end,	
Johdettu_Sama_laaja_sektori_Aiempi_opiskelu_Haku = Case when 'K' in (amkopisx1, amkopisx2, amkopisx3, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when 'K' in (aikamk, aikylamk, aikalkk, aikylkk, aiklistri, amkopisx1, amkopisx2, amkopisx3, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Hakenut_Amk_ja_Yo = Case when 
	(amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>'')
	and (yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Korkea_aste_ja_Toinen_aste = Case when 
	(luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'')
	and (amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>''
			or yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Lukio_ja_Ammatillinen_koulutus = Case when 
	((luammhaku1_tunn<>'' and luammhaku1_opmast='31') or (luammhaku2_tunn<>'' and luammhaku2_opmast='31') or (luammhaku3_tunn<>'' and luammhaku3_opmast='31') or (luammhaku4_tunn<>'' and luammhaku4_opmast='31') or (luammhaku5_tunn<>'' and luammhaku5_opmast='31'))
	and ((luammhaku1_tunn<>'' and luammhaku1_opmast<>'31') or (luammhaku2_tunn<>'' and luammhaku2_opmast<>'31') or (luammhaku3_tunn<>'' and luammhaku3_opmast<>'31') or (luammhaku4_tunn<>'' and luammhaku4_opmast<>'31') or (luammhaku5_tunn<>'' and luammhaku5_opmast<>'31'))
	then 'K' else 'E' end,
lkm, 
tietolahde,
rivinumero
FROM VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
WHERE amkhaku4_tunn<>''

UNION ALL
-- Uudet haut, haku amk, prioriteetti 5
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
Haku_avain = 'amk',
Hakukohde_oppilaitos_avain = amkhaku5_tunn, 
Hakukohde_koulutusaste2002_avain = amkhaku5_opmast_avain, 
Hakukohde_koulutusaste_taso2_avain = kkhaku5_kaste_t2_avain, 
Hakukohde_opintoala2002_avain = amkhaku5_opmopa_avain, 
Hakukohde_opintoala1995_avain = amkhaku5_opm95opa_avain, 
Hakukohde_iscfibroad2013_avain = kkhaku5_iscfibroad2013_avain, 
Hakukohde_prioriteetti_avain = 'pr_5', 
Hakukohde_hyvaksytty = amkhaku5_hyv,
Hakukohde_vastaanotettu = amkhaku5_vastotto,
Hakukohde_tutkinnon_taso = case when amkhaku5_opmast_avain='OPMAST62' then 'AMK1' when amkhaku5_opmast_avain='OPMAST71' then 'AMK3' else '-1' end,--Case when amkhaku4_koultyp <> '' then 'AMK' + amkhaku4_koultyp else '-1' end,
Hakukohde_tutkinnon_taso_tarkennus = '-1',--Case when amkhaku4_koultyp <> '' then 'AMKTA' + amkhaku4_koultyp else '-1' end,
Hakukohde_erillisvalinta = '-1',
Hakukohde_koulutuksen_alkamislukukausi_avain = Koulutuksen_alkamislukukausi_avain,
--Johdettu_Hakija_opiskelee_hakukohteessa = Case when amkhaku4_tunn in (amkopisxtunn1,amkopisxtunn2,amkopisxtunn3) then 'K' else 'E' end,	
Johdettu_Sama_koulutusaste02_Aiempi_tutkinto_Haku = Case when amkhaku5_opmast in (aikyotutkkoulk_opmast, aikammkoulk_opmast, aikamkkoulk_opmast, aikylamkkoulk_opmast, aikalkkkoulk_opmast, aikylkkkoulk_opmast, aiklistrikoulk_opmast) then 'K' else 'E' end,
Johdettu_Sama_koulutusaste02_Aiempi_opiskelu_Haku = Case when amkhaku5_opmast in (yotutkopisxkoulk_opmast, ammopisxkoulk_opmast, amkopisxkoulk1_opmast, amkopisxkoulk2_opmast, amkopisxkoulk3_opmast, yoopisxkoulk1_opmast, yoopisxkoulk2_opmast, yoopisxkoulk3_opmast) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_tutkinto_Haku = case when amkhaku5_opm95opa  in (aikyotutkkoulk_opm95opa, aikammkoulk_opm95opa, aikamkkoulk_opm95opa, aikylamkkoulk_opm95opa, aikalkkkoulk_opm95opa, aikylkkkoulk_opm95opa, aiklistrikoulk_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_opiskelu_Haku = Case when amkhaku5_opm95opa in (yotutkopisxkoulk_opm95opa, ammopisxkoulk_opm95opa, amkopisxkoulk1_opm95opa, amkopisxkoulk2_opm95opa, amkopisxkoulk3_opm95opa, yoopisxkoulk1_opm95opa, yoopisxkoulk2_opm95opa, yoopisxkoulk3_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_tutkinto_Haku = Case when amkhaku5_opmopa in (aikyotutkkoulk_opmopa, aikammkoulk_opmopa, aikamkkoulk_opmopa, aikylamkkoulk_opmopa, aikalkkkoulk_opmopa, aikylkkkoulk_opmopa, aiklistrikoulk_opmopa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_opiskelu_Haku = Case when amkhaku5_opmopa in (yotutkopisxkoulk_opmopa, ammopisxkoulk_opmopa, amkopisxkoulk1_opmopa, amkopisxkoulk2_opmopa, amkopisxkoulk3_opmopa, yoopisxkoulk1_opmopa, yoopisxkoulk2_opmopa, yoopisxkoulk3_opmopa) then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_tutkinto_Haku = case when amkhaku5_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2) in (aikyotutkkoulk_opm95ala, aikammkoulk_opm95ala, aikamkkoulk_opm95ala, aikylamkkoulk_opm95ala, aikalkkkoulk_opm95ala, aikylkkkoulk_opm95ala, aiklistrikoulk_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_opiskelu_Haku = Case when amkhaku5_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2) in (yotutkopisxkoulk_opm95ala, ammopisxkoulk_opm95ala, amkopisxkoulk1_opm95ala, amkopisxkoulk2_opm95ala, amkopisxkoulk3_opm95ala, yoopisxkoulk1_opm95ala, yoopisxkoulk2_opm95ala, yoopisxkoulk3_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_tutkinto_Haku = Case when amkhaku5_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (aikyotutkkoulk_opmala, aikammkoulk_opmala, aikamkkoulk_opmala, aikylamkkoulk_opmala, aikalkkkoulk_opmala, aikylkkkoulk_opmala, aiklistrikoulk_opmala)
 ) then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_opiskelu_Haku = Case when amkhaku5_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (yotutkopisxkoulk_opmala, ammopisxkoulk_opmala, amkopisxkoulk1_opmala, amkopisxkoulk2_opmala, amkopisxkoulk3_opmala, yoopisxkoulk1_opmala, yoopisxkoulk2_opmala, yoopisxkoulk3_opmala))
  then 'K' else 'E' end,
Johdettu_Sama_oppilaitos_Aiempi_tutkinto_Haku = Case when amkhaku5_tunn in (tunnyotutk, tunnamm, tunnamk, tunnylamk, tunnalkk, tunnylkk, tunnlistri) then 'K' else 'E' end,	
Johdettu_Sama_oppilaitos_Aiempi_opiskelu_Haku = Case when amkhaku5_tunn in (yotutkopisxtunn, ammopisxtunn, amkopisxtunn1, amkopisxtunn2, amkopisxtunn3, yoopisxtunn1, yoopisxtunn2, yoopisxtunn3) then 'K' else 'E' end,	
Johdettu_Sama_sektori_Aiempi_tutkinto_Haku = Case when 'K' in (aikamk, aikylamk) then 'K' else 'E' end,	
Johdettu_Sama_sektori_Aiempi_opiskelu_Haku = Case when 'K' in (amkopisx1, amkopisx2, amkopisx3) then 'K' else 'E' end,
Johdettu_Sama_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when 'K' in (aikamk, aikylamk, amkopisx1, amkopisx2, amkopisx3) then 'K' else 'E' end,	
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_Haku = Case when 'K' in (aikamk, aikylamk, aikalkk, aikylkk, aiklistri) then 'K' else 'E' end,	
Johdettu_Sama_laaja_sektori_Aiempi_opiskelu_Haku = Case when 'K' in (amkopisx1, amkopisx2, amkopisx3, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when 'K' in (aikamk, aikylamk, aikalkk, aikylkk, aiklistri, amkopisx1, amkopisx2, amkopisx3, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Hakenut_Amk_ja_Yo = Case when 
	(amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>'')
	and (yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Korkea_aste_ja_Toinen_aste = Case when 
	(luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'')
	and (amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>''
			or yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Lukio_ja_Ammatillinen_koulutus = Case when 
	((luammhaku1_tunn<>'' and luammhaku1_opmast='31') or (luammhaku2_tunn<>'' and luammhaku2_opmast='31') or (luammhaku3_tunn<>'' and luammhaku3_opmast='31') or (luammhaku4_tunn<>'' and luammhaku4_opmast='31') or (luammhaku5_tunn<>'' and luammhaku5_opmast='31'))
	and ((luammhaku1_tunn<>'' and luammhaku1_opmast<>'31') or (luammhaku2_tunn<>'' and luammhaku2_opmast<>'31') or (luammhaku3_tunn<>'' and luammhaku3_opmast<>'31') or (luammhaku4_tunn<>'' and luammhaku4_opmast<>'31') or (luammhaku5_tunn<>'' and luammhaku5_opmast<>'31'))
	then 'K' else 'E' end,
lkm, 
tietolahde,
rivinumero
FROM VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
WHERE amkhaku5_tunn<>''

UNION ALL
-- Uudet haut, haku amk, prioriteetti 6
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
Haku_avain = 'amk',
Hakukohde_oppilaitos_avain = amkhaku6_tunn, 
Hakukohde_koulutusaste2002_avain = amkhaku6_opmast_avain, 
Hakukohde_koulutusaste_taso2_avain = kkhaku6_kaste_t2_avain, 
Hakukohde_opintoala2002_avain = amkhaku6_opmopa_avain, 
Hakukohde_opintoala1995_avain = amkhaku6_opm95opa_avain, 
Hakukohde_iscfibroad2013_avain = kkhaku6_iscfibroad2013_avain, 
Hakukohde_prioriteetti_avain = 'pr_6', 
Hakukohde_hyvaksytty = amkhaku6_hyv,
Hakukohde_vastaanotettu = amkhaku6_vastotto,
Hakukohde_tutkinnon_taso = case when amkhaku6_opmast_avain='OPMAST62' then 'AMK1' when amkhaku6_opmast_avain='OPMAST71' then 'AMK3' else '-1' end,--Case when amkhaku6_koultyp <> '' then 'AMK' + amkhaku6_koultyp else '-1' end,
Hakukohde_tutkinnon_taso_tarkennus = '-1',--Case when amkhaku6_koultyp <> '' then 'AMKTA' + amkhaku6_koultyp else '-1' end,
Hakukohde_erillisvalinta = '-1',
Hakukohde_koulutuksen_alkamislukukausi_avain = Koulutuksen_alkamislukukausi_avain,
--Johdettu_Hakija_opiskelee_hakukohteessa = Case when amkhaku4_tunn in (amkopisxtunn1,amkopisxtunn2,amkopisxtunn3) then 'K' else 'E' end,	
Johdettu_Sama_koulutusaste02_Aiempi_tutkinto_Haku = Case when amkhaku6_opmast in (aikyotutkkoulk_opmast, aikammkoulk_opmast, aikamkkoulk_opmast, aikylamkkoulk_opmast, aikalkkkoulk_opmast, aikylkkkoulk_opmast, aiklistrikoulk_opmast) then 'K' else 'E' end,
Johdettu_Sama_koulutusaste02_Aiempi_opiskelu_Haku = Case when amkhaku6_opmast in (yotutkopisxkoulk_opmast, ammopisxkoulk_opmast, amkopisxkoulk1_opmast, amkopisxkoulk2_opmast, amkopisxkoulk3_opmast, yoopisxkoulk1_opmast, yoopisxkoulk2_opmast, yoopisxkoulk3_opmast) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_tutkinto_Haku = case when amkhaku6_opm95opa  in (aikyotutkkoulk_opm95opa, aikammkoulk_opm95opa, aikamkkoulk_opm95opa, aikylamkkoulk_opm95opa, aikalkkkoulk_opm95opa, aikylkkkoulk_opm95opa, aiklistrikoulk_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_opiskelu_Haku = Case when amkhaku6_opm95opa in (yotutkopisxkoulk_opm95opa, ammopisxkoulk_opm95opa, amkopisxkoulk1_opm95opa, amkopisxkoulk2_opm95opa, amkopisxkoulk3_opm95opa, yoopisxkoulk1_opm95opa, yoopisxkoulk2_opm95opa, yoopisxkoulk3_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_tutkinto_Haku = Case when amkhaku6_opmopa in (aikyotutkkoulk_opmopa, aikammkoulk_opmopa, aikamkkoulk_opmopa, aikylamkkoulk_opmopa, aikalkkkoulk_opmopa, aikylkkkoulk_opmopa, aiklistrikoulk_opmopa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_opiskelu_Haku = Case when amkhaku6_opmopa in (yotutkopisxkoulk_opmopa, ammopisxkoulk_opmopa, amkopisxkoulk1_opmopa, amkopisxkoulk2_opmopa, amkopisxkoulk3_opmopa, yoopisxkoulk1_opmopa, yoopisxkoulk2_opmopa, yoopisxkoulk3_opmopa) then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_tutkinto_Haku = case when amkhaku6_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2) in (aikyotutkkoulk_opm95ala, aikammkoulk_opm95ala, aikamkkoulk_opm95ala, aikylamkkoulk_opm95ala, aikalkkkoulk_opm95ala, aikylkkkoulk_opm95ala, aiklistrikoulk_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_opiskelu_Haku = Case when amkhaku6_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2) in (yotutkopisxkoulk_opm95ala, ammopisxkoulk_opm95ala, amkopisxkoulk1_opm95ala, amkopisxkoulk2_opm95ala, amkopisxkoulk3_opm95ala, yoopisxkoulk1_opm95ala, yoopisxkoulk2_opm95ala, yoopisxkoulk3_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_tutkinto_Haku = Case when amkhaku6_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (aikyotutkkoulk_opmala, aikammkoulk_opmala, aikamkkoulk_opmala, aikylamkkoulk_opmala, aikalkkkoulk_opmala, aikylkkkoulk_opmala, aiklistrikoulk_opmala)
 ) then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_opiskelu_Haku = Case when amkhaku6_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (yotutkopisxkoulk_opmala, ammopisxkoulk_opmala, amkopisxkoulk1_opmala, amkopisxkoulk2_opmala, amkopisxkoulk3_opmala, yoopisxkoulk1_opmala, yoopisxkoulk2_opmala, yoopisxkoulk3_opmala))
  then 'K' else 'E' end,
Johdettu_Sama_oppilaitos_Aiempi_tutkinto_Haku = Case when amkhaku6_tunn in (tunnyotutk, tunnamm, tunnamk, tunnylamk, tunnalkk, tunnylkk, tunnlistri) then 'K' else 'E' end,	
Johdettu_Sama_oppilaitos_Aiempi_opiskelu_Haku = Case when amkhaku6_tunn in (yotutkopisxtunn, ammopisxtunn, amkopisxtunn1, amkopisxtunn2, amkopisxtunn3, yoopisxtunn1, yoopisxtunn2, yoopisxtunn3) then 'K' else 'E' end,	
Johdettu_Sama_sektori_Aiempi_tutkinto_Haku = Case when 'K' in (aikamk, aikylamk) then 'K' else 'E' end,	
Johdettu_Sama_sektori_Aiempi_opiskelu_Haku = Case when 'K' in (amkopisx1, amkopisx2, amkopisx3) then 'K' else 'E' end,
Johdettu_Sama_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when 'K' in (aikamk, aikylamk, amkopisx1, amkopisx2, amkopisx3) then 'K' else 'E' end,	
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_Haku = Case when 'K' in (aikamk, aikylamk, aikalkk, aikylkk, aiklistri) then 'K' else 'E' end,	
Johdettu_Sama_laaja_sektori_Aiempi_opiskelu_Haku = Case when 'K' in (amkopisx1, amkopisx2, amkopisx3, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when 'K' in (aikamk, aikylamk, aikalkk, aikylkk, aiklistri, amkopisx1, amkopisx2, amkopisx3, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Hakenut_Amk_ja_Yo = Case when 
	(amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>'')
	and (yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Korkea_aste_ja_Toinen_aste = Case when 
	(luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'')
	and (amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>''
			or yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Lukio_ja_Ammatillinen_koulutus = Case when 
	((luammhaku1_tunn<>'' and luammhaku1_opmast='31') or (luammhaku2_tunn<>'' and luammhaku2_opmast='31') or (luammhaku3_tunn<>'' and luammhaku3_opmast='31') or (luammhaku4_tunn<>'' and luammhaku4_opmast='31') or (luammhaku5_tunn<>'' and luammhaku5_opmast='31'))
	and ((luammhaku1_tunn<>'' and luammhaku1_opmast<>'31') or (luammhaku2_tunn<>'' and luammhaku2_opmast<>'31') or (luammhaku3_tunn<>'' and luammhaku3_opmast<>'31') or (luammhaku4_tunn<>'' and luammhaku4_opmast<>'31') or (luammhaku5_tunn<>'' and luammhaku5_opmast<>'31'))
	then 'K' else 'E' end,
lkm, 
tietolahde,
rivinumero
FROM VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
WHERE amkhaku6_tunn<>''

UNION ALL

-- Uudet haut, haku amk, prioriteetti muu
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
Haku_avain = 'amk',
Hakukohde_oppilaitos_avain = amkhakum_tunn, 
Hakukohde_koulutusaste2002_avain = amkhakum_opmast_avain,
Hakukohde_koulutusaste_taso2_avain = '-1',
Hakukohde_opintoala2002_avain = amkhakum_opmopa_avain, 
Hakukohde_opintoala1995_avain = amkhakum_opm95opa_avain, 
Hakukohde_iscfibroad2013_avain = '-1', 
Hakukohde_prioriteetti_avain = 'pr_muu', 
Hakukohde_hyvaksytty = amkhakum_hyv,
Hakukohde_vastaanotettu = amkhakum_vastotto,
Hakukohde_tutkinnon_taso = Case when amkhakum_koultyp <> '' then 'AMK' + amkhakum_koultyp else '-1' end,
Hakukohde_tutkinnon_taso_tarkennus = Case when amkhakum_koultyp <> '' then 'AMKTA' + amkhakum_koultyp else '-1' end,
Hakukohde_erillisvalinta = '-1',
Hakukohde_koulutuksen_alkamislukukausi_avain = Koulutuksen_alkamislukukausi_avain,
--Johdettu_Hakija_opiskelee_hakukohteessa = Case when amkhakum_tunn in (amkopisxtunn1,amkopisxtunn2,amkopisxtunn3) then 'K' else 'E' end,	
Johdettu_Sama_koulutusaste02_Aiempi_tutkinto_Haku = Case when amkhakum_opmast in (aikyotutkkoulk_opmast, aikammkoulk_opmast, aikamkkoulk_opmast, aikylamkkoulk_opmast, aikalkkkoulk_opmast, aikylkkkoulk_opmast, aiklistrikoulk_opmast) then 'K' else 'E' end,
Johdettu_Sama_koulutusaste02_Aiempi_opiskelu_Haku = Case when amkhakum_opmast in (yotutkopisxkoulk_opmast, ammopisxkoulk_opmast, amkopisxkoulk1_opmast, amkopisxkoulk2_opmast, amkopisxkoulk3_opmast, yoopisxkoulk1_opmast, yoopisxkoulk2_opmast, yoopisxkoulk3_opmast) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_tutkinto_Haku = case when amkhakum_opm95opa  in (aikyotutkkoulk_opm95opa, aikammkoulk_opm95opa, aikamkkoulk_opm95opa, aikylamkkoulk_opm95opa, aikalkkkoulk_opm95opa, aikylkkkoulk_opm95opa, aiklistrikoulk_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_opiskelu_Haku = Case when amkhakum_opm95opa in (yotutkopisxkoulk_opm95opa, ammopisxkoulk_opm95opa, amkopisxkoulk1_opm95opa, amkopisxkoulk2_opm95opa, amkopisxkoulk3_opm95opa, yoopisxkoulk1_opm95opa, yoopisxkoulk2_opm95opa, yoopisxkoulk3_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_tutkinto_Haku = Case when amkhakum_opmopa in (aikyotutkkoulk_opmopa, aikammkoulk_opmopa, aikamkkoulk_opmopa, aikylamkkoulk_opmopa, aikalkkkoulk_opmopa, aikylkkkoulk_opmopa, aiklistrikoulk_opmopa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_opiskelu_Haku = Case when amkhakum_opmopa in (yotutkopisxkoulk_opmopa, ammopisxkoulk_opmopa, amkopisxkoulk1_opmopa, amkopisxkoulk2_opmopa, amkopisxkoulk3_opmopa, yoopisxkoulk1_opmopa, yoopisxkoulk2_opmopa, yoopisxkoulk3_opmopa) then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_tutkinto_Haku = case when amkhakum_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2) in (aikyotutkkoulk_opm95ala, aikammkoulk_opm95ala, aikamkkoulk_opm95ala, aikylamkkoulk_opm95ala, aikalkkkoulk_opm95ala, aikylkkkoulk_opm95ala, aiklistrikoulk_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_opiskelu_Haku = Case when amkhakum_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2) in (yotutkopisxkoulk_opm95ala, ammopisxkoulk_opm95ala, amkopisxkoulk1_opm95ala, amkopisxkoulk2_opm95ala, amkopisxkoulk3_opm95ala, yoopisxkoulk1_opm95ala, yoopisxkoulk2_opm95ala, yoopisxkoulk3_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_tutkinto_Haku = Case when amkhakum_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (aikyotutkkoulk_opmala, aikammkoulk_opmala, aikamkkoulk_opmala, aikylamkkoulk_opmala, aikalkkkoulk_opmala, aikylkkkoulk_opmala, aiklistrikoulk_opmala)
 ) then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_opiskelu_Haku = Case when amkhakum_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (yotutkopisxkoulk_opmala, ammopisxkoulk_opmala, amkopisxkoulk1_opmala, amkopisxkoulk2_opmala, amkopisxkoulk3_opmala, yoopisxkoulk1_opmala, yoopisxkoulk2_opmala, yoopisxkoulk3_opmala))
  then 'K' else 'E' end,
Johdettu_Sama_oppilaitos_Aiempi_tutkinto_Haku = Case when amkhakum_tunn in (tunnyotutk, tunnamm, tunnamk, tunnylamk, tunnalkk, tunnylkk, tunnlistri) then 'K' else 'E' end,	
Johdettu_Sama_oppilaitos_Aiempi_opiskelu_Haku = Case when amkhakum_tunn in (yotutkopisxtunn, ammopisxtunn, amkopisxtunn1, amkopisxtunn2, amkopisxtunn3, yoopisxtunn1, yoopisxtunn2, yoopisxtunn3) then 'K' else 'E' end,	
Johdettu_Sama_sektori_Aiempi_tutkinto_Haku = Case when 'K' in (aikamk, aikylamk) then 'K' else 'E' end,	
Johdettu_Sama_sektori_Aiempi_opiskelu_Haku = Case when 'K' in (amkopisx1, amkopisx2, amkopisx3) then 'K' else 'E' end,
Johdettu_Sama_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when 'K' in (aikamk, aikylamk, amkopisx1, amkopisx2, amkopisx3) then 'K' else 'E' end,	
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_Haku = Case when 'K' in (aikamk, aikylamk, aikalkk, aikylkk, aiklistri) then 'K' else 'E' end,	
Johdettu_Sama_laaja_sektori_Aiempi_opiskelu_Haku = Case when 'K' in (amkopisx1, amkopisx2, amkopisx3, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when 'K' in (aikamk, aikylamk, aikalkk, aikylkk, aiklistri, amkopisx1, amkopisx2, amkopisx3, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Hakenut_Amk_ja_Yo = Case when 
	(amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>'')
	and (yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Korkea_aste_ja_Toinen_aste = Case when 
	(luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'')
	and (amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>''
			or yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Lukio_ja_Ammatillinen_koulutus = Case when 
	((luammhaku1_tunn<>'' and luammhaku1_opmast='31') or (luammhaku2_tunn<>'' and luammhaku2_opmast='31') or (luammhaku3_tunn<>'' and luammhaku3_opmast='31') or (luammhaku4_tunn<>'' and luammhaku4_opmast='31') or (luammhaku5_tunn<>'' and luammhaku5_opmast='31'))
	and ((luammhaku1_tunn<>'' and luammhaku1_opmast<>'31') or (luammhaku2_tunn<>'' and luammhaku2_opmast<>'31') or (luammhaku3_tunn<>'' and luammhaku3_opmast<>'31') or (luammhaku4_tunn<>'' and luammhaku4_opmast<>'31') or (luammhaku5_tunn<>'' and luammhaku5_opmast<>'31'))
	then 'K' else 'E' end,
lkm, 
tietolahde,
rivinumero
FROM VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
WHERE amkhakum_tunn<>''

UNION ALL
-- Uudet haut, haku yo, kohde a, prioriteetti muu
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
Haku_avain = 'yo',
Hakukohde_oppilaitos_avain = yohakua_tunn, 
Hakukohde_koulutusaste2002_avain = yohakua_opmast_avain, 
Hakukohde_koulutusaste_taso2_avain = kkhaku1_kaste_t2_avain,
Hakukohde_opintoala2002_avain = yohakua_opmopa_avain, 
Hakukohde_opintoala1995_avain = yohakua_opm95opa_avain, 
Hakukohde_iscfibroad2013_avain = kkhaku1_iscfibroad2013_avain, 
Hakukohde_prioriteetti_avain = case when Tilastovuosi<2015 then 'pr_ei' else 'pr_1' end, 
Hakukohde_hyvaksytty = yohakua_hyv,
Hakukohde_vastaanotettu = yohakua_vastotto,
Hakukohde_tutkinnon_taso = Case when yohakua_harekast <> '' then 'YO' + yohakua_harekast else '-1' end,
Hakukohde_tutkinnon_taso_tarkennus = Case when yohakua_ylempi <> '' then 'YOTA' + yohakua_ylempi else '-1' end,
Hakukohde_erillisvalinta = yohakua_erval,
Hakukohde_koulutuksen_alkamislukukausi_avain = Koulutuksen_alkamislukukausi_avain,
--Johdettu_Hakija_opiskelee_hakukohteessa = Case when yohakua_tunn in (yoopisxtunn1,yoopisxtunn2,yoopisxtunn3) then 'K' else 'E' end,	
Johdettu_Sama_koulutusaste02_Aiempi_tutkinto_Haku = Case when yohakua_opmast in (aikyotutkkoulk_opmast, aikammkoulk_opmast, aikamkkoulk_opmast, aikylamkkoulk_opmast, aikalkkkoulk_opmast, aikylkkkoulk_opmast, aiklistrikoulk_opmast) then 'K' else 'E' end,
Johdettu_Sama_koulutusaste02_Aiempi_opiskelu_Haku = Case when yohakua_opmast in (yotutkopisxkoulk_opmast, ammopisxkoulk_opmast, amkopisxkoulk1_opmast, amkopisxkoulk2_opmast, amkopisxkoulk3_opmast, yoopisxkoulk1_opmast, yoopisxkoulk2_opmast, yoopisxkoulk3_opmast) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_tutkinto_Haku = case when yohakua_opm95opa  in (aikyotutkkoulk_opm95opa, aikammkoulk_opm95opa, aikamkkoulk_opm95opa, aikylamkkoulk_opm95opa, aikalkkkoulk_opm95opa, aikylkkkoulk_opm95opa, aiklistrikoulk_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_opiskelu_Haku = Case when yohakua_opm95opa in (yotutkopisxkoulk_opm95opa, ammopisxkoulk_opm95opa, amkopisxkoulk1_opm95opa, amkopisxkoulk2_opm95opa, amkopisxkoulk3_opm95opa, yoopisxkoulk1_opm95opa, yoopisxkoulk2_opm95opa, yoopisxkoulk3_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_tutkinto_Haku = Case when yohakua_opmopa in (aikyotutkkoulk_opmopa, aikammkoulk_opmopa, aikamkkoulk_opmopa, aikylamkkoulk_opmopa, aikalkkkoulk_opmopa, aikylkkkoulk_opmopa, aiklistrikoulk_opmopa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_opiskelu_Haku = Case when yohakua_opmopa in (yotutkopisxkoulk_opmopa, ammopisxkoulk_opmopa, amkopisxkoulk1_opmopa, amkopisxkoulk2_opmopa, amkopisxkoulk3_opmopa, yoopisxkoulk1_opmopa, yoopisxkoulk2_opmopa, yoopisxkoulk3_opmopa) then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_tutkinto_Haku = case when yohakua_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2) in (aikyotutkkoulk_opm95ala, aikammkoulk_opm95ala, aikamkkoulk_opm95ala, aikylamkkoulk_opm95ala, aikalkkkoulk_opm95ala, aikylkkkoulk_opm95ala, aiklistrikoulk_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_opiskelu_Haku = Case when yohakua_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2) in (yotutkopisxkoulk_opm95ala, ammopisxkoulk_opm95ala, amkopisxkoulk1_opm95ala, amkopisxkoulk2_opm95ala, amkopisxkoulk3_opm95ala, yoopisxkoulk1_opm95ala, yoopisxkoulk2_opm95ala, yoopisxkoulk3_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_tutkinto_Haku = Case when yohakua_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (aikyotutkkoulk_opmala, aikammkoulk_opmala, aikamkkoulk_opmala, aikylamkkoulk_opmala, aikalkkkoulk_opmala, aikylkkkoulk_opmala, aiklistrikoulk_opmala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_opiskelu_Haku = Case when yohakua_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (yotutkopisxkoulk_opmala, ammopisxkoulk_opmala, amkopisxkoulk1_opmala, amkopisxkoulk2_opmala, amkopisxkoulk3_opmala, yoopisxkoulk1_opmala, yoopisxkoulk2_opmala, yoopisxkoulk3_opmala))
  then 'K' else 'E' end,
Johdettu_Sama_oppilaitos_Aiempi_tutkinto_Haku = Case when yohakua_tunn in (tunnyotutk, tunnamm, tunnamk, tunnylamk, tunnalkk, tunnylkk, tunnlistri) then 'K' else 'E' end,	
Johdettu_Sama_oppilaitos_Aiempi_opiskelu_Haku = Case when yohakua_tunn in (yotutkopisxtunn, ammopisxtunn, amkopisxtunn1, amkopisxtunn2, amkopisxtunn3, yoopisxtunn1, yoopisxtunn2, yoopisxtunn3) then 'K' else 'E' end,	
Johdettu_Sama_sektori_Aiempi_tutkinto_Haku = Case when 'K' in (aikalkk, aikylkk, aiklistri) then 'K' else 'E' end,	
Johdettu_Sama_sektori_Aiempi_opiskelu_Haku = Case when 'K' in (yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Sama_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when 'K' in (aikalkk, aikylkk, aiklistri, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,	
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_Haku = Case when 'K' in (aikamk, aikylamk, aikalkk, aikylkk, aiklistri) then 'K' else 'E' end,	
Johdettu_Sama_laaja_sektori_Aiempi_opiskelu_Haku = Case when 'K' in (amkopisx1, amkopisx2, amkopisx3, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when 'K' in (aikamk, aikylamk, aikalkk, aikylkk, aiklistri, amkopisx1, amkopisx2, amkopisx3, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Hakenut_Amk_ja_Yo = Case when 
	(amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>'')
	and (yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Korkea_aste_ja_Toinen_aste = Case when 
	(luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'')
	and (amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>''
			or yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Lukio_ja_Ammatillinen_koulutus = Case when 
	((luammhaku1_tunn<>'' and luammhaku1_opmast='31') or (luammhaku2_tunn<>'' and luammhaku2_opmast='31') or (luammhaku3_tunn<>'' and luammhaku3_opmast='31') or (luammhaku4_tunn<>'' and luammhaku4_opmast='31') or (luammhaku5_tunn<>'' and luammhaku5_opmast='31'))
	and ((luammhaku1_tunn<>'' and luammhaku1_opmast<>'31') or (luammhaku2_tunn<>'' and luammhaku2_opmast<>'31') or (luammhaku3_tunn<>'' and luammhaku3_opmast<>'31') or (luammhaku4_tunn<>'' and luammhaku4_opmast<>'31') or (luammhaku5_tunn<>'' and luammhaku5_opmast<>'31'))
	then 'K' else 'E' end,
lkm, 
tietolahde,
rivinumero
FROM VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
WHERE yohakua_tunn<>''

UNION ALL
-- Uudet haut, haku yo, kohde b, prioriteetti muu
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
Haku_avain = 'yo',
Hakukohde_oppilaitos_avain = yohakub_tunn, 
Hakukohde_koulutusaste2002_avain = yohakub_opmast_avain, 
Hakukohde_koulutusaste_taso2_avain = kkhaku2_kaste_t2_avain,
Hakukohde_opintoala2002_avain = yohakub_opmopa_avain, 
Hakukohde_opintoala1995_avain = yohakub_opm95opa_avain, 
Hakukohde_iscfibroad2013_avain = kkhaku2_iscfibroad2013_avain,  
Hakukohde_prioriteetti_avain = case when Tilastovuosi<2015 then 'pr_ei' else 'pr_2' end, 
Hakukohde_hyvaksytty = yohakub_hyv,
Hakukohde_vastaanotettu = yohakub_vastotto,
Hakukohde_tutkinnon_taso = Case when yohakub_harekast <> '' then 'YO' + yohakub_harekast else '-1' end,
Hakukohde_tutkinnon_taso_tarkennus = Case when yohakub_ylempi <> '' then 'YOTA' + yohakub_ylempi else '-1' end,
Hakukohde_erillisvalinta = yohakub_erval,
Hakukohde_koulutuksen_alkamislukukausi_avain = Koulutuksen_alkamislukukausi_avain,
--Johdettu_Hakija_opiskelee_hakukohteessa = Case when yohakub_tunn in (yoopisxtunn1,yoopisxtunn2,yoopisxtunn3) then 'K' else 'E' end,	
Johdettu_Sama_koulutusaste02_Aiempi_tutkinto_Haku = Case when yohakub_opmast in (aikyotutkkoulk_opmast, aikammkoulk_opmast, aikamkkoulk_opmast, aikylamkkoulk_opmast, aikalkkkoulk_opmast, aikylkkkoulk_opmast, aiklistrikoulk_opmast) then 'K' else 'E' end,
Johdettu_Sama_koulutusaste02_Aiempi_opiskelu_Haku = Case when yohakub_opmast in (yotutkopisxkoulk_opmast, ammopisxkoulk_opmast, amkopisxkoulk1_opmast, amkopisxkoulk2_opmast, amkopisxkoulk3_opmast, yoopisxkoulk1_opmast, yoopisxkoulk2_opmast, yoopisxkoulk3_opmast) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_tutkinto_Haku = case when yohakub_opm95opa  in (aikyotutkkoulk_opm95opa, aikammkoulk_opm95opa, aikamkkoulk_opm95opa, aikylamkkoulk_opm95opa, aikalkkkoulk_opm95opa, aikylkkkoulk_opm95opa, aiklistrikoulk_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_opiskelu_Haku = Case when yohakub_opm95opa in (yotutkopisxkoulk_opm95opa, ammopisxkoulk_opm95opa, amkopisxkoulk1_opm95opa, amkopisxkoulk2_opm95opa, amkopisxkoulk3_opm95opa, yoopisxkoulk1_opm95opa, yoopisxkoulk2_opm95opa, yoopisxkoulk3_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_tutkinto_Haku = Case when yohakub_opmopa in (aikyotutkkoulk_opmopa, aikammkoulk_opmopa, aikamkkoulk_opmopa, aikylamkkoulk_opmopa, aikalkkkoulk_opmopa, aikylkkkoulk_opmopa, aiklistrikoulk_opmopa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_opiskelu_Haku = Case when yohakub_opmopa in (yotutkopisxkoulk_opmopa, ammopisxkoulk_opmopa, amkopisxkoulk1_opmopa, amkopisxkoulk2_opmopa, amkopisxkoulk3_opmopa, yoopisxkoulk1_opmopa, yoopisxkoulk2_opmopa, yoopisxkoulk3_opmopa) then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_tutkinto_Haku = case when yohakub_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2) in (aikyotutkkoulk_opm95ala, aikammkoulk_opm95ala, aikamkkoulk_opm95ala, aikylamkkoulk_opm95ala, aikalkkkoulk_opm95ala, aikylkkkoulk_opm95ala, aiklistrikoulk_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_opiskelu_Haku = Case when yohakub_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2) in (yotutkopisxkoulk_opm95ala, ammopisxkoulk_opm95ala, amkopisxkoulk1_opm95ala, amkopisxkoulk2_opm95ala, amkopisxkoulk3_opm95ala, yoopisxkoulk1_opm95ala, yoopisxkoulk2_opm95ala, yoopisxkoulk3_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_tutkinto_Haku = Case when yohakub_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (aikyotutkkoulk_opmala, aikammkoulk_opmala, aikamkkoulk_opmala, aikylamkkoulk_opmala, aikalkkkoulk_opmala, aikylkkkoulk_opmala, aiklistrikoulk_opmala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_opiskelu_Haku = Case when yohakub_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (yotutkopisxkoulk_opmala, ammopisxkoulk_opmala, amkopisxkoulk1_opmala, amkopisxkoulk2_opmala, amkopisxkoulk3_opmala, yoopisxkoulk1_opmala, yoopisxkoulk2_opmala, yoopisxkoulk3_opmala))
  then 'K' else 'E' end,
Johdettu_Sama_oppilaitos_Aiempi_tutkinto_Haku = Case when yohakub_tunn in (tunnyotutk, tunnamm, tunnamk, tunnylamk, tunnalkk, tunnylkk, tunnlistri) then 'K' else 'E' end,	
Johdettu_Sama_oppilaitos_Aiempi_opiskelu_Haku = Case when yohakub_tunn in (yotutkopisxtunn, ammopisxtunn, amkopisxtunn1, amkopisxtunn2, amkopisxtunn3, yoopisxtunn1, yoopisxtunn2, yoopisxtunn3) then 'K' else 'E' end,	
Johdettu_Sama_sektori_Aiempi_tutkinto_Haku = Case when 'K' in (aikalkk, aikylkk, aiklistri) then 'K' else 'E' end,	
Johdettu_Sama_sektori_Aiempi_opiskelu_Haku = Case when 'K' in (yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Sama_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when 'K' in (aikalkk, aikylkk, aiklistri, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,	
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_Haku = Case when 'K' in (aikamk, aikylamk, aikalkk, aikylkk, aiklistri) then 'K' else 'E' end,	
Johdettu_Sama_laaja_sektori_Aiempi_opiskelu_Haku = Case when 'K' in (amkopisx1, amkopisx2, amkopisx3, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when 'K' in (aikamk, aikylamk, aikalkk, aikylkk, aiklistri, amkopisx1, amkopisx2, amkopisx3, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Hakenut_Amk_ja_Yo = Case when 
	(amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>'')
	and (yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Korkea_aste_ja_Toinen_aste = Case when 
	(luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'')
	and (amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>''
			or yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Lukio_ja_Ammatillinen_koulutus = Case when 
	((luammhaku1_tunn<>'' and luammhaku1_opmast='31') or (luammhaku2_tunn<>'' and luammhaku2_opmast='31') or (luammhaku3_tunn<>'' and luammhaku3_opmast='31') or (luammhaku4_tunn<>'' and luammhaku4_opmast='31') or (luammhaku5_tunn<>'' and luammhaku5_opmast='31'))
	and ((luammhaku1_tunn<>'' and luammhaku1_opmast<>'31') or (luammhaku2_tunn<>'' and luammhaku2_opmast<>'31') or (luammhaku3_tunn<>'' and luammhaku3_opmast<>'31') or (luammhaku4_tunn<>'' and luammhaku4_opmast<>'31') or (luammhaku5_tunn<>'' and luammhaku5_opmast<>'31'))
	then 'K' else 'E' end,
lkm, 
tietolahde,
rivinumero
FROM VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
WHERE yohakub_tunn<>''

UNION ALL
-- Uudet haut, haku yo, kohde c, prioriteetti muu
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
Haku_avain = 'yo',
Hakukohde_oppilaitos_avain = yohakuc_tunn, 
Hakukohde_koulutusaste2002_avain = yohakuc_opmast_avain, 
Hakukohde_koulutusaste_taso2_avain = kkhaku3_kaste_t2_avain,
Hakukohde_opintoala2002_avain = yohakuc_opmopa_avain, 
Hakukohde_opintoala1995_avain = yohakuc_opm95opa_avain, 
Hakukohde_iscfibroad2013_avain = kkhaku3_iscfibroad2013_avain, 
Hakukohde_prioriteetti_avain = case when Tilastovuosi<2015 then 'pr_ei' else 'pr_3' end, 
Hakukohde_hyvaksytty = yohakuc_hyv,
Hakukohde_vastaanotettu = yohakuc_vastotto,
Hakukohde_tutkinnon_taso = Case when yohakuc_harekast <> '' then 'YO' + yohakuc_harekast else '-1' end,
Hakukohde_tutkinnon_taso_tarkennus = Case when yohakuc_ylempi <> '' then 'YOTA' + yohakuc_ylempi else '-1' end,
Hakukohde_erillisvalinta = yohakuc_erval,
Hakukohde_koulutuksen_alkamislukukausi_avain = Koulutuksen_alkamislukukausi_avain,
--Johdettu_Hakija_opiskelee_hakukohteessa = Case when yohakuc_tunn in (yoopisxtunn1,yoopisxtunn2,yoopisxtunn3) then 'K' else 'E' end,	
Johdettu_Sama_koulutusaste02_Aiempi_tutkinto_Haku = Case when yohakuc_opmast in (aikyotutkkoulk_opmast, aikammkoulk_opmast, aikamkkoulk_opmast, aikylamkkoulk_opmast, aikalkkkoulk_opmast, aikylkkkoulk_opmast, aiklistrikoulk_opmast) then 'K' else 'E' end,
Johdettu_Sama_koulutusaste02_Aiempi_opiskelu_Haku = Case when yohakuc_opmast in (yotutkopisxkoulk_opmast, ammopisxkoulk_opmast, amkopisxkoulk1_opmast, amkopisxkoulk2_opmast, amkopisxkoulk3_opmast, yoopisxkoulk1_opmast, yoopisxkoulk2_opmast, yoopisxkoulk3_opmast) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_tutkinto_Haku = case when yohakuc_opm95opa  in (aikyotutkkoulk_opm95opa, aikammkoulk_opm95opa, aikamkkoulk_opm95opa, aikylamkkoulk_opm95opa, aikalkkkoulk_opm95opa, aikylkkkoulk_opm95opa, aiklistrikoulk_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_opiskelu_Haku = Case when yohakuc_opm95opa in (yotutkopisxkoulk_opm95opa, ammopisxkoulk_opm95opa, amkopisxkoulk1_opm95opa, amkopisxkoulk2_opm95opa, amkopisxkoulk3_opm95opa, yoopisxkoulk1_opm95opa, yoopisxkoulk2_opm95opa, yoopisxkoulk3_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_tutkinto_Haku = Case when yohakuc_opmopa in (aikyotutkkoulk_opmopa, aikammkoulk_opmopa, aikamkkoulk_opmopa, aikylamkkoulk_opmopa, aikalkkkoulk_opmopa, aikylkkkoulk_opmopa, aiklistrikoulk_opmopa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_opiskelu_Haku = Case when yohakuc_opmopa in (yotutkopisxkoulk_opmopa, ammopisxkoulk_opmopa, amkopisxkoulk1_opmopa, amkopisxkoulk2_opmopa, amkopisxkoulk3_opmopa, yoopisxkoulk1_opmopa, yoopisxkoulk2_opmopa, yoopisxkoulk3_opmopa) then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_tutkinto_Haku = case when yohakuc_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2) in (aikyotutkkoulk_opm95ala, aikammkoulk_opm95ala, aikamkkoulk_opm95ala, aikylamkkoulk_opm95ala, aikalkkkoulk_opm95ala, aikylkkkoulk_opm95ala, aiklistrikoulk_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_opiskelu_Haku = Case when yohakuc_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2) in (yotutkopisxkoulk_opm95ala, ammopisxkoulk_opm95ala, amkopisxkoulk1_opm95ala, amkopisxkoulk2_opm95ala, amkopisxkoulk3_opm95ala, yoopisxkoulk1_opm95ala, yoopisxkoulk2_opm95ala, yoopisxkoulk3_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_tutkinto_Haku = Case when yohakuc_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (aikyotutkkoulk_opmala, aikammkoulk_opmala, aikamkkoulk_opmala, aikylamkkoulk_opmala, aikalkkkoulk_opmala, aikylkkkoulk_opmala, aiklistrikoulk_opmala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_opiskelu_Haku = Case when yohakuc_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (yotutkopisxkoulk_opmala, ammopisxkoulk_opmala, amkopisxkoulk1_opmala, amkopisxkoulk2_opmala, amkopisxkoulk3_opmala, yoopisxkoulk1_opmala, yoopisxkoulk2_opmala, yoopisxkoulk3_opmala))
  then 'K' else 'E' end,
Johdettu_Sama_oppilaitos_Aiempi_tutkinto_Haku = Case when yohakuc_tunn in (tunnyotutk, tunnamm, tunnamk, tunnylamk, tunnalkk, tunnylkk, tunnlistri) then 'K' else 'E' end,	
Johdettu_Sama_oppilaitos_Aiempi_opiskelu_Haku = Case when yohakuc_tunn in (yotutkopisxtunn, ammopisxtunn, amkopisxtunn1, amkopisxtunn2, amkopisxtunn3, yoopisxtunn1, yoopisxtunn2, yoopisxtunn3) then 'K' else 'E' end,	
Johdettu_Sama_sektori_Aiempi_tutkinto_Haku = Case when 'K' in (aikalkk, aikylkk, aiklistri) then 'K' else 'E' end,	
Johdettu_Sama_sektori_Aiempi_opiskelu_Haku = Case when 'K' in (yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Sama_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when 'K' in (aikalkk, aikylkk, aiklistri, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,	
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_Haku = Case when 'K' in (aikamk, aikylamk, aikalkk, aikylkk, aiklistri) then 'K' else 'E' end,	
Johdettu_Sama_laaja_sektori_Aiempi_opiskelu_Haku = Case when 'K' in (amkopisx1, amkopisx2, amkopisx3, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when 'K' in (aikamk, aikylamk, aikalkk, aikylkk, aiklistri, amkopisx1, amkopisx2, amkopisx3, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Hakenut_Amk_ja_Yo = Case when 
	(amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>'')
	and (yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Korkea_aste_ja_Toinen_aste = Case when 
	(luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'')
	and (amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>''
			or yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Lukio_ja_Ammatillinen_koulutus = Case when 
	((luammhaku1_tunn<>'' and luammhaku1_opmast='31') or (luammhaku2_tunn<>'' and luammhaku2_opmast='31') or (luammhaku3_tunn<>'' and luammhaku3_opmast='31') or (luammhaku4_tunn<>'' and luammhaku4_opmast='31') or (luammhaku5_tunn<>'' and luammhaku5_opmast='31'))
	and ((luammhaku1_tunn<>'' and luammhaku1_opmast<>'31') or (luammhaku2_tunn<>'' and luammhaku2_opmast<>'31') or (luammhaku3_tunn<>'' and luammhaku3_opmast<>'31') or (luammhaku4_tunn<>'' and luammhaku4_opmast<>'31') or (luammhaku5_tunn<>'' and luammhaku5_opmast<>'31'))
	then 'K' else 'E' end,
lkm, 
tietolahde,
rivinumero
FROM VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
WHERE yohakuc_tunn<>''

UNION ALL
-- Uudet haut, haku yo, kohde d, prioriteetti muu
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
Haku_avain = 'yo',
Hakukohde_oppilaitos_avain = yohakud_tunn, 
Hakukohde_koulutusaste2002_avain = yohakud_opmast_avain, 
Hakukohde_koulutusaste_taso2_avain = kkhaku4_kaste_t2_avain,
Hakukohde_opintoala2002_avain = yohakud_opmopa_avain, 
Hakukohde_opintoala1995_avain = yohakud_opm95opa_avain, 
Hakukohde_iscfibroad2013_avain = kkhaku4_iscfibroad2013_avain,  
Hakukohde_prioriteetti_avain = case when Tilastovuosi<2015 then 'pr_ei' else 'pr_4' end,
Hakukohde_hyvaksytty = yohakud_hyv,
Hakukohde_vastaanotettu = yohakud_vastotto,
Hakukohde_tutkinnon_taso = Case when yohakud_harekast <> '' then 'YO' + yohakud_harekast else '-1' end,
Hakukohde_tutkinnon_taso_tarkennus = Case when yohakud_ylempi <> '' then 'YOTA' + yohakud_ylempi else '-1' end,
Hakukohde_erillisvalinta = yohakud_erval,
Hakukohde_koulutuksen_alkamislukukausi_avain = Koulutuksen_alkamislukukausi_avain,
--Johdettu_Hakija_opiskelee_hakukohteessa = Case when yohakud_tunn in (yoopisxtunn1,yoopisxtunn2,yoopisxtunn3) then 'K' else 'E' end,	
Johdettu_Sama_koulutusaste02_Aiempi_tutkinto_Haku = Case when yohakud_opmast in (aikyotutkkoulk_opmast, aikammkoulk_opmast, aikamkkoulk_opmast, aikylamkkoulk_opmast, aikalkkkoulk_opmast, aikylkkkoulk_opmast, aiklistrikoulk_opmast) then 'K' else 'E' end,
Johdettu_Sama_koulutusaste02_Aiempi_opiskelu_Haku = Case when yohakud_opmast in (yotutkopisxkoulk_opmast, ammopisxkoulk_opmast, amkopisxkoulk1_opmast, amkopisxkoulk2_opmast, amkopisxkoulk3_opmast, yoopisxkoulk1_opmast, yoopisxkoulk2_opmast, yoopisxkoulk3_opmast) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_tutkinto_Haku = case when yohakud_opm95opa  in (aikyotutkkoulk_opm95opa, aikammkoulk_opm95opa, aikamkkoulk_opm95opa, aikylamkkoulk_opm95opa, aikalkkkoulk_opm95opa, aikylkkkoulk_opm95opa, aiklistrikoulk_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_opiskelu_Haku = Case when yohakud_opm95opa in (yotutkopisxkoulk_opm95opa, ammopisxkoulk_opm95opa, amkopisxkoulk1_opm95opa, amkopisxkoulk2_opm95opa, amkopisxkoulk3_opm95opa, yoopisxkoulk1_opm95opa, yoopisxkoulk2_opm95opa, yoopisxkoulk3_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_tutkinto_Haku = Case when yohakud_opmopa in (aikyotutkkoulk_opmopa, aikammkoulk_opmopa, aikamkkoulk_opmopa, aikylamkkoulk_opmopa, aikalkkkoulk_opmopa, aikylkkkoulk_opmopa, aiklistrikoulk_opmopa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_opiskelu_Haku = Case when yohakud_opmopa in (yotutkopisxkoulk_opmopa, ammopisxkoulk_opmopa, amkopisxkoulk1_opmopa, amkopisxkoulk2_opmopa, amkopisxkoulk3_opmopa, yoopisxkoulk1_opmopa, yoopisxkoulk2_opmopa, yoopisxkoulk3_opmopa) then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_tutkinto_Haku = case when yohakud_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2) in (aikyotutkkoulk_opm95ala, aikammkoulk_opm95ala, aikamkkoulk_opm95ala, aikylamkkoulk_opm95ala, aikalkkkoulk_opm95ala, aikylkkkoulk_opm95ala, aiklistrikoulk_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_opiskelu_Haku = Case when yohakud_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2) in (yotutkopisxkoulk_opm95ala, ammopisxkoulk_opm95ala, amkopisxkoulk1_opm95ala, amkopisxkoulk2_opm95ala, amkopisxkoulk3_opm95ala, yoopisxkoulk1_opm95ala, yoopisxkoulk2_opm95ala, yoopisxkoulk3_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_tutkinto_Haku = Case when yohakud_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (aikyotutkkoulk_opmala, aikammkoulk_opmala, aikamkkoulk_opmala, aikylamkkoulk_opmala, aikalkkkoulk_opmala, aikylkkkoulk_opmala, aiklistrikoulk_opmala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_opiskelu_Haku = Case when yohakud_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (yotutkopisxkoulk_opmala, ammopisxkoulk_opmala, amkopisxkoulk1_opmala, amkopisxkoulk2_opmala, amkopisxkoulk3_opmala, yoopisxkoulk1_opmala, yoopisxkoulk2_opmala, yoopisxkoulk3_opmala))
  then 'K' else 'E' end,
Johdettu_Sama_oppilaitos_Aiempi_tutkinto_Haku = Case when yohakud_tunn in (tunnyotutk, tunnamm, tunnamk, tunnylamk, tunnalkk, tunnylkk, tunnlistri) then 'K' else 'E' end,	
Johdettu_Sama_oppilaitos_Aiempi_opiskelu_Haku = Case when yohakud_tunn in (yotutkopisxtunn, ammopisxtunn, amkopisxtunn1, amkopisxtunn2, amkopisxtunn3, yoopisxtunn1, yoopisxtunn2, yoopisxtunn3) then 'K' else 'E' end,	
Johdettu_Sama_sektori_Aiempi_tutkinto_Haku = Case when 'K' in (aikalkk, aikylkk, aiklistri) then 'K' else 'E' end,	
Johdettu_Sama_sektori_Aiempi_opiskelu_Haku = Case when 'K' in (yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Sama_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when 'K' in (aikalkk, aikylkk, aiklistri, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,	
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_Haku = Case when 'K' in (aikamk, aikylamk, aikalkk, aikylkk, aiklistri) then 'K' else 'E' end,	
Johdettu_Sama_laaja_sektori_Aiempi_opiskelu_Haku = Case when 'K' in (amkopisx1, amkopisx2, amkopisx3, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when 'K' in (aikamk, aikylamk, aikalkk, aikylkk, aiklistri, amkopisx1, amkopisx2, amkopisx3, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Hakenut_Amk_ja_Yo = Case when 
	(amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>'')
	and (yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Korkea_aste_ja_Toinen_aste = Case when 
	(luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'')
	and (amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>''
			or yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Lukio_ja_Ammatillinen_koulutus = Case when 
	((luammhaku1_tunn<>'' and luammhaku1_opmast='31') or (luammhaku2_tunn<>'' and luammhaku2_opmast='31') or (luammhaku3_tunn<>'' and luammhaku3_opmast='31') or (luammhaku4_tunn<>'' and luammhaku4_opmast='31') or (luammhaku5_tunn<>'' and luammhaku5_opmast='31'))
	and ((luammhaku1_tunn<>'' and luammhaku1_opmast<>'31') or (luammhaku2_tunn<>'' and luammhaku2_opmast<>'31') or (luammhaku3_tunn<>'' and luammhaku3_opmast<>'31') or (luammhaku4_tunn<>'' and luammhaku4_opmast<>'31') or (luammhaku5_tunn<>'' and luammhaku5_opmast<>'31'))
	then 'K' else 'E' end,
lkm, 
tietolahde,
rivinumero
FROM VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
WHERE yohakud_tunn<>''

UNION ALL
-- Uudet haut, haku yo, kohde e, prioriteetti muu
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
Haku_avain = 'yo',
Hakukohde_oppilaitos_avain = yohakue_tunn, 
Hakukohde_koulutusaste2002_avain = yohakue_opmast_avain, 
Hakukohde_koulutusaste_taso2_avain = kkhaku5_kaste_t2_avain,
Hakukohde_opintoala2002_avain = yohakue_opmopa_avain, 
Hakukohde_opintoala1995_avain = yohakue_opm95opa_avain, 
Hakukohde_iscfibroad2013_avain = kkhaku5_iscfibroad2013_avain, 
Hakukohde_prioriteetti_avain = case when Tilastovuosi<2015 then 'pr_ei' else 'pr_5' end,
Hakukohde_hyvaksytty = yohakue_hyv,
Hakukohde_vastaanotettu = yohakue_vastotto,
Hakukohde_tutkinnon_taso = Case when yohakue_harekast <> '' then 'YO' + yohakue_harekast else '-1' end,
Hakukohde_tutkinnon_taso_tarkennus = Case when yohakue_ylempi <> '' then 'YOTA' + yohakue_ylempi else '-1' end,
Hakukohde_erillisvalinta = yohakue_erval,
Hakukohde_koulutuksen_alkamislukukausi_avain = Koulutuksen_alkamislukukausi_avain,
--Johdettu_Hakija_opiskelee_hakukohteessa = Case when yohakue_tunn in (yoopisxtunn1,yoopisxtunn2,yoopisxtunn3) then 'K' else 'E' end,	
Johdettu_Sama_koulutusaste02_Aiempi_tutkinto_Haku = Case when yohakue_opmast in (aikyotutkkoulk_opmast, aikammkoulk_opmast, aikamkkoulk_opmast, aikylamkkoulk_opmast, aikalkkkoulk_opmast, aikylkkkoulk_opmast, aiklistrikoulk_opmast) then 'K' else 'E' end,
Johdettu_Sama_koulutusaste02_Aiempi_opiskelu_Haku = Case when yohakue_opmast in (yotutkopisxkoulk_opmast, ammopisxkoulk_opmast, amkopisxkoulk1_opmast, amkopisxkoulk2_opmast, amkopisxkoulk3_opmast, yoopisxkoulk1_opmast, yoopisxkoulk2_opmast, yoopisxkoulk3_opmast) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_tutkinto_Haku = case when yohakue_opm95opa  in (aikyotutkkoulk_opm95opa, aikammkoulk_opm95opa, aikamkkoulk_opm95opa, aikylamkkoulk_opm95opa, aikalkkkoulk_opm95opa, aikylkkkoulk_opm95opa, aiklistrikoulk_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_opiskelu_Haku = Case when yohakue_opm95opa in (yotutkopisxkoulk_opm95opa, ammopisxkoulk_opm95opa, amkopisxkoulk1_opm95opa, amkopisxkoulk2_opm95opa, amkopisxkoulk3_opm95opa, yoopisxkoulk1_opm95opa, yoopisxkoulk2_opm95opa, yoopisxkoulk3_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_tutkinto_Haku = Case when yohakue_opmopa in (aikyotutkkoulk_opmopa, aikammkoulk_opmopa, aikamkkoulk_opmopa, aikylamkkoulk_opmopa, aikalkkkoulk_opmopa, aikylkkkoulk_opmopa, aiklistrikoulk_opmopa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_opiskelu_Haku = Case when yohakue_opmopa in (yotutkopisxkoulk_opmopa, ammopisxkoulk_opmopa, amkopisxkoulk1_opmopa, amkopisxkoulk2_opmopa, amkopisxkoulk3_opmopa, yoopisxkoulk1_opmopa, yoopisxkoulk2_opmopa, yoopisxkoulk3_opmopa) then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_tutkinto_Haku = case when yohakue_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2) in (aikyotutkkoulk_opm95ala, aikammkoulk_opm95ala, aikamkkoulk_opm95ala, aikylamkkoulk_opm95ala, aikalkkkoulk_opm95ala, aikylkkkoulk_opm95ala, aiklistrikoulk_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_opiskelu_Haku = Case when yohakue_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2) in (yotutkopisxkoulk_opm95ala, ammopisxkoulk_opm95ala, amkopisxkoulk1_opm95ala, amkopisxkoulk2_opm95ala, amkopisxkoulk3_opm95ala, yoopisxkoulk1_opm95ala, yoopisxkoulk2_opm95ala, yoopisxkoulk3_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_tutkinto_Haku = Case when yohakue_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (aikyotutkkoulk_opmala, aikammkoulk_opmala, aikamkkoulk_opmala, aikylamkkoulk_opmala, aikalkkkoulk_opmala, aikylkkkoulk_opmala, aiklistrikoulk_opmala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_opiskelu_Haku = Case when yohakue_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (yotutkopisxkoulk_opmala, ammopisxkoulk_opmala, amkopisxkoulk1_opmala, amkopisxkoulk2_opmala, amkopisxkoulk3_opmala, yoopisxkoulk1_opmala, yoopisxkoulk2_opmala, yoopisxkoulk3_opmala))
  then 'K' else 'E' end,
Johdettu_Sama_oppilaitos_Aiempi_tutkinto_Haku = Case when yohakue_tunn in (tunnyotutk, tunnamm, tunnamk, tunnylamk, tunnalkk, tunnylkk, tunnlistri) then 'K' else 'E' end,	
Johdettu_Sama_oppilaitos_Aiempi_opiskelu_Haku = Case when yohakue_tunn in (yotutkopisxtunn, ammopisxtunn, amkopisxtunn1, amkopisxtunn2, amkopisxtunn3, yoopisxtunn1, yoopisxtunn2, yoopisxtunn3) then 'K' else 'E' end,	
Johdettu_Sama_sektori_Aiempi_tutkinto_Haku = Case when 'K' in (aikalkk, aikylkk, aiklistri) then 'K' else 'E' end,	
Johdettu_Sama_sektori_Aiempi_opiskelu_Haku = Case when 'K' in (yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Sama_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when 'K' in (aikalkk, aikylkk, aiklistri, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,	
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_Haku = Case when 'K' in (aikamk, aikylamk, aikalkk, aikylkk, aiklistri) then 'K' else 'E' end,	
Johdettu_Sama_laaja_sektori_Aiempi_opiskelu_Haku = Case when 'K' in (amkopisx1, amkopisx2, amkopisx3, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when 'K' in (aikamk, aikylamk, aikalkk, aikylkk, aiklistri, amkopisx1, amkopisx2, amkopisx3, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Hakenut_Amk_ja_Yo = Case when 
	(amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>'')
	and (yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Korkea_aste_ja_Toinen_aste = Case when 
	(luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'')
	and (amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>''
			or yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Lukio_ja_Ammatillinen_koulutus = Case when 
	((luammhaku1_tunn<>'' and luammhaku1_opmast='31') or (luammhaku2_tunn<>'' and luammhaku2_opmast='31') or (luammhaku3_tunn<>'' and luammhaku3_opmast='31') or (luammhaku4_tunn<>'' and luammhaku4_opmast='31') or (luammhaku5_tunn<>'' and luammhaku5_opmast='31'))
	and ((luammhaku1_tunn<>'' and luammhaku1_opmast<>'31') or (luammhaku2_tunn<>'' and luammhaku2_opmast<>'31') or (luammhaku3_tunn<>'' and luammhaku3_opmast<>'31') or (luammhaku4_tunn<>'' and luammhaku4_opmast<>'31') or (luammhaku5_tunn<>'' and luammhaku5_opmast<>'31'))
	then 'K' else 'E' end,
lkm, 
tietolahde,
rivinumero
FROM VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
WHERE yohakue_tunn<>''

UNION ALL
-- Uudet haut, haku yo, kohde f, prioriteetti muu
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
Haku_avain = 'yo',
Hakukohde_oppilaitos_avain = yohakuf_tunn, 
Hakukohde_koulutusaste2002_avain = yohakuf_opmast_avain, 
Hakukohde_koulutusaste_taso2_avain = kkhaku6_kaste_t2_avain,
Hakukohde_opintoala2002_avain = yohakuf_opmopa_avain, 
Hakukohde_opintoala1995_avain = yohakuf_opm95opa_avain,
Hakukohde_iscfibroad2013_avain = kkhaku6_iscfibroad2013_avain,  
Hakukohde_prioriteetti_avain = case when Tilastovuosi<2015 then 'pr_ei' else 'pr_6' end,
Hakukohde_hyvaksytty = yohakuf_hyv,
Hakukohde_vastaanotettu = yohakuf_vastotto,
Hakukohde_tutkinnon_taso = Case when yohakuf_harekast <> '' then 'YO' + yohakuf_harekast else '-1' end,
Hakukohde_tutkinnon_taso_tarkennus = Case when yohakuf_ylempi <> '' then 'YOTA' + yohakuf_ylempi else '-1' end,
Hakukohde_erillisvalinta = yohakuf_erval,
Hakukohde_koulutuksen_alkamislukukausi_avain = Koulutuksen_alkamislukukausi_avain,
--Johdettu_Hakija_opiskelee_hakukohteessa = Case when yohakuf_tunn in (yoopisxtunn1,yoopisxtunn2,yoopisxtunn3) then 'K' else 'E' end,	
Johdettu_Sama_koulutusaste02_Aiempi_tutkinto_Haku = Case when yohakuf_opmast in (aikyotutkkoulk_opmast, aikammkoulk_opmast, aikamkkoulk_opmast, aikylamkkoulk_opmast, aikalkkkoulk_opmast, aikylkkkoulk_opmast, aiklistrikoulk_opmast) then 'K' else 'E' end,
Johdettu_Sama_koulutusaste02_Aiempi_opiskelu_Haku = Case when yohakuf_opmast in (yotutkopisxkoulk_opmast, ammopisxkoulk_opmast, amkopisxkoulk1_opmast, amkopisxkoulk2_opmast, amkopisxkoulk3_opmast, yoopisxkoulk1_opmast, yoopisxkoulk2_opmast, yoopisxkoulk3_opmast) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_tutkinto_Haku = case when yohakuf_opm95opa  in (aikyotutkkoulk_opm95opa, aikammkoulk_opm95opa, aikamkkoulk_opm95opa, aikylamkkoulk_opm95opa, aikalkkkoulk_opm95opa, aikylkkkoulk_opm95opa, aiklistrikoulk_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_opiskelu_Haku = Case when yohakuf_opm95opa in (yotutkopisxkoulk_opm95opa, ammopisxkoulk_opm95opa, amkopisxkoulk1_opm95opa, amkopisxkoulk2_opm95opa, amkopisxkoulk3_opm95opa, yoopisxkoulk1_opm95opa, yoopisxkoulk2_opm95opa, yoopisxkoulk3_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_tutkinto_Haku = Case when yohakuf_opmopa in (aikyotutkkoulk_opmopa, aikammkoulk_opmopa, aikamkkoulk_opmopa, aikylamkkoulk_opmopa, aikalkkkoulk_opmopa, aikylkkkoulk_opmopa, aiklistrikoulk_opmopa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_opiskelu_Haku = Case when yohakuf_opmopa in (yotutkopisxkoulk_opmopa, ammopisxkoulk_opmopa, amkopisxkoulk1_opmopa, amkopisxkoulk2_opmopa, amkopisxkoulk3_opmopa, yoopisxkoulk1_opmopa, yoopisxkoulk2_opmopa, yoopisxkoulk3_opmopa) then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_tutkinto_Haku = case when yohakuf_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2) in (aikyotutkkoulk_opm95ala, aikammkoulk_opm95ala, aikamkkoulk_opm95ala, aikylamkkoulk_opm95ala, aikalkkkoulk_opm95ala, aikylkkkoulk_opm95ala, aiklistrikoulk_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_opiskelu_Haku = Case when yohakuf_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2) in (yotutkopisxkoulk_opm95ala, ammopisxkoulk_opm95ala, amkopisxkoulk1_opm95ala, amkopisxkoulk2_opm95ala, amkopisxkoulk3_opm95ala, yoopisxkoulk1_opm95ala, yoopisxkoulk2_opm95ala, yoopisxkoulk3_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_tutkinto_Haku = Case when yohakuf_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (aikyotutkkoulk_opmala, aikammkoulk_opmala, aikamkkoulk_opmala, aikylamkkoulk_opmala, aikalkkkoulk_opmala, aikylkkkoulk_opmala, aiklistrikoulk_opmala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_opiskelu_Haku = Case when yohakuf_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (yotutkopisxkoulk_opmala, ammopisxkoulk_opmala, amkopisxkoulk1_opmala, amkopisxkoulk2_opmala, amkopisxkoulk3_opmala, yoopisxkoulk1_opmala, yoopisxkoulk2_opmala, yoopisxkoulk3_opmala))
  then 'K' else 'E' end,
Johdettu_Sama_oppilaitos_Aiempi_tutkinto_Haku = Case when yohakuf_tunn in (tunnyotutk, tunnamm, tunnamk, tunnylamk, tunnalkk, tunnylkk, tunnlistri) then 'K' else 'E' end,	
Johdettu_Sama_oppilaitos_Aiempi_opiskelu_Haku = Case when yohakuf_tunn in (yotutkopisxtunn, ammopisxtunn, amkopisxtunn1, amkopisxtunn2, amkopisxtunn3, yoopisxtunn1, yoopisxtunn2, yoopisxtunn3) then 'K' else 'E' end,	
Johdettu_Sama_sektori_Aiempi_tutkinto_Haku = Case when 'K' in (aikalkk, aikylkk, aiklistri) then 'K' else 'E' end,	
Johdettu_Sama_sektori_Aiempi_opiskelu_Haku = Case when 'K' in (yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Sama_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when 'K' in (aikalkk, aikylkk, aiklistri, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,	
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_Haku = Case when 'K' in (aikamk, aikylamk, aikalkk, aikylkk, aiklistri) then 'K' else 'E' end,	
Johdettu_Sama_laaja_sektori_Aiempi_opiskelu_Haku = Case when 'K' in (amkopisx1, amkopisx2, amkopisx3, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when 'K' in (aikamk, aikylamk, aikalkk, aikylkk, aiklistri, amkopisx1, amkopisx2, amkopisx3, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Hakenut_Amk_ja_Yo = Case when 
	(amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>'')
	and (yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Korkea_aste_ja_Toinen_aste = Case when 
	(luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'')
	and (amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>''
			or yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Lukio_ja_Ammatillinen_koulutus = Case when 
	((luammhaku1_tunn<>'' and luammhaku1_opmast='31') or (luammhaku2_tunn<>'' and luammhaku2_opmast='31') or (luammhaku3_tunn<>'' and luammhaku3_opmast='31') or (luammhaku4_tunn<>'' and luammhaku4_opmast='31') or (luammhaku5_tunn<>'' and luammhaku5_opmast='31'))
	and ((luammhaku1_tunn<>'' and luammhaku1_opmast<>'31') or (luammhaku2_tunn<>'' and luammhaku2_opmast<>'31') or (luammhaku3_tunn<>'' and luammhaku3_opmast<>'31') or (luammhaku4_tunn<>'' and luammhaku4_opmast<>'31') or (luammhaku5_tunn<>'' and luammhaku5_opmast<>'31'))
	then 'K' else 'E' end,
lkm, 
tietolahde,
rivinumero
FROM VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
WHERE yohakuf_tunn<>''

UNION ALL
-- Uudet haut, haku yo, kohde g, prioriteetti muu
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
Haku_avain = 'yo',
Hakukohde_oppilaitos_avain = yohakug_tunn, 
Hakukohde_koulutusaste2002_avain = yohakug_opmast_avain, 
Hakukohde_koulutusaste_taso2_avain = '-1',
Hakukohde_opintoala2002_avain = yohakug_opmopa_avain, 
Hakukohde_opintoala1995_avain = yohakug_opm95opa_avain, 
Hakukohde_iscfibroad2013_avain = '-1', 
Hakukohde_prioriteetti_avain = 'pr_ei', 
Hakukohde_hyvaksytty = yohakug_hyv,
Hakukohde_vastaanotettu = yohakug_vastotto,
Hakukohde_tutkinnon_taso = Case when yohakug_harekast <> '' then 'YO' + yohakug_harekast else '-1' end,
Hakukohde_tutkinnon_taso_tarkennus = Case when yohakug_ylempi <> '' then 'YOTA' + yohakug_ylempi else '-1' end,
Hakukohde_erillisvalinta = yohakug_erval,
Hakukohde_koulutuksen_alkamislukukausi_avain = Koulutuksen_alkamislukukausi_avain,
--Johdettu_Hakija_opiskelee_hakukohteessa = Case when yohakug_tunn in (yoopisxtunn1,yoopisxtunn2,yoopisxtunn3) then 'K' else 'E' end,	
Johdettu_Sama_koulutusaste02_Aiempi_tutkinto_Haku = Case when yohakug_opmast in (aikyotutkkoulk_opmast, aikammkoulk_opmast, aikamkkoulk_opmast, aikylamkkoulk_opmast, aikalkkkoulk_opmast, aikylkkkoulk_opmast, aiklistrikoulk_opmast) then 'K' else 'E' end,
Johdettu_Sama_koulutusaste02_Aiempi_opiskelu_Haku = Case when yohakug_opmast in (yotutkopisxkoulk_opmast, ammopisxkoulk_opmast, amkopisxkoulk1_opmast, amkopisxkoulk2_opmast, amkopisxkoulk3_opmast, yoopisxkoulk1_opmast, yoopisxkoulk2_opmast, yoopisxkoulk3_opmast) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_tutkinto_Haku = case when yohakug_opm95opa  in (aikyotutkkoulk_opm95opa, aikammkoulk_opm95opa, aikamkkoulk_opm95opa, aikylamkkoulk_opm95opa, aikalkkkoulk_opm95opa, aikylkkkoulk_opm95opa, aiklistrikoulk_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_opiskelu_Haku = Case when yohakug_opm95opa in (yotutkopisxkoulk_opm95opa, ammopisxkoulk_opm95opa, amkopisxkoulk1_opm95opa, amkopisxkoulk2_opm95opa, amkopisxkoulk3_opm95opa, yoopisxkoulk1_opm95opa, yoopisxkoulk2_opm95opa, yoopisxkoulk3_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_tutkinto_Haku = Case when yohakug_opmopa in (aikyotutkkoulk_opmopa, aikammkoulk_opmopa, aikamkkoulk_opmopa, aikylamkkoulk_opmopa, aikalkkkoulk_opmopa, aikylkkkoulk_opmopa, aiklistrikoulk_opmopa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_opiskelu_Haku = Case when yohakug_opmopa in (yotutkopisxkoulk_opmopa, ammopisxkoulk_opmopa, amkopisxkoulk1_opmopa, amkopisxkoulk2_opmopa, amkopisxkoulk3_opmopa, yoopisxkoulk1_opmopa, yoopisxkoulk2_opmopa, yoopisxkoulk3_opmopa) then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_tutkinto_Haku = case when yohakug_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2) in (aikyotutkkoulk_opm95ala, aikammkoulk_opm95ala, aikamkkoulk_opm95ala, aikylamkkoulk_opm95ala, aikalkkkoulk_opm95ala, aikylkkkoulk_opm95ala, aiklistrikoulk_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_opiskelu_Haku = Case when yohakug_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2) in (yotutkopisxkoulk_opm95ala, ammopisxkoulk_opm95ala, amkopisxkoulk1_opm95ala, amkopisxkoulk2_opm95ala, amkopisxkoulk3_opm95ala, yoopisxkoulk1_opm95ala, yoopisxkoulk2_opm95ala, yoopisxkoulk3_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_tutkinto_Haku = Case when yohakug_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (aikyotutkkoulk_opmala, aikammkoulk_opmala, aikamkkoulk_opmala, aikylamkkoulk_opmala, aikalkkkoulk_opmala, aikylkkkoulk_opmala, aiklistrikoulk_opmala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_opiskelu_Haku = Case when yohakug_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (yotutkopisxkoulk_opmala, ammopisxkoulk_opmala, amkopisxkoulk1_opmala, amkopisxkoulk2_opmala, amkopisxkoulk3_opmala, yoopisxkoulk1_opmala, yoopisxkoulk2_opmala, yoopisxkoulk3_opmala))
  then 'K' else 'E' end,
Johdettu_Sama_oppilaitos_Aiempi_tutkinto_Haku = Case when yohakug_tunn in (tunnyotutk, tunnamm, tunnamk, tunnylamk, tunnalkk, tunnylkk, tunnlistri) then 'K' else 'E' end,	
Johdettu_Sama_oppilaitos_Aiempi_opiskelu_Haku = Case when yohakug_tunn in (yotutkopisxtunn, ammopisxtunn, amkopisxtunn1, amkopisxtunn2, amkopisxtunn3, yoopisxtunn1, yoopisxtunn2, yoopisxtunn3) then 'K' else 'E' end,	
Johdettu_Sama_sektori_Aiempi_tutkinto_Haku = Case when 'K' in (aikalkk, aikylkk, aiklistri) then 'K' else 'E' end,	
Johdettu_Sama_sektori_Aiempi_opiskelu_Haku = Case when 'K' in (yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Sama_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when 'K' in (aikalkk, aikylkk, aiklistri, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,	
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_Haku = Case when 'K' in (aikamk, aikylamk, aikalkk, aikylkk, aiklistri) then 'K' else 'E' end,	
Johdettu_Sama_laaja_sektori_Aiempi_opiskelu_Haku = Case when 'K' in (amkopisx1, amkopisx2, amkopisx3, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when 'K' in (aikamk, aikylamk, aikalkk, aikylkk, aiklistri, amkopisx1, amkopisx2, amkopisx3, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Hakenut_Amk_ja_Yo = Case when 
	(amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>'')
	and (yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Korkea_aste_ja_Toinen_aste = Case when 
	(luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'')
	and (amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>''
			or yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Lukio_ja_Ammatillinen_koulutus = Case when 
	((luammhaku1_tunn<>'' and luammhaku1_opmast='31') or (luammhaku2_tunn<>'' and luammhaku2_opmast='31') or (luammhaku3_tunn<>'' and luammhaku3_opmast='31') or (luammhaku4_tunn<>'' and luammhaku4_opmast='31') or (luammhaku5_tunn<>'' and luammhaku5_opmast='31'))
	and ((luammhaku1_tunn<>'' and luammhaku1_opmast<>'31') or (luammhaku2_tunn<>'' and luammhaku2_opmast<>'31') or (luammhaku3_tunn<>'' and luammhaku3_opmast<>'31') or (luammhaku4_tunn<>'' and luammhaku4_opmast<>'31') or (luammhaku5_tunn<>'' and luammhaku5_opmast<>'31'))
	then 'K' else 'E' end,
lkm, 
tietolahde,
rivinumero
FROM VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
WHERE yohakug_tunn<>''

UNION ALL
-- Uudet haut, haku yo, kohde h, prioriteetti muu
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
Haku_avain = 'yo',
Hakukohde_oppilaitos_avain = yohakuh_tunn, 
Hakukohde_koulutusaste2002_avain = yohakuh_opmast_avain, 
Hakukohde_koulutusaste_taso2_avain = '-1',
Hakukohde_opintoala2002_avain = yohakuh_opmopa_avain, 
Hakukohde_opintoala1995_avain = yohakuh_opm95opa_avain, 
Hakukohde_iscfibroad2013_avain = '-1', 
Hakukohde_prioriteetti_avain = 'pr_ei', 
Hakukohde_hyvaksytty = yohakuh_hyv,
Hakukohde_vastaanotettu = yohakuh_vastotto,
Hakukohde_tutkinnon_taso = Case when yohakuh_harekast <> '' then 'YO' + yohakuh_harekast else '-1' end,
Hakukohde_tutkinnon_taso_tarkennus = Case when yohakuh_ylempi <> '' then 'YOTA' + yohakuh_ylempi else '-1' end,
Hakukohde_erillisvalinta = yohakuh_erval,
Hakukohde_koulutuksen_alkamislukukausi_avain = Koulutuksen_alkamislukukausi_avain,
--Johdettu_Hakija_opiskelee_hakukohteessa = Case when yohakuh_tunn in (yoopisxtunn1,yoopisxtunn2,yoopisxtunn3) then 'K' else 'E' end,	
Johdettu_Sama_koulutusaste02_Aiempi_tutkinto_Haku = Case when yohakuh_opmast in (aikyotutkkoulk_opmast, aikammkoulk_opmast, aikamkkoulk_opmast, aikylamkkoulk_opmast, aikalkkkoulk_opmast, aikylkkkoulk_opmast, aiklistrikoulk_opmast) then 'K' else 'E' end,
Johdettu_Sama_koulutusaste02_Aiempi_opiskelu_Haku = Case when yohakuh_opmast in (yotutkopisxkoulk_opmast, ammopisxkoulk_opmast, amkopisxkoulk1_opmast, amkopisxkoulk2_opmast, amkopisxkoulk3_opmast, yoopisxkoulk1_opmast, yoopisxkoulk2_opmast, yoopisxkoulk3_opmast) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_tutkinto_Haku = case when yohakuh_opm95opa  in (aikyotutkkoulk_opm95opa, aikammkoulk_opm95opa, aikamkkoulk_opm95opa, aikylamkkoulk_opm95opa, aikalkkkoulk_opm95opa, aikylkkkoulk_opm95opa, aiklistrikoulk_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_opiskelu_Haku = Case when yohakuh_opm95opa in (yotutkopisxkoulk_opm95opa, ammopisxkoulk_opm95opa, amkopisxkoulk1_opm95opa, amkopisxkoulk2_opm95opa, amkopisxkoulk3_opm95opa, yoopisxkoulk1_opm95opa, yoopisxkoulk2_opm95opa, yoopisxkoulk3_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_tutkinto_Haku = Case when yohakuh_opmopa in (aikyotutkkoulk_opmopa, aikammkoulk_opmopa, aikamkkoulk_opmopa, aikylamkkoulk_opmopa, aikalkkkoulk_opmopa, aikylkkkoulk_opmopa, aiklistrikoulk_opmopa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_opiskelu_Haku = Case when yohakuh_opmopa in (yotutkopisxkoulk_opmopa, ammopisxkoulk_opmopa, amkopisxkoulk1_opmopa, amkopisxkoulk2_opmopa, amkopisxkoulk3_opmopa, yoopisxkoulk1_opmopa, yoopisxkoulk2_opmopa, yoopisxkoulk3_opmopa) then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_tutkinto_Haku = case when yohakuh_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2) in (aikyotutkkoulk_opm95ala, aikammkoulk_opm95ala, aikamkkoulk_opm95ala, aikylamkkoulk_opm95ala, aikalkkkoulk_opm95ala, aikylkkkoulk_opm95ala, aiklistrikoulk_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_opiskelu_Haku = Case when yohakuh_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2) in (yotutkopisxkoulk_opm95ala, ammopisxkoulk_opm95ala, amkopisxkoulk1_opm95ala, amkopisxkoulk2_opm95ala, amkopisxkoulk3_opm95ala, yoopisxkoulk1_opm95ala, yoopisxkoulk2_opm95ala, yoopisxkoulk3_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_tutkinto_Haku = Case when yohakuh_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (aikyotutkkoulk_opmala, aikammkoulk_opmala, aikamkkoulk_opmala, aikylamkkoulk_opmala, aikalkkkoulk_opmala, aikylkkkoulk_opmala, aiklistrikoulk_opmala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_opiskelu_Haku = Case when yohakuh_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (yotutkopisxkoulk_opmala, ammopisxkoulk_opmala, amkopisxkoulk1_opmala, amkopisxkoulk2_opmala, amkopisxkoulk3_opmala, yoopisxkoulk1_opmala, yoopisxkoulk2_opmala, yoopisxkoulk3_opmala))
  then 'K' else 'E' end,
Johdettu_Sama_oppilaitos_Aiempi_tutkinto_Haku = Case when yohakuh_tunn in (tunnyotutk, tunnamm, tunnamk, tunnylamk, tunnalkk, tunnylkk, tunnlistri) then 'K' else 'E' end,	
Johdettu_Sama_oppilaitos_Aiempi_opiskelu_Haku = Case when yohakuh_tunn in (yotutkopisxtunn, ammopisxtunn, amkopisxtunn1, amkopisxtunn2, amkopisxtunn3, yoopisxtunn1, yoopisxtunn2, yoopisxtunn3) then 'K' else 'E' end,	
Johdettu_Sama_sektori_Aiempi_tutkinto_Haku = Case when 'K' in (aikalkk, aikylkk, aiklistri) then 'K' else 'E' end,	
Johdettu_Sama_sektori_Aiempi_opiskelu_Haku = Case when 'K' in (yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Sama_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when 'K' in (aikalkk, aikylkk, aiklistri, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,	
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_Haku = Case when 'K' in (aikamk, aikylamk, aikalkk, aikylkk, aiklistri) then 'K' else 'E' end,	
Johdettu_Sama_laaja_sektori_Aiempi_opiskelu_Haku = Case when 'K' in (amkopisx1, amkopisx2, amkopisx3, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when 'K' in (aikamk, aikylamk, aikalkk, aikylkk, aiklistri, amkopisx1, amkopisx2, amkopisx3, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Hakenut_Amk_ja_Yo = Case when 
	(amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>'')
	and (yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Korkea_aste_ja_Toinen_aste = Case when 
	(luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'')
	and (amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>''
			or yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Lukio_ja_Ammatillinen_koulutus = Case when 
	((luammhaku1_tunn<>'' and luammhaku1_opmast='31') or (luammhaku2_tunn<>'' and luammhaku2_opmast='31') or (luammhaku3_tunn<>'' and luammhaku3_opmast='31') or (luammhaku4_tunn<>'' and luammhaku4_opmast='31') or (luammhaku5_tunn<>'' and luammhaku5_opmast='31'))
	and ((luammhaku1_tunn<>'' and luammhaku1_opmast<>'31') or (luammhaku2_tunn<>'' and luammhaku2_opmast<>'31') or (luammhaku3_tunn<>'' and luammhaku3_opmast<>'31') or (luammhaku4_tunn<>'' and luammhaku4_opmast<>'31') or (luammhaku5_tunn<>'' and luammhaku5_opmast<>'31'))
	then 'K' else 'E' end,
lkm, 
tietolahde,
rivinumero
FROM VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
WHERE yohakuh_tunn<>''

UNION ALL
-- Uudet haut, haku yo, kohde i, prioriteetti muu
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
Haku_avain = 'yo',
Hakukohde_oppilaitos_avain = yohakui_tunn, 
Hakukohde_koulutusaste2002_avain = yohakui_opmast_avain, 
Hakukohde_koulutusaste_taso2_avain = '-1',
Hakukohde_opintoala2002_avain = yohakui_opmopa_avain, 
Hakukohde_opintoala1995_avain = yohakui_opm95opa_avain,
Hakukohde_iscfibroad2013_avain = '-1',  
Hakukohde_prioriteetti_avain = 'pr_ei', 
Hakukohde_hyvaksytty = yohakui_hyv,
Hakukohde_vastaanotettu = yohakui_vastotto,
Hakukohde_tutkinnon_taso = Case when yohakui_harekast <> '' then 'YO' + yohakui_harekast else '-1' end,
Hakukohde_tutkinnon_taso_tarkennus = Case when yohakui_ylempi <> '' then 'YOTA' + yohakui_ylempi else '-1' end,
Hakukohde_erillisvalinta = yohakui_erval,
Hakukohde_koulutuksen_alkamislukukausi_avain = Koulutuksen_alkamislukukausi_avain,
--Johdettu_Hakija_opiskelee_hakukohteessa = Case when yohakui_tunn in (yoopisxtunn1,yoopisxtunn2,yoopisxtunn3) then 'K' else 'E' end,	
Johdettu_Sama_koulutusaste02_Aiempi_tutkinto_Haku = Case when yohakui_opmast in (aikyotutkkoulk_opmast, aikammkoulk_opmast, aikamkkoulk_opmast, aikylamkkoulk_opmast, aikalkkkoulk_opmast, aikylkkkoulk_opmast, aiklistrikoulk_opmast) then 'K' else 'E' end,
Johdettu_Sama_koulutusaste02_Aiempi_opiskelu_Haku = Case when yohakui_opmast in (yotutkopisxkoulk_opmast, ammopisxkoulk_opmast, amkopisxkoulk1_opmast, amkopisxkoulk2_opmast, amkopisxkoulk3_opmast, yoopisxkoulk1_opmast, yoopisxkoulk2_opmast, yoopisxkoulk3_opmast) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_tutkinto_Haku = case when yohakui_opm95opa  in (aikyotutkkoulk_opm95opa, aikammkoulk_opm95opa, aikamkkoulk_opm95opa, aikylamkkoulk_opm95opa, aikalkkkoulk_opm95opa, aikylkkkoulk_opm95opa, aiklistrikoulk_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala95_Aiempi_opiskelu_Haku = Case when yohakui_opm95opa in (yotutkopisxkoulk_opm95opa, ammopisxkoulk_opm95opa, amkopisxkoulk1_opm95opa, amkopisxkoulk2_opm95opa, amkopisxkoulk3_opm95opa, yoopisxkoulk1_opm95opa, yoopisxkoulk2_opm95opa, yoopisxkoulk3_opm95opa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_tutkinto_Haku = Case when yohakui_opmopa in (aikyotutkkoulk_opmopa, aikammkoulk_opmopa, aikamkkoulk_opmopa, aikylamkkoulk_opmopa, aikalkkkoulk_opmopa, aikylkkkoulk_opmopa, aiklistrikoulk_opmopa) then 'K' else 'E' end,
Johdettu_Sama_opintoala02_Aiempi_opiskelu_Haku = Case when yohakui_opmopa in (yotutkopisxkoulk_opmopa, ammopisxkoulk_opmopa, amkopisxkoulk1_opmopa, amkopisxkoulk2_opmopa, amkopisxkoulk3_opmopa, yoopisxkoulk1_opmopa, yoopisxkoulk2_opmopa, yoopisxkoulk3_opmopa) then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_tutkinto_Haku = case when yohakui_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2) in (aikyotutkkoulk_opm95ala, aikammkoulk_opm95ala, aikamkkoulk_opm95ala, aikylamkkoulk_opm95ala, aikalkkkoulk_opm95ala, aikylkkkoulk_opm95ala, aiklistrikoulk_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala95_Aiempi_opiskelu_Haku = Case when yohakui_opm95ala
 in (select koulutusala1995_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,8)='OPM95ALA' and SUBSTRING(koulutusluokitus_avain,9,2) in (yotutkopisxkoulk_opm95ala, ammopisxkoulk_opm95ala, amkopisxkoulk1_opm95ala, amkopisxkoulk2_opm95ala, amkopisxkoulk3_opm95ala, yoopisxkoulk1_opm95ala, yoopisxkoulk2_opm95ala, yoopisxkoulk3_opm95ala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_tutkinto_Haku = Case when yohakui_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (aikyotutkkoulk_opmala, aikammkoulk_opmala, aikamkkoulk_opmala, aikylamkkoulk_opmala, aikalkkkoulk_opmala, aikylkkkoulk_opmala, aiklistrikoulk_opmala))
  then 'K' else 'E' end,
Johdettu_Sama_koulutusala02_Aiempi_opiskelu_Haku = Case when yohakui_opmala
 in (select koulutusala2002_koodi from VipunenTK.dbo.d_koulutusluokitus where left(koulutusluokitus_avain,6)='OPMALA' and SUBSTRING(koulutusluokitus_avain,7,4) in (yotutkopisxkoulk_opmala, ammopisxkoulk_opmala, amkopisxkoulk1_opmala, amkopisxkoulk2_opmala, amkopisxkoulk3_opmala, yoopisxkoulk1_opmala, yoopisxkoulk2_opmala, yoopisxkoulk3_opmala))
  then 'K' else 'E' end,
Johdettu_Sama_oppilaitos_Aiempi_tutkinto_Haku = Case when yohakui_tunn in (tunnyotutk, tunnamm, tunnamk, tunnylamk, tunnalkk, tunnylkk, tunnlistri) then 'K' else 'E' end,	
Johdettu_Sama_oppilaitos_Aiempi_opiskelu_Haku = Case when yohakui_tunn in (yotutkopisxtunn, ammopisxtunn, amkopisxtunn1, amkopisxtunn2, amkopisxtunn3, yoopisxtunn1, yoopisxtunn2, yoopisxtunn3) then 'K' else 'E' end,	
Johdettu_Sama_sektori_Aiempi_tutkinto_Haku = Case when 'K' in (aikalkk, aikylkk, aiklistri) then 'K' else 'E' end,	
Johdettu_Sama_sektori_Aiempi_opiskelu_Haku = Case when 'K' in (yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Sama_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when 'K' in (aikalkk, aikylkk, aiklistri, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,	
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_Haku = Case when 'K' in (aikamk, aikylamk, aikalkk, aikylkk, aiklistri) then 'K' else 'E' end,	
Johdettu_Sama_laaja_sektori_Aiempi_opiskelu_Haku = Case when 'K' in (amkopisx1, amkopisx2, amkopisx3, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_tai_opiskelu_Haku = Case when 'K' in (aikamk, aikylamk, aikalkk, aikylkk, aiklistri, amkopisx1, amkopisx2, amkopisx3, yoopisx1, yoopisx2, yoopisx3) then 'K' else 'E' end,
Johdettu_Hakenut_Amk_ja_Yo = Case when 
	(amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>'')
	and (yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Korkea_aste_ja_Toinen_aste = Case when 
	(luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'' or luammhaku1_tunn<>'')
	and (amkhaku1_tunn<>'' or amkhaku2_tunn<>'' or amkhaku3_tunn<>'' or amkhaku4_tunn<>'' or amkhakum_tunn<>''
			or yohakua_tunn<>'' or yohakub_tunn<>'' or yohakuc_tunn<>'' or yohakud_tunn<>'' or yohakue_tunn<>'' or yohakuf_tunn<>'' or yohakug_tunn<>'' or yohakuh_tunn<>'' or yohakui_tunn<>'') 
	then 'K' else 'E' end,
Johdettu_Hakenut_Lukio_ja_Ammatillinen_koulutus = Case when 
	((luammhaku1_tunn<>'' and luammhaku1_opmast='31') or (luammhaku2_tunn<>'' and luammhaku2_opmast='31') or (luammhaku3_tunn<>'' and luammhaku3_opmast='31') or (luammhaku4_tunn<>'' and luammhaku4_opmast='31') or (luammhaku5_tunn<>'' and luammhaku5_opmast='31'))
	and ((luammhaku1_tunn<>'' and luammhaku1_opmast<>'31') or (luammhaku2_tunn<>'' and luammhaku2_opmast<>'31') or (luammhaku3_tunn<>'' and luammhaku3_opmast<>'31') or (luammhaku4_tunn<>'' and luammhaku4_opmast<>'31') or (luammhaku5_tunn<>'' and luammhaku5_opmast<>'31'))
	then 'K' else 'E' end,
lkm, 
tietolahde,
rivinumero
FROM VipunenTK_DW.dbo.f_K3_16_Moninkertainen_haku
WHERE yohakui_tunn<>''

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
LEFT JOIN VipunenTK.dbo.d_hakukohde d_hk					ON d_hk.hakukohde_avain = f.Haku_avain
LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot d_ol	ON d_ol.oppilaitos_avain = f.Hakukohde_oppilaitos_avain
LEFT JOIN VipunenTK.dbo.d_alueluokitus d_ol_al				ON d_ol_al.alueluokitus_avain = d_ol.sijaintikuntakoodi
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d_ka02			ON d_ka02.koulutusluokitus_avain = f.Hakukohde_koulutusaste2002_avain
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d_kastet2		ON d_kastet2.koulutusluokitus_avain = f.Hakukohde_koulutusaste_taso2_avain
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d_oa02			ON d_oa02.koulutusluokitus_avain = f.Hakukohde_opintoala2002_avain
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d_oa95			ON d_oa95.koulutusluokitus_avain = f.Hakukohde_opintoala1995_avain
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d_iscfibroad		ON d_iscfibroad.koulutusluokitus_avain = f.Hakukohde_iscfibroad2013_avain
LEFT JOIN VipunenTK.dbo.d_hakukohteen_prioriteetti d_hp		ON d_hp.hakukohteen_prioriteetti_avain = f.Hakukohde_prioriteetti_avain
LEFT JOIN VipunenTK.dbo.d_hakukohteen_tulos d_ht			ON d_ht.hakukohde_hyvaksytty_koodi = f.Hakukohde_hyvaksytty	AND d_ht.hakukohde_vastaanotettu_koodi = f.Hakukohde_vastaanotettu
LEFT JOIN VipunenTK.dbo.d_hakukohteen_tutkinnon_taso d_htt	ON d_htt.hakukohde_tutkinnon_taso_koodi = f.Hakukohde_tutkinnon_taso	AND d_htt.Hakukohde_tutkinnon_taso_tarkennus_koodi = f.Hakukohde_tutkinnon_taso_tarkennus
LEFT JOIN VipunenTK.dbo.d_hakukohde_erillisvalinta d_hev	ON d_hev.hakukohde_erillisvalinta_avain = f.Hakukohde_erillisvalinta
LEFT JOIN VipunenTK.dbo.d_kausi d_kau						ON d_kau.kausi_id = f.Hakukohde_koulutuksen_alkamislukukausi_avain







GO


USE [ANTERO]