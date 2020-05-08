USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_opettajapatevyys]    Script Date: 8.5.2020 11:24:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_opettajapatevyys]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_opettajapatevyys] AS' 
END
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
		patevyyksien_maara,
		aineenopettajan_pedagogiset,
		ammatillinen,
		erityislastentarhanopettaja,
		erityisopettaja,
		opinto_ohjaaja,
		monialaiset_opinnot,
		varhaiskasvatuksen_ammatilliset_valmiudet,
		source
	)
	select
		-1,
		koodi,
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
		d.source=s.source
	from dw.d_opettajapatevyys d
	join sa.sa_koodistot s on s.koodi=d.koodi
	where s.koodisto='vipunenmeta'
	and s.koodi='-1'

end
set identity_insert dw.d_opettajapatevyys off;

INSERT dw.d_opettajapatevyys (koodi, selite_fi, selite_sv, selite_en, patevyyksien_maara,aineenopettajan_pedagogiset,ammatillinen,erityislastentarhanopettaja,erityisopettaja,opinto_ohjaaja,monialaiset_opinnot,varhaiskasvatuksen_ammatilliset_valmiudet, source)
VALUES 
('VA','Varhaiskasvatuksen tehtäviin ammatillisia valmiuksia antavat opinnot','SV*','EN*','1 kelpoisuus',0,0,0,0,0,0,1,'manuaalinen'),
('AI','Aineenopettajan pedagogiset opinnot','SV*','EN*','1 kelpoisuus',1,0,0,0,0,0,0,'manuaalinen'),
('PE','Perusopetuksessa opetettavien aineiden ja aihekokonaisuuksien monialaiset opinnot (luokanopettaja)','SV*','EN*','1 kelpoisuus',0,0,0,0,0,1,0,'manuaalinen'),
('ER','Erityisopettajan opinnot','SV*','EN*','1 kelpoisuus',0,0,0,1,0,0,0,'manuaalinen'),
('OP','Opinto-ohjaajan opinnot','SV*','EN*','1 kelpoisuus',0,0,0,0,1,0,0,'manuaalinen'),
('EL','Varhaiskasvatuksen erityisopettajan opinnot','SV*','EN*','1 kelpoisuus',0,0,1,0,0,0,0,'manuaalinen'),
('AM','Pedagogiset opinnot ammatillisessa opettajankoulutuksessa','SV*','EN*','1 kelpoisuus',0,1,0,0,0,0,0,'manuaalinen')


--usean kelpoisuuden kombinaatiokoodit (monta selectiä jotta menee pätevyyksien määrän suhteen suuruusjärjestyksessä dimensiotauluun)
INSERT INTO dw.d_opettajapatevyys (koodi)
SELECT DISTINCT kelp_avain FROM [sa].[v_virta_otp_opettajapatevyydet4] WHERE LEN(kelp_avain) = 4
INSERT INTO dw.d_opettajapatevyys (koodi)
SELECT DISTINCT kelp_avain FROM [sa].[v_virta_otp_opettajapatevyydet4] WHERE LEN(kelp_avain) = 6
INSERT INTO dw.d_opettajapatevyys (koodi)
SELECT DISTINCT kelp_avain FROM [sa].[v_virta_otp_opettajapatevyydet4] WHERE LEN(kelp_avain) = 8
INSERT INTO dw.d_opettajapatevyys (koodi)
SELECT DISTINCT kelp_avain FROM [sa].[v_virta_otp_opettajapatevyydet4] WHERE LEN(kelp_avain) = 10
INSERT INTO dw.d_opettajapatevyys (koodi)
SELECT DISTINCT kelp_avain FROM [sa].[v_virta_otp_opettajapatevyydet4] WHERE LEN(kelp_avain) = 12

--selite kombinaatiokoodeille (oletusmaksimi 6 kelpoisuutta)
UPDATE d SET 
selite_fi = LEFT(
				d1.selite_fi 
				+ ' + ' 
				+ d2.selite_fi 
				+ case when d3.selite_fi is not null then ' + ' + d3.selite_fi else '' end
				+ case when d4.selite_fi is not null then ' + ' + d4.selite_fi else '' end
				+ case when d5.selite_fi is not null then ' + ' + d5.selite_fi else '' end
				+ case when d6.selite_fi is not null then ' + ' + d6.selite_fi else '' end
			,219)
,patevyyksien_maara = CONCAT(LEN(d.koodi)/2, ' kelpoisuutta')
--kytkin muuttujat eri pätevyyksille
,aineenopettajan_pedagogiset =					case when d1.koodi = pat1 OR d2.koodi = pat1 OR d3.koodi = pat1 OR d4.koodi = pat1 OR d5.koodi = pat1 OR d6.koodi = pat1 then 1 else 0 end
,ammatillinen =									case when d1.koodi = pat2 OR d2.koodi = pat2 OR d3.koodi = pat2 OR d4.koodi = pat2 OR d5.koodi = pat2 OR d6.koodi = pat2 then 1 else 0 end
,erityislastentarhanopettaja =					case when d1.koodi = pat3 OR d2.koodi = pat3 OR d3.koodi = pat3 OR d4.koodi = pat3 OR d5.koodi = pat3 OR d6.koodi = pat3 then 1 else 0 end
,erityisopettaja =								case when d1.koodi = pat4 OR d2.koodi = pat4 OR d3.koodi = pat4 OR d4.koodi = pat4 OR d5.koodi = pat4 OR d6.koodi = pat4 then 1 else 0 end
,opinto_ohjaaja =								case when d1.koodi = pat5 OR d2.koodi = pat5 OR d3.koodi = pat5 OR d4.koodi = pat5 OR d5.koodi = pat5 OR d6.koodi = pat5 then 1 else 0 end
,monialaiset_opinnot =							case when d1.koodi = pat6 OR d2.koodi = pat6 OR d3.koodi = pat6 OR d4.koodi = pat6 OR d5.koodi = pat6 OR d6.koodi = pat6 then 1 else 0 end
,varhaiskasvatuksen_ammatilliset_valmiudet =	case when d1.koodi = pat7 OR d2.koodi = pat7 OR d3.koodi = pat7 OR d4.koodi = pat7 OR d5.koodi = pat7 OR d6.koodi = pat7 then 1 else 0 end
,source = 'manuaalinen'
from dw.d_opettajapatevyys d
left join dw.d_opettajapatevyys d1 on d1.koodi = LEFT(d.koodi,2)
left join dw.d_opettajapatevyys d2 on d2.koodi = SUBSTRING(d.koodi,3,2)
left join dw.d_opettajapatevyys d3 on d3.koodi = SUBSTRING(d.koodi,5,2)
left join dw.d_opettajapatevyys d4 on d4.koodi = SUBSTRING(d.koodi,7,2)
left join dw.d_opettajapatevyys d5 on d5.koodi = SUBSTRING(d.koodi,9,2)
left join dw.d_opettajapatevyys d6 on d6.koodi = SUBSTRING(d.koodi,11,2)
cross apply (values('AI','AM','EL','ER','OP','PE','VA')) p (pat1,pat2,pat3,pat4,pat5,pat6,pat7)
where d.selite_fi IS NULL

