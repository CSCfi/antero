USE [VipunenTK_SA]
GO

DROP VIEW IF EXISTS [dbo].[v_sa_2_11b_Vapaan_sivistystyon_opiskelijaprofiili]
GO

/****** Object:  View [dbo].[v_sa_2_11b_Vapaan_sivistystyön_opiskelijaprofiili]    Script Date: 20.1.2021 16:57:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Select * from VipunenTK_SA.[dbo].v_sa_2_11b_Vapaan_sivistystyon_opiskelijaprofiili
--
-- Drop table if exists VipunenTK_DW.[dbo].sa_2_11b_Vapaan_sivistystyon_opiskelijaprofiili
-- Select * into VipunenTK_DW.[dbo].sa_2_11b_Vapaan_sivistystyon_opiskelijaprofiili from VipunenTK_SA.[dbo].v_sa_2_11b_Vapaan_sivistystyon_opiskelijaprofiili
--
-- Truncate table VipunenTK_DW.[dbo].sa_2_11b_Vapaan_sivistystyon_opiskelijaprofiili
-- Insert into VipunenTK_DW.[dbo].sa_2_11b_Vapaan_sivistystyon_opiskelijaprofiili Select * from VipunenTK_SA.[dbo].v_sa_2_11b_Vapaan_sivistystyon_opiskelijaprofiili


CREATE VIEW [dbo].[v_sa_2_11b_Vapaan_sivistystyon_opiskelijaprofiili] AS

SELECT [tilv] = cast(tilv as nvarchar(4))
      ,[tunn] = cast(tunn as nvarchar(5))
      ,[jarj] = cast(jarj as nvarchar(10))
	  ,[lkm_avain] = cast(lkm_avain as nvarchar(10))
	  ,[lkm] = cast(lkm as int)
FROM
(
  SELECT
	  [tilv]
	  ,[tunn]
	  ,[jarj]
	  ,[osavs1]
	  ,[osavs2]
	  ,[osavs3]
	  ,[osavs4]
	  ,[osavs5]
	  ,[osavs6]
	  ,[osavs7]
	  ,[osavs8]
	  ,[osavs9]
	  ,[osavs10]
	  --,[osavsg]
      ,[osamk1]
      ,[osamk2]
      ,[osamk3]
      ,[osamk4]
      ,[osamk5]
      ,[osamk6]
      ,[osamk7]
      ,[osamk8]
      ,[osamk9]
      ,[osamk10]
      --,[osamkg]
      ,[osaay1]
      ,[osaay2]
      ,[osaay3]
      ,[osaay4]
      ,[osaay5]
      ,[osaay6]
      ,[osaay7]
      ,[osaay8]
      ,[osaay9]
      ,[osaay10]
	  --,[osaayg]
      ,[osavs11]
      ,[osavs12]
      ,[osavs13]
      --,[osavsh]
      ,[osamk11]
      ,[osamk12]
      ,[osamk13]
      --,[osamkh]
      ,[osaay11]
      ,[osaay12]
      ,[osaay13]
      --,[osaayh]
      ,[osavs14]
      ,[osavs15]
      ,[osavs16]
      ,[osavs17]
      ,[osavs18]
      --,[osavsi]
      ,[osamk14]
      ,[osamk15]
      ,[osamk16]
      ,[osamk17]
      ,[osamk18]
      --,[osamki]
      ,[osaay14]
      ,[osaay15]
      ,[osaay16]
      ,[osaay17]
      ,[osaay18]
      --,[osaayi]
      ,[osavs19]
      ,[osavs20]
      ,[osavs21]
      ,[osavs22]
      ,[osavs23]
      ,[osavs24]
      ,[osavs25]
      ,[osavs26]
      --,[osavsj]
      ,[osamk19]
      ,[osamk20]
      ,[osamk21]
      ,[osamk22]
      ,[osamk23]
      ,[osamk24]
      ,[osamk25]
      ,[osamk26]
      --,[osamkj]
      ,[osaay19]
      ,[osaay20]
      ,[osaay21]
      ,[osaay22]
      ,[osaay23]
      ,[osaay24]
      ,[osaay25]
      ,[osaay26]
      --,[osaayj]
	  --,[luontipvm]
  FROM [TK_H9098_CSC].[dbo].[TK_2_11b_sopv_20]

  --UNION ALL 
  
  --mahdollinen uusi sopv

) pvt

UNPIVOT 
	
(lkm FOR lkm_avain IN
	([osavs1]
	,[osavs2]
	,[osavs3]
	,[osavs4]
	,[osavs5]
	,[osavs6]
	,[osavs7]
	,[osavs8]
	,[osavs9]
	,[osavs10]
	--,[osavsg]
	,[osamk1]
	,[osamk2]
	,[osamk3]
	,[osamk4]
	,[osamk5]
	,[osamk6]
	,[osamk7]
	,[osamk8]
	,[osamk9]
	,[osamk10]
	--,[osamkg]
	,[osaay1]
	,[osaay2]
	,[osaay3]
	,[osaay4]
	,[osaay5]
	,[osaay6]
	,[osaay7]
	,[osaay8]
	,[osaay9]
	,[osaay10]
	--,[osaayg]
	,[osavs11]
	,[osavs12]
	,[osavs13]
	--,[osavsh]
	,[osamk11]
	,[osamk12]
	,[osamk13]
	--,[osamkh]
	,[osaay11]
	,[osaay12]
	,[osaay13]
	--,[osaayh]
	,[osavs14]
	,[osavs15]
	,[osavs16]
	,[osavs17]
	,[osavs18]
	--,[osavsi]
	,[osamk14]
	,[osamk15]
	,[osamk16]
	,[osamk17]
	,[osamk18]
	--,[osamki]
	,[osaay14]
	,[osaay15]
	,[osaay16]
	,[osaay17]
	,[osaay18]
	--,[osaayi]
	,[osavs19]
	,[osavs20]
	,[osavs21]
	,[osavs22]
	,[osavs23]
	,[osavs24]
	,[osavs25]
	,[osavs26]
	--,[osavsj]
	,[osamk19]
	,[osamk20]
	,[osamk21]
	,[osamk22]
	,[osamk23]
	,[osamk24]
	,[osamk25]
	,[osamk26]
	--,[osamkj]
	,[osaay19]
	,[osaay20]
	,[osaay21]
	,[osaay22]
	,[osaay23]
	,[osaay24]
	,[osaay25]
	,[osaay26]
	--,[osaayj]
	)
) unpvt

WHERE lkm > 0

GO
use antero

