USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_f_aloittaneiden_lapaisy]    Script Date: 9.1.2026 14.31.31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dbo].[p_lataa_f_aloittaneiden_lapaisy] AS

TRUNCATE TABLE [VipunenTK].[dbo].[f_aloittaneiden_lapaisy];

DECLARE @tj nvarchar(4);

DECLARE tj_cursor CURSOR FAST_FORWARD FOR
(
	SELECT DISTINCT tarkasteluperiodi_char 
	--FROM VipunenTK_DW.dbo._aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet
	FROM VipunenTK_DW.dbo.v_aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet
);

OPEN tj_cursor;

FETCH NEXT FROM tj_cursor 
INTO @tj;

WHILE @@FETCH_STATUS = 0
BEGIN

	INSERT INTO [VipunenTK].[dbo].[f_aloittaneiden_lapaisy]
        ([rivinumero]
        ,[tilv]
        ,[lahde]
        ,[lahde_id]
        ,[opp]
        ,[oppilaitoksen_taustatiedot_avain]
        ,[oppilaitoksen_taustatiedot_id]
        --,[oppilaitoksen_taustatiedot_historia_id]
        ,[sp]
        ,[sp_id]
        ,[syntv]
        ,[ika]
        ,[ika_id]
        ,[aikielir1]
        ,[aikielir1_id]
        ,[alvv]
        ,[allk]
        ,[aloituskausikoodi]
        ,[klaji]
        ,[ophal]
        ,[ophal_id]
        ,[jarj]
        ,[kkun]
        --,[alueluokitus_historia_id]
        ,[alueluokitus_id]
        ,[maak]
        ,[koulk]
        --,[koulk_historia_id]
        ,[koulk_id]
        --,[opmala]
        --,[opmopa]
        --,[opmast]
        --,[opm95opa]
        ,[koulutussektori]
        ,[pohjkoulk]
        --,[pohjkoulk_historia_id]
        ,[pohjkoulk_id]
        ,[alvv_kk]
        ,[allk_kk]
        ,[aloituskausikoodi_kk]
        ,[ololk]
        ,[ololk_id]
        ,[rahlahde]
        ,[rahlahde_id]
        ,[koulutuslaji2]
        ,[koulutuslaji2_id]
        ,[saavutettu_suorv]
        ,[saavutettu_suorlk]
        ,[saavutettu_kausikoodi]
        ,[saavutettu_tutkmaak]
        --,[saavutettu_alueluokitus_historia_id]
        ,[saavutettu_alueluokitus_id]
        ,[saavutettu_tutkjarj]
        ,[saavutettu_tutkopp]
        ,[saavutettu_oppilaitoksen_taustatiedot_avain]
        ,[saavutettu_oppilaitoksen_taustatiedot_id]
        --,[saavutettu_oppilaitoksen_taustatiedot_historia_id]
        ,[saavutettu_tutkkoulk]
        --,[saavutettu_koulk_historia_id]
        ,[saavutettu_koulk_id]
        --,[saavutettu_tutkopmala]
        --,[saavutettu_tutkopmopa]
        --,[saavutettu_tutkopmast]
        --,[saavutettu_tutkopm95opa]
        ,[saavutettu_tutkkoulutussektori]
        ,[tarkastelujakso]
        ,[tarkastelujakso_id]
        ,[aloitus_saavutus]
        ,[tarkastelujakso_tulevaisuus]
        ,[tarkastelujakso_edustavuus]
        ,[tietolahde]
        ,[aineistokoodi]
        ,[aineistorivinumero]
        ,[lkm_int]
        ,[1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto]
        ,[1a_jarjestys]
        ,[1b Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina tutkinto ja opiskelu alkuperäisessä tutkintolajissa]
        ,[1b_jarjestys]
        ,[1c Aloittaneista tutkinnon suorittaneet koulutuslajin mukaan]
        ,[1c_jarjestys]
        ,[1d Aloittaneista ilman tutkintoa opiskelua jatkavat koulutuslajin mukaan]
        ,[1d_jarjestys]
        ,[1e Aloittaneista alkuperäisen koulutuslajin tutkinnon suorittaneet koulutuslajin mukaan]
        ,[1e_jarjestys]
        ,[1f Aloittaneista muun kuin alkuperäisen tutkintolajin tutkinnon suorittaneet koulutuslajin mukaan]
        ,[1f_jarjestys]
        ,[1g Aloittaneista alkuperäisen tutkintolajin opiskelua jatkavat koulutuslajin mukaan]
        ,[1g_jarjestys]
        ,[1h Aloittaneista muun tutkintolajin opiskelua jatkavat koulutuslajin mukaan]
        ,[1h_jarjestys]
        ,[2a Aloittaneiden opintojen kulku koulutusalan (2002) mukaan prioriteettina mikä tahansa tutkinto]
        ,[2a_jarjestys]
        ,[2b Aloittaneiden opintojen kulku koulutusalan (2002) mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä]
        ,[2b_jarjestys]
        ,[2e Aloittaneista alkuperäisen koulutusalan (2002) tutkinnon suorittaneet koulutusalan mukaan]
        ,[2e_jarjestys]
        ,[2f Aloittaneista muun koulutusalan (2002) tutkinnon suorittaneet koulutusalan mukaan]
        ,[2f_jarjestys]
        ,[2g Aloittaneista alkuperäisellä koulutusalalla (2002) opiskelua jatkavat koulutusalan mukaan]
        ,[2g_jarjestys]
        ,[2h Aloittaneista muulla koulutusalalla (2002) opiskelua jatkavat koulutusalan mukaan]
        ,[2h_jarjestys]
        ,[3a Aloittaneiden opintojen kulku opintoalan (2002) mukaan prioriteettina mikä tahansa tutkinto]
        ,[3a_jarjestys]
        ,[3b Aloittaneiden opintojen kulku opintoalan (2002) mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä]
        ,[3b_jarjestys]
        ,[3e Aloittaneista alkuperäisen opintoalan (2002) tutkinnon suorittaneet opintoalan mukaan]
        ,[3e_jarjestys]
        ,[3f Aloittaneista muun opintoalan (2002) tutkinnon suorittaneet opintoalan mukaan]
        ,[3f_jarjestys]
        ,[3g Aloittaneista alkuperäisellä opintoalalla (2002) opiskelua jatkavat opintoalan mukaan]
        ,[3g_jarjestys]
        ,[3h Aloittaneista muulla opintoalalla (2002) opiskelua jatkavat opintoalan mukaan]
        ,[3h_jarjestys]
        ,[4a Aloittaneiden opintojen kulku koulutuksen järjestäjän mukaan, toinen aste prioriteettina tutkinto missä tahansa]
        ,[4a_jarjestys]
        ,[4b Aloittaneiden opintojen kulku koulutuksen järjestäjän mukaan, toinen aste prioriteettina tutkinto ja opiskelu alkuperäisellä]
        ,[4b_jarjestys]
        ,[4e Aloittaneista alkuperäisen koulutuksen järjestäjän tutkinnon suorittaneet järjestäjän mukaan]
        ,[4e_jarjestys]
        ,[4f Aloittaneista muun koulutuksen järjestäjän tutkinnon suorittaneet järjestäjän mukaan]
        ,[4f_jarjestys]
        ,[4g Aloittaneista alkuperäisellä järjestäjällä opiskelua jatkavat järjestäjän mukaan]
        ,[4g_jarjestys]
        ,[4h Aloittaneista muulla järjestäjällä opiskelua jatkavat järjestäjän mukaan]
        ,[4h_jarjestys]
        ,[5a Aloittaneiden opintojen kulku oppilaitoksen mukaan prioriteettina tutkinto missä tahansa]
        ,[5a_jarjestys]
        ,[5b Aloittaneiden opintojen kulku oppilaitoksen mukaan prioriteettina tutkinto ja opiskelu alkuperäisessä]
        ,[5b_jarjestys]
        ,[5e Aloittaneista alkuperäisessä oppilaitoksessa tutkinnon suorittaneet oppilaitoksen mukaan]
        ,[5e_jarjestys]
        ,[5f Aloittaneista muussa oppilaitoksessa tutkinnon suorittaneet oppilaitoksen mukaan]
        ,[5f_jarjestys]
        ,[5g Aloittaneista alkuperäisessä oppilaitoksessa opiskelua jatkavat oppilaitoksen mukaan]
        ,[5g_jarjestys]
        ,[5h Aloittaneista muussa oppilaitoksessa opiskelua jatkavat oppilaitoksen mukaan]
        ,[5h_jarjestys]
        ,[6a Aloittaneiden opintojen kulku maakunnan mukaan prioriteettina tutkinto missä tahansa]
        ,[6a_jarjestys]
        ,[6b Aloittaneiden opintojen kulku maakunnan mukaan prioriteettina tutkinto ja opiskelu alkuperäisessä]
        ,[6b_jarjestys]
        ,[6e Aloittaneista alkuperäisessä maakunnassa tutkinnon suorittaneet maakunnan mukaan]
        ,[6e_jarjestys]
        ,[6f Aloittaneista muussa maakunnassa tutkinnon suorittaneet maakunnan mukaan]
        ,[6f_jarjestys]
        ,[6g Aloittaneista alkuperäisessä maakunnassa opiskelua jatkavat maakunnan mukaan]
        ,[6g_jarjestys]
        ,[6h Aloittaneista muussa maakunnassa opiskelua jatkavat maakunnan mukaan]
        ,[6h_jarjestys]
        ,[7a Aloittaneiden opintojen kulku koulutussektorin mukaan prioriteettina tutkinto missä tahansa]
        ,[7a_jarjestys]
        ,[7b Aloittaneiden opintojen kulku koulutussektorin mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä]
        ,[7b_jarjestys]
        ,[7e Aloittaneista alkuperäisen koulutussektorin tutkinnon suorittaneet koulutussektorin mukaan]
        ,[7e_jarjestys]
        ,[7f Aloittaneista muun koulutussektorin tutkinnon suorittaneet koulutussektorin mukaan]
        ,[7f_jarjestys]
        ,[7g Aloittaneista alkuperäisellä koulutussektorilla opiskelua jatkavat koulutussektorin mukaan]
        ,[7g_jarjestys]
        ,[7h Aloittaneista muulla koulutussektorilla opiskelua jatkavat koulutussektorin mukaan]
        ,[7h_jarjestys]
        ,[8a Aloittaneiden opintojen kulku opintoalan (1995) mukaan prioriteettina mikä tahansa tutkinto]
        ,[8a_jarjestys]
        ,[8b Aloittaneiden opintojen kulku opintoalan (1995) mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä]
        ,[8b_jarjestys]
        ,[8e Aloittaneista alkuperäisen opintoalan (1995) tutkinnon suorittaneet opintoalan mukaan]
        ,[8e_jarjestys]
        ,[8f Aloittaneista muun opintoalan (1995) tutkinnon suorittaneet opintoalan mukaan]
        ,[8f_jarjestys]
        ,[8g Aloittaneista alkuperäisellä opintoalalla (1995) opiskelua jatkavat opintoalan mukaan]
        ,[8g_jarjestys]
        ,[8h Aloittaneista muulla opintoalalla (1995) opiskelua jatkavat opintoalan mukaan]
        ,[8h_jarjestys]
		,[9a Aloittaneiden opintojen kulku koulutusalan, taso 1 mukaan prioriteettina mikä tahansa tutkinto]
		,[9a_jarjestys]
		,[9b Aloittaneiden opintojen kulku koulutusalan, taso 1 mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä]
		,[9b_jarjestys]
		,[9e Aloittaneista alkuperäisen koulutusalan, taso 1 tutkinnon suorittaneet koulutusalan mukaan]
		,[9e_jarjestys]
		,[9f Aloittaneista muun koulutusalan, taso 1 tutkinnon suorittaneet koulutusalan mukaan]
		,[9f_jarjestys]
		,[9g Aloittaneista alkuperäisellä koulutusalalla, taso 1 opiskelua jatkavat koulutusalan mukaan]
		,[9g_jarjestys]
		,[9h Aloittaneista muulla koulutusalalla, taso 1 opiskelua jatkavat koulutusalan mukaan]
		,[9h_jarjestys]
		,[10a Aloittaneiden opintojen kulku koulutusalan, taso 2 mukaan prioriteettina mikä tahansa tutkinto]
		,[10a_jarjestys]
		,[10b Aloittaneiden opintojen kulku koulutusalan, taso 2 mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä]
		,[10b_jarjestys]
		,[10e Aloittaneista alkuperäisen koulutusalan, taso 2 tutkinnon suorittaneet koulutusalan mukaan]
		,[10e_jarjestys]
		,[10f Aloittaneista muun koulutusalan, taso 2 tutkinnon suorittaneet koulutusalan mukaan]
		,[10f_jarjestys]
		,[10g Aloittaneista alkuperäisellä koulutusalalla, taso 2 opiskelua jatkavat koulutusalan mukaan]
		,[10g_jarjestys]
		,[10h Aloittaneista muulla koulutusalalla, taso 2 opiskelua jatkavat koulutusalan mukaan]
		,[10h_jarjestys]
		,[11a Aloittaneiden opintojen kulku koulutusalan, taso 3 mukaan prioriteettina mikä tahansa tutkinto]
		,[11a_jarjestys]
		,[11b Aloittaneiden opintojen kulku koulutusalan, taso 3 mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä]
		,[11b_jarjestys]
		,[11e Aloittaneista alkuperäisen koulutusalan, taso 3 tutkinnon suorittaneet koulutusalan mukaan]
		,[11e_jarjestys]
		,[11f Aloittaneista muun koulutusalan, taso 3 tutkinnon suorittaneet koulutusalan mukaan]
		,[11f_jarjestys]
		,[11g Aloittaneista alkuperäisellä koulutusalalla, taso 3 opiskelua jatkavat koulutusalan mukaan]
		,[11g_jarjestys]
		,[11h Aloittaneista muulla koulutusalalla, taso 3 opiskelua jatkavat koulutusalan mukaan]
		,[11h_jarjestys])

	SELECT kaikkirivit.* 
	FROM 
	(
		SELECT --top 0 
			[rivinumero]
			,[tilv]
			,f.[lahde]
			,[lahde_id] = isnull(d13.id, -1)
			,[opp]
			,[oppilaitoksen_taustatiedot_avain] = isnull(case when CHARINDEX('K3_10',f.tietolahde)>0 then isnull(d17.oppilaitos_avain,d1.oppilaitos_avain) else d1.oppilaitos_avain end, -2)
			,[oppilaitoksen_taustatiedot_id] = isnull(case when CHARINDEX('K3_10',f.tietolahde)>0 then isnull(d17.id,d1.id) else d1.id end, -2)
			--,[oppilaitoksen_taustatiedot_historia_id] = NULL --isnull(case when CHARINDEX('K3_10',f.tietolahde)>0 then isnull(d17h.id,d1h.id) else d1h.id end, -2)      
			,[sp]
			,[sp_id] = ISNULL(d2.id, -1)
			,[syntv]
			,ika = 
			Cast(Case 
					when f.lahde in ('41', '51') 
					then case when alvv_kk is not null and syntv is not null and ISNUMERIC(alvv_kk)=1 and ISNUMERIC(syntv)=1 then cast(alvv_kk as int)-cast(syntv as int) else -1 end 
					else case when alvv is not null and syntv is not null and ISNUMERIC(alvv)=1 and ISNUMERIC(syntv)=1 then cast(alvv as int)-cast(syntv as int) else -1 end 
				end as nvarchar(10))
			,ika_id = ISNULL(d19.id, -1)
			,[aikielir1]
			,[aikielir1_id] = ISNULL(d12.id, -1)
			,[alvv]
			,[allk]
			,[aloituskausikoodi] = 
			Cast(Case 
					when f.lahde in ('41', '51') 
					then [alvv_kk]+Case when [allk_kk]='9' then '2' else [allk_kk] end
					else [alvv]+Case when [allk]='9' then '2' else [allk] end
				end as varchar(8))
			,[klaji]
			,f.[ophal]
			,[ophal_id] = isnull(d14.id, -1)
			,[jarj]
			,[kkun]
			--,[alueluokitus_historia_id] = NULL --isnull(isnull(d3h.id, d11h.id), -2)
			,[alueluokitus_id] = isnull(d3.id, -1)
			,[maak]
			,[koulk]
			--,[koulk_historia_id] = NULL --isnull(d4h.id, -1)
			,[koulk_id] = isnull(d4.id, -1)
			--,[opmala]
			--,[opmopa]
			--,[opmast]
			--,[opm95opa]
			,[koulutussektori]
			,[pohjkoulk]
			--,[pohjkoulk_historia_id] = NULL --isnull(d5h.id, -1)
			,[pohjkoulk_id] = isnull(d5.id, -1)
			,[alvv_kk]
			,[allk_kk]
			,[aloituskausikoodi_kk] = Cast(Case when [alvv_kk]='' then '-1' else [alvv_kk]+Case when [allk_kk]='9' then '2' else [allk_kk] end end as varchar(8))
			,f.[ololk]
			,[ololk_id] = isnull(d15.id, -1)
			,[rahlahde]
			,[rahlahde_id] = isnull(d16.id, -1)
			,f.[koulutuslaji2]
			,[koulutuslaji2_id] = isnull(d6.id, -1)
			,saavutettu_suorv
			,saavutettu_suorlk
			,[saavutettu_kausikoodi] = isnull(Cast([saavutettu_suorv]+[saavutettu_suorlk] as varchar(8)),'-1')
			,saavutettu_tutkmaak
			--,[saavutettu_alueluokitus_historia_id]  = NULL --isnull(isnull(d7h.id, d11h.id), -2)
			,[saavutettu_alueluokitus_id]  = isnull(d7.id, -1)
			,saavutettu_tutkjarj
			,saavutettu_tutkopp
			,[saavutettu_oppilaitoksen_taustatiedot_avain] = isnull(case when CHARINDEX('K3_10',f.tietolahde)>0 then isnull(d18.oppilaitoskoodi,d8.oppilaitoskoodi) else d8.oppilaitoskoodi end, -1)
			,[saavutettu_oppilaitoksen_taustatiedot_id] = isnull(case when CHARINDEX('K3_10',f.tietolahde)>0 then isnull(d18.id,d8.id) else d8.id end, -1)
			--,[saavutettu_oppilaitoksen_taustatiedot_historia_id] = NULL --isnull(case when CHARINDEX('K3_10',f.tietolahde)>0 then isnull(d18h.id,d8h.id) else d8h.id end, -1)
			,saavutettu_tutkkoulk
			--,[saavutettu_koulk_historia_id] = NULL --isnull(d9h.id, -1)
			,[saavutettu_koulk_id] = isnull(d9.id, -1)
			--,saavutettu_tutkopmala
			--,saavutettu_tutkopmopa
			--,saavutettu_tutkopmast
			--,saavutettu_tutkopm95opa
			,saavutettu_tutkkoulutussektori
			,[tarkastelujakso] = [tarkasteluperiodi_char]
			,[tarkastelujakso_id] = ISNULL(d10.id, -2)
			,[aloitus_saavutus] = 
			Cast(Case 
					when saavutettu_suorv is null then 'Ei suoritusta tai suoritus aloituksen jälkeen'
					when [alvv] <= saavutettu_suorv then 'Ei suoritusta tai suoritus aloituksen jälkeen'
					when [alvv] > saavutettu_suorv then 'Suoritus ennen aloitusta'
					else 'Ei aloitusta' 
				end as nvarchar(50))
			,[tarkastelujakso_tulevaisuus] = 'Tarkastelujakso ei ulotu tulevaisuuteen'	
			,[tarkastelujakso_edustavuus] = 
			Cast(Case
					when cast(tilv as int)+ 0.5 - cast(alvv as int)- (Case when [allk]='9' then 2 else Cast([allk] as int) end -1.0)/2.0 + 0.5 --kerätyn tiedon kesto 
							< CAST(replace(tarkasteluperiodi_char, ',', '.') as decimal(4,1)) --tarkastelujakso ylipitkä
					then 'Tarkastelujakso ei ole edustava'
					when (cast(tilv as int)+ 0.5 - cast(alvv as int)- (Case when [allk]='9' then 2 else Cast([allk] as int) end -1.0)/2.0 + 0.5 --kerätyn tiedon kesto 
							= CAST(replace(tarkasteluperiodi_char, ',', '.') as decimal(4,1))) --tarkastelujakso jatkuu viimeisen aineistovuoden viimeiselle kaudelle
							AND
							(Cast([allk] as int)= 1 ) --kevät 
					then 'Tarkastelujakso ei ole edustava'
					else 'Tarkastelujakso on edustava' 
				end as nvarchar(50))
			,f.[tietolahde]
			,[aineistokoodi] = Case when CHARINDEX('K3_9',f.tietolahde)>0 then 'K3.9' when CHARINDEX('K3_10',f.tietolahde)>0 then 'K3.10' else '-2' end
			,[aineistorivinumero]
			,[lkm_int]
			,[1a Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina mikä tahansa tutkinto]
			,[1a_jarjestys]
			,[1b Aloittaneiden opintojen kulku koulutuslajin mukaan prioriteettina tutkinto ja opiskelu alkuperäisessä tutkintolajissa]
			,[1b_jarjestys]
			,[1c Aloittaneista tutkinnon suorittaneet koulutuslajin mukaan]
			,[1c_jarjestys]
			,[1d Aloittaneista ilman tutkintoa opiskelua jatkavat koulutuslajin mukaan]
			,[1d_jarjestys]
			,[1e Aloittaneista alkuperäisen koulutuslajin tutkinnon suorittaneet koulutuslajin mukaan]
			,[1e_jarjestys]
			,[1f Aloittaneista muun kuin alkuperäisen tutkintolajin tutkinnon suorittaneet koulutuslajin mukaan]
			,[1f_jarjestys]
			,[1g Aloittaneista alkuperäisen tutkintolajin opiskelua jatkavat koulutuslajin mukaan]
			,[1g_jarjestys]
			,[1h Aloittaneista muun tutkintolajin opiskelua jatkavat koulutuslajin mukaan]
			,[1h_jarjestys]
			,[2a Aloittaneiden opintojen kulku koulutusalan (2002) mukaan prioriteettina mikä tahansa tutkinto]
			,[2a_jarjestys]
			,[2b Aloittaneiden opintojen kulku koulutusalan (2002) mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä]
			,[2b_jarjestys]
			,[2e Aloittaneista alkuperäisen koulutusalan (2002) tutkinnon suorittaneet koulutusalan mukaan]
			,[2e_jarjestys]
			,[2f Aloittaneista muun koulutusalan (2002) tutkinnon suorittaneet koulutusalan mukaan]
			,[2f_jarjestys]
			,[2g Aloittaneista alkuperäisellä koulutusalalla (2002) opiskelua jatkavat koulutusalan mukaan]
			,[2g_jarjestys]
			,[2h Aloittaneista muulla koulutusalalla (2002) opiskelua jatkavat koulutusalan mukaan]
			,[2h_jarjestys]
			,[3a Aloittaneiden opintojen kulku opintoalan (2002) mukaan prioriteettina mikä tahansa tutkinto]
			,[3a_jarjestys]
			,[3b Aloittaneiden opintojen kulku opintoalan (2002) mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä]
			,[3b_jarjestys]
			,[3e Aloittaneista alkuperäisen opintoalan (2002) tutkinnon suorittaneet opintoalan mukaan]
			,[3e_jarjestys]
			,[3f Aloittaneista muun opintoalan (2002) tutkinnon suorittaneet opintoalan mukaan]
			,[3f_jarjestys]
			,[3g Aloittaneista alkuperäisellä opintoalalla (2002) opiskelua jatkavat opintoalan mukaan]
			,[3g_jarjestys]
			,[3h Aloittaneista muulla opintoalalla (2002) opiskelua jatkavat opintoalan mukaan]
			,[3h_jarjestys]
			,[4a Aloittaneiden opintojen kulku koulutuksen järjestäjän mukaan, toinen aste prioriteettina tutkinto missä tahansa]
			,[4a_jarjestys]
			,[4b Aloittaneiden opintojen kulku koulutuksen järjestäjän mukaan, toinen aste prioriteettina tutkinto ja opiskelu alkuperäisellä]
			,[4b_jarjestys]
			,[4e Aloittaneista alkuperäisen koulutuksen järjestäjän tutkinnon suorittaneet järjestäjän mukaan]
			,[4e_jarjestys]
			,[4f Aloittaneista muun koulutuksen järjestäjän tutkinnon suorittaneet järjestäjän mukaan]
			,[4f_jarjestys]
			,[4g Aloittaneista alkuperäisellä järjestäjällä opiskelua jatkavat järjestäjän mukaan]
			,[4g_jarjestys]
			,[4h Aloittaneista muulla järjestäjällä opiskelua jatkavat järjestäjän mukaan]
			,[4h_jarjestys]
			,[5a Aloittaneiden opintojen kulku oppilaitoksen mukaan prioriteettina tutkinto missä tahansa]
			,[5a_jarjestys]
			,[5b Aloittaneiden opintojen kulku oppilaitoksen mukaan prioriteettina tutkinto ja opiskelu alkuperäisessä]
			,[5b_jarjestys]
			,[5e Aloittaneista alkuperäisessä oppilaitoksessa tutkinnon suorittaneet oppilaitoksen mukaan]
			,[5e_jarjestys]
			,[5f Aloittaneista muussa oppilaitoksessa tutkinnon suorittaneet oppilaitoksen mukaan]
			,[5f_jarjestys]
			,[5g Aloittaneista alkuperäisessä oppilaitoksessa opiskelua jatkavat oppilaitoksen mukaan]
			,[5g_jarjestys]
			,[5h Aloittaneista muussa oppilaitoksessa opiskelua jatkavat oppilaitoksen mukaan]
			,[5h_jarjestys]
			,[6a Aloittaneiden opintojen kulku maakunnan mukaan prioriteettina tutkinto missä tahansa]
			,[6a_jarjestys]
			,[6b Aloittaneiden opintojen kulku maakunnan mukaan prioriteettina tutkinto ja opiskelu alkuperäisessä]
			,[6b_jarjestys]
			,[6e Aloittaneista alkuperäisessä maakunnassa tutkinnon suorittaneet maakunnan mukaan]
			,[6e_jarjestys]
			,[6f Aloittaneista muussa maakunnassa tutkinnon suorittaneet maakunnan mukaan]
			,[6f_jarjestys]
			,[6g Aloittaneista alkuperäisessä maakunnassa opiskelua jatkavat maakunnan mukaan]
			,[6g_jarjestys]
			,[6h Aloittaneista muussa maakunnassa opiskelua jatkavat maakunnan mukaan]
			,[6h_jarjestys]
			,[7a Aloittaneiden opintojen kulku koulutussektorin mukaan prioriteettina tutkinto missä tahansa]
			,[7a_jarjestys]
			,[7b Aloittaneiden opintojen kulku koulutussektorin mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä]
			,[7b_jarjestys]
			,[7e Aloittaneista alkuperäisen koulutussektorin tutkinnon suorittaneet koulutussektorin mukaan]
			,[7e_jarjestys]
			,[7f Aloittaneista muun koulutussektorin tutkinnon suorittaneet koulutussektorin mukaan]
			,[7f_jarjestys]
			,[7g Aloittaneista alkuperäisellä koulutussektorilla opiskelua jatkavat koulutussektorin mukaan]
			,[7g_jarjestys]
			,[7h Aloittaneista muulla koulutussektorilla opiskelua jatkavat koulutussektorin mukaan]
			,[7h_jarjestys]
			,[8a Aloittaneiden opintojen kulku opintoalan (1995) mukaan prioriteettina mikä tahansa tutkinto]
			,[8a_jarjestys]
			,[8b Aloittaneiden opintojen kulku opintoalan (1995) mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä]
			,[8b_jarjestys]
			,[8e Aloittaneista alkuperäisen opintoalan (1995) tutkinnon suorittaneet opintoalan mukaan]
			,[8e_jarjestys]
			,[8f Aloittaneista muun opintoalan (1995) tutkinnon suorittaneet opintoalan mukaan]
			,[8f_jarjestys]
			,[8g Aloittaneista alkuperäisellä opintoalalla (1995) opiskelua jatkavat opintoalan mukaan]
			,[8g_jarjestys]
			,[8h Aloittaneista muulla opintoalalla (1995) opiskelua jatkavat opintoalan mukaan]
			,[8h_jarjestys]
			,[9a Aloittaneiden opintojen kulku koulutusalan, taso 1 mukaan prioriteettina mikä tahansa tutkinto]
			,[9a_jarjestys]
			,[9b Aloittaneiden opintojen kulku koulutusalan, taso 1 mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä]
			,[9b_jarjestys]
			,[9e Aloittaneista alkuperäisen koulutusalan, taso 1 tutkinnon suorittaneet koulutusalan mukaan]
			,[9e_jarjestys]
			,[9f Aloittaneista muun koulutusalan, taso 1 tutkinnon suorittaneet koulutusalan mukaan]
			,[9f_jarjestys]
			,[9g Aloittaneista alkuperäisellä koulutusalalla, taso 1 opiskelua jatkavat koulutusalan mukaan]
			,[9g_jarjestys]
			,[9h Aloittaneista muulla koulutusalalla, taso 1 opiskelua jatkavat koulutusalan mukaan]
			,[9h_jarjestys]
			,[10a Aloittaneiden opintojen kulku koulutusalan, taso 2 mukaan prioriteettina mikä tahansa tutkinto]
			,[10a_jarjestys]
			,[10b Aloittaneiden opintojen kulku koulutusalan, taso 2 mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä]
			,[10b_jarjestys]
			,[10e Aloittaneista alkuperäisen koulutusalan, taso 2 tutkinnon suorittaneet koulutusalan mukaan]
			,[10e_jarjestys]
			,[10f Aloittaneista muun koulutusalan, taso 2 tutkinnon suorittaneet koulutusalan mukaan]
			,[10f_jarjestys]
			,[10g Aloittaneista alkuperäisellä koulutusalalla, taso 2 opiskelua jatkavat koulutusalan mukaan]
			,[10g_jarjestys]
			,[10h Aloittaneista muulla koulutusalalla, taso 2 opiskelua jatkavat koulutusalan mukaan]
			,[10h_jarjestys]
			,[11a Aloittaneiden opintojen kulku koulutusalan, taso 3 mukaan prioriteettina mikä tahansa tutkinto]
			,[11a_jarjestys]
			,[11b Aloittaneiden opintojen kulku koulutusalan, taso 3 mukaan prioriteettina tutkinto ja opiskelu alkuperäisellä]
			,[11b_jarjestys]
			,[11e Aloittaneista alkuperäisen koulutusalan, taso 3 tutkinnon suorittaneet koulutusalan mukaan]
			,[11e_jarjestys]
			,[11f Aloittaneista muun koulutusalan, taso 3 tutkinnon suorittaneet koulutusalan mukaan]
			,[11f_jarjestys]
			,[11g Aloittaneista alkuperäisellä koulutusalalla, taso 3 opiskelua jatkavat koulutusalan mukaan]
			,[11g_jarjestys]
			,[11h Aloittaneista muulla koulutusalalla, taso 3 opiskelua jatkavat koulutusalan mukaan]
			,[11h_jarjestys]

		--FROM VipunenTK_DW.dbo._aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet f
		FROM VipunenTK_DW.dbo.v_aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet f
		LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot d1 ON d1.oppilaitos_avain=f.jarj
		LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot d17 ON d17.oppilaitos_avain=d1.koulutuksen_jarjestajan_ainoa_oppilaitos
		LEFT JOIN VipunenTK.dbo.d_sukupuoli d2 ON d2.sukupuoli_koodi = f.sp AND f.tilv_date between d2.alkaa and d2.paattyy
		LEFT JOIN VipunenTK.dbo.d_alueluokitus d3 ON d3.alueluokitus_avain=f.kkun 
		LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d4 ON d4.koulutusluokitus_avain=f.koulk
		LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d5 ON d5.koulutusluokitus_avain=f.pohjkoulk
		LEFT JOIN VipunenTK..d_koulutuslaji2 d6 ON d6.koulutuslaji2_koodi=f.koulutuslaji2
		LEFT JOIN VipunenTK.dbo.d_alueluokitus d7 ON d7.alueluokitus_avain='MAAK'+f.saavutettu_tutkmaak
		LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot d8 ON d8.oppilaitos_avain=f.saavutettu_tutkjarj
		LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot d18 ON d18.oppilaitos_avain=d8.koulutuksen_jarjestajan_ainoa_oppilaitos
		LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d9 ON d9.koulutusluokitus_avain=f.saavutettu_tutkkoulk
		LEFT JOIN VipunenTK..d_tarkastelujakso d10 ON d10.tarkastelujakso_koodi=f.tarkasteluperiodi_char and f.tilv_date between d10.alkaa and d10.paattyy
		--LEFT JOIN VipunenTK.dbo.d_alueluokitus d11 ON d11.alueluokitus_avain='-1'
		LEFT JOIN VipunenTK.dbo.d_aidinkieli_versio1 d12 on d12.aidinkieli_versio1_koodi=f.aikielir1 and f.tilv_date between d12.alkaa and d12.paattyy	
		LEFT JOIN VipunenTK.dbo.d_lahde d13 on d13.lahde_koodi=f.lahde and f.tilv_date between d13.alkaa and d13.paattyy	
		LEFT JOIN VipunenTK.dbo.d_opetushallinnon_koulutus d14 on d14.opetushallinnon_koulutus_koodi=f.ophal and f.tilv_date between d14.alkaa and d14.paattyy	
		LEFT JOIN VipunenTK.dbo.d_opiskelijan_olo d15 on d15.opiskelijan_olo_koodi=f.ololk and f.tilv_date between d15.alkaa and d15.paattyy	
		LEFT JOIN VipunenTK.dbo.d_rahoituslahde d16 on d16.rahoituslahde_koodi=f.rahlahde and f.tilv_date between d16.alkaa and d16.paattyy	
		LEFT JOIN VipunenTK.dbo.d_ika d19 
			on d19.ika_avain = 
				Cast(Case 
						when f.lahde in ('41', '51') 
						then case when alvv_kk is not null and syntv is not null and ISNUMERIC(alvv_kk)=1 and ISNUMERIC(syntv)=1 then cast(alvv_kk as int)-cast(syntv as int) else -1 end 
						else case when alvv is not null and syntv is not null and ISNUMERIC(alvv)=1 and ISNUMERIC(syntv)=1 then cast(alvv as int)-cast(syntv as int) else -1 end 
					end as nvarchar(10))

		where f.tarkasteluperiodi_char = @tj
		and 
		(
			1 = Case 
					when f.lahde in ('41', '51') 
					then 
						Case 
							when cast(tilv as int) + 0.5 - cast(alvv_kk as int) - (Case when [allk_kk]='9' then 2 else Cast([allk_kk] as int) end -1.0)/2.0 + 0.5 --kerätyn tiedon kesto 
									>= CAST(replace(tarkasteluperiodi_char, ',', '.') as decimal(4,1)) --tarkastelujakson pituus
							then 1
							else 0 
						end 
					else 
						Case 
							when cast(tilv as int) + 0.5 - cast(alvv as int) - (Case when [allk]='9' then 2 else Cast([allk] as int) end -1.0)/2.0 + 0.5 --kerätyn tiedon kesto 
									>= CAST(replace(tarkasteluperiodi_char, ',', '.') as decimal(4,1)) --tarkastelujakson pituus
							then 1
							else 0 
						end 
				end
		)
		and 
		(
		 f.lahde not in ('41', '51')
		 or f.koulutuslaji2 in ('46', '52')
		 or f.allk = f.allk_kk 
			and f.alvv = f.alvv_kk
			and f.allk in ('1', '2')
		)
		
	) kaikkirivit;
	
	FETCH NEXT FROM tj_cursor 
	INTO @tj;

END;

CLOSE tj_cursor;
DEALLOCATE tj_cursor;

EXEC ANTERO.dw.p_lataa_f_indikaattorit_kk_lapaisy

GO


