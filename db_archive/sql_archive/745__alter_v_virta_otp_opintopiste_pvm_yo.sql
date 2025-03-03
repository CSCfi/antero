ALTER VIEW [dw].[v_virta_otp_opintopiste_pvm_yo] AS 
SELECT
     [Tilastovuosi] = f.tilastovuosi
     ,[Suorituspäivämäärä] = f.suorituspaiva
     ,[Suoritusvuosi] = YEAR(f.suorituspaiva)
     ,[Suorituskuukausi] = MONTH (f.suorituspaiva)
     ,[Suorituspäivä] = DAY(f.suorituspaiva)
     ,[Koulutusala_koodi] = case d1.ohjauksenala_koodi when -1 then 99 else d1.ohjauksenala_koodi end
     ,[Koulutusala] = d1.ohjauksenala_nimi_fi
     ,[Yliopisto_koodi_koodi] = case d2.yo_tunnus when -1 then 99 else d2.yo_tunnus end
     ,[Yliopisto] = d2.yo_nimi_fi
     ,[Lukumaara] = f.lukumaara_int
     ,[Perustutk_opiskelijat] = f.perustutk_opiskelijat_lkm
     ,[Vierask_suoritukset] = f.vierask_suoritukset_lkm
	 ,[Kansainv_vaihto] = f.kansainv_vaihto_lkm
     ,[KK_yhteistyo] = f.kk_yhteistyo_lkm
	 ,[Avoin_kk] = f.avoin_kk_lkm
	 ,[Erillinen_opinto_oikeus] = f.erillinen_opinto_oikeus_lkm
	 ,[Ulkomailta_hyv_luet] = f.ulkomailta_hyv_luet_lkm
	 ,[Erillinen_opinto_opettaja] = f.erillinen_opinto_opettaja_lkm
	 ,[Ulkomaanharjoittelu] = f.ulkomaaharjoittelu_lkm
	 ,[Erikoistumiskoulutus] = f.erikoistumiskoulutus_lkm
	 ,[Tietojen_ajankohta] = f.loadtime
	 ,[Source] = f.source
	 ,[Username] = f.username
  FROM [dw].[f_virta_otp_opintopiste_pvm_yo] f
  LEFT JOIN dw.d_ohjauksenala d1 ON d1.id=f.d_ohjauksenala_id
  LEFT JOIN dw.d_yo d2 ON d2.id = f.d_yo_id


  