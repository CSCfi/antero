USE [Arvo_SA]
GO
/****** Object:  StoredProcedure [dbo].[p_arvo_puuttuvat_jaadytetyista]    Script Date: 27.8.2024 13.33.05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[p_arvo_puuttuvat_jaadytetyista]
AS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tämä proseduuri tarkistaa latausten jälkeen, jos Arvon datasta ladatuista tiedoista puuttuu rajapinnasta poistettuja tietoja
-- Palautus kuhunkin tauluun käynnistetään, jos puuttuvia vastaajatunnusid arvoja on ja ne on jäädytetty onnistuneesti PDI:n aiemmassa ETL-vaiheessa
-- Tästä proseduurista puuttuu jäädytetyt vastaukset, koska siinä pitää huomioida vastausten ohjaaminen kyselykerran perusteella oikeisiin kohdetauluihin
-- 8.2.2024 VHä
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DECLARE @puuttuvat INT = 0

SET @puuttuvat = (SELECT count(*) FROM Arvo_SA.sa.sa_arvo_kohteet_jaadytetty
WHERE vastaajatunnusid NOT IN (SELECT vastaajatunnusid FROM Arvo_SA.sa.sa_arvo_kohteet));

IF @puuttuvat > 0
	BEGIN
		MERGE INTO Arvo_SA.sa.sa_arvo_kohteet AS target
			USING Arvo_SA.sa.sa_arvo_kohteet_jaadytetty AS source
			ON target.[vastaajatunnusid] = source.[vastaajatunnusid]
			WHEN NOT MATCHED BY target THEN
				INSERT
					([suorituskieli]
					,[vastaajaid]
					,[vastaajatunnus]
					,[vastaajatunnus_alkupvm]
					,[vastaajatunnus_loppupvm]
					,[vastaajatunnusid]
					,[kyselykertaid]
					,[kyselyid]
					,[kuntakoodi]
					,[tutkintokoodi]
					,[koulutusmuoto]
					,[toimipaikka]
					,[haun_numero]
					,[hankintakoulutuksen_toteuttaja]
					,[henkilonumero]
					,[kieli]
					,[oppilaitoskoodi]
					,[taustatiedot.heratepvm]
					,[taustatiedot.oppisopimuksen_perusta]
					,[taustatiedot.sopimustyyppi]
					,[taustatiedot.tutkinnon_osa]
					,[taustatiedot.tutkinnon_taso]
					,[taustatiedot.tutkintomuoto]
					,[taustatiedot.tutkintonimike]
					,[taustatiedot.tyonantaja]
					,[taustatiedot.tyopaikka]
					,[taustatiedot.tyopaikkajakson_alkupvm]
					,[taustatiedot.tyopaikkajakson_kesto]
					,[taustatiedot.tyopaikkajakson_loppupvm]
					,[taustatiedot.osa_aikaisuus]
					,[loadtime]
					,[username]
					,[source])
				VALUES
					([suorituskieli]
					,[vastaajaid]
					,[vastaajatunnus]
					,[vastaajatunnus_alkupvm]
					,[vastaajatunnus_loppupvm]
					,[vastaajatunnusid]
					,[kyselykertaid]
					,[kyselyid]
					,[kuntakoodi]
					,[tutkintokoodi]
					,[koulutusmuoto]
					,[toimipaikka]
					,[haun_numero]
					,[hankintakoulutuksen_toteuttaja]
					,[henkilonumero]
					,[kieli]
					,[oppilaitoskoodi]
					,[taustatiedot.heratepvm]
					,[taustatiedot.oppisopimuksen_perusta]
					,[taustatiedot.sopimustyyppi]
					,[taustatiedot.tutkinnon_osa]
					,[taustatiedot.tutkinnon_taso]
					,[taustatiedot.tutkintomuoto]
					,[taustatiedot.tutkintonimike]
					,[taustatiedot.tyonantaja]
					,[taustatiedot.tyopaikka]
					,[taustatiedot.tyopaikkajakson_alkupvm]
					,[taustatiedot.tyopaikkajakson_kesto]
					,[taustatiedot.tyopaikkajakson_loppupvm]
					,[taustatiedot.osa_aikaisuus]
					,[loadtime]
					,[username]
					,[source]);
	END;
-- Varmistetaan että muuttuja on aina 0 ennen kuin aloitetaan seuraavaa vaihetta
ELSE
	BEGIN
		SET @puuttuvat = 0;
	END;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SET @puuttuvat = (SELECT count(*) FROM Arvo_SA.sa.sa_arvo_kohteet_taustatiedot_jaadytetty
					WHERE vastaajatunnusid NOT IN (SELECT vastaajatunnusid FROM Arvo_SA.sa.sa_arvo_kohteet_taustatiedot));

IF @puuttuvat > 0
	BEGIN
		MERGE INTO Arvo_SA.sa.sa_arvo_kohteet_taustatiedot AS target
			USING Arvo_SA.sa.sa_arvo_kohteet_taustatiedot_jaadytetty AS source
			ON target.[vastaajatunnusid] = source.[vastaajatunnusid]
			WHEN NOT MATCHED BY target THEN
				INSERT
					([vastaajatunnusid]
					,[aidinkieli]
					,[arvosana]
					,[asteikko]
					,[asuinkunta_koodi]
					,[hankintakoulutuksen_toteuttaja]
					,[haun_numero]
					,[henkilonumero]
					,[heratepvm]
					,[ika_valmistuessa]
					,[kansalaisuus]
					,[kieli]
					,[kirjoilla_olo_kuukausia]
					,[koulutusalakoodi]
					,[koulutuskieli]
					,[koulutusmuoto]
					,[koulutustoimija]
					,[koulutustyyppi]
					,[kunta]
					,[laajuus]
					,[lasnaolo_lukukausia]
					,[opiskelupaikkakunta_koodi]
					,[oppilaitoskoodi]
					,[oppisopimuksen_perusta]
					,[osa_aikaisuus]
					,[osaamisala]
					,[paaaine]
					,[paikallinen_tutkinnon_osa]
					,[sopimustyyppi]
					,[sukupuoli]
					,[tiedonkeruu_alkupvm]
					,[tiedonkeruu_loppupvm]
					,[toimipaikka]
					,[toimipiste_oid]
					,[tutkinnon_osa]
					,[tutkinnon_taso]
					,[tutkinto]
					,[tutkintomuoto]
					,[tutkintonimike]
					,[tyonantaja]
					,[tyopaikka]
					,[tyopaikka_normalisoitu]
					,[tyopaikkajakson_alkupvm]
					,[tyopaikkajakson_kesto]
					,[tyopaikkajakson_loppupvm]
					,[valintavuosi]
					,[valmistumisajankohta]
					,[valmistumisvuosi]
					,[taustatiedot]
					,[loadtime]
					,[username]
					,[source]
					,[rahoituslahde]
					,[koulutussektori]
			  	    ,[osaamisen_hankkimistapa])
				VALUES
					 ([vastaajatunnusid]
					,[aidinkieli]
					,[arvosana]
					,[asteikko]
					,[asuinkunta_koodi]
					,[hankintakoulutuksen_toteuttaja]
					,[haun_numero]
					,[henkilonumero]
					,[heratepvm]
					,[ika_valmistuessa]
					,[kansalaisuus]
					,[kieli]
					,[kirjoilla_olo_kuukausia]
					,[koulutusalakoodi]
					,[koulutuskieli]
					,[koulutusmuoto]
					,[koulutustoimija]
					,[koulutustyyppi]
					,[kunta]
					,[laajuus]
					,[lasnaolo_lukukausia]
					,[opiskelupaikkakunta_koodi]
					,[oppilaitoskoodi]
					,[oppisopimuksen_perusta]
					,[osa_aikaisuus]
					,[osaamisala]
					,[paaaine]
					,[paikallinen_tutkinnon_osa]
					,[sopimustyyppi]
					,[sukupuoli]
					,[tiedonkeruu_alkupvm]
					,[tiedonkeruu_loppupvm]
					,[toimipaikka]
					,[toimipiste_oid]
					,[tutkinnon_osa]
					,[tutkinnon_taso]
					,[tutkinto]
					,[tutkintomuoto]
					,[tutkintonimike]
					,[tyonantaja]
					,[tyopaikka]
					,[tyopaikka_normalisoitu]
					,[tyopaikkajakson_alkupvm]
					,[tyopaikkajakson_kesto]
					,[tyopaikkajakson_loppupvm]
					,[valintavuosi]
					,[valmistumisajankohta]
					,[valmistumisvuosi]
					,[taustatiedot]
					,[loadtime]
					,[username]
					,[source]
					,[rahoituslahde]
				    ,[koulutussektori]
				    ,[osaamisen_hankkimistapa]);
	END;
ELSE
	BEGIN
		SET @puuttuvat = 0;
	END;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SET @puuttuvat = (SELECT count(*) FROM Arvo_SA.sa.sa_arvo_vastaajat_jaadytetty
WHERE vastaajatunnusid NOT IN (SELECT vastaajatunnusid FROM Arvo_SA.sa.sa_arvo_vastaajat));
IF @puuttuvat > 0
	BEGIN
		MERGE INTO Arvo_SA.sa.sa_arvo_vastaajat AS target
			USING Arvo_SA.sa.sa_arvo_vastaajat_jaadytetty AS source
			ON target.[vastaajatunnusid] = source.[vastaajatunnusid]
			WHEN NOT MATCHED BY target THEN
				INSERT
					([vastaajaid]
					,[vastaajatunnusid]
					,[vastaajatunnus]
					,[oppilaitoskoodi]
					,[vastaajatunnus_alkupvm]
					,[vastaajatunnus_loppupvm]
					,[suorituskieli]
					,[source]
					,[username]
					,[loadtime]
					,[tutkintokoodi]
					,[toimipaikka]
					,[kuntakoodi]
					,[koulutusmuoto]
					,[kieli]
					,[henkilonumero]
					,[haun_numero]
					,[hankintakoulutuksen_toteuttaja])
				VALUES
					([vastaajaid]
					,[vastaajatunnusid]
					,[vastaajatunnus]
					,[oppilaitoskoodi]
					,[vastaajatunnus_alkupvm]
					,[vastaajatunnus_loppupvm]
					,[suorituskieli]
					,[source]
					,[username]
					,[loadtime]
					,[tutkintokoodi]
					,[toimipaikka]
					,[kuntakoodi]
					,[koulutusmuoto]
					,[kieli]
					,[henkilonumero]
					,[haun_numero]
					,[hankintakoulutuksen_toteuttaja]);
	END;
ELSE
	BEGIN
		SET @puuttuvat = 0;
	END;
