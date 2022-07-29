USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_opettajapatevyys]    Script Date: 26.4.2022 9:19:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dw].[p_lataa_d_opettajapatevyys] AS



TRUNCATE TABLE dw.d_opettajapatevyys

IF NOT EXISTS (select * from dw.d_opettajapatevyys where id=-1) 
begin
	set identity_insert dw.d_opettajapatevyys on;
	insert into dw.d_opettajapatevyys (
		id,
		koodi,
		selite_fi,
		selite_sv,
		selite_en,
		selite2_fi,
		selite2_sv,
		selite2_en,
		patevyyksien_maara,
		aineenopettajan_pedagogiset,
		ammatillinen,
		erityislastentarhanopettaja,
		erityisopettaja,
		opinto_ohjaaja,
		monialaiset_opinnot,
		varhaiskasvatuksen_ammatilliset_valmiudet,
		ammatillinen_opettajakoulutus,
		ammatillinen_erityisopettajakoulutus,
		ammatillinen_opinto_ohjaajakoulutus,
		ruotsinkielinen_ammatillinen_opettajankoulutus,
		source
	)
	select
		-1,
		koodi,
		nimi,
		nimi_sv,
		nimi_en,
		nimi,
		nimi_sv,
		nimi_en,
		nimi,
		koodi,
		koodi,
		koodi,
		koodi,
		koodi,
		koodi,
		koodi,
		koodi,
		koodi,
		koodi,
		koodi,
		source
	from sa.sa_koodistot
	where koodisto='vipunenmeta'
	and koodi='-1'
end

else begin
	update d
	set
		koodi = s.koodi,
		selite_fi = s.nimi,
		selite_sv = s.nimi_sv,
		selite_en = s.nimi_en,
		patevyyksien_maara = s.nimi,
		aineenopettajan_pedagogiset = s.koodi,
		ammatillinen = s.koodi,
		erityislastentarhanopettaja = s.koodi,
		erityisopettaja = s.koodi,
		opinto_ohjaaja = s.koodi,
		monialaiset_opinnot = s.koodi,
		varhaiskasvatuksen_ammatilliset_valmiudet = s.koodi,
		ammatillinen_opettajakoulutus = s.koodi,
		ammatillinen_erityisopettajakoulutus = s.koodi,
		ammatillinen_opinto_ohjaajakoulutus = s.koodi,
		ruotsinkielinen_ammatillinen_opettajankoulutus = s.koodi,
		d.source=s.source
	from dw.d_opettajapatevyys d
	join sa.sa_koodistot s on s.koodi=d.koodi
	where s.koodisto='vipunenmeta'
	and s.koodi='-1'

end
set identity_insert dw.d_opettajapatevyys off;

INSERT dw.d_opettajapatevyys (koodi, selite_fi, selite_sv, selite_en, patevyyksien_maara,aineenopettajan_pedagogiset,ammatillinen,erityislastentarhanopettaja,erityisopettaja,opinto_ohjaaja,monialaiset_opinnot,varhaiskasvatuksen_ammatilliset_valmiudet,ammatillinen_erityisopettajakoulutus,ammatillinen_opettajakoulutus,ammatillinen_opinto_ohjaajakoulutus,ruotsinkielinen_ammatillinen_opettajankoulutus, source)
VALUES 
('VA','Varhaiskasvatuksen opettaja','SV*','EN*','1 kelpoisuus',0,0,0,0,0,0,1,0,0,0,0,'manuaalinen'),
('AI','Aineenopettaja','SV*','EN*','1 kelpoisuus',1,0,0,0,0,0,0,0,0,0,0,'manuaalinen'),
('PE','Luokanopettaja','SV*','EN*','1 kelpoisuus',0,0,0,0,0,1,0,0,0,0,0,'manuaalinen'),
('ER','Erityisopettaja','SV*','EN*','1 kelpoisuus',0,0,0,1,0,0,0,0,0,0,0,'manuaalinen'),
('OP','Opinto-ohjaaja','SV*','EN*','1 kelpoisuus',0,0,0,0,1,0,0,0,0,0,0,'manuaalinen'),
('EL','Varhaiskasvatuksen erityisopettaja','SV*','EN*','1 kelpoisuus',0,0,1,0,0,0,0,0,0,0,0,'manuaalinen'),
('JA','Ammatillinen opettaja','SV*','EN*','1 kelpoisuus',0,1,0,0,0,0,0,0,1,0,0,'manuaalinen'),
('JB','Ammatillinen erityisopettaja','SV*','EN*','1 kelpoisuus',0,1,0,0,0,0,0,1,0,0,0,'manuaalinen'),
('JC','Ammatillinen opinto-ohjaaja','SV*','EN*','1 kelpoisuus',0,1,0,0,0,0,0,0,0,1,0,'manuaalinen'),
('IX','Ruotsinkielinen ammatillinen opettaja','SV*','EN*','1 kelpoisuus',0,1,0,0,0,0,0,0,0,0,1,'manuaalinen'),
('AK','Ainekelpoisuus','SV*','EN*','1 kelpoisuus',0,0,0,0,0,0,0,0,0,0,0,'manuaalinen'),
('ER_PE','Erityisluokanopettaja','SV*','EN*','2 kelpoisuutta',0,0,0,1,0,1,0,0,0,0,0,'manuaalinen')
--('VA','Varhaiskasvatuksen tehtäviin ammatillisia valmiuksia antavat opinnot','SV*','EN*','1 kelpoisuus',0,0,0,0,0,0,1,0,0,0,0,'manuaalinen'),
--('AI','Aineenopettajan pedagogiset opinnot','SV*','EN*','1 kelpoisuus',1,0,0,0,0,0,0,0,0,0,0,'manuaalinen'),
--('PE','Perusopetuksessa opetettavien aineiden ja aihekokonaisuuksien monialaiset opinnot (luokanopettaja)','SV*','EN*','1 kelpoisuus',0,0,0,0,0,1,0,0,0,0,0,'manuaalinen'),
--('ER','Erityisopettajan opinnot','SV*','EN*','1 kelpoisuus',0,0,0,1,0,0,0,0,0,0,0,'manuaalinen'),
--('OP','Opinto-ohjaajan opinnot','SV*','EN*','1 kelpoisuus',0,0,0,0,1,0,0,0,0,0,0,'manuaalinen'),
--('EL','Varhaiskasvatuksen erityisopettajan opinnot','SV*','EN*','1 kelpoisuus',0,0,1,0,0,0,0,0,0,0,0,'manuaalinen'),
--('JA','Ammatillinen opettajakoulutus','SV*','EN*','1 kelpoisuus',0,1,0,0,0,0,0,0,1,0,0,'manuaalinen'),
--('JB','Ammatillinen erityisopettajakoulutus','SV*','EN*','1 kelpoisuus',0,1,0,0,0,0,0,1,0,0,0,'manuaalinen'),
--('JC','Ammatillinen opinto-ohjaajakoulutus','SV*','EN*','1 kelpoisuus',0,1,0,0,0,0,0,0,0,1,0,'manuaalinen'),
--('IX','Ruotsinkielinen ammatillinen opettajankoulutus','SV*','EN*','1 kelpoisuus',0,1,0,0,0,0,0,0,0,0,1,'manuaalinen'),
--('AK','Ainekelpoisuus','SV*','EN*','1 kelpoisuus',0,0,0,0,0,0,0,0,0,0,0,'manuaalinen')


--usean kelpoisuuden kombinaatiokoodit (monta selectiä jotta menee pätevyyksien määrän suhteen suuruusjärjestyksessä dimensiotauluun) (vanha: v_virta_otp_opettajapatevyydet4)
INSERT INTO dw.d_opettajapatevyys (koodi)
SELECT DISTINCT kelpoisuus_priorisoitu FROM [sa].[virta_opettajakelpoisuus_uudet] WHERE LEN(kelpoisuus_priorisoitu) = 5
--INSERT INTO dw.d_opettajapatevyys (koodi)
--SELECT DISTINCT kelpoisuus_koodi_kaikki FROM [sa].[virta_opettajakelpoisuus_uudet] WHERE LEN(kelpoisuus_koodi_kaikki) = 6
--INSERT INTO dw.d_opettajapatevyys (koodi)
--SELECT DISTINCT kelpoisuus_koodi_kaikki FROM [sa].[virta_opettajakelpoisuus_uudet] WHERE LEN(kelpoisuus_koodi_kaikki) = 8
--INSERT INTO dw.d_opettajapatevyys (koodi)
--SELECT DISTINCT kelpoisuus_koodi_kaikki FROM [sa].[virta_opettajakelpoisuus_uudet] WHERE LEN(kelpoisuus_koodi_kaikki) = 10
--INSERT INTO dw.d_opettajapatevyys (koodi)
--SELECT DISTINCT kelpoisuus_koodi_kaikki FROM [sa].[virta_opettajakelpoisuus_uudet] WHERE LEN(kelpoisuus_koodi_kaikki) = 12

--selite kombinaatiokoodeille (oletusmaksimi 6 kelpoisuutta)
UPDATE d SET 
	selite_fi = LEFT(
		d1.selite_fi 
		+ ' ja ' 
		+ d2.selite_fi 
		+ case when d3.selite_fi is not null then ' + ' + d3.selite_fi else '' end
		+ case when d4.selite_fi is not null then ' + ' + d4.selite_fi else '' end
		+ case when d5.selite_fi is not null then ' + ' + d5.selite_fi else '' end
		+ case when d6.selite_fi is not null then ' + ' + d6.selite_fi else '' end
	,219)
	,patevyyksien_maara = CONCAT(LEN(REPLACE(d.koodi,'AK',''))/2, ' kelpoisuutta')
	--kytkin muuttujat eri pätevyyksille
	,aineenopettajan_pedagogiset					= case when d1.koodi = pat1 OR d2.koodi = pat1 OR d3.koodi = pat1 OR d4.koodi = pat1 OR d5.koodi = pat1 OR d6.koodi = pat1 then 1 else 0 end
	,ammatillinen									= case when d1.koodi = pat2 OR d2.koodi = pat2 OR d3.koodi = pat2 OR d4.koodi = pat2 OR d5.koodi = pat2 OR d6.koodi = pat2 then 1 else 0 end
	,erityislastentarhanopettaja					= case when d1.koodi = pat3 OR d2.koodi = pat3 OR d3.koodi = pat3 OR d4.koodi = pat3 OR d5.koodi = pat3 OR d6.koodi = pat3 then 1 else 0 end
	,erityisopettaja								= case when d1.koodi = pat4 OR d2.koodi = pat4 OR d3.koodi = pat4 OR d4.koodi = pat4 OR d5.koodi = pat4 OR d6.koodi = pat4 then 1 else 0 end
	,opinto_ohjaaja									= case when d1.koodi = pat5 OR d2.koodi = pat5 OR d3.koodi = pat5 OR d4.koodi = pat5 OR d5.koodi = pat5 OR d6.koodi = pat5 then 1 else 0 end
	,monialaiset_opinnot							= case when d1.koodi = pat6 OR d2.koodi = pat6 OR d3.koodi = pat6 OR d4.koodi = pat6 OR d5.koodi = pat6 OR d6.koodi = pat6 then 1 else 0 end
	,varhaiskasvatuksen_ammatilliset_valmiudet		= case when d1.koodi = pat7 OR d2.koodi = pat7 OR d3.koodi = pat7 OR d4.koodi = pat7 OR d5.koodi = pat7 OR d6.koodi = pat7 then 1 else 0 end
	,ammatillinen_opettajakoulutus					= case when d1.koodi = pat8 OR d2.koodi = pat8 OR d3.koodi = pat8 OR d4.koodi = pat8 OR d5.koodi = pat8 OR d6.koodi = pat8 then 1 else 0 end
	,ammatillinen_erityisopettajakoulutus			= case when d1.koodi = pat9 OR d2.koodi = pat9 OR d3.koodi = pat9 OR d4.koodi = pat9 OR d5.koodi = pat9 OR d6.koodi = pat9 then 1 else 0 end
	,ammatillinen_opinto_ohjaajakoulutus			= case when d1.koodi = pat10 OR d2.koodi = pat10 OR d3.koodi = pat10 OR d4.koodi = pat10 OR d5.koodi = pat10 OR d6.koodi = pat10 then 1 else 0 end
	,ruotsinkielinen_ammatillinen_opettajankoulutus = case when d1.koodi = pat11 OR d2.koodi = pat11 OR d3.koodi = pat11 OR d4.koodi = pat11 OR d5.koodi = pat11 OR d6.koodi = pat11 then 1 else 0 end
	,yli_asetuksen = 1
	,source = 'manuaalinen'
from dw.d_opettajapatevyys d
left join dw.d_opettajapatevyys d1 on d1.koodi = LEFT(d.koodi,2)
left join dw.d_opettajapatevyys d2 on d2.koodi = SUBSTRING(d.koodi,4,2)
left join dw.d_opettajapatevyys d3 on d3.koodi = SUBSTRING(d.koodi,7,2)
left join dw.d_opettajapatevyys d4 on d4.koodi = SUBSTRING(d.koodi,10,2)
left join dw.d_opettajapatevyys d5 on d5.koodi = SUBSTRING(d.koodi,13,2)
left join dw.d_opettajapatevyys d6 on d6.koodi = SUBSTRING(d.koodi,16,2)
left join dw.d_opettajapatevyys d7 on d7.koodi = SUBSTRING(d.koodi,19,2)
left join dw.d_opettajapatevyys d8 on d8.koodi = SUBSTRING(d.koodi,22,2)
left join dw.d_opettajapatevyys d9 on d9.koodi = SUBSTRING(d.koodi,25,2)
left join dw.d_opettajapatevyys d10 on d10.koodi = SUBSTRING(d.koodi,28,2)
cross apply (values('AI','AM','EL','ER','OP','PE','VA','JA','JB','JC','IX')) p (pat1,pat2,pat3,pat4,pat5,pat6,pat7,pat8,pat9,pat10,pat11)
where d.selite_fi IS NULL

--järjestykset
UPDATE d SET 
	jarjestys_koodi = coalesce(p.sija,99)
from dw.d_opettajapatevyys d
left join sa.virta_opettajakelpoisuus_priorisointi p on p.koodi=d.koodi

UPDATE d SET 
	jarjestys3_koodi = 
		case
			when d.koodi = 'VA' THEN 1
			when d.koodi = 'PE' THEN 2
			when d.koodi = 'AI' THEN 3
			when d.koodi = 'VA_PE' THEN 4
			when d.koodi = 'AI_PE' THEN 5
			when d.koodi = 'ER_PE' THEN 6
			when d.koodi = 'ER' THEN 7
			when d.koodi = 'EL' THEN 8
			when d.koodi = 'OP' THEN 9
			when d.koodi = 'IX' THEN 10
			when d.koodi = 'JA' THEN 8
			when d.koodi = 'JB' THEN 9
			when d.koodi = 'JC' THEN 10
			else d.jarjestys_koodi
		end 
from dw.d_opettajapatevyys d



 /*
UPDATE d SET 
	selite2_fi = 
		case 
			when patevyyksien_maara like '1%' then selite_fi
			--Erityisopettaja + opettajan pedagogiset
			when koodi like '%ER%' and koodi like '%AI%' then 'Erityisopettaja + opettajan pedagogiset'
			--Erityisopettaja + luokanopettaja 
			when koodi like '%ER%' and koodi like '%PE%' then 'Erityisopettaja + luokanopettaja'
			--Opinto-ohjaajan + opettajan pedagogiset 
			when koodi like '%OP%' and koodi like '%AI%' then 'Opinto-ohjaajan + opettajan pedagogiset'
			--Varhaiskasvatuksen erityisopettajan opinnot + Vaka 
			when koodi like '%EL%' and koodi like '%VA%' then 'Varhaiskasvatuksen erityisopettajan opinnot + Vaka'
			--Perusopetuksessa opetettavien aineiden ja aihekokonaisuuksien monialaiset opinnot + opettajan pedagogiset 
			when koodi like '%PE%' and koodi like '%AI%' then 'Perusopetuksessa opetettavien aineiden ja aihekokonaisuuksien monialaiset opinnot + opettajan pedagogiset'
			--Vaka-opettaja + luokanopettaja 
			when koodi like '%VA%' and koodi like '%PE%' then 'Vaka-opettaja + luokanopettaja'
			--Ainekelpoisuus + Opettajan pedagogiset opinnot 
			when koodi like '%AK%' and koodi like '%AI%' then 'Ainekelpoisuus + Opettajan pedagogiset opinnot'
			--Ainekelpoisuus + Opettajan pedagogiset opinnot + erityisopettaja
			when koodi like '%AK%' and koodi like '%AI%' and koodi like '%ER%' then 'Ainekelpoisuus + Opettajan pedagogiset opinnot + erityisopettaja'
			--Ainekelpoisuus + Opettajan pedagogiset opinnot + opinto-ohjaaja 
			when koodi like '%AK%' and koodi like '%AI%' and koodi like '%OP%' then 'Ainekelpoisuus + Opettajan pedagogiset opinnot + opinto-ohjaaja'
			--Ainekelpoisuus + Opettajan pedagogiset opinnot + luokanopettaja/monialaiset 
			when koodi like '%AK%' and koodi like '%AI%' and koodi like '%PE%' then 'Ainekelpoisuus + Opettajan pedagogiset opinnot + luokanopettaja/monialaiset'
			else 'Muu'
		end
	,selite2_sv = 'SV*'
	,selite2_en = 'EN*'
from dw.d_opettajapatevyys d
*/

----selite2 päivitys, yksi kelpoisuus
--UPDATE d SET 
--	selite2_fi = selite_fi
--	,selite2_sv = 'SV*'
--	,selite2_en = 'EN*'
--	,jarjestys2_koodi = jarjestys_koodi
--FROM dw.d_opettajapatevyys d
--WHERE patevyyksien_maara like '1%'

----selite2 päivitys, enemmän kuin yksi kelpoisuus [sa].[virta_opettajakelpoisuus_kombot] 
--DECLARE @koodit VARCHAR(50) 
--DECLARE @koodi VARCHAR(50) 
--DECLARE @selite VARCHAR(150) 
--DECLARE @selite_kaikki VARCHAR(MAX) 
--DECLARE @ehto VARCHAR(256) 
--DECLARE @yli_asetuksen CHAR(1)
--DECLARE @jarjestys VARCHAR(20)

--DECLARE db_cursor1 CURSOR FOR 
--SELECT
--	koodit
--	,yli_asetuksen
--FROM [ANTERO].[sa].[virta_opettajakelpoisuus_kombot]

--OPEN db_cursor1
	
--	FETCH NEXT FROM db_cursor1 INTO @koodit, @yli_asetuksen
	
--	WHILE @@FETCH_STATUS = 0  
--	BEGIN  

--		DECLARE db_cursor2 CURSOR FOR 
--		SELECT
--			koodi = p.value
--			,d.selite_fi 
--			,jarjestys = replace(@koodit,'_','')
--		FROM string_split(@koodit,'_') p
--		left join dw.d_opettajapatevyys d on d.koodi = p.value

--		OPEN db_cursor2 

--			FETCH NEXT FROM db_cursor2 INTO @koodi, @selite, @jarjestys
			
--			SET @ehto = ''
--			SET @selite_kaikki = ''

--			--ehdon ja selitteen merkkijono
--			WHILE @@FETCH_STATUS = 0  
--			BEGIN  
--				  SET @ehto = @ehto + (case when len(@ehto) > 0 then 'and ' else '' end) + 'koodi like ''%' + @koodi +  '%'''
--				  SET @selite_kaikki = @selite_kaikki + (case when len(@selite_kaikki) > 0 then ' + ' else '' end) + @selite
--				  FETCH NEXT FROM db_cursor2 INTO @koodi, @selite, @jarjestys
--			END 

--		CLOSE db_cursor2  
--		DEALLOCATE db_cursor2

--		--dimension päivitys
--		DECLARE @sql_komento nvarchar(max)
--		SET @sql_komento = 
--			'UPDATE d SET 
--				selite2_fi = ''' + @selite_kaikki + '''
--				,yli_asetuksen = ' + @yli_asetuksen + '
--				,jarjestys2_koodi = ''' + @jarjestys + '''
--			FROM dw.d_opettajapatevyys d
--			WHERE ' + @ehto

--		EXEC sp_executesql @sql_komento

--		FETCH NEXT FROM db_cursor1 INTO @koodit, @yli_asetuksen
--	END 

--CLOSE db_cursor1
--DEALLOCATE db_cursor1



GO

USE [ANTERO]