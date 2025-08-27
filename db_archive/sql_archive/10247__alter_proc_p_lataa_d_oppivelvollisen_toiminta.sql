USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_oppivelvollisen_toiminta]    Script Date: 18.10.2024 14:03:43 ******/
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
('1','Oppivelvollisuus päättynyt','Läroplikten har upphört','Oppivelvollisuus päättynyt EN*','Suorittanut toisen asteen tutkinnon','Har avlagt examen på andra stadiet','Suorittanut toisen asteen tutkinnon EN*',1,1,'manuaalinen'),
('2','Oppivelvollisuus päättynyt','Läroplikten har upphört','Oppivelvollisuus päättynyt EN*','Täyttänyt 18 vuotta','Fyllt 18 år','Täyttänyt 18 vuotta EN*',1,2,'manuaalinen'),
('3','Ei oppivelvollisuuden piirissä','Omfattas inte av läroplikt','Ei oppivelvollisuuden piirissä EN*','Kotikunta ei ole Manner-Suomessa','Hemkommun inte i Fasta Finland','Kotikunta ei ole Manner-Suomessa EN*',4,12,'manuaalinen'),
('4','Suorittaa oppivelvollisuutta','Utför läroplikt','Suorittaa oppivelvollisuutta EN*','Tutkintoon johtavassa ammatillisessa koulutuksessa','I yrkesutbildning som leder till examen','Tutkintoon johtavassa ammatillisessa koulutuksessa EN*',2,3,'manuaalinen'),
('5','Suorittaa oppivelvollisuutta','Utför läroplikt','Suorittaa oppivelvollisuutta EN*','Tutkintoon johtavassa lukiokoulutuksessa','I gymnasieutbildning som leder till examen','Tutkintoon johtavassa lukiokoulutuksessa EN*',2,4,'manuaalinen'),
('6','Suorittaa oppivelvollisuutta','Utför läroplikt','Suorittaa oppivelvollisuutta EN*','Suorittaa perusopetuksen oppimäärää', 'Har tillfälligt avbrutit läroplikten','Suorittaa perusopetuksen oppimäärää EN*',2,5,'manuaalinen'),
('7','Suorittaa oppivelvollisuutta','Utför läroplikt','Suorittaa oppivelvollisuutta EN*','Esiopetuksessa','I förskoleundervisning','Esiopetuksessa EN*',2,6,'manuaalinen'),
('8','Suorittaa oppivelvollisuutta','Utför läroplikt','Suorittaa oppivelvollisuutta EN*','Tutkintoon johtamattomassa koulutuksessa (kelpaa oppivelvollisuuden suorittamiseen)','I utbildning som inte leder till examen (lämplig för fullgörande av läroplikten)','Tutkintoon johtamattomassa koulutuksessa (kelpaa oppivelvollisuuden suorittamiseen) EN*',2,7,'manuaalinen'),
('9','Ei oppivelvollisuuden piirissä','Omfattas inte av läroplikt','Ei oppivelvollisuuden piirissä EN*','Vapautettu oppivelvollisuudesta','Befriad från läroplikt','Vapautettu oppivelvollisuudesta EN*',4,11,'manuaalinen'),
('10','Ei suorita oppivelvollisuutta','Fullgör inte läroplikt','Ei suorita oppivelvollisuutta EN*','Opiskeluoikeus oppivelvollisuuden suorittamiseen kelpaavassa koulutuksessa, päätös oppivelvollisuuden suorittamisen keskeyttämisestä','Studierätt inom utbildning som lämpar sig för fullgörande av läroplikten, beslut om avbrytande av fullgörandet av läroplikten','Opiskeluoikeus oppivelvollisuuden suorittamiseen kelpaavassa koulutuksessa, päätös oppivelvollisuuden suorittamisen keskeyttämisestä EN*',3,10,'manuaalinen'),
('11','Ei suorita oppivelvollisuutta','Fullgör inte läroplikt','Ei suorita oppivelvollisuutta EN*','Ei opiskeluoikeutta oppivelvollisuuden suorittamiseen kelpaavassa koulutuksessa, päätös oppivelvollisuuden suorittamisen keskeyttämisestä','Ingen studierätt inom utbildning som lämpar sig för fullgörande av läroplikten, beslut om avbrytande av fullgörandet av läroplikten','Ei opiskeluoikeutta oppivelvollisuuden suorittamiseen kelpaavassa koulutuksessa, päätös oppivelvollisuuden suorittamisen keskeyttämisestä EN*',3,11,'manuaalinen'),
('12','Ei suorita oppivelvollisuutta','Fullgör inte läroplikt','Ei suorita oppivelvollisuutta EN*','Ei opiskeluoikeutta oppivelvollisuuden suorittamiseen kelpaavassa koulutuksessa, ei päätöstä oppivelvollisuuden suorittamisen keskeyttämisestä','Ingen studierätt inom utbildning som lämpar sig för fullgörande av läroplikten, inget beslut om avbrytande av fullgörandet av läroplikten','Ei opiskeluoikeutta oppivelvollisuuden suorittamiseen kelpaavassa koulutuksessa, ei päätöstä oppivelvollisuuden suorittamisen keskeyttämisestä EN*',3,12,'manuaalinen')

GO


