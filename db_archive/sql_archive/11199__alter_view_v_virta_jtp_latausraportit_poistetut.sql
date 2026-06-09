USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_jtp_latausraportit_poistetut]    Script Date: 18.9.2025 12.01.20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER   VIEW [dw].[v_virta_jtp_latausraportit_poistetut] AS

SELECT 
	[julkaisunNimi] as 'Julkaisun nimi' 
	,[julkaisunOrgTunnus]
	,[tila] as 'Julkaisun tila'
	,[nimi] as 'Organisaatio'
	,[kuvaus]
	,[julkaisuVuosi] as 'Julkaisuvuosi'
	,[ilmoitusVuosi] as 'Ilmoitusvuosi'
	,COALESCE([julkaisutyyppikoodi], 'Tieto puuttuu') as 'Julkaisutyyppi'
	,lkm=1
FROM [ANTERO].[sa].[sa_virta_jtp_latausraportit_virheet]
WHERE koodi in ('julk_ilm_-1') and (IlmoitusVuosi is not null or (ilmoitusVuosi is null and julkaisuVuosi >= YEAR(GETDATE())-3))

GO


