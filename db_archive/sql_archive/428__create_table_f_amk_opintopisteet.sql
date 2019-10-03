IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.f_amk_opintopisteet') AND type in (N'U'))
BEGIN
CREATE TABLE dw.f_amk_opintopisteet(
  id int IDENTITY(1,1) NOT NULL,
  d_amk_id int NOT NULL,
  d_koulutusala_2002_id int NOT NULL,
  d_ohjauksenala_id int NOT NULL,
  d_amk_koulutustyyppi_id int NOT NULL,
  d_tilannepvm_id int NOT NULL, -- d_kalenteri
  vuosi int NOT NULL,

  kaikki_tutk_lkm int NOT NULL,
  tki_pisteet_lkm int NOT NULL,
  tki_harj_pisteet_lkm int NOT NULL,
  tki_muu_pisteet_lkm int NOT NULL,
  vierkiel_pisteet_lkm int NOT NULL,
  ulkom_hyv_op_lkm int NOT NULL,
  ulkom_harj_op_lkm int NOT NULL,

  avoinamk_op_lkm int NOT NULL,
  avoinamk_op_amk_lkm int NOT NULL,
  avoinamk_op_yliop_lkm int NOT NULL,
  avoinamk_op_kesa_lkm int NOT NULL,
  avoinamk_op_kansan_lkm int NOT NULL,
  avoinamk_op_kansal_lkm int NOT NULL,
  avoinamk_op_muut_lkm int NOT NULL,
  
  kv_vaihtoopiskelijat_op_lkm int NOT NULL,
  kk_yhteistyo_op_lkm int NOT NULL,
  erilopintooik_op_lkm int NOT NULL,
  mamu_op_lkm int NOT NULL,
  erikoul_suor_op_lkm int NOT NULL,

  loadtime datetime NOT NULL,
  source varchar(100) NOT NULL,
  username varchar(30) NOT NULL,
  CONSTRAINT PK__f_amk_opintopisteet PRIMARY KEY (id)
)

ALTER TABLE dw.f_amk_opintopisteet ADD  CONSTRAINT DF__f_amk_opintopisteet__loadtime  DEFAULT (getdate()) FOR loadtime
ALTER TABLE dw.f_amk_opintopisteet ADD  CONSTRAINT DF__f_amk_opintopisteet__username  DEFAULT (suser_sname()) FOR username
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_f_amk_opintopisteet') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE dw.p_lataa_f_amk_opintopisteet AS'
END
