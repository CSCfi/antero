use antero
go

alter table dw.d_koulutusluokitus
drop column jarjestys_okmohjauksenala_koodi
go

exec dw.p_lataa_d_koulutusluokitus
go

