USE [VipunenTK_lisatiedot]
GO
/******[dbo].[Rahoitusmalli_korkeakoulut_opiskelijapalaute]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rahoitusmalli_korkeakoulut_opiskelijapalaute]') AND type in (N'U'))
BEGIN
CREATE TABLE VipunenTK_lisatiedot.[dbo].[Rahoitusmalli_korkeakoulut_opiskelijapalaute](
	[tilastovuosi] [nvarchar](4) NULL,
	[korkeakoulu] [nvarchar](100) NULL,
	[korkeakoulu_koodi] [nvarchar](10) NULL,
	[sektori] [nvarchar](30) NULL,
	[opiskelijapalaute] [int] NULL,
	[tietolahde] [nvarchar](100) NULL,
	[user] [nvarchar](100) NULL,
	[luotu] [date] NULL,
) ON [PRIMARY]
END

IF NOT EXISTS 
		(SELECT * FROM VipunenTK_lisatiedot.dbo.Rahoitusmalli_korkeakoulut_opiskelijapalaute f
		)
BEGIN
INSERT INTO VipunenTK_lisatiedot.[dbo].[Rahoitusmalli_korkeakoulut_opiskelijapalaute]
	([tilastovuosi]
	,[korkeakoulu]
	,[korkeakoulu_koodi]
	,[sektori]
	,[opiskelijapalaute]
	,[tietolahde]
	,[user]
	,[luotu])
VALUES
('2015','Aalto-yliopisto','10076','Yliopisto',47315,'Manuaalinen','CSC Janne','2019-02-20'),
('2015','Helsingin yliopisto','01901','Yliopisto',99158,'Manuaalinen','CSC Janne','2019-02-20'),
('2015','Itä-Suomen yliopisto','10088','Yliopisto',56676,'Manuaalinen','CSC Janne','2019-02-20'),
('2015','Jyväskylän yliopisto','01906','Yliopisto',49705,'Manuaalinen','CSC Janne','2019-02-20'),
('2015','Lapin yliopisto','01918','Yliopisto',16390,'Manuaalinen','CSC Janne','2019-02-20'),
('2015','Lappeenrannan teknillinen yliopisto','01914','Yliopisto',14769,'Manuaalinen','CSC Janne','2019-02-20'),
('2015','Oulun yliopisto','01904','Yliopisto',73600,'Manuaalinen','CSC Janne','2019-02-20'),
('2015','Svenska handelshögskolan','01910','Yliopisto',10295,'Manuaalinen','CSC Janne','2019-02-20'),
('2015','Taideyliopisto','10103','Yliopisto',5457,'Manuaalinen','CSC Janne','2019-02-20'),
('2015','Tampereen teknillinen yliopisto','01915','Yliopisto',40758,'Manuaalinen','CSC Janne','2019-02-20'),
('2015','Tampereen yliopisto','01905','Yliopisto',60281,'Manuaalinen','CSC Janne','2019-02-20'),
('2015','Turun yliopisto','10089','Yliopisto',75103,'Manuaalinen','CSC Janne','2019-02-20'),
('2015','Vaasan yliopisto','01913','Yliopisto',15602,'Manuaalinen','CSC Janne','2019-02-20'),
('2015','Åbo Akademi','01903','Yliopisto',23859,'Manuaalinen','CSC Janne','2019-02-20'),
('2016','Aalto-yliopisto','10076','Yliopisto',68365,'Manuaalinen','CSC Janne','2019-02-20'),
('2016','Helsingin yliopisto','01901','Yliopisto',99127,'Manuaalinen','CSC Janne','2019-02-20'),
('2016','Itä-Suomen yliopisto','10088','Yliopisto',56329,'Manuaalinen','CSC Janne','2019-02-20'),
('2016','Jyväskylän yliopisto','01906','Yliopisto',46323,'Manuaalinen','CSC Janne','2019-02-20'),
('2016','Lapin yliopisto','01918','Yliopisto',17928,'Manuaalinen','CSC Janne','2019-02-20'),
('2016','Lappeenrannan teknillinen yliopisto','01914','Yliopisto',16089,'Manuaalinen','CSC Janne','2019-02-20'),
('2016','Oulun yliopisto','01904','Yliopisto',62627,'Manuaalinen','CSC Janne','2019-02-20'),
('2016','Svenska handelshögskolan','01910','Yliopisto',9461,'Manuaalinen','CSC Janne','2019-02-20'),
('2016','Taideyliopisto','10103','Yliopisto',4740,'Manuaalinen','CSC Janne','2019-02-20'),
('2016','Tampereen teknillinen yliopisto','01915','Yliopisto',39238,'Manuaalinen','CSC Janne','2019-02-20'),
('2016','Tampereen yliopisto','01905','Yliopisto',49048,'Manuaalinen','CSC Janne','2019-02-20'),
('2016','Turun yliopisto','10089','Yliopisto',59002,'Manuaalinen','CSC Janne','2019-02-20'),
('2016','Vaasan yliopisto','01913','Yliopisto',16804,'Manuaalinen','CSC Janne','2019-02-20'),
('2016','Åbo Akademi','01903','Yliopisto',27650,'Manuaalinen','CSC Janne','2019-02-20'),
('2017','Aalto-yliopisto','10076','Yliopisto',48717,'Manuaalinen','CSC Janne','2019-02-20'),
('2017','Helsingin yliopisto','01901','Yliopisto',99267,'Manuaalinen','CSC Janne','2019-02-20'),
('2017','Itä-Suomen yliopisto','10088','Yliopisto',53913,'Manuaalinen','CSC Janne','2019-02-20'),
('2017','Jyväskylän yliopisto','01906','Yliopisto',49631,'Manuaalinen','CSC Janne','2019-02-20'),
('2017','Lapin yliopisto','01918','Yliopisto',18531,'Manuaalinen','CSC Janne','2019-02-20'),
('2017','Lappeenrannan teknillinen yliopisto','01914','Yliopisto',17338,'Manuaalinen','CSC Janne','2019-02-20'),
('2017','Oulun yliopisto','01904','Yliopisto',53134,'Manuaalinen','CSC Janne','2019-02-20'),
('2017','Svenska handelshögskolan','01910','Yliopisto',11813,'Manuaalinen','CSC Janne','2019-02-20'),
('2017','Taideyliopisto','10103','Yliopisto',7086,'Manuaalinen','CSC Janne','2019-02-20'),
('2017','Tampereen teknillinen yliopisto','01915','Yliopisto',28238,'Manuaalinen','CSC Janne','2019-02-20'),
('2017','Tampereen yliopisto','01905','Yliopisto',50190,'Manuaalinen','CSC Janne','2019-02-20'),
('2017','Turun yliopisto','10089','Yliopisto',52854,'Manuaalinen','CSC Janne','2019-02-20'),
('2017','Vaasan yliopisto','01913','Yliopisto',26356,'Manuaalinen','CSC Janne','2019-02-20'),
('2017','Åbo Akademi','01903','Yliopisto',20638,'Manuaalinen','CSC Janne','2019-02-20'),
('2015','Arcada yh.','02535','Ammattikorkeakoulu',58324,'Manuaalinen','CSC Janne','2019-02-20'),
('2015','Centria amk ','02536','Ammattikorkeakoulu',71485,'Manuaalinen','CSC Janne','2019-02-20'),
('2015','Diakonia-amk','02623','Ammattikorkeakoulu',80046,'Manuaalinen','CSC Janne','2019-02-20'),
('2015','Haaga-Helia amk ','10056','Ammattikorkeakoulu',150293,'Manuaalinen','CSC Janne','2019-02-20'),
('2015','Humanistinen amk','02631','Ammattikorkeakoulu',38376,'Manuaalinen','CSC Janne','2019-02-20'),
('2015','Hämeen amk','02467','Ammattikorkeakoulu',114765,'Manuaalinen','CSC Janne','2019-02-20'),
('2015','Jyväskylän amk','02504','Ammattikorkeakoulu',157013,'Manuaalinen','CSC Janne','2019-02-20'),
('2015','Kaakkois-Suomen amk','10118','Ammattikorkeakoulu',200270,'Manuaalinen','CSC Janne','2019-02-20'),
('2015','Kajaanin amk','02473','Ammattikorkeakoulu',37022,'Manuaalinen','CSC Janne','2019-02-20'),
('2015','Karelia-amk','02469','Ammattikorkeakoulu',69231,'Manuaalinen','CSC Janne','2019-02-20'),
('2015','Lahden amk','02470','Ammattikorkeakoulu',107024,'Manuaalinen','CSC Janne','2019-02-20'),
('2015','Lapin AMK','10108','Ammattikorkeakoulu',128324,'Manuaalinen','CSC Janne','2019-02-20'),
('2015','Laurea-amk','02629','Ammattikorkeakoulu',190340,'Manuaalinen','CSC Janne','2019-02-20'),
('2015','Metropolia amk','10065','Ammattikorkeakoulu',307404,'Manuaalinen','CSC Janne','2019-02-20'),
('2015','Oulun seudun amk','02471','Ammattikorkeakoulu',153874,'Manuaalinen','CSC Janne','2019-02-20'),
('2015','Saimaan amk','02609','Ammattikorkeakoulu',74420,'Manuaalinen','CSC Janne','2019-02-20'),
('2015','Satakunnan amk','02507','Ammattikorkeakoulu',124364,'Manuaalinen','CSC Janne','2019-02-20'),
('2015','Savonia-amk','02537','Ammattikorkeakoulu',118037,'Manuaalinen','CSC Janne','2019-02-20'),
('2015','Seinäjoen amk','02472','Ammattikorkeakoulu',119442,'Manuaalinen','CSC Janne','2019-02-20'),
('2015','Tampereen amk','02630','Ammattikorkeakoulu',190742,'Manuaalinen','CSC Janne','2019-02-20'),
('2015','Turun amk ','02509','Ammattikorkeakoulu',196697,'Manuaalinen','CSC Janne','2019-02-20'),
('2015','Vaasan amk ','02627','Ammattikorkeakoulu',64447,'Manuaalinen','CSC Janne','2019-02-20'),
('2015','Yh Novia','10066','Ammattikorkeakoulu',82172,'Manuaalinen','CSC Janne','2019-02-20'),
('2016','Arcada yh.','02535','Ammattikorkeakoulu',49868,'Manuaalinen','CSC Janne','2019-02-20'),
('2016','Centria amk ','02536','Ammattikorkeakoulu',65452,'Manuaalinen','CSC Janne','2019-02-20'),
('2016','Diakonia-amk','02623','Ammattikorkeakoulu',63412,'Manuaalinen','CSC Janne','2019-02-20'),
('2016','Haaga-Helia amk ','10056','Ammattikorkeakoulu',289540,'Manuaalinen','CSC Janne','2019-02-20'),
('2016','Humanistinen amk','02631','Ammattikorkeakoulu',43745,'Manuaalinen','CSC Janne','2019-02-20'),
('2016','Hämeen amk','02467','Ammattikorkeakoulu',126393,'Manuaalinen','CSC Janne','2019-02-20'),
('2016','Jyväskylän amk','02504','Ammattikorkeakoulu',151278,'Manuaalinen','CSC Janne','2019-02-20'),
('2016','Kaakkois-Suomen amk','10118','Ammattikorkeakoulu',184240,'Manuaalinen','CSC Janne','2019-02-20'),
('2016','Kajaanin amk','02473','Ammattikorkeakoulu',38419,'Manuaalinen','CSC Janne','2019-02-20'),
('2016','Karelia-amk','02469','Ammattikorkeakoulu',81228,'Manuaalinen','CSC Janne','2019-02-20'),
('2016','Lahden amk','02470','Ammattikorkeakoulu',110501,'Manuaalinen','CSC Janne','2019-02-20'),
('2016','Lapin AMK','10108','Ammattikorkeakoulu',133650,'Manuaalinen','CSC Janne','2019-02-20'),
('2016','Laurea-amk','02629','Ammattikorkeakoulu',231685,'Manuaalinen','CSC Janne','2019-02-20'),
('2016','Metropolia amk','10065','Ammattikorkeakoulu',269222,'Manuaalinen','CSC Janne','2019-02-20'),
('2016','Oulun seudun amk','02471','Ammattikorkeakoulu',145825,'Manuaalinen','CSC Janne','2019-02-20'),
('2016','Saimaan amk','02609','Ammattikorkeakoulu',63404,'Manuaalinen','CSC Janne','2019-02-20'),
('2016','Satakunnan amk','02507','Ammattikorkeakoulu',144162,'Manuaalinen','CSC Janne','2019-02-20'),
('2016','Savonia-amk','02537','Ammattikorkeakoulu',119667,'Manuaalinen','CSC Janne','2019-02-20'),
('2016','Seinäjoen amk','02472','Ammattikorkeakoulu',117184,'Manuaalinen','CSC Janne','2019-02-20'),
('2016','Tampereen amk','02630','Ammattikorkeakoulu',250542,'Manuaalinen','CSC Janne','2019-02-20'),
('2016','Turun amk ','02509','Ammattikorkeakoulu',215359,'Manuaalinen','CSC Janne','2019-02-20'),
('2016','Vaasan amk ','02627','Ammattikorkeakoulu',53189,'Manuaalinen','CSC Janne','2019-02-20'),
('2016','Yh Novia','10066','Ammattikorkeakoulu',98142,'Manuaalinen','CSC Janne','2019-02-20'),
('2017','Arcada yh.','02535','Ammattikorkeakoulu',61110,'Manuaalinen','CSC Janne','2019-02-20'),
('2017','Centria amk ','02536','Ammattikorkeakoulu',60617,'Manuaalinen','CSC Janne','2019-02-20'),
('2017','Diakonia-amk','02623','Ammattikorkeakoulu',85241,'Manuaalinen','CSC Janne','2019-02-20'),
('2017','Haaga-Helia amk ','10056','Ammattikorkeakoulu',282188,'Manuaalinen','CSC Janne','2019-02-20'),
('2017','Humanistinen amk','02631','Ammattikorkeakoulu',45012,'Manuaalinen','CSC Janne','2019-02-20'),
('2017','Hämeen amk','02467','Ammattikorkeakoulu',110206,'Manuaalinen','CSC Janne','2019-02-20'),
('2017','Jyväskylän amk','02504','Ammattikorkeakoulu',171653,'Manuaalinen','CSC Janne','2019-02-20'),
('2017','Kaakkois-Suomen amk','10118','Ammattikorkeakoulu',223130,'Manuaalinen','CSC Janne','2019-02-20'),
('2017','Kajaanin amk','02473','Ammattikorkeakoulu',41585,'Manuaalinen','CSC Janne','2019-02-20'),
('2017','Karelia-amk','02469','Ammattikorkeakoulu',98659,'Manuaalinen','CSC Janne','2019-02-20'),
('2017','Lahden amk','02470','Ammattikorkeakoulu',120184,'Manuaalinen','CSC Janne','2019-02-20'),
('2017','Lapin AMK','10108','Ammattikorkeakoulu',141869,'Manuaalinen','CSC Janne','2019-02-20'),
('2017','Laurea-amk','02629','Ammattikorkeakoulu',249158,'Manuaalinen','CSC Janne','2019-02-20'),
('2017','Metropolia amk','10065','Ammattikorkeakoulu',419505,'Manuaalinen','CSC Janne','2019-02-20'),
('2017','Oulun seudun amk','02471','Ammattikorkeakoulu',128811,'Manuaalinen','CSC Janne','2019-02-20'),
('2017','Saimaan amk','02609','Ammattikorkeakoulu',80087,'Manuaalinen','CSC Janne','2019-02-20'),
('2017','Satakunnan amk','02507','Ammattikorkeakoulu',123428,'Manuaalinen','CSC Janne','2019-02-20'),
('2017','Savonia-amk','02537','Ammattikorkeakoulu',130244,'Manuaalinen','CSC Janne','2019-02-20'),
('2017','Seinäjoen amk','02472','Ammattikorkeakoulu',130069,'Manuaalinen','CSC Janne','2019-02-20'),
('2017','Tampereen amk','02630','Ammattikorkeakoulu',250719,'Manuaalinen','CSC Janne','2019-02-20'),
('2017','Turun amk ','02509','Ammattikorkeakoulu',188984,'Manuaalinen','CSC Janne','2019-02-20'),
('2017','Vaasan amk ','02627','Ammattikorkeakoulu',70038,'Manuaalinen','CSC Janne','2019-02-20'),
('2017','Yh Novia','10066','Ammattikorkeakoulu',97456,'Manuaalinen','CSC Janne','2019-02-20')

END

GO
USE [ANTERO]