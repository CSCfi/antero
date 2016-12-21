IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dbo' and TABLE_NAME='d_avopkysymys') BEGIN

CREATE TABLE dbo.d_avopkysymys(
  id int IDENTITY(1,1) NOT NULL,
  loadtime datetime NOT NULL,
  source varchar(100) NOT NULL,
  username varchar(30) NOT NULL,

  kysymysryhmaid int not null,
  kysymysryhma_fi nvarchar(max) not null,
  kysymysryhma_sv nvarchar(max) null,
  kysymysryhma_en nvarchar(max) null,

  kysymysid int not null,
  kysymys_fi nvarchar(500) not null,
  kysymys_sv nvarchar(500) null,
  kysymys_en nvarchar(500) null,

  kysymysryhmajarjestys int null,
  kysymysjarjestys int null,

  rahoitusmallikysymys bit null,

 CONSTRAINT PK__d_avopkysymys PRIMARY KEY CLUSTERED (id ASC)
)
;

ALTER TABLE dbo.d_avopkysymys ADD  CONSTRAINT DF__d_avopkysymys__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dbo.d_avopkysymys ADD  CONSTRAINT DF__d_avopkysymys__username  DEFAULT (suser_sname()) FOR username
;

END
