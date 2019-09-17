USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_amos_spl_opiskelijavuodet_hylkaamisperuste]    Script Date: 17.9.2019 17:17:14 ******/
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
(-1,-1,'Tieto puuttuu','Information saknas','Missing data',9,'manuaalinen'),
(1,1,'Hylätään: 4 viikkoa ylittävä yhtäjaksoinen loma','SV*','EN*',1,'manuaalinen'),
(2,2,'Hylätään: Samanaikainen opiskeluoikeus, ammatillinen','SV*','EN*',2,'manuaalinen'),
(3,3,'Hylätään: Samanaikainen opiskeluoikeus, lukio','SV*','EN*',3,'manuaalinen'),
(4,4,'Hylätään: Samanaikainen opiskeluoikeus, perusopetuksen lisäopetus','SV*','EN*',4,'manuaalinen'),
(5,5,'Hylätään: Sisältyy toiseen opiskeluoikeuteen','SV*','EN*',5,'manuaalinen'),
(9,9,'Hyväksytään','SV*','EN*',9,'manuaalinen')
