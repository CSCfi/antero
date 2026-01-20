USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_jtp_latausraportit_yhteisjulkaisut_ristiriitaiset]    Script Date: 18.8.2025 12.56.05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER   VIEW [dw].[v_virta_jtp_latausraportit_yhteisjulkaisut_ristiriitaiset] AS

SELECT
	[yhteisjulkaisunTunnus] as 'Yhteisjulkaisun tunnus',
	[organisaatioNimi] as 'Organisaatio',
	[organisaatioTunnus] as 'Liittyvä organisaatio',
	[julkaisuVuosi] as 'Julkaisuvuosi',
	[ilmoitusVuosi] as 'Ilmoitusvuosi',
	[julkaisunNimi] as 'Julkaisun nimi',
	[julkaisutyyppi] as 'Ristiriitainen tieto',
	[julkaisunOrgTunnus] as 'JulkaisunOrgTunnus',
	[liittyvaJulkaisunOrgTunnus] as 'Liittyvä julkaisunOrgTunnus',
	[kuvaus] as 'Kuvaus',
	[tila] as 'Julkaisun tila',
	lkm=1
FROM [ANTERO].[sa].[sa_virta_jtp_yhteisjulkaisut_ristiriitaiset]
WHERE IlmoitusVuosi > 2017 or julkaisuVuosi > 2017 or IlmoitusVuosi is null

GO


