USE [VipunenTK_lisatiedot]
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dbo' and TABLE_NAME='Rahoitusmalli_korkeakoulut_opiskelijapalaute') BEGIN

/*
Päivitetään korkeakoulujen nimet oikeiksi

*/
UPDATE [dbo].[Rahoitusmalli_korkeakoulut_opiskelijapalaute] SET [korkeakoulu]='Yrkehögskolan Arcada' WHERE [korkeakoulu]='Arcada yh.'; 
UPDATE [dbo].[Rahoitusmalli_korkeakoulut_opiskelijapalaute] SET [korkeakoulu]='Centria-ammattikorkeakoulu' WHERE [korkeakoulu]='Centria amk '; 
UPDATE [dbo].[Rahoitusmalli_korkeakoulut_opiskelijapalaute] SET [korkeakoulu]='Diakonia-ammattikorkeakoulu' WHERE [korkeakoulu]='Diakonia-amk'; 
UPDATE [dbo].[Rahoitusmalli_korkeakoulut_opiskelijapalaute] SET [korkeakoulu]='Haaga-Helia ammattikorkeakoulu' WHERE [korkeakoulu]='Haaga-Helia amk '; 
UPDATE [dbo].[Rahoitusmalli_korkeakoulut_opiskelijapalaute] SET [korkeakoulu]='Humanistinen ammattikorkeakoulu' WHERE [korkeakoulu]='Humanistinen amk'; 
UPDATE [dbo].[Rahoitusmalli_korkeakoulut_opiskelijapalaute] SET [korkeakoulu]='Hämeen ammattikorkeakoulu' WHERE [korkeakoulu]='Hämeen amk'; 
UPDATE [dbo].[Rahoitusmalli_korkeakoulut_opiskelijapalaute] SET [korkeakoulu]='Jyväskylän ammattikorkeakoulu' WHERE [korkeakoulu]='Jyväskylän amk'; 
UPDATE [dbo].[Rahoitusmalli_korkeakoulut_opiskelijapalaute] SET [korkeakoulu]='Kaakkois-Suomen ammattikorkeakoulu' WHERE [korkeakoulu]='Kaakkois-Suomen amk'; 
UPDATE [dbo].[Rahoitusmalli_korkeakoulut_opiskelijapalaute] SET [korkeakoulu]='Kajaanin ammattikorkeakoulu' WHERE [korkeakoulu]='Kajaanin amk'; 
UPDATE [dbo].[Rahoitusmalli_korkeakoulut_opiskelijapalaute] SET [korkeakoulu]='Karelia-ammattikorkeakoulu' WHERE [korkeakoulu]='Karelia-amk'; 
UPDATE [dbo].[Rahoitusmalli_korkeakoulut_opiskelijapalaute] SET [korkeakoulu]='Lahden ammattikorkeakoulu' WHERE [korkeakoulu]='Lahden amk'; 
UPDATE [dbo].[Rahoitusmalli_korkeakoulut_opiskelijapalaute] SET [korkeakoulu]='Lapin ammattikorkeakoulu' WHERE [korkeakoulu]='Lapin AMK'; 
UPDATE [dbo].[Rahoitusmalli_korkeakoulut_opiskelijapalaute] SET [korkeakoulu]='Laurea-ammattikorkeakoulu' WHERE [korkeakoulu]='Laurea-amk'; 
UPDATE [dbo].[Rahoitusmalli_korkeakoulut_opiskelijapalaute] SET [korkeakoulu]='Metropolia Ammattikorkeakoulu' WHERE [korkeakoulu]='Metropolia amk'; 
UPDATE [dbo].[Rahoitusmalli_korkeakoulut_opiskelijapalaute] SET [korkeakoulu]='Oulun ammattikorkeakoulu' WHERE [korkeakoulu]='Oulun seudun amk'; 
UPDATE [dbo].[Rahoitusmalli_korkeakoulut_opiskelijapalaute] SET [korkeakoulu]='Saimaan ammattikorkeakoulu' WHERE [korkeakoulu]='Saimaan amk'; 
UPDATE [dbo].[Rahoitusmalli_korkeakoulut_opiskelijapalaute] SET [korkeakoulu]='Satakunnan ammattikorkeakoulu' WHERE [korkeakoulu]='Satakunnan amk'; 
UPDATE [dbo].[Rahoitusmalli_korkeakoulut_opiskelijapalaute] SET [korkeakoulu]='Savonia-ammattikorkeakoulu' WHERE [korkeakoulu]='Savonia-amk'; 
UPDATE [dbo].[Rahoitusmalli_korkeakoulut_opiskelijapalaute] SET [korkeakoulu]='Seinäjoen ammattikorkeakoulu' WHERE [korkeakoulu]='Seinäjoen amk'; 
UPDATE [dbo].[Rahoitusmalli_korkeakoulut_opiskelijapalaute] SET [korkeakoulu]='Tampereen ammattikorkeakoulu' WHERE [korkeakoulu]='Tampereen amk'; 
UPDATE [dbo].[Rahoitusmalli_korkeakoulut_opiskelijapalaute] SET [korkeakoulu]='Turun ammattikorkeakoulu' WHERE [korkeakoulu]='Turun amk '; 
UPDATE [dbo].[Rahoitusmalli_korkeakoulut_opiskelijapalaute] SET [korkeakoulu]='Vaasan ammattikorkeakoulu' WHERE [korkeakoulu]='Vaasan amk '; 
UPDATE [dbo].[Rahoitusmalli_korkeakoulut_opiskelijapalaute] SET [korkeakoulu]='Yrkehögskolan Novia' WHERE [korkeakoulu]='Yh Novia'; 
UPDATE [dbo].[Rahoitusmalli_korkeakoulut_opiskelijapalaute] SET [korkeakoulu]='Lappeenrannan-Lahden teknillinen yliopisto' WHERE [korkeakoulu]='Lappeenrannan teknillinen yliopisto'; END;

USE [ANTERO]
