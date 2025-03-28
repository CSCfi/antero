USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_jtp_latausraportit_tilanne]    Script Date: 28.3.2025 7.46.19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER VIEW [dw].[v_virta_jtp_latausraportit_duplikaatit] AS

SELECT
	[organisaationimi] as 'Organisaatio',
	[kuvaus] as 'Kuvaus',
	[julkaisunorgtunnus] as 'JulkaisunOrgTunnus',
	[duplikaattijulkaisunorgtunnus] as 'DuplikaattijulkaisunOrgTunnus',
	[duplikaattijulkaisunnimi] as 'Duplikaattijulkaisun nimi',
	[julkaisunnimi] as 'Julkaisun nimi',
	[julkaisuvuosi] as 'Julkaisuvuosi',
	[ilmoitusvuosi] as 'Ilmoitusvuosi',
	[tila] as 'Julkaisun tila',
	[julkaisutyyppikoodi] as 'Julkaisutyyppi',
	lkm=1
FROM [ANTERO].[sa].[sa_virta_jtp_latausraportit_duplikaatit]

GO 

USE [ANTERO]