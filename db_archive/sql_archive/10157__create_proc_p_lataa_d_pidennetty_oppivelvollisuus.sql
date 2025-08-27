USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_pidennetty_oppivelvollisuus]    Script Date: 26.9.2024 11:59:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE [dw].[p_lataa_d_pidennetty_oppivelvollisuus] AS

TRUNCATE TABLE dw.d_pidennetty_oppivelvollisuus

IF NOT EXISTS (select * from ANTERO.dw.d_pidennetty_oppivelvollisuus where id=-1) 
begin
	set identity_insert dw.d_pidennetty_oppivelvollisuus on;
	insert into dw.d_pidennetty_oppivelvollisuus (
		id,
		koodi,
		selite_fi,
		selite_sv,
		selite_en,
		jarjestys,
		source
	)
	select
		-1,
		koodi,
		nimi,
		nimi_sv,
		nimi_en,
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
		d.source=s.source
	from dw.d_pidennetty_oppivelvollisuus d
	join sa.sa_koodistot s on s.koodi=d.koodi
	where s.koodisto='vipunenmeta'
	and s.koodi='-1'

end
set identity_insert dw.d_pidennetty_oppivelvollisuus off;

INSERT dw.d_pidennetty_oppivelvollisuus (koodi, selite_fi, selite_sv, selite_en, jarjestys, source)
VALUES 
('0','Ei pidennettyä oppivelvollisuutta','Ingen förlängd läroplikt','Ei pidennettyä oppivelvollisuutta*EN',1,'manuaalinen'),
('1','Pidennetty oppivelvollisuus, vaikeimmin kehitysvammaiset','Förlängd läroplikt, gravt handikappade','Pidennetty oppivelvollisuus, vaikeimmin kehitysvammaiset*EN',2,'manuaalinen'),
('2','Pidennetty oppivelvollisuus, muut kuin vaikeimmin kehitysvammaiset','Förlängd läroplikt, andra än gravt handikappade','Pidennetty oppivelvollisuus, muut kuin vaikeimmin kehitysvammaiset*EN',3,'manuaalinen')

GO

USE [ANTERO]