USE [ANTERO]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_sa_hakeneet_toinen_aste_koonti]    Script Date: 13.11.2019 20:37:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--TÄMÄ PROSEDUURI KUTSUU PROSEDUURIA p_lataa_sa_hakeneet_toisen_asteen_hakijat

ALTER PROCEDURE [sa].[p_lataa_sa_hakeneet_toinen_aste_koonti] AS

DECLARE @vuosi int
DECLARE @haku1_oid varchar(100)
DECLARE @haku2_oid varchar(100)
DECLARE @haku3_oid varchar(100)
DECLARE @haku4_oid varchar(100)
DECLARE @haku5_oid varchar(100)
DECLARE @haku6_oid varchar(100)

--hakujen tiedot väliaikaiseen tauluun
SELECT distinct 
	f.koulutuksen_alkamisvuosi
	,d.hakuryhma_koodi
	,d.hakutyyppi_koodi
	,d.haku_oid

INTO #taulu

FROM [ANTERO].[dw].[d_haku] d
JOIN ANTERO.dw.f_haku_ja_valinta_hakeneet_toinen_aste f on f.d_haku_id = d.id
JOIN ANTERO.dw.d_kausi d2 on d2.id = f.d_kausi_koulutuksen_alkamiskausi_id

WHERE d.hakutapa_koodi = '01' 
AND f.koulutuksen_alkamisvuosi >= 2015
AND d2.koodi = 'S'


--cursorin määritys
DECLARE vuosi_cursor CURSOR FAST_FORWARD FOR (SELECT distinct koulutuksen_alkamisvuosi FROM #taulu)

--vuosien luuppaus
OPEN vuosi_cursor;

FETCH NEXT FROM vuosi_cursor
INTO @vuosi


WHILE @@FETCH_STATUS = 0
BEGIN
	 
	--Haut seuraavassa järjestyksessä
	--haku1 amm/lukio
	--haku2 amm/lukio lisä
	--haku3 erkka
	--haku4 erkka lisä
	--haku5 valma
	--haku6 valma lisä

	SET @haku1_oid = (SELECT haku_oid FROM #taulu WHERE koulutuksen_alkamisvuosi = @vuosi AND hakuryhma_koodi = '1' AND hakutyyppi_koodi = '01')
	SET @haku2_oid = (SELECT haku_oid FROM #taulu WHERE koulutuksen_alkamisvuosi = @vuosi AND hakuryhma_koodi = '1' AND hakutyyppi_koodi = '03')
	SET @haku3_oid = (SELECT haku_oid FROM #taulu WHERE koulutuksen_alkamisvuosi = @vuosi AND hakuryhma_koodi = '3' AND hakutyyppi_koodi = '01')
	SET @haku4_oid = (SELECT haku_oid FROM #taulu WHERE koulutuksen_alkamisvuosi = @vuosi AND hakuryhma_koodi = '3' AND hakutyyppi_koodi = '03')
	SET @haku5_oid = (SELECT haku_oid FROM #taulu WHERE koulutuksen_alkamisvuosi = @vuosi AND hakuryhma_koodi = '2' AND hakutyyppi_koodi = '01')
	SET @haku6_oid = (SELECT haku_oid FROM #taulu WHERE koulutuksen_alkamisvuosi = @vuosi AND hakuryhma_koodi = '2' AND hakutyyppi_koodi = '03')

	EXEC [sa].[p_lataa_sa_hakeneet_toisen_asteen_hakijat] 
	@vuosi, @haku1_oid, @haku2_oid, @haku3_oid, @haku4_oid, @haku5_oid, @haku6_oid;

    FETCH NEXT FROM vuosi_cursor 
    INTO @vuosi

END 
CLOSE vuosi_cursor;
DEALLOCATE vuosi_cursor;

DROP TABLE #taulu;


