USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_esi_ja_perusopetus_oppilaat_lukuvuosi_koulutusmuoto]    Script Date: 29.4.2024 10:52:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [dw].[p_lataa_api_esi_ja_perusopetus_oppilaat_lukuvuosi_koulutusmuoto] AS

DECLARE @pvm date

BEGIN
	EXEC [dw].[p_lataa_api_esi_ja_perusopetus_oppilaat_lukuvuosi_koulutusmuoto_esilataus]
END

IF EXISTS (select 1 from dw.api_esi_ja_perusopetus_oppilaat_lukuvuosi_koulutusmuoto)
AND (
  EXISTS (
	select [lukuvuosi],[koulutusmuoto],[opetuksen_jarjestaja],[oppilaat_lkm],[koodit_opetuksen_jarjestaja] 
	from dw.api_esi_ja_perusopetus_oppilaat_lukuvuosi_koulutusmuoto 
	except 
	select [lukuvuosi],[koulutusmuoto],[opetuksen_jarjestaja],[oppilaat_lkm],[koodit_opetuksen_jarjestaja] 
	from api.esi_ja_perusopetus_oppilaat_lukuvuosi_koulutusmuoto
  )
  OR EXISTS (
	select [lukuvuosi],[koulutusmuoto],[opetuksen_jarjestaja],[oppilaat_lkm],[koodit_opetuksen_jarjestaja] 
	from api.esi_ja_perusopetus_oppilaat_lukuvuosi_koulutusmuoto
	except 
	select [lukuvuosi],[koulutusmuoto],[opetuksen_jarjestaja],[oppilaat_lkm],[koodit_opetuksen_jarjestaja]
	from dw.api_esi_ja_perusopetus_oppilaat_lukuvuosi_koulutusmuoto
  )
)
BEGIN
	
	SET @pvm = dbo.api_update_time(getdate())
  
	TRUNCATE TABLE [api].[esi_ja_perusopetus_oppilaat_lukuvuosi_koulutusmuoto]

	INSERT [api].[esi_ja_perusopetus_oppilaat_lukuvuosi_koulutusmuoto] (
		[defaultorder],
		[lukuvuosi],
		[koulutusmuoto],
		[opetuksen_jarjestaja],
		[oppilaat_lkm],
		[koodit_opetuksen_jarjestaja],
		[tietojoukko_paivitetty_pvm]
	)
	SELECT 
		[defaultorder],
		[lukuvuosi],
		[koulutusmuoto],
		[opetuksen_jarjestaja],
		[oppilaat_lkm],
		[koodit_opetuksen_jarjestaja],
		[tietojoukko_paivitetty_pvm] = @pvm
	FROM [dw].[api_esi_ja_perusopetus_oppilaat_lukuvuosi_koulutusmuoto]

END

IF NOT EXISTS (select 1 from [dw].[api_esi_ja_perusopetus_oppilaat_lukuvuosi_koulutusmuoto])
BEGIN
	RAISERROR('Source table has no rows.',11,1)
END

GO

USE [ANTERO]