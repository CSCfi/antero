if not exists (select * from sys.objects where object_id = object_id('dbo.d_yo') and type in ('u'))
begin
create table dbo.d_yo(
	id bigint identity(-1,1) not null,
	yo_tunnus varchar(5) not null,
	yo_nimi_fi varchar(100) not null,
	yo_nimi_sv varchar(100) not null,
	yo_nimi_en varchar(100) not null,
	loadtime datetime not null,
	source varchar(100) not null,
	username varchar(30) not null,
 constraint pk_d_yo primary key clustered 
(
	id asc
)with (pad_index = off, statistics_norecompute = off, ignore_dup_key = off, allow_row_locks = on, allow_page_locks = on)
)
end

if not exists (select * from sys.objects where object_id = object_id('dbo.df__d_yo__loadtime__0ec32c7a') and type = 'd')
begin
alter table dbo.d_yo add  default (getdate()) for loadtime
end

if not exists (select * from sys.objects where object_id = object_id('dbo.df__d_yo__username__0fb750b3') and type = 'd')
begin
alter table dbo.d_yo add  default (suser_sname()) for username
end