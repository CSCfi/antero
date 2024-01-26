USE [VipunenTK]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









CREATE OR ALTER VIEW [dbo].[v_f_tab_jatkuva_oppiminen_tutk_joht_tai_kurssikoul_osallistuneet_1_24_cultures] AS

SELECT

	[apusarake_aineisto] = aineisto
	,[apusarake_total] = 
		case 
			when v.taustamuuttuja in ('sp', 'ikar6', 'kaste_t0') and v.taustamuuttujan_arvo like '%S%' then 1
			when v.taustamuuttuja = 'tol2008_1_v3' and v.taustamuuttujan_arvo = 'SS' then 1
			when v.taustamuuttuja not in ('sp', 'ikar6', 'kaste_t0', 'tol2008_1_v3') and v.taustamuuttujan_arvo like '%S%' then 1
			else 0
		end
	,[apusarake_total_2] = 
		case 
			when v.taustamuuttuja_2 in ('sp', 'ikar6', 'kaste_t0') and v.taustamuuttujan_2_arvo not like '%S%' then 0
			else 1
		end
    ,[apusarake_Opisk_laaja_osuus] = Opisk_laaja_osuus
    ,[apusarake_Opisk_tutko_osuus] = Opisk_tutko_osuus
    ,[apusarake_Opisk_kurssi_osuus] = Opisk_kurssi_osuus
	  
	--fi
	,[tilastovuosi_fi] = [tilv]
    ,d.[perusjoukko_fi]
    ,d.[taustamuuttuja_fi]
    ,d.[taustamuuttujan_arvo_fi]
    ,d.[taustamuuttuja_2_fi]
    ,d.[taustamuuttujan_2_arvo_fi]
    ,[sukupuoli_fi] = case when d.taustamuuttuja = 'sp' then d.taustamuuttujan_arvo_fi when d.taustamuuttuja_2 = 'sp' then d.taustamuuttujan_2_arvo_fi else '' end
    ,[ikaryhma_fi] = case when d.taustamuuttuja = 'ikar6' then d.taustamuuttujan_arvo_fi when d.taustamuuttuja_2 = 'ikar6' then d.taustamuuttujan_2_arvo_fi else '' end
    ,[koulutustaso_fi] = case when d.taustamuuttuja = 'kaste_t0' then d.taustamuuttujan_arvo_fi when d.taustamuuttuja_2 = 'kaste_t0' then d.taustamuuttujan_2_arvo_fi else '' end
    ,[syntypera_fi] = case when d.taustamuuttuja = 'syntyp' then d.taustamuuttujan_arvo_fi when d.taustamuuttuja_2 = 'syntyp' then d.taustamuuttujan_2_arvo_fi else '' end
    ,[alue_fi] = case when d.taustamuuttuja = 'avi' then d.taustamuuttujan_arvo_fi when d.taustamuuttuja_2 = 'avi' then d.taustamuuttujan_2_arvo_fi else '' end
    ,[toimiala_fi] = case when d.taustamuuttuja = 'tol2008_1_v3' then d.taustamuuttujan_arvo_fi when d.taustamuuttuja_2 = 'tol2008_1_v3' then d.taustamuuttujan_2_arvo_fi else '' end
    ,[tyonantajasektori_fi] = case when d.taustamuuttuja = 'tsekt_v2' then d.taustamuuttujan_arvo_fi when d.taustamuuttuja_2 = 'tsekt_v2' then d.taustamuuttujan_2_arvo_fi else '' end
    ,[sosioekonominen_asema_fi] = case when d.taustamuuttuja = 'sose_v2' then d.taustamuuttujan_arvo_fi when d.taustamuuttuja_2 = 'sose_v2' then d.taustamuuttujan_2_arvo_fi else '' end

	--sv
	,[tilastovuosi_sv] = [tilv]
    ,d.[perusjoukko_sv]
    ,d.[taustamuuttuja_sv]
    ,d.[taustamuuttujan_arvo_sv]
    ,d.[taustamuuttuja_2_sv]
    ,d.[taustamuuttujan_2_arvo_sv]
    ,[sukupuoli_sv] = case when d.taustamuuttuja = 'sp' then d.taustamuuttujan_arvo_sv when d.taustamuuttuja_2 = 'sp' then d.taustamuuttujan_2_arvo_sv else '' end
    ,[ikaryhma_sv] = case when d.taustamuuttuja = 'ikar6' then d.taustamuuttujan_arvo_sv when d.taustamuuttuja_2 = 'ikar6' then d.taustamuuttujan_2_arvo_sv else '' end
    ,[koulutustaso_sv] = case when d.taustamuuttuja = 'kaste_t0' then d.taustamuuttujan_arvo_sv when d.taustamuuttuja_2 = 'kaste_t0' then d.taustamuuttujan_2_arvo_sv else '' end
    ,[syntypera_sv] = case when d.taustamuuttuja = 'syntyp' then d.taustamuuttujan_arvo_sv when d.taustamuuttuja_2 = 'syntyp' then d.taustamuuttujan_2_arvo_sv else '' end
    ,[alue_sv] = case when d.taustamuuttuja = 'avi' then d.taustamuuttujan_arvo_sv when d.taustamuuttuja_2 = 'avi' then d.taustamuuttujan_2_arvo_sv else '' end
    ,[toimiala_sv] = case when d.taustamuuttuja = 'tol2008_1_v3' then d.taustamuuttujan_arvo_sv when d.taustamuuttuja_2 = 'tol2008_1_v3' then d.taustamuuttujan_2_arvo_sv else '' end
    ,[tyonantajasektori_sv] = case when d.taustamuuttuja = 'tsekt_v2' then d.taustamuuttujan_arvo_sv when d.taustamuuttuja_2 = 'tsekt_v2' then d.taustamuuttujan_2_arvo_sv else '' end
    ,[sosioekonominen_asema_sv] = case when d.taustamuuttuja = 'sose_v2' then d.taustamuuttujan_arvo_sv when d.taustamuuttuja_2 = 'sose_v2' then d.taustamuuttujan_2_arvo_sv else '' end

	--en
	,[tilastovuosi_en] = [tilv]
    ,d.[perusjoukko_en]
    ,d.[taustamuuttuja_en]
    ,d.[taustamuuttujan_arvo_en]
    ,d.[taustamuuttuja_2_en]
    ,d.[taustamuuttujan_2_arvo_en]
    ,[sukupuoli_en] = case when d.taustamuuttuja = 'sp' then d.taustamuuttujan_arvo_en when d.taustamuuttuja_2 = 'sp' then d.taustamuuttujan_2_arvo_en else '' end
    ,[ikaryhma_en] = case when d.taustamuuttuja = 'ikar6' then d.taustamuuttujan_arvo_en when d.taustamuuttuja_2 = 'ikar6' then d.taustamuuttujan_2_arvo_en else '' end
    ,[koulutustaso_en] = case when d.taustamuuttuja = 'kaste_t0' then d.taustamuuttujan_arvo_en when d.taustamuuttuja_2 = 'kaste_t0' then d.taustamuuttujan_2_arvo_en else '' end
    ,[syntypera_en] = case when d.taustamuuttuja = 'syntyp' then d.taustamuuttujan_arvo_en when d.taustamuuttuja_2 = 'syntyp' then d.taustamuuttujan_2_arvo_en else '' end
    ,[alue_en] = case when d.taustamuuttuja = 'avi' then d.taustamuuttujan_arvo_en when d.taustamuuttuja_2 = 'avi' then d.taustamuuttujan_2_arvo_en else '' end
    ,[toimiala_en] = case when d.taustamuuttuja = 'tol2008_1_v3' then d.taustamuuttujan_arvo_en when d.taustamuuttuja_2 = 'tol2008_1_v3' then d.taustamuuttujan_2_arvo_en else '' end
    ,[tyonantajasektori_en] = case when d.taustamuuttuja = 'tsekt_v2' then d.taustamuuttujan_arvo_en when d.taustamuuttuja_2 = 'tsekt_v2' then d.taustamuuttujan_2_arvo_en else '' end
    ,[sosioekonominen_asema_en] = case when d.taustamuuttuja = 'sose_v2' then d.taustamuuttujan_arvo_en when d.taustamuuttuja_2 = 'sose_v2' then d.taustamuuttujan_2_arvo_en else '' end
  
	--jarjestys
    ,[jarjestys_taustamuuttujan_arvo] = d.jarjestys
    ,[jarjestys_taustamuuttujan_2_arvo] = d.jarjestys2
    ,[jarjestys_sukupuoli] = case when d.taustamuuttuja = 'sp' then d.taustamuuttujan_arvo when d.taustamuuttuja_2 = 'sp' then d.taustamuuttujan_2_arvo else 'ööö' end
    ,[jarjestys_ikaryhma] = case when d.taustamuuttuja = 'ikar6' then d.taustamuuttujan_arvo when d.taustamuuttuja_2 = 'ikar6' then d.taustamuuttujan_2_arvo else 'ööö' end
    ,[jarjestys_koulutustaso] = case when d.taustamuuttuja = 'kaste_t0' then d.taustamuuttujan_arvo when d.taustamuuttuja_2 = 'kaste_t0' then d.taustamuuttujan_2_arvo else 'ööö' end
    ,[jarjestys_syntypera] = case when d.taustamuuttuja = 'syntyp' then d.taustamuuttujan_arvo when d.taustamuuttuja_2 = 'syntyp' then d.taustamuuttujan_2_arvo else 'ööö' end
    ,[jarjestys_alue] = case when d.taustamuuttuja = 'avi' then d.taustamuuttujan_arvo when d.taustamuuttuja_2 = 'avi' then d.taustamuuttujan_2_arvo else 'ööö' end
    ,[jarjestys_toimiala] = case when d.taustamuuttuja = 'tol2008_1_v3' then nullif(d.taustamuuttujan_arvo, 'SS') when d.taustamuuttuja_2 = 'tol2008_1_v3' then nullif(d.taustamuuttujan_2_arvo, 'SS') else 'ööö' end
    ,[jarjestys_tyonantajasektori] = case when d.taustamuuttuja = 'tsekt_v2' then d.taustamuuttujan_arvo when d.taustamuuttuja_2 = 'tsekt_v2' then d.taustamuuttujan_2_arvo else 'ööö' end
    ,[jarjestys_sosioekonominen_asema] = case when d.taustamuuttuja = 'sose_v2' then d.taustamuuttujan_arvo when d.taustamuuttuja_2 = 'sose_v2' then d.taustamuuttujan_2_arvo else 'ööö' end

FROM [VipunenTK_SA].[dbo].[v_sa_1_24_Jatkuva_oppiminen_tutk_joht_tai_kurssikoul_osallistuneet] v
LEFT JOIN dbo.d_1_24_taustamuuttujan_arvo d 
	ON d.perusjoukko = v.perusjoukko 
		and d.taustamuuttuja = v.taustamuuttuja 
		and d.taustamuuttujan_arvo = v.taustamuuttujan_arvo
		and d.taustamuuttuja_2 = v.taustamuuttuja_2 
		and d.taustamuuttujan_2_arvo = v.taustamuuttujan_2_arvo
