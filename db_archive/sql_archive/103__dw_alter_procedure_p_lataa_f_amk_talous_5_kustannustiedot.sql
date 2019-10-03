ALTER PROCEDURE dw.p_lataa_f_amk_talous_5_kustannustiedot AS

TRUNCATE TABLE dw.f_amk_talous_5_kustannustiedot

INSERT INTO dw.f_amk_talous_5_kustannustiedot
           (d_amk_id
           ,d_ohjauksenala_id
           ,tilikausi
           ,vtkusty
           ,koulutus
           ,tutkoul
           ,ptutosat
           ,ammopkoul
           ,muukoul
           ,tutkimus
           ,ylamkkoul
           ,tktoim
           ,muuyhtei
           ,source)
SELECT d1.id AS d_amk_id
    ,d2.id AS d_ohjauksenala_id
    ,TILIK
      ,VTKUSTY
      ,KOULUTUS
      ,TUTKOUL
      ,PTUTOSAT
      ,AMMOPKOUL
      ,MUUKOUL
      ,TUTKIMUS
      ,YLAMKKOUL
      ,TKTOIM
      ,MUUYHTEI
      ,'ETL: p_lataa_f_amk_talous_5_kustannustiedot' AS source
  FROM sa.sa_SUORAT_AMK_TALOUS_5_kustannustiedot f
  INNER JOIN dw.d_amk d1 ON f.AMK_koodi = d1.amk_tunnus
  INNER JOIN dw.d_ohjauksenala d2 ON f.OHJALA = d2.ohjauksenala_koodi