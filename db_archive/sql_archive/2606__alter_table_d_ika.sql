USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_ika]    Script Date: 1.11.2019 15:17:49 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_d_ika]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_ika]') AND type in (N'U'))
ALTER TABLE [dw].[d_ika] DROP CONSTRAINT IF EXISTS [DF__d_ika__username]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_ika]') AND type in (N'U'))
ALTER TABLE [dw].[d_ika] DROP CONSTRAINT IF EXISTS [DF__d_ika__loadtime]
GO
/****** Object:  Table [dw].[d_ika]    Script Date: 1.11.2019 15:17:49 ******/
DROP TABLE IF EXISTS [dw].[d_ika]
GO
/****** Object:  Table [dw].[d_ika]    Script Date: 1.11.2019 15:17:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_ika]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_ika](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[ika_avain] [varchar](6) NULL,
	[ika_fi] [nvarchar](100) NULL,
	[ika_sv] [nvarchar](100) NULL,
	[ika_en] [nvarchar](100) NULL,
	[ikaryhma1_fi] [nvarchar](100) NULL,
	[ikaryhma1_sv] [nvarchar](100) NULL,
	[ikaryhma1_en] [nvarchar](100) NULL,
	[ikaryhma2_fi] [nvarchar](100) NULL,
	[ikaryhma2_sv] [nvarchar](100) NULL,
	[ikaryhma2_en] [nvarchar](100) NULL,
	[ikaryhma3_fi] [nvarchar](100) NULL,
	[ikaryhma3_sv] [nvarchar](100) NULL,
	[ikaryhma3_en] [nvarchar](100) NULL,
	[ikaryhma4_fi] [nvarchar](100) NULL,
	[ikaryhma4_sv] [nvarchar](100) NULL,
	[ikaryhma4_en] [nvarchar](100) NULL,
	[jarjestys_ika] [nvarchar](100) NULL,
	[jarjestys_ikaryhma1] [nvarchar](100) NULL,
	[jarjestys_ikaryhma2] [nvarchar](100) NULL,
	[jarjestys_ikaryhma3] [nvarchar](100) NULL,
	[jarjestys_ikaryhma4] [nvarchar](100) NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_ika] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__d_ika__loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_ika] ADD  CONSTRAINT [DF__d_ika__loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__d_ika__username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_ika] ADD  CONSTRAINT [DF__d_ika__username]  DEFAULT (suser_name()) FOR [username]
END

GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_ika]    Script Date: 1.11.2019 15:17:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_ika]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_ika] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_d_ika] AS

TRUNCATE TABLE dw.d_ika

SET IDENTITY_INSERT dw.d_ika ON
INSERT dw.d_ika (id, ika_avain, ika_fi, ika_sv, ika_en,  jarjestys_ika, source)

VALUES 
(-1,-1,'Tieto puuttuu','Information saknas','Missing data','999','manuaalinen')

INSERT dw.d_ika (id, ika_avain, ika_fi, ika_sv, ika_en,  jarjestys_ika, source)
VALUES 
(1,1,1,1,1,1,'manuaalinen'),
(2,2,2,2,2,2,'manuaalinen'),
(3,3,3,3,3,3,'manuaalinen'),
(4,4,4,4,4,4,'manuaalinen'),
(5,5,5,5,5,5,'manuaalinen'),
(6,6,6,6,6,6,'manuaalinen'),
(7,7,7,7,7,7,'manuaalinen'),
(8,8,8,8,8,8,'manuaalinen'),
(9,9,9,9,9,9,'manuaalinen'),
(10,10,10,10,10,10,'manuaalinen'),
(11,11,11,11,11,11,'manuaalinen'),
(12,12,12,12,12,12,'manuaalinen'),
(13,13,13,13,13,13,'manuaalinen'),
(14,14,14,14,14,14,'manuaalinen'),
(15,15,15,15,15,15,'manuaalinen'),
(16,16,16,16,16,16,'manuaalinen'),
(17,17,17,17,17,17,'manuaalinen'),
(18,18,18,18,18,18,'manuaalinen'),
(19,19,19,19,19,19,'manuaalinen'),
(20,20,20,20,20,20,'manuaalinen'),
(21,21,21,21,21,21,'manuaalinen'),
(22,22,22,22,22,22,'manuaalinen'),
(23,23,23,23,23,23,'manuaalinen'),
(24,24,24,24,24,24,'manuaalinen'),
(25,25,25,25,25,25,'manuaalinen'),
(26,26,26,26,26,26,'manuaalinen'),
(27,27,27,27,27,27,'manuaalinen'),
(28,28,28,28,28,28,'manuaalinen'),
(29,29,29,29,29,29,'manuaalinen'),
(30,30,30,30,30,30,'manuaalinen'),
(31,31,31,31,31,31,'manuaalinen'),
(32,32,32,32,32,32,'manuaalinen'),
(33,33,33,33,33,33,'manuaalinen'),
(34,34,34,34,34,34,'manuaalinen'),
(35,35,35,35,35,35,'manuaalinen'),
(36,36,36,36,36,36,'manuaalinen'),
(37,37,37,37,37,37,'manuaalinen'),
(38,38,38,38,38,38,'manuaalinen'),
(39,39,39,39,39,39,'manuaalinen'),
(40,40,40,40,40,40,'manuaalinen'),
(41,41,41,41,41,41,'manuaalinen'),
(42,42,42,42,42,42,'manuaalinen'),
(43,43,43,43,43,43,'manuaalinen'),
(44,44,44,44,44,44,'manuaalinen'),
(45,45,45,45,45,45,'manuaalinen'),
(46,46,46,46,46,46,'manuaalinen'),
(47,47,47,47,47,47,'manuaalinen'),
(48,48,48,48,48,48,'manuaalinen'),
(49,49,49,49,49,49,'manuaalinen'),
(50,50,50,50,50,50,'manuaalinen'),
(51,51,51,51,51,51,'manuaalinen'),
(52,52,52,52,52,52,'manuaalinen'),
(53,53,53,53,53,53,'manuaalinen'),
(54,54,54,54,54,54,'manuaalinen'),
(55,55,55,55,55,55,'manuaalinen'),
(56,56,56,56,56,56,'manuaalinen'),
(57,57,57,57,57,57,'manuaalinen'),
(58,58,58,58,58,58,'manuaalinen'),
(59,59,59,59,59,59,'manuaalinen'),
(60,60,60,60,60,60,'manuaalinen'),
(61,61,61,61,61,61,'manuaalinen'),
(62,62,62,62,62,62,'manuaalinen'),
(63,63,63,63,63,63,'manuaalinen'),
(64,64,64,64,64,64,'manuaalinen'),
(65,65,65,65,65,65,'manuaalinen'),
(66,66,66,66,66,66,'manuaalinen'),
(67,67,67,67,67,67,'manuaalinen'),
(68,68,68,68,68,68,'manuaalinen'),
(69,69,69,69,69,69,'manuaalinen'),
(70,70,70,70,70,70,'manuaalinen'),
(71,71,71,71,71,71,'manuaalinen'),
(72,72,72,72,72,72,'manuaalinen'),
(73,73,73,73,73,73,'manuaalinen'),
(74,74,74,74,74,74,'manuaalinen'),
(75,75,75,75,75,75,'manuaalinen'),
(76,76,76,76,76,76,'manuaalinen'),
(77,77,77,77,77,77,'manuaalinen'),
(78,78,78,78,78,78,'manuaalinen'),
(79,79,79,79,79,79,'manuaalinen'),
(80,80,80,80,80,80,'manuaalinen'),
(81,81,81,81,81,81,'manuaalinen'),
(82,82,82,82,82,82,'manuaalinen'),
(83,83,83,83,83,83,'manuaalinen'),
(84,84,84,84,84,84,'manuaalinen'),
(85,85,85,85,85,85,'manuaalinen'),
(86,86,86,86,86,86,'manuaalinen'),
(87,87,87,87,87,87,'manuaalinen'),
(88,88,88,88,88,88,'manuaalinen'),
(89,89,89,89,89,89,'manuaalinen'),
(90,90,90,90,90,90,'manuaalinen'),
(91,91,91,91,91,91,'manuaalinen'),
(92,92,92,92,92,92,'manuaalinen'),
(93,93,93,93,93,93,'manuaalinen'),
(94,94,94,94,94,94,'manuaalinen'),
(95,95,95,95,95,95,'manuaalinen'),
(96,96,96,96,96,96,'manuaalinen'),
(97,97,97,97,97,97,'manuaalinen'),
(98,98,98,98,98,98,'manuaalinen'),
(99,99,99,99,99,99,'manuaalinen'),
(100,100,100,100,100,100,'manuaalinen')

UPDATE dw.d_ika 
SET 
ikaryhma1_fi = 
	CASE 
		when ika_avain > 0 and ika_avain < 15 then '14–vuotiaat ja sitä nuoremmat'
		when ika_avain = 15 then '15'
		when ika_avain = 16 then '16'
		when ika_avain = 17 then '17'
		when ika_avain = 18 then '18'
		when ika_avain = 19 then '19'
		when ika_avain = 20 then '20'
		when ika_avain = 21 then '21'
		when ika_avain = 22 then '22'
		when ika_avain = 23 then '23'
		when ika_avain = 24 then '24'
		when ika_avain >= 25 and ika_avain <= 29 then '25–29-vuotiaat'
		when ika_avain >= 30 and ika_avain <= 34 then '30–34-vuotiaat'
		when ika_avain >= 35 and ika_avain <= 39 then '35–39-vuotiaat'
		when ika_avain >= 40 and ika_avain <= 44 then '40–44-vuotiaat'
		when ika_avain >= 45 and ika_avain <= 49 then '45–49-vuotiaat'
		when ika_avain >= 50 and ika_avain <= 54 then '50–54-vuotiaat'
		when ika_avain >= 55 and ika_avain <= 59 then '55–59-vuotiaat'
        when ika_avain >= 60 and ika_avain <= 64 then '60–64-vuotiaat'
		when ika_avain >= 65 then '65–vuotiaat ja sitä vanhemmat'
		else 'Tieto puuttuu'
	END 
,ikaryhma1_sv = 
	CASE 
		when ika_avain > 0 and ika_avain < 15 then '14 år eller yngre'
		when ika_avain = 15 then '15'
		when ika_avain = 16 then '16'
		when ika_avain = 17 then '17'
		when ika_avain = 18 then '18'
		when ika_avain = 19 then '19'
		when ika_avain = 20 then '20'
		when ika_avain = 21 then '21'
		when ika_avain = 22 then '22'
		when ika_avain = 23 then '23'
		when ika_avain = 24 then '24'
		when ika_avain >= 25 and ika_avain <= 29 then '25–29 år'
		when ika_avain >= 30 and ika_avain <= 34 then '30–34 år'
		when ika_avain >= 35 and ika_avain <= 39 then '35–39 år'
		when ika_avain >= 40 and ika_avain <= 44 then '40–44 år'
		when ika_avain >= 45 and ika_avain <= 49 then '45–49 år'
		when ika_avain >= 50 and ika_avain <= 54 then '50–54 år'
		when ika_avain >= 55 and ika_avain <= 59 then '55–59 år'
        when ika_avain >= 60 and ika_avain <= 64 then '60–64 år'
		when ika_avain >= 65 then '65 år eller äldre'
		else 'Information saknas'
	END
,ikaryhma1_en = 
	CASE 
		when ika_avain > 0 and ika_avain < 15 then 'Aged 14 or under'
		when ika_avain = 15 then '15'
		when ika_avain = 16 then '16'
		when ika_avain = 17 then '17'
		when ika_avain = 18 then '18'
		when ika_avain = 19 then '19'
		when ika_avain = 20 then '20'
		when ika_avain = 21 then '21'
		when ika_avain = 22 then '22'
		when ika_avain = 23 then '23'
		when ika_avain = 24 then '24'
		when ika_avain >= 25 and ika_avain <= 29 then 'Aged 25–29'
		when ika_avain >= 30 and ika_avain <= 34 then 'Aged 30–34'
		when ika_avain >= 35 and ika_avain <= 39 then 'Aged 35–39'
		when ika_avain >= 40 and ika_avain <= 44 then 'Aged 40–44'
		when ika_avain >= 45 and ika_avain <= 49 then 'Aged 45–49'
		when ika_avain >= 50 and ika_avain <= 54 then 'Aged 50–54'
		when ika_avain >= 55 and ika_avain <= 59 then 'Aged 55–59'
        when ika_avain >= 60 and ika_avain <= 64 then 'Aged 60–64'
		when ika_avain >= 65 then 'Aged 65 or older'
		else 'Missing data'
	END
,jarjestys_ikaryhma1 =
	CASE 
		when ika_avain > 0 and ika_avain < 15 then '14'
		when ika_avain = 15 then '15'
		when ika_avain = 16 then '16'
		when ika_avain = 17 then '17'
		when ika_avain = 18 then '18'
		when ika_avain = 19 then '19'
		when ika_avain = 20 then '20'
		when ika_avain = 21 then '21'
		when ika_avain = 22 then '22'
		when ika_avain = 23 then '23'
		when ika_avain = 24 then '24'
		when ika_avain >= 25 and ika_avain <= 29 then '25'
		when ika_avain >= 30 and ika_avain <= 34 then '30'
		when ika_avain >= 35 and ika_avain <= 39 then '35'
		when ika_avain >= 40 and ika_avain <= 44 then '40'
		when ika_avain >= 45 and ika_avain <= 49 then '45'
		when ika_avain >= 50 and ika_avain <= 54 then '50'
		when ika_avain >= 55 and ika_avain <= 59 then '55'
        when ika_avain >= 60 and ika_avain <= 64 then '60'
		when ika_avain >= 65 then '65'
		else '999'
	END
--ikaryhma2
,ikaryhma2_fi = 
	CASE 
		when ika_avain > 0 and ika_avain < 19 then '18–vuotiaat ja sitä nuoremmat'
		when ika_avain = 19 then '19'
		when ika_avain = 20 then '20'
		when ika_avain = 21 then '21'
		when ika_avain = 22 then '22'
		when ika_avain = 23 then '23'
		when ika_avain = 24 then '24'
		when ika_avain >= 25 and ika_avain <= 29 then '25–29-vuotiaat'
		when ika_avain >= 30 and ika_avain <= 34 then '30–34-vuotiaat'
		when ika_avain >= 35 and ika_avain <= 39 then '35–39-vuotiaat'
		when ika_avain >= 40 and ika_avain <= 44 then '40–44-vuotiaat'
		when ika_avain >= 45 and ika_avain <= 49 then '45–49-vuotiaat'
		when ika_avain >= 50 and ika_avain <= 54 then '50–54-vuotiaat'
		when ika_avain >= 55 and ika_avain <= 59 then '55–59-vuotiaat'
        when ika_avain >= 60 and ika_avain <= 64 then '60–64-vuotiaat'
		when ika_avain >= 65 then '65–vuotiaat ja sitä vanhemmat'
		else 'Tieto puuttuu'
	END 
,ikaryhma2_sv = 
	CASE 
		when ika_avain > 0 and ika_avain < 19 then '18 år eller yngre'
		when ika_avain = 19 then '19'
		when ika_avain = 20 then '20'
		when ika_avain = 21 then '21'
		when ika_avain = 22 then '22'
		when ika_avain = 23 then '23'
		when ika_avain = 24 then '24'
		when ika_avain >= 25 and ika_avain <= 29 then '25–29 år'
		when ika_avain >= 30 and ika_avain <= 34 then '30–34 år'
		when ika_avain >= 35 and ika_avain <= 39 then '35–39 år'
		when ika_avain >= 40 and ika_avain <= 44 then '40–44 år'
		when ika_avain >= 45 and ika_avain <= 49 then '45–49 år'
		when ika_avain >= 50 and ika_avain <= 54 then '50–54 år'
		when ika_avain >= 55 and ika_avain <= 59 then '55–59 år'
        when ika_avain >= 60 and ika_avain <= 64 then '60–64 år'
		when ika_avain >= 65 then '65 år eller äldre'
		else 'Information saknas'
	END 
,ikaryhma2_en = 
	CASE 
		when ika_avain > 0 and ika_avain < 19 then 'Aged 18 or under'
		when ika_avain = 19 then '19'
		when ika_avain = 20 then '20'
		when ika_avain = 21 then '21'
		when ika_avain = 22 then '22'
		when ika_avain = 23 then '23'
		when ika_avain = 24 then '24'
		when ika_avain >= 25 and ika_avain <= 29 then 'Aged 25–29'
		when ika_avain >= 30 and ika_avain <= 34 then 'Aged 30–34'
		when ika_avain >= 35 and ika_avain <= 39 then 'Aged 35–39'
		when ika_avain >= 40 and ika_avain <= 44 then 'Aged 40–44'
		when ika_avain >= 45 and ika_avain <= 49 then 'Aged 45–49'
		when ika_avain >= 50 and ika_avain <= 54 then 'Aged 50–54'
		when ika_avain >= 55 and ika_avain <= 59 then 'Aged 55–59'
        when ika_avain >= 60 and ika_avain <= 64 then 'Aged 60–64'
		when ika_avain >= 65 then 'Aged 65 or older'
		else 'Missing data'
	END 
,jarjestys_ikaryhma2 =
	CASE
		when ika_avain > 0 and ika_avain < 19 then '18'
		when ika_avain = 19 then '19'
		when ika_avain = 20 then '20'
		when ika_avain = 21 then '21'
		when ika_avain = 22 then '22'
		when ika_avain = 23 then '23'
		when ika_avain = 24 then '24'
		when ika_avain >= 25 and ika_avain <= 29 then '25'
		when ika_avain >= 30 and ika_avain <= 34 then '30'
		when ika_avain >= 35 and ika_avain <= 39 then '35'
		when ika_avain >= 40 and ika_avain <= 44 then '40'
		when ika_avain >= 45 and ika_avain <= 49 then '45'
		when ika_avain >= 50 and ika_avain <= 54 then '50'
		when ika_avain >= 55 and ika_avain <= 59 then '55'
        when ika_avain >= 60 and ika_avain <= 64 then '60'
		when ika_avain >= 65 then '65'
		else '999'
	END

--ikaryhma3
,ikaryhma3_fi = 
	CASE 
		when ika_avain >= 0  and ika_avain <= 14 then '14–vuotiaat ja sitä nuoremmat'
		when ika_avain >= 15 and ika_avain <= 19 then '15–19-vuotiaat'
		when ika_avain >= 20 and ika_avain <= 24 then '20–24-vuotiaat'
		when ika_avain >= 25 and ika_avain <= 29 then '25–29-vuotiaat'
		when ika_avain >= 30 and ika_avain <= 34 then '30–34-vuotiaat'
		when ika_avain >= 35 and ika_avain <= 39 then '35–39-vuotiaat'
		when ika_avain >= 40 and ika_avain <= 44 then '40–44-vuotiaat'
		when ika_avain >= 45 and ika_avain <= 49 then '45–49-vuotiaat'
		when ika_avain >= 50 and ika_avain <= 54 then '50–54-vuotiaat'
		when ika_avain >= 55 and ika_avain <= 59 then '55–59-vuotiaat'
        when ika_avain >= 60 and ika_avain <= 64 then '60–64-vuotiaat'
		when ika_avain >= 65 then '65–vuotiaat ja sitä vanhemmat'
		else 'Tieto puuttuu'
	END 
,ikaryhma3_sv = 
	CASE 
		when ika_avain >= 0  and ika_avain <= 14 then '14 år eller yngre'
		when ika_avain >= 15 and ika_avain <= 19 then '15–19 år'
		when ika_avain >= 20 and ika_avain <= 24 then '20–24 år'
		when ika_avain >= 25 and ika_avain <= 29 then '25–29 år'
		when ika_avain >= 30 and ika_avain <= 34 then '30–34 år'
		when ika_avain >= 35 and ika_avain <= 39 then '35–39 år'
		when ika_avain >= 40 and ika_avain <= 44 then '40–44 år'
		when ika_avain >= 45 and ika_avain <= 49 then '45–49 år'
		when ika_avain >= 50 and ika_avain <= 54 then '50–54 år'
		when ika_avain >= 55 and ika_avain <= 59 then '55–59 år'
        when ika_avain >= 60 and ika_avain <= 64 then '60–64 år'
		when ika_avain >= 65 then '65 år eller äldre'
		else 'Information saknas'
	END 
,ikaryhma3_en = 
	CASE 
		when ika_avain >= 0  and ika_avain <= 14 then 'Aged 14 or under'
		when ika_avain >= 15 and ika_avain <= 19 then 'Aged 15–19'
		when ika_avain >= 20 and ika_avain <= 24 then 'Aged 20–24'
		when ika_avain >= 25 and ika_avain <= 29 then 'Aged 25–29'
		when ika_avain >= 30 and ika_avain <= 34 then 'Aged 30–34'
		when ika_avain >= 35 and ika_avain <= 39 then 'Aged 35–39'
		when ika_avain >= 40 and ika_avain <= 44 then 'Aged 40–44'
		when ika_avain >= 45 and ika_avain <= 49 then 'Aged 45–49'
		when ika_avain >= 50 and ika_avain <= 54 then 'Aged 50–54'
		when ika_avain >= 55 and ika_avain <= 59 then 'Aged 55–59'
        when ika_avain >= 60 and ika_avain <= 64 then 'Aged 60–64'
		when ika_avain >= 65 then 'Aged 65 or older'
		else 'Missing data'
	END 
,jarjestys_ikaryhma3 =
	CASE
		when ika_avain >= 0  and ika_avain <= 14 then '14'
		when ika_avain >= 15 and ika_avain <= 19 then '15'
		when ika_avain >= 20 and ika_avain <= 24 then '20'
		when ika_avain >= 25 and ika_avain <= 29 then '25'
		when ika_avain >= 30 and ika_avain <= 34 then '30'
		when ika_avain >= 35 and ika_avain <= 39 then '35'
		when ika_avain >= 40 and ika_avain <= 44 then '40'
		when ika_avain >= 45 and ika_avain <= 49 then '45'
		when ika_avain >= 50 and ika_avain <= 54 then '50'
		when ika_avain >= 55 and ika_avain <= 59 then '55'
        when ika_avain >= 60 and ika_avain <= 64 then '60'
		when ika_avain >= 65 then '65'
		else '999'
	END


--ikaryhma4
,ikaryhma4_fi = 
	CASE 
		when ika_avain < 30 then 'alle 30-vuotiaat'
		when ika_avain >= 30 and ika_avain <= 39 then '30–39-vuotiaat'
		when ika_avain >= 40 and ika_avain <= 49 then '40–49-vuotiaat'
		when ika_avain >= 50 and ika_avain <= 59 then '50–59-vuotiaat'
		when ika_avain >= 60 then '60–vuotiaat ja sitä vanhemmat'
		else 'Tieto puuttuu'
	END 
,ikaryhma4_sv = 
	CASE 
		when ika_avain < 30 then 'under 30 år'
		when ika_avain >= 30 and ika_avain <= 39 then '30–39 år'
		when ika_avain >= 40 and ika_avain <= 49 then '40–49 år'
		when ika_avain >= 50 and ika_avain <= 59 then '50–59 år'
		when ika_avain >= 60 then '60 år eller äldre'
		else 'Information saknas'
	END 
,ikaryhma4_en = 
	CASE 
		when ika_avain < 30 then 'Aged under 30'
		when ika_avain >= 30 and ika_avain <= 39 then 'Aged 30–39'
		when ika_avain >= 40 and ika_avain <= 49 then 'Aged 40–49'
		when ika_avain >= 50 and ika_avain <= 59 then 'Aged 50–59'
		when ika_avain >= 60 then 'Aged 60 or older'
		else 'Missing data'
	END 
,jarjestys_ikaryhma4 =
	CASE
		when ika_avain < 30 then '29'
		when ika_avain >= 30 and ika_avain <= 39 then '30'
		when ika_avain >= 40 and ika_avain <= 49 then '40'
		when ika_avain >= 50 and ika_avain <= 59 then '50'
		when ika_avain >= 60 then '60'
		else '999'
	END

