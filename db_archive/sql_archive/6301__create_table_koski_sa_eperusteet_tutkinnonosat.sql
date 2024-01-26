USE [Koski_SA]
GO
/****** Object:  Table [dbo].[eperusteet_tutkinnonosa_osaamisala_laajuus]    Script Date: 20.7.2022 12:37:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[eperusteet_tutkinnonosa_osaamisala_laajuus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[eperusteet_tutkinnonosa_osaamisala_laajuus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tutkinnonosa_koodi] [int] NULL,
	[tutkinnonosa_nimi_fi] [varchar](300) NULL,
	[tutkinnonosa_laajuus] [int] NULL,
	[tutkinto_koodi] [varchar](10) NULL,
	[tutkinto_nimi_fi] [varchar](1000) NULL,
	[diaarinumero] [varchar](100) NULL,
	[voimassaoloalkaa] [datetime] NULL,
	[voimassaololoppuu] [datetime] NULL,
	[siirtymapaattyy] [datetime] NULL,
	[osaamisala_koodi] [int] NULL,
	[osaamisala_nimi_fi] [varchar](300) NULL,
	[rn_osaamisala] [bigint] NULL,
	[rn2_osaamisala] [bigint] NULL,
 CONSTRAINT [PK_eperusteet_tutkinnonosa_osaamisala_laajuus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_eperusteet_tutkinnonosa_osaamisala_laajuus]    Script Date: 20.7.2022 12:37:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[p_lataa_eperusteet_tutkinnonosa_osaamisala_laajuus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[p_lataa_eperusteet_tutkinnonosa_osaamisala_laajuus] AS' 
END
GO




ALTER PROCEDURE [dbo].[p_lataa_eperusteet_tutkinnonosa_osaamisala_laajuus] AS

--DROP TABLE IF EXISTS dbo.eperusteet_tutkinnonosa_osaamisala_laajuus

TRUNCATE TABLE dbo.eperusteet_tutkinnonosa_osaamisala_laajuus

INSERT INTO dbo.eperusteet_tutkinnonosa_osaamisala_laajuus (
	[tutkinnonosa_koodi]
	,[tutkinnonosa_nimi_fi]
	,[tutkinnonosa_laajuus]
	,[tutkinto_koodi]
	,[tutkinto_nimi_fi]
	,[diaarinumero]
	,[voimassaoloalkaa]
	,[voimassaololoppuu]
	,[siirtymapaattyy]
	,[osaamisala_koodi]
	,[osaamisala_nimi_fi]
	,[rn_osaamisala]
	,[rn2_osaamisala]
)

SELECT 
	tutkinnonosa_koodi
	,tutkinnonosa_nimi_fi
	,tutkinnonosa_laajuus

	,tutkinto_koodi
	,tutkinto_nimi_fi
	
	,diaarinumero
	,voimassaoloalkaa
	,voimassaololoppuu
	,siirtymapaattyy
	
	,osaamisala_koodi
	,osaamisala_nimi_fi

	,rn_osaamisala = row_number() over (partition by tutkinnonosa_koodi,diaarinumero order by osaamisala_koodi,coalesce(tutkinnonosa_laajuus,0) desc,voimassaoloalkaa)
	,rn2_osaamisala = row_number() over (partition by tutkinnonosa_koodi order by (case when getdate() between voimassaoloalkaa and voimassaololoppuu then 1 else 0 end) desc,coalesce(tutkinnonosa_laajuus,0) desc, osaamisala_koodi)
--INTO dbo.eperusteet_tutkinnonosa_osaamisala_laajuus
FROM (
	SELECT DISTINCT
		epe.diaarinumero
		,epe.voimassaoloalkaa
		,voimassaololoppuu = coalesce(epe.voimassaololoppuu,'9999-12-31')
		,siirtymapaattyy
		,tutkinnonosa_koodi = epe_to.koodiarvo
		,tutkinnonosa_nimi_fi = epe_to.nimi_fi
		,tutkinnonosa_laajuus = tov.laajuus
		,tutkinto_koodi = epe.tutkintokoodi
		,tutkinto_nimi_fi = epe.nimi_fi
		,osaamisala_koodi = oa.osaamisala_koodi
		,osaamisala_nimi_fi = oa.nimi_fi
		,rnk = rank() over(partition by epe_to.koodiarvo,epe.diaarinumero,epe.voimassaoloalkaa order by coalesce(tov.laajuus,0) desc)
	FROM [Koski_SA].[sa].[sa_eperusteet_tutkinnonosat] epe_to
	LEFT JOIN Koski_SA.sa.sa_eperusteet epe on epe.eperusteid = epe_to.eperusteid
	LEFT JOIN Koski_SA.sa.sa_eperusteet_osaamisalat oa on oa.eperusteid = epe_to.eperusteid
	LEFT JOIN sa.sa_eperusteet_tutkinnonosaviitteet tov ON tov.tutkinnonosaid = epe_to.tutkinnonosaid and tov.eperusteid=epe_to.eperusteid and tov.laajuus is not null
) Q
WHERE rnk=1
ORDER BY tutkinnonosa_koodi


GO
USE ANTERO