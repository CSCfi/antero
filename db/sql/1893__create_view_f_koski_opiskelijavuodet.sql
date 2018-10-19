USE [Antero]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dw].[f_koski_opiskelijavuodet]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dw].f_koski_opiskelijavuodet AS
SELECT 1 AS a'
GO
ALTER TABLE [dw].[f_koski_opiskelijavuodet](
 [vuosi] [int] NULL,
 [d_kalenteri_id] [int] NULL,
 [d_sukupuoli_id] [int] NULL,
 [d_kieli_aidinkieli_id] [int] NULL,
 [d_ika_id] [int] NULL,
 [d_osa_aikaisuus_id] [int] NULL,
 [d_erityisopetus_id] [int] NULL,
 [d_majoitus_id] [int] NULL,
 [d_kytkin_oppisopimuskoulutus_id] [int] NULL,
 [d_kytkin_vankilaopetus_id] [int] NULL,
 [d_kytkin_henkilostokoulutus_id] [int] NULL,
 [d_kytkin_tyovoimakoulutus_id] [int] NULL,
 [d_koulutusluokitus_id] [int] NULL,
 [d_organisaatioluokitus_oppilaitos_id] [int] NULL,
 [d_organisaatioluokitus_jarj_id] [int] NULL,
 [d_kustannusryhma_id] [int] NULL,
 [d_suorituksen_tyyppi_id] [int] NULL,
 [opiskelijavuodet] [decimal](20, 10) NULL
) ON [PRIMARY]

GO
