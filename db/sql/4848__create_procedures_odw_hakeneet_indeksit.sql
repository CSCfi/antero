USE [ANTERO]
GO
/****** Object:  StoredProcedure [sa].[p_poista_indeksit_odw_hakeneet]    Script Date: 9.9.2021 18:44:03 ******/
DROP PROCEDURE IF EXISTS [sa].[p_poista_indeksit_odw_hakeneet]
GO
/****** Object:  StoredProcedure [sa].[p_lisaa_indeksit_odw_hakeneet]    Script Date: 9.9.2021 18:44:03 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lisaa_indeksit_odw_hakeneet]
GO
/****** Object:  StoredProcedure [sa].[p_lisaa_indeksit_odw_hakeneet]    Script Date: 9.9.2021 18:44:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lisaa_indeksit_odw_hakeneet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lisaa_indeksit_odw_hakeneet] AS' 
END
GO

ALTER PROCEDURE [sa].[p_lisaa_indeksit_odw_hakeneet] AS

DROP INDEX IF EXISTS [NC_odw_hakeneet1] ON [sa].[sa_odw_hakeneet]
DROP INDEX IF EXISTS [NC_odw_hakeneet2] ON [sa].[sa_odw_hakeneet]


CREATE NONCLUSTERED INDEX [NC_odw_hakeneet1] ON [sa].[sa_odw_hakeneet]
(
	[HakukohdeOID] ASC
)
INCLUDE ( 	[hakukohteen_tutkinnon_taso_kk_sykli],
	[hakukohteen_tutkinnon_taso_kk]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]


CREATE NONCLUSTERED INDEX [NC_odw_hakeneet2] ON [sa].[sa_odw_hakeneet]
(
	[HakemusOid] ASC,
	[ValinnanTila] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]



GO
/****** Object:  StoredProcedure [sa].[p_poista_indeksit_odw_hakeneet]    Script Date: 9.9.2021 18:44:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_poista_indeksit_odw_hakeneet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_poista_indeksit_odw_hakeneet] AS' 
END
GO

ALTER PROCEDURE [sa].[p_poista_indeksit_odw_hakeneet] AS

DROP INDEX IF EXISTS [NC_odw_hakeneet1] ON [sa].[sa_odw_hakeneet]
DROP INDEX IF EXISTS [NC_odw_hakeneet2] ON [sa].[sa_odw_hakeneet]


