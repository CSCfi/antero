USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain]    Script Date: 12.1.2023 23:17:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [dbo].[v_f_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain] as

-- CSC JN 26.1.2015

-- Taulun luonti
-- Drop table VipunenTK_DW.dbo.f_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain
-- Select * into VipunenTK_DW.dbo.f_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain from VipunenTK_DW.dbo.v_f_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain

-- Taulun populointi
-- Truncate table VipunenTK_DW.dbo.f_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain
-- Insert into VipunenTK_DW.dbo.f_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain Select * from VipunenTK_DW.dbo.v_f_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain

-- Kysely
-- Select * from VipunenTK_DW.dbo.v_f_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain


SELECT tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = tunn
      ,tieteenala_avain = [tiede]
      ,virkaryhma_avain = [vryhma]
	  ,tutkijanuraporras_avain = [tuturap]
      ,ika_avain = Cast(Case [ikar4] 
				when '1' then 'ikar41'
				when '2' then 'ikar42'
				when '3' then 'ikar43'
				when '4' then 'ikar44'
				when '5' then 'ikar45'
				when '6' then 'ikar46'
				when '7' then 'ikar47'
				when '8' then 'ikar48'
				when '9' then 'ikar49'
				when '10' then 'ikar40'
				else '-1'
			end as nvarchar(10))
      ,sukupuoli_avain = [sp]
      ,tutkintotaso_avain = [tutktaso]
	  ,koulutusaste_taso2_avain = [kaste_t2]
      ,[lkm_tutkimushenkilokunta]
      ,[tietolahde]
      ,[rivinumero]
  FROM [dbo].[sa_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain]


GO


