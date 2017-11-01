USE [ANTERO]
GO
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusluokitus' AND COLUMN_NAME='jarjestys_koulutusalataso1_koodi')

BEGIN
	ALTER TABLE dw.d_koulutusluokitus ADD jarjestys_koulutusalataso1_koodi AS case when koulutusalataso1_koodi = -1 then '99999' else cast(koulutusalataso1_koodi as varchar(10))
  END
END

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusluokitus' AND COLUMN_NAME='jarjestys_koulutusalataso2_koodi')

BEGIN
	ALTER TABLE dw.d_koulutusluokitus ADD jarjestys_koulutusalataso2_koodi AS case when koulutusalataso2_koodi = -1 then '99999' else cast(koulutusalataso2_koodi as varchar(10))
  END
END

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusluokitus' AND COLUMN_NAME='jarjestys_koulutusalataso3_koodi')

BEGIN
	ALTER TABLE dw.d_koulutusluokitus ADD jarjestys_koulutusalataso3_koodi AS case when koulutusalataso3_koodi = '-1' then '99999' else cast(koulutusalataso3_koodi as varchar(10))
  END
END

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusluokitus' AND COLUMN_NAME='jarjestys_koulutusastetaso1_koodi')

BEGIN
	ALTER TABLE dw.d_koulutusluokitus ADD jarjestys_koulutusastetaso1_koodi AS case when koulutusastetaso1_koodi = '-1' then '99999' else cast(koulutusastetaso1_koodi as varchar(10))
  END
END

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusluokitus' AND COLUMN_NAME='jarjestys_koulutusastetaso2_koodi')

BEGIN
	ALTER TABLE dw.d_koulutusluokitus ADD jarjestys_koulutusastetaso2_koodi AS case when koulutusastetaso2_koodi = '-1' then '99999' else cast(koulutusastetaso2_koodi as varchar(10))
  END
END

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusluokitus' AND COLUMN_NAME='jarjestys_koulutusluokitus_koodi')

BEGIN
	ALTER TABLE dw.d_koulutusluokitus ADD jarjestys_koulutusluokitus_koodi AS case when koulutusluokitus_koodi = '-1' then '9999999' else cast(koulutusluokitus_koodi as varchar(10))
  END
END

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusluokitus' AND COLUMN_NAME='jarjestys_koulutussektori_koodi')

BEGIN
	ALTER TABLE dw.d_koulutusluokitus ADD jarjestys_koulutussektori_koodi AS case when koulutussektori_koodi = '-1' then '99999' else cast(koulutussektori_koodi as varchar(10))
  END
END

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusluokitus' AND COLUMN_NAME='jarjestys_okmohjauksenala_koodi')

BEGIN
	ALTER TABLE dw.d_koulutusluokitus ADD jarjestys_okmohjauksenala_koodi AS case when okmohjauksenala_koodi = '-1' then '99999' else cast(okmohjauksenala_koodi as varchar(10))
  END
END

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusluokitus' AND COLUMN_NAME='jarjestys_tutkintotyyppi_koodi')

BEGIN
	ALTER TABLE dw.d_koulutusluokitus ADD jarjestys_tutkintotyyppi_koodi AS case when tutkintotyyppi_koodi = -1 then '99999' else cast(tutkintotyyppi_koodi as varchar(10))
  END
END
