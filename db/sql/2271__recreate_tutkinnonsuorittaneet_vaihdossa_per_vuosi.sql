-- 24.5.2019 Tutkinnonsuorittaneetvaihdossapervuosi Virrasta lisätty vaihtovuosi
USE ANTERO
GO

IF EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_otp_tutkinnonsuorittaneetvaihdossapervuosi'
) BEGIN
DROP TABLE sa.sa_virta_otp_tutkinnonsuorittaneetvaihdossapervuosi
END


IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_virta_otp_tutkinnonsuorittaneetvaihdossapervuosi'
) BEGIN


CREATE TABLE sa.sa_virta_otp_tutkinnonsuorittaneetvaihdossapervuosi(

		id bigint IDENTITY(1,1) NOT NULL,
		
		ika smallint  NULL,
	    kohdemaakoodi nvarchar(20) NULL,
		lahtomaakoodi varchar(20) NULL,
		liikkuvuudenkesto int NULL,
		liikkuvuudenkestoalle3kklkm int  NULL,
		liikkuvuudenkestoyli3kklkm int NULL,
	    liikkuvuudensuuntakoodi nvarchar(20) NULL,
		liikkuvuudentyyppikoodi nvarchar(20) NULL,
	    liikkuvuusohjelmakoodi nvarchar(20)  NULL,
		ohjauksenalakoodi nvarchar(20) NULL,
	    opiskelijaavain nvarchar(100) NULL,
		opiskeluoikeudentyyppikoodi nvarchar(20)  NULL,
		oppilaitoskoodi nvarchar(20)  NULL,
		sukupuolikoodi nvarchar(20) NOT NULL,
	    tutkinnonsuorituspaivamaara bigint NULL,
		tutkinnonsuoritusvuosi int NULL,
	    tutkintokoodi nvarchar(20) NULL,
		vaihtovuosi int NULL,

		loadtime datetime2(4) NOT NULL,
		source nvarchar(255) NULL,
		username nvarchar(128) NOT NULL,

	CONSTRAINT PK_tutkinnonsuorittaneetvaihdossapervuosi PRIMARY KEY CLUSTERED (id ASC)
)
;

ALTER TABLE sa.sa_virta_otp_tutkinnonsuorittaneetvaihdossapervuosi ADD  CONSTRAINT DF__sa_virta_otp_tutkinnonsuorittaneetvaihdossapervuosi__loadtime  DEFAULT (getdate()) FOR loadtime
;
ALTER TABLE sa.sa_virta_otp_tutkinnonsuorittaneetvaihdossapervuosi ADD  CONSTRAINT DF__sa_virta_otp_tutkinnonsuorittaneetvaihdossapervuosi__username  DEFAULT (suser_name()) FOR username
;
END
