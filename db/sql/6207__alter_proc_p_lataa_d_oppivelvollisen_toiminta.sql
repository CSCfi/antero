USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_oppivelvollisen_toiminta]    Script Date: 9.5.2022 16:05:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_d_oppivelvollisen_toiminta] AS

TRUNCATE TABLE dw.d_oppivelvollisen_toiminta

IF NOT EXISTS (select * from ANTERO.dw.d_oppivelvollisen_toiminta where id=-1) 
begin
	set identity_insert dw.d_oppivelvollisen_toiminta on;
	insert into dw.d_oppivelvollisen_toiminta (
		id,
		koodi,
		selite_fi,
		selite_sv,
		selite_en,
		selite2_fi,
		selite2_sv,
		selite2_en,
		jarjestys,
		jarjestys2,
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
		999,
		999,
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
		selite2_fi = s.nimi,
		selite2_sv = s.nimi_sv,
		selite2_en = s.nimi_en,
		d.source=s.source
	from dw.d_oppivelvollisen_toiminta d
	join sa.sa_koodistot s on s.koodi=d.koodi
	where s.koodisto='vipunenmeta'
	and s.koodi='-1'

end
set identity_insert dw.d_oppivelvollisen_toiminta off;

INSERT dw.d_oppivelvollisen_toiminta (koodi, selite_fi, selite_sv, selite_en, selite2_fi, selite2_sv, selite2_en, jarjestys, jarjestys2, source)
VALUES 
('1','Oppivelvollisuus päättynyt','SV*','EN*','Suorittanut toisen asteen tutkinnon','SV*','EN*',1,1,'manuaalinen'),
('2','Oppivelvollisuus päättynyt','SV*','EN*','Täyttänyt 18 vuotta','SV*','EN*',1,2,'manuaalinen'),
('3','Suorittaa oppivelvollisuutta','SV*','EN*','Tutkintoon johtavassa ammatillisessa koulutuksessa','SV*','EN*',2,3,'manuaalinen'),
('4','Suorittaa oppivelvollisuutta','SV*','EN*','Tutkintoon johtavassa lukiokoulutuksessa','SV*','EN*',2,4,'manuaalinen'),
('5','Suorittaa oppivelvollisuutta','SV*','EN*','Suorittaa perusopetuksen oppimäärää','SV*','EN*',2,5,'manuaalinen'),
('6','Suorittaa oppivelvollisuutta','SV*','EN*','Esiopetuksessa','SV*','EN*',2,6,'manuaalinen'),
('7','Suorittaa oppivelvollisuutta','SV*','EN*','Tutkintoon johtamattomassa koulutuksessa (kelpaa oppivelvollisuuden suorittamiseen)','SV*','EN*',3,7,'manuaalinen'),
('8','Ei suorita oppivelvollisuutta','SV*','EN*','Keskeyttänyt oppivelvollisuuden suorittamisen väliaikaisesti','SV*','EN*',3,8,'manuaalinen'),
('9','Ei suorita oppivelvollisuutta','SV*','EN*','Tutkintoon johtamattomassa koulutuksessa (ei kelpaa oppivelvollisuuden suorittamiseen)','SV*','EN*',3,9,'manuaalinen'),
('10','Ei suorita oppivelvollisuutta','SV*','EN*','Ei koulutuksessa','SV*','EN*',3,10,'manuaalinen')


GO


USE [ANTERO]