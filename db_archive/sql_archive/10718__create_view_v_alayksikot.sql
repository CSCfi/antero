USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_jtp_latausraportit_tilanne]    Script Date: 28.3.2025 7.46.19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER VIEW [dw].[v_alayksikot] AS

SELECT 
    [vuosi] as Vuosi,
    [korkeakoulu_koodi] as 'Korkeakoulu koodi',
	d2.organisaatio_fi as Korkeakoulu,
    [paayksikko_koodi] as 'Pääyksikkö koodi',
    [alayksikko_koodi] as 'Alayksikkö koodi',
    [alayksikko_nimi] as 'Alayksikkö'
FROM [ANTERO].[dw].[d_organisaation_alayksikot] d1
left join ANTERO.dw.d_organisaatioluokitus d2 on d2.organisaatio_koodi=d1.korkeakoulu_koodi
WHERE vuosi != '-1'

GO 

USE [ANTERO]