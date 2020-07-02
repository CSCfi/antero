/****** Script for SelectTopNRows command from SSMS  ******/

	  
USE [VipunenTK_lisatiedot]
GO

IF NOT EXISTS (select * from [VipunenTK_lisatiedot].[dbo].[Vipunen_kuutio] where kuutio_avain='TIM_TAB' or kuutio_nimi='Tietoja maakunnista')

BEGIN

	INSERT [VipunenTK_lisatiedot].[dbo].[Vipunen_kuutio] 
	  ([kuutio_nimi]
      ,[kuutio_avain]
      ,[kuutio_toteutustyyppi]
      ,[kuutio_projekti]
      ,[kuutio_prosessointiryhma]
      ,[ajotunnus])
	  VALUES
	  ('Tietoja maakunnista'
      ,'TIM_TAB'
      ,'tabular'
      ,'Tietoja maakunnista'
      ,'TK'
      ,'vipunen')

END

GO

USE [ANTERO]
