USE [ANTERO]
GO
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_sukupuoli' AND COLUMN_NAME='jarjestys_sukupuoli_koodi')

BEGIN
	ALTER TABLE dw.d_sukupuoli ADD jarjestys_sukupuoli_koodi AS case when sukupuoli_koodi = -1 then '99999' else cast(sukupuoli_koodi as varchar(10))
  END
END
