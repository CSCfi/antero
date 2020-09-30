USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_rahoitusmalli]    Script Date: 29.9.2020 13:34:16 ******/
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

--faktataulun tyhjennys ennen kirjoitusta
truncate table dw.f_rahoitusmalli_' + @sekt + '

--indikaattoriavaimet rahoitusrajaa varten
declare @avaimet TABLE(avain VARCHAR(100),vuosi int)
insert into @avaimet select distinct avain,rahoitusvuosi from sa.rahoitusmalli_tutkintojen_rahoitusrajat where rahoitusraja=1 and sektori=@sekt

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
