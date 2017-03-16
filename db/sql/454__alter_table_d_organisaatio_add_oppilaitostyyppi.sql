IF NOT EXISTS (
select * from INFORMATION_SCHEMA.COLUMNS
where TABLE_SCHEMA='dw' and TABLE_NAME='d_organisaatio'
and COLUMN_NAME='oppilaitostyyppi_koodi' --+ fi,sv,en
) BEGIN

ALTER TABLE dw.d_organisaatio ADD
  oppilaitostyyppi_koodi varchar(5) NULL,
  oppilaitostyyppi_fi nvarchar(120) NULL,
  oppilaitostyyppi_sv nvarchar(120) NULL,
  oppilaitostyyppi_en nvarchar(120) NULL

END
/* revert
ALTER TABLE dw.d_organisaatio DROP COLUMN
  oppilaitostyyppi_koodi,
  oppilaitostyyppi_fi,
  oppilaitostyyppi_sv,
  oppilaitostyyppi_en
--*/
