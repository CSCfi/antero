USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_2_11_Oppilaitosten_tutkintoon_johtamaton_vst_oppilaitostyyppi]    Script Date: 3.2.2022 19:35:54 ******/
DROP VIEW IF EXISTS [dbo].[v_sa_2_11_Oppilaitosten_tutkintoon_johtamaton_vst_oppilaitostyyppi]
GO

/****** Object:  View [dbo].[v_sa_2_11_Oppilaitosten_tutkintoon_johtamaton_vst_oppilaitostyyppi]    Script Date: 3.2.2022 19:35:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[v_sa_2_11_Oppilaitosten_tutkintoon_johtamaton_vst_oppilaitostyyppi] AS

-- Select * from VipunenTK_SA.[dbo].[v_sa_2_11_Oppilaitosten_tutkintoon_johtamaton_vst_oppilaitostyyppi]
--
-- Drop table VipunenTK_DW.[dbo].sa_2_11_Oppilaitosten_tutkintoon_johtamaton_vst_oppilaitostyyppi
-- Select * into VipunenTK_DW.[dbo].sa_2_11_Oppilaitosten_tutkintoon_johtamaton_vst_oppilaitostyyppi from VipunenTK_SA.[dbo].[v_sa_2_11_Oppilaitosten_tutkintoon_johtamaton_vst_oppilaitostyyppi]
--
-- Truncate table VipunenTK_DW.[dbo].sa_2_11_Oppilaitosten_tutkintoon_johtamaton_vst_oppilaitostyyppi
-- Insert into VipunenTK_DW.[dbo].sa_2_11_Oppilaitosten_tutkintoon_johtamaton_vst_oppilaitostyyppi Select * from VipunenTK_SA.[dbo].v_sa_2_11_Oppilaitosten_tutkintoon_johtamaton_vst_oppilaitostyyppi

SELECT 
tilv = cast(tilv as nvarchar(4)), 
tunn = cast(tunn as nvarchar(5)), 
jarj = cast(jarj as nvarchar(10)), 
vst_oltyp = cast(oltyp as varchar(2)), 
sum([lkm_brutto]) lkm_brutto, 
sum([lkm_netto]) lkm_netto

FROM
(
  SELECT f.tilv, f.tunn, f.jarj
    ,[oltyp] = min(d.oppilaitostyyppikoodi)
	,[lkm_brutto] = max(osa11)
	,[lkm_netto] = max(osa15)
  FROM VipunenTK_SA.dbo.v_sa_2_11_Oppilaitosten_tutkintoon_johtamaton f
  LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot_historia d on d.oppilaitos_avain = f.tunn AND f.tilv_date BETWEEN d.alkaa AND d.paattyy
  WHERE tilv > 2019 
    AND osa11 > 0 
	AND osa18+osa19+osa20+osa21+osa22+osa23 = 0 --yhdistyneet vst (oltyp 62-66) erikseen alla
	AND d.oppilaitostyyppikoodi IN ('62','63','64','65','66','99')
  GROUP BY f.tilv, f.tunn, f.jarj
  
  UNION ALL

  SELECT [tilv], [tunn], [jarj]
	,[oltyp] = 
		case 
			when lkm_avain in ('osa18','osa24') then '62'
			when lkm_avain in ('osa19','osa25') then '63'
			when lkm_avain in ('osa20','osa26') then '64'
			when lkm_avain in ('osa21','osa27') then '65'
			when lkm_avain in ('osa22','osa28') then '66'
			when lkm_avain in ('osa23','osa29') then '99'
		end
	,[lkm_brutto] = case when right(lkm_avain,2) between 18 and 23 then lkm else 0 end
	,[lkm_netto] = case when right(lkm_avain,2) between 24 and 29 then lkm else 0 end

	FROM
	(
	  SELECT [tilv], [tunn], [jarj]
	    , max(osa18) osa18, max(osa19) osa19, max(osa20) osa20, max(osa21) osa21, max(osa22) osa22, max(osa23) osa23 --brutto
		, max(osa24) osa24, max(osa25) osa25, max(osa26) osa26, max(osa27) osa27, max(osa28) osa28, max(osa29) osa29 --netto
	  FROM VipunenTK_SA.dbo.v_sa_2_11_Oppilaitosten_tutkintoon_johtamaton f
	  WHERE osa18+osa19+osa20+osa21+osa22+osa23 > 0 --yhdistyneet vst (oltyp 62-66)
	  GROUP BY [tilv], [tunn], [jarj]

	  --UNION ALL

	) pvt

	UNPIVOT
	(
	  lkm FOR lkm_avain IN (
		osa18,osa19,osa20,osa21,osa22,osa23,
		osa24,osa25,osa26,osa27,osa28,osa29
	  )
	) unpvt

	WHERE lkm > 0

) q

GROUP BY tilv, tunn, jarj, oltyp


GO


