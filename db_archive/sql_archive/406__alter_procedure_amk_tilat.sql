ALTER PROCEDURE [dw].[p_lataa_f_yo_tilat]
AS
TRUNCATE TABLE dw.f_yo_tilat;

INSERT INTO dw.f_yo_tilat (
	[d_yliopisto_id]
	,[vuosi]
	,[harjoittelukoulujen_tilat]
	,[muut_vuokratilat]
	,[yliopistokiinteistoyhtion_toimitilat_suomen_yliopistokiinteistot_oy]
	,[yliopistokiinteistoyhtion_toimitilat_aalto_yliopistokiinteistot_oy]
	,[yliopistokiinteistoyhtion_toimitilat_helsingin_yliopistokiinteistot_oy]
	,[loadtime]
	,[source]
	,[username]
	)
SELECT s2.id
	,[Vuosi]
	,COALESCE([Harjoittelukoulujen tilat],0)
	,COALESCE([Muut vuokratilat],0)
	,COALESCE([Yliopistokiinteistöyhtiön toimitilat, Suomen Yliopistokiinteistöt Oy],0)
	,COALESCE([Yliopistokiinteistöyhtiön toimitilat, Aalto-Yliopistokiinteistöt Oy],0)
	,COALESCE([Yliopistokiinteistöyhtiön toimitilat, Helsingin Yliopistokiinteistöt Oy],0)
	,getdate()
	,'etl: p_lataa_f_yo_opettaja_ja_tutkijavierailut'
	,suser_sname()
FROM [sa].[sa_suorat_yo8_tilat] s1
JOIN [dw].[d_yo] s2 ON s1.yliopisto = s2.yo_tunnus