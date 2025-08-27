USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_perusopetus_oppilaat_lukuvuosi_oppilaitos]    Script Date: 18.11.2024 11:48:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dw].[p_lataa_api_perusopetus_oppilaat_lukuvuosi_oppilaitos] AS

DECLARE @pvm date

BEGIN
	EXEC [dw].[p_lataa_api_perusopetus_oppilaat_lukuvuosi_oppilaitos_esilataus]
END

IF EXISTS (select 1 from dw.api_perusopetus_oppilaat_lukuvuosi_oppilaitos)
AND (
  EXISTS (
	select	[lukuvuosi],[koodit_opetuksen_jarjestaja],[koodit_opetuksen_jarjestajan_maakunta], 
			[oppilaat_syyslukukausi_lkm], [oppilaat_syyslukukausi_lkm], [oppilaat_lukuvuosi_lkm]
	from dw.api_perusopetus_oppilaat_lukuvuosi_oppilaitos 
	except 
	select	[lukuvuosi],[koodit_opetuksen_jarjestaja],[koodit_opetuksen_jarjestajan_maakunta], 
			[oppilaat_syyslukukausi_lkm], [oppilaat_syyslukukausi_lkm], [oppilaat_lukuvuosi_lkm]
	from api.perusopetus_oppilaat_lukuvuosi_oppilaitos
  )
  OR EXISTS (
	select	[lukuvuosi],[koodit_opetuksen_jarjestaja],[koodit_opetuksen_jarjestajan_maakunta], 
			[oppilaat_syyslukukausi_lkm], [oppilaat_syyslukukausi_lkm], [oppilaat_lukuvuosi_lkm]
	from api.perusopetus_oppilaat_lukuvuosi_oppilaitos
	except 
	select	[lukuvuosi],[koodit_opetuksen_jarjestaja],[koodit_opetuksen_jarjestajan_maakunta], 
			[oppilaat_syyslukukausi_lkm], [oppilaat_syyslukukausi_lkm], [oppilaat_lukuvuosi_lkm]
	from dw.api_perusopetus_oppilaat_lukuvuosi_oppilaitos
  )
)
BEGIN
	
	SET @pvm = dbo.api_update_time(getdate())
  
	TRUNCATE TABLE [api].[perusopetus_oppilaat_lukuvuosi_oppilaitos]

	INSERT [api].[perusopetus_oppilaat_lukuvuosi_oppilaitos] (
		[defaultorder],
		[lukuvuosi],
		[opetuksen_jarjestajan_maakunta],
		[opetuksen_jarjestaja],
		[oppilaitos],
		[koodit_opetuksen_jarjestajan_maakunta],
		[koodit_opetuksen_jarjestaja],
		[koodit_oppilaitos],
		[oppilaat_lukuvuosi_lkm],
		[oppilaat_syyslukukausi_lkm],
		[oppilaat_kevatlukukausi_lkm],
		[tietojoukko_paivitetty_pvm]
	)
	SELECT 
		[defaultorder],
		[lukuvuosi],
		[opetuksen_jarjestajan_maakunta],
		[opetuksen_jarjestaja],
		[oppilaitos],
		[koodit_opetuksen_jarjestajan_maakunta],
		[koodit_opetuksen_jarjestaja],
		[koodit_oppilaitos],
		[oppilaat_lukuvuosi_lkm],
		[oppilaat_syyslukukausi_lkm],
		[oppilaat_kevatlukukausi_lkm],
		[tietojoukko_paivitetty_pvm] = @pvm
	FROM [dw].[api_perusopetus_oppilaat_lukuvuosi_oppilaitos]

END

IF NOT EXISTS (select 1 from [dw].[api_perusopetus_oppilaat_lukuvuosi_oppilaitos])
BEGIN
	RAISERROR('Source table has no rows.',11,1)
END

GO


