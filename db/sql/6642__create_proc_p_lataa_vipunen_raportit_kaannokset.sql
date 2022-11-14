USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_vipunen_raportit_kaannokset]    Script Date: 14.11.2022 16:17:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [dw].[p_lataa_vipunen_raportit_kaannokset] AS

DROP TABLE IF EXISTS [ANTERO].[dbo].[vipunen_raportit_kaannokset]

SELECT DISTINCT 
	fi.raportti, 
	case when sv.raportti is null then 0 else 1 end as kaannos_sv, 
	case when en.raportti is null then 0 else 1 end as kaannos_en,
	username = USER_NAME(),
	loadtime = GETDATE()
INTO [ANTERO].[dbo].[vipunen_raportit_kaannokset]
FROM [ANTERO].[dbo].[vipunen_raportit_fi] fi
LEFT JOIN [ANTERO].[dbo].[vipunen_raportit_en] en on UPPER(LEFT(fi.raportti, LEN(fi.raportti) - charindex('.', reverse(fi.raportti)))) = UPPER(LEFT(en.raportti, LEN(en.raportti) - charindex('_', reverse(en.raportti))))
LEFT JOIN [ANTERO].[dbo].[vipunen_raportit_sv] sv on UPPER(LEFT(fi.raportti, LEN(fi.raportti) - charindex('.', reverse(fi.raportti)))) = UPPER(LEFT(sv.raportti, LEN(sv.raportti) - charindex('_', reverse(sv.raportti))))

GO

USE [ANTERO]