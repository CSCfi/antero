if not exists (select * from sys.objects where object_id = object_id('dw.p_lataa_f_yo_talous') and type in ('p', 'pc'))
begin
exec dbo.sp_executesql @statement = 'create procedure dw.p_lataa_f_yo_talous as' 
end