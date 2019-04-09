USE [VipunenTK_lisatiedot]
GO

/*
2019-01-31
Added new age classification with the key ikar7
Age groups under 18, yearly to 24 and after that in 5 year groups to 65 and older
*/

IF NOT EXISTS 
		(SELECT * FROM VipunenTK_lisatiedot.dbo.ika f
		WHERE f.[id] NOT IN (212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227)
		)
		
BEGIN
INSERT INTO [dbo].[ika]
           ([id]
           ,[luotu]
           ,[ika_avain]
           ,[ika_int]
           ,[ika]
           ,[ika_SV]
           ,[ika_EN]
           ,[ika5v_int]
           ,[ika5v]
           ,[ika5v_SV]
           ,[ika5v_EN]
           ,[jarjestys_ika]
           ,[jarjestys_ika5v]
           ,[virhetilanne]
           ,[poistettu]
           ,[tietolahde]
           ,[kommentti])
     VALUES
		   (212
           ,'2019-01-31'
           ,'ikar7_18'
           ,-1
           ,'18 vuotiaat ja sitä nuoremmat'
           ,'18 år eller yngre'
           ,'18 or under'
           ,-1
           ,'Tuntematon'
           ,'Okänt'
           ,'Unknown'
           ,'ikar7_18'
           ,'ikar7_18'
           ,'E'
           ,''
           ,'Manuaalinen'
           ,'CSC Janne')
		   ,
		   (213
           ,'2019-01-31'
           ,'ikar7_19'
           ,-1
           ,'19'
           ,'19'
           ,'19'
           ,-1
           ,'Tuntematon'
           ,'Okänt'
           ,'Unknown'
           ,'ikar7_19'
           ,'ikar7_19'
           ,'E'
           ,''
           ,'Manuaalinen'
           ,'CSC Janne')
		   ,
		   (214
           ,'2019-01-31'
           ,'ikar7_20'
           ,-1
           ,'20'
           ,'20'
           ,'20'
           ,-1
           ,'Tuntematon'
           ,'Okänt'
           ,'Unknown'
           ,'ikar7_20'
           ,'ikar7_20'
           ,'E'
           ,''
           ,'Manuaalinen'
           ,'CSC Janne')
		   ,
		   (215
           ,'2019-01-31'
           ,'ikar7_21'
           ,-1
           ,'21'
           ,'21'
           ,'21'
           ,-1
           ,'Tuntematon'
           ,'Okänt'
           ,'Unknown'
           ,'ikar7_21'
           ,'ikar7_21'
           ,'E'
           ,''
           ,'Manuaalinen'
           ,'CSC Janne')
		   ,
		   (216
           ,'2019-01-31'
           ,'ikar7_22'
           ,-1
           ,'22'
           ,'22'
           ,'22'
           ,-1
           ,'Tuntematon'
           ,'Okänt'
           ,'Unknown'
           ,'ikar7_22'
           ,'ikar7_22'
           ,'E'
           ,''
           ,'Manuaalinen'
           ,'CSC Janne')
		   ,
		   (217
           ,'2019-01-31'
           ,'ikar7_23'
           ,-1
           ,'23'
           ,'23'
           ,'23'
           ,-1
           ,'Tuntematon'
           ,'Okänt'
           ,'Unknown'
           ,'ikar7_23'
           ,'ikar7_23'
           ,'E'
           ,''
           ,'Manuaalinen'
           ,'CSC Janne')
		   ,
		   (218
           ,'2019-01-31'
           ,'ikar7_24'
           ,-1
           ,'24'
           ,'24'
           ,'24'
           ,-1
           ,'Tuntematon'
           ,'Okänt'
           ,'Unknown'
           ,'ikar7_24'
           ,'ikar7_24'
           ,'E'
           ,''
           ,'Manuaalinen'
           ,'CSC Janne')
		   ,
		   (219
           ,'2019-01-31'
           ,'ikar7_25'
           ,-1
           ,'25-30 vuotiaat'
           ,'25-30 år'
           ,'Aged 25-29'
           ,-1
           ,'Tuntematon'
           ,'Okänt'
           ,'Unknown'
           ,'ikar7_25'
           ,'ikar7_25'
           ,'E'
           ,''
           ,'Manuaalinen'
           ,'CSC Janne')
		   ,
		   (220
           ,'2019-01-31'
           ,'ikar7_30'
           ,-1
           ,'30-34 vuotiaat'
           ,'30-34 år'
           ,'Aged 30-34'
           ,-1
           ,'Tuntematon'
           ,'Okänt'
           ,'Unknown'
           ,'ikar7_30'
           ,'ikar7_30'
           ,'E'
           ,''
           ,'Manuaalinen'
           ,'CSC Janne')
		   ,
		   (221
           ,'2019-01-31'
           ,'ikar7_35'
           ,-1
           ,'35-39 vuotiaat'
           ,'35-39 år'
           ,'Aged 35-39'
           ,-1
           ,'Tuntematon'
           ,'Okänt'
           ,'Unknown'
           ,'ikar7_35'
           ,'ikar7_35'
           ,'E'
           ,''
           ,'Manuaalinen'
           ,'CSC Janne')
		   ,
		   (222
           ,'2019-01-31'
           ,'ikar7_40'
           ,-1
           ,'40-44 vuotiaat'
           ,'40-44 år'
           ,'Aged 40-44'
           ,-1
           ,'Tuntematon'
           ,'Okänt'
           ,'Unknown'
           ,'ikar7_40'
           ,'ikar7_40'
           ,'E'
           ,''
           ,'Manuaalinen'
           ,'CSC Janne')
		   ,
		   (223
           ,'2019-01-31'
           ,'ikar7_45'
           ,-1
           ,'45-49 vuotiaat'
           ,'45-49 år'
           ,'Aged 45-49'
           ,-1
           ,'Tuntematon'
           ,'Okänt'
           ,'Unknown'
           ,'ikar7_45'
           ,'ikar7_45'
           ,'E'
           ,''
           ,'Manuaalinen'
           ,'CSC Janne')
		   ,
		   (224
           ,'2019-01-31'
           ,'ikar7_50'
           ,-1
           ,'50-54 vuotiaat'
           ,'50-54 år'
           ,'Aged 50-54'
           ,-1
           ,'Tuntematon'
           ,'Okänt'
           ,'Unknown'
           ,'ikar7_50'
           ,'ikar7_50'
           ,'E'
           ,''
           ,'Manuaalinen'
           ,'CSC Janne')
		   ,
		   (225
           ,'2019-01-31'
           ,'ikar7_55'
           ,-1
           ,'55-59 vuotiaat'
           ,'55-59 år'
           ,'Aged 55-59'
           ,-1
           ,'Tuntematon'
           ,'Okänt'
           ,'Unknown'
           ,'ikar7_55'
           ,'ikar7_55'
           ,'E'
           ,''
           ,'Manuaalinen'
           ,'CSC Janne')
		   ,
		   (226
           ,'2019-01-31'
           ,'ikar7_60'
           ,-1
           ,'60-64 vuotiaat'
           ,'60-64 år'
           ,'Aged 60-64'
           ,-1
           ,'Tuntematon'
           ,'Okänt'
           ,'Unknown'
           ,'ikar7_60'
           ,'ikar7_60'
           ,'E'
           ,''
           ,'Manuaalinen'
           ,'CSC Janne')
		   ,
		   (227
           ,'2019-01-31'
           ,'ikar7_65'
           ,-1
           ,'65 vuotiaat ja sitä vanhemmat'
           ,'65 år eller äldre'
           ,'Aged 65 or older'
           ,-1
           ,'Tuntematon'
           ,'Okänt'
           ,'Unknown'
           ,'ikar7_65'
           ,'ikar7_65'
           ,'E'
           ,''
           ,'Manuaalinen'
           ,'CSC Janne')
END

GO
USE [ANTERO]


