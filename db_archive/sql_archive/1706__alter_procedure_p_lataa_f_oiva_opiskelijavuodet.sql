
ALTER PROCEDURE [dw].[p_lataa_f_oiva_opiskelijavuodet]
AS
TRUNCATE TABLE dw.f_oiva_opiskelijavuodet;

INSERT INTO dw.f_oiva_opiskelijavuodet (
	[arvo]
	,[d_organisaatio_id]
	,[ytunnus]
	,[oid]
	,[loadtime]
	,[source]
	,[username]
	)

SELECT
	COALESCE(s1.arvo, -1) AS arvo
	,COALESCE(d1.id, '-1') AS d_organisaatio_id
	,COALESCE(s2.jarjestajaYtunnus, '-1') AS ytunnus
	,COALESCE(s2.jarjestajaOid, '-1') AS oid
	,getdate()
	,'etl: p_lataa_f_oiva_opiskelijavuodet'
	,suser_sname()
	FROM sa.sa_oiva_maaraykset_pdi s1

LEFT JOIN sa.sa_oiva_jarjestysluvat s2 ON s2.id = s1.lupaid
LEFT JOIN dw.d_organisaatioluokitus d1 ON d1.organisaatio_koodi = s2.jarjestajaYtunnus
WHERE [kohde.tunniste] = 'opiskelijavuodet'
