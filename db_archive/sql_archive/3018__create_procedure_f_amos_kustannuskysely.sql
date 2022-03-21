USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_kustannuskysely_jarjestajakohtainen]    Script Date: 26.4.2020 13:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_amos_kustannuskysely_jarjestajakohtainen]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_amos_kustannuskysely_jarjestajakohtainen] AS' 
END
GO



ALTER PROCEDURE [dw].[p_lataa_f_amos_kustannuskysely_jarjestajakohtainen] AS

--DROP TABLE dw.f_amos_kustannuskysely_jarjestajakohtainen

TRUNCATE TABLE dw.f_amos_kustannuskysely_jarjestajakohtainen

INSERT INTO dw.f_amos_kustannuskysely_jarjestajakohtainen

SELECT
	 vuosi
	,d_organisaatioluokitus_id = coalesce(d2.id,-1)
	,d_amos_tili_id = coalesce(d1.id,-1)
	,omistajatyyppi_nimi
	,maara_euroa

--INTO dw.f_amos_kustannuskysely_jarjestajakohtainen

FROM (

	SELECT DISTINCT
	
		 [vuosi]
		,[ytunnus]
		,[omistajatyyppi_koodi] = LEFT(omistaja,1)
		,[omistajatyyppi_nimi] = SUBSTRING(omistaja,3,LEN(omistaja))
		,[tilitunnus]
		,[maara_euroa]
   
	FROM [ANTERO].[sa].[sa_amos_kustannukset_jarjestajakohtainen_2018] sa
	UNPIVOT (
		[maara_euroa] FOR [tilitunnus]
		IN (
			 [k21m1]
			,[k22m1]
			,[k312m1]
			,[k313m1]
			,[k319m1]
			,[k32m1]
			,[k70m1]
			,[k00m1]
			,[k21m2]
			,[k22m2]
			,[k312m2]
			,[k313m2]
			,[k319m2]
			,[k32m2]
			,[k35m2]
			,[k70m2]
			,[k00m2]
			,[k21x1]
			,[k22x1]
			,[k312x1]
			,[k313x1]
			,[k319x1]
			,[k32x1]
			,[k70x1]
			,[k00x1]
			,[k141m2]
			,[e11m0]
			,[e12m0]
			,[e20m0]
			,[e70m0]
			,[e71m0]
			,[e80m0]
			,[e00m0]
			,[e12x2]
			,[e20x2]
			,[e70x2]
			,[e71x2]
			,[e80x2]
			,[e00x2]
			,[e11r0]
			,[e12r0]
			,[e20r0]
			,[e70r0]
			,[e71r0]
			,[e80r0]
			,[e00r0]
			,[f1tl0]
			,[f2tl0]
			,[f3tl0]
			,[f4tl0]
			,[f5tl0]
			,[f6tl0]
			,[f7tl0]
			,[f1ev]
			,[f2ev]
			,[f3ev]
			,[f4ev]
			,[f5ev]
			,[f6ev]
			,[f7ev]
			,[k00m31]
			,[k00m32]
			,[k00m3]
			,[e00m31]
			,[e00m32]
			,[e00m3]
			,[e411m2]
			,[e412m2]
			,[e491m2]
			,[e492m2]
			,[e40m2]
			,[e411r0]
			,[e412r0]
			,[e491r0]
			,[e492r0]
			,[e40r0]
			,[b111te0]
			,[b112te0]
			,[b113te0]
			,[b110te0]
			,[b121te0]
			,[b122te0]
			,[b123te0]
			,[b124te0]
			,[b125te0]
			,[b120te0]
			,[b10te0]
			,[b211te0]
			,[b212te0]
			,[b213te0]
			,[b214te0]
			,[b215te0]
			,[b216te0]
			,[b210te0]
			,[b2211te0]
			,[b2212te0]
			,[b2213te0]
			,[b2210te0]
			,[b2221te0]
			,[b2222te0]
			,[b2223te0]
			,[b2220te0]
			,[b220te0]
			,[b20te0]
			,[b111ev]
			,[b112ev]
			,[b113ev]
			,[b110ev]
			,[b121ev]
			,[b122ev]
			,[b123ev]
			,[b124ev]
			,[b125ev]
			,[b120ev]
			,[b10ev]
			,[b211ev]
			,[b212ev]
			,[b213ev]
			,[b214ev]
			,[b215ev]
			,[b216ev]
			,[b210ev]
			,[b2211ev]
			,[b2212ev]
			,[b2213ev]
			,[b2210ev]
			,[b2221ev]
			,[b2222ev]
			,[b2223ev]
			,[b2220ev]
			,[b220ev]
			,[b20ev])
	) tilinpaatos

) Q

LEFT JOIN dw.d_amos_tili d1 ON d1.koodi = Q.tilitunnus
LEFT JOIN dw.d_organisaatioluokitus d2 on d2.organisaatio_koodi = Q.ytunnus

WHERE d1.Summatieto = 0








GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_kustannuskysely_seurantaryhmat]    Script Date: 26.4.2020 13:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_amos_kustannuskysely_seurantaryhmat]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_amos_kustannuskysely_seurantaryhmat] AS' 
END
GO


ALTER PROCEDURE [dw].[p_lataa_f_amos_kustannuskysely_seurantaryhmat] AS

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
	--,[ov_op_avain] = CONCAT(Q.Tilastovuosi, Q.jarjestaja_koodi, Q.tutkintotyyppi_koodi, COALESCE(kl1.koulutusalataso1_koodi,'-1'), Q.kustannusryhma_koodi, Q.oppisopimus, Q.vankilaopetus)

--INTO dw.f_amos_kustannuskysely_seurantaryhmat

FROM (

	SELECT distinct
		 [vuosi]
		,[jarjestaja_koodi] = [ytunnus]
		,[Koulutuksen järjestäjä] = SUBSTRING(ytunnus_nimi,11,LEN(ytunnus_nimi))
		--,[Seurantaryhmä koodi] = [seuranta]
		,[seurantaryhma]
		,[tutk_johtava] = CASE LEFT(cast(seuranta as varchar(5)),1) WHEN 1 THEN 1 ELSE 0 END
		,[oppisopimus] = CASE WHEN seurantaryhma like '%12%' THEN 1 ELSE 0 END
		,[vankilaopetus] = CASE WHEN seurantaryhma like '%15%' THEN 1 ELSE 0 END
		,[koulutusala1_koodi] = SUBSTRING(cast(seuranta as varchar(5)),2,2)
		--,[kustannusryhma_koodi] = SUBSTRING(cast(seuranta as varchar),4,1)
		,[kustannusryhma_koodi] = 
			CASE
				WHEN seuranta_nimi like '%valma%' or seuranta_nimi like '%telma%' THEN 'vt'
				WHEN seuranta_nimi like '%opiskeluvalmiuksia tukevat opinnot%' THEN 'ot'
				WHEN seuranta_nimi like '%muu ammatillinen koulutus%' THEN 'muu'
				ELSE SUBSTRING(cast(seuranta as varchar(5)),4,1)
			END
		,[tutkintotyyppi_koodi] = 
			CASE 
				WHEN [ttyyppi]=1 THEN '02' 
				WHEN [ttyyppi]=2 THEN '08' 
				WHEN seuranta_nimi like '%valma%' or seuranta_nimi like '%telma%' THEN '09'
				WHEN seuranta_nimi like '%muu ammatillinen koulutus%' THEN '-1'
				ELSE '09'
			END
		,[omistajatyyppi_koodi] = LEFT(omistaja,1)
		,[Omistajatyyppi] = SUBSTRING(omistaja,3,LEN(omistaja))
		--,[seurantaryhma_koodi] = sa2.koodi

		,[euroa]
   
	FROM [ANTERO].[sa].[sa_amos_kustannukset_seurantaryhmat_2018] sa1
	UNPIVOT (
		[euroa] FOR [seurantaryhma]
		IN ([K11M1]
		  ,[K12M1]
		  ,[K15M1]
		  ,[K00M1]
		  ,[K11M2]
		  ,[K12M2]
		  ,[K15M2]
		  ,[K00M2]
		  ,[K11X1]
		  ,[K12X1]
		  ,[K15X1]
		  ,[K00X1]
		  ,[T11R5]
		  ,[T12R5]
		  ,[T15R5]
		  ,[T00R5]
		  ,[T11R6]
		  ,[T12R6]
		  ,[T15R6]
		  ,[T00R6]
		  ,[T11R8]
		  ,[T12R8]
		  ,[T15R8]
		  ,[T00R8])
	) seur_ryhma
	LEFT JOIN sa.sa_amos_kustannukset_seurantaryhma_koodisto sa2 ON sa2.Koodi = seur_ryhma.seurantaryhma
	
	WHERE sa2.Summatieto = 0

) Q

LEFT JOIN dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi = Q.jarjestaja_koodi
LEFT JOIN dw.d_amos_seurantaryhma d2 on d2.koodi = Q.seurantaryhma
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


