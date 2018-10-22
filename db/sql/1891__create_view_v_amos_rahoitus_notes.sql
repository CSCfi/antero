USE [Antero]
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dw].[v_amos_rahoitus_notes]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dw].[v_amos_rahoitus_notes]
AS
SELECT        noteid, pvm, tekija, kommentti
FROM            dw.d_amos_rahoitus_notes
union
select top 20 * from (
SELECT distinct top 2 
[id] as noteid
,      [latauspvm] as pvm
   , [username] as tekija
      ,[tiedostonimi] as kommentti
  FROM [ANTERO].[sa].[sa_amos_siirtotiedosto_okm2]
  order by imp_date desc) as v
order by pvm desc

'