USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_opiskelijapalaute_vastaajamäärä_vahvistettu]    Script Date: 9.11.2020 7:46:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









ALTER procedure [dw].[p_lataa_f_amos_opiskelijapalaute_vastaajamäärä_vahvistettu] AS


truncate table ANTERO.dw.f_amos_opiskelijapalaute_vastaajamäärä_vahvistettu
insert into ANTERO.dw.f_amos_opiskelijapalaute_vastaajamäärä_vahvistettu (
	[Rahoituskausi]
,	[Koulutuksen järjestäjän Y-tunnus]
,	[Koulutuksen järjestäjän nimi]
,	[Kyselyn kohteena olleet  (Aloitusvaiheenkysely)]
,	[Vastanneet (Aloitusvaiheenkysely)]
,	[Kyselyn kohteena olleet  (Tutkinnon suorittaneiden päättövaiheen kysely)]
,	[Vastanneet (Tutkinnon suorittaneiden päättövaiheen kysely)]
,	[Kyselyn kohteena olleet  (Tutkinnon osan suorittaneiden päättövaiheen kysely)]
,	[Vastanneet (Tutkinnon osan suorittaneiden päättövaiheen kysely)]
,	[Source]
,	[Loadtime]
,	[Username]
 
)
	   SELECT
	[Rahoituskausi]		 = [sa].[Tilastokausi]
,	[Koulutuksen järjestäjän Y-tunnus]		 = sa.[Koulutuksen järjestäjän Y-tunnus]
,	[Koulutuksen järjestäjän nimi]		 = sa.[Koulutuksen järjestäjän nimi]
,	[Kyselyn kohteena olleet  (Aloitusvaiheenkysely)]		 =[sa].[Kyselyn kohteena olleet_A]
,	[Vastanneet (Aloitusvaiheenkysely)]		 = [sa].[Vastanneet_A]
,	[Kyselyn kohteena olleet  (Tutkinnon suorittaneiden päättövaiheen kysely)]		 = [sa].[Kyselyn kohteena olleet_P_T]
,	[Vastanneet (Tutkinnon suorittaneiden päättövaiheen kysely)]		 = [sa].[Vastanneet_P_T]
,	[Kyselyn kohteena olleet  (Tutkinnon osan suorittaneiden päättövaiheen kysely)]		 = [sa].[Kyselyn kohteena olleet_P_O]
,	[Vastanneet (Tutkinnon osan suorittaneiden päättövaiheen kysely)]		 = [sa].[Vastanneet_P_O]
,	[Source]		 =[sa].[Source]
,	[Loadtime]		 =[sa].[Loadtime]
,	[Username]		 =[sa].[Username]

FROM [ANTERO].[sa].sa_amos_opiskelijapalaute_vastaajamäärä_vahvistettu sa










GO
USE ANTERO


