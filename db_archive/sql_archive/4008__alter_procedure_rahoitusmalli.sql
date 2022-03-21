USE [ANTERO]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_rahoitusmalli_yo_tutkimus]    Script Date: 29.9.2020 14:50:10 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_rahoitusmalli_yo_tutkimus]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_rahoitusmalli_yo_koulutus]    Script Date: 29.9.2020 14:50:10 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_rahoitusmalli_yo_koulutus]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_rahoitusmalli_amk_tutkimus]    Script Date: 29.9.2020 14:50:10 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_rahoitusmalli_amk_tutkimus]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_rahoitusmalli_amk_koulutus]    Script Date: 29.9.2020 14:50:10 ******/
DROP PROCEDURE IF EXISTS [sa].[p_lataa_rahoitusmalli_amk_koulutus]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_rahoitusmalli]    Script Date: 29.9.2020 14:50:10 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_rahoitusmalli]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_rahoitusmalli]    Script Date: 29.9.2020 14:50:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_rahoitusmalli]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_rahoitusmalli] AS' 
END
GO


ALTER PROCEDURE [dw].[p_lataa_f_rahoitusmalli] @minRVuosi int = 2019, @maxRVuosi int = 2021, @sekt varchar(3) = 'yo' AS

--0 Parametreina aloitus- ja päättövuosi sekä sektori
--1 Rahoitusvuoden tietojen poisto kohdetaulusta
--2 Rivien lukeminen d_rahoitusmalli taulusta
--3 Tutkintojen rahoitusrajat erilliseen tauluun
--4 Lähdetaulun data väliaikaiseen tauluun
--5 Rivien lukeminen rahoitusmalli_painot taulusta
--6 Paino-sarakkeen päivitys
--7 Data väliaikaisesta taulusta kohdetauluun

declare @sqlKomento nvarchar(max)
set @sqlKomento = '

declare @rVuosi as int
set @rVuosi = @minRVuosi

--dimensiotaulu
declare @avain as varchar(100)
declare @viive as int
declare @indCursor as cursor

--painotaulu
declare @t_selite as varchar(50)
declare @t_arvo as varchar(50)
declare @paino as float
declare @painoCursor as cursor
declare @avaimet table(avain varchar(100), vuosi int)

--faktataulun tyhjennys ennen kirjoitusta
truncate table dw.f_rahoitusmalli_' + @sekt + '


--hankenin tutkinnot yhdistetty yhteen rahoitusmallialaan
declare @hanken_koodi as varchar(5)
set @hanken_koodi = (select organisaatio_koodi from dw.d_organisaatioluokitus where organisaatio_avain like ''oppilaitos_%'' and organisaatio_fi like ''%handelshögskolan%'' and loppupvm is null)



while @rVuosi <= @maxRVuosi

begin
	
	--hanken
	declare @hanken_ala as varchar(100)
	set @hanken_ala = (select rahoitusmalliala from [sa].[rahoitusmalli_yo_tutkintotavoitteet] where korkeakoulu=''SHH'' and rahoitusmalliala is not null and @rVuosi between alkaa and paattyy)

	--tutkintojen rahoitusrajat tauluun
	exec [sa].[p_lataa_rahoitusmalli_tutkintojen_rahoitusrajat] @rVuosi, @sekt

	--indikaattoriavaimet rahoitusrajaa varten
	if not exists (select avain from @avaimet)
	begin 
		insert into @avaimet select distinct avain,rahoitusvuosi from sa.rahoitusmalli_tutkintojen_rahoitusrajat where rahoitusraja=1 and sektori=@sekt
	end

	--tietojen lukeminen rivi kerrallaan taulusta dw.d_rahoitusmalli_' + @sekt + '
	set @indCursor = cursor for
		select 
			 avain
			,tietojen_viive
		from dw.d_rahoitusmalli_' + @sekt + '
		where @rVuosi between alkaa and paattyy

	open @indCursor;

	fetch next from @indCursor into @avain, @viive

	
	while @@FETCH_STATUS = 0
	begin

		--tiedot temp-tauluun
		select *, paino = cast(1.0 as float) into #temp 
		from (
			select *
			from [sa].[rahoitusmalli_' + @sekt + '_koulutus] 
			where tilastovuosi between (@rVuosi - @viive - 2) and (@rVuosi - @viive)
			and avain = @avain
		
			union all

			select *
			from [sa].[rahoitusmalli_' + @sekt + '_tutkimus] 
			where tilastovuosi between (@rVuosi - @viive - 2) and (@rVuosi - @viive)
			and avain = @avain 
		) q

		--tietojen lukeminen rivi kerrallaan taulusta sa.rahoitusmalli_' + @sekt + '_painot
		set @painoCursor = cursor for
			select 
				 tarkenne_selite
				,tarkenne_arvo
				,paino
			from sa.rahoitusmalli_' + @sekt + '_painot
			where avain = @avain
			and @rVuosi between alkaa and coalesce(paattyy,9999)

		open @painoCursor;

		fetch next from @painoCursor into @t_selite, @t_arvo, @paino

		while @@FETCH_STATUS = 0
		begin
			
			--painon päivitys
			update #temp 
			set	paino = paino
				  * (case when tarkenne1_selite = @t_selite and tarkenne1_arvo = @t_arvo then @paino else 1.0 end)
				  * (case when tarkenne2_selite = @t_selite and tarkenne2_arvo = @t_arvo then @paino else 1.0 end)
				  * (case when tarkenne3_selite = @t_selite and tarkenne3_arvo = @t_arvo then @paino else 1.0 end)
				  * (case when tarkenne4_selite = @t_selite and tarkenne4_arvo = @t_arvo then @paino else 1.0 end)
				  * (case when tarkenne5_selite = @t_selite and tarkenne5_arvo = @t_arvo then @paino else 1.0 end)

			fetch next from @painoCursor into @t_selite, @t_arvo, @paino

		end

		--tietojen kirjoitus
		insert into [dw].[f_rahoitusmalli_' + @sekt + '] (
			rahoitusvuosi
			,tilastovuosi
			,d_rahoitusmalli_' + @sekt + '_id
			,d_koulutusluokitus_id
			,d_ohjauksenala_id
			,d_' + @sekt + '_rahoitusmalliala_id
			,d_organisaatioluokitus_id
			,d_kytkin_tutkintojen_rahoitusraja_ylittyy_id
			,lkm
			,paino
			,paino_tutkinnot_rahoitusraja
			,paino_rahoitusala_ka
			,tutkintoraja
			,tutkintoraja_alakohtainen
		)

		select 
			@rVuosi
			,tilastovuosi
			,coalesce(d1.id,-1)
			,coalesce(d2.id,-1)
			,coalesce(d3.id,-1)
			,coalesce(d6.id,-1)
			,coalesce(d4.id,-1)
			,coalesce(d5.id,-1)
			,lkm
			,paino 
			,paino_tutkinnot_rahoitusraja = case when @avain in (select avain from @avaimet) and tt.rahoitusraja = 1 and @rVuosi in (select vuosi from @avaimet) and tt.ylittyy is null then 0 else tt.tavoite / tt.tutk_ka end
			,paino_rahoitusala_ka = 
				case 
					when tt.ylittyy = 1 and tt.rahoitusraja = 1 then sum(paino * lkm) over (partition by @rVuosi, d4.id, d1.id, tt.rahoitusala) / sum(lkm) over (partition by @rVuosi, d4.id, d1.id, tt.rahoitusala)
					else paino
				end
			,tutkintoraja = tt.tavoite
			,tutkintoraja_alakohtainen = tt.rahoitusraja_alakohtainen

		from #temp
		left join dw.d_rahoitusmalli_' + @sekt + ' d1 on d1.avain = @avain and @rVuosi between d1.alkaa and d1.paattyy
		left join dw.d_koulutusluokitus d2 on d2.koulutusluokitus_koodi = koulutus_koodi
		left join sa.v_rahoitusmalli_iscfi_rahoitusmalliala d2b on d2b.iscfi2013_koodi = d2.koulutusalataso3_koodi and d2b.sektori=@sekt and @rVuosi between d2b.alkaa and coalesce(d2b.paattyy,9999)
		left join dw.d_ohjauksenala d3 on d3.ohjauksenala_koodi = ohjauksen_ala_koodi
		left join dw.d_organisaatioluokitus d4 on d4.organisaatio_koodi = oppilaitos_koodi
		left join dw.d_' + @sekt + '_rahoitusmalliala d6 on (case when d4.organisaatio_koodi != @hanken_koodi and d6.koodi = d2b.rahoitusala_koodi then 1 when d4.organisaatio_koodi = @hanken_koodi and d6.selite_fi = @hanken_ala and d2.koulutusalataso3_koodi != -1 then 1 else 0 end)=1 and @rVuosi between d6.alkaa and d6.paattyy
		left join sa.rahoitusmalli_tutkintojen_rahoitusrajat tt on tt.oppilaitos_koodi = (case when @rVuosi <= year(d4.loppupvm) then d4.organisaatio_koodi else d4.organisaatio_nykyinen_koodi end) 
																	and tt.rahoitusvuosi = @rVuosi 
																	and @avain like tt.avain + ''%''
																	and tt.rahoitusala = (case when d1.avain not like ''tutkinnot_ylempi_kk%'' and d1.avain not like ''tutkinnot_amk%'' then '''' when d4.organisaatio_koodi = @hanken_koodi then @hanken_ala else d6.selite_fi end)
																	
		left join dw.d_kytkin d5 on d5.kytkin_koodi = (case when tt.ylittyy=1 and tt.rahoitusraja=1 then 1 else 0 end)
		--(case when @avain in (select avain from @avaimet) and @rVuosi in (select vuosi from @avaimet) and tt.ylittyy is null and tt.rahoitusraja=1 then 1 when tt.ylittyy=1 and tt.rahoitusraja=1 then 1 else 0 end) 
		
		

		drop table #temp	

		fetch next from @indCursor into @avain, @viive

	end


set @rVuosi = @rVuosi + 1

end

close @painoCursor
deallocate @painoCursor

close @indCursor
deallocate @indCursor
'

EXEC sp_executesql @sqlKomento, N'@minRVuosi int, @maxRVuosi int, @sekt varchar(3)', @minRVuosi = @minRVuosi, @maxRVuosi = @maxRVuosi, @sekt = @sekt

GO
/****** Object:  StoredProcedure [sa].[p_lataa_rahoitusmalli_amk_koulutus]    Script Date: 29.9.2020 14:50:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_rahoitusmalli_amk_koulutus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_rahoitusmalli_amk_koulutus] AS' 
END
GO


ALTER PROCEDURE [sa].[p_lataa_rahoitusmalli_amk_koulutus] AS


DROP TABLE IF EXISTS sa.rahoitusmalli_amk_koulutus
--TRUNCATE TABLE sa.rahoitusmalli_amk_koulutus

--INSERT INTO sa.rahoitusmalli_amk_koulutus

SELECT 
	 tilastovuosi

	,oppilaitos_koodi
	,koulutus_koodi
	,ohjauksen_ala_koodi
	,avain

	,lkm = mittari

	,tarkenne1_selite = cast(tarkenne1_selite as varchar(50))
	,tarkenne1_arvo = cast(tarkenne1_arvo as varchar(50))
	,tarkenne2_selite = cast(tarkenne2_selite as varchar(50))
	,tarkenne2_arvo = cast(tarkenne2_arvo as varchar(50))
	,tarkenne3_selite = cast(tarkenne3_selite as varchar(50))
	,tarkenne3_arvo = cast(tarkenne3_arvo as varchar(50))
	,tarkenne4_selite = cast(tarkenne4_selite as varchar(50))
	,tarkenne4_arvo = cast(tarkenne4_arvo as varchar(50))
	,tarkenne5_selite = cast(tarkenne5_selite as varchar(50))
	,tarkenne5_arvo = cast(tarkenne5_arvo as varchar(50))
INTO sa.rahoitusmalli_amk_koulutus
FROM (

	-- Amk-tutkinnot
	SELECT
		 tilastovuosi = tilastointivuosi
		,oppilaitos_koodi = oppilaitos
		,koulutus_koodi = koulutusluokitus
		,ohjauksen_ala_koodi = OKM_ohjauksen_ala_koodi

		,mittari = sum(tutkinnot)

		,avain = 'tutkinnot_amk17'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot] f
	left join VipunenTK.dbo.d_koulutusluokitus d1 on d1.id = f.koulutusluokitus_id
	WHERE d1.Koulutusaste_taso2_koodi = '62' --and tilastointivuosi <= 2016
	GROUP BY tilastointivuosi, oppilaitos, koulutusluokitus, OKM_ohjauksen_ala_koodi
	HAVING sum(tutkinnot) > 0

	UNION ALL

	-- Amk-tutkinnot
	SELECT
		tilastovuosi = tutkintovuosi
		,oppilaitos = oppilaitosnro
		,koulutus_koodi = tutkintokoodi
		,ohjauksen_ala_koodi = okmohjauksenala_koodi

		,mittari = count(distinct concat(opiskelijaavain,opiskeluoikeusAvain,oppilaitosnro))

		,indikaattori_lyhenne = 'tutkinnot_amk'

		,tarkenne1_selite = 'maara_aika'
		,tarkenne1_arvo = case when tavoiteajassavalmistunut = 1 then 1 when xonenintaan12kk = 1 then 2 else 0 end
		,tarkenne2_selite = 'tutkintoryhma'
		,tarkenne2_arvo = xxltutkintoryhma
		,tarkenne3_selite = 'aiempi_tutkinto'
		,tarkenne3_arvo = onaiempitutkinto
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM ANTERO.sa.sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet f
	left join ANTERO.dw.d_koulutusluokitus d1 on d1.koulutusluokitus_koodi = f.tutkintokoodi
	WHERE d1.koulutusastetaso2_koodi = '62' and coalesce(f.xxmrahoituslahde,1) != 4  --and tilastointivuosi > 2016
	GROUP BY tutkintovuosi, oppilaitosnro, tutkintokoodi, okmohjauksenala_koodi, (case when tavoiteajassavalmistunut = 1 then 1 when xonenintaan12kk = 1 then 2 else 0 end), xxltutkintoryhma, onaiempitutkinto
	HAVING count(distinct concat(opiskelijaavain,opiskeluoikeusAvain,oppilaitosnro)) > 0

	UNION ALL

	--55 suorittaneet
	SELECT
		tilastointivuosi = vuosi
		,oppilaitos = d1.organisaatio_koodi
		,koulutusluokitus = d2.koulutusluokitus_koodi
		,ohjauksen_ala = d2.okmohjauksenala_koodi

		,mittari = count(distinct henkilokoodi)

		,indikaattori_lyhenne = '55_op_suorittaneet'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM [ANTERO].[dw].[f_virta_otp_55_tilasto] f
	left join ANTERO.dw.d_organisaatioluokitus d1 on d1.id = f.d_organisaatio_id
	left join ANTERO.dw.d_koulutusluokitus d2 on d2.id = f.d_koulutusluokitus_id
	WHERE ([suorittanut27]=1 or [suorittanut55ilmanPankkia]=1 or [suorittanut55PankinAvulla]=1)
	and d2.koulutusastetaso2_koodi in ('62','71')
	GROUP BY vuosi, d1.organisaatio_koodi, d2.koulutusluokitus_koodi, d2.okmohjauksenala_koodi

	UNION ALL

	-- Jatkuva oppiminen, Avoimen korkeakoulutuksen opintopisteet
	SELECT
		 tilastointivuosi = vuosi
		,oppilaitos = d1.amk_tunnus
		,koulutusluokitus = null
		,ohjauksen_ala = d2.ohjauksenala_koodi

		,mittari = sum(avoinamk_op_lkm)+sum(erikoul_suor_op_lkm)+sum(erilopintooik_op_lkm)+sum(mamu_op_lkm)+sum(kk_yhteistyo_op_lkm)

		,indikaattori_lyhenne = 'opintopisteet_jatkuva17'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM [ANTERO].[dw].[f_amk_opintopisteet] f
	left join ANTERO.dw.d_amk d1 on d1.id = f.d_amk_id
	left join ANTERO.dw.d_ohjauksenala d2 on d2.id = f.d_ohjauksenala_id
	GROUP BY vuosi, d1.amk_tunnus, d2.ohjauksenala_koodi
	HAVING sum(avoinamk_op_lkm)+sum(erikoul_suor_op_lkm)+sum(erilopintooik_op_lkm)+sum(mamu_op_lkm)+sum(kk_yhteistyo_op_lkm) > 0
	
	UNION ALL

	-- Jatkuva oppiminen, Avoimen korkeakoulutuksen opintopisteet
	SELECT
		 tilastointivuosi = vuosi
		,oppilaitos = d1.amk_tunnus
		,koulutusluokitus = null
		,ohjauksen_ala = d2.ohjauksenala_koodi

		,mittari = sum(avoinamk_op_lkm)+sum(erikoul_suor_op_lkm)+sum(erilopintooik_op_lkm)+sum(mamu_op_lkm)

		,indikaattori_lyhenne = 'opintopisteet_jatkuva'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM [ANTERO].[dw].[f_amk_opintopisteet] f
	left join ANTERO.dw.d_amk d1 on d1.id = f.d_amk_id
	left join ANTERO.dw.d_ohjauksenala d2 on d2.id = f.d_ohjauksenala_id
	GROUP BY vuosi, d1.amk_tunnus, d2.ohjauksenala_koodi
	HAVING sum(avoinamk_op_lkm)+sum(erikoul_suor_op_lkm)+sum(erilopintooik_op_lkm)+sum(mamu_op_lkm) > 0

	UNION ALL

	-- Jatkuva oppiminen, Yhteistyöopintojen opintopisteet
	SELECT
		tilastointivuosi = vuosi
		,oppilaitos = d1.amk_tunnus
		,koulutusluokitus = null
		,ohjauksen_ala = d2.ohjauksenala_koodi

		,mittari = sum(kk_yhteistyo_op_lkm)

		,indikaattori_lyhenne = 'opintopisteet_yhteistyo'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM [ANTERO].[dw].[f_amk_opintopisteet] f
	left join ANTERO.dw.d_amk d1 on d1.id = f.d_amk_id
	left join ANTERO.dw.d_ohjauksenala d2 on d2.id = f.d_ohjauksenala_id
	GROUP BY vuosi, d1.amk_tunnus, d2.ohjauksenala_koodi
	HAVING sum(kk_yhteistyo_op_lkm) > 0

	UNION ALL

	-- Työllistyminen ja työllistymisen laatu, Työllistyminen 1 v.
	SELECT
		tilastointivuosi
		,oppilaitos
		,koulutusluokitus
		,ohjauksen_ala = OKM_ohjauksen_ala_koodi

		,mittari = sum(case when d1.paaasiallinen_toiminta_okm_koodi=1 then sijoittuminen_1v_tutkinnon_jalkeen else 0 end)

		,indikaattori_lyhenne = 'tyolliset_1v'

		,tarkenne1_selite = 'ammattiasema'
		,tarkenne1_arvo = ammattiasema
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM [VipunenTK].[dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] f
	left join VipunenTK.dbo.d_paaasiallinen_toiminta_okm d1 on d1.id = f.paaasiallinen_toiminta_okm_id
	left join VipunenTK.dbo.d_koulutusluokitus d2 on d2.id = f.koulutusluokitus_id
	WHERE d2.Koulutusaste_taso2_koodi IN ('62','71')
	GROUP BY tilastointivuosi, oppilaitos, koulutusluokitus, OKM_ohjauksen_ala_koodi, ammattiasema
	HAVING sum(case when d1.paaasiallinen_toiminta_okm_koodi=1 then sijoittuminen_1v_tutkinnon_jalkeen else 0 end) > 0
	
	UNION ALL

	-- Työllistyminen ja työllistymisen laatu, Uraseuranta
	SELECT
		tilastovuosi = d1.vuosi
		,oppilaitos = d3.organisaatio_koodi
		,koulutusluokitus = d4.koulutusluokitus_koodi
		,ohjauksen_ala = d4.okmohjauksenala_koodi

		,mittari = sum(
						cast(f.numerovalinta as int) * 
						f.rahoituskysymys_paino
				   )
					

		,indikaattori_lyhenne = 'opiskelijapalaute_ura'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM ANTERO.dw.f_arvo_amk_uraseuranta f
	left join ANTERO.dw.d_arvokyselykerta d1 on d1.id = f.d_arvokyselykerta_id
	left join ANTERO.dw.d_arvokysymys d2 on d2.id = f.d_arvokysymys_id
	left join ANTERO.dw.d_organisaatioluokitus d3 on d3.id = f.d_organisaatio_oppilaitos_id
	left join ANTERO.dw.d_koulutusluokitus d4 on d4.id = f.d_koulutusluokitus_id
	WHERE d2.rahoitusmallikysymys = 1
	GROUP BY d1.vuosi, d3.organisaatio_koodi, d4.koulutusluokitus_koodi, d4.okmohjauksenala_koodi
	HAVING sum(cast(f.numerovalinta as int)) > 0
	
	UNION ALL

	-- Opiskelijapalaute
	SELECT
		tilastovuosi = d1.vuosi
		,oppilaitos = d3.organisaatio_koodi
		,koulutusluokitus = d4.koulutusluokitus_koodi
		,ohjauksen_ala = d4.okmohjauksenala_koodi

		,mittari = sum(cast(f.numerovalinta as float))

		,indikaattori_lyhenne = 'opiskelijapalaute_avop'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM ANTERO.dw.f_arvo_avop f
	left join ANTERO.dw.d_arvokyselykerta d1 on d1.id = f.d_arvokyselykerta_id
	left join ANTERO.dw.d_arvokysymys d2 on d2.id = f.d_arvokysymys_id
	left join ANTERO.dw.d_organisaatioluokitus d3 on d3.id = f.d_organisaatio_oppilaitos_id
	left join ANTERO.dw.d_koulutusluokitus d4 on d4.id = f.d_koulutusluokitus_id
	WHERE d2.rahoitusmallikysymys = 1
	GROUP BY d1.vuosi, d3.organisaatio_koodi, d4.koulutusluokitus_koodi, d4.okmohjauksenala_koodi
	HAVING sum(cast(f.numerovalinta as float)) > 0
	
	UNION ALL

	--Kv opiskelijaliikkuvuus
	SELECT
		vuosi
		,oppilaitos = d1.amk_tunnus
		,koulutusluokitus = null
		,ohjauksen_ala = d2.ohjauksenala_koodi

		,mittari = sum(kv_vaihtoopiskelijat_op_lkm)+sum(ulkom_hyv_op_lkm)+sum(ulkom_harj_op_lkm)

		,indikaattori_lyhenne = 'opintopisteet_kv'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM [ANTERO].[dw].[f_amk_opintopisteet] f
	left join ANTERO.dw.d_amk d1 on d1.id = f.d_amk_id
	left join ANTERO.dw.d_ohjauksenala d2 on d2.id = f.d_ohjauksenala_id
	GROUP BY vuosi, d1.amk_tunnus, d2.ohjauksenala_koodi
	HAVING sum(kv_vaihtoopiskelijat_op_lkm)+sum(ulkom_hyv_op_lkm)+sum(ulkom_harj_op_lkm) > 0

	UNION ALL

	-- Ammatillinen opettajakoulutus
	SELECT
		tilastointivuosi
		,oppilaitos
		,koulutusluokitus
		,ohjauksen_ala = d2.okmohjauksenala_koodi

		,mittari = sum(tutkinnot)

		,indikaattori_lyhenne = 'amm_opettajankoulutus'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot] f
	left join VipunenTK.dbo.d_koulutustyyppi d1 on d1.id = f.koulutustyyppi_id
	left join ANTERO.dw.d_koulutusluokitus d2 on d2.koulutusluokitus_koodi = f.koulutusluokitus
	WHERE d1.koulutustyyppi_koodi = '5'
	GROUP BY tilastointivuosi, oppilaitos, koulutusluokitus, d2.okmohjauksenala_koodi
	HAVING sum(tutkinnot) > 0

) Q

WHERE tilastovuosi >= 2012

GO
/****** Object:  StoredProcedure [sa].[p_lataa_rahoitusmalli_amk_tutkimus]    Script Date: 29.9.2020 14:50:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_rahoitusmalli_amk_tutkimus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_rahoitusmalli_amk_tutkimus] AS' 
END
GO



ALTER PROCEDURE [sa].[p_lataa_rahoitusmalli_amk_tutkimus] AS


DROP TABLE IF EXISTS sa.rahoitusmalli_amk_tutkimus
--TRUNCATE TABLE sa.rahoitusmalli_amk_tutkimus

--INSERT INTO sa.rahoitusmalli_amk_tutkimus

SELECT 
	 tilastovuosi

	,oppilaitos_koodi
	,koulutus_koodi
	,ohjauksen_ala_koodi
	,avain

	,lkm = mittari

	,tarkenne1_selite = cast(tarkenne1_selite as varchar(50))
	,tarkenne1_arvo = cast(tarkenne1_arvo as varchar(50))
	,tarkenne2_selite = cast(tarkenne2_selite as varchar(50))
	,tarkenne2_arvo = cast(tarkenne2_arvo as varchar(50))
	,tarkenne3_selite = cast(tarkenne3_selite as varchar(50))
	,tarkenne3_arvo = cast(tarkenne3_arvo as varchar(50))
	,tarkenne4_selite = cast(tarkenne4_selite as varchar(50))
	,tarkenne4_arvo = cast(tarkenne4_arvo as varchar(50))
	,tarkenne5_selite = cast(tarkenne5_selite as varchar(50))
	,tarkenne5_arvo = cast(tarkenne5_arvo as varchar(50))
INTO sa.rahoitusmalli_amk_tutkimus
FROM (

	SELECT
		 tilastovuosi = tilikausi
		,oppilaitos_koodi = d2.amk_tunnus
		,koulutus_koodi = null
		,ohjauksen_ala_koodi = d3.ohjauksenala_koodi

		,mittari = sum(f.arvo)

		,avain = 'tk_rahoitus_ulkopuolinen'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM [ANTERO].[dw].[f_amk_talous] f
	left join ANTERO.dw.d_tili d1 on d1.id = f.d_tili_id
	left join ANTERO.dw.d_amk d2 on d2.id = f.d_amk_id
	left join ANTERO.dw.d_ohjauksenala d3 on d3.id = f.d_ohjauksenala_id
	WHERE tili_taso1_fi in ('Kotimainen ulkopuolinen rahoitus','Ulkomainen ulkopuolinen rahoitus')
	GROUP BY tilikausi, d2.amk_tunnus, d3.ohjauksenala_koodi
	HAVING sum(f.arvo) > 0

	/*
	-- Tutkimusrahoitus
	SELECT
		 tilastovuosi
		,oppilaitos = f.oppilaitos_avain
		,koulutus_koodi = null
		,ohjauksen_ala_koodi = null

		,mittari = sum(f.tutkimusrahoitus * 1000)

		,indikaattori_lyhenne = 'tk_rahoitus_ulkopuolinen'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM [VipunenTK].[dbo].[f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_rahoitus] f
	left join vipunenTK.dbo.d_tutkimuksen_rahoituslahde d1 on d1.id = f.rahoituslahde_id
	WHERE d1.rahoituslahteen_tyyppi = 'ulkopuolinen rahoitus' and d1.rahoituslahde! = 'EU yhteensä'
	GROUP BY tilastovuosi, oppilaitos_avain
	HAVING sum(f.tutkimusrahoitus) > 0
	*/

	UNION ALL

	-- Ylemmät amk-tutkinnot
	SELECT
		 tilastointivuosi
		,oppilaitos
		,koulutusluokitus
		,ohjauksen_ala = OKM_ohjauksen_ala_koodi

		,mittari = sum(tutkinnot)

		,indikaattori_koodi = 'tutkinnot_yamk'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot] f
	left join VipunenTK.dbo.d_koulutusluokitus d1 on d1.id = f.koulutusluokitus_id
	WHERE d1.Koulutusaste_taso2_koodi = '71'
	GROUP BY tilastointivuosi, oppilaitos, koulutusluokitus, OKM_ohjauksen_ala_koodi
	HAVING sum(tutkinnot) > 0

	UNION ALL

	-- Julkaisut
	SELECT
		 tilastovuosi
		,oppilaitos = d2.organisaatio_koodi
		,koulutusluokitus = null
		,ohjauksen_ala = d3.ohjauksenala_koodi

		,mittari = sum(lukumaara/lkm)

		,indikaattori_koodi = 'julkaisut_a_f_i'

		,tarkenne1_selite = 'avoin_saatavuus'
		,tarkenne1_arvo = (case when d1.julkaisunpaaluokka_koodi IN ('A','B','C','D','E') and d4.avoinsaatavuus_koodi in ('1','2') or d5.kytkin_koodi = '1' then 1 else 0 end) 
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM [ANTERO].[dw].[f_virta_jtp_tilasto] f
	left join ANTERO.dw.d_julkaisutyyppi d1 on d1.id = f.d_julkaisutyyppi_id
	left join ANTERO.dw.d_organisaatioluokitus d2 on d2.id = f.d_organisaatio_id
	left join ANTERO.dw.d_ohjauksenala d3 on d3.id = f.d_ohjauksenala_id
	left join ANTERO.dw.d_avoinsaatavuus d4 on d4.id = f.d_avoinSaatavuus_id
	left join ANTERO.dw.d_kytkin d5 on d5.id = f.d_rinnakkaistallennusKytkin_id
	WHERE d1.julkaisunpaaluokka_koodi IN ('A','B','C','D','E','F','I') and d2.oppilaitostyyppi_koodi = '41'
	GROUP BY f.tilastovuosi, d2.organisaatio_koodi, d3.ohjauksenala_koodi, (case when d1.julkaisunpaaluokka_koodi IN ('A','B','C','D','E') and d4.avoinsaatavuus_koodi in ('1','2') or d5.kytkin_koodi = '1' then 1 else 0 end)
	HAVING sum(lukumaara/lkm) > 0.00000
	
	UNION ALL
	-- Julkaisut f,i
	SELECT
		 vuosi
		,oppilaitos = d2.amk_tunnus
		,koulutusluokitus = null
		,ohjauksen_ala = d3.ohjauksenala_koodi

		,mittari = sum(julkaisujen_maara)

		,indikaattori_koodi = 'julkaisut_a_f_i'

		,tarkenne1_selite = 'avoin_saatavuus'
		,tarkenne1_arvo = 0
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM [ANTERO].[dw].[f_amk_julkaisut_f_i] f
	left join ANTERO.dw.d_julkaisutyyppi d1 on d1.id = f.d_julkaisutyyppi_id
	left join ANTERO.dw.d_amk d2 on d2.id = f.d_amk_id
	left join ANTERO.dw.d_ohjauksenala d3 on d3.id = f.d_ohjauksenala_id
	--left join ANTERO.dw.d_avoinsaatavuus d4 on d4.id = -1
	--left join ANTERO.dw.d_kytkin d5 on d5.id = -1
	WHERE d1.julkaisunpaaluokka_koodi IN ('F','I')
	GROUP BY f.vuosi, d2.amk_tunnus, d3.ohjauksenala_koodi
	HAVING sum(julkaisujen_maara) > 0.00000

	UNION ALL

	--Henkilöstön kv-liikkuvuus
	SELECT
		 vuosi
		,oppilaitos = d1.amk_tunnus
		,koulutusluokitus = null
		,ohjauksen_ala = d2.ohjauksenala_koodi

		,mittari = sum(vierailut_ulkomaille_lkm)+sum(vierailut_ulkomailta_lkm)

		,indikaattori_koodi = 'kv_henkilostoliikkuvuus'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM [ANTERO].[dw].[f_amk_opettaja_ja_henkilostoliikkuvuus] f
	left join ANTERO.dw.d_amk d1 on d1.id = f.d_amk_id
	left join ANTERO.dw.d_ohjauksenala d2 on d2.id = f.d_ohjauksen_ala_id
	left join dw.d_maatjavaltiot2 d3 on d3.id=f.d_kohdemaa_lahtevat_tai_lahtomaa_saapuvat_id
	WHERE d3.maatjavaltiot2_fi!='Ahvenanmaa'
	GROUP BY vuosi, d1.amk_tunnus, d2.ohjauksenala_koodi
	HAVING sum(vierailut_ulkomaille_lkm)+sum(vierailut_ulkomailta_lkm) > 0

) Q

WHERE tilastovuosi >= 2012




GO
/****** Object:  StoredProcedure [sa].[p_lataa_rahoitusmalli_yo_koulutus]    Script Date: 29.9.2020 14:50:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_rahoitusmalli_yo_koulutus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_rahoitusmalli_yo_koulutus] AS' 
END
GO



ALTER PROCEDURE [sa].[p_lataa_rahoitusmalli_yo_koulutus] AS


DROP TABLE IF EXISTS sa.rahoitusmalli_yo_koulutus
--TRUNCATE TABLE sa.rahoitusmalli_yo_koulutus

--INSERT INTO sa.rahoitusmalli_yo_koulutus

SELECT 	
	 tilastovuosi

	,oppilaitos_koodi
	,koulutus_koodi
	,ohjauksen_ala_koodi
	,avain

	,lkm = mittari

	,tarkenne1_selite = cast(tarkenne1_selite as varchar(50))
	,tarkenne1_arvo = cast(tarkenne1_arvo as varchar(50))
	,tarkenne2_selite = cast(tarkenne2_selite as varchar(50))
	,tarkenne2_arvo = cast(tarkenne2_arvo as varchar(50))
	,tarkenne3_selite = cast(tarkenne3_selite as varchar(50))
	,tarkenne3_arvo = cast(tarkenne3_arvo as varchar(50))
	,tarkenne4_selite = cast(tarkenne4_selite as varchar(50))
	,tarkenne4_arvo = cast(tarkenne4_arvo as varchar(50))
	,tarkenne5_selite = cast(tarkenne5_selite as varchar(50))
	,tarkenne5_arvo = cast(tarkenne5_arvo as varchar(50))
INTO sa.rahoitusmalli_yo_koulutus
FROM (

	-- Ylemmät kk-tutkinnot
	SELECT
		 tilastovuosi = tilastointivuosi
		,oppilaitos_koodi = oppilaitos
		,koulutus_koodi = koulutusluokitus
		,ohjauksen_ala_koodi = OKM_ohjauksen_ala_koodi

		,mittari = sum(tutkinnot)

		,avain = 'tutkinnot_ylempi_kk17'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot] f
	left join VipunenTK.dbo.d_koulutusluokitus d1 on d1.id = f.koulutusluokitus_id
	WHERE d1.Koulutusaste_taso2_koodi = '72'
	GROUP BY tilastointivuosi, oppilaitos, koulutusluokitus, OKM_ohjauksen_ala_koodi
	HAVING sum(tutkinnot) > 0

	UNION ALL

	-- Ylemmät kk-tutkinnot
	SELECT
		tilastovuosi = tutkintovuosi
		,oppilaitos = oppilaitosnro
		,koulutus_koodi = tutkintokoodi
		,ohjauksen_ala_koodi = okmohjauksenala_koodi

		,mittari = count(distinct concat(opiskelijaavain,opiskeluoikeusAvain,oppilaitosnro))

		,indikaattori_lyhenne = 'tutkinnot_ylempi_kk'

		,tarkenne1_selite = 'maara_aika'
		,tarkenne1_arvo = case when tavoiteajassavalmistunut = 1 then 1 when xonenintaan12kk = 1 then 2 else 0 end
		,tarkenne2_selite = 'tutkintoryhma'
		,tarkenne2_arvo = xxltutkintoryhma
		,tarkenne3_selite = 'aiempi_tutkinto'
		,tarkenne3_arvo = onaiempitutkinto
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM ANTERO.sa.sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet f
	left join ANTERO.dw.d_koulutusluokitus d1 on d1.koulutusluokitus_koodi = f.tutkintokoodi
	WHERE d1.koulutusastetaso2_koodi = '72' and coalesce(f.xxmrahoituslahde,1) != 4
	GROUP BY tutkintovuosi, oppilaitosnro, tutkintokoodi, okmohjauksenala_koodi, (case when tavoiteajassavalmistunut = 1 then 1 when xonenintaan12kk = 1 then 2 else 0 end), xxltutkintoryhma, onaiempitutkinto
	HAVING count(distinct concat(opiskelijaavain,opiskeluoikeusAvain,oppilaitosnro)) > 0

	UNION ALL

	-- Alemmat kk-tutkinnot
	SELECT
		 tilastovuosi = tilastointivuosi
		,oppilaitos
		,koulutus_koodi = koulutusluokitus
		,ohjauksen_ala_koodi = OKM_ohjauksen_ala_koodi

		,mittari = sum(tutkinnot)

		,indikaattori_lyhenne = 'tutkinnot_alempi_kk17'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot] f
	left join VipunenTK.dbo.d_koulutusluokitus d1 on d1.id = f.koulutusluokitus_id
	WHERE d1.Koulutusaste_taso2_koodi = '63'
	GROUP BY tilastointivuosi, oppilaitos, koulutusluokitus, OKM_ohjauksen_ala_koodi
	HAVING sum(tutkinnot) > 0

	UNION ALL

	-- Alemmat kk-tutkinnot
	SELECT
		tilastovuosi = tutkintovuosi
		,oppilaitos = oppilaitosnro
		,koulutus_koodi = tutkintokoodi
		,ohjauksen_ala_koodi = okmohjauksenala_koodi

		,mittari = count(distinct concat(opiskelijaavain,opiskeluoikeusAvain,oppilaitosnro))

		,indikaattori_lyhenne = 'tutkinnot_alempi_kk'

		,tarkenne1_selite = 'maara_aika'
		,tarkenne1_arvo = case when tavoiteajassavalmistunut = 1 then 1 when xonenintaan12kk = 1 then 2 else 0 end
		,tarkenne2_selite = 'tutkintoryhma'
		,tarkenne2_arvo = xxltutkintoryhma
		,tarkenne3_selite = 'aiempi_tutkinto'
		,tarkenne3_arvo = onaiempitutkinto
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM ANTERO.sa.sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet f
	left join ANTERO.dw.d_koulutusluokitus d1 on d1.koulutusluokitus_koodi = f.tutkintokoodi
	WHERE d1.koulutusastetaso2_koodi = '63'
	GROUP BY tutkintovuosi, oppilaitosnro, tutkintokoodi, okmohjauksenala_koodi, (case when tavoiteajassavalmistunut = 1 then 1 when xonenintaan12kk = 1 then 2 else 0 end), xxltutkintoryhma, onaiempitutkinto
	HAVING count(distinct concat(opiskelijaavain,opiskeluoikeusAvain,oppilaitosnro)) > 0

	UNION ALL

	-- Ulkomaalaisten ylemmät kk-tutkinnot
	SELECT
		tilastovuosi = tilastointivuosi
		,oppilaitos = oppilaitos
		,koulutus_koodi = koulutusluokitus
		,ohjauksen_ala_koodi = okmohjauksenala_koodi

		,mittari = sum(lukumaara)

		,indikaattori_lyhenne = 'tutkinnot_ylempi_kk_ulk'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM VipunenTK.dbo.f_OTV_2_9_Korkeakoulututkinnot f
	left join ANTERO.dw.d_koulutusluokitus d1 on d1.koulutusluokitus_koodi = f.koulutusluokitus
	WHERE d1.koulutusastetaso2_koodi = '72' and kansalaisuus_versio2 != '-1'
	GROUP BY tilastointivuosi, oppilaitos, koulutusluokitus, okmohjauksenala_koodi
	HAVING sum(lukumaara) > 0

	UNION ALL

	--55 suorittaneet
	SELECT
		tilastointivuosi = vuosi
		,oppilaitos = d1.organisaatio_koodi
		,koulutusluokitus = d2.koulutusluokitus_koodi
		,ohjauksen_ala = d2.okmohjauksenala_koodi

		,mittari = count(distinct henkilokoodi)

		,indikaattori_lyhenne = '55_op_suorittaneet'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM [ANTERO].[dw].[f_virta_otp_55_tilasto] f
	left join ANTERO.dw.d_organisaatioluokitus d1 on d1.id = f.d_organisaatio_id
	left join ANTERO.dw.d_koulutusluokitus d2 on d2.id = f.d_koulutusluokitus_id
	WHERE ([suorittanut27]=1 or [suorittanut55ilmanPankkia]=1 or [suorittanut55PankinAvulla]=1)
	and d2.koulutusastetaso2_koodi in ('63','72')
	GROUP BY vuosi, d1.organisaatio_koodi, d2.koulutusluokitus_koodi, d2.okmohjauksenala_koodi

	UNION ALL
	
	-- Jatkuva oppiminen, Avoimen korkeakoulutuksen opintopisteet
	SELECT
		 tilastointivuosi = vuosi
		,oppilaitos = d1.yo_tunnus
		,koulutusluokitus = null
		,ohjauksen_ala = d2.ohjauksenala_koodi

		,mittari = sum(avoinop_yliop_lkm)+sum(erillisilla_oik_op_lkm)+sum(erikoul_suor_op_lkm)+sum(joo_op_lkm)

		,indikaattori_lyhenne = 'opintopisteet_jatkuva17'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM [ANTERO].[dw].[f_yo_opintopisteet] f
	left join ANTERO.dw.d_yo d1 on d1.id = f.d_yo_id
	left join ANTERO.dw.d_ohjauksenala d2 on d2.id = f.d_ohjauksenala_id
	GROUP BY vuosi, d1.yo_tunnus, d2.ohjauksenala_koodi
	HAVING sum(avoinop_yliop_lkm)+sum(erillisilla_oik_op_lkm)+sum(erikoul_suor_op_lkm)+sum(joo_op_lkm) > 0
	
	UNION ALL

	-- Jatkuva oppiminen, Avoimen korkeakoulutuksen opintopisteet
	SELECT
		 tilastointivuosi = vuosi
		,oppilaitos = d1.yo_tunnus
		,koulutusluokitus = null
		,ohjauksen_ala = d2.ohjauksenala_koodi

		,mittari = sum(avoinop_yliop_lkm)+sum(erillisilla_oik_op_lkm)+sum(erikoul_suor_op_lkm)

		,indikaattori_lyhenne = 'opintopisteet_jatkuva'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM [ANTERO].[dw].[f_yo_opintopisteet] f
	left join ANTERO.dw.d_yo d1 on d1.id = f.d_yo_id
	left join ANTERO.dw.d_ohjauksenala d2 on d2.id = f.d_ohjauksenala_id
	GROUP BY vuosi, d1.yo_tunnus, d2.ohjauksenala_koodi
	HAVING sum(avoinop_yliop_lkm)+sum(erillisilla_oik_op_lkm)+sum(erikoul_suor_op_lkm) > 0
	
	UNION ALL
	
	-- Jatkuva oppiminen, Yhteistyöopintojen opintopisteet
	SELECT
		tilastointivuosi = vuosi
		,oppilaitos = d1.yo_tunnus
		,koulutusluokitus = null
		,ohjauksen_ala = d2.ohjauksenala_koodi

		,mittari = sum(f.joo_op_lkm)

		,indikaattori_lyhenne = 'opintopisteet_yhteistyo'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM [ANTERO].[dw].[f_yo_opintopisteet] f
	left join ANTERO.dw.d_yo d1 on d1.id = f.d_yo_id
	left join ANTERO.dw.d_ohjauksenala d2 on d2.id = f.d_ohjauksenala_id
	GROUP BY vuosi, d1.yo_tunnus, d2.ohjauksenala_koodi
	HAVING sum(joo_op_lkm) > 0

	UNION ALL

	--Kv opiskelijaliikkuvuus
	SELECT
		vuosi
		,oppilaitos = d1.yo_tunnus
		,koulutusluokitus = null
		,ohjauksen_ala = d2.ohjauksenala_koodi

		,mittari = sum(kv_vaihtoopiskelijat_op_lkm)+sum(ulkom_hyv_luetut_op_lkm)+sum(ulkom_harj_op_lkm)

		,indikaattori_lyhenne = 'opintopisteet_kv'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM [ANTERO].[dw].[f_yo_opintopisteet] f
	left join ANTERO.dw.d_yo d1 on d1.id = f.d_yo_id
	left join ANTERO.dw.d_ohjauksenala d2 on d2.id = f.d_ohjauksenala_id
	GROUP BY vuosi, d1.yo_tunnus, d2.ohjauksenala_koodi
	HAVING sum(kv_vaihtoopiskelijat_op_lkm)+sum(ulkom_hyv_luetut_op_lkm)+sum(ulkom_harj_op_lkm) > 0

	UNION ALL

	-- Työllistyminen ja työllistymisen laatu, Työllistyminen 1 v.
	SELECT
		tilastointivuosi
		,oppilaitos
		,koulutusluokitus
		,ohjauksen_ala = OKM_ohjauksen_ala_koodi

		,mittari = sum(case when d1.paaasiallinen_toiminta_okm_koodi=1 then sijoittuminen_1v_tutkinnon_jalkeen else 0 end)

		,indikaattori_lyhenne = 'tyolliset_1v'

		,tarkenne1_selite = 'ammattiasema'
		,tarkenne1_arvo = ammattiasema
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM [VipunenTK].[dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] f
	left join VipunenTK.dbo.d_paaasiallinen_toiminta_okm d1 on d1.id = f.paaasiallinen_toiminta_okm_id
	left join VipunenTK.dbo.d_koulutusluokitus d2 on d2.id = f.koulutusluokitus_id
	WHERE d2.Koulutusaste_taso2_koodi = '72'
	GROUP BY tilastointivuosi, oppilaitos, koulutusluokitus, OKM_ohjauksen_ala_koodi, ammattiasema
	HAVING sum(case when d1.paaasiallinen_toiminta_okm_koodi=1 then sijoittuminen_1v_tutkinnon_jalkeen else 0 end) > 0
	
	UNION ALL

	-- Työllistyminen ja työllistymisen laatu, Uraseuranta
	SELECT
		tilastovuosi = f.kyselyvuosi
		,oppilaitos = d3.organisaatio_koodi
		,koulutusluokitus = d4.koulutusluokitus_koodi
		,ohjauksen_ala = d4.okmohjauksenala_koodi

		,mittari = sum(cast(f.numerovalinta as int))

		,indikaattori_lyhenne = 'opiskelijapalaute_ura'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM ANTERO.dw.f_arvo_yo_uraseuranta f
	--left join ANTERO.dw.d_arvokyselykerta d1 on d1.id = f.d_arvokyselykerta_id
	left join ANTERO.dw.d_arvokysymys d2 on d2.id = f.d_arvokysymys_id
	--left join (select organisaatio_koodi,organisaatio_fi from ANTERO.dw.d_organisaatioluokitus where organisaatio_koodi=organisaatio_nykyinen_koodi and organisaatio_avain like 'oppilaitos%') d3 on d3.organisaatio_fi = f.Korkeakoulu
	left join dw.d_organisaatioluokitus d3 on d3.id = f.d_organisaatio_id
	left join ANTERO.dw.d_koulutusluokitus d4 on d4.id = f.d_koulutusluokitus_id
	WHERE d2.rahoitusmallikysymys = '1'
	GROUP BY f.kyselyvuosi, d3.organisaatio_koodi, d4.koulutusluokitus_koodi, d4.okmohjauksenala_koodi
	
	
	UNION ALL

	-- Opiskelijapalaute
	SELECT
		tilastovuosi = d1.vuosi
		,oppilaitos = d3.organisaatio_koodi
		,koulutusluokitus = d4.koulutusluokitus_koodi
		,ohjauksen_ala = d4.okmohjauksenala_koodi

		,mittari = sum(cast(f.numerovalinta as float))

		,indikaattori_lyhenne = 'opiskelijapalaute_kandi'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM ANTERO.dw.f_arvo_kandi f
	left join ANTERO.dw.d_arvokyselykerta d1 on d1.id = f.d_arvokyselykerta_id
	left join ANTERO.dw.d_arvokysymys d2 on d2.id = f.d_arvokysymys_id
	left join ANTERO.dw.d_organisaatioluokitus d3 on d3.id = f.d_organisaatio_oppilaitos_id
	left join ANTERO.dw.d_koulutusluokitus d4 on d4.id = f.d_koulutusluokitus_id
	WHERE d2.rahoitusmallikysymys = 1 and d1.vuosi >= 2018
	GROUP BY d1.vuosi, d3.organisaatio_koodi, d4.koulutusluokitus_koodi, d4.okmohjauksenala_koodi
	HAVING sum(cast(f.numerovalinta as float)) > 0
	
	UNION ALL

	-- Opiskelijapalaute
	-- Opiskelijapalautteen lääketieteen opiskelijoiden vastausajankohta siirtyi 3. vuoden alusta 4. vuoden alkuun, jonka takia lääketieteen vastauksia ei ole olemassa vuosilta 2016-2017 (eri yliopistoissa ajankohdan siirto ajoittui eri vuosiin)... 
	-- Rahoituslaskelmassa käytetään kolmen viimeisen käytettävissä olevan tilastovuoden tietoja... 
	-- Vuoden 2017 tiedot lääketieteestä ovat HY:n ja TY:n tapauksessa keskiarvoja 2015 ja 2017 summasta ja UEF:n, OY:n ja TaY:n osalta keskiarvoja 2015 ja 2016 summasta.
	SELECT
		tilastovuosi = f.tilastovuosi
		,oppilaitos = f.korkeakoulu_koodi
		,koulutusluokitus = null
		,ohjauksen_ala = null

		,mittari = sum(cast(opiskelijapalaute as float))

		,indikaattori_lyhenne = 'opiskelijapalaute_kandi'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM [VipunenTK_lisatiedot].[dbo].[Rahoitusmalli_korkeakoulut_opiskelijapalaute] f
	left join ANTERO.dw.d_organisaatioluokitus d3 on d3.organisaatio_koodi = f.korkeakoulu_koodi
	WHERE f.tilastovuosi < 2018 and sektori = 'Yliopisto'
	GROUP BY f.tilastovuosi,f.korkeakoulu_koodi
	HAVING sum(cast(opiskelijapalaute as float)) > 0
	

) Q

WHERE tilastovuosi >= 2012


GO
/****** Object:  StoredProcedure [sa].[p_lataa_rahoitusmalli_yo_tutkimus]    Script Date: 29.9.2020 14:50:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[p_lataa_rahoitusmalli_yo_tutkimus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [sa].[p_lataa_rahoitusmalli_yo_tutkimus] AS' 
END
GO




ALTER PROCEDURE [sa].[p_lataa_rahoitusmalli_yo_tutkimus] AS

DROP TABLE IF EXISTS sa.rahoitusmalli_yo_tutkimus
--TRUNCATE TABLE sa.rahoitusmalli_yo_tutkimus

--INSERT INTO sa.rahoitusmalli_yo_tutkimus

SELECT 
	 tilastovuosi

	,oppilaitos_koodi
	,koulutus_koodi
	,ohjauksen_ala_koodi
	,avain

	,lkm = mittari

	,tarkenne1_selite = cast(tarkenne1_selite as varchar(50))
	,tarkenne1_arvo = cast(tarkenne1_arvo as varchar(50))
	,tarkenne2_selite = cast(tarkenne2_selite as varchar(50))
	,tarkenne2_arvo = cast(tarkenne2_arvo as varchar(50))
	,tarkenne3_selite = cast(tarkenne3_selite as varchar(50))
	,tarkenne3_arvo = cast(tarkenne3_arvo as varchar(50))
	,tarkenne4_selite = cast(tarkenne4_selite as varchar(50))
	,tarkenne4_arvo = cast(tarkenne4_arvo as varchar(50))
	,tarkenne5_selite = cast(tarkenne5_selite as varchar(50))
	,tarkenne5_arvo = cast(tarkenne5_arvo as varchar(50))
INTO sa.rahoitusmalli_yo_tutkimus
FROM (

	-- Tohtorintutkinnot
	SELECT
		 tilastovuosi = tilastointivuosi
		,oppilaitos_koodi = oppilaitos
		,koulutus_koodi = koulutusluokitus
		,ohjauksen_ala_koodi = OKM_ohjauksen_ala_koodi

		,mittari = sum(tutkinnot)

		,avain = 'tutkinnot_tohtori'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot] f
	left join VipunenTK.dbo.d_koulutusluokitus d1 on d1.id = f.koulutusluokitus_id
	WHERE d1.Koulutusaste_taso2_koodi = '82'
	GROUP BY tilastointivuosi, oppilaitos, koulutusluokitus, OKM_ohjauksen_ala_koodi
	HAVING sum(tutkinnot) > 0

	UNION ALL

	-- Ulkomaalainen opetus- ja tutkimushenkilöstö
	SELECT
		f.vuosi
		,oppilaitos = d1.yo_tunnus
		,koulutusluokitus = null
		,ohjauksen_ala = d2.ohjauksenala_koodi

		,mittari = sum(henkilotyovuosi)

		,indikaattori_koodi = 'henkilosto_ulk'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM [ANTERO].[dw].[f_yo_henkilon_tyo] f	
	left join ANTERO.dw.d_yo d1 on d1.id = f.d_yliopisto_id
	left join ANTERO.dw.d_ohjauksenala d2 on d2.id = f.d_ohjauksenala_id
	left join ANTERO.dw.d_yo_tehtavanjaottelu d3 on d3.id = f.d_tehtavanjaottelu_id
	WHERE d3.koodi = 1
	GROUP BY vuosi, d1.yo_tunnus, d2.ohjauksenala_koodi
	HAVING sum(henkilotyovuosi) > 0
	
	UNION ALL

	-- Julkaisut
	SELECT
		 tilastovuosi
		,oppilaitos = d2.organisaatio_koodi
		,koulutusluokitus = null
		,ohjauksen_ala = d3.ohjauksenala_koodi

		,mittari = sum(lukumaara)

		,indikaattori_koodi = 'julkaisut_a_e'

		,tarkenne1_selite = 'avoin_saatavuus'
		,tarkenne1_arvo = case when (d4.avoinsaatavuus_koodi in ('1','2') or d5.kytkin_koodi = '1') and d1.julkaisunpaaluokka_koodi in ('A','C') then 1 else 0 end
		,tarkenne2_selite = 'jufo1'
		,tarkenne2_arvo = case when d1.julkaisunpaaluokka_koodi in ('A','C') then d6.julkaisufoorumitaso_koodi else 0 end
		,tarkenne3_selite = 'jufo2'
		,tarkenne3_arvo = case when d1.julkaisutyyppi_koodi in ('C1','D5','E2') then 1 else 0 end
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM [ANTERO].[dw].[f_virta_jtp_tilasto] f
	left join ANTERO.dw.d_julkaisutyyppi d1 on d1.id = f.d_julkaisutyyppi_id
	left join ANTERO.dw.d_organisaatioluokitus d2 on d2.id = f.d_organisaatio_id
	left join ANTERO.dw.d_ohjauksenala d3 on d3.id = f.d_ohjauksenala_id
	left join ANTERO.dw.d_avoinsaatavuus d4 on d4.id = f.d_avoinSaatavuus_id
	left join ANTERO.dw.d_kytkin d5 on d5.id = f.d_rinnakkaistallennusKytkin_id
	left join ANTERO.dw.d_julkaisufoorumitaso d6 on d6.id = f.d_julkaisufoorumitaso_id
	WHERE d1.julkaisunpaaluokka_koodi IN ('A','B','C','D','E') and d2.oppilaitostyyppi_koodi = '42'
	GROUP BY f.tilastovuosi, d1.julkaisunpaaluokka_koodi, d1.julkaisutyyppi_koodi, d2.organisaatio_koodi, d3.ohjauksenala_koodi, d4.avoinsaatavuus_koodi, d5.kytkin_koodi, d6.julkaisufoorumitaso_koodi
	
	UNION ALL

	-- Tutkimusrahoitus kv
	SELECT
		 tilikausi
		,oppilaitos = d2.yo_tunnus
		,koulutus_koodi = null
		,ohjauksen_ala_koodi = d3.ohjauksenala_koodi

		,mittari = sum(f.arvo)

		,indikaattori_lyhenne = 'tutkimusrahoitus_kv'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM [ANTERO].[dw].[f_yo_talous] f
	left join ANTERO.dw.d_tili d1 on d1.id = f.d_tili_id
	left join ANTERO.dw.d_yo d2 on d2.id = f.d_yo_id
	left join ANTERO.dw.d_ohjauksenala d3 on d3.id = f.d_ohjauksenala_id
	WHERE d1.tili_taso2_fi IN ('EU-puiteohjelmarahoitus ja muu laadullisesti kilpailtu EU-rahoitus','Ulkomaiset rahastot ja säätiöt','Kansainväliset järjestöt', 'Muu ulkomainen rahoitus')
	GROUP BY tilikausi, d2.yo_tunnus, d3.ohjauksenala_koodi
	HAVING sum(f.arvo) > 0

	UNION ALL

	-- Tutkimusrahoitus muu
	SELECT
		 tilikausi
		,oppilaitos = d2.yo_tunnus
		,koulutus_koodi = null
		,ohjauksen_ala_koodi = d3.ohjauksenala_koodi

		,mittari = sum(f.arvo)

		,indikaattori_lyhenne = 'tutkimusrahoitus_muu'

		,tarkenne1_selite = null
		,tarkenne1_arvo = null
		,tarkenne2_selite = null
		,tarkenne2_arvo = null
		,tarkenne3_selite = null
		,tarkenne3_arvo = null
		,tarkenne4_selite = null
		,tarkenne4_arvo = null
		,tarkenne5_selite = null
		,tarkenne5_arvo = null

	FROM [ANTERO].[dw].[f_yo_talous] f
	left join ANTERO.dw.d_tili d1 on d1.id = f.d_tili_id
	left join ANTERO.dw.d_yo d2 on d2.id = f.d_yo_id
	left join ANTERO.dw.d_ohjauksenala d3 on d3.id = f.d_ohjauksenala_id
	WHERE d1.tili_taso2_fi IN ('Suomen Akatemia','Tekes','Kotimaiset yritykset','Ulkomaiset yritykset','Business Finland')
	GROUP BY tilikausi, d2.yo_tunnus, d3.ohjauksenala_koodi
	HAVING sum(f.arvo) > 0

) Q

WHERE tilastovuosi >= 2012

