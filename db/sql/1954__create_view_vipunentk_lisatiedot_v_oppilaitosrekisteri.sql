USE [VipunenTK_lisatiedot]
GO
/****** Object:  View [dw].[v_oppilaitosrekisteri]    Script Date: 16.11.2018 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_oppilaitosrekisteri]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[v_oppilaitosrekisteri] AS

/*  Manuaaliset koodit tilastokeskuksen aineistokuvauksista. 
	Alueluokitus haetaan jokaiselle vuodelle ja joinataan käyttämällä 
	alueokituksen tilastovuotta sekä kuntakoodia, jotta koululle tulee tilastovuoden mukainen kuntakoodi. 
	-Janne K-O
*/	
	
	SELECT  
	   [Tilastovuosi]=f.[tilv]
	  ,[Oppilaitoskoodi]=f.tunn
	  ,[Oppilaitos]=f.onimi
	  ,[Oppilaitoksen korvaava koodi]=case when f.utunn='''' then null else f.utunn end
	  ,[Oppilaitoksen korvaava nimi]=case when (f.utunn is not null and f.utunn<>'''') then d1.oppilaitos end
	  ,[Oppilaitoksen olotila_koodi]=f.[olo]
	  ,[Oppilaitoksen olotila]=
			case 
				when f.[olo]=0 then ''Voimassaoleva''
				when f.[olo]=1 then ''Lakkautettu tilastovuonna''
				when f.[olo]=2 then ''Yhdistetty toiseen oppilaitokseen tilastovuonna'' 
				when f.[olo]=3 then ''Oppilaitos poistettu koululaitosken oppilaitoksista''
				when f.[olo]=6 then ''Oppilaitoksessa ei ole toimintaa tilastovuonna'' end
      ,[Sairaalakoulu koodi]=f.[sair]
	  ,[Sairaalakoulu]=case 
				when f.[sair]=1 then ''Kyllä''
				when f.[sair]=0 then ''Ei'' end
      ,[Oppilaitostyyppi koodi]=f.[oltyp]
	  ,[Oppilaitostyyppi]=oltyyppi.oppilaitostyyppi
	  ,[Oppilaitoksen kunta koodi]=f.okun
	  ,[Oppilaitoksen kunta]=alue.nimi_suom
	  ,[Oppilaitoksen maakunta koodi]=alue.maakunta
	  ,[Oppilaitoksen maakunta]=alue.maakuntanim_s
	  ,[Oppilaitoksen järjestäjän omistajatyyppi]=d1.koulutuksen_jarjestajan_omistajatyyppi
	  ,[Oppilaitoksen järjestäjän omistajatyyppikoodi]=d1.koulutuksen_jarjestajan_omistajatyyppikoodi
	  ,[Oppilaitoksen omistajatyyppi]=d1.oppilaitoksen_omistajatyyppi
	  ,[Oppilaitoksen omistajatyyppikoodi]=d1.oppilaitoksen_omistajatyyppikoodi
	  ,[Oppilaitoksen syntyvuosi]=f.syntkk
	  ,[Oppilaitoksen lakkautusvuosi]=f.lakkv
	  ,[Aineisto]=f.aineisto
	  ,[Alueaineisto]=alue.aineisto
	  
  FROM (
	select *,[aineisto]=''TK_6_1_sopv_11'' from [TK_H9098_CSC].[dbo].[TK_6_1_sopv_11] union all
	select *,[aineisto]=''TK_6_1_sopv_12'' from [TK_H9098_CSC].[dbo].[TK_6_1_sopv_12] union all
	select *,[aineisto]=''TK_6_1_sopv_13'' from [TK_H9098_CSC].[dbo].[TK_6_1_sopv_13] union all
	select *,[aineisto]=''TK_6_1_sopv_14'' from [TK_H9098_CSC].[dbo].[TK_6_1_sopv_14] union all
	select *,[aineisto]=''TK_6_1_sopv_15'' from [TK_H9098_CSC].[dbo].[TK_6_1_sopv_15] union all
	select *,[aineisto]=''TK_6_1_sopv_16'' from [TK_H9098_CSC].[dbo].[TK_6_1_sopv_16] union all
	select *,[aineisto]=''TK_6_1_sopv_17'' from [TK_H9098_CSC].[dbo].[TK_6_1_sopv_17] union all
	select *,[aineisto]=''TK_6_1_sopv_18'' from [TK_H9098_CSC].[dbo].[TK_6_1_sopv_18]) as f
	inner join vipunentk.dbo.d_oppilaitoksen_taustatiedot d1 on d1.oppilaitoskoodi=f.tunn
	inner join (select distinct oppilaitostyyppi,oppilaitostyyppikoodi,oppilaitostyyppi_EN,oppilaitostyyppi_SV from 
		vipunentk.dbo.d_oppilaitoksen_taustatiedot) oltyyppi on oltyyppi.oppilaitostyyppikoodi=oltyp
	inner join (select * from (
		select *,[aineisto]=''TK_6_7_sopv_11'' from [TK_H9098_CSC].[dbo].[TK_6_7_sopv_11]  union all
		select *,[aineisto]=''TK_6_7_sopv_12'' from [TK_H9098_CSC].[dbo].[TK_6_7_sopv_12]  union all
		select *,[aineisto]=''TK_6_7_sopv_13'' from [TK_H9098_CSC].[dbo].[TK_6_7_sopv_13]  union all
		select *,[aineisto]=''TK_6_7_sopv_14'' from [TK_H9098_CSC].[dbo].[TK_6_7_sopv_14]  union all
		select *,[aineisto]=''TK_6_7_sopv_15'' from [TK_H9098_CSC].[dbo].[TK_6_7_sopv_15]  union all
		select *,[aineisto]=''TK_6_7_sopv_16'' from [TK_H9098_CSC].[dbo].[TK_6_7_sopv_16]  union all
		select *,[aineisto]=''TK_6_7_sopv_17'' from [TK_H9098_CSC].[dbo].[TK_6_7_sopv_17]  union all
		select *,[aineisto]=''TK_6_7_sopv_18'' from [TK_H9098_CSC].[dbo].[TK_6_7_sopv_18]) f ) alue on alue.tilv+alue.kunta=f.tilv+f.okun

	'