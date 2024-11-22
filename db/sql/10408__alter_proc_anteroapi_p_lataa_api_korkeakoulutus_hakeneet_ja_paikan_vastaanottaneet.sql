USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_korkeakoulutus_hakeneet_ja_paikan_vastaanottaneet]    Script Date: 22.11.2024 10:23:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER  PROCEDURE [dw].[p_lataa_api_korkeakoulutus_hakeneet_ja_paikan_vastaanottaneet] AS

DECLARE @api_pvm date
DECLARE @pvm date
SET @pvm = GETDATE()

-- Vuosikellotarkistus

UPDATE ANTERO.[sa].[sa_haku_ja_valinta_vuosikello_korkea_aste_unpvt] 
set haku_oid = (select haku_oid from ANTERO.[dw].[d_haku] d where d.haun_nimi_fi = haku)
where haku_oid is null and haku NOT IN ('Erillishaku','Jatkotutkintohaku')

EXEC ANTERO.sa.p_lataa_sa_haku_ja_valinta_vuosikello_korkea_aste

IF EXISTS (
	SELECT 1 
	FROM ANTERO.[sa].[sa_haku_ja_valinta_vuosikello_korkea_aste]
	WHERE @pvm IN (aloituspaikat,hakijat,valitut,vastaanottaneet,aloittaneet)
)

-- Varsinainen lataus

BEGIN

	BEGIN
		EXEC [dw].[p_lataa_api_korkeakoulutus_hakeneet_ja_paikan_vastaanottaneet_esilataus]
	END

	IF EXISTS (select 1 from dw.api_korkeakoulutus_hakeneet_ja_paikan_vastaanottaneet)
	
	BEGIN
	
		SET @api_pvm = dbo.api_update_time(getdate())
  
		TRUNCATE TABLE [api].[korkeakoulutus_hakeneet_ja_paikan_vastaanottaneet]

		INSERT [api].[korkeakoulutus_hakeneet_ja_paikan_vastaanottaneet] (
			 [defaultorder]
			,[koulutuksen_alkamisvuosi]
			,[koulutuksen_alkamiskausi]
			,[hakukohde]
			,[hakutapa]
			,[hakutyyppi]
			,[valintatapajonon_tyyppi]
			,[koulutusaste_taso_1]
			,[koulutusaste_taso_2]
			,[koulutusala_taso_1]
			,[koulutusala_taso_2]
			,[koulutusala_taso_3]
			,[okm_ohjauksen_ala]
			,[koulutusala_2002]
			,[opintoala_2002]
			,[paaasiallinen_tutkinto_hakukohde]
			,[koulutuksen_kieli]
			,[maakunta_hakukohde]
			,[kunta_hakukohde]
			,[sektori]
			,[tutkinnon_aloitussykli]
			,[korkeakoulu]
			,[toimipiste]
			,[koodit_paaasiallinen_tutkinto_hakukohde]
			,[koodit_korkeakoulu]
			,[koodit_kunta_hakukohde]
			,[koodit_hakukohde]
			,[aloituspaikat_lkm]
			,[kaikki_hakijat_lkm]
			,[ensisijaiset_hakijat_lkm]
			,[valitut_lkm]
			,[paikan_vastaanottaneet_lkm]
			,[aloittaneet_lkm]
			,[alin_hyvaksytty_pistemaara]
			,[ylin_hyvaksytty_pistemaara]
			,[tietojoukko_paivitetty_pvm]
		)
		SELECT 
			 defaultorder = ROW_NUMBER() 
				OVER(ORDER BY [koulutuksen_alkamisvuosi], [koulutuksen_alkamiskausi] desc, korkeakoulu)
			,[koulutuksen_alkamisvuosi]
			,[koulutuksen_alkamiskausi]
			,[hakukohde]
			,[hakutapa]
			,[hakutyyppi]
			,[valintatapajonon_tyyppi]
			,[koulutusaste_taso_1]
			,[koulutusaste_taso_2]
			,[koulutusala_taso_1]
			,[koulutusala_taso_2]
			,[koulutusala_taso_3]
			,[okm_ohjauksen_ala]
			,[koulutusala_2002]
			,[opintoala_2002]
			,[paaasiallinen_tutkinto_hakukohde]
			,[koulutuksen_kieli]
			,[maakunta_hakukohde]
			,[kunta_hakukohde]
			,[sektori]
			,[tutkinnon_aloitussykli]
			,[korkeakoulu]
			,[toimipiste]
			,[koodit_paaasiallinen_tutkinto_hakukohde]
			,[koodit_korkeakoulu]
			,[koodit_kunta_hakukohde]
			,[koodit_hakukohde]
			,[aloituspaikat_lkm]
			,[kaikki_hakijat_lkm]
			,[ensisijaiset_hakijat_lkm]
			,[valitut_lkm]
			,[paikan_vastaanottaneet_lkm]
			,[aloittaneet_lkm]
			,[alin_hyvaksytty_pistemaara]
			,[ylin_hyvaksytty_pistemaara]
			,[tietojoukko_paivitetty_pvm] = @api_pvm
		FROM [dw].[api_korkeakoulutus_hakeneet_ja_paikan_vastaanottaneet]

	END

	IF NOT EXISTS (select 1 from [dw].[api_korkeakoulutus_hakeneet_ja_paikan_vastaanottaneet])
	BEGIN
		RAISERROR('Source table has no rows.',11,1)
	END
END

GO


