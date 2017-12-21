IF NOT EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'dw.p_lataa_f_amk_rekrytointihaut')
			AND type IN (N'P',N'PC')
		)
BEGIN
	EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE dw.p_lataa_f_amk_rekrytointihaut AS'
END
