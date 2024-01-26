USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_koulutusluokitus]    Script Date: 31.1.2023 11:58:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_api_koulutusluokitus] AS

DECLARE @pvm date

BEGIN
  EXEC [dw].[p_lataa_api_koulutusluokitus_esilataus]
END

IF ((((	select count (*) from (
		select	[koulutusluokitus_avain],[koulutusluokitus_koodi],[koulutusluokitus_fi],[koulutusluokitus_sv],[koulutusluokitus_en],[koulutusastetaso1_koodi],
				[koulutusastetaso1_fi],[koulutusastetaso1_sv],[koulutusastetaso1_en],[koulutusastetaso2_koodi],[koulutusastetaso2_fi],[koulutusastetaso2_sv],
				[koulutusastetaso2_en],[koulutusalataso1_koodi],[koulutusalataso1_fi],[koulutusalataso1_sv],[koulutusalataso1_en],[koulutusalataso2_koodi],
				[koulutusalataso2_fi],[koulutusalataso2_sv],[koulutusalataso2_en],[koulutusalataso3_koodi],[koulutusalataso3_fi],[koulutusalataso3_sv],
				[koulutusalataso3_en],[okmohjauksenala_koodi],[okmohjauksenala_fi],[okmohjauksenala_sv],[okmohjauksenala_en],[koulutussektori_koodi],
				[koulutussektori_fi],[koulutussektori_sv],[koulutussektori_en],[tutkintotyyppi_koodi],[tutkintotyyppi_fi],[tutkintotyyppi_sv],
				[tutkintotyyppi_en],[Rahoitusmallialat amk 2021-2024_koodi],[Rahoitusmallialat amk 2021-2024_fi],[Rahoitusmallialat amk 2021-2024_sv],
				[Rahoitusmallialat amk 2021-2024_en],[Rahoitusmallialat yo 2021-2024_koodi],[Rahoitusmallialat yo 2021-2024_fi],
				[Rahoitusmallialat yo 2021-2024_sv],[Rahoitusmallialat yo 2021-2024_en]
		from [dw].[api_koulutusluokitus] s
		except
		select	[koulutusluokitus_avain],[koulutusluokitus_koodi],[koulutusluokitus_fi],[koulutusluokitus_sv],[koulutusluokitus_en],[koulutusastetaso1_koodi],
				[koulutusastetaso1_fi],[koulutusastetaso1_sv],[koulutusastetaso1_en],[koulutusastetaso2_koodi],[koulutusastetaso2_fi],[koulutusastetaso2_sv],
				[koulutusastetaso2_en],[koulutusalataso1_koodi],[koulutusalataso1_fi],[koulutusalataso1_sv],[koulutusalataso1_en],[koulutusalataso2_koodi],
				[koulutusalataso2_fi],[koulutusalataso2_sv],[koulutusalataso2_en],[koulutusalataso3_koodi],[koulutusalataso3_fi],[koulutusalataso3_sv],
				[koulutusalataso3_en],[okmohjauksenala_koodi],[okmohjauksenala_fi],[okmohjauksenala_sv],[okmohjauksenala_en],[koulutussektori_koodi],
				[koulutussektori_fi],[koulutussektori_sv],[koulutussektori_en],[tutkintotyyppi_koodi],[tutkintotyyppi_fi],[tutkintotyyppi_sv],
				[tutkintotyyppi_en],[Rahoitusmallialat amk 2021-2024_koodi],[Rahoitusmallialat amk 2021-2024_fi],[Rahoitusmallialat amk 2021-2024_sv],
				[Rahoitusmallialat amk 2021-2024_en],[Rahoitusmallialat yo 2021-2024_koodi],[Rahoitusmallialat yo 2021-2024_fi],
				[Rahoitusmallialat yo 2021-2024_sv],[Rahoitusmallialat yo 2021-2024_en]
		from [api].[koulutusluokitus]) s ) > 0)
		or
		((select count(*) from [api].[koulutusluokitus]) <> (select count(*) from [dw].[api_koulutusluokitus])))
		and
		(select count(*) from [dw].[api_koulutusluokitus]) > 0)

BEGIN

  SET @pvm = dbo.api_update_time(getdate())
  
  TRUNCATE TABLE [api].[koulutusluokitus]

  INSERT INTO [api].[koulutusluokitus] (
	[koulutusluokitus_avain]
    ,[koulutusluokitus_koodi]
    ,[koulutusluokitus_fi]
    ,[koulutusluokitus_sv]
    ,[koulutusluokitus_en]
    ,[koulutusastetaso1_koodi]
    ,[koulutusastetaso1_fi]
    ,[koulutusastetaso1_sv]
    ,[koulutusastetaso1_en]
    ,[koulutusastetaso2_koodi]
    ,[koulutusastetaso2_fi]
    ,[koulutusastetaso2_sv]
    ,[koulutusastetaso2_en]
    ,[koulutusalataso1_koodi]
    ,[koulutusalataso1_fi]
    ,[koulutusalataso1_sv]
    ,[koulutusalataso1_en]
    ,[koulutusalataso2_koodi]
    ,[koulutusalataso2_fi]
    ,[koulutusalataso2_sv]
    ,[koulutusalataso2_en]
    ,[koulutusalataso3_koodi]
    ,[koulutusalataso3_fi]
    ,[koulutusalataso3_sv]
    ,[koulutusalataso3_en]
    ,[okmohjauksenala_koodi]
    ,[okmohjauksenala_fi]
    ,[okmohjauksenala_sv]
    ,[okmohjauksenala_en]
    ,[koulutussektori_koodi]
    ,[koulutussektori_fi]
    ,[koulutussektori_sv]
    ,[koulutussektori_en]
    ,[tutkintotyyppi_koodi]
    ,[tutkintotyyppi_fi]
    ,[tutkintotyyppi_sv]
    ,[tutkintotyyppi_en]
    ,[Rahoitusmallialat amk 2021-2024_koodi]
    ,[Rahoitusmallialat amk 2021-2024_fi]
    ,[Rahoitusmallialat amk 2021-2024_sv]
    ,[Rahoitusmallialat amk 2021-2024_en]
    ,[Rahoitusmallialat yo 2021-2024_koodi]
    ,[Rahoitusmallialat yo 2021-2024_fi]
    ,[Rahoitusmallialat yo 2021-2024_sv]
    ,[Rahoitusmallialat yo 2021-2024_en]
	,[tietojoukko_paivitetty_pvm]
  )
  SELECT [koulutusluokitus_avain]
      ,[koulutusluokitus_koodi]
      ,[koulutusluokitus_fi]
      ,[koulutusluokitus_sv]
      ,[koulutusluokitus_en]
      ,[koulutusastetaso1_koodi]
      ,[koulutusastetaso1_fi]
      ,[koulutusastetaso1_sv]
      ,[koulutusastetaso1_en]
      ,[koulutusastetaso2_koodi]
      ,[koulutusastetaso2_fi]
      ,[koulutusastetaso2_sv]
      ,[koulutusastetaso2_en]
      ,[koulutusalataso1_koodi]
      ,[koulutusalataso1_fi]
      ,[koulutusalataso1_sv]
      ,[koulutusalataso1_en]
      ,[koulutusalataso2_koodi]
      ,[koulutusalataso2_fi]
      ,[koulutusalataso2_sv]
      ,[koulutusalataso2_en]
      ,[koulutusalataso3_koodi]
      ,[koulutusalataso3_fi]
      ,[koulutusalataso3_sv]
      ,[koulutusalataso3_en]
      ,[okmohjauksenala_koodi]
      ,[okmohjauksenala_fi]
      ,[okmohjauksenala_sv]
      ,[okmohjauksenala_en]
      ,[koulutussektori_koodi]
      ,[koulutussektori_fi]
      ,[koulutussektori_sv]
      ,[koulutussektori_en]
      ,[tutkintotyyppi_koodi]
      ,[tutkintotyyppi_fi]
      ,[tutkintotyyppi_sv]
      ,[tutkintotyyppi_en]
      ,[Rahoitusmallialat amk 2021-2024_koodi]
      ,[Rahoitusmallialat amk 2021-2024_fi]
      ,[Rahoitusmallialat amk 2021-2024_sv]
      ,[Rahoitusmallialat amk 2021-2024_en]
      ,[Rahoitusmallialat yo 2021-2024_koodi]
      ,[Rahoitusmallialat yo 2021-2024_fi]
      ,[Rahoitusmallialat yo 2021-2024_sv]
      ,[Rahoitusmallialat yo 2021-2024_en]
	  ,[tietojoukko_paivitetty_pvm] =	@pvm
  FROM [dw].[api_koulutusluokitus]

END

IF ((select count(*) from [dw].[api_koulutusluokitus]) = 0)

BEGIN

RAISERROR('Source table has no rows.',11,1)

END


GO

USE [ANTERO]