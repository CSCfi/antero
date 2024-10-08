USE [ANTERO]
IF EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_eter_students')
BEGIN
	DROP TABLE [sa].[sa_eter_students];
END

IF  NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_eter_students')
BEGIN


CREATE TABLE [sa].[sa_eter_students](
	[_id] [varchar](24) NOT NULL,
	[STUD.LOWDEG.v] [varchar](2) NULL,
	[STUD.LOWDEG.code] [varchar](2) NULL,
	[STUD.ISCED5MEN.code] [varchar](2) NULL,
	[STUD.ISCED5MEN.v] [varchar](13) NULL,
	[STUD.FLAGISCED5GEN.v] [varchar](2) NULL,
	[STUD.FLAGISCED5GEN.r] [varchar](2) NULL,
	[STUD.ISCED5FOR.code] [varchar](2) NULL,
	[STUD.ISCED5FOR.v] [varchar](13) NULL,
	[STUD.ISCED5RES.code] [varchar](2) NULL,
	[STUD.ISCED5RES.v] [varchar](14) NULL,
	[STUD.ISCED5MOBUNCL.code] [varchar](2) NULL,
	[STUD.ISCED5MOBUNCL.v] [varchar](3) NULL,
	[STUD.ISCED5FOE01.code] [varchar](2) NULL,
	[STUD.ISCED5FOE01.v] [varchar](13) NULL,
	[STUD.ISCED5FOE03.code] [varchar](2) NULL,
	[STUD.ISCED5FOE03.v] [varchar](13) NULL,
	[STUD.ISCED5FOE06.code] [varchar](2) NULL,
	[STUD.ISCED5FOE06.v] [varchar](12) NULL,
	[STUD.ISCED5FOE08.code] [varchar](2) NULL,
	[STUD.ISCED5FOE08.v] [varchar](12) NULL,
	[STUD.ISCED5FOEUNCL.code] [varchar](2) NULL,
	[STUD.ISCED5FOEUNCL.v] [varchar](5) NULL,
	[STUD.ISCED5TOTAL.code] [varchar](2) NULL,
	[STUD.ISCED5TOTAL.v] [varchar](14) NULL,
	[STUD.ISCED6MEN.v] [varchar](15) NULL,
	[STUD.ISCED6MEN.code] [varchar](2) NULL,
	[STUD.ISCED6GENUNCL.v] [varchar](3) NULL,
	[STUD.ISCED6GENUNCL.code] [varchar](2) NULL,
	[STUD.ISCED6FOR.code] [varchar](2) NULL,
	[STUD.ISCED6FOR.v] [varchar](15) NULL,
	[STUD.FLAGISCED6CITIZ.v] [varchar](5) NULL,
	[STUD.FLAGISCED6CITIZ.r] [varchar](2) NULL,
	[STUD.ISCED6MOBUNCL.code] [varchar](2) NULL,
	[STUD.ISCED6MOBUNCL.v] [varchar](4) NULL,
	[STUD.ISCED6FOE00.v] [varchar](3) NULL,
	[STUD.ISCED6FOE00.code] [varchar](2) NULL,
	[STUD.ISCED5GENUNCL.code] [varchar](2) NULL,
	[STUD.ISCED5GENUNCL.v] [varchar](3) NULL,
	[STUD.FLAGISCED5CITIZ.v] [varchar](2) NULL,
	[STUD.FLAGISCED5CITIZ.r] [varchar](2) NULL,
	[STUD.ISCED5FOE00.code] [varchar](2) NULL,
	[STUD.ISCED5FOE00.v] [varchar](12) NULL,
	[STUD.ISCED5FOE05.code] [varchar](2) NULL,
	[STUD.ISCED5FOE05.v] [varchar](13) NULL,
	[STUD.ISCED5FOE10.code] [varchar](2) NULL,
	[STUD.ISCED5FOE10.v] [varchar](12) NULL,
	[STUD.NOTESISCED5] [varchar](131) NULL,
	[STUD.ISCED6NAT.code] [varchar](2) NULL,
	[STUD.ISCED6NAT.v] [varchar](15) NULL,
	[STUD.ISCED6MOB.code] [varchar](2) NULL,
	[STUD.ISCED6MOB.v] [varchar](15) NULL,
	[STUD.HIGHDEG.v] [varchar](2) NULL,
	[STUD.HIGHDEG.code] [varchar](2) NULL,
	[STUD.ISCED5NAT.code] [varchar](2) NULL,
	[STUD.ISCED5NAT.v] [varchar](13) NULL,
	[STUD.ISCED5MOB.code] [varchar](2) NULL,
	[STUD.ISCED5MOB.v] [varchar](12) NULL,
	[STUD.ISCED5FOE02.code] [varchar](2) NULL,
	[STUD.ISCED5FOE02.v] [varchar](13) NULL,
	[STUD.ISCED5FOE07.code] [varchar](2) NULL,
	[STUD.ISCED5FOE07.v] [varchar](12) NULL,
	[STUD.FLAGISCED5FOE.v] [varchar](2) NULL,
	[STUD.FLAGISCED5FOE.r] [varchar](2) NULL,
	[STUD.ISCED6WOMEN.v] [varchar](15) NULL,
	[STUD.ISCED6WOMEN.code] [varchar](2) NULL,
	[STUD.ISCED6CITUNCL.code] [varchar](2) NULL,
	[STUD.ISCED6CITUNCL.v] [varchar](5) NULL,
	[STUD.FLAGISCED6MOB.v] [varchar](5) NULL,
	[STUD.FLAGISCED6MOB.r] [varchar](2) NULL,
	[STUD.ISCED6FOE02.v] [varchar](15) NULL,
	[STUD.ISCED6FOE02.code] [varchar](2) NULL,
	[STUD.ISCED6FOE03.v] [varchar](15) NULL,
	[STUD.ISCED6FOE03.code] [varchar](2) NULL,
	[STUD.ISCED6FOE04.v] [varchar](14) NULL,
	[STUD.ISCED6FOE04.code] [varchar](2) NULL,
	[STUD.ISCED6FOE05.v] [varchar](14) NULL,
	[STUD.ISCED6FOE05.code] [varchar](2) NULL,
	[STUD.ISCED6FOE07.v] [varchar](15) NULL,
	[STUD.ISCED6FOE07.code] [varchar](2) NULL,
	[STUD.ISCED6FOE08.v] [varchar](14) NULL,
	[STUD.ISCED6FOE08.code] [varchar](2) NULL,
	[STUD.ISCED6FOE09.v] [varchar](14) NULL,
	[STUD.ISCED6FOE09.code] [varchar](2) NULL,
	[STUD.FLAGISCED6FOE.v] [varchar](5) NULL,
	[STUD.FLAGISCED6FOE.r] [varchar](2) NULL,
	[STUD.ISCED6FOE10.v] [varchar](13) NULL,
	[STUD.ISCED6FOE10.code] [varchar](2) NULL,
	[STUD.ISCED6TOTAL.v] [varchar](15) NULL,
	[STUD.ISCED6TOTAL.code] [varchar](2) NULL,
	[STUD.FLAGISCED6TOTAL.v] [varchar](6) NULL,
	[STUD.FLAGISCED6TOTAL.r] [varchar](2) NULL,
	[STUD.NOTESISCED6] [varchar](319) NULL,
	[STUD.ISCED7WOMEN.v] [varchar](15) NULL,
	[STUD.ISCED7WOMEN.code] [varchar](2) NULL,
	[STUD.ISCED7GENUNCL.v] [varchar](4) NULL,
	[STUD.ISCED7GENUNCL.code] [varchar](2) NULL,
	[STUD.FLAGISCED7GEN.v] [varchar](5) NULL,
	[STUD.FLAGISCED7GEN.r] [varchar](2) NULL,
	[STUD.ISCED7NAT.code] [varchar](2) NULL,
	[STUD.ISCED7NAT.v] [varchar](14) NULL,
	[STUD.ISCED7CITUNCL.code] [varchar](2) NULL,
	[STUD.ISCED7CITUNCL.v] [varchar](4) NULL,
	[STUD.FLAGISCED7CITIZ.v] [varchar](5) NULL,
	[STUD.FLAGISCED7CITIZ.r] [varchar](2) NULL,
	[STUD.ISCED7RES.code] [varchar](2) NULL,
	[STUD.ISCED7RES.v] [varchar](14) NULL,
	[STUD.ISCED7MOB.code] [varchar](2) NULL,
	[STUD.ISCED7MOB.v] [varchar](14) NULL,
	[STUD.FLAGISCED7MOB.v] [varchar](5) NULL,
	[STUD.FLAGISCED7MOB.r] [varchar](2) NULL,
	[STUD.ISCED7FOE00.v] [varchar](13) NULL,
	[STUD.ISCED7FOE00.code] [varchar](2) NULL,
	[STUD.ISCED7FOE01.v] [varchar](14) NULL,
	[STUD.ISCED7FOE01.code] [varchar](2) NULL,
	[STUD.ISCED7FOE02.v] [varchar](14) NULL,
	[STUD.ISCED7FOE02.code] [varchar](2) NULL,
	[STUD.ISCED7FOE04.v] [varchar](14) NULL,
	[STUD.ISCED7FOE04.code] [varchar](2) NULL,
	[STUD.ISCED7FOE05.v] [varchar](14) NULL,
	[STUD.ISCED7FOE05.code] [varchar](2) NULL,
	[STUD.ISCED7FOE06.v] [varchar](14) NULL,
	[STUD.ISCED7FOE06.code] [varchar](2) NULL,
	[STUD.ISCED7FOE07.v] [varchar](14) NULL,
	[STUD.ISCED7FOE07.code] [varchar](2) NULL,
	[STUD.ISCED7FOE09.v] [varchar](14) NULL,
	[STUD.ISCED7FOE09.code] [varchar](2) NULL,
	[STUD.ISCED7FOE10.v] [varchar](13) NULL,
	[STUD.ISCED7FOE10.code] [varchar](2) NULL,
	[STUD.ISCED7FOEUNCL.v] [varchar](4) NULL,
	[STUD.ISCED7FOEUNCL.code] [varchar](2) NULL,
	[STUD.FLAGISCED7FOE.v] [varchar](5) NULL,
	[STUD.FLAGISCED7FOE.r] [varchar](2) NULL,
	[STUD.FLAGISCED7TOTAL.v] [varchar](8) NULL,
	[STUD.FLAGISCED7TOTAL.r] [varchar](2) NULL,
	[STUD.NOTESISCED7] [varchar](304) NULL,
	[STUD.ISCED7LONGMEN.code] [varchar](2) NULL,
	[STUD.ISCED7LONGMEN.v] [varchar](14) NULL,
	[STUD.ISCED7LONGWOMEN.code] [varchar](2) NULL,
	[STUD.ISCED7LONGWOMEN.v] [varchar](15) NULL,
	[STUD.FLAGISCED7LONGGEN.v] [varchar](2) NULL,
	[STUD.FLAGISCED7LONGGEN.r] [varchar](2) NULL,
	[STUD.ISCED7LONGFOR.code] [varchar](2) NULL,
	[STUD.ISCED7LONGFOR.v] [varchar](14) NULL,
	[STUD.ISCED7LONGCITUNCL.code] [varchar](2) NULL,
	[STUD.ISCED7LONGCITUNCL.v] [varchar](4) NULL,
	[STUD.ISCED7LONGRES.code] [varchar](2) NULL,
	[STUD.ISCED7LONGRES.v] [varchar](15) NULL,
	[STUD.ISCED7LONGMOBUNCL.code] [varchar](2) NULL,
	[STUD.ISCED7LONGMOBUNCL.v] [varchar](4) NULL,
	[STUD.FLAGISCED7LONGMOB.v] [varchar](5) NULL,
	[STUD.FLAGISCED7LONGMOB.r] [varchar](2) NULL,
	[STUD.ISCED7LONGFOE01.code] [varchar](2) NULL,
	[STUD.ISCED7LONGFOE01.v] [varchar](14) NULL,
	[STUD.ISCED7LONGFOE03.code] [varchar](2) NULL,
	[STUD.ISCED7LONGFOE03.v] [varchar](14) NULL,
	[STUD.ISCED5WOMEN.code] [varchar](2) NULL,
	[STUD.ISCED5WOMEN.v] [varchar](13) NULL,
	[STUD.ISCED7LONGFOE04.code] [varchar](2) NULL,
	[STUD.ISCED7LONGFOE04.v] [varchar](14) NULL,
	[STUD.ISCED7LONGFOE06.code] [varchar](2) NULL,
	[STUD.ISCED7LONGFOE06.v] [varchar](13) NULL,
	[STUD.ISCED5CITUNCL.code] [varchar](2) NULL,
	[STUD.ISCED5CITUNCL.v] [varchar](5) NULL,
	[STUD.FLAGISCED5MOB.v] [varchar](2) NULL,
	[STUD.FLAGISCED5MOB.r] [varchar](2) NULL,
	[STUD.ISCED7LONGNAT.code] [varchar](2) NULL,
	[STUD.ISCED7LONGNAT.v] [varchar](15) NULL,
	[STUD.ISCED5FOE04.code] [varchar](2) NULL,
	[STUD.ISCED5FOE04.v] [varchar](13) NULL,
	[STUD.ISCED7LONGMOB.code] [varchar](2) NULL,
	[STUD.ISCED7LONGMOB.v] [varchar](14) NULL,
	[STUD.ISCED5FOE09.code] [varchar](2) NULL,
	[STUD.ISCED5FOE09.v] [varchar](13) NULL,
	[STUD.ISCED7LONGFOE02.code] [varchar](2) NULL,
	[STUD.ISCED7LONGFOE02.v] [varchar](14) NULL,
	[STUD.FLAGISCED5TOTAL.v] [varchar](6) NULL,
	[STUD.FLAGISCED5TOTAL.r] [varchar](2) NULL,
	[STUD.FLAGISCED6GEN.v] [varchar](5) NULL,
	[STUD.FLAGISCED6GEN.r] [varchar](2) NULL,
	[STUD.ISCED7LONGFOE07.code] [varchar](2) NULL,
	[STUD.ISCED7LONGFOE07.v] [varchar](14) NULL,
	[STUD.ISCED6RES.code] [varchar](2) NULL,
	[STUD.ISCED6RES.v] [varchar](15) NULL,
	[STUD.ISCED6FOE01.v] [varchar](14) NULL,
	[STUD.ISCED6FOE01.code] [varchar](2) NULL,
	[STUD.ISCED7LONGFOE08.code] [varchar](2) NULL,
	[STUD.ISCED7LONGFOE08.v] [varchar](14) NULL,
	[STUD.ISCED6FOE06.v] [varchar](14) NULL,
	[STUD.ISCED6FOE06.code] [varchar](2) NULL,
	[STUD.ISCED6FOEUNCL.v] [varchar](5) NULL,
	[STUD.ISCED6FOEUNCL.code] [varchar](2) NULL,
	[STUD.ISCED7LONGFOE09.code] [varchar](2) NULL,
	[STUD.ISCED7LONGFOE09.v] [varchar](14) NULL,
	[STUD.ISCED7LONGFOEUNCL.code] [varchar](2) NULL,
	[STUD.ISCED7LONGFOEUNCL.v] [varchar](11) NULL,
	[STUD.ISCED7MEN.v] [varchar](14) NULL,
	[STUD.ISCED7MEN.code] [varchar](2) NULL,
	[STUD.ISCED7FOR.code] [varchar](2) NULL,
	[STUD.ISCED7FOR.v] [varchar](14) NULL,
	[STUD.FLAGISCED7LONGFOE.v] [varchar](5) NULL,
	[STUD.FLAGISCED7LONGFOE.r] [varchar](2) NULL,
	[STUD.ISCED7MOBUNCL.code] [varchar](2) NULL,
	[STUD.ISCED7MOBUNCL.v] [varchar](4) NULL,
	[STUD.ISCED7FOE03.v] [varchar](14) NULL,
	[STUD.ISCED7FOE03.code] [varchar](2) NULL,
	[STUD.ISCED7FOE08.v] [varchar](14) NULL,
	[STUD.ISCED7FOE08.code] [varchar](2) NULL,
	[STUD.ISCED7LONGTOTAL.code] [varchar](2) NULL,
	[STUD.ISCED7LONGTOTAL.v] [varchar](15) NULL,
	[STUD.ISCED7TOTAL.v] [varchar](15) NULL,
	[STUD.ISCED7TOTAL.code] [varchar](2) NULL,
	[STUD.FLAGISCED7LONGTOTAL.v] [varchar](6) NULL,
	[STUD.FLAGISCED7LONGTOTAL.r] [varchar](2) NULL,
	[STUD.ISCED7LONGGENUNCL.code] [varchar](2) NULL,
	[STUD.ISCED7LONGGENUNCL.v] [varchar](2) NULL,
	[STUD.FLAGISCED7LONGCITIZ.v] [varchar](5) NULL,
	[STUD.FLAGISCED7LONGCITIZ.r] [varchar](2) NULL,
	[STUD.ISCED7LONGFOE00.code] [varchar](2) NULL,
	[STUD.ISCED7LONGFOE00.v] [varchar](14) NULL,
	[STUD.ISCED7LONGFOE05.code] [varchar](2) NULL,
	[STUD.ISCED7LONGFOE05.v] [varchar](13) NULL,
	[STUD.ISCED7LONGFOE10.code] [varchar](2) NULL,
	[STUD.ISCED7LONGFOE10.v] [varchar](4) NULL,
	[STUD.NOTESISCED7LONG] [varchar](135) NULL,
	[STUD.TOTALISCED5_7.v] [varchar](15) NULL,
	[STUD.TOTALISCED5_7.code] [varchar](2) NULL,
	[STUD.FLAGTOTALISCED5_7.v] [varchar](5) NULL,
	[STUD.FLAGTOTALISCED5_7.r] [varchar](2) NULL,
	[STUD.NOTESDISTEDUINST] [varchar](222) NULL,
	[STUD.DISTEDUINST.v] [varchar](5) NULL,
	[STUD.DISTEDUINST.code] [varchar](2) NULL,
	[STUD.NOTESTOTALISCED5_7] [varchar](192) NULL,
	[STUD.ISCED5_7MEN.v] [varchar](15) NULL,
	[STUD.ISCED5_7MEN.code] [varchar](4) NULL,
	[STUD.ISCED5_7WOMEN.v] [varchar](15) NULL,
	[STUD.ISCED5_7WOMEN.code] [varchar](3) NULL,
	[STUD.ISCED5_7GENUNCL.v] [varchar](4) NULL,
	[STUD.ISCED5_7GENUNCL.code] [varchar](2) NULL,
	[STUD.FLAGISCED5_7GEN.v] [varchar](20) NULL,
	[STUD.FLAGISCED5_7GEN.r] [varchar](2) NULL,
	[STUD.ISCED5_7FOR.code] [varchar](2) NULL,
	[STUD.ISCED5_7FOR.v] [varchar](15) NULL,
	[STUD.ISCED5_7CITUNCL.code] [varchar](2) NULL,
	[STUD.ISCED5_7CITUNCL.v] [varchar](5) NULL,
	[STUD.FLAGISCED5_7CITIZ.v] [varchar](20) NULL,
	[STUD.FLAGISCED5_7CITIZ.r] [varchar](2) NULL,
	[STUD.ISCED5_7NAT.code] [varchar](2) NULL,
	[STUD.ISCED5_7NAT.v] [varchar](15) NULL,
	[STUD.FLAGISCED5_7MOB.v] [varchar](23) NULL,
	[STUD.FLAGISCED5_7MOB.r] [varchar](2) NULL,
	[STUD.ISCED5_7RES.code] [varchar](2) NULL,
	[STUD.ISCED5_7RES.v] [varchar](15) NULL,
	[STUD.ISCED5_7MOBUNCL.code] [varchar](2) NULL,
	[STUD.ISCED5_7MOBUNCL.v] [varchar](4) NULL,
	[STUD.ISCED5_7MOB.code] [varchar](2) NULL,
	[STUD.ISCED5_7MOB.v] [varchar](15) NULL,
	[STUD.ISCED5_7FOE00.v] [varchar](14) NULL,
	[STUD.ISCED5_7FOE00.code] [varchar](2) NULL,
	[STUD.ISCED5_7FOE01.v] [varchar](15) NULL,
	[STUD.ISCED5_7FOE01.code] [varchar](2) NULL,
	[STUD.ISCED5_7FOE03.v] [varchar](15) NULL,
	[STUD.ISCED5_7FOE03.code] [varchar](2) NULL,
	[STUD.ISCED5_7FOE02.v] [varchar](15) NULL,
	[STUD.ISCED5_7FOE02.code] [varchar](2) NULL,
	[STUD.ISCED5_7FOE04.v] [varchar](15) NULL,
	[STUD.ISCED5_7FOE04.code] [varchar](2) NULL,
	[STUD.ISCED5_7FOE05.v] [varchar](15) NULL,
	[STUD.ISCED5_7FOE05.code] [varchar](2) NULL,
	[STUD.ISCED5_7FOE06.v] [varchar](14) NULL,
	[STUD.ISCED5_7FOE06.code] [varchar](2) NULL,
	[STUD.ISCED5_7FOE07.v] [varchar](15) NULL,
	[STUD.ISCED5_7FOE07.code] [varchar](2) NULL,
	[STUD.ISCED5_7FOE09.v] [varchar](14) NULL,
	[STUD.ISCED5_7FOE09.code] [varchar](2) NULL,
	[STUD.ISCED5_7FOE08.v] [varchar](14) NULL,
	[STUD.ISCED5_7FOE08.code] [varchar](2) NULL,
	[STUD.FLAGISCED5_7FOE.v] [varchar](23) NULL,
	[STUD.FLAGISCED5_7FOE.r] [varchar](2) NULL,
	[STUD.ISCED5_7FOEUNCL.v] [varchar](11) NULL,
	[STUD.ISCED5_7FOEUNCL.code] [varchar](2) NULL,
	[STUD.ISCED5_7OEO10.v] [varchar](13) NULL,
	[STUD.ISCED5_7OEO10.code] [varchar](2) NULL,
	[STUD.SHAREWOMENISCED5-7.v] [varchar](19) NULL,
	[STUD.SHAREWOMENISCED5-7.code] [varchar](2) NULL,
	[STUD.FLAGSHAREWOMENISCED5-7.v] [varchar](20) NULL,
	[STUD.FLAGSHAREWOMENISCED5-7.r] [varchar](2) NULL,
	[STUD.SHAREFORISCED5-7.code] [varchar](2) NULL,
	[STUD.SHAREFORISCED5-7.v] [varchar](20) NULL,
	[STUD.FLAGSHAREFORISCED5-7.v] [varchar](20) NULL,
	[STUD.FLAGSHAREFORISCED5-7.r] [varchar](2) NULL,
	[STUD.SHAREMOBISCED5-7.code] [varchar](2) NULL,
	[STUD.SHAREMOBISCED5-7.v] [varchar](20) NULL,
	[STUD.FLAGSHAREMOBISCED5-7.v] [varchar](23) NULL,
	[STUD.FLAGSHAREMOBISCED5-7.r] [varchar](2) NULL,
	[username] [varchar](100) NULL,
	[Source] [varchar](100) NULL,
	[Loadtime] [datetime] NULL,
 CONSTRAINT [PK__sa_eter_students] PRIMARY KEY CLUSTERED
(
	[_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

ALTER TABLE [sa].[sa_eter_students] ADD  CONSTRAINT [DF__sa_eter_students]  DEFAULT (suser_name()) FOR [username]
GO

USE ANTERO