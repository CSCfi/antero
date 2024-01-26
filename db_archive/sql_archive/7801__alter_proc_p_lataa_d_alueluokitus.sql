USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_alueluokitus]    Script Date: 29.6.2023 17:30:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







ALTER PROCEDURE [dw].[p_lataa_d_alueluokitus] AS

if not exists (select * from dw.d_alueluokitus where id=-1) 
begin
	set identity_insert dw.d_alueluokitus on;

	insert into dw.d_alueluokitus (
		id,alueluokitus_avain,
		kunta_koodi,alkupvm,loppupvm,voimassa,
		kunta_fi,kunta_sv,kunta_en,
		maakunta_koodi,maakunta_fi,maakunta_sv,maakunta_en,
		hyvinvointialue_koodi,hyvinvointialue_fi,hyvinvointialue_sv,hyvinvointialue_en,
		avi_koodi,avi_fi,avi_sv,avi_en,
		ely_koodi,ely_fi,ely_sv,ely_en,
		kielisuhde_koodi,kielisuhde_fi,kielisuhde_sv,kielisuhde_en,
		seutukunta_koodi,seutukunta_fi,seutukunta_sv,seutukunta_en,
		kuntaryhma_koodi,kuntaryhma_fi,kuntaryhma_sv,kuntaryhma_en,
		vanha_kunta_fi,vanha_kunta_sv,vanha_kunta_en,
		source
	)
	select
		-1,koodi,
		koodi,'1900-01-01','9999-12-31',1,
		nimi,nimi_sv,nimi_en,
		koodi,nimi,nimi_sv,nimi_en,
		koodi,nimi,nimi_sv,nimi_en,
		koodi,nimi,nimi_sv,nimi_en,
		koodi,nimi,nimi_sv,nimi_en,
		koodi,nimi,nimi_sv,nimi_en,
		koodi,nimi,nimi_sv,nimi_en,
		koodi,nimi,nimi_sv,nimi_en,
		nimi,nimi_sv,nimi_en,
		source
	from sa.sa_koodistot
	where koodisto='vipunenmeta' and koodi='-1';
	
	set identity_insert dw.d_alueluokitus off;
end 

else begin
	update d set 
		alueluokitus_avain=s.koodi,
		kunta_koodi=s.koodi, alkupvm='1900-01-01', loppupvm='9999-12-31', voimassa=1,
		kunta_fi=s.nimi, kunta_sv=s.nimi_sv, kunta_en=s.nimi_en,
		maakunta_koodi=s.koodi, maakunta_fi=s.nimi, maakunta_sv=s.nimi_sv, maakunta_en=s.nimi_en,
		hyvinvointialue_koodi=s.koodi, hyvinvointialue_fi=s.nimi, hyvinvointialue_sv=s.nimi_sv, hyvinvointialue_en=s.nimi_en,
		avi_koodi=s.koodi, avi_fi=s.nimi, avi_sv=s.nimi_sv, avi_en=s.nimi_en,
		ely_koodi=s.koodi, ely_fi=s.nimi, ely_sv=s.nimi_sv, ely_en=s.nimi_en,
		kielisuhde_koodi=s.koodi, kielisuhde_fi=s.nimi, kielisuhde_sv=s.nimi_sv, kielisuhde_en=s.nimi_en,
		seutukunta_koodi=s.koodi, seutukunta_fi=s.nimi, seutukunta_sv=s.nimi_sv, seutukunta_en=s.nimi_en,
		kuntaryhma_koodi=s.koodi, kuntaryhma_fi=s.nimi, kuntaryhma_sv=s.nimi_sv, kuntaryhma_en=s.nimi_en,
		vanha_kunta_fi=s.nimi,vanha_kunta_sv=s.nimi_sv,vanha_kunta_en=s.nimi_en,
		source=s.source
	from dw.d_alueluokitus d
	join sa.sa_koodistot s on s.koodi=d.alueluokitus_avain
	where s.koodisto='vipunenmeta' and s.koodi='-1';
end


MERGE dw.d_alueluokitus AS target
USING (
  SELECT DISTINCT
    'kunta_'+sa.koodi AS avain,
    sa.koodi,
	alkupvm,
	loppupvm,
	case when loppupvm is null or loppupvm > getdate() then 1 else 0 end AS voimassa,
    COALESCE(tk.kunta, sa.nimi, sa.nimi_sv, sa.nimi_en) AS nimi,
    COALESCE(tk.kunta_sv, tk.kunta, sa.nimi_sv, sa.nimi, sa.nimi_en) AS nimi_sv,
    COALESCE(tk.kunta_en, tk.kunta, sa.nimi_en, sa.nimi, sa.nimi_sv) AS nimi_en,
    COALESCE(maakuntakoodi, ca.koodi) AS maakuntakoodi,
    COALESCE(maakuntanimi, maakuntanimi_sv, maakuntanimi_en, ca.nimi) AS maakuntanimi,
    COALESCE(maakuntanimi_sv, maakuntanimi, maakuntanimi_en, ca.nimi_sv) AS maakuntanimi_sv,
    COALESCE(maakuntanimi_en, maakuntanimi, maakuntanimi_sv, ca.nimi_en) AS maakuntanimi_en,
    COALESCE(tk.hyvinvointialue_koodi, ca.koodi) AS hyvinvointialue_koodi,
    COALESCE(tk.hyvinvointialue, tk.hyvinvointialue_sv, tk.hyvinvointialue_en, ca.nimi) AS hyvinvointialue,
    COALESCE(tk.hyvinvointialue_sv, tk.hyvinvointialue, tk.hyvinvointialue_en, ca.nimi_sv) AS hyvinvointialue_sv,
    COALESCE(tk.hyvinvointialue_en, tk.hyvinvointialue, tk.hyvinvointialue_sv, ca.nimi_en) AS hyvinvointialue_en,
    COALESCE(avikoodi, ca.koodi) AS avikoodi,
    COALESCE(avinimi, avinimi_sv, avinimi_en, ca.nimi) AS avinimi,
    COALESCE(avinimi_sv, avinimi, avinimi_en, ca.nimi_sv) AS avinimi_sv,
    COALESCE(avinimi_en, avinimi, avinimi_sv, ca.nimi_en) AS avinimi_en,
    COALESCE(elykoodi, ca.koodi) AS elykoodi,
    COALESCE(elynimi, elynimi_sv, elynimi_en, ca.nimi) AS elynimi,
    COALESCE(elynimi_sv, elynimi, elynimi_en, ca.nimi_sv) AS elynimi_sv,
    COALESCE(elynimi_en, elynimi, elynimi_sv, ca.nimi_en) AS elynimi_en,
    COALESCE(kielisuhdekoodi, ca.koodi) AS kielisuhdekoodi,
    COALESCE(kielisuhdenimi, kielisuhdenimi_sv, kielisuhdenimi_en, ca.nimi) AS kielisuhdenimi,
    COALESCE(kielisuhdenimi_sv, kielisuhdenimi, kielisuhdenimi_en, ca.nimi_sv) AS kielisuhdenimi_sv,
    COALESCE(kielisuhdenimi_en, kielisuhdenimi, kielisuhdenimi_sv, ca.nimi_en) AS kielisuhdenimi_en,
    COALESCE(seutukuntakoodi, ca.koodi) AS seutukuntakoodi,
    COALESCE(seutukuntanimi, seutukuntanimi_sv, seutukuntanimi_en, ca.nimi) AS seutukuntanimi,
    COALESCE(seutukuntanimi_sv, seutukuntanimi, seutukuntanimi_en, ca.nimi_sv) AS seutukuntanimi_sv,
    COALESCE(seutukuntanimi_en, seutukuntanimi, seutukuntanimi_sv, ca.nimi_en) AS seutukuntanimi_en,
    COALESCE(kuntaryhmakoodi, case when tk.kuntaryhma_koodi > 0 then tk.kuntaryhma_koodi end, ca.koodi) AS kuntaryhmakoodi,
    COALESCE(kuntaryhmanimi, kuntaryhmanimi_sv, kuntaryhmanimi_en, case when tk.kuntaryhma_koodi > 0 then COALESCE(tk.kuntaryhma, tk.kuntaryhma_SV, replace(kuntaryhma_EN, '-', ' ')) end, ca.nimi) AS kuntaryhmanimi,
    COALESCE(kuntaryhmanimi_sv, kuntaryhmanimi, kuntaryhmanimi_en, case when tk.kuntaryhma_koodi > 0 then COALESCE(tk.kuntaryhma_SV, tk.kuntaryhma, replace(kuntaryhma_EN, '-', ' ')) end, ca.nimi_sv) AS kuntaryhmanimi_sv,
    COALESCE(kuntaryhmanimi_en, kuntaryhmanimi, kuntaryhmanimi_sv, case when tk.kuntaryhma_koodi > 0 then COALESCE(replace(kuntaryhma_EN, '-', ' '), tk.kuntaryhma, tk.kuntaryhma_SV) end, ca.nimi_en) AS kuntaryhmanimi_en,
	COALESCE(sa.nimi, sa.nimi_sv, sa.nimi_en) AS vanha_nimi,
    COALESCE(sa.nimi_sv, sa.nimi, sa.nimi_en) AS vanha_nimi_sv,
    COALESCE(sa.nimi_en, sa.nimi, sa.nimi_sv) AS vanha_nimi_en,
    source
  FROM sa.sa_alueluokitus sa
  LEFT JOIN VipunenTK.dbo.d_alueluokitus tk on tk.alueluokitus_avain=sa.koodi
  CROSS APPLY (select koodi, nimi, nimi_sv, nimi_en from sa.sa_koodistot sa where koodisto='vipunenmeta' and koodi='-1') ca
) AS src ON target.alueluokitus_avain = src.avain

WHEN MATCHED THEN
  UPDATE SET
	alkupvm=src.alkupvm, loppupvm=src.loppupvm, voimassa=src.voimassa,
    kunta_fi=src.nimi, kunta_sv=src.nimi_sv, kunta_en=src.nimi_en,
    maakunta_koodi=src.maakuntakoodi, maakunta_fi=src.maakuntanimi, maakunta_sv=src.maakuntanimi_sv, maakunta_en=src.maakuntanimi_en,
	hyvinvointialue_koodi=src.hyvinvointialue_koodi, hyvinvointialue_fi=src.hyvinvointialue, hyvinvointialue_sv=src.hyvinvointialue_sv, hyvinvointialue_en=src.hyvinvointialue_en,
    avi_koodi=src.avikoodi, avi_fi=src.avinimi, avi_sv=src.avinimi_sv, avi_en=src.avinimi_en,
    ely_koodi=src.elykoodi, ely_fi=src.elynimi, ely_sv=src.elynimi_sv, ely_en=src.elynimi_en,
    kielisuhde_koodi=src.kielisuhdekoodi, kielisuhde_fi=src.kielisuhdenimi, kielisuhde_sv=src.kielisuhdenimi_sv, kielisuhde_en=src.kielisuhdenimi_en,
    seutukunta_koodi=src.seutukuntakoodi, seutukunta_fi=src.seutukuntanimi, seutukunta_sv=src.seutukuntanimi_sv, seutukunta_en=src.seutukuntanimi_en,
    kuntaryhma_koodi=src.kuntaryhmakoodi, kuntaryhma_fi=src.kuntaryhmanimi, kuntaryhma_sv=src.kuntaryhmanimi_sv, kuntaryhma_en=src.kuntaryhmanimi_en,
	vanha_kunta_fi=src.vanha_nimi,vanha_kunta_sv=src.vanha_nimi_sv,vanha_kunta_en=src.vanha_nimi_en,
    target.source = src.source

WHEN NOT MATCHED THEN
	INSERT (
		alueluokitus_avain,
		kunta_koodi,alkupvm,loppupvm,voimassa,
		kunta_fi,kunta_sv,kunta_en,
		maakunta_koodi,maakunta_fi,maakunta_sv,maakunta_en,
		hyvinvointialue_koodi,hyvinvointialue_fi,hyvinvointialue_sv,hyvinvointialue_en,
		avi_koodi,avi_fi,avi_sv,avi_en,
		ely_koodi,ely_fi,ely_sv,ely_en,
		kielisuhde_koodi,kielisuhde_fi,kielisuhde_sv,kielisuhde_en,
		seutukunta_koodi,seutukunta_fi,seutukunta_sv,seutukunta_en,
		kuntaryhma_koodi,kuntaryhma_fi,kuntaryhma_sv,kuntaryhma_en,
		vanha_kunta_fi,vanha_kunta_sv,vanha_kunta_en,
		source
	)
	VALUES (
		src.avain,
		src.koodi, src.alkupvm, src.loppupvm, src.voimassa,
		src.nimi, src.nimi_sv, src.nimi_en,
		src.maakuntakoodi, src.maakuntanimi, src.maakuntanimi_sv, src.maakuntanimi_en,
		src.hyvinvointialue_koodi,src.hyvinvointialue,src.hyvinvointialue_sv,src.hyvinvointialue_en,
		src.avikoodi, src.avinimi, src.avinimi_sv, src.avinimi_en,
		src.elykoodi, src.elynimi, src.elynimi_sv, src.elynimi_en,
		src.kielisuhdekoodi, src.kielisuhdenimi, src.kielisuhdenimi_sv, src.kielisuhdenimi_en,
		src.seutukuntakoodi, src.seutukuntanimi, src.seutukuntanimi_sv, src.seutukuntanimi_en,
		src.kuntaryhmakoodi, src.kuntaryhmanimi, src.kuntaryhmanimi_sv, src.kuntaryhmanimi_en,
		src.vanha_nimi, src.vanha_nimi_sv, src.vanha_nimi_en,
		src.source
	);

--ulkomaat vielä erikseen, mm. koska koodistopalvelussa tiedot kuntaa lukuun ottamatta merkitty Uudellemaalle
delete from dw.d_alueluokitus where kunta_koodi='200';
insert into dw.d_alueluokitus (
	alueluokitus_avain,
	kunta_koodi,alkupvm,loppupvm,voimassa,
	kunta_fi,kunta_sv,kunta_en,
	maakunta_koodi,maakunta_fi,maakunta_sv,maakunta_en,
	hyvinvointialue_koodi,hyvinvointialue_fi,hyvinvointialue_sv,hyvinvointialue_en,
	avi_koodi,avi_fi,avi_sv,avi_en,
	ely_koodi,ely_fi,ely_sv,ely_en,
	kielisuhde_koodi,kielisuhde_fi,kielisuhde_sv,kielisuhde_en,
	seutukunta_koodi,seutukunta_fi,seutukunta_sv,seutukunta_en,
	kuntaryhma_koodi,kuntaryhma_fi,kuntaryhma_sv,kuntaryhma_en,
	vanha_kunta_fi,vanha_kunta_sv,vanha_kunta_en,
	source
)
select
	'kunta_'+d.kunta_koodi,
	d.kunta_koodi,'1900-01-01','9999-12-31',1,
	d.kunta,d.kunta_sv,d.kunta_en,
	'98',d.kunta,d.kunta_sv,d.kunta_en,
	koodi,nimi,nimi_sv,nimi_en,
	koodi,nimi,nimi_sv,nimi_en,
	koodi,nimi,nimi_sv,nimi_en,
	koodi,nimi,nimi_sv,nimi_en,
	koodi,nimi,nimi_sv,nimi_en,
	koodi,nimi,nimi_sv,nimi_en,
	d.kunta,d.kunta_sv,d.kunta_en,
	source = 'VipunenTK.dbo.d_alueluokitus'
from VipunenTK.dbo.d_alueluokitus d
cross apply (select koodi, nimi, nimi_sv, nimi_en from sa.sa_koodistot sa where koodisto='vipunenmeta' and koodi='-1') ca
where kunta_koodi='200';


--lasketut järjestyssarakkeet
IF NOT EXISTS (
  	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
  	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_alueluokitus' AND COLUMN_NAME='jarjestys_kunta_koodi')

BEGIN
  	ALTER TABLE dw.d_alueluokitus ADD jarjestys_kunta_koodi AS case when kunta_koodi = -1 then '99999' else cast(kunta_koodi as varchar(10))
    END
END

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_alueluokitus' AND COLUMN_NAME='jarjestys_avi_koodi')

BEGIN
	ALTER TABLE dw.d_alueluokitus ADD jarjestys_avi_koodi AS case when avi_koodi = -1 then '99999' else cast(avi_koodi as varchar(10))
	END
END;

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_alueluokitus' AND COLUMN_NAME='jarjestys_ely_koodi')

BEGIN
	ALTER TABLE dw.d_alueluokitus ADD jarjestys_ely_koodi AS case when ely_koodi = -1 then '99999' else cast(ely_koodi as varchar(10))
	END
END;

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_alueluokitus' AND COLUMN_NAME='jarjestys_kielisuhde_koodi')

BEGIN
	ALTER TABLE dw.d_alueluokitus ADD jarjestys_kielisuhde_koodi AS case when kielisuhde_koodi = -1 then '99999' else cast(kielisuhde_koodi as varchar(10))
	END
END;

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_alueluokitus' AND COLUMN_NAME='jarjestys_kuntaryhma_koodi')

BEGIN
	ALTER TABLE dw.d_alueluokitus ADD jarjestys_kuntaryhma_koodi AS case when kuntaryhma_koodi = -1 then '99999' else cast(kuntaryhma_koodi as varchar(10))
	END
END;

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_alueluokitus' AND COLUMN_NAME='jarjestys_maakunta_koodi')

BEGIN
	ALTER TABLE dw.d_alueluokitus ADD jarjestys_maakunta_koodi AS case when maakunta_koodi = -1 then '99999' else cast(maakunta_koodi as varchar(10))
	END
END;

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_alueluokitus' AND COLUMN_NAME='jarjestys_hyvinvointialue_koodi')

BEGIN
	ALTER TABLE dw.d_alueluokitus ADD jarjestys_hyvinvointialue_koodi AS case when hyvinvointialue_koodi = -1 then '99999' else cast(hyvinvointialue_koodi as varchar(10))
	END
END;

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_alueluokitus' AND COLUMN_NAME='jarjestys_seutukunta_koodi')

BEGIN
	ALTER TABLE dw.d_alueluokitus ADD jarjestys_seutukunta_koodi AS case when seutukunta_koodi = -1 then '99999' else cast(seutukunta_koodi as varchar(10))
	END
END;


GO
