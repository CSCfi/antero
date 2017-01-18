if not exists (select * from INFORMATION_SCHEMA.SCHEMATA where SCHEMA_NAME='sa') begin
  EXEC dbo.sp_executesql @statement = N'create schema sa';
end
