ALTER PROCEDURE [dw].[p_lataa_f_yo_toimipisteet]
AS
TRUNCATE TABLE dw.f_yo_toimipisteet;

INSERT INTO dw.f_yo_toimipisteet (
	[d_yliopisto_id]
	,[d_toimipiste_id]
	,[d_toimipaikka_id]
	,[vuosi]
	,[toimiala]
	,[toimipaikan_henkilokunnan_henkilotyovuodet]
	,[tutkimusaseman_henkilokunnan_maksimimäärä]
	,[tutkimusaseman_henkilokunnan_minimäärä]
	,[tutkimusaseman_yopymisvuorokaudet]
	,[loadtime]
	,[source]
	,[username]
	)
SELECT s2.id
	,s3.id
	,s4.id
	,[Vuosi]
	,[Toimipaikan toimiala]
	,COALESCE([Toimipaikan henkilokunnan henkilotyovuodet],-1)
	,COALESCE([Tutkimusaseman henkilökunnan maksimimäärä],-1)
	,COALESCE([Tutkimusaseman henkilökunnan minimimäärä],-1)
	,COALESCE([Tutkimusaseman yöpymisvuorokaudet],-1)
	,getdate()
	,'etl: p_lataa_f_yo_toimipisteet'
	,suser_sname()
FROM [sa].[sa_suorat_yo4_toimipisteet] s1
JOIN [dw].[d_yo] s2 ON s1.yliopisto = s2.yo_tunnus
JOIN [dw].[d_yo_toimipiste] s3 ON s1.yliopisto = s3.koodi_yliopisto
	AND s1.[Toimipisteen koodi] = s3.koodi_toimipiste
JOIN [dw].[d_yo_toimipisteen_toimipaikka] s4 ON s1.yliopisto = s4.koodi_yliopisto
	AND s1.[Toimipisteen koodi] = s4.koodi_toimipiste
	AND s1.[Toimipisteen toimipaikan koodi] = s4.koodi_toimipaikka
;