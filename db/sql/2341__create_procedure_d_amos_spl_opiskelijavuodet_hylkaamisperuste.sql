USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_amos_spl_opiskelijavuodet_hylkaamisperuste]    Script Date: 2.8.2019 11:49:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_amos_spl_opiskelijavuodet_hylkaamisperuste]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_amos_spl_opiskelijavuodet_hylkaamisperuste] AS' 
END
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
(1,1,'4 viikkoa ylittävä yhtäjaksoinen loma','SV*','EN*',1,'manuaalinen'),
(2,2,'Samanaikainen opiskeluoikeus, ammatillinen','SV*','EN*',2,'manuaalinen'),
(3,3,'Samanaikainen opiskeluoikeus, lukio','SV*','EN*',3,'manuaalinen'),
(4,4,'Sisältyy toiseen opiskeluoikeuteen','SV*','EN*',4,'manuaalinen'),
(9,9,'Hyväksytään','SV*','EN*',9,'manuaalinen')
