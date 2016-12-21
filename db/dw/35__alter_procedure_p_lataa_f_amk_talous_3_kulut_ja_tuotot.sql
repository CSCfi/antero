ALTER PROCEDURE dbo.p_lataa_f_amk_talous_3_kulut_ja_tuotot AS

TRUNCATE TABLE ANTERO_DW.dbo.f_amk_talous_3_kulut_ja_tuotot

INSERT INTO dbo.f_amk_talous_3_kulut_ja_tuotot
           (d_amk_id
           ,d_toiminto_id
           ,tilikausi
           ,tuotot_yhteensa
           ,perusrahoitus_yhteensa
           ,tuet_ja_avustukset_yhteensa
           ,maksut_ja_korvaukset_yhteensa
           ,muu_liikevaihto_yhteensa
           ,toiminnan_muut_tuotot_yhteensa
           ,kulut_yhteensa_yhteensa
           ,materiaalit_ja_palvelut_yhteensa
           ,henkilostokulut_yhteensa
           ,poistot_yhteensa
           ,muut_toimintakulut_yhteensa
           ,osuus_yhteisista_kuluista
           ,tuotot_liiketoiminta
           ,perusrahoitus_liiketoiminta
           ,tuet_ja_avustukset_liiketoiminta
           ,maksut_ja_korvaukset_liiketoiminta
           ,muu_liikevaihto_liiketoiminta
           ,toiminnan_muut_tuotot_liiketoiminta
           ,kulut_liiketoiminta
           ,materiaalit_ja_palvelut_liiketoiminta
           ,henkilostokulut_liiketoiminta
           ,poistot_liiketoiminta
           ,muut_toimintakulut_liiketoiminta
           ,osuus_yhteisista_kuluista_liiketoiminta
           ,tuotot_perustehtava
           ,perusrahoitus_perustehtava
           ,tuet_ja_avustukset_perustehtava
           ,maksut_ja_korvaukset_perustehtava
           ,muu_liikevaihto_perustehtava
           ,toiminnan_muut_tuotot_perustehtava
           ,kulut_perustehtava
           ,materiaalit_ja_palvelut_perustehtava
           ,henkilostokulut_perustehtava
           ,poistot_perustehtava
           ,muut_toimintakulut_perustehtava
           ,osuus_yhteisista_kuluista_perustehtava
           ,source)
SELECT d1.id AS d_amk_id
	  ,d2.id AS d_toiminto_id
	  ,TILIK
      ,YTTUOTOT
      ,YTPRAHOITUS
      ,YTTUETAVU
      ,YTMAKKORV
      ,YTMUULIIKE
      ,YTMUUTUOT
      ,YKULUTYHT
      ,YKMATPAL
      ,YKHENKILOSTO
      ,YKPOISTO
      ,YKMUUTKULU
      ,YOSUUSYKU
      ,LTTUOTOT
      ,LTPRAHOITUS
      ,LTTUETAVU
      ,LTMAKKORV
      ,LTMUULIIKE
      ,LTMUUTUOT
      ,LKULUTYHT
      ,LKMATPAL
      ,LKHENKILOSTO
      ,LKPOISTO
      ,LKMUUTKULU
      ,LOSUUSYKU
      ,PTTUOTOT
      ,PTPRAHOITUS
      ,PTTUETAVU
      ,PTMAKKORV
      ,PTMUULIIKE
      ,PTMUUTUOT
      ,PKULUTYHT
      ,PKMATPAL
      ,PKHENKILOSTO
      ,PKPOISTO
      ,PKMUUTKULU
      ,POSUUSYKU
      ,'ETL: p_lataa_f_amk_talous_3_kulut_ja_tuotot' AS source
  FROM ANTERO_SA.dbo.SA_SUORAT_AMK_TALOUS_3_tuloslaskelman_toiminnot f
  INNER JOIN ANTERO_DW.dbo.d_amk d1 ON f.AMK_koodi = d1.amk_tunnus
  INNER JOIN ANTERO_DW.dbo.d_toiminto d2 ON f.PTTOIMINTO = d2.toiminto