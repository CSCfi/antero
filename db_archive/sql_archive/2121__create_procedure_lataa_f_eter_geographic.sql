USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_eter_geographic]   ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/*
f_eter_geographic information lataus SA-tauluista
25.2.2019
JKO
*/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_eter_geographic]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_eter_geographic] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_f_eter_geographic] AS

TRUNCATE TABLE dw.f_eter_geographic
INSERT INTO dw.f_eter_geographic
(
[_id]
      ,Region_of_establishment_NUTS_2
      ,Notes_on_region_of_establishment
      ,Geographic_coordinates_longitude_value
      ,Geographic_coordinates_longitude_code
      ,Notes_on_city_postcode_or_coordinates
      ,Multisite_institution_City
      ,Multisite_institution_Longitude
      ,Flag_geographic_information
      ,Geographic_coordinates_latitude_value
      ,Geographic_coordinates_latitude_code
      ,NUTS_3_codes_of_other_campuses
      ,Notes_on_multisite_institution
      ,Name_of_the_city
      ,Multisite_institution_value
      ,Multisite_institution_code
      ,Multisite_institution_Postcode
      ,Region_of_establishment_NUTS_3
      ,Postcode
      ,Multisite_institution_Latitude
      ,[username]
      ,[Source]
      ,[Loadtime]
)
Select	
	[_id]
      ,Region_of_establishment_NUTS_2=[GEO.NUTS2]
      ,Notes_on_region_of_establishment=[GEO.NOTESREG]
      ,Geographic_coordinates_longitude_value=[GEO.COORDLON.v]
      ,Geographic_coordinates_longitude_code=[GEO.COORDLON.code]
      ,Notes_on_city_postcode_or_coordinates=[GEO.NOTESCITYPOSTCODE]
      ,Multisite_institution_City=[GEO.MULTISITECITY]
      ,Multisite_institution_Longitude=[GEO.MULTISITELON]
      ,Flag_geographic_information=[GEO.FLAG]
      ,Geographic_coordinates_latitude_value=[GEO.COORDLAT.v]
      ,Geographic_coordinates_latitude_code=[GEO.COORDLAT.code]
      ,NUTS_3_codes_of_other_campuses=[GEO.NUTS3MULTISITE]
      ,Notes_on_multisite_institution=[GEO.NOTESMULTISITE]
      ,Name_of_the_city=[GEO.CITY]
      ,Multisite_institution_value=[GEO.MULTISITE.v]
      ,Multisite_institution_code=[GEO.MULTISITE.code]
      ,Multisite_institution_Postcode=[GEO.MULTISITEPOSTCODE]
      ,Region_of_establishment_NUTS_3=[GEO.NUTS3]
      ,Postcode=[GEO.POSTCODE]
      ,Multisite_institution_Latitude=[GEO.MULTISITELAT]
      ,[username]
      ,[Source]
      ,[Loadtime]
FROM [ANTERO].[sa].[sa_eter_geographic]
GO



USE [ANTERO]