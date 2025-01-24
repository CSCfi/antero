USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_nayton_suorituspaikka]    Script Date: 24.1.2025 8.19.39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [dw].[p_lataa_d_nayton_suorituspaikka] AS

TRUNCATE TABLE dw.d_nayton_suorituspaikka

IF NOT EXISTS (select * from ANTERO.dw.d_nayton_suorituspaikka where id=-1) 
begin
	set identity_insert dw.d_nayton_suorituspaikka on;
	insert into dw.d_nayton_suorituspaikka (
		id,
		koodi,
		selite_fi,
		selite_sv,
		selite_en,
		source
	)
	select
		-1,
		koodi,
		nimi,
		nimi_sv,
		nimi_en,
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
	from dw.d_nayton_suorituspaikka d
	join sa.sa_koodistot s on s.koodi=d.koodi
	where s.koodisto='vipunenmeta'
	and s.koodi='-1'

end
set identity_insert dw.d_nayton_suorituspaikka off;

INSERT dw.d_nayton_suorituspaikka (koodi, selite_fi, selite_sv, selite_en, source)
VALUES 
('1','Työpaikka','Arbetsplats','Workplace','manuaalinen'),
('2','Oppilaitos','Läroanstalt','Educational institution','manuaalinen'),
('3','Työpaikka ja oppilaitos','Arbetsplats och läroanstalt','Workplace and educational institution','manuaalinen')


GO


