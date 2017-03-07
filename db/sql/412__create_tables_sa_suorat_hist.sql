IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_hist_amk2a_opintopisteet') BEGIN

CREATE TABLE [sa].[sa_suorat_hist_amk2a_opintopisteet](
	[amk_tunnus] [varchar](5) NULL,
	[koulutusala_koodi] [varchar](5) NULL,
	[koulutustyyppi_koodi] [int] NULL,
	[vuosi] [int] NULL,
	[tki_pisteet_lkm] [int] NULL,
	[tki_harj_pisteet_lkm] [int] NULL,
	[tki_muu_pisteet_lkm] [int] NULL,
	[vierkiel_pisteet_lkm] [int] NULL,
	[kaikki_tutk_lkm] [int] NULL,
	[ulkom_hyv_op_lkm] [int] NULL,
	[imp_created_by] [varchar](100) NULL,
	[imp_created_date] [datetime] NULL,
	[LATAUSAIKA] [datetime] NULL
) 

END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_hist_amk2b_opintopisteet') BEGIN

CREATE TABLE [sa].[sa_suorat_hist_amk2b_opintopisteet](
	[korkeakoulu_tunnus] [varchar](5) NULL,
	[koulutusala_koodi] [varchar](5) NULL,
	[vuosi] [int] NULL,
	[kv_vaihtoopiskelijat_op_lkm] [int] NULL,
	[avoinamk_op_lkm] [int] NULL,
	[kk_yhteistyo_op_lkm] [int] NULL,
	[erilopintooik_op_lkm] [int] NULL,
	[mamu_op_lkm] [int] NULL,
	[avoinamk_op_yliop_lkm] [int] NULL,
	[avoinamk_op_amk_lkm] [int] NULL,
	[avoinamk_op_kesa_lkm] [int] NULL,
	[avoinamk_op_kansan_lkm] [int] NULL,
	[avoinamk_op_kansal_lkm] [int] NULL,
	[avoinamk_op_muut_lkm] [int] NULL,
	[erikoul_suor_op_lkm] [int] NULL,
	[imp_created_by] [varchar](100) NULL,
	[imp_created_date] [datetime] NULL,
	[LATAUSAIKA] [datetime] NULL
) 

END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_hist_amk6_avoin_opiskelijat') BEGIN

CREATE TABLE [sa].[sa_suorat_hist_amk6_avoin_opiskelijat](
	[AMK_TUNNUS] [varchar](5) NULL,
	[KOULUTUSALA_KOODI] [varchar](5) NULL,
	[VUOSI] [int] NULL,
	[ULKOPUOLISET_OPISKELIJAT_LKM] [int] NULL,
	[SUKUPUOLIKOODI] [varchar](2) NULL,
	[LATAUSAIKA] [datetime] NULL,
	[IMP_CREATED_BY] [varchar](100) NULL
) 

END


IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_hist_amk7_mamu_valmistava_koulutus') BEGIN

CREATE TABLE [sa].[sa_suorat_hist_amk7_mamu_valmistava_koulutus](
	[AMK_TUNNUS] [varchar](5) NULL,
	[KOULUTUSALA_KOODI] [varchar](5) NULL,
	[OSALLISTUNEIDEN_LKM] [int] NULL,
	[VUOSI] [int] NULL,
	[SUKUPUOLIKOODI] [varchar](2) NULL,
	[IMP_CREATED_BY] [varchar](100) NULL,
	[IMP_CREATED_DATE] [datetime] NULL,
	[LATAUSAIKA] [datetime] NULL
) 

END

IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_hist_yo2_opintopisteet') BEGIN

CREATE TABLE [sa].[sa_suorat_hist_yo2_opintopisteet](
	[yliopisto_tunnus] [varchar](5) NULL,
	[vuosi] [int] NULL,
	[koulutusalakoodi] [varchar](5) NULL,
	[luokanop_harj_op_lkm] [int] NULL,
	[ainopharj_op_lkm] [int] NULL,
	[erityisop_lkm] [int] NULL,
	[opo_lkm] [int] NULL,
	[lastharop_lkm] [int] NULL,
	[aikuisharop_lkm] [int] NULL,
	[muutharop_lkm] [int] NULL,
	[vierkielper_op_lkm] [int] NULL,
	[kaikperop_lkm] [int] NULL,
	[kvvaihtop_lkm] [int] NULL,
	[joo_op_lkm] [int] NULL,
	[avoinop_lkm] [int] NULL,
	[erillisilla_oik_op_lkm] [int] NULL,
	[erillisilla_oik_opkoul_op_lkm] [int] NULL,
	[ulkom_hyv_luetut_op_lkm] [int] NULL,
	[avoinop_yliop_lkm] [int] NULL,
	[avoinop_amk_lkm] [int] NULL,
	[avoinop_kesa_lkm] [int] NULL,
	[avoinop_kansan_lkm] [int] NULL,
	[avoinop_kansal_lkm] [int] NULL,
	[avoinop_muut_lkm] [int] NULL,
	[erikoul_suor_op_lkm] [int] NULL,
	[imp_created_by] [varchar](100) NULL,
	[imp_created_date] [datetime] NULL
) 

END

