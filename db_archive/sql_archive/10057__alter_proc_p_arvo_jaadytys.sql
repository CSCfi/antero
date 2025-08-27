USE [Arvo_SA]
GO
/****** Object:  StoredProcedure [dbo].[p_arvo_jaadytys]    Script Date: 27.8.2024 13.38.59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER   PROCEDURE [dbo].[p_arvo_jaadytys] AS

-- vastaajat
MERGE sa.sa_arvo_vastaajat_jaadytetty AS target
USING (
	SELECT DISTINCT
		va.[vastaajaid],
		va.[vastaajatunnusid],
		va.[vastaajatunnus],
		va.[oppilaitoskoodi],
		va.[vastaajatunnus_alkupvm],
		va.[vastaajatunnus_loppupvm],
		va.[kyselyid],
		va.[suorituskieli],
		va.[tutkintokoodi],
		va.[toimipaikka],
		va.[kuntakoodi],
		va.[koulutusmuoto],
		va.[kieli],
		va.[henkilonumero],
		va.[haun_numero],
		va.[hankintakoulutuksen_toteuttaja],
		'ETL: p_arvo_jaadytys' as source
	FROM [Arvo_SA].[sa].[sa_arvo_kohteet] k
	LEFT JOIN Arvo_SA.sa.sa_arvo_vastaajat va on va.vastaajatunnusid = k.vastaajatunnusid
	LEFT JOIN [Arvo_SA].[sa].[sa_arvo_kyselykerrat] kk on kk.kyselykertaid = k.kyselykertaid
	INNER JOIN [Arvo_SA].[sa].[sa_arvo_tiedonkeruut] t on kk.tiedonkeruu_tunniste = t.tunniste and DATEDIFF(month, getdate(), t.kasittelyajan_paattymispvm) < 2
	WHERE va.vastaajaid is not null
) AS src
ON target.vastaajaid = src.vastaajaid
WHEN MATCHED THEN
  UPDATE SET
    target.[vastaajaid] = src.vastaajaid,
	target.[vastaajatunnusid] = src.vastaajatunnusid,
	target.[vastaajatunnus] = src.vastaajatunnus,
	target.[oppilaitoskoodi] = src.oppilaitoskoodi,
	target.[vastaajatunnus_alkupvm] = src.vastaajatunnus_alkupvm,
	target.[vastaajatunnus_loppupvm] = src.vastaajatunnus_loppupvm,
	target.[kyselyid] = src.kyselyid,
	target.[suorituskieli] = src.suorituskieli,
	target.[tutkintokoodi] = src.tutkintokoodi,
	target.[toimipaikka] = src.toimipaikka,
	target.[kuntakoodi] = src.kuntakoodi,
	target.[koulutusmuoto] = src.koulutusmuoto,
	target.[kieli] = src.kieli,
	target.[henkilonumero] = src.henkilonumero,
	target.[haun_numero] = src.haun_numero,
	target.[hankintakoulutuksen_toteuttaja] = src.hankintakoulutuksen_toteuttaja,
	target.[source] = src.source,
	target.loadtime = getdate(),
	target.username = suser_name()
WHEN NOT MATCHED THEN
  INSERT (
    vastaajaid,
	vastaajatunnusid,
	vastaajatunnus,
	oppilaitoskoodi,
	vastaajatunnus_alkupvm,
	vastaajatunnus_loppupvm,
	kyselyid,
	suorituskieli,
	tutkintokoodi,
	toimipaikka,
	kuntakoodi,
	koulutusmuoto,
	kieli,
	henkilonumero,
	haun_numero,
	hankintakoulutuksen_toteuttaja,
	source
  )
  VALUES (
    src.[vastaajaid], src.[vastaajatunnusid], src.[vastaajatunnus], src.[oppilaitoskoodi], src.[vastaajatunnus_alkupvm],
	src.[vastaajatunnus_loppupvm], src.[kyselyid],src.[suorituskieli], src.[tutkintokoodi], src.[toimipaikka], src.[kuntakoodi],
	src.[koulutusmuoto], src.[kieli], src.[henkilonumero], src.[haun_numero], src.[hankintakoulutuksen_toteuttaja], src.[source]
  );

-- kohteet
MERGE sa.sa_arvo_kohteet_jaadytetty AS target
USING (
	SELECT DISTINCT
		k.[suorituskieli],
		k.[vastaajaid],
		k.[vastaajatunnus],
		k.[vastaajatunnus_alkupvm],
		k.[vastaajatunnus_loppupvm],
		k.[vastaajatunnusid],
		k.[kyselykertaid],
		k.[kyselyid],
		k.[kuntakoodi],
		k.[tutkintokoodi],
		k.[koulutusmuoto],
		k.[toimipaikka],
		k.[haun_numero],
		k.[hankintakoulutuksen_toteuttaja],
		k.[henkilonumero],
		k.[kieli],
		k.[oppilaitoskoodi],
		k.[taustatiedot.heratepvm],
		k.[taustatiedot.oppisopimuksen_perusta],
		k.[taustatiedot.sopimustyyppi],
		k.[taustatiedot.tutkinnon_osa],
		k.[taustatiedot.tutkinnon_taso],
		k.[taustatiedot.tutkintomuoto],
		k.[taustatiedot.tutkintonimike],
		k.[taustatiedot.tyonantaja],
		k.[taustatiedot.tyopaikka],
		k.[taustatiedot.tyopaikkajakson_alkupvm],
		k.[taustatiedot.tyopaikkajakson_kesto],
		k.[taustatiedot.tyopaikkajakson_loppupvm],
		k.[taustatiedot.osa_aikaisuus],
		'ETL: p_arvo_jaadytys' as source
	FROM [Arvo_SA].[sa].[sa_arvo_kohteet] k
	LEFT JOIN [Arvo_SA].[sa].[sa_arvo_kyselykerrat] kk on kk.kyselykertaid = k.kyselykertaid
	INNER JOIN [Arvo_SA].[sa].[sa_arvo_tiedonkeruut] t on kk.tiedonkeruu_tunniste = t.tunniste and DATEDIFF(month, getdate(), t.kasittelyajan_paattymispvm) < 2
	) AS src
ON target.vastaajatunnusid = src.vastaajatunnusid
WHEN MATCHED THEN
  UPDATE SET
    target.[suorituskieli] = src.suorituskieli,
	target.[vastaajaid] = src.vastaajaid,
	target.[vastaajatunnus] = src.vastaajatunnus,
	target.[vastaajatunnus_alkupvm] = src.vastaajatunnus_alkupvm,
	target.[vastaajatunnus_loppupvm] = src.vastaajatunnus_loppupvm,
	target.[vastaajatunnusid] = src.vastaajatunnusid,
	target.[kyselykertaid] = src.kyselykertaid,
	target.[kyselyid] = src.kyselyid,
	target.[kuntakoodi] = src.kuntakoodi,
	target.[tutkintokoodi] = src.tutkintokoodi,
	target.[koulutusmuoto] = src.koulutusmuoto,
	target.[toimipaikka] = src.toimipaikka,
	target.[haun_numero] = src.haun_numero,
	target.[hankintakoulutuksen_toteuttaja] = src.hankintakoulutuksen_toteuttaja,
	target.[henkilonumero] = src.henkilonumero,
	target.[kieli] = src.kieli,
	target.[oppilaitoskoodi] = src.oppilaitoskoodi,
	target.[taustatiedot.heratepvm] = src.[taustatiedot.heratepvm],
	target.[taustatiedot.oppisopimuksen_perusta] = src.[taustatiedot.oppisopimuksen_perusta],
	target.[taustatiedot.sopimustyyppi] = src.[taustatiedot.sopimustyyppi],
	target.[taustatiedot.tutkinnon_osa] = src.[taustatiedot.tutkinnon_osa],
	target.[taustatiedot.tutkinnon_taso] = src.[taustatiedot.tutkinnon_taso],
	target.[taustatiedot.tutkintomuoto] = src.[taustatiedot.tutkintomuoto],
	target.[taustatiedot.tutkintonimike] = src.[taustatiedot.tutkintonimike],
	target.[taustatiedot.tyonantaja] = src.[taustatiedot.tyonantaja],
	target.[taustatiedot.tyopaikka] = src.[taustatiedot.tyopaikka],
	target.[taustatiedot.tyopaikkajakson_alkupvm] = src.[taustatiedot.tyopaikkajakson_alkupvm],
	target.[taustatiedot.tyopaikkajakson_kesto] = src.[taustatiedot.tyopaikkajakson_kesto],
	target.[taustatiedot.tyopaikkajakson_loppupvm] = src.[taustatiedot.tyopaikkajakson_loppupvm],
	target.[taustatiedot.osa_aikaisuus] = src.[taustatiedot.osa_aikaisuus],
	target.[source] = src.source,
	target.loadtime = getdate(),
	target.username = suser_name()
WHEN NOT MATCHED THEN
  INSERT (
    suorituskieli,
	vastaajaid,
	vastaajatunnus,
	vastaajatunnus_alkupvm,
	vastaajatunnus_loppupvm,
	vastaajatunnusid,
	kyselykertaid,
	kyselyid,
	kuntakoodi,
	tutkintokoodi,
	koulutusmuoto,
	toimipaikka,
	haun_numero,
	hankintakoulutuksen_toteuttaja,
	henkilonumero,
	kieli,
	oppilaitoskoodi,
	[taustatiedot.heratepvm],
	[taustatiedot.oppisopimuksen_perusta],
	[taustatiedot.sopimustyyppi],
	[taustatiedot.tutkinnon_osa],
	[taustatiedot.tutkinnon_taso],
	[taustatiedot.tutkintomuoto],
	[taustatiedot.tutkintonimike],
	[taustatiedot.tyonantaja],
	[taustatiedot.tyopaikka],
	[taustatiedot.tyopaikkajakson_alkupvm],
	[taustatiedot.tyopaikkajakson_kesto],
	[taustatiedot.tyopaikkajakson_loppupvm],
	[taustatiedot.osa_aikaisuus],
	source
  )
  VALUES (
    src.suorituskieli, src.vastaajaid, src.vastaajatunnus, src.vastaajatunnus_alkupvm, src.vastaajatunnus_loppupvm, src.vastaajatunnusid,
	src.kyselykertaid, src.kyselyid, src.kuntakoodi, src.tutkintokoodi, src.koulutusmuoto, src.toimipaikka, src.haun_numero, src.hankintakoulutuksen_toteuttaja,
	src.henkilonumero, src.kieli, src.oppilaitoskoodi, src.[taustatiedot.heratepvm], src.[taustatiedot.oppisopimuksen_perusta],
	src.[taustatiedot.sopimustyyppi], src.[taustatiedot.tutkinnon_osa], src.[taustatiedot.tutkinnon_taso], src.[taustatiedot.tutkintomuoto],
	src.[taustatiedot.tutkintonimike], src.[taustatiedot.tyonantaja], src.[taustatiedot.tyopaikka], src.[taustatiedot.tyopaikkajakson_alkupvm],
	src.[taustatiedot.tyopaikkajakson_kesto], src.[taustatiedot.tyopaikkajakson_loppupvm], src.[taustatiedot.osa_aikaisuus], src.source
  );


-- kohteet_taustatiedot
MERGE sa.sa_arvo_kohteet_taustatiedot_jaadytetty AS target
USING (
	SELECT DISTINCT
		kt.[vastaajatunnusid],
		kt.[aidinkieli],
		kt.[arvosana],
		kt.[asteikko],
		kt.[asuinkunta_koodi],
		kt.[hankintakoulutuksen_toteuttaja],
		kt.[haun_numero],
		kt.[henkilonumero],
		kt.[heratepvm],
		kt.[ika_valmistuessa],
		kt.[kansalaisuus],
		kt.[kieli],
		kt.[kirjoilla_olo_kuukausia],
		kt.[koulutusalakoodi],
		kt.[koulutuskieli],
		kt.[koulutusmuoto],
		kt.[koulutustoimija],
		kt.[koulutustyyppi],
		kt.[kunta],
		kt.[laajuus],
		kt.[lasnaolo_lukukausia],
		kt.[opiskelupaikkakunta_koodi],
		kt.[oppilaitoskoodi],
		kt.[oppisopimuksen_perusta],
		kt.[osa_aikaisuus],
		kt.[osaamisala],
		kt.[paaaine],
		kt.[paikallinen_tutkinnon_osa],
		kt.[sopimustyyppi],
		kt.[sukupuoli],
		kt.[tiedonkeruu_alkupvm],
		kt.[tiedonkeruu_loppupvm],
		kt.[toimipaikka],
		kt.[toimipiste_oid],
		kt.[tutkinnon_osa],
		kt.[tutkinnon_taso],
		kt.[tutkinto],
		kt.[tutkintomuoto],
		kt.[tutkintonimike],
		kt.[tyonantaja],
		kt.[tyopaikka],
		kt.[tyopaikka_normalisoitu],
		kt.[tyopaikkajakson_alkupvm],
		kt.[tyopaikkajakson_kesto],
		kt.[tyopaikkajakson_loppupvm],
		kt.[valintavuosi],
		kt.[valmistumisajankohta],
		kt.[valmistumisvuosi],
		kt.[taustatiedot],
		'ETL: p_arvo_jaadytys' as source,
		kt.[rahoituslahde],
		--kt.[tarkenne]
		kt.[koulutussektori],
		kt.[osaamisen_hankkimistapa]

	FROM [Arvo_SA].[sa].[sa_arvo_kohteet] k
	LEFT JOIN [Arvo_SA].[sa].[sa_arvo_kohteet_taustatiedot] kt on kt.vastaajatunnusid = k.vastaajatunnusid
	LEFT JOIN [Arvo_SA].[sa].[sa_arvo_kyselykerrat] kk on kk.kyselykertaid = k.kyselykertaid
	INNER JOIN [Arvo_SA].[sa].[sa_arvo_tiedonkeruut] t on kk.tiedonkeruu_tunniste = t.tunniste and DATEDIFF(month, getdate(), t.kasittelyajan_paattymispvm) < 2
) AS src
ON target.vastaajatunnusid = src.vastaajatunnusid
WHEN MATCHED THEN
  UPDATE SET
    target.[vastaajatunnusid] = src.vastaajatunnusid,
	target.[aidinkieli] = src.aidinkieli,
	target.[arvosana] = src.arvosana,
	target.[asteikko] = src.asteikko,
	target.[asuinkunta_koodi] = src.asuinkunta_koodi,
	target.[hankintakoulutuksen_toteuttaja] = src.hankintakoulutuksen_toteuttaja,
	target.[haun_numero] = src.haun_numero,
	target.[henkilonumero] = src.henkilonumero,
	target.[heratepvm] = src.heratepvm,
	target.[ika_valmistuessa] = src.ika_valmistuessa,
	target.[kansalaisuus] = src.kansalaisuus,
	target.[kieli] = src.kieli,
	target.[kirjoilla_olo_kuukausia] = src.kirjoilla_olo_kuukausia,
	target.[koulutusalakoodi] = src.koulutusalakoodi,
	target.[koulutuskieli] = src.koulutuskieli,
	target.[koulutusmuoto] = src.koulutusmuoto,
	target.[koulutustoimija] = src.koulutustoimija,
	target.[koulutustyyppi] = src.koulutustyyppi,
	target.[kunta] = src.kunta,
	target.[laajuus] = src.laajuus,
	target.[lasnaolo_lukukausia] = src.lasnaolo_lukukausia,
	target.[opiskelupaikkakunta_koodi] = src.opiskelupaikkakunta_koodi,
	target.[oppilaitoskoodi] = src.oppilaitoskoodi,
	target.[oppisopimuksen_perusta] = src.oppisopimuksen_perusta,
	target.[osa_aikaisuus] = src.osa_aikaisuus,
	target.[osaamisala] = src.osaamisala,
	target.[paaaine] = src.paaaine,
	target.[paikallinen_tutkinnon_osa] = src.paikallinen_tutkinnon_osa,
	target.[sopimustyyppi] = src.sopimustyyppi,
	target.[source] = src.source,
	target.loadtime = getdate(),
	target.username = suser_name(),
	target.[rahoituslahde] =src.rahoituslahde,
	--target.[tarkenne] =src.tarkenne

	target.[koulutussektori] =  src.rahoituslahde,
	target.[osaamisen_hankkimistapa] = src.rahoituslahde

WHEN NOT MATCHED THEN
  INSERT (
    vastaajatunnusid,
	aidinkieli,
	arvosana,
	asteikko,
	asuinkunta_koodi,
	hankintakoulutuksen_toteuttaja,
	haun_numero,
	henkilonumero,
	heratepvm,
	ika_valmistuessa,
	kansalaisuus,
	kieli,
	kirjoilla_olo_kuukausia,
	koulutusalakoodi,
	koulutuskieli,
	koulutusmuoto,
	koulutustoimija,
	koulutustyyppi,
	kunta,
	laajuus,
	lasnaolo_lukukausia,
	opiskelupaikkakunta_koodi,
	oppilaitoskoodi,
	oppisopimuksen_perusta,
	osa_aikaisuus,
	osaamisala,
	paaaine,
	paikallinen_tutkinnon_osa,
	sopimustyyppi,
	source,
	rahoituslahde,
	--tarkenne
    koulutussektori,
	osaamisen_hankkimistapa
  )
  VALUES (
   src.vastaajatunnusid, src.aidinkieli, src.arvosana, src.asteikko, src.asuinkunta_koodi, src.hankintakoulutuksen_toteuttaja, src.haun_numero,
	src.henkilonumero, src.heratepvm, src.ika_valmistuessa, src.kansalaisuus, src.kieli, src.kirjoilla_olo_kuukausia, src.koulutusalakoodi, src.koulutuskieli,
	src.koulutusmuoto, src.koulutustoimija, src.koulutustyyppi, src.kunta, src.laajuus, src.lasnaolo_lukukausia, src.opiskelupaikkakunta_koodi,
	src.oppilaitoskoodi, src.oppisopimuksen_perusta, src.osa_aikaisuus, src.osaamisala, src.paaaine, src.paikallinen_tutkinnon_osa, src.sopimustyyppi,
	src.source, src.rahoituslahde,	--, src.tarkenne
	src.koulutussektori, src.osaamisen_hankkimistapa
  );

-- virta_taustatiedot
MERGE sa.sa_virta_taustatiedot_jaadytetty AS target
USING (
	SELECT DISTINCT
		va.[vastaajaid],
		va.[vastaajatunnusid],
		va.[taustatiedot],
		va.[valmistumisajankohta],
		va.[valintavuosi],
		va.[valmistumisvuosi],
		va.[tutkintomuoto],
		va.[tutkinnon_taso],
		va.[sukupuoli],
		va.[paaaine],
		va.[laajuus],
		va.[lasnaolo_lukukausia],
		va.[koulutusalakoodi],
		va.[kirjoilla_olo_kuukausia],
		va.[kansalaisuus],
		va.[ika_valmistuessa],
		va.[asuinkuntakoodi],
		va.[asteikko],
		va.[arvosana],
		va.[aidinkieli],
		'ETL: p_arvo_jaadytys' as source,
		va.[koulutustoimija]
	FROM Arvo_SA.sa.sa_arvo_kohteet k
	LEFT JOIN Arvo_SA.sa.sa_virta_taustatiedot va on va.vastaajatunnusid = k.vastaajatunnusid
	LEFT JOIN [Arvo_SA].[sa].[sa_arvo_kyselykerrat] kk on kk.kyselykertaid = k.kyselykertaid
	INNER JOIN [Arvo_SA].[sa].[sa_arvo_tiedonkeruut] t on kk.tiedonkeruu_tunniste = t.tunniste and DATEDIFF(month, getdate(), t.kasittelyajan_paattymispvm) < 2
	WHERE va.vastaajatunnusid is not null
) AS src
ON target.vastaajatunnusid = src.vastaajatunnusid
WHEN MATCHED THEN
  UPDATE SET
    target.[vastaajaid] = src.vastaajaid,
	target.[vastaajatunnusid] = src.vastaajatunnusid,
	target.[taustatiedot] = src.taustatiedot,
	target.[valmistumisajankohta] = src.valmistumisajankohta,
	target.[valintavuosi] = src.valintavuosi,
	target.[valmistumisvuosi] = src.valmistumisvuosi,
	target.[tutkintomuoto] = src.tutkintomuoto,
	target.[tutkinnon_taso] = src.tutkinnon_taso,
	target.[sukupuoli] = src.sukupuoli,
	target.[paaaine] = src.paaaine,
	target.[laajuus] = src.laajuus,
	target.[lasnaolo_lukukausia] = src.lasnaolo_lukukausia,
	target.[koulutusalakoodi] = src.koulutusalakoodi,
	target.[kirjoilla_olo_kuukausia] = src.kirjoilla_olo_kuukausia,
	target.[kansalaisuus] = src.kansalaisuus,
	target.[ika_valmistuessa] = src.ika_valmistuessa,
	target.[asuinkuntakoodi] = src.asuinkuntakoodi,
	target.[asteikko] = src.asteikko,
	target.[arvosana] = src.arvosana,
	target.[aidinkieli] = src.aidinkieli,
	target.[source] = src.source,
	target.loadtime = getdate(),
	target.username = suser_name(),
	target.[koulutustoimija] = src.koulutustoimija
WHEN NOT MATCHED THEN
  INSERT (
    vastaajaid,
	vastaajatunnusid,
	taustatiedot,
	valmistumisajankohta,
	valintavuosi,
	valmistumisvuosi,
	tutkintomuoto,
	tutkinnon_taso,
	sukupuoli,
	paaaine,
	laajuus,
	lasnaolo_lukukausia,
	koulutusalakoodi,
	kirjoilla_olo_kuukausia,
	kansalaisuus,
	ika_valmistuessa,
	asuinkuntakoodi,
	asteikko,
	arvosana,
	aidinkieli,
	source,
	koulutustoimija
  )
  VALUES (
   src.vastaajaid, src.vastaajatunnusid, src.taustatiedot, src.valmistumisajankohta, src.valintavuosi, src.valmistumisvuosi,
	src.tutkintomuoto, src.tutkinnon_taso, src.sukupuoli, src.paaaine, src.laajuus, src.lasnaolo_lukukausia,
	src.koulutusalakoodi, src.kirjoilla_olo_kuukausia, src.kansalaisuus, src.ika_valmistuessa, src.asuinkuntakoodi,
	src.asteikko, src.arvosana, src.aidinkieli, src.source, src.koulutustoimija
  );

-- vastaukset
MERGE sa.sa_arvo_vastaukset_jaadytetty AS target
USING (
	SELECT DISTINCT
		v.[vastausid],
		v.[monivalintavaihtoehto_fi],
		v.[monivalintavaihtoehto_sv],
		v.[monivalintavaihtoehto_en],
		v.[vastaajaid],
		v.[kysymysid],
		v.[kyselykertaid],
		v.[koulutustoimija],
		v.[numerovalinta],
		v.[kyselyid],
		v.[vastaajatunnusid],
		v.vapaateksti,
		'ETL: p_arvo_jaadytys' as source,
		v.vaihtoehto,
		v.vastausaika,
		v.kysymysversio
	FROM [Arvo_SA].[sa].[sa_arvo_vastaukset_amis] v
	LEFT JOIN [Arvo_SA].[sa].[sa_arvo_kyselykerrat] kk on kk.kyselykertaid = v.kyselykertaid
	INNER JOIN [Arvo_SA].[sa].[sa_arvo_tiedonkeruut] t on kk.tiedonkeruu_tunniste = t.tunniste and DATEDIFF(month, getdate(), t.kasittelyajan_paattymispvm) < 2
	UNION ALL
	SELECT DISTINCT
		v.[vastausid],
		v.[monivalintavaihtoehto_fi],
		v.[monivalintavaihtoehto_sv],
		v.[monivalintavaihtoehto_en],
		v.[vastaajaid],
		v.[kysymysid],
		v.[kyselykertaid],
		v.[koulutustoimija],
		v.[numerovalinta],
		v.[kyselyid],
		v.[vastaajatunnusid],
		v.vapaateksti,
		'ETL: p_arvo_jaadytys' as source,
		v.vaihtoehto,
		v.vastausaika,
		v.kysymysversio
	FROM [Arvo_SA].[sa].[sa_arvo_vastaukset_amk_uraseuranta] v
	LEFT JOIN [Arvo_SA].[sa].[sa_arvo_kyselykerrat] kk on kk.kyselykertaid = v.kyselykertaid
	INNER JOIN [Arvo_SA].[sa].[sa_arvo_tiedonkeruut] t on kk.tiedonkeruu_tunniste = t.tunniste and DATEDIFF(month, getdate(), t.kasittelyajan_paattymispvm) < 2
	UNION ALL
	SELECT DISTINCT
		v.[vastausid],
		v.[monivalintavaihtoehto_fi],
		v.[monivalintavaihtoehto_sv],
		v.[monivalintavaihtoehto_en],
		v.[vastaajaid],
		v.[kysymysid],
		v.[kyselykertaid],
		v.[koulutustoimija],
		v.[numerovalinta],
		v.[kyselyid],
		v.[vastaajatunnusid],
		v.vapaateksti,
		'ETL: p_arvo_jaadytys' as source,
		v.vaihtoehto,
		v.vastausaika,
		v.kysymysversio
	FROM [Arvo_SA].[sa].[sa_arvo_vastaukset_avop] v
	LEFT JOIN [Arvo_SA].[sa].[sa_arvo_kyselykerrat] kk on kk.kyselykertaid = v.kyselykertaid
	INNER JOIN [Arvo_SA].[sa].[sa_arvo_tiedonkeruut] t on kk.tiedonkeruu_tunniste = t.tunniste and DATEDIFF(month, getdate(), t.kasittelyajan_paattymispvm) < 2
	UNION ALL
	SELECT DISTINCT
		v.[vastausid],
		v.[monivalintavaihtoehto_fi],
		v.[monivalintavaihtoehto_sv],
		v.[monivalintavaihtoehto_en],
		v.[vastaajaid],
		v.[kysymysid],
		v.[kyselykertaid],
		v.[koulutustoimija],
		v.[numerovalinta],
		v.[kyselyid],
		v.[vastaajatunnusid],
		v.vapaateksti,
		'ETL: p_arvo_jaadytys' as source,
		v.vaihtoehto,
		v.vastausaika,
		v.kysymysversio
	FROM [Arvo_SA].[sa].[sa_arvo_vastaukset_kandi] v
	LEFT JOIN [Arvo_SA].[sa].[sa_arvo_kyselykerrat] kk on kk.kyselykertaid = v.kyselykertaid
	INNER JOIN [Arvo_SA].[sa].[sa_arvo_tiedonkeruut] t on kk.tiedonkeruu_tunniste = t.tunniste and DATEDIFF(month, getdate(), t.kasittelyajan_paattymispvm) < 2
	UNION ALL
	SELECT DISTINCT
		v.[vastausid],
		v.[monivalintavaihtoehto_fi],
		v.[monivalintavaihtoehto_sv],
		v.[monivalintavaihtoehto_en],
		v.[vastaajaid],
		v.[kysymysid],
		v.[kyselykertaid],
		v.[koulutustoimija],
		v.[numerovalinta],
		v.[kyselyid],
		v.[vastaajatunnusid],
		v.vapaateksti,
		'ETL: p_arvo_jaadytys' as source,
		v.vaihtoehto,
		v.vastausaika,
		v.kysymysversio
	FROM [Arvo_SA].[sa].[sa_arvo_vastaukset_muut] v
	LEFT JOIN [Arvo_SA].[sa].[sa_arvo_kyselykerrat] kk on kk.kyselykertaid = v.kyselykertaid
	INNER JOIN [Arvo_SA].[sa].[sa_arvo_tiedonkeruut] t on kk.tiedonkeruu_tunniste = t.tunniste and DATEDIFF(month, getdate(), t.kasittelyajan_paattymispvm) < 2
	UNION ALL
	SELECT DISTINCT
		v.[vastausid],
		v.[monivalintavaihtoehto_fi],
		v.[monivalintavaihtoehto_sv],
		v.[monivalintavaihtoehto_en],
		v.[vastaajaid],
		v.[kysymysid],
		v.[kyselykertaid],
		v.[koulutustoimija],
		v.[numerovalinta],
		v.[kyselyid],
		v.[vastaajatunnusid],
		v.vapaateksti,
		'ETL: p_arvo_jaadytys' as source,
		v.vaihtoehto,
		v.vastausaika,
		v.kysymysversio
	FROM [Arvo_SA].[sa].[sa_arvo_vastaukset_tep] v
	LEFT JOIN [Arvo_SA].[sa].[sa_arvo_kyselykerrat] kk on kk.kyselykertaid = v.kyselykertaid
	INNER JOIN [Arvo_SA].[sa].[sa_arvo_tiedonkeruut] t on kk.tiedonkeruu_tunniste = t.tunniste and DATEDIFF(month, getdate(), t.kasittelyajan_paattymispvm) < 2
) AS src
ON target.vastausid = src.vastausid and target.vastaajaid = src.vastaajaid
WHEN MATCHED THEN
  UPDATE SET
    target.[vastausid] = src.vastausid,
	target.[monivalintavaihtoehto_fi] = src.monivalintavaihtoehto_fi,
	target.[monivalintavaihtoehto_sv] = src.monivalintavaihtoehto_sv,
	target.[monivalintavaihtoehto_en] = src.monivalintavaihtoehto_en,
	target.[vastaajaid] = src.vastaajaid,
	target.[kysymysid] = src.kysymysid,
	target.[kyselykertaid] = src.kyselykertaid,
	target.[koulutustoimija] = src.koulutustoimija,
	target.[numerovalinta] = src.numerovalinta,
	target.[kyselyid] = src.kyselyid,
	target.[vastaajatunnusid] = src.vastaajatunnusid,
	target.[vapaateksti] = src.vapaateksti,
	target.[source] = src.source,
	target.[vaihtoehto] =src.vaihtoehto,
	target.[vastausaika] =src.vastausaika,
	target.[kysymysversio] =src.kysymysversio,
	target.loadtime = getdate(),
	target.username = suser_name()
WHEN NOT MATCHED THEN
  INSERT (
    vastausid,
	monivalintavaihtoehto_fi,
	monivalintavaihtoehto_sv,
	monivalintavaihtoehto_en,
	vastaajaid,
	kysymysid,
	kyselykertaid,
	koulutustoimija,
	numerovalinta,
	kyselyid,
	vastaajatunnusid,
	vapaateksti,
	source,
	vaihtoehto,
	vastausaika,
	kysymysversio
  )
  VALUES (
   src.vastausid, src.monivalintavaihtoehto_fi, src.monivalintavaihtoehto_sv, src.monivalintavaihtoehto_en, src.vastaajaid,
	src.kysymysid, src.kyselykertaid, src.koulutustoimija, src.numerovalinta, src.kyselyid, src.vastaajatunnusid, src.vapaateksti,
	src.source, src.vaihtoehto, src.vastausaika, src.kysymysversio
  );
