USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_opiskelijapalaute_vastaajamäärä_vahvistettu]    Script Date: 28.10.2021 11:31:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_amos_opiskelijapalaute_vastaajamäärä_vahvistettu] AS


TRUNCATE TABLE ANTERO.dw.f_amos_opiskelijapalaute_vastaajamäärä_vahvistettu

INSERT INTO ANTERO.dw.f_amos_opiskelijapalaute_vastaajamäärä_vahvistettu (
	[Rahoituskausi]
	,[Koulutuksen järjestäjän Y-tunnus]
	,[Koulutuksen järjestäjän nimi]
	,[Kyselyn kohteena olleet  (Aloitusvaiheenkysely)]
	,[Vastanneet (Aloitusvaiheenkysely)]
	,[Kyselyn kohteena olleet  (Tutkinnon suorittaneiden päättövaiheen kysely)]
	,[Vastanneet (Tutkinnon suorittaneiden päättövaiheen kysely)]
	,[Kyselyn kohteena olleet  (Tutkinnon osan suorittaneiden päättövaiheen kysely)]
	,[Vastanneet (Tutkinnon osan suorittaneiden päättövaiheen kysely)]
	,[Source]
)

SELECT
	[Rahoituskausi]	= [sa].[Tilastokausi]
	,[Koulutuksen järjestäjän Y-tunnus] = sa.[Koulutuksen järjestäjän Y-tunnus]
	,[Koulutuksen järjestäjän nimi]	= sa.[Koulutuksen järjestäjän nimi]
	,[Kyselyn kohteena olleet  (Aloitusvaiheenkysely)] = [sa].[Kyselyn kohteena olleet_A]
	,[Vastanneet (Aloitusvaiheenkysely)] = [sa].[Vastanneet_A]
	,[Kyselyn kohteena olleet  (Tutkinnon suorittaneiden päättövaiheen kysely)] = [sa].[Kyselyn kohteena olleet_P_T]
	,[Vastanneet (Tutkinnon suorittaneiden päättövaiheen kysely)] = [sa].[Vastanneet_P_T]
	,[Kyselyn kohteena olleet  (Tutkinnon osan suorittaneiden päättövaiheen kysely)] = [sa].[Kyselyn kohteena olleet_P_O]
	,[Vastanneet (Tutkinnon osan suorittaneiden päättövaiheen kysely)] = [sa].[Vastanneet_P_O]
	,[Source] = 'p_lataa_f_amos_opiskelijapalaute_vastaajamäärä_vahvistettu'
FROM [ANTERO].[sa].sa_amos_opiskelijapalaute_vastaajamäärä_vahvistettu sa

UNION

SELECT
	[Rahoituskausi]	= [sa].[Tilastokausi]
	,[Koulutuksen järjestäjän Y-tunnus] = sa.[Koulutuksen järjestäjän Y-tunnus]
	,[Koulutuksen järjestäjän nimi]	= sa.[Koulutuksen järjestäjän nimi]
	,[Kyselyn kohteena olleet  (Aloitusvaiheenkysely)] = [sa].[Kyselyn kohteena olleet_A]
	,[Vastanneet (Aloitusvaiheenkysely)] = [sa].[Vastanneet_A]
	,[Kyselyn kohteena olleet  (Tutkinnon suorittaneiden päättövaiheen kysely)] = [sa].[Kyselyn kohteena olleet_P_T]
	,[Vastanneet (Tutkinnon suorittaneiden päättövaiheen kysely)] = [sa].[Vastanneet_P_T]
	,[Kyselyn kohteena olleet  (Tutkinnon osan suorittaneiden päättövaiheen kysely)] = [sa].[Kyselyn kohteena olleet_P_O]
	,[Vastanneet (Tutkinnon osan suorittaneiden päättövaiheen kysely)] = [sa].[Vastanneet_P_O]
	,[Source] = 'p_lataa_f_amos_opiskelijapalaute_vastaajamäärä_vahvistettu'
FROM [ANTERO].[sa].sa_amos_opiskelijapalaute_vastaajamäärä_vahvistettu_2020_2021 sa








