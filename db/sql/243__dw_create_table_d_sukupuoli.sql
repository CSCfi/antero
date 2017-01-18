IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_sukupuoli') BEGIN

CREATE TABLE dw.d_sukupuoli(
  id int IDENTITY(1,1) NOT NULL,
  loadtime datetime NOT NULL,
  source varchar(100) NOT NULL,
  username varchar(30) NOT NULL,
  sukupuoli_koodi varchar(5) not null,
  sukupuoli_fi nvarchar(100) not null,
  sukupuoli_sv nvarchar(100) not null,
  sukupuoli_en nvarchar(100) not null,
 CONSTRAINT PK__d_sukupuoli PRIMARY KEY CLUSTERED (id ASC)
)
;
ALTER TABLE dw.d_sukupuoli ADD  CONSTRAINT DF__d_sukupuoli__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dw.d_sukupuoli ADD  CONSTRAINT DF__d_sukupuoli__username  DEFAULT (suser_sname()) FOR username
;
END
