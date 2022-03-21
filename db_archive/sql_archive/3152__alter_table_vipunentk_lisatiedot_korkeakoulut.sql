/****** Script for SelectTopNRows command from SSMS  ******/
 update [VipunenTK_lisatiedot].[dbo].[korkeakoulut] 
 set [oppilaitos] = 'Kaakkois-Suomen ammattikorkeakoulu'
      ,[oppilaitos_SV] = 'Kaakkois-Suomen ammattikorkeakoulu'
      ,[oppilaitos_EN] = 'South-Eastern Finland University of Applied Sciences'

where [oppilaitoskoodi] in ('02506','02608')

GO
USE [ANTERO]