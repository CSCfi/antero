IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.f_yo_opintopisteet') AND type in (N'U'))
BEGIN
CREATE TABLE dw.f_yo_opintopisteet(
  id int IDENTITY(1,1) NOT NULL,
  d_yo_id int NOT NULL,
  d_opintoala95_id int NOT NULL,
  d_ohjauksenala_id int NOT NULL,
  d_tilannepvm_id int NOT NULL, -- d_kalenteri
  vuosi int NOT NULL,

  kaikki_tutk_op_lkm int NOT NULL,
  vierkielper_op_lkm int NOT NULL,
  erillisilla_oik_op_lkm int NOT NULL,
  erillisilla_oik_opkoul_op_lkm int NOT NULL,
  joo_op_lkm int NOT NULL,
  kv_vaihtoopiskelijat_op_lkm int NOT NULL,
  erikoul_suor_op_lkm int NOT NULL,
  ulkom_hyv_luetut_op_lkm int NOT NULL,
  ulkom_harj_op_lkm int NOT NULL,

  avoinop_lkm int NOT NULL,
  avoinop_yliop_lkm int NOT NULL,
  avoinop_amk_lkm int NOT NULL,
  avoinop_kesa_lkm int NOT NULL,
  avoinop_kansan_lkm int NOT NULL,
  avoinop_kansal_lkm int NOT NULL,
  avoinop_muut_lkm int NOT NULL,
  
  loadtime datetime NOT NULL,
  source varchar(100) NOT NULL,
  username varchar(30) NOT NULL,
  CONSTRAINT PK__f_yo_opintopisteet PRIMARY KEY (id)
)

ALTER TABLE dw.f_yo_opintopisteet ADD  CONSTRAINT DF__f_yo_opintopisteet__loadtime  DEFAULT (getdate()) FOR loadtime
ALTER TABLE dw.f_yo_opintopisteet ADD  CONSTRAINT DF__f_yo_opintopisteet__username  DEFAULT (suser_sname()) FOR username
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_f_yo_opintopisteet') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE dw.p_lataa_f_yo_opintopisteet AS'
END
