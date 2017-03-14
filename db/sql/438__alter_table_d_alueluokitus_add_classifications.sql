IF NOT EXISTS (
select * from INFORMATION_SCHEMA.COLUMNS
where TABLE_SCHEMA='dw' and TABLE_NAME='d_alueluokitus'
and COLUMN_NAME='avi_koodi' --+ fi,sv,en
) BEGIN

ALTER TABLE dw.d_alueluokitus ADD
  avi_koodi varchar(2) NULL,
  avi_fi nvarchar(60) NULL,
  avi_sv nvarchar(60) NULL,
  avi_en nvarchar(60) NULL

END


IF NOT EXISTS (
select * from INFORMATION_SCHEMA.COLUMNS
where TABLE_SCHEMA='dw' and TABLE_NAME='d_alueluokitus'
and COLUMN_NAME='ely_koodi' --+ fi,sv,en
) BEGIN

ALTER TABLE dw.d_alueluokitus ADD
  ely_koodi varchar(2) NULL,
  ely_fi nvarchar(60) NULL,
  ely_sv nvarchar(60) NULL,
  ely_en nvarchar(60) NULL

END


IF NOT EXISTS (
select * from INFORMATION_SCHEMA.COLUMNS
where TABLE_SCHEMA='dw' and TABLE_NAME='d_alueluokitus'
and COLUMN_NAME='kielisuhde_koodi' --+ fi,sv,en
) BEGIN

ALTER TABLE dw.d_alueluokitus ADD
  kielisuhde_koodi varchar(5) NULL,
  kielisuhde_fi nvarchar(60) NULL,
  kielisuhde_sv nvarchar(60) NULL,
  kielisuhde_en nvarchar(60) NULL

END



IF NOT EXISTS (
select * from INFORMATION_SCHEMA.COLUMNS
where TABLE_SCHEMA='dw' and TABLE_NAME='d_alueluokitus'
and COLUMN_NAME='seutukunta_koodi' --+ fi,sv,en
) BEGIN

ALTER TABLE dw.d_alueluokitus ADD
  seutukunta_koodi varchar(5) NULL,
  seutukunta_fi nvarchar(60) NULL,
  seutukunta_sv nvarchar(60) NULL,
  seutukunta_en nvarchar(60) NULL

END



IF NOT EXISTS (
select * from INFORMATION_SCHEMA.COLUMNS
where TABLE_SCHEMA='dw' and TABLE_NAME='d_alueluokitus'
and COLUMN_NAME='kuntaryhma_koodi' --+ fi,sv,en
) BEGIN

ALTER TABLE dw.d_alueluokitus ADD
  kuntaryhma_koodi varchar(5) NULL,
  kuntaryhma_fi nvarchar(60) NULL,
  kuntaryhma_sv nvarchar(60) NULL,
  kuntaryhma_en nvarchar(60) NULL

END


/* for reverting
ALTER TABLE dw.d_alueluokitus DROP COLUMN
  avi_koodi,
  avi_fi,
  avi_sv,
  avi_en,
  ely_koodi,
  ely_fi,
  ely_sv,
  ely_en,
  kielisuhde_koodi,
  kielisuhde_fi,
  kielisuhde_sv,
  kielisuhde_en,
  seutukunta_koodi,
  seutukunta_fi,
  seutukunta_sv,
  seutukunta_en,
  kuntaryhma_koodi,
  kuntaryhma_fi,
  kuntaryhma_sv,
  kuntaryhma_en
--*/
