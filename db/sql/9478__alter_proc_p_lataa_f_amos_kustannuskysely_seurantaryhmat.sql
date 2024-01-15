USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_kustannuskysely_seurantaryhmat]    Script Date: 12.1.2024 13:31:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_amos_kustannuskysely_seurantaryhmat] AS

EXEC dw.p_lataa_d_amos_kustannuskysely_seurantaryhma

DECLARE @cols AS NVARCHAR(MAX), @query  AS NVARCHAR(MAX)

SELECT @cols = 
	STUFF(
		(
			SELECT distinct
				',' + QUOTENAME(koodi)
			FROM dw.d_amos_kustannuskysely_seurantaryhma
			WHERE summatieto = 0 and koodi != '-1'
			FOR XML PATH(''), TYPE
		).value('.', 'NVARCHAR(MAX)') 
	,1,1,'')

SET @query = '
	TRUNCATE TABLE dw.f_amos_kustannuskysely_seurantaryhmat

	INSERT INTO dw.f_amos_kustannuskysely_seurantaryhmat

	SELECT 
		 [vuosi]
		,[d_organisaatioluokitus_id] = coalesce(d1.id,-1)
		,[d_amos_seurantaryhma_id] = coalesce(d2.id,-1)
		,[d_kytkin_oppisopimuskoulutus_id] = coalesce(d3.id,-1)
		,[d_kytkin_vankilaopetus_id] = coalesce(d4.id,-1)
		,[d_ammatillisen_tutkinnon_kustannusryhma_id] = coalesce(d5.id,-1)
		,[d_koulutusluokitus_tutkintotyypin_ryhma_id] = coalesce(d6.id,-1)
		,[d_koulutusluokitus_koulutusala_taso1_id] = coalesce(d7.id,-1)
		,[omistajatyyppi]
		,[euroa]

	FROM (

		SELECT distinct
			 [vuosi]
			,[jarjestaja_koodi] = [ytunnus]
			,[Koulutuksen järjestäjä] = SUBSTRING(ytunnus_nimi,11,LEN(ytunnus_nimi))
			,[seurantaryhma]
			,[tutk_johtava] = CASE LEFT(cast(seuranta as varchar(5)),1) WHEN 1 THEN 1 ELSE 0 END
			,[oppisopimus] = CASE WHEN seurantaryhma like ''%12%'' THEN 1 ELSE 0 END
			,[vankilaopetus] = CASE WHEN seurantaryhma like ''%15%'' THEN 1 ELSE 0 END
			,[koulutusala1_koodi] = 
				CASE 
					WHEN seuranta_nimi like ''%valma%'' 
						or seuranta_nimi like ''%tuva%'' 
						or seuranta_nimi like ''%telma%'' 
						or seuranta_nimi like ''%opiskeluvalmiuksia tukevat opinnot%''
						THEN ''-1''
					WHEN seuranta_nimi like ''%muu ammatillinen koulutus%'' THEN ''99''
					ELSE SUBSTRING(cast(seuranta as varchar(5)),2,2) 
				END
			,[kustannusryhma_koodi] = 
				CASE
					WHEN seuranta_nimi like ''%valma%'' 
						or seuranta_nimi like ''%tuva%'' 
						or seuranta_nimi like ''%telma%'' 
						THEN ''vt''
					WHEN seuranta_nimi like ''%opiskeluvalmiuksia tukevat opinnot%'' THEN ''ot''
					WHEN seuranta_nimi like ''%muu ammatillinen koulutus%'' THEN ''muu''
					ELSE SUBSTRING(cast(seuranta as varchar(5)),4,1)
				END
			,[tutkintotyyppi_koodi] = 
				CASE 
					WHEN [ttyyppi]=1 THEN ''02'' 
					WHEN [ttyyppi]=2 THEN ''08'' 
					WHEN seuranta_nimi like ''%valma%'' 
						or seuranta_nimi like ''%tuva%'' 
						or seuranta_nimi like ''%telma%'' 
						or seuranta_nimi like ''%opiskeluvalmiuksia tukevat opinnot%''
						THEN ''09''
					WHEN seuranta_nimi like ''%muu ammatillinen koulutus%'' THEN ''-1''
					ELSE ''09''
				END
			,[omistajatyyppi_koodi] = LEFT(omistaja,1)
			,[Omistajatyyppi] = SUBSTRING(omistaja,3,LEN(omistaja))

			,[euroa]
   
		FROM [sa].[sa_amos_kustannuskysely_seurantaryhmat] sa1
		UNPIVOT (
			[euroa] FOR [seurantaryhma]
			IN (' + @cols + ')
		) seur_ryhma
		LEFT JOIN sa.sa_amos_kustannuskysely_seurantaryhma_koodisto sa2 ON sa2.Koodi = seur_ryhma.seurantaryhma
		WHERE sa2.Summatieto = 0 AND euroa != 0

	) Q

	LEFT JOIN dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi = Q.jarjestaja_koodi
	LEFT JOIN dw.d_amos_kustannuskysely_seurantaryhma d2 on d2.koodi = Q.seurantaryhma
	LEFT JOIN dw.d_kytkin d3 on d3.kytkin_koodi = Q.oppisopimus
	LEFT JOIN dw.d_kytkin d4 on d4.kytkin_koodi = Q.vankilaopetus
	LEFT JOIN dw.d_ammatillisen_tutkinnon_kustannusryhma d5 on d5.koodi = Q.kustannusryhma_koodi
	LEFT JOIN (
		select 
			id
			,tutkintotyypin_ryhma_koodi 
		from (
			select 
				id
				,tutkintotyypin_ryhma_koodi
				,r_nro = row_number() over (partition by tutkintotyypin_ryhma_koodi order by id)
			from dw.d_koulutusluokitus
		) q where r_nro=1
	) d6 on d6.tutkintotyypin_ryhma_koodi = Q.tutkintotyyppi_koodi

	LEFT JOIN (
		select 
			id
			,koulutusalataso1_koodi 
		from (
			select 
				id
				,koulutusalataso1_koodi
				,r_nro = row_number() over (partition by koulutusalataso1_koodi order by id)
			from dw.d_koulutusluokitus
		) q where r_nro=1
	) d7 on d7.koulutusalataso1_koodi = Q.koulutusala1_koodi
'

EXEC (@query)

GO
