IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'api.koulutusluokitus'))
EXEC dbo.sp_executesql @statement = N'create view api.koulutusluokitus as select 1 as a'
GO

ALTER VIEW api.koulutusluokitus AS

SELECT koulutusluokitus_avain
,koulutusluokitus_koodi
,koulutusluokitus_fi
,koulutusluokitus_sv
,koulutusluokitus_en
,koulutusastetaso1_koodi
,koulutusastetaso1_fi
,koulutusastetaso1_sv
,koulutusastetaso1_en
,koulutusastetaso2_koodi
,koulutusastetaso2_fi
,koulutusastetaso2_sv
,koulutusastetaso2_en
,koulutusalataso1_koodi
,koulutusalataso1_fi
,koulutusalataso1_sv
,koulutusalataso1_en
,koulutusalataso2_koodi
,koulutusalataso2_fi
,koulutusalataso2_sv
,koulutusalataso2_en
,koulutusalataso3_koodi
,koulutusalataso3_fi
,koulutusalataso3_sv
,koulutusalataso3_en
,okmohjauksenala_koodi
,okmohjauksenala_fi
,okmohjauksenala_sv
,okmohjauksenala_en
,koulutussektori_koodi
,koulutussektori_fi
,koulutussektori_sv
,koulutussektori_en
,tutkintotyyppi_koodi
,tutkintotyyppi_fi
,tutkintotyyppi_sv
,tutkintotyyppi_en

--oletusjärjestys sorttausta varten
,ROW_NUMBER() OVER(ORDER BY  id ASC) as defaultorder

FROM dw.d_koulutusluokitus

GO
FROM dw.d_koulutusluokitus
