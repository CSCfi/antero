USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_arvovaihtoehto]    Script Date: 22.1.2024 13:48:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dw].[p_lataa_d_arvovaihtoehto] AS

TRUNCATE TABLE dw.d_arvovaihtoehto

IF NOT EXISTS (select * from ANTERO.dw.d_arvovaihtoehto where id=-1) 
begin
	set identity_insert dw.d_arvovaihtoehto on;
	insert into dw.d_arvovaihtoehto (
		id,
		vastaus_koodi,
		numerovalinta,
		vastaus_fi,
		vastaus_sv,
		vastaus_en,
		source
	)
	select
		-1,
		koodi,
		-1,
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
		vastaus_koodi = s.koodi,
		numerovalinta = '-1',
		vastaus_fi = s.nimi,
		vastaus_sv = s.nimi_sv,
		vastaus_en = s.nimi_en,
		d.source=s.source
	from dw.d_arvovaihtoehto d
	join sa.sa_koodistot s on s.koodi=d.vastaus_koodi
	where s.koodisto='vipunenmeta'
	and s.koodi='-1'

end
set identity_insert dw.d_arvovaihtoehto off;

INSERT dw.d_arvovaihtoehto (vastaus_koodi, numerovalinta, vastaus_fi, vastaus_sv, vastaus_en, source)
VALUES 
('kylla', 1, 'Kyllä', 'Ja', 'Yes', 'ETL: p_lataa_d_arvovaihtoehto'),
('ei', 2, 'Ei', 'Nej', 'No', 'ETL: p_lataa_d_arvovaihtoehto')

GO

EXEC [dw].[p_lataa_d_arvovaihtoehto]

GO 

USE [ANTERO]