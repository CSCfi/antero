IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dbo' and TABLE_NAME='tabulardeploy') BEGIN

CREATE TABLE dbo.tabulardeploy(
  id int IDENTITY(1,1) NOT NULL,
  loadtime datetime NOT NULL,
  username varchar(30) NOT NULL,

  build int NULL, --jenkins build number for meta info, not mandatory
  
  gitcommit varchar(50) NOT NULL,
  
  tabular varchar(max) NULL,
  ready bit NOT NULL,
 CONSTRAINT PK__tabulardeploy PRIMARY KEY CLUSTERED (id ASC)
)
;
ALTER TABLE dbo.tabulardeploy ADD  CONSTRAINT DF__tabulardeploy__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dbo.tabulardeploy ADD  CONSTRAINT DF__tabulardeploy__username  DEFAULT (suser_name()) FOR username
;

ALTER TABLE dbo.tabulardeploy ADD  CONSTRAINT DF__tabulardeploy__gitcommit DEFAULT ('HEAD') FOR gitcommit
;
ALTER TABLE dbo.tabulardeploy ADD  CONSTRAINT DF__tabulardeploy__ready  DEFAULT (0) FOR ready
;

END
