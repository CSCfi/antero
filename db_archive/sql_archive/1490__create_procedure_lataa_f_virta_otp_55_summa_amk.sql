USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_virta_otp_55_summa_amk]    Script Date: 28.3.2018 15:16:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_virta_otp_55_summa_amk]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_virta_otp_55_summa_amk] AS' 
END
GO


ALTER PROCEDURE [dw].[p_lataa_f_virta_otp_55_summa_amk] AS

--TRUNCATE TABLE dw.f_virta_otp_55_summa

INSERT INTO dw.f_virta_otp_55_summa_amk (
  vuosi,
  kuukausi,
  d_oppilaitos_id,
  d_koulutusluokitus_id,
  suorittanut55,
  suorittanut55ilmanPankkia,
  suorittanut55pankinAvulla,
  suorittanut27,
  source
)
SELECT
  f.vuosi,
  month(f.loadtime),
  coalesce(d1.id,-1) AS d_oppilaitos_id,
  coalesce(d2.id,-1) AS d_koulutusluokitus_id,
 
  sum(case when (f.suorittanut55ilmanPankkia = 1 or f.suorittanut55pankinAvulla = 1 or f.suorittanut27 = 1) Then 1 Else 0 end) as suorittanut55,
  sum(case when (f.suorittanut55ilmanPankkia = 1) Then 1 Else 0 end) as suorittanut55ilmanPankkia,
  sum(case when (f.suorittanut55pankinAvulla = 1) Then 1 Else 0 end) as suorittanut55pankinAvulla,
  sum(case when (f.suorittanut27 = 1) Then 1 Else 0 end) as suorittanut27,
  f.source

FROM sa.sa_virta_otp_viisviis as f
LEFT JOIN dw.d_amk d1 ON d1.amk_tunnus = f.oppilaitostunnus
LEFT JOIN dw.d_koulutusluokitus d2 ON d2.koulutusluokitus_koodi = f.tkoodi

WHERE (f.suorittanut55ilmanPankkia = 1 or f.suorittanut55pankinAvulla = 1 or f.suorittanut27 = 1)
GROUP BY f.vuosi, month(f.loadtime), d1.id, d2.id, f.source


GO
