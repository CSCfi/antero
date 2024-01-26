USE [Arvo_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [sa].[p_paivita_kyselypohjan_tarkenne] AS

update kk
set kk.kyselypohja_tarkenne = tk.tarkenne
from arvo_sa.sa.sa_arvo_kyselykerrat kk
join arvo_sa.sa.sa_arvo_tiedonkeruut tk on kk.tiedonkeruu_tunniste = tk.tunniste
where kk.kyselypohja_tarkenne is null

GO
