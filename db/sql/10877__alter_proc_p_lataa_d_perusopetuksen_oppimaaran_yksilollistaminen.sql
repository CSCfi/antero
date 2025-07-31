USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_perusopetuksen_oppimaaran_yksilollistaminen]    Script Date: 31.7.2025 9.56.57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER   PROCEDURE [dw].[p_lataa_d_perusopetuksen_oppimaaran_yksilollistaminen] AS

TRUNCATE TABLE dw.d_perusopetuksen_oppimaaran_yksilollistaminen

IF NOT EXISTS (select * from ANTERO.dw.d_perusopetuksen_oppimaaran_yksilollistaminen where id=-1) 
begin
	set identity_insert dw.d_perusopetuksen_oppimaaran_yksilollistaminen on;
	insert into dw.d_perusopetuksen_oppimaaran_yksilollistaminen (
		id,
		koodi,
		selite_fi,
		selite_sv,
		selite_en,
		luokittelu,
		jarjestys,
		source
	)
	select
		-1,
		koodi,
		nimi,
		nimi_sv,
		nimi_en,
		-1,
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
		luokittelu = s.koodi,
		d.source=s.source
	from dw.d_perusopetuksen_oppimaaran_yksilollistaminen d
	join sa.sa_koodistot s on s.koodi=d.koodi
	where s.koodisto='vipunenmeta'
	and s.koodi='-1'

end
set identity_insert dw.d_perusopetuksen_oppimaaran_yksilollistaminen off;

INSERT dw.d_perusopetuksen_oppimaaran_yksilollistaminen (koodi, selite_fi, selite_sv, selite_en, luokittelu, jarjestys, source)
VALUES 
('1','Opiskelevat toiminta-alueittain','Studerar enligt verksamhetsområde','Studying in accordance with functional areas',1,1,'manuaalinen'),
('2','Vähintään neljän oppiaineen oppimäärä on yksilöllistetty', 'Lärokursen för minst fyra läroämnen har individualiserats','No less than four subject syllabuses have been individualised',1,2,'manuaalinen'),
('3','2-3 oppiaineen oppimäärä  on yksilöllistetty','Lärokursen för ett 2–3 läroämnen har individualiserats','2-3 subject syllabuses have been individualised',1,3,'manuaalinen'),
('4','Yhden oppiaineen oppimäärä  on yksilöllistetty','Lärokursen för ett läroämne har individualiserats','One subject syllabus has been individualised',1,4,'manuaalinen'),
('5','Kaikki oppiaineet opetetaan yleisen oppimäärän mukaan','Undervisning i samtliga läroämnen enligt den allmänna lärokursen','All subjects are taught in accordance with the syllabus',1,5,'manuaalinen'),
('6','Ei tietoa oppiainesuorituksista','Information om läroämnesprestationer saknas','Missing data on passed subjects',1,6,'manuaalinen'),
('1','Opiskelevat toiminta-alueittain','Studerar enligt verksamhetsområde','Studying in accordance with functional areas',2,1,'manuaalinen'),
('2','Vähintään kymmenen oppiaineen oppimäärä on yksilöllistetty', 'Lärokursen för minst tio läroämnen har individualiserats','No less than ten subject syllabuses have been individualised',2,2,'manuaalinen'),
('3','5-9 oppiaineen oppimäärä on yksilöllistetty','Lärokursen för ett 5–9 läroämnen har individualiserats','5-9 subject syllabuses have been individualised',2,3,'manuaalinen'),
('4','1-4 oppiaineen oppimäärä on yksilöllistetty','Lärokursen för ett 1-4 läroämnen har individualiserats','1-4 subject syllabuses has been individualised',2,4,'manuaalinen'),
('5','Kaikki oppiaineet opetetaan yleisen oppimäärän mukaan','Undervisning i samtliga läroämnen enligt den allmänna lärokursen','All subjects are taught in accordance with the syllabus',2,5,'manuaalinen'),
('6','Ei tietoa oppiainesuorituksista','Information om läroämnesprestationer saknas','Missing data on passed subjects',2,6,'manuaalinen')

GO
