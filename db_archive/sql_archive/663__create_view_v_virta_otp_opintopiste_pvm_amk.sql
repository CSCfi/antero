IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'dw.v_virta_otp_opintopiste_pvm_amk'))
EXEC dbo.sp_executesql @statement = N'create view dw.v_virta_otp_opintopiste_pvm_amk as select 1 as a'
GO

-- alter view to same just so column types are refreshed
ALTER VIEW [dw].[v_virta_otp_opintopiste_pvm_amk] AS 
SELECT
      [Tilastovuosi] = f.tilastovuosi
     ,[Suorituspäivämäärä] = f.suorituspaiva
     ,[Suoritusvuosi] = YEAR(f.suorituspaiva)
     ,[Suorituskuukausi] = MONTH (f.suorituspaiva)
     ,[Suorituspäivä] = DAY(f.suorituspaiva)
     ,[Ohjauksenala_koodi] = d1.ohjauksenala_koodi
     ,[Ohjauksenala] = d1.ohjauksenala_nimi_fi
	 ,[Koulutustyyppi_koodi] = d2.koodi
	 ,[Koulutustyyppi] = d2.selite_fi
	 ,[Organisaatio_koodi] = d3.amk_tunnus
	 ,[Organisaatio] = d3.amk_nimi_fi
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
  FROM dw.f_virta_otp_opintopiste_pvm_amk f
  LEFT JOIN dw.d_ohjauksenala d1 ON d1.id=f.d_ohjauksenala_id
  LEFT JOIN dw.d_amk_koulutustyyppi d2 ON d2.id = f.d_amk_koulutustyyppi_id
  LEFT JOIN dw.d_amk d3 ON d3.id = f.d_amk_id


