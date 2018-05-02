USE ANTERO


ALTER TABLE sa.sa_hakukohteet ADD  CONSTRAINT DF__sa_hakuajat__latausaika  DEFAULT (getdate()) FOR latausaika
;
ALTER TABLE sa.sa_hakukohteet ADD  CONSTRAINT DF__sa_hakuajat__lataaja DEFAULT (suser_name()) FOR lataaja
;
