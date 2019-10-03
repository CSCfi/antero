IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.f_amk_maahanmuuttajien_valmentava_koulutus') AND type in (N'U'))
BEGIN
CREATE TABLE dw.f_amk_maahanmuuttajien_valmentava_koulutus(
	id int IDENTITY(1,1) NOT NULL,
	d_amk_id int NOT NULL,
	d_ohjauksenala_id int NOT NULL,
	d_koulutusala_2002_id int NOT NULL,
	d_sukupuoli_id int NOT NULL,
	d_tilannepvm_id int NOT NULL, -- d_kalenteri
	vuosi int NOT NULL,
	osallistuneet int NOT NULL,
	loadtime datetime NOT NULL,
	source varchar(100) NOT NULL,
	username varchar(30) NOT NULL,
  CONSTRAINT PK__f_amk_maahanmuuttajien_valmentava_koulutus PRIMARY KEY (id)
)

ALTER TABLE dw.f_amk_maahanmuuttajien_valmentava_koulutus ADD  CONSTRAINT DF__f_amk_maahanmuuttajien_valmentava_koulutus__loadtime  DEFAULT (getdate()) FOR loadtime
ALTER TABLE dw.f_amk_maahanmuuttajien_valmentava_koulutus ADD  CONSTRAINT DF__f_amk_maahanmuuttajien_valmentava_koulutus__username  DEFAULT (suser_sname()) FOR username

END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.p_lataa_f_amk_maahanmuuttajien_valmentava_koulutus') AND type in (N'P', N'PC'))
BEGIN
  EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE dw.p_lataa_f_amk_maahanmuuttajien_valmentava_koulutus AS'
END
