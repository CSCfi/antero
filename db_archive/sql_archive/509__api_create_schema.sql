if not exists (select * from INFORMATION_SCHEMA.SCHEMATA where SCHEMA_NAME='api') begin
  EXEC dbo.sp_executesql @statement = N'create schema api';
end
