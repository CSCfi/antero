USE Antero
GO

IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'dw.v_amos_rahoitus_notes'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dw.v_amos_rahoitus_notes AS SELECT 1 AS a'

GO
/*
ALTER VIEW dw.v_amos_rahoitus_notes
AS
SELECT        noteid, pvm, tekija, kommentti
FROM            dw.d_amos_rahoitus_notes
union
select top 20 * from (
SELECT distinct top 2 
round(rand(1000)*100,0) as noteid
,      imp_date as pvm
   , 'db-admin' as tekija
      ,filename as kommentti

  FROM ANTERO.sa.valos_siirtotiedosto_1
  order by imp_date desc) as v
order by pvm desc
*/
