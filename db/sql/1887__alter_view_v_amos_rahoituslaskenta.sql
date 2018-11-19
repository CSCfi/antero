USE ANTERO
GO
ALTER VIEW [dw].[v_amos_rahoituslaskenta] AS
SELECT 
  Vuosi
 ,Vaihe
    ,[Koulutuksen järjestäjä]
 ,[Koodit Koulutuksen järjestäjä]
 ,Osa

    ,AVG([profiilikerroin]) as profiilikerroin
    ,AVG([painotettu_opiskelijavuosimäärä]) as painotettu_opiskelijavuosimäärä
 ,AVG([painottamaton_opiskelijavuosimaara]) as painottamaton_opiskelijavuosimaara

 ,AVG([tutkintopisteiden_osuus]) as tutkintopisteiden_osuus
    ,AVG([painotettu_tutkintomaara]) as painotettu_tutkintomaara
    ,AVG([painottamaton_tutkintomaara]) as painottamaton_tutkintomaara

 ,AVG([jarj_luvan_opiskelijavuodet]) as jarj_luvan_opiskelijavuodet

FROM (

 SELECT 
   vuosi as 'Vuosi'
  ,vaihe as 'Vaihe'
  ,d1.organisaatio_fi as 'Koulutuksen järjestäjä'
  ,d1.organisaatio_koodi as 'Koodit Koulutuksen järjestäjä'
  ,'opiskelijavuodet' as 'Osa'

  ,[profiilikerroin]
  ,[painotettu_opiskelijavuosimäärä]
  ,[painottamaton_opiskelijavuosimaara]

  ,[tutkintopisteiden_osuus] = NULL
  ,[painotettu_tutkintomaara] = NULL
  ,[painottamaton_tutkintomaara] = NULL

  ,jarj_luvan_opiskelijavuodet = NULL
 FROM [ANTERO].[dw].[f_amos_opiskelijavuodet] f
 LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.id=f.d_organisaatioluokitus_id
 WHERE vaihe = 
 (CASE 
  WHEN NOT EXISTS (SELECT TOP 1 1 FROM ANTERO.dw.f_amos_opiskelijavuodet WHERE vaihe = 'L' AND vuosi = (SELECT MAX(vuosi) FROM ANTERO.dw.f_amos_tutkinnot)) THEN 'E'
  ELSE 'L'
 END)

 UNION ALL

 SELECT 
   vuosi
  ,vaihe
  ,d1.organisaatio_fi
  ,d1.organisaatio_koodi
  ,'tutkintopisteet' as 'Osa'

  ,[profiilikerroin] = NULL
  ,[painotettu_opiskelijavuosimäärä] = NULL
  ,[painottamaton_opiskelijavuosimaara] = NULL

  ,[tutkintopisteiden_osuus]
  ,[painotettu_tutkintomaara]
  ,[painottamaton_tutkintomaara]

  ,jarj_luvan_opiskelijavuodet = NULL
 FROM ANTERO.dw.f_amos_tutkinnot f
 LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.id=f.d_organisaatioluokitus_id
 WHERE vaihe = 
 (CASE 
  WHEN NOT EXISTS (SELECT TOP 1 1 FROM ANTERO.dw.f_amos_tutkinnot WHERE vaihe = 'L' AND vuosi = (SELECT MAX(vuosi) FROM ANTERO.dw.f_amos_tutkinnot)) THEN 'E'
  ELSE 'L'
 END)

 UNION ALL

 SELECT 
   vuosi = f2.vuosi
  ,vaihe = f2.vaihe
  ,d1.organisaatio_fi
  ,d1.organisaatio_koodi 
  ,'jarjestamislupa' as 'Osa'

  ,[profiilikerroin] = NULL
  ,[painotettu_opiskelijavuosimäärä] = NULL
  ,[painottamaton_opiskelijavuosimaara] = NULL

  ,[tutkintopisteiden_osuus] = NULL
  ,[painotettu_tutkintomaara] = NULL
  ,[painottamaton_tutkintomaara] = NULL

  ,[arvo] as jarj_luvan_opiskelijavuodet
 FROM ANTERO.dw.f_oiva_opiskelijavuodet f
 LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.id=f.d_organisaatio_id
 LEFT JOIN ANTERO.dw.f_amos_opiskelijavuodet f2 on f2.d_organisaatioluokitus_id=f.d_organisaatio_id

) q

GROUP BY  [Vuosi],[Vaihe],[Koulutuksen järjestäjä],[Koodit Koulutuksen järjestäjä],[Osa]

