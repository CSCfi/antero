USE [Koski_SA]
GO

DROP PROCEDURE IF EXISTS [sa].[paivita_sa_henkilo_suomi_ensin]
GO
DROP PROCEDURE IF EXISTS [sa].[paivita_sa_koski_henkilo]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [sa].[paivita_sa_koski_henkilo] AS

/*
Laajalle levinnyt päättely left(kansalaisuus, 3) peittänyt osan suomalaisista, joilla kaksoiskansalaisuus. 
Myös lukion ja perusopetuksen ainevalintojen jäädytystaulut ajellaan tänään uusiksi vastaavalla logiikalla. 
JS 23.2.2022
*/

update sa.sa_koski_henkilo
set kansalaisuus = concat('246,', replace(kansalaisuus, ',246', ''))
where kansalaisuus like '%,246%'

GO
