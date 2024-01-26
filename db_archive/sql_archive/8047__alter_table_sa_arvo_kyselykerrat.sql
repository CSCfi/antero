USE [Arvo_SA]
GO
ALTER TABLE sa.sa_arvo_kyselykerrat ADD kysely_voimassa_alkupvm VARCHAR(30);
GO
ALTER TABLE sa.sa_arvo_kyselykerrat ADD kysely_voimassa_loppupvm VARCHAR(30);
GO
ALTER TABLE sa.sa_arvo_kyselykerrat ADD tiedonkeruu_tunniste VARCHAR(200);
GO
USE ANTERO
