if not exists (select * from sys.objects where object_id = object_id('dw.f_yo_talous') and type in ('u'))
begin
create table dw.f_yo_talous(
	id int identity(1,1) not null,
	d_yo_id int not null,
	d_opintoala95_id int not null,
	d_tili_id int not null,
	d_aineistotyyppi_id int not null,
	d_toiminto_id int not null,
	d_ohjauksenala_id int not null,
	konserni char(1) not null,
	tilikausi int not null,
	arvo bigint null,
	loadtime datetime not null,
	source varchar(100) not null,
	username varchar(30) not null
)
end

if not exists (select * from sys.objects where object_id = object_id('dw.df__f_yo_talo__loadt__48bac3e5') and type = 'd')
begin
alter table dw.f_yo_talous add  constraint df__f_yo_talo__loadt__48bac3e5  default (getdate()) for loadtime
end

if not exists (select * from sys.objects where object_id = object_id('dw.df__f_yo_talo__usern__49aee81e') and type = 'd')
begin
alter table dw.f_yo_talous add  constraint df__f_yo_talo__usern__49aee81e  default (suser_sname()) for username
end