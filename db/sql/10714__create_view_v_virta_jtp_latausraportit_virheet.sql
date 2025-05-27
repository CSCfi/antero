USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_jtp_latausraportit_tilanne]    Script Date: 28.3.2025 7.46.19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER VIEW [dw].[v_virta_jtp_latausraportit_virheet] AS

SELECT 
	[julkaisunNimi] as 'Julkaisun nimi' ,
	[julkaisunOrgTunnus],
	[tila] as 'Julkaisun tila',
	[nimi] as 'Organisaatio',
	[kuvaus],
	[julkaisuVuosi] as 'Julkaisuvuosi',
	[ilmoitusVuosi] as 'Ilmoitusvuosi',
	COALESCE([julkaisutyyppikoodi],'Tieto puuttuu') as 'Julkaisutyyppi',
	lkm=1
FROM [ANTERO].[sa].[sa_virta_jtp_latausraportit_virheet]
WHERE koodi not in ('julk_ilm_-1','')
and (IlmoitusVuosi not in (2011, 2012, 2013, 2014, 2015, 2016) or (IlmoitusVuosi is null and julkaisuVuosi > 2016))

GO 

USE [ANTERO]