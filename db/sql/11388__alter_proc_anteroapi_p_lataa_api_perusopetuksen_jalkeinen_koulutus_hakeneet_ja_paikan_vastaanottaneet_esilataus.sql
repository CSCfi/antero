USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_perusopetuksen_jalkeinen_koulutus_hakeneet_ja_paikan_vastaanottaneet]    Script Date: 17.11.2025 12.58.49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE OR ALTER  PROCEDURE [dw].[p_lataa_api_perusopetuksen_jalkeinen_koulutus_hakeneet_ja_paikan_vastaanottaneet] AS

DECLARE @api_pvm date

BEGIN

	BEGIN
		EXEC [dw].[p_lataa_api_perusopetuksen_jalkeinen_koulutus_hakeneet_ja_paikan_vastaanottaneet_esilataus]
	END

	IF EXISTS (select 1 from dw.api_perusopetuksen_jalkeinen_koulutus_hakeneet_ja_paikan_vastaanottaneet)
	
	BEGIN
	
		SET @api_pvm = dbo.api_update_time(getdate())
  
		TRUNCATE TABLE [api].[perusopetuksen_jalkeinen_koulutus_hakeneet_ja_paikan_vastaanottaneet]

		INSERT [api].[perusopetuksen_jalkeinen_koulutus_hakeneet_ja_paikan_vastaanottaneet] (
			[defaultorder]
			,[koulutuksen_alkamisvuosi]
			,[koulutuksen_alkamiskausi]
			,[haku]
			,[hakukohde]
			,[hakutapa]
			,[koulutusaste_taso_1]
			,[koulutusaste_taso_2]
			,[koulutusala_taso_1]
			,[koulutusala_taso_2]
			,[koulutusala_taso_3]
			,[tutkinto_hakukohde]
			,[koulutuksen_kieli]
			,[maakunta_hakukohde]
			,[kunta_hakukohde]
			,[koulutuksen_jarjestaja]
			,[oppilaitos]
			,[toimipiste]
			,[koodit_tutkinto_hakukohde]
			,[koodit_kunta_hakukohde]
			,[koodit_koulutuksen_jarjestaja]
			,[koodit_oppilaitos]
			,[koodit_hakukohde]
			,[aloituspaikat_lkm]
			,[kaikki_hakijat_lkm]
			,[ensisijaiset_hakijat_lkm]
			,[valitut_lkm]
			,[paikan_vastaanottaneet_lkm]
			,[aloittaneet_lkm]
			,[tietojoukko_paivitetty_pvm]
		)
		SELECT 
			 defaultorder = ROW_NUMBER() 
				OVER(ORDER BY [koulutuksen_alkamisvuosi], [koulutuksen_alkamiskausi] desc, koulutuksen_jarjestaja, oppilaitos, toimipiste)
			,[koulutuksen_alkamisvuosi]
			,[koulutuksen_alkamiskausi]
			,[haku]
			,[hakukohde]
			,[hakutapa]
			,[koulutusaste_taso_1]
			,[koulutusaste_taso_2]
			,[koulutusala_taso_1]
			,[koulutusala_taso_2]
			,[koulutusala_taso_3]
			,[tutkinto_hakukohde]
			,[koulutuksen_kieli]
			,[maakunta_hakukohde]
			,[kunta_hakukohde]
			,[koulutuksen_jarjestaja]
			,[oppilaitos]
			,[toimipiste]
			,[koodit_tutkinto_hakukohde]
			,[koodit_kunta_hakukohde]
			,[koodit_koulutuksen_jarjestaja]
			,[koodit_oppilaitos]
			,[koodit_hakukohde]
			,[aloituspaikat_lkm]
			,[kaikki_hakijat_lkm]
			,[ensisijaiset_hakijat_lkm]
			,[valitut_lkm]
			,[paikan_vastaanottaneet_lkm]
			,[aloittaneet_lkm]
			,[tietojoukko_paivitetty_pvm] = @api_pvm
		FROM [dw].[api_perusopetuksen_jalkeinen_koulutus_hakeneet_ja_paikan_vastaanottaneet]

	END

	IF NOT EXISTS (select 1 from [dw].[api_perusopetuksen_jalkeinen_koulutus_hakeneet_ja_paikan_vastaanottaneet])
	BEGIN
		RAISERROR('Source table has no rows.',11,1)
	END
END

GO

