USE [VipunenTK_DW]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_f_tutkintoon_johtamaton_koulutus]    Script Date: 16.12.2020 19:19:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--
-- Lataa aineiston 2.11 faktatauluun 
--
-- Taulun luonti
-- Select * into VipunenTK.dbo.f_TJK_2_11_tutkintoon_johtamaton_koulutus from ...
--
-- EXECUTE  VipunenTK_DW.dbo.[p_lataa_f_tutkintoon_johtamaton_koulutus]

ALTER PROCEDURE [dbo].[p_lataa_f_tutkintoon_johtamaton_koulutus] AS

-- Taulussa VipunenTK_DW.dbo.f_2_11_Oppilaitosten_tutkintoon_johtamaton_unpivot on
-- unpivotoitu muoto lähtöaineistosta.

Delete from VipunenTK.dbo.f_TJK_2_11_tutkintoon_johtamaton_koulutus

INSERT INTO [VipunenTK].[dbo].[f_TJK_2_11_tutkintoon_johtamaton_koulutus]
           ([tilastointivuosi]
           ,[opetustunti_avain]
           ,[opetustunti_id]
           ,[oppilaitos_avain]
           ,[oppilaitos_id]
           ,[koulutuksen_jarjestaja]
           ,[oppilaitoksen_sijaintikunta_id]
           ,[yllapitajan_sijaintikunta_id]
           ,[sukupuoli_koodi]
           ,[sukupuoli_id]
		   ,[eikoul_id]
           ,[Opetustuntien lukumäärä]
           ,[Osallistuneiden lukumäärä]
           ,[Suorittaneiden lukumäärä]
           ,[Koulutusten lukumäärä]
           ,[tietolahde]
           ,[rivinumero])
	SELECT
		   fa.[tilastointivuosi]
		  ,opetustunti_avain = op.opetustuntikoodi
		  ,opetustunti_id = ISNULL(op.id, -1)
		  ,oppilaitos_avain = fa.[oppilaitos]
		  ,oppilaitos_id = ISNULL(ol.id, -1)
		  ,fa.[koulutuksen_jarjestaja]
		  ,oppilaitoksen_sijaintikunta_id = ISNULL(al_ol.id, -1)
		  ,yllapitajan_sijaintikunta_id = isnull(al_kj.id, -1)
		  ,sukupuoli_koodi = Case left(op.Sukupuoli,1) when 'M' then '1' when 'N' then '2' else '-1' end
		  ,sukupuoli_id = ISNULL(sp.id, -2)
		  ,eikoul_id = ISNULL(ke.id, -1)
		  ,[Opetustuntien lukumäärä] = Case when op.Mittari = 'T' then fa.mittari_arvo else NULL end
		  ,[Osallistuneiden lukumäärä] = Case when op.Mittari = 'O' then 
		  -- Lasketaan miesten määrä "yhteensä - naisten määrä", jos sukupuolitieto on tarjolla ja se on mies
				Case 
					when left(op.Sukupuoli,1)='M' and op.Naistenosuuskoodi<>'' 
					then isnull(fa.mittari_arvo,0) 
						- isnull(
								 (
									Select sum(fa2.mittari_arvo) 
									from VipunenTK_DW.dbo.f_2_11_Oppilaitosten_tutkintoon_johtamaton_unpivot fa2
									where fa2.mittari_nimi=op.Naistenosuuskoodi and fa2.rivinumero=fa.rivinumero and fa2.tietolahde=fa.tietolahde
								 )
						  , 0)
					else fa.mittari_arvo 
				end
			else NULL end -- ei O
		  ,[Suorittaneiden lukumäärä] = Case when op.Mittari = 'S' then fa.mittari_arvo else NULL end
		  ,[Koulutusten lukumäärä] = Case when op.Mittari = 'K' then fa.mittari_arvo else NULL end
		  ,fa.[tietolahde]
		  ,fa.[rivinumero]
	  --INTO VipunenTK.dbo.f_TJK_2_11_tutkintoon_johtamaton_koulutus
	  FROM VipunenTK_DW.dbo.f_2_11_Oppilaitosten_tutkintoon_johtamaton_unpivot fa
	--join vipunen_ETL.v_sa_2_11_Oppilaitosten_tutkintoon_johtamaton st
	--  on st.rivinumero = fa.rivinumero and st.tilv = fa.tilastointivuosi
	left join VipunenTK_lisatiedot.dbo.opetustuntien_sisalto_ja_tavoiteluokitus op
	  on op.Opetustuntikoodi = fa.mittari_nimi
	  and fa.tilastointivuosi between year(alkaa) and year(paattyy)
	left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot ol
	  on ol.oppilaitos_avain = fa.oppilaitos
	left join VipunenTK.dbo.d_alueluokitus al_kj
	  on al_kj.alueluokitus_avain = ol.koulutuksen_jarjestajan_ksijaintikuntakoodi
	left join VipunenTK.dbo.d_alueluokitus al_ol
	  on al_ol.alueluokitus_avain = ol.sijaintikuntakoodi
	left join VipunenTK.dbo.d_sukupuoli sp
	  on sp.sukupuoli_koodi = Case left(op.Sukupuoli,1) when 'M' then '1' when 'N' then '2' else '-1' end
	left join VipunenTK.dbo.d_kylla_ei ke
	  on ke.kylla_ei_koodi = case fa.eikoul when 1 then '1' when 2 then '0' end
	where op.KuutioonKE = 'K' -- ei viedä yhteensä-rivejä tai muita poistettavia

GO
USE [ANTERO]