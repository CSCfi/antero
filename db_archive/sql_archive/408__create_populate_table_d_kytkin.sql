IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dw.d_kytkin') AND type in (N'U'))
BEGIN
CREATE TABLE dw.d_kytkin(
  id int IDENTITY(1,1) NOT NULL,
  loadtime datetime NOT NULL,
  source varchar(100) NOT NULL,
  username varchar(30) NOT NULL,
  kytkin_koodi nvarchar(10) NOT NULL,
  kytkin_fi nvarchar(100) NOT NULL,
  kytkin_sv nvarchar(100) NOT NULL,
  kytkin_en nvarchar(100) NOT NULL,
 CONSTRAINT PK__d_kytkin PRIMARY KEY (id)
)

ALTER TABLE dw.d_kytkin ADD  CONSTRAINT DF__d_kytkin__loadtime  DEFAULT (getdate()) FOR loadtime
ALTER TABLE dw.d_kytkin ADD  CONSTRAINT DF__d_kytkin__username  DEFAULT (suser_sname()) FOR username

INSERT INTO dw.d_kytkin (source,kytkin_koodi,kytkin_fi,kytkin_sv,kytkin_en)
VALUES
('ANTERO','1','Kyllä','Ja','Yes'),
('ANTERO','0','Ei','Nej','No')

set identity_insert dw.d_kytkin on;
insert into dw.d_kytkin (id,kytkin_koodi,kytkin_fi,kytkin_sv,kytkin_en,source)
select -1,koodi,nimi,nimi_sv,nimi_en,source
from sa.sa_koodistot
where koodisto='vipunenmeta' and koodi='-1'
;
set identity_insert dw.d_kytkin off;
END
