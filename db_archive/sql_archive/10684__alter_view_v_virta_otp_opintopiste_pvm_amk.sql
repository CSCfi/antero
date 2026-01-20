USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_otp_opintopiste_pvm_amk]    Script Date: 10.3.2025 10.55.05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dw].[v_virta_otp_opintopiste_pvm_amk] AS 

SELECT 
      [Tilastovuosi] = f.tilastovuosi 
     --,[Suorituspäivämäärä] = f.suorituspaiva
     ,[Suoritusvuosi] = YEAR(f.suorituspaiva)
     ,[Suorituskuukausi] = MONTH(f.Suorituspaiva) 
     ,[Suorituspäivä] = DAY(f.suorituspaiva)
     ,[Koulutusala_koodi]  = case d1.ohjauksenala_koodi when -1 then 99 else d1.ohjauksenala_koodi end
     ,[Koulutusala] = d1.ohjauksenala_nimi_fi
	 ,[Koulutustyyppi_koodi] = case d2.koodi when -1 then 99 else d2.koodi end
	 ,[Koulutustyyppi] = d2.selite_fi
	 ,[Ammattikorkeakoulu_koodi] = case d3.organisaatio_koodi when -1 then 99 else d3.organisaatio_koodi end
	 ,[Ammattikorkeakoulu] = d3.organisaatio_fi
	 ,[Lukumaara] = f.lukumaara_int
	 ,[Perustutk_opiskelijat] = f.perustutk_opiskelijat_lkm
	 ,[Vierask_suoritukset] = f.vierask_suoritukset_lkm
	 ,[Kansainv_vaihto] = f.kansainv_vaihto_lkm
	 ,[Kk_yhteistyo] = f.kk_yhteistyo_lkm
	 ,[Avoin_kk] = f.avoin_kk_lkm
	 ,[Erillinen_opinto_oikeus] = f.erillinen_opinto_oikeus_lkm
	 ,[Ulkomailta_hyv_luet] = f.ulkomailta_hyv_luet_lkm
	 ,[Maahanm_val_koulutus] = f.maahanm_val_koulutus_lkm
	 ,[TKI_toiminnan_laajuus] = f.TKI_toiminnan_laajuus_lkm
	 ,[TKI_muut_laajuus] = f.TKI_muut_laajuus_lkm
	 ,[TKI_harjoittelun_laajuus] = f.TKI_harjoittelun_laajuus_lkm
	 ,[Ulkomaanharjoittelu] = f.ulkomaaharjoittelu_lkm
	 ,[Erikoistumiskoulutus] = f.erikoistumiskoulutus_lkm
	 ,f.kvsuomivieraana_lkm
	 ,f.kvruotsivieraana_lkm
	 ,f.muunkuinkorkeakoulun_lkm
	 ,[Päivitysajankohta] = f.paivitys_ajankohta
	 ,[Tietojen ajankohta] = f.tietojen_ajankohta
	 ,[jarjestys_tietojen_ajankohta] = f.jarjestys_tietojen_ajankohta
	 --,[Source] = f.source
	 --,[Username] = f.username

  FROM dw.f_virta_otp_opintopiste_pvm_amk f
  LEFT JOIN dw.d_ohjauksenala d1 ON d1.id=f.d_ohjauksenala_id
  LEFT JOIN dw.d_amk_koulutustyyppi d2 ON d2.id = f.d_amk_koulutustyyppi_id
  LEFT JOIN dw.d_organisaatioluokitus d3 ON d3.id = f.d_amk_id

GO

USE [ANTERO]