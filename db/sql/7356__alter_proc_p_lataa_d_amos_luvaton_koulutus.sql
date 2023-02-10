USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_amos_luvaton_koulutus]    Script Date: 10.2.2023 14:20:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dw].[p_lataa_d_amos_luvaton_koulutus] AS

TRUNCATE TABLE dw.d_amos_luvaton_koulutus

IF NOT EXISTS (select * from dw.d_amos_luvaton_koulutus where id=-1) 
begin
	set identity_insert dw.d_amos_luvaton_koulutus on;
	insert into dw.d_amos_luvaton_koulutus (
		id,
		koodi,
		selite_fi,
		selite_sv,
		selite_en,
		hyvaksytaan,
		jarjestys,
		source
	)
	select
		-1,
		koodi,
		nimi,
		nimi_sv,
		nimi_en,
		0,
		99,
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
		hyvaksytaan = 0,
		jarjestys = 99,
		d.source=s.source
	from dw.d_amos_luvaton_koulutus d
	join sa.sa_koodistot s on s.koodi=d.koodi
	where s.koodisto='vipunenmeta'
	and s.koodi='-1'

end
set identity_insert dw.d_amos_luvaton_koulutus off;

INSERT dw.d_amos_luvaton_koulutus (koodi, selite_fi, selite_sv, selite_en, hyvaksytaan, jarjestys, source)
VALUES 
('1','Ei luvaton, hyväksytty','SV*','EN*',1,1,'manuaalinen'),
('2','Tutkintokoulutus (ei oppis)','SV*','EN*',0,2,'manuaalinen'),
('3','Tutkintokoulutus (oppis)','SV*','EN*',0,3,'manuaalinen'),
('4','Täydentävä ja syventävä (ei oppis)','SV*','EN*',0,4,'manuaalinen'),
('5','Täydentävä ja syventävä (oppis)','SV*','EN*',0,5,'manuaalinen'),
('6','Tehtävään valmistava (ei oppis)','SV*','EN*',0,6,'manuaalinen'),
('7','Tehtävään valmistava (oppis)','SV*','EN*',0,7,'manuaalinen'),
('8','VALMA-koulutus','SV*','EN*',0,8,'manuaalinen'),
('9','TELMA-koulutus','SV*','EN*',0,9,'manuaalinen'),
('10','TUVA-koulutus','SV*','EN*',0,10,'manuaalinen'),
('11','Ei järjestämislupaa (muu ammatillinen koulutus)','SV*','EN*',0,11,'manuaalinen'),
('20','Tutkinto (ei oppis)','SV*','EN*',0,20,'manuaalinen'),
('21','Tutkinto (oppis)','SV*','EN*',0,21,'manuaalinen'),
('22','Tutkinnon osa (ei oppis)','SV*','EN*',0,22,'manuaalinen'),
('23','Tutkinnon osa (oppis)','SV*','EN*',1,23,'manuaalinen'),
('24','Tutkinto ja tutkinnon osa (ei oppis)','SV*','EN*',0,24,'manuaalinen'),
('25','Tutkinto ja tutkinnon osa (oppis)','SV*','EN*',0,25,'manuaalinen')
