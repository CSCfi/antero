ALTER PROCEDURE dbo.p_lataa_f_amk_talous_4_tilikauden_tutkimusmenot_ja_rahoitus AS

TRUNCATE TABLE ANTERO_DW.dbo.f_amk_talous_4_tilikauden_tutkimusmenot_ja_rahoitus

INSERT INTO dbo.f_amk_talous_4_tilikauden_tutkimusmenot_ja_rahoitus
           (d_amk_id
           ,d_ohjauksenala_id
           ,tilikausi
           ,tutmenot
           ,perusr
           ,ulkoptr
           ,akatemia
           ,muuokm
           ,tekes
           ,muutem
           ,ulkomin
           ,oikmin
           ,sisämin
           ,puolmin
           ,valtvmin
           ,mmm
           ,lvm
           ,stm
           ,ympmin
           ,kunnat
           ,muujulkr
           ,kotiraha
           ,kotiyrit
           ,ulkoyrit
           ,eupuiter
           ,eakr
           ,esr
           ,muueur
           ,ulkoraha
           ,kvjarj
           ,ulkomuur
           ,amkomarah
           ,source)
SELECT d1.id AS d_amk_id
	  ,d2.id AS d_ohjauksenala_id
	  ,TILIK
      ,TUTMENOT
      ,PERUSR
      ,ULKOPTR
      ,AKATEMIA
      ,MUUOKM
      ,TEKES
      ,MUUTEM
      ,ULKOMIN
      ,OIKMIN
      ,SISÄMIN
      ,PUOLMIN
      ,VALTVMIN
      ,MMM
      ,LVM
      ,STM
      ,YMPMIN
      ,KUNNAT
      ,MUUJULKR
      ,KOTIRAHA
      ,KOTIYRIT
      ,ULKOYRIT
      ,EUPUITER
      ,EAKR
      ,ESR
      ,MUUEUR
      ,ULKORAHA
      ,KVJARJ
      ,ULKOMUUR
      ,AMKOMARAH
      ,'ETL: p_lataa_f_amk_talous_4_tilikauden_tutkimusmenot_ja_rahoitus' AS source
  FROM ANTERO_SA.dbo.SA_SUORAT_AMK_TALOUS_4_tutkimusmenot f
  INNER JOIN ANTERO_DW.dbo.d_amk d1 ON f.AMK_koodi = d1.amk_tunnus
  INNER JOIN ANTERO_DW.dbo.d_ohjauksenala d2 ON f.OPM95OPA_koodi = d2.ohjauksenala_koodi