USE [VipunenTK_DW]
GO

DROP PROCEDURE IF EXISTS [dbo].[p_lataa_f_2_11b_Vapaan_sivistystyon_opiskelijaprofiili]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_f_2_11b_Vapaan_sivistystyon_opiskelijaprofiili]    Script Date: 20.1.2021 17:06:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Select * into VipunenTK.dbo.f_2_11b_Vapaan_sivistystyon_opiskelijaprofiili from ...
--
-- EXECUTE  VipunenTK_DW.dbo.[p_lataa_f_2_11b_Vapaan_sivistystyon_opiskelijaprofiili]

CREATE PROCEDURE [dbo].[p_lataa_f_2_11b_Vapaan_sivistystyon_opiskelijaprofiili] AS

TRUNCATE TABLE VipunenTK.dbo.f_2_11b_Vapaan_sivistystyon_opiskelijaprofiili

INSERT INTO [VipunenTK].[dbo].f_2_11b_Vapaan_sivistystyon_opiskelijaprofiili
 
SELECT [tilv]
      ,[tunn]
	  ,[tunn_id] = coalesce(d1.id, -1)
      ,[jarj]
	  ,[jarj_id] = coalesce(d2.id, -1)
	  ,[koultyp] =	case 
						when [lkm_avain] like '%vs%' then 'Vapaana sivistystyönä järjestetty koulutus'
						when [lkm_avain] like '%amk%' then 'Avoin ammattikorkeakouluopetus'
						when [lkm_avain] like '%ay%' then 'Avoin yliopisto-opetus'
					end
	  ,[koultyp_jarjestys] =	case 
									when [lkm_avain] like '%vs%' then 1
									when [lkm_avain] like '%amk%' then 2
									when [lkm_avain] like '%ay%' then 3
								end
	  ,[muuttuja] =	case 
						when right([lkm_avain],2) in ('11','12','13') then 'Koulutustaso'
						when right([lkm_avain],2) in ('14','15','16','17','18') then 'Pääasiallinen toiminta'
						when right([lkm_avain],2) in ('19','20','21','22','23','24','25','26') then 'Äidinkieli'
						else 'Ikä'
					end
	  ,[muuttuja_arvo] =	case 
								when right([lkm_avain],2) = '11' then 'Perusaste (kansakoulu, peruskoulu)'
								when right([lkm_avain],2) = '12' then 'Toinen aste (lukio, ammatillinen koulutus, sis. erikoisammattikoulutusaste)'
								when right([lkm_avain],2) = '13' then 'Korkea-aste (opisto-, alempi- ja ylempi korkeakoulutus- sekä tutkijakoulutusaste)'
								when right([lkm_avain],2) = '14' then 'Työllinen'
								when right([lkm_avain],2) = '15' then 'Työtön'
								when right([lkm_avain],2) = '16' then 'Opiskelija'
								when right([lkm_avain],2) = '17' then 'Eläkeläinen'
								when right([lkm_avain],2) = '18' then 'Muu toiminta'
								when right([lkm_avain],2) = '19' then 'Suomi'
								when right([lkm_avain],2) = '20' then 'Ruotsi'
								when right([lkm_avain],2) = '21' then 'Venäjä'
								when right([lkm_avain],2) = '22' then 'Viro'
								when right([lkm_avain],2) = '23' then 'Arabia'
								when right([lkm_avain],2) = '24' then 'Somali'
								when right([lkm_avain],2) = '25' then 'Englanti'
								when right([lkm_avain],2) = '26' then 'Muu kieli'
								when right([lkm_avain],1) = '1' then 'Ikä -19 v.' --Näin pääteltynä "koodit" 1-9 pitää olla muiden jälkeen
								when right([lkm_avain],1) = '2' then 'Ikä 20-24 v.'
								when right([lkm_avain],1) = '3' then 'Ikä 25-29 v.'
								when right([lkm_avain],1) = '4' then 'Ikä 30-34 v.'
								when right([lkm_avain],1) = '5' then 'Ikä 35-39 v.'
								when right([lkm_avain],1) = '6' then 'Ikä 40-44 v.'
								when right([lkm_avain],1) = '7' then 'Ikä 45-49 v.'
								when right([lkm_avain],1) = '8' then 'Ikä 50-54 v.'
								when right([lkm_avain],1) = '9' then 'Ikä 55-59 v.'
								when right([lkm_avain],2) = '10' then 'Ikä 60- v.'
							end 
	  ,[muuttuja_arvo_jarjestys] =	case 
										when right([lkm_avain],2) in ('10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26') then cast(right([lkm_avain],2) as int)
										else cast(right([lkm_avain],1) as int)
									end
	  ,[lkm_avain]
	  ,[lkm]

FROM VipunenTK_DW.dbo.sa_2_11b_Vapaan_sivistystyon_opiskelijaprofiili f

LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot d1 on d1.oppilaitos_avain = f.tunn
LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot d2 on d2.oppilaitos_avain = f.jarj


	
GO
use antero


