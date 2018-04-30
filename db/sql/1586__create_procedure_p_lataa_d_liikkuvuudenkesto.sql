USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_liikkuvuudenkesto]    Script Date: 30.4.2018 10:13:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_liikkuvuudenkesto]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_liikkuvuudenkesto] AS' 
END
GO


ALTER PROCEDURE [dw].[p_lataa_d_liikkuvuudenkesto] AS

	TRUNCATE TABLE dw.d_liikkuvuudenkesto
	set identity_insert dw.d_liikkuvuudenkesto on
	INSERT dw.d_liikkuvuudenkesto (
		id
		,[source]          
           ,[liikkuvuudenkesto_koodi]
           ,[liikkuvuudenkesto_fi]
           ,[liikkuvuudenkesto_sv]
           ,[liikkuvuudenkesto_en]
           ,[liikkuvuudenpituus_fi]
           ,[liikkuvuudenpituus_en]
           ,[liikkuvuudenpituus_sv]
		)
	VALUES (
		N'-1'
		,N'etl: p_lataa_d_liikkuvuudenkesto'
		,('-1')
        ,('Tieto puuttuu')
        ,('Information saknas')
        ,('Missing data')
        ,('Tieto puuttuu')
        ,('Missing data')
        ,('Information saknas')
		)
	set identity_insert dw.d_liikkuvuudenkesto off

INSERT INTO [dw].[d_liikkuvuudenkesto]
           (
           [source]
           
           ,[liikkuvuudenkesto_koodi]
           ,[liikkuvuudenkesto_fi]
           ,[liikkuvuudenkesto_sv]
           ,[liikkuvuudenkesto_en]
           ,[liikkuvuudenpituus_fi]
           ,[liikkuvuudenpituus_en]
           ,[liikkuvuudenpituus_sv])
     VALUES

		   ('etl: p_lataa_d_liikkuvuudenkesto','1','Alle 3kk','Mindre än 3 mån','Less than 3 months','Lyhyt','Short','Kort'),
		   
		   ('etl: p_lataa_d_liikkuvuudenkesto','2','Yli 3kk','Mer än 3 mån', 'More than 3 months','Pitkä', 'Long','Lång')
GO


