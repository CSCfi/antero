USE [AnteroAPI]
GO

DROP PROCEDURE IF EXISTS [dw].[p_lataa_api_avoin_yliopisto_esilataus]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dw].[p_lataa_api_avoin_yliopisto_esilataus] AS

TRUNCATE TABLE AnteroAPI.dw.[api_avoin_yliopisto];

INSERT INTO AnteroAPI.dw.[api_avoin_yliopisto]

SELECT
	 ROW_NUMBER() OVER(ORDER BY f.id ASC, d1.id, d6.id ASC) as defaultorder
	,[tilastovuosi] = vuosi
	,[sukupuoli] = d1.sukupuoli_fi
	,[yliopisto] = d6.yo_nimi_fi
	--mittarit
	,f.suorittaneiden_lkm
	--koodit
	,[koodit_yliopisto] = d6.yo_tunnus
	,[koodit_sukupuoli] = d1.sukupuoli_koodi
FROM ANTERO.[dw].[f_yo_avoimen_yliopiston_kautta_opiskelevat] f
JOIN ANTERO.dw.d_sukupuoli d1 on d1.id=f.d_sukupuoli_id
JOIN ANTERO.dw.d_yo d6 on d6.id=f.d_yliopisto_id

GO

USE [ANTERO]


