USE [Koski_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [sa].[paivita_sa_koski_henkilo] AS

update sa.sa_koski_henkilo
set kansalaisuus = concat('246,', replace(kansalaisuus, ',246', ''))
where kansalaisuus like '%,246%'
;

update sa.sa_koski_henkilo
set syntymaaika = '1900-01-01'
where syntymaaika < '1900-01-01'
;

GO
