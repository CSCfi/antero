USE [ANTERO]
GO
/****** Object:  Table [dw].[d_amos_luvaton_korotustekija]    Script Date: 21.8.2020 10:58:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_amos_luvaton_korotustekija]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_amos_luvaton_korotustekija](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [int] NULL,
	[selite_fi] [varchar](255) NULL,
	[selite_sv] [varchar](255) NULL,
	[selite_en] [varchar](255) NULL,
	[jarjestys] [varchar](255) NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_amos_luvaton_korotustekija__3213E83FFE0FF408] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[d_amos_luvaton_koulutus]    Script Date: 21.8.2020 10:58:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_amos_luvaton_koulutus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_amos_luvaton_koulutus](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [int] NULL,
	[selite_fi] [varchar](255) NULL,
	[selite_sv] [varchar](255) NULL,
	[selite_en] [varchar](255) NULL,
	[jarjestys] [varchar](255) NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_amos_luvaton_koulutus__3213E83FFE0FF408] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[d_amos_luvaton_majoitus]    Script Date: 21.8.2020 10:58:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_amos_luvaton_majoitus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[d_amos_luvaton_majoitus](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[koodi] [int] NULL,
	[selite_fi] [varchar](255) NULL,
	[selite_sv] [varchar](255) NULL,
	[selite_en] [varchar](255) NULL,
	[jarjestys] [varchar](255) NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL,
 CONSTRAINT [PK__d_amos_luvaton_majoitus__3213E83FFE0FF408] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_amos_luvaton_korotustekija_loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_amos_luvaton_korotustekija] ADD  CONSTRAINT [DF_d_amos_luvaton_korotustekija_loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_amos_luvaton_korotustekija_username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_amos_luvaton_korotustekija] ADD  CONSTRAINT [DF_d_amos_luvaton_korotustekija_username]  DEFAULT (suser_sname()) FOR [username]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_amos_luvaton_koulutus_loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_amos_luvaton_koulutus] ADD  CONSTRAINT [DF_d_amos_luvaton_koulutus_loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_amos_luvaton_koulutus_username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_amos_luvaton_koulutus] ADD  CONSTRAINT [DF_d_amos_luvaton_koulutus_username]  DEFAULT (suser_sname()) FOR [username]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_amos_luvaton_majoitus_loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_amos_luvaton_majoitus] ADD  CONSTRAINT [DF_d_amos_luvaton_majoitus_loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF_d_amos_luvaton_majoitus_username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[d_amos_luvaton_majoitus] ADD  CONSTRAINT [DF_d_amos_luvaton_majoitus_username]  DEFAULT (suser_sname()) FOR [username]
END

GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_amos_luvaton_korotustekija]    Script Date: 21.8.2020 10:58:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_amos_luvaton_korotustekija]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_amos_luvaton_korotustekija] AS' 
END
GO


ALTER PROCEDURE [dw].[p_lataa_d_amos_luvaton_korotustekija] AS

TRUNCATE TABLE dw.d_amos_luvaton_korotustekija

IF NOT EXISTS (select * from dw.d_amos_luvaton_korotustekija where id=-1) 
begin
	set identity_insert dw.d_amos_luvaton_korotustekija on;
	insert into dw.d_amos_luvaton_korotustekija (
		id,
		koodi,
		selite_fi,
		selite_sv,
		selite_en,
		jarjestys,
		source
	)
	select
		-1,
		koodi,
		nimi,
		nimi_sv,
		nimi_en,
		99,
		source
	from sa.sa_koodistot
	where koodisto='vipunenmeta'
	and koodi='-1'
end

else begin
	update d
	set
		koodi = s.koodi,
		selite_fi = s.nimi,
		selite_sv = s.nimi_sv,
		selite_en = s.nimi_en,
		jarjestys = 99,
		d.source=s.source
	from dw.d_amos_luvaton_korotustekija d
	join sa.sa_koodistot s on s.koodi=d.koodi
	where s.koodisto='vipunenmeta'
	and s.koodi='-1'

end
set identity_insert dw.d_amos_luvaton_korotustekija off;

INSERT dw.d_amos_luvaton_korotustekija (koodi, selite_fi, selite_sv, selite_en, jarjestys, source)
VALUES 
('1','Ei luvaton, hyväksytty','SV*','EN*',1,'manuaalinen'),
('2','Työvoimakoulutus','SV*','EN*',2,'manuaalinen'),
('3','Vankilaopetus','SV*','EN*',3,'manuaalinen'),
('4','Vaativa erityinen tuki','SV*','EN*',4,'manuaalinen'),
('10','Vaativa erityinen tuki, tutkinto','SV*','EN*',10,'manuaalinen'),
('11','Vaativa erityinen tuki, tutkinnon osa','SV*','EN*',11,'manuaalinen'),
('12','Vaativa erityinen tuki, tutkinto ja tutkinnon osa','SV*','EN*',12,'manuaalinen')






GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_amos_luvaton_koulutus]    Script Date: 21.8.2020 10:58:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_amos_luvaton_koulutus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_amos_luvaton_koulutus] AS' 
END
GO


ALTER PROCEDURE [dw].[p_lataa_d_amos_luvaton_koulutus] AS

TRUNCATE TABLE dw.d_amos_luvaton_koulutus

IF NOT EXISTS (select * from dw.d_amos_luvaton_koulutus where id=-1) 
begin
	set identity_insert dw.d_amos_luvaton_koulutus on;
	insert into dw.d_amos_luvaton_koulutus (
		id,
		koodi,
		selite_fi,
		selite_sv,
		selite_en,
		jarjestys,
		source
	)
	select
		-1,
		koodi,
		nimi,
		nimi_sv,
		nimi_en,
		99,
		source
	from sa.sa_koodistot
	where koodisto='vipunenmeta'
	and koodi='-1'
end

else begin
	update d
	set
		koodi = s.koodi,
		selite_fi = s.nimi,
		selite_sv = s.nimi_sv,
		selite_en = s.nimi_en,
		jarjestys = 99,
		d.source=s.source
	from dw.d_amos_luvaton_koulutus d
	join sa.sa_koodistot s on s.koodi=d.koodi
	where s.koodisto='vipunenmeta'
	and s.koodi='-1'

end
set identity_insert dw.d_amos_luvaton_koulutus off;

INSERT dw.d_amos_luvaton_koulutus (koodi, selite_fi, selite_sv, selite_en, jarjestys, source)
VALUES 
('1','Ei luvaton, hyväksytty','SV*','EN*',1,'manuaalinen'),
('2','Tutkintokoulutus (ei oppis)','SV*','EN*',2,'manuaalinen'),
('3','Tutkintokoulutus (oppis)','SV*','EN*',3,'manuaalinen'),
('4','Täydentävä ja syventävä (ei oppis)','SV*','EN*',4,'manuaalinen'),
('5','Täydentävä ja syventävä (oppis)','SV*','EN*',5,'manuaalinen'),
('6','Tehtävään valmistava (ei oppis)','SV*','EN*',6,'manuaalinen'),
('7','Tehtävään valmistava (oppis)','SV*','EN*',7,'manuaalinen'),
('8','VALMA-koulutus','SV*','EN*',8,'manuaalinen'),
('9','TELMA-koulutus','SV*','EN*',9,'manuaalinen'),
('20','Tutkinto (ei oppis)','SV*','EN*',20,'manuaalinen'),
('21','Tutkinto (oppis)','SV*','EN*',21,'manuaalinen'),
('22','Tutkinnon osa (ei oppis)','SV*','EN*',22,'manuaalinen'),
('23','Tutkinnon osa (oppis)','SV*','EN*',23,'manuaalinen'),
('24','Tutkinto ja tutkinnon osa (ei oppis)','SV*','EN*',24,'manuaalinen'),
('25','Tutkinto ja tutkinnon osa (oppis)','SV*','EN*',25,'manuaalinen')





GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_amos_luvaton_majoitus]    Script Date: 21.8.2020 10:58:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_amos_luvaton_majoitus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_amos_luvaton_majoitus] AS' 
END
GO



ALTER PROCEDURE [dw].[p_lataa_d_amos_luvaton_majoitus] AS

TRUNCATE TABLE dw.d_amos_luvaton_majoitus

IF NOT EXISTS (select * from dw.d_amos_luvaton_majoitus where id=-1) 
begin
	set identity_insert dw.d_amos_luvaton_majoitus on;
	insert into dw.d_amos_luvaton_majoitus (
		id,
		koodi,
		selite_fi,
		selite_sv,
		selite_en,
		jarjestys,
		source
	)
	select
		-1,
		koodi,
		nimi,
		nimi_sv,
		nimi_en,
		99,
		source
	from sa.sa_koodistot
	where koodisto='vipunenmeta'
	and koodi='-1'
end

else begin
	update d
	set
		koodi = s.koodi,
		selite_fi = s.nimi,
		selite_sv = s.nimi_sv,
		selite_en = s.nimi_en,
		jarjestys = 99,
		d.source=s.source
	from dw.d_amos_luvaton_majoitus d
	join sa.sa_koodistot s on s.koodi=d.koodi
	where s.koodisto='vipunenmeta'
	and s.koodi='-1'

end
set identity_insert dw.d_amos_luvaton_majoitus off;

INSERT dw.d_amos_luvaton_majoitus (koodi, selite_fi, selite_sv, selite_en, jarjestys, source)
VALUES 
('1','Ei luvaton, hyväksytty','SV*','EN*',1,'manuaalinen'),
('2','Sisäoppilaitosmajoitus','SV*','EN*',2,'manuaalinen')

