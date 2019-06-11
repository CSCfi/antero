USE [VipunenTK_lisatiedot]
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' and TABLE_NAME='Rahoitusmalli_korkeakoulut_opiskelijapalaute') BEGIN

/*
Päivitetään korkeakoulujen nimet oikeiksi

*/
UPDATE [dbo].[Rahoitusmalli_korkeakoulut_opiskelijapalaute] SET [korkeakoulu]='Yrkeshögskolan Arcada' WHERE [korkeakoulu]='Yrkehögskolan Arcada'; 
UPDATE [dbo].[Rahoitusmalli_korkeakoulut_opiskelijapalaute] SET [korkeakoulu]='Yrkeshögskolan Novia' WHERE [korkeakoulu]='Yrkehögskolan Novia'; 

END;
USE [ANTERO]
