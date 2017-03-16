IF NOT EXISTS (
select * from INFORMATION_SCHEMA.COLUMNS
where TABLE_SCHEMA='dw' and TABLE_NAME='d_koulutusluokitus'
and COLUMN_NAME='koulutussektori_koodi' --+ fi,sv,en
) BEGIN

ALTER TABLE dw.d_koulutusluokitus ADD
  koulutussektori_koodi varchar(2) NULL,
  koulutussektori_fi nvarchar(60) NULL,
  koulutussektori_sv nvarchar(60) NULL,
  koulutussektori_en nvarchar(60) NULL

END
/* revert
ALTER TABLE dw.d_koulutusluokitus DROP COLUMN
  koulutussektori_koodi,
  koulutussektori_fi,
  koulutussektori_sv,
  koulutussektori_en
--*/


-- for figuring out values for koulutussektori: tutkintotyyppi
IF NOT EXISTS (
select * from INFORMATION_SCHEMA.COLUMNS
where TABLE_SCHEMA='dw' and TABLE_NAME='d_koulutusluokitus'
and COLUMN_NAME='tutkintotyyppi_koodi' --+ fi,sv,en
) BEGIN

ALTER TABLE dw.d_koulutusluokitus ADD
  tutkintotyyppi_koodi varchar(2) NULL,
  tutkintotyyppi_fi nvarchar(60) NULL,
  tutkintotyyppi_sv nvarchar(60) NULL,
  tutkintotyyppi_en nvarchar(60) NULL

END
/* revert
ALTER TABLE dw.d_koulutusluokitus DROP COLUMN
  tutkintotyyppi_koodi,
  tutkintotyyppi_fi,
  tutkintotyyppi_sv,
  tutkintotyyppi_en
--*/
