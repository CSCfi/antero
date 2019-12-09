USE [ANTERO]
GO
/****** Object:  Table [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut]    Script Date: 8.12.2019 20:34:17 ******/
DROP TABLE IF EXISTS [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut]
GO
/****** Object:  Table [dw].[f_amos_tutkinnot_ja_tutkinnonosat]    Script Date: 8.12.2019 20:34:17 ******/
DROP TABLE IF EXISTS [dw].[f_amos_tutkinnot_ja_tutkinnonosat]
GO
/****** Object:  Table [dw].[f_amos_tutkinnot_ja_tutkinnonosat]    Script Date: 8.12.2019 20:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_amos_tutkinnot_ja_tutkinnonosat]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_amos_tutkinnot_ja_tutkinnonosat](
	[Tilastovuosi] [int] NOT NULL,
	[d_kalenteri_id] [int] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_opintojenrahoitus_id] [int] NULL,
	[d_kustannusryhma_id] [int] NULL,
	[d_oppisopimuskoulutus_id] [int] NULL,
	[d_erityisopetus_id] [int] NULL,
	[d_suorituksen_tyyppi_id] [int] NULL,
	[d_organisaatioluokitus_jarjestaja_id] [int] NULL,
	[d_amos_spl_jarjestaja_linkki_id] [int] NULL,
	[koko_tutkinto] [int] NULL,
	[tutkinnon_osat] [int] NULL,
	[osaamispisteet] [float] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut]    Script Date: 8.12.2019 20:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut](
	[tilastovuosi] [int] NOT NULL,
	[d_kalenteri_id] [int] NULL,
	[d_erityisopetus_id] [int] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_organisaatioluokitus_jarjestaja_id] [int] NULL,
	[d_amos_spl_jarjestaja_linkki_id] [int] NULL,
	[d_kustannusryhma_id] [int] NULL,
	[d_suorituksen_tyyppi_id] [int] NULL,
	[d_opintojenrahoitus_id] [int] NULL,
	[d_oppisopimuskoulutus_id] [int] NULL,
	[painottamaton_tutkinnot] [int] NULL,
	[painottamaton_osatutkinnot] [int] NULL,
	[painottamaton_osaamispisteet] [float] NULL,
	[painottamaton_osaamispisteet_summa] [float] NULL,
	[painotettu_tutkinnot_pt_kr_pk] [float] NULL,
	[painotettu_tutkinnot_at_eat_kr_pk] [float] NULL,
	[painotettu_tutkinnot_erityistuki] [float] NULL,
	[painotettu_tutkinnon_osien_osaamispisteet_pt_kr] [float] NULL,
	[painotettu_tutkinnon_osien_osaamispisteet_at_eat_kr] [float] NULL,
	[painotettu_tutkinnon_osien_osaamispisteet_erityistuki] [float] NULL,
	[painotettu_tutkinnot_yht] [float] NULL,
	[painotettu_tutkinnon_osien_osaamispisteet_yht] [float] NULL
) ON [PRIMARY]
END
GO
USE [ANTERO]