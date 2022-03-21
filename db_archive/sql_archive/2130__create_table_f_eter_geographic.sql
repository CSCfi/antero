
USE [ANTERO]
IF EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='f_eter_geographic')
BEGIN
	DROP TABLE [dw].[f_eter_geographic];
END

IF  NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='f_eter_geographic')
BEGIN
CREATE TABLE [dw].[f_eter_geographic](
	[_id][varchar](24) NOT NULL,
    [Region_of_establishment_NUTS_2][varchar](4) NULL,
    [Notes_on_region_of_establishment][nvarchar](200) NULL,
    [Geographic_coordinates_longitude_value][nvarchar](50) NULL,
    [Geographic_coordinates_longitude_code][nvarchar](50) NULL,
    [Notes_on_city_postcode_or_coordinates][nvarchar](200) NULL,
    [Multisite_institution_City][nvarchar](50) NULL,
    [Multisite_institution_Longitude][nvarchar](50) NULL,
    [Flag_geographic_information][nvarchar](50) NULL,
    [Geographic_coordinates_latitude_value][nvarchar](50) NULL,
    [Geographic_coordinates_latitude_code][nvarchar](50) NULL,
    [NUTS_3_codes_of_other_campuses][nvarchar](200) NULL,
    [Notes_on_multisite_institution][nvarchar](300) NULL,
    [Name_of_the_city][nvarchar](200) NULL,
    [Multisite_institution_value][nvarchar](50) NULL,
    [Multisite_institution_code][nvarchar](50) NULL,
    [Multisite_institution_Postcode][nvarchar](50) NULL,
    [Region_of_establishment_NUTS_3][nvarchar](5) NULL,
    [Postcode][nvarchar](50) NULL,
    [Multisite_institution_Latitude][nvarchar](50) NULL,
    [username] [varchar](100) NULL,
	[Source] [varchar](100) NULL,
	[Loadtime] [datetime] NULL,
 CONSTRAINT [PK__f_eter_geographic] PRIMARY KEY CLUSTERED
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
USE [ANTERO]