USE [Arvo_SA]
GO

/****** Object:  StoredProcedure [sa].[p_paivita_kyselypohjan_tarkenne]    Script Date: 31.7.2024 13:25:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE [sa].[p_paivita_sopimustyyppi] AS

--tt
update sa.sa_arvo_kohteet_taustatiedot
set sopimustyyppi = 'oppisopimus'
where sopimustyyppi is null
and taustatiedot like '%''osaamisen_hankkimistapa'': ''oppisopimus''%' 

update sa.sa_arvo_kohteet_taustatiedot
set sopimustyyppi = 'koulutussopimus'
where sopimustyyppi is null
and taustatiedot like '%''osaamisen_hankkimistapa'': ''koulutussopimus''%' 

--ko
update ko
set [taustatiedot.sopimustyyppi] = tt.sopimustyyppi
from sa.sa_arvo_kohteet ko
join sa.sa_arvo_kohteet_taustatiedot tt on tt.vastaajatunnusid = ko.vastaajatunnusid
where ko.[taustatiedot.sopimustyyppi] is null
and tt.sopimustyyppi is not null

GO
