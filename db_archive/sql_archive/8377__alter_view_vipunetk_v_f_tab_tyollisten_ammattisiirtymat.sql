USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_tyollisten_ammattisiirtymat]    Script Date: 13.12.2023 14:47:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[v_f_tab_tyollisten_ammattisiirtymat] AS

SELECT 
	  Tilastovuosi = f.tilastovuosi

	  ,[Pääasiallinen toiminta] = d6b.paaasiallinen_toiminta_versio9
	  ,[Pääasiallinen toiminta siirtymän päässä] = d6c.paaasiallinen_toiminta_versio9
	  ,[Äidinkieli] = d2b.aidinkieli_versio5
	  ,[Toimiala] = 
			case
				when d6b.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ei työllinen'
				when d6b.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Tuntematon'
				when d6b.paaasiallinen_toiminta_versio9_koodi = 11 and d12.id = -1 THEN 'Toimiala tuntematon'
				else d12.toimiala_2008
			end
	  ,[Toimiala siirtymän päässä] = 
			case
				when d6c.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ei työllinen'
				when d6c.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Tuntematon'
				when d6c.paaasiallinen_toiminta_versio9_koodi = 11 and d13.id = -1 THEN 'Toimiala tuntematon'
				else d13.toimiala_2008
			end
	  ,[Toimiala sama kuin tilastovuonna] = 
			case 
				when d12.toimiala_2008=d13.toimiala_2008 then 'Toimiala sama kuin tilastovuonna'
				when d12.toimiala_2008<>d13.toimiala_2008 then 'Toimiala eri kuin tilastovuonna'
				else 'Tieto puuttuu'
			end
		--2002	
	  ,[Koulutusaste 2002] = d14.koulutusaste_2002
	  ,[Koulutusala 2002] = d18.koulutusala2002
	  ,[Opintoala 2002] = d18.opintoala2002
	  ,[Koulutusaste 2002 siirtymän päässä] = case when d15.koulutusaste_2002 = 'Tuntematon' then 'Ei uutta tutkintoa' else d15.koulutusaste_2002 end
	  ,[Koulutusala 2002 siirtymän päässä] = case when d19.koulutusala2002 = 'Tuntematon' then 'Ei uutta tutkintoa' else d19.koulutusala2002 end
	  ,[Opintoala 2002 siirtymän päässä] = case when d19.opintoala2002 = 'Tuntematon' then 'Ei uutta tutkintoa' else  d19.opintoala2002 end
	  ,[Erikoistumiskoulutuksen koulutusala siirtymän päässä] = d27.koulutusala2002
	  ,[Erikoistumiskoulutuksen opintoala siirtymän päässä] = d27.opintoala2002
		--2016
	  ,[Koulutusaste, taso 1] = d16.iscle2011
	  ,[Koulutusaste, taso 2] = d16.Koulutusaste_taso2
	  ,[Koulutusala, taso 1] = d20.iscfibroad2013
	  ,[Koulutusala, taso 2] = d20.iscfinarrow2013
	  ,[Koulutusaste, taso 1 siirtymän päässä] = case when d17.iscle2011 = 'Tuntematon' then 'Ei uutta tutkintoa' else d17.iscle2011 end
	  ,[Koulutusaste, taso 2 siirtymän päässä] = case when d17.Koulutusaste_taso2 = 'Tuntematon' then 'Ei uutta tutkintoa' else d17.koulutusaste_taso2 end
	  ,[Koulutusala, taso 1 siirtymän päässä] = case when d21.iscfibroad2013 = 'Tuntematon' then 'Ei uutta tutkintoa' else d21.iscfibroad2013 end
	  ,[Koulutusala, taso 2 siirtymän päässä] = case when d21.iscfinarrow2013 = 'Tuntematon' then 'Ei uutta tutkintoa' else d21.iscfinarrow2013 end  
	  ,[Koulutuslaji] = d22.ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa
	  ,[Koulutuslaji siirtymän päässä] = case when d23.ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa = 'Tuntematon' then 'Ei uutta tutkintoa' else d23.ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa end
	  ,[Opettajankelpoisuus] = d24.kylla_ei
	  ,[Opettajankelpoisuus siirtymän päässä] = d25.kylla_ei
	  ,[Työpaikan sijaintimaakunta sama kuin tilastovuonna] = d26.kylla_ei
	  ,[Erikoistumiskoulutuksen (AMK) koulutusala, taso 1 siirtymän päässä] = d28.iscfibroad2013
	  ,[Erikoistumiskoulutuksen (YO) koulutusala, taso 1 siirtymän päässä] = d29.iscfibroad2013
	  --,[Erikoistumiskoulutuksen koulutusala, taso 1 siirtymän päässä] = d30.iscfibroad2013
	  --,[Erikoistumiskoulutuksen koulutusala, taso 2 siirtymän päässä] = d30.iscfinarrow2013

	  --yhteiset
	  ,[Ikäryhmä] = case when f.lahde = 'R4.23' then d3.ika else d3.ika5v end
	  ,[Ammattiryhmä 1.taso (Mitenna)] = 
		case
			when d6b.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ei työllinen'
			when d6b.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Tuntematon'
			when d6b.paaasiallinen_toiminta_versio9_koodi = 11 and d5.id = -1 THEN '12 Ammatti tuntematon'
			else d5.mitenna_ammattiryhma1
		end
	  ,[Ammattiryhmä 1.taso] = 
		case
			when d6b.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ei työllinen'
			when d6b.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Tuntematon'
			when d6b.paaasiallinen_toiminta_versio9_koodi = 11 and d30.id = -1 THEN 'Ammatti tuntematon'
			else d30.oef_ammattiryhma1
		end
	  ,[Ammattiryhmä 2.taso (Mitenna)] = 
		case
			when d6b.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ei työllinen'
			when d6b.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Tuntematon'
			when d6b.paaasiallinen_toiminta_versio9_koodi = 11 and d5.id = -1 THEN '12 Ammatti tuntematon'
			else d5.mitenna_ammattiryhma2
		end
	  ,[Ammattiryhmä 2.taso] = 
		case
			when d6b.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ei työllinen'
			when d6b.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Tuntematon'
			when d6b.paaasiallinen_toiminta_versio9_koodi = 11 and d30.id = -1 THEN 'Ammatti tuntematon'
			else d30.oef_ammattiryhma2
		end
	  ,[Ammattiryhmä (1.taso) siirtymän päässä (Mitenna)] = 
		case
			when d6c.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ei työllinen'
			when d6c.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Tuntematon'
			else d8.mitenna_ammattiryhma1
		end
	  ,[Ammattiryhmä (1.taso) siirtymän päässä] = 
		case
			when d6c.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ei työllinen'
			when d6c.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Tuntematon'
			else d31.oef_ammattiryhma1
		end
	  ,[Ammattiryhmä (2.taso) siirtymän päässä (Mitenna)] = 
		case
			when d6c.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ei työllinen'
			when d6c.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Tuntematon'
			else d8.mitenna_ammattiryhma2
		end  
	  ,[Ammattiryhmä (2.taso) siirtymän päässä] = 
		case
			when d6c.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ei työllinen'
			when d6c.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Tuntematon'
			else d31.oef_ammattiryhma2
		end  
	  ,[Ammattiryhmä 1. taso sama kuin tilastovuonna] = case when d30.oef_ammattiryhma1=d31.oef_ammattiryhma1 then 'Ammattiryhmä 1. taso sama kuin tilastovuonna' else 'Ammattiryhmä 1. taso eri kuin tilastovuonna' end
	  ,[Ammattiryhmä 2. taso sama kuin tilastovuonna] = case when d30.oef_ammattiryhma2=d31.oef_ammattiryhma2 then 'Ammattiryhmä 2. taso sama kuin tilastovuonna' else 'Ammattiryhmä 2. taso eri kuin tilastovuonna' end
	  ,[Ammattiryhmä 1. taso sama kuin tilastovuonna (Mitenna)] = case when d5.mitenna_ammattiryhma1=d8.mitenna_ammattiryhma1 then 'Ammattiryhmä 1. taso sama kuin tilastovuonna' else 'Ammattiryhmä 1. taso eri kuin tilastovuonna' end
	  ,[Ammattiryhmä 2. taso sama kuin tilastovuonna (Mitenna)] = case when d5.mitenna_ammattiryhma2=d8.mitenna_ammattiryhma2 then 'Ammattiryhmä 2. taso sama kuin tilastovuonna' else 'Ammattiryhmä 2. taso eri kuin tilastovuonna' end
	  ,[Siirtymän tarkastelusuunta] = 
			case d11.siirtyman_tarkastelusuunta 
				when 'Siirtymän tarkastelusuunta ajassa eteenpäin' then 'Ajassa eteenpäin'
				when 'Siirtymän tarkastelusuunta ajassa taaksepäin' then 'Ajassa taaksepäin'
				else 'Tieto puuttuu'
			end
	  ,[Perusjoukko] = d10.perusjoukko_tyolliset
	  ,[Suhteellinen ajankohta] = d9.suhteellinen_ajankohta
	  ,[lkm]
	  ,[Lähde] = f.lahde
	  ,[ammattiryhma_luokitus] =
		case 
			when (d9.suhteellinen_ajankohta_avain  = 'tilv+1' and f.tilastovuosi > 2015) or (d9.suhteellinen_ajankohta_avain  = 'tilv+5' and f.tilastovuosi > 2010) then 'oef' 
			else 'mitenna' 
		end

	  --järjestyskentät

	  ,[järjestys Ikä ] = d3.jarjestys_ika5v
	  ,[järjestys Ammattiryhmä1 ] = case when d6b.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ö999' when d6b.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Ö998' else d30.jarjestys_ammattiryhma1 end 
	  ,[järjestys Ammattiryhmä2 ] = case when d6b.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ö999' when d6b.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Ö998' else d30.jarjestys_ammattiryhma2 end
	  ,[järjestys Ammattiryhmä1 (Mitenna)] = case when d6b.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ö999' when d6b.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Ö998' when d6b.paaasiallinen_toiminta_versio9_koodi = 11 and d5.id = -2 THEN 'MITENNA99' else d5.jarjestys_ammattiryhma1 end 
	  ,[järjestys Ammattiryhmä2 (Mitenna)] = case when d6b.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ö999' when d6b.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Ö998' when d6b.paaasiallinen_toiminta_versio9_koodi = 11 and d5.id = -2 THEN 'MITENNA99' else d5.jarjestys_ammattiryhma2 end
	  ,[järjestys Pääasiallinen toiminta] = d6b.jarjestys
	  ,[järjestys Ammattiryhmä1 siirtymä ] = case when d6c.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ö999' when d6c.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Ö998' else d31.jarjestys_ammattiryhma1 end
	  ,[järjestys Ammattiryhmä2 siirtymä ] = case when d6c.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ö999' when d6c.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Ö998' else d31.jarjestys_ammattiryhma2 end
	  ,[järjestys Ammattiryhmä1 siirtymä (Mitenna)] = case when d6c.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ö999' when d6c.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Ö998' else d8.jarjestys_ammattiryhma1 end
	  ,[järjestys Ammattiryhmä2 siirtymä (Mitenna)] = case when d6c.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ö999' when d6c.paaasiallinen_toiminta_versio9_koodi = -1 THEN 'Ö998' else d8.jarjestys_ammattiryhma2 end
	  ,[järjestys Ajankohta ] = d9.jarjestys
	  ,[järjestys Perusjoukko ] = d10.jarjestys
	  ,[järjestys Siirtymä ] = d11.jarjestys
	  ,[järjestys Ammattiryhmä 1. taso sama kuin tilastovuonna ] = case when d30.oef_ammattiryhma1=d31.oef_ammattiryhma1 then 1 else 2 end
	  ,[järjestys Ammattiryhmä 2. taso sama kuin tilastovuonna ] = case when d30.oef_ammattiryhma2=d31.oef_ammattiryhma2 then 1 else 2 end
	  ,[järjestys Ammattiryhmä 1. taso sama kuin tilastovuonna (Mitenna)] = case when d5.mitenna_ammattiryhma1=d8.mitenna_ammattiryhma1 then 1 else 2 end
	  ,[järjestys Ammattiryhmä 2. taso sama kuin tilastovuonna (Mitenna)] = case when d5.mitenna_ammattiryhma2=d8.mitenna_ammattiryhma2 then 1 else 2 end
	  ,[järjestys Pääasiallinen toiminta siirtymän päässä] = d6c.jarjestys
	  ,[järjestys Äidinkieli] = d2b.jarjestys
	  ,[järjestys Toimiala] = case when d6b.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ö999' when d6b.paaasiallinen_toiminta_versio9_koodi = -1 then 'Ö998' when (d6b.paaasiallinen_toiminta_versio9_koodi = 11 and d12.id = -1) or d12.toimiala_2008 = 'Toimiala tuntematon' then 'Ö997' else d12.toimiala_2008 end
	  ,[järjestys Toimiala siirtymän päässä] = case when d6c.paaasiallinen_toiminta_versio9_koodi not in (11,-1) THEN 'Ö999' when d6c.paaasiallinen_toiminta_versio9_koodi = -1 then 'Ö998' when (d6c.paaasiallinen_toiminta_versio9_koodi = 11 and d13.id = -1) or d13.toimiala_2008 = 'Toimiala tuntematon' then 'Ö997' else d13.toimiala_2008 end
	  ,[järjestys Toimiala sama kuin tilastovuonna] = 
			case 
				when d12.toimiala_2008=d13.toimiala_2008 then 1
				when d12.toimiala_2008<>d13.toimiala_2008 then 2
				else 9
			end
	  ,[järjestys Koulutusaste 2002] = d14.jarjestys
	  ,[järjestys Koulutusaste 2002 siirtymän päässä] = d15.jarjestys
	  ,[järjestys Opintoala 2002] = d18.jarjestys_opintoala2002
	  ,[järjestys Opintoala 2002 siirtymän päässä] = d19.jarjestys_opintoala2002
	  ,[järjestys Koulutusala 2002] = d18.jarjestys_koulutusala2002
	  ,[järjestys Koulutusala 2002 siirtymän päässä] = d19.jarjestys_koulutusala2002
	  ,[järjestys Erikoistumiskoulutuksen koulutusala siirtymän päässä] = d27.jarjestys_koulutusala2002
	  ,[järjestys Erikoistumiskoulutuksen opintoala siirtymän päässä] = d27.jarjestys_opintoala2002
	  ,[järjestys Koulutusaste, taso 1] = d16.jarjestys_iscle2011
	  ,[järjestys Koulutusaste, taso 2] = d16.jarjestys_Koulutusaste_taso2
	  ,[järjestys Koulutusala, taso 1] = d20.jarjestys_iscfibroad2013
	  ,[järjestys Koulutusala, taso 2] = d20.jarjestys_iscfinarrow2013
	  ,[järjestys Koulutusaste, taso 1 siirtymän päässä] = d17.jarjestys_iscle2011
	  ,[järjestys Koulutusaste, taso 2 siirtymän päässä] = d17.jarjestys_Koulutusaste_taso2
	  ,[järjestys Koulutusala, taso 1 siirtymän päässä] = d21.jarjestys_iscfibroad2013
	  ,[järjestys Koulutusala, taso 2 siirtymän päässä] = d21.jarjestys_iscfinarrow2013
	  ,[järjestys Koulutuslaji] = d22.jarjestys
	  ,[järjestys Koulutuslaji siirtymän päässä] = d23.jarjestys
	  ,[järjestys Opettajankelpoisuus] = d24.jarjestys
	  ,[järjestys Opettajankelpoisuus siirtymän päässä] = d25.jarjestys
	  ,[järjestys Työpaikan sijaintimaakunta sama kuin tilastovuonna] = d26.jarjestys
	  ,[järjestys Erikoistumiskoulutuksen (AMK) koulutusala, taso 1 siirtymän päässä] = d28.jarjestys_iscfibroad2013
	  ,[järjestys Erikoistumiskoulutuksen (YO) koulutusala, taso 1 siirtymän päässä] = d29.jarjestys_iscfibroad2013
	  --,[järjestys Erikoistumiskoulutuksen koulutusala, taso 1 siirtymän päässä] = d30.jarjestys_iscfibroad2013
	  --,[järjestys Erikoistumiskoulutuksen koulutusala, taso 2 siirtymän päässä] = d30.jarjestys_iscfinarrow2013


  FROM [VipunenTK].[dbo].[f_tyollisten_ammattisiirtymat_ja_aiemmat_ammatit] f
  LEFT JOIN dbo.d_aidinkieli_versio5 d2b on d2b.id=f.aidinkieli_versio5_id
  LEFT JOIN dbo.d_ika d3 on d3.id=f.ika_id	
  LEFT JOIN dbo.d_mitenna_ammatti d5 on d5.id=f.mitenna_ammatti_id
  LEFT JOIN dbo.d_paaasiallinen_toiminta_versio9 d6b on d6b.id=f.paaasiallinen_toimintar9_id
  LEFT JOIN dbo.d_paaasiallinen_toiminta_versio9 d6c on d6c.id=f.paaasiallinen_toimintar9_siirtyman_paassa_id
  LEFT JOIN dbo.d_mitenna_ammatti d8 on d8.id=f.mitenna_ammatti_siirtyman_paassa_id
  LEFT JOIN dbo.d_suhteellinen_ajankohta d9 on d9.id=f.suhteellinen_ajankohta_id
  LEFT JOIN dbo.d_perusjoukko_tyolliset d10 on d10.id=f.perusjoukko_tyolliset_id
  LEFT JOIN dbo.d_siirtyman_tarkastelusuunta d11 on d11.id=f.siirtyman_tarkastelusuunta_id
  LEFT JOIN dbo.d_toimiala_2008 d12 on d12.id=f.toimiala_id
  LEFT JOIN dbo.d_toimiala_2008 d13 on d13.id=f.toimiala_siirtyman_paassa_id
  LEFT JOIN dbo.d_koulutusaste_2002 d14 on d14.id=f.koulutusaste_vanha_id
  LEFT JOIN dbo.d_koulutusaste_2002 d15 on d15.id=f.koulutusaste_vanha_siirtyman_paassa_id
  LEFT JOIN dbo.d_koulutusluokitus d16 on d16.id=f.koulutusala_taso2_id
  LEFT JOIN dbo.d_koulutusluokitus d17 on d17.id=f.koulutusala_taso2_siirtyman_paassa_id
  LEFT JOIN dbo.d_koulutusluokitus d18 on d18.id=f.opintoala_id
  LEFT JOIN dbo.d_koulutusluokitus d19 on d19.id=f.opintoala_siirtyman_paassa_id
  LEFT JOIN dbo.d_koulutusluokitus d20 on d20.id=f.koulutusala_taso2_id
  LEFT JOIN dbo.d_koulutusluokitus d21 on d21.id=f.koulutusala_taso2_siirtyman_paassa_id
  LEFT JOIN dbo.d_ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa d22 on d22.id=f.koulutuslaji_id
  LEFT JOIN dbo.d_ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa d23 on d23.id=f.koulutuslaji_siirtyman_paassa_id
  LEFT JOIN dbo.d_kylla_ei d24 on d24.id=f.opettajankelpoisuus_id
  LEFT JOIN dbo.d_kylla_ei d25 on d25.id=f.opettajankelpoisuus_siirtyman_paassa_id
  LEFT JOIN dbo.d_kylla_ei d26 on d26.id=f.tyopaikan_sijaintimaakunta_sama_kylla_ei_id
  LEFT JOIN dbo.d_koulutusluokitus d27 on d27.id=f.opintoala_erikoistumiskoulutus_siirtyman_paassa_id
  LEFT JOIN dbo.d_koulutusluokitus d28 ON d28.id=f.koulutusala_taso1_erikoistumiskoulutus_amk_siirtyman_paassa_id
  LEFT JOIN dbo.d_koulutusluokitus d29 ON d29.id=f.koulutusala_taso1_erikoistumiskoulutus_yo_siirtyman_paassa_id
  LEFT JOIN dbo.d_oef_ammatti d30 on d30.id=f.oef_ammatti_id
  LEFT JOIN dbo.d_oef_ammatti d31 on d31.id=f.oef_ammatti_siirtyman_paassa_id
  WHERE f.lahde = 'R4.23'

GO

USE [ANTERO]