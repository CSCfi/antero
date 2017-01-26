IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_liikkuvuudensuunta') BEGIN

CREATE TABLE dw.d_liikkuvuudensuunta(
  id int IDENTITY(1,1) NOT NULL,
  loadtime datetime NOT NULL,
  source varchar(100) NOT NULL,
  username varchar(30) NOT NULL,
  liikkuvuudensuunta_koodi varchar(5) not null,
  liikkuvuudensuunta_fi nvarchar(100) not null,
  liikkuvuudensuunta_sv nvarchar(100) not null,
  liikkuvuudensuunta_en nvarchar(100) not null,
 CONSTRAINT PK__d_liikkuvuudensuunta PRIMARY KEY CLUSTERED (id ASC)
)
;
ALTER TABLE dw.d_liikkuvuudensuunta ADD  CONSTRAINT DF__d_liikkuvuudensuunta__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dw.d_liikkuvuudensuunta ADD  CONSTRAINT DF__d_liikkuvuudensuunta__username  DEFAULT (suser_sname()) FOR username
;
END
