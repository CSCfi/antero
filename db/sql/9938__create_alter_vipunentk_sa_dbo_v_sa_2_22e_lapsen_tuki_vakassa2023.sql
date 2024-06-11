USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_2_22e_lapsen_tuki_vakassa_2023]    Script Date: 11.6.2024 15:25:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO











CREATE OR ALTER   VIEW [dbo].[v_sa_2_22e_lapsen_tuki_vakassa_2023] AS
SELECT [tilv] = cast(kaikkivuodet.tilv as nvarchar(4))
	  ,tilv_date = cast(kaikkivuodet.tilv+'0101' as date)
      ,[vjarj] = cast(kaikkivuodet.vjarj as nvarchar(100))
      ,[vjarjnim] = cast(kaikkivuodet.vjarjnim as nvarchar(100))
      ,[yllapKieli] = cast(kaikkivuodet.yllapKieli as nvarchar(1))
      ,[vokun] = cast(kaikkivuodet.vokun as nvarchar(10))
      ,[vokunim] = cast(kaikkivuodet.vokunim as nvarchar(100))
      ,[vonuts3] = cast(kaikkivuodet.vonuts3 as nvarchar(100))
      ,[vpaaton] = cast(kaikkivuodet.vpaaton as nvarchar(10))
      ,[vpatyon] = cast(kaikkivuodet.vpatyon as nvarchar(10))
      ,[vpatysuku] = cast(kaikkivuodet.vpatysuku as nvarchar(10))
      ,[vpatya3n] = cast(kaikkivuodet.vpatya3n as int)
      ,[vpaty34n] = cast(kaikkivuodet.vpaty34n as int)
      ,[vpaty5n] = cast(kaikkivuodet.vpaty5n as int)
      ,[vpaty6n] = cast(kaikkivuodet.vpaty6n as int)
      ,[vpatya3m] = cast(kaikkivuodet.vpatya3m as int)
      ,[vpaty34m] = cast(kaikkivuodet.vpaty34m as int)
      ,[vpaty5m] = cast(kaikkivuodet.vpaty5m as int)
      ,[vpaty6m] = cast(kaikkivuodet.vpaty6m as int)
      ,[vpatya3y] = cast(kaikkivuodet.vpatya3y as int)
      ,[vpaty34y] = cast(kaikkivuodet.vpaty34y as int)
      ,[vpaty5y] = cast(kaikkivuodet.vpaty5y as int)
      ,[vpaty6y] = cast(kaikkivuodet.vpaty6y as int)
      ,[vpatton] = cast(kaikkivuodet.vpatton as nvarchar(10))
      ,[vpattsuku] = cast(kaikkivuodet.vpattsuku as nvarchar(10))
      ,[vpatta3n] = cast(kaikkivuodet.vpatta3n as int)
      ,[vpatt34n] = cast(kaikkivuodet.vpatt34n as int)
      ,[vpatt5n] = cast(kaikkivuodet.vpatt5n as int)
      ,[vpatt6n] = cast(kaikkivuodet.vpatt6n as int)
      ,[vpatta3m] = cast(kaikkivuodet.vpatta3m as int)
      ,[vpatt34m] = cast(kaikkivuodet.vpatt34m as int)
      ,[vpatt5m] = cast(kaikkivuodet.vpatt5m as int)
      ,[vpatt6m] = cast(kaikkivuodet.vpatt6m as int)
      ,[vpatta3y] = cast(kaikkivuodet.vpatta3y as int)
      ,[vpatt34y] = cast(kaikkivuodet.vpatt34y as int)
      ,[vpatt5y] = cast(kaikkivuodet.vpatt5y as int)
      ,[vpatt6y] = cast(kaikkivuodet.vpatt6y as int)
      ,[vpateon] = cast(kaikkivuodet.vpateon as nvarchar(10))
      ,[vpatesuku] = cast(kaikkivuodet.vpatesuku as nvarchar(10))
      ,[vpatea3n] = cast(kaikkivuodet.vpatea3n as int)
      ,[vpate34n] = cast(kaikkivuodet.vpate34n as int)
      ,[vpate5n] = cast(kaikkivuodet.vpate5n as int)
      ,[vpate6n] = cast(kaikkivuodet.vpate6n as int)
      ,[vpatea3m] = cast(kaikkivuodet.vpatea3m as int)
      ,[vpate34m] = cast(kaikkivuodet.vpate34m as int)
      ,[vpate5m] = cast(kaikkivuodet.vpate5m as int)
      ,[vpate6m] = cast(kaikkivuodet.vpate6m as int)
      ,[vpatea3y] = cast(kaikkivuodet.vpatea3y as int)
      ,[vpate34y] = cast(kaikkivuodet.vpate34y as int)
      ,[vpate5y] = cast(kaikkivuodet.vpate5y as int)
      ,[vpate6y] = cast(kaikkivuodet.vpate6y as int)
      ,[vttjako] = cast(kaikkivuodet.vttjako as nvarchar(10))
      ,[vttvahk] = cast(kaikkivuodet.vttvahk as int)
      ,[vttlisk] = cast(kaikkivuodet.vttlisk as int)
      ,[vtterik] = cast(kaikkivuodet.vtterik as int)
      ,[vttavuk] = cast(kaikkivuodet.vttavuk as int)
      ,[vttosak] = cast(kaikkivuodet.vttosak as int)
      ,[vtteryk] = cast(kaikkivuodet.vtteryk as int)
      ,[vttiryk] = cast(kaikkivuodet.vttiryk as int)
      ,[vtthavk] = cast(kaikkivuodet.vtthavk as int)
      ,[vtttlkk] = cast(kaikkivuodet.vtttlkk as int)
      ,[vttvalk] = cast(kaikkivuodet.vttvalk as int)
      ,[vttkulk] = cast(kaikkivuodet.vttkulk as int)
      ,[vttvahy] = cast(kaikkivuodet.vttvahy as int)
      ,[vttlisy] = cast(kaikkivuodet.vttlisy as int)
      ,[vtteriy] = cast(kaikkivuodet.vtteriy as int)
      ,[vttavuy] = cast(kaikkivuodet.vttavuy as int)
      ,[vttosay] = cast(kaikkivuodet.vttosay as int)
      ,[vtteryy] = cast(kaikkivuodet.vtteryy as int)
      ,[vttiryy] = cast(kaikkivuodet.vttiryy as int)
      ,[vtthavy] = cast(kaikkivuodet.vtthavy as int)
      ,[vtttlky] = cast(kaikkivuodet.vtttlky as int)
      ,[vttvaly] = cast(kaikkivuodet.vttvaly as int)
      ,[vttkuly] = cast(kaikkivuodet.vttkuly as int)
      ,[vttvahyh] = cast(kaikkivuodet.vttvahyh as int)
      ,[vttlisyh] = cast(kaikkivuodet.vttlisyh as int)
      ,[vtteriyh] = cast(kaikkivuodet.vtteriyh as int)
      ,[vttavuyh] = cast(kaikkivuodet.vttavuyh as int)
      ,[vttosayh] = cast(kaikkivuodet.vttosayh as int)
      ,[vtteryyh] = cast(kaikkivuodet.vtteryyh as int)
      ,[vttiryyh] = cast(kaikkivuodet.vttiryyh as int)
      ,[vtthavyh] = cast(kaikkivuodet.vtthavyh as int)
      ,[vtttlkyh] = cast(kaikkivuodet.vtttlkyh as int)
      ,[vttvalyh] = cast(kaikkivuodet.vttvalyh as int)
      ,[vttkulyh] = cast(kaikkivuodet.vttkulyh as int)
      ,[eiyksityista] = cast(kaikkivuodet.eiyksityista as nvarchar(10))
   	  ,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(50))
	  ,rivinumero = cast(kaikkivuodet.rivinumero as int)

FROM (

SELECT  [tilv]
      ,[vjarj]
      ,[vjarjnim]
      ,[yllapKieli]
      ,[vokun]
      ,[vokunim]
      ,[vonuts3]
      ,[vpaaton]
      ,[vpatyon]
      ,[vpatysuku]
      ,[vpatya3n]
      ,[vpaty34n]
      ,[vpaty5n]
      ,[vpaty6n]
      ,[vpatya3m]
      ,[vpaty34m]
      ,[vpaty5m]
      ,[vpaty6m]
      ,[vpatya3y]
      ,[vpaty34y]
      ,[vpaty5y]
      ,[vpaty6y]
      ,[vpatton]
      ,[vpattsuku]
      ,[vpatta3n]
      ,[vpatt34n]
      ,[vpatt5n]
      ,[vpatt6n]
      ,[vpatta3m]
      ,[vpatt34m]
      ,[vpatt5m]
      ,[vpatt6m]
      ,[vpatta3y]
      ,[vpatt34y]
      ,[vpatt5y]
      ,[vpatt6y]
      ,[vpateon]
      ,[vpatesuku]
      ,[vpatea3n]
      ,[vpate34n]
      ,[vpate5n]
      ,[vpate6n]
      ,[vpatea3m]
      ,[vpate34m]
      ,[vpate5m]
      ,[vpate6m]
      ,[vpatea3y]
      ,[vpate34y]
      ,[vpate5y]
      ,[vpate6y]
      ,[vttjako]
      ,[vttvahk]
      ,[vttlisk]
      ,[vtterik]
      ,[vttavuk]
      ,[vttosak]
      ,[vtteryk]
      ,[vttiryk]
      ,[vtthavk]
      ,[vtttlkk]
      ,[vttvalk]
      ,[vttkulk]
      ,[vttvahy]
      ,[vttlisy]
      ,[vtteriy]
      ,[vttavuy]
      ,[vttosay]
      ,[vtteryy]
      ,[vttiryy]
      ,[vtthavy]
      ,[vtttlky]
      ,[vttvaly]
      ,[vttkuly]
      ,[vttvahyh]
      ,[vttlisyh]
      ,[vtteriyh]
      ,[vttavuyh]
      ,[vttosayh]
      ,[vtteryyh]
      ,[vttiryyh]
      ,[vtthavyh]
      ,[vtttlkyh]
      ,[vttvalyh]
      ,[vttkulyh]
      ,[eiyksityista]
	  ,[tietolahde]='2_22e_sopv_24'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_22e_sopv_24]

) as kaikkivuodet






GO


