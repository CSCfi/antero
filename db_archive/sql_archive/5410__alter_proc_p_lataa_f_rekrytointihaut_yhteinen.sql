USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_rekrytointihaut_yhteinen]    Script Date: 10.1.2022 15:34:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_rekrytointihaut_yhteinen]
AS
TRUNCATE TABLE dw.f_rekrytointihaut_yhteinen
INSERT INTO dw.f_rekrytointihaut_yhteinen
	(
	   [Tilastovuosi]
      ,[d_korkeakoulu_id]
	  ,[koodi_sektori]
      ,[Hakunumero]
      ,[d_kutsuhaku_id]
      ,[d_kansainvalinen_haku_id]
      ,[d_yhteisprofessuuri_id]
      ,[d_sukupuoli_id]
      ,[d_kansalaisuus_suomi_id]
      ,[d_kansalaisuus_maanosa_id]
      ,[hakijat]
      ,[loadtime]
      ,[source]
      ,[username]
		)
SELECT 
	   Tilastovuosi
	  ,COALESCE(d.id, '-1') as d_korkeakoulu_id
	  ,'amk' as koodi_sektori
      ,COALESCE([Hakunumero], '-1') as Hakunumero
	  ,'-1' as d_kutsuhaku_id
      ,COALESCE([Haun kansainvälisyys], '-1') as d_kansainvalinen_haku_id
	  ,'-1' as d_yhteisprofessuuri_id
      ,COALESCE(d2.id, '-1') as d_sukupuoli_id
      ,CASE WHEN [Kansalaisuus] = '0' THEN '1'
	   WHEN Kansalaisuus = '1' THEN '0' ELSE '-1' END as d_kansalaisuus_suomi_id
      ,COALESCE([Ei-suomalaisen hakijan maanosa], '-1') as d_kansalaisuus_maanosa_id
      ,[Hakijoiden määrä] as hakijat
	  ,getdate() as loadtime
	  ,'etl: p_lataa_f_yo_rekrytointi_valitut - sa.sa_suorat_amk7a_rekrytointihaut' as source
	  ,suser_sname() as username
FROM (
 SELECT s2.*  FROM (SELECT Korkeakoulu, Hakunumero, [Hakijoiden määrä yhteensä haussa], MIN(Tilastovuosi) as Tilastovuosi
 FROM [ANTERO].[sa].[sa_suorat_amk7a_rekrytointihaut]
 GROUP BY [Korkeakoulu], [Hakunumero], [Hakijoiden määrä yhteensä haussa]) s
 LEFT JOIN [ANTERO].[sa].[sa_suorat_amk7a_rekrytointihaut] s2 on s.Hakunumero = s2.Hakunumero and s.Tilastovuosi = s2.Tilastovuosi and
																 s.Korkeakoulu = s2.Korkeakoulu and s.[Hakijoiden määrä yhteensä haussa] = s2.[Hakijoiden määrä yhteensä haussa]
	 ) s
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d on d.organisaatio_koodi = s.Korkeakoulu
LEFT JOIN ANTERO.dw.d_sukupuoli d2 on d2.sukupuoli_koodi = s.Sukupuoli
LEFT JOIN ANTERO.dw.d_rekrytointi_maanosat d3 on d3.rekrytointi_maanosat_koodi = s.[Ei-suomalaisen hakijan maanosa]

UNION ALL

SELECT 
	   Tilastovuosi
	  ,COALESCE(d.id, '-1') as d_korkeakoulu_id
	  ,'yo' as koodi_sektori
      ,COALESCE([Hakunumero], '-1')
	  ,COALESCE(Kutsuhaku, '-1') as d_kutsuhaku_id
      ,COALESCE([Haun kansainvälisyys],'-1') as d_kansainvalinen_haku_id
	  ,COALESCE(Yhteisprofessuuri, '-1') as d_yhteisprofessuuri_id
      ,COALESCE(d2.id, '-1') as d_sukupuoli_id
      ,CASE WHEN [Kansalaisuus] = '0' THEN '1'
	   WHEN Kansalaisuus = '1' THEN '0' ELSE '-1' END as d_kansalaisuus_suomi_id
      ,COALESCE([Ei-suomalaisen hakijan maanosa], '-1') as d_kansalaisuus_maanosa_id
      ,[Hakijoiden määrä] as hakijat
	  ,getdate() as loadtime
	  ,'etl: p_lataa_f_yo_rekrytointi_valitut - sa.sa_suorat_yo8a_rekrytointihaut' as source
	  ,suser_sname() as username
FROM (
 SELECT s2.*  FROM (SELECT Korkeakoulu, Hakunumero, [Hakijoiden määrä yhteensä haussa], MIN(Tilastovuosi) as Tilastovuosi
 FROM [ANTERO].[sa].[sa_suorat_yo8a_rekrytointihaut]
 GROUP BY [Korkeakoulu], [Hakunumero], [Hakijoiden määrä yhteensä haussa]) s
 LEFT JOIN [ANTERO].[sa].[sa_suorat_yo8a_rekrytointihaut] s2 on s.Hakunumero = s2.Hakunumero and s.Tilastovuosi = s2.Tilastovuosi and
																 s.Korkeakoulu = s2.Korkeakoulu and s.[Hakijoiden määrä yhteensä haussa] = s2.[Hakijoiden määrä yhteensä haussa]

     ) s
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d on d.organisaatio_koodi = s.Korkeakoulu
LEFT JOIN ANTERO.dw.d_sukupuoli d2 on d2.sukupuoli_koodi = s.Sukupuoli
LEFT JOIN ANTERO.dw.d_rekrytointi_maanosat d3 on d3.rekrytointi_maanosat_koodi = s.[Ei-suomalaisen hakijan maanosa]
WHERE [Hakijoiden määrä] is not null


GO

USE [ANTERO]