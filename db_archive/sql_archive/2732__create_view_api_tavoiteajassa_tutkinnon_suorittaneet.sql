USE [ANTERO]
GO

/****** Object:  View [api].[tavoiteajassa_tutkinnon_suorittaneet]    Script Date: 17.12.2019 17:21:42 ******/
DROP VIEW IF EXISTS [api].[tavoiteajassa_tutkinnon_suorittaneet]
GO

/****** Object:  View [api].[tavoiteajassa_tutkinnon_suorittaneet]    Script Date: 17.12.2019 17:21:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


















CREATE VIEW [api].[tavoiteajassa_tutkinnon_suorittaneet] as

SELECT * FROM [dw].[api_tavoiteajassa_tutkinnon_suorittaneet]


