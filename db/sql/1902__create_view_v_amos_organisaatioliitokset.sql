USE [Antero]
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dw].[v_amos_organisaatioliitokset]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dw].[v_amos_organisaatioliitokset]
AS
SELECT        LEFT(vanha, 9) AS poistuva_ytunnus, LEFT(uusi, 9) AS uusi_ytunnus, voimaan_alkaen, CASE WHEN voimaan_alkaen <= CAST(CURRENT_TIMESTAMP AS DATE) 
                         THEN 1 ELSE 0 END AS kytkin_muutos_voimassa
FROM            dw.d_amos_rajapinta_organisaatioliitokset
WHERE        (voimaan_alkaen <= CAST(CURRENT_TIMESTAMP AS DATE))

'
