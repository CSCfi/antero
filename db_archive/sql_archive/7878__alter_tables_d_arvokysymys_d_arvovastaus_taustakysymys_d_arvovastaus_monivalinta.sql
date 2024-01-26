use antero
go

IF NOT EXISTS (
	SELECT * FROM sys.columns 
	WHERE object_id = OBJECT_ID(N'[dw].[d_arvokysymys]') 
	AND name = 'kysymysversio'
)
BEGIN
	alter table dw.d_arvokysymys
	add [kysymysversio] int not null default(1)
END

IF NOT EXISTS (
	SELECT * FROM sys.columns 
	WHERE object_id = OBJECT_ID(N'[dw].[d_arvovastaus_monivalinta]') 
	AND name = 'kysymysversio'
)
BEGIN
	alter table dw.d_arvovastaus_monivalinta
	add [kysymysversio] int not null default(1)
END

IF NOT EXISTS (
	SELECT * FROM sys.columns 
	WHERE object_id = OBJECT_ID(N'[dw].[d_arvovastaus_taustakysymys]') 
	AND name = 'kysymysversio'
)
BEGIN
	alter table dw.d_arvovastaus_taustakysymys
	add [kysymysversio] int not null default(1)
END