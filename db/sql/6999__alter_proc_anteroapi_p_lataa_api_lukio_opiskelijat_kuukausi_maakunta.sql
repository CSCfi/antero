USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_lukio_opiskelijat_kuukausi_maakunta]    Script Date: 31.1.2023 12:01:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_api_lukio_opiskelijat_kuukausi_maakunta] AS

DECLARE @pvm date

BEGIN
EXEC [dw].[p_lataa_api_lukio_opiskelijat_kuukausi_maakunta_esilataus]
END

IF ((((	select count (*) from (
		select	tilastovuosi, kuukausi, s.oppilaitoksenMaakunta as oppilaitoksen_maakunta, sukupuoli, aidinkieli, ika, 
				kansalaisuus, s.uudetOpiskelijatLkm as uudet_opiskelijat_lkm, s.opiskelijatLkm as opiskelijat_lkm
		from [dw].[api_lukio_opiskelijat_kuukausi_maakunta] s
		except
		select	tilastovuosi, kuukausi, oppilaitoksen_maakunta, sukupuoli, aidinkieli, ika, kansalaisuus, uudet_opiskelijat_lkm,
				opiskelijat_lkm
		from [api].[lukio_opiskelijat_kuukausi_maakunta]) s ) > 0)
		or
		((select count(*) from [api].[lukio_opiskelijat_kuukausi_maakunta]) <> (select count(*) from [dw].[api_lukio_opiskelijat_kuukausi_maakunta])))
		and
		(select count(*) from [dw].[api_lukio_opiskelijat_kuukausi_maakunta]) > 0)

BEGIN

SET @pvm = dbo.api_update_time(getdate())

TRUNCATE TABLE [api].[lukio_opiskelijat_kuukausi_maakunta];

INSERT INTO [api].[lukio_opiskelijat_kuukausi_maakunta](
	defaultorder,
	tilastovuosi,
	kuukausi,
	oppilaitoksen_maakunta,
	sukupuoli,
	aidinkieli,
	ika,
	kansalaisuus,
	uudet_opiskelijat_lkm,
	opiskelijat_lkm,
	[tietojoukko_paivitetty_pvm]
)

SELECT
	   f.defaultorder
      ,f.tilastovuosi
      ,f.kuukausi
      ,f.oppilaitoksenMaakunta
      ,f.sukupuoli
      ,f.aidinkieli
      ,f.ika
      ,f.kansalaisuus
      ,f.uudetOpiskelijatLkm
      ,f.opiskelijatLkm
	  ,[tietojoukko_paivitetty_pvm] =	@pvm
FROM dw.api_lukio_opiskelijat_kuukausi_maakunta f

END

IF ((select count(*) from [dw].[api_lukio_opiskelijat_kuukausi_maakunta]) = 0)

BEGIN

RAISERROR('Source table has no rows.',11,1)

END


GO

USE [ANTERO]