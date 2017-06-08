IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'dw.v_virta_otp_liikennevalot'))
EXEC dbo.sp_executesql @statement = N'create view dw.v_virta_otp_liikennevalot as select 1 as a'
GO

ALTER VIEW dw.[v_virta_otp_liikennevalot] AS

SELECT [id]
      ,[ensisijaisuusPuuttuu]
      ,[kk]
      ,[lasnaolevienTutkintoopiskelijoidenLkm]
      ,[liikkuvuusjaksojenLkm]
      ,[lukukausiilmoittautumisiaVuosilleLkm]
      ,[luoja]
      ,[luontipaivamaara]
      ,[opintosuoritukseltaPuuttuuNimi]
      ,[opintosuoritukseltaPuuttuuArvosana]
      ,[opintosuoritukseltaPuuttuuKoulutusala]
      ,[opintosuorituksenSisaltyvyys]
      ,[opintosuoritusIlmanOpintooikeuttaAmk]
      ,[opiskelijallaEiOleHetua]
      ,[opiskelijallaEiOleOpiskeluoikeuttaLukukausiilmoittautumistaTaiOpintosuoritusta]
      ,[opiskelijoidenLkm]
      ,[opiskeluoikeudenOpiskeluoikeusjaksoEiMuodostaEheaaAikajaksoa]
      ,[opiskeluoikeudenTilaEiMuodostaEheaaAikajaksoa]
      ,[opiskeluoikeuksienEnsisijaisuuksissaPaallekkaisyyksia]
      ,[opiskeluoikeusjaksoltaPuuttuuKoulutuskoodi]
      ,[oppilaitostunnus]
      ,[tietovarannonTietojenPaivitysLainMukaisellaAikataululla]
      ,[tutkintoIlmanKoulutuskoodia]
      ,[tutkintoopiskelijoidenLkm]
      ,[loadtime]
      ,[source]
      ,[username]
  FROM ANTERO.[sa].[sa_virta_otp_liikennevalot]
GO