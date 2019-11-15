USE [VipunenTK_lisatiedot]
GO
/****** Object:  StoredProcedure [dbo].[lataa_muuttuneet_tiedot_Vipunen_automaattipaivitys_kuutio]    Script Date: 14.11.2019 17:35:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[lataa_muuttuneet_tiedot_Vipunen_automaattipaivitys_kuutio] AS

--Lukee VipunenTK_lisatiedot.dbo.Vipunen_automaattipaivitys_fakta taulusta proseduurit, joiden faktalataus_suoritettu -arvo on nolla, ja ajaa proseduurit sekä muuttaa ajon jälkeen arvon ykköseksi, jos ajo menee läpi ilman virheitä.


MERGE dbo.Vipunen_automaattipaivitys_kuutio AS target
USING (
	SELECT distinct 
		Ajopvm
		,Taulu
		,kuutio_nimi
	FROM [Vipunen_automaattipaivitys_fakta] af
	JOIN dbo.Vipunen_aineisto_kuutio ak on
		REPLACE(REPLACE(ak.aineisto_avain, 'TK_K', 'TK_'), 'TK_R', 'TK_')
		=
		REPLACE(REPLACE(CASE 
							WHEN LEN(LEFT(Taulu, CHARINDEX('_sopv_', Taulu) - 1)) > 9 
							THEN LEFT(Taulu, LEN(LEFT(Taulu, CHARINDEX('_sopv_', Taulu) - 6))) 
							ELSE LEFT(Taulu, CHARINDEX('_sopv_', Taulu) - 1) 
						END
						, 'TK_K'
						, 'TK_'
						)
				, 'TK_R'
				, 'TK_'
				)
	JOIN dbo.Vipunen_kuutio k on k.kuutio_avain=ak.kuutio_avain
	WHERE Faktalataus_suoritettu=0
) AS src
ON target.TK_aineisto_saapumispvm = src.Ajopvm and target.Kuutio = src.kuutio_nimi

WHEN NOT MATCHED THEN
  INSERT (
    TK_aineisto_saapumispvm
	,Aineisto
	,Kuutio
	,Prosessoitu
  )
  VALUES (
	Ajopvm
	,Taulu
	,kuutio_nimi
	,0
  );



GO
USE [ANTERO]