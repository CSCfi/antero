USE [ANTERO]
GO

/****** Object:  View [api].[opiskelijat_ja_tutkinnot]    Script Date: 17.12.2019 17:23:08 ******/
DROP VIEW IF EXISTS [api].[opiskelijat_ja_tutkinnot]
GO

/****** Object:  View [api].[opiskelijat_ja_tutkinnot]    Script Date: 17.12.2019 17:23:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

























CREATE VIEW [api].[opiskelijat_ja_tutkinnot] as

SELECT * FROM [dw].[api_opiskelijat_ja_tutkinnot]


