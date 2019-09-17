USE [ANTERO]
GO
/****** Object:  Table [dw].[f_amos_spl_tutkinnot_ja_tutkinnonosat_tabular_painotetut]    Script Date: 17.9.2019 16:38:47 ******/
DROP TABLE IF EXISTS [dw].[f_amos_spl_tutkinnot_ja_tutkinnonosat_tabular_painotetut]
GO
/****** Object:  Table [dw].[f_amos_spl_tutkinnot_ja_tutkinnonosat_tabular_painotetut]    Script Date: 17.9.2019 16:38:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_amos_spl_tutkinnot_ja_tutkinnonosat_tabular_painotetut]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_amos_spl_tutkinnot_ja_tutkinnonosat_tabular_painotetut](
	[tilastovuosi] [int] NOT NULL,
	[d_erityisopetus_id] [int] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_organisaatioluokitus_jarjestaja_id] [bigint] NULL,
	[d_kustannusryhma_id] [int] NULL,
	[d_suorituksen_tyyppi_id] [int] NULL,
	[d_opintojenrahoitus_id] [int] NULL,
	[d_oppisopimuskoulutus_id] [int] NULL,
	[painottamaton_tutkinnot] [int] NULL,
	[painottamaton_osatutkinnot] [int] NULL,
	[painottamaton_osaamispisteet] [float] NULL,
	[painottamaton_osaamispisteet_summa] [float] NULL,
	[painotettu_tutkinnot_pt_kr_pk] [decimal](38, 6) NULL,
	[painotettu_tutkinnot_at_eat_kr_pk] [decimal](38, 6) NULL,
	[painotettu_tutkinnot_erityistuki] [decimal](23, 4) NULL,
	[painotettu_tutkinnon_osien_osaamispisteet_pt_kr] [float] NULL,
	[painotettu_tutkinnon_osien_osaamispisteet_at_eat_kr] [float] NULL,
	[painotettu_tutkinnon_osien_osaamispisteet_erityistuki] [float] NULL,
	[painotettu_tutkinnot_yht] [decimal](38, 6) NULL,
	[painotettu_tutkinnon_osien_osaamispisteet_yht] [float] NULL
) ON [PRIMARY]
END
