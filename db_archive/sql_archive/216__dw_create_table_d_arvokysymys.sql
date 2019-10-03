IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dw' and TABLE_NAME='d_arvokysymys') BEGIN

CREATE TABLE dw.d_arvokysymys(
  id int IDENTITY(1,1) NOT NULL,
  loadtime datetime NOT NULL,
  source varchar(100) NOT NULL,
  username varchar(30) NOT NULL,
  kysymysryhmaid int NOT NULL,
  kysymysryhma_fi nvarchar(max) NOT NULL,
  kysymysryhma_sv nvarchar(max) NULL,
  kysymysryhma_en nvarchar(max) NULL,
  kysymysid int NOT NULL,
  kysymys_fi nvarchar(500) NOT NULL,
  kysymys_sv nvarchar(500) NULL,
  kysymys_en nvarchar(500) NULL,
  kysymysryhmajarjestys int NULL,
  kysymysjarjestys int NULL,
  rahoitusmallikysymys bit NULL,
 CONSTRAINT PK__d_arvokysymys PRIMARY KEY CLUSTERED (id ASC)
)
;
ALTER TABLE dw.d_arvokysymys ADD  CONSTRAINT DF__d_arvokysymys__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dw.d_arvokysymys ADD  CONSTRAINT DF__d_arvokysymys__username  DEFAULT (suser_sname()) FOR username
;
END
