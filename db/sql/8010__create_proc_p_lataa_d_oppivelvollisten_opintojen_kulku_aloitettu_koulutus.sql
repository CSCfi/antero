USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_oppivelvollisten_opintojen_kulku_aloitettu_koulutus]    Script Date: 6.9.2023 10:29:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE  [dw].[p_lataa_d_oppivelvollisten_opintojen_kulku_aloitettu_koulutus] AS

TRUNCATE TABLE dw.d_oppivelvollisten_opintojen_kulku_aloitettu_koulutus

IF NOT EXISTS (select * from ANTERO.dw.d_oppivelvollisten_opintojen_kulku_aloitettu_koulutus where id=-1) 
begin
	set identity_insert dw.d_oppivelvollisten_opintojen_kulku_aloitettu_koulutus on;
	insert into dw.d_oppivelvollisten_opintojen_kulku_aloitettu_koulutus (
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
	from dw.d_oppivelvollisten_opintojen_kulku_aloitettu_koulutus d
	join sa.sa_koodistot s on s.koodi=d.koodi
	where s.koodisto='vipunenmeta'
	and s.koodi='-1'

end
set identity_insert dw.d_oppivelvollisten_opintojen_kulku_aloitettu_koulutus off;

INSERT INTO dw.d_oppivelvollisten_opintojen_kulku_aloitettu_koulutus (koodi, selite_fi, selite_sv, selite_en, jarjestys, source)
VALUES 
('1','Aloittanut ammatillisen tutkintokoulutuksen','Aloittanut ammatillisen tutkintokoulutuksen SV*', 'Aloittanut ammatillisen tutkintokoulutuksen *EN', 1, 'manuaalinen'),
('2','Aloittanut tutkintoon johtavan lukiokoulutuksen','Aloittanut tutkintoon johtavan lukiokoulutuksen SV*', 'Aloittanut tutkintoon johtavan lukiokoulutuksen *EN', 2, 'manuaalinen'),
('3','Aloittanut valmentavan koulutuksen','Aloittanut valmentavan koulutuksen SV*', 'Aloittanut valmentavan koulutuksen *EN', 3, 'manuaalinen'),
('4','Aloittanut perusopetuksen','Aloittanut perusopetuksen SV*', 'Aloittanut perusopetuksen *EN', 4, 'manuaalinen')

GO

USE [ANTERO]