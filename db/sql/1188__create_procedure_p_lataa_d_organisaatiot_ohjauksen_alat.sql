IF NOT EXISTS (
		SELECT *
		FROM sys.objects
		WHERE object_id = OBJECT_ID(N'dw.p_lataa_d_organisaatiot_ohjauksen_alat')
			AND type IN (N'P',N'PC')
		)
		
BEGIN
	EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE dw.p_lataa_p_lataa_d_organisaatiot_ohjauksen_alat AS'
END
