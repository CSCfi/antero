USE [Vipunen_koodisto]
GO
/****** Object:  StoredProcedure [dbo].[p_korjaa_aineistovirheet]    Script Date: 21.6.2017 15:34:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_korjaa_aineistovirheet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_korjaa_aineistovirheet] AS' 
END
GO
ALTER PROCEDURE [dbo].[p_korjaa_aineistovirheet] AS

--Tilastokeskuksen aineistojen havaittujen virheiden korjausajo
-- exec Vipunen_koodisto.dbo.p_korjaa_aineistovirheet


-- koulutusaste 2002:ssä on jonain vuonna koodin 63 selite kirjoittettu muotoon ”Alempi korkeakoulutututkinto”, vaikka tietysti pitäisi olla ”Alempi korkeakoulutututkinto”. 
-- CSC Jarmo 7.1.2014
Update [Vipunen_koodisto].[koodisto_2011].[koulutusluokitus] set
--Select tilv, koulk,
 opmastni = 'Alempi korkeakoulututkinto'
--from [Vipunen_koodisto].[koodisto_2011].[koulutusluokitus]
where 
 opmast = '63'
 
-- elykoodeista 2010 puuttuu etunollat
-- CSC Jarmo 10.3.2014
-- -1 ja -2 ovat kaksi merkkiä, joten niitä ei tarvitse erikseen huomioida
 Update [Vipunen_koodisto].koodisto_2010.alueluokitus set
  [ely] = RIGHT('00'+ely,2)
  
  
  



GO

USE [ANTERO]

