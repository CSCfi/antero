USE [Antero]
GO 
IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='f_koski_opiskelijavuodet') 
BEGIN

CREATE TABLE [dw].[f_koski_opiskelijavuodet](
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
)  
END
 