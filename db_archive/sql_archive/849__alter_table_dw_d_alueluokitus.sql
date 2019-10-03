USE [ANTERO]
GO
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_alueluokitus' AND COLUMN_NAME='jarjestys_kunta_koodi')

BEGIN
	ALTER TABLE dw.d_alueluokitus ADD jarjestys_kunta_koodi AS case when kunta_koodi = -1 then '99999' else cast(kunta_koodi as varchar(10))
	END
END;


IF NOT EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_alueluokitus' AND COLUMN_NAME='jarjestys_avi_koodi')

BEGIN
		ALTER TABLE dw.d_alueluokitus ADD jarjestys_avi_koodi AS case when avi_koodi = -1 then '99999' else cast(avi_koodi as varchar(10))
	  END
END;


IF NOT EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_alueluokitus' AND COLUMN_NAME='jarjestys_ely_koodi')

BEGIN
		ALTER TABLE dw.d_alueluokitus ADD jarjestys_ely_koodi AS case when ely_koodi = -1 then '99999' else cast(ely_koodi as varchar(10))
	  END
END;

IF NOT EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_alueluokitus' AND COLUMN_NAME='jarjestys_kielisuhde_koodi')

BEGIN
		ALTER TABLE dw.d_alueluokitus ADD jarjestys_kielisuhde_koodi AS case when kielisuhde_koodi = -1 then '99999' else cast(kielisuhde_koodi as varchar(10))
	  END
END;

IF NOT EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_alueluokitus' AND COLUMN_NAME='jarjestys_kuntaryhma_koodi')

BEGIN
		ALTER TABLE dw.d_alueluokitus ADD jarjestys_kuntaryhma_koodi AS case when kuntaryhma_koodi = -1 then '99999' else cast(kuntaryhma_koodi as varchar(10)) END
END

IF NOT EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_alueluokitus' AND COLUMN_NAME='jarjestys_maakunta_koodi')

BEGIN
		ALTER TABLE dw.d_alueluokitus ADD jarjestys_maakunta_koodi AS case when maakunta_koodi = -1 then '99999' else cast(maakunta_koodi as varchar(10)) END
END

IF NOT EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_alueluokitus' AND COLUMN_NAME='jarjestys_seutukunta_koodi')

BEGIN
		ALTER TABLE dw.d_alueluokitus ADD jarjestys_seutukunta_koodi AS case when seutukunta_koodi = -1 then '99999' else cast(seutukunta_koodi as varchar(10)) END
END;
GO
