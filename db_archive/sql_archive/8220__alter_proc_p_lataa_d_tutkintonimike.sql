USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_tutkintonimike]    Script Date: 18.10.2023 14:20:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


DELETE dw.d_tutkintonimike
WHERE tutkintonimike_koodi = '00000'
 
GO

ALTER   PROCEDURE [dw].[p_lataa_d_tutkintonimike] AS

if not exists (select * from dw.d_tutkintonimike where id=-1) 
begin
	set identity_insert dw.d_tutkintonimike on;
	insert into dw.d_tutkintonimike (
		id,
		tutkintonimike_koodi,
		tutkintonimike_fi,
		tutkintonimike_sv,
		tutkintonimike_en,
		source
	)
	select
		-1,
		koodi,nimi,nimi_sv,nimi_en,
		source
	from sa.sa_koodistot
	where koodisto='vipunenmeta'
	and koodi='-1'
	;
  set identity_insert dw.d_tutkintonimike off;

end 
else begin
	update d
	set
		tutkintonimike_koodi = s.koodi,
		tutkintonimike_fi = s.nimi,
		tutkintonimike_sv = s.nimi_sv,
		tutkintonimike_en = s.nimi_en,
		d.source = s.source
	from dw.d_tutkintonimike d
	join sa.sa_koodistot s on s.koodi=d.tutkintonimike_koodi
	where s.koodisto='vipunenmeta'
	and s.koodi='-1'
	;
end


MERGE dw.d_tutkintonimike AS target
USING (
	SELECT
		s.koodi as tutkintonimike_koodi, 
		s.nimi as tutkintonimike_fi, 
		coalesce(s.nimi_sv, s.nimi) as tutkintonimike_sv, 
		coalesce(s.nimi_en, s.nimi) as tutkintonimike_en,
		s.alkupvm,
		s.loppupvm,
		source = 'ETL: p_lataa_d_tutkintonimike'
	FROM ANTERO.sa.sa_koodistot s
	WHERE s.koodisto = 'tutkintonimikkeet' and s.koodi <> '00000'
) AS src
ON target.tutkintonimike_koodi = src.tutkintonimike_koodi

WHEN MATCHED THEN
	UPDATE SET
		target.tutkintonimike_fi = src.tutkintonimike_fi,
		target.tutkintonimike_sv = src.tutkintonimike_sv,
		target.tutkintonimike_en = src.tutkintonimike_en,
		target.alkupvm = src.alkupvm,
		target.loppupvm = src.loppupvm,
		target.source = src.source

WHEN NOT MATCHED THEN
	INSERT (
		tutkintonimike_koodi,
		tutkintonimike_fi,
		tutkintonimike_sv,
		tutkintonimike_en,
		alkupvm,
		loppupvm,
		source
	)
	VALUES (
		src.tutkintonimike_koodi, src.tutkintonimike_fi, src.tutkintonimike_sv, src.tutkintonimike_en,
		src.alkupvm, src.loppupvm, src.source
	);

GO


USE [ANTERO]