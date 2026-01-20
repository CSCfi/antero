USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_d_amos_spl_opiskelijavuodet_hylkaamisperuste] AS

TRUNCATE TABLE dw.d_amos_spl_opiskelijavuodet_hylkaamisperuste

SET IDENTITY_INSERT dw.d_amos_spl_opiskelijavuodet_hylkaamisperuste ON

INSERT dw.d_amos_spl_opiskelijavuodet_hylkaamisperuste (
	 id
	,koodi
	,selite_fi
	,selite_sv
	,selite_en
	,jarjestys
	,source
)
VALUES 
(-1,-1,'Tieto puuttuu','Information saknas','Missing data',99,'manuaalinen'),
(9,9,'Hyväksytään','SV*','EN*',0,'manuaalinen'),
(0,0,'Hylätään: Heinäkuu (tutkinto/valmentava)','SV*','EN*',10,'manuaalinen'),
(1,1,'Hylätään: 4 viikkoa ylittävä yhtäjaksoinen loma','SV*','EN*',10,'manuaalinen'),
(2,2,'Hylätään: Samanaikainen opiskeluoikeus, ammatillinen','SV*','EN*',20,'manuaalinen'),
(3,3,'Hylätään: Samanaikainen opiskeluoikeus, lukio','SV*','EN*',30,'manuaalinen'),
(4,4,'Hylätään: Samanaikainen opiskeluoikeus, perusopetuksen lisäopetus','SV*','EN*',40,'manuaalinen'),
(5,5,'Hylätään: Sisältyy toiseen opiskeluoikeuteen','SV*','EN*',50,'manuaalinen'),
(7,7,'Hylättävä painotus: luvan ylittävät sisäoppilaitosmuotoisen koulutuksen opiskelijavuodet','SV*','EN*',70,'manuaalinen'),
(8,8,'Hylättävä painotus: luvan ylittävät vaativan erityisen tuen opiskelijavuodet','SV*','EN*',80,'manuaalinen'),
(10,10,'Hylätään: Samanaikainen opiskeluoikeus, TUVA (ammatillinen)','SV*','EN*',21,'manuaalinen'), --sisältyy latauksissa toistaiseksi koodiin 2
(11,11,'Hylätään: Samanaikainen opiskeluoikeus, TUVA (lukio)','SV*','EN*',22,'manuaalinen'),
(12,12,'Hylätään: Samanaikainen opiskeluoikeus, TUVA (perusopetus)','SV*','EN*',23,'manuaalinen')

GO
