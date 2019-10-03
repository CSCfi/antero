IF NOT EXISTS (select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA='dbo' and TABLE_NAME='tabularprocessing') BEGIN

CREATE TABLE dbo.tabularprocessing(
  id int IDENTITY(1,1) NOT NULL,
  loadtime datetime NOT NULL,
  username varchar(30) NOT NULL,

  build int NULL, --jenkins build number for meta info, not mandatory
  
  gitcommit varchar(50) NOT NULL,
  ready bit NOT NULL,
 CONSTRAINT PK__tabularprocessing PRIMARY KEY CLUSTERED (id ASC)
)
;
ALTER TABLE dbo.tabularprocessing ADD  CONSTRAINT DF__tabularprocessing__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE dbo.tabularprocessing ADD  CONSTRAINT DF__tabularprocessing__username  DEFAULT (suser_name()) FOR username
;

ALTER TABLE dbo.tabularprocessing ADD  CONSTRAINT DF__tabularprocessing__gitcommit DEFAULT ('HEAD') FOR gitcommit
;
ALTER TABLE dbo.tabularprocessing ADD  CONSTRAINT DF__tabularprocessing__ready  DEFAULT (0) FOR ready
;

END
