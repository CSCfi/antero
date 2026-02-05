USE [VipunenTK_lisatiedot]
GO

/****** Object:  StoredProcedure [dbo].[paivita_kuution_raportit]    Script Date: 5.2.2026 13.41.09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


















CREATE OR ALTER  PROCEDURE [dbo].[paivita_kuution_raportit] AS

UPDATE t 
SET pending_refresh = 1, number_of_consecutive_failures = 0, loadtime = getdate()
FROM Antero.dbo.sharepoint_reports_tabular t 
LEFT JOIN VipunenTK_lisatiedot.dbo.Vipunen_kuutio k ON k.kuutio_avain = t.tabular
JOIN VipunenTK_lisatiedot.dbo.Vipunen_tk_toimituksen_kuutio r ON coalesce(k.kuutio_nimi, t.tabular) = r.Kuutio
WHERE t.refresh = 1;

TRUNCATE TABLE VipunenTK_lisatiedot.dbo.Vipunen_tk_toimituksen_kuutio;

GO


