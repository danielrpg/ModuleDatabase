print 'insert data into the program_sso_resource table';
if(select count(*) from dbo.program_sso_resource)=0
begin
	set identity_insert dbo.program_sso_resource on;
	INSERT INTO dbo.program_sso_resource (sso_resource_id, created_on, updated_on, sso_resource_cost, sso_resource_detail, sso_detail_id) VALUES (1, '2018-05-27 23:56:44', null, 200, 'Hojas tamaño carta', 1);
	INSERT INTO dbo.program_sso_resource (sso_resource_id, created_on, updated_on, sso_resource_cost, sso_resource_detail, sso_detail_id) VALUES (2, '2018-05-27 23:56:44', null, 300, 'Pliegos de cartulina', 2);
	INSERT INTO dbo.program_sso_resource (sso_resource_id, created_on, updated_on, sso_resource_cost, sso_resource_detail, sso_detail_id) VALUES (3, '2018-05-27 23:56:44', null, 100, 'Marcadores', 3);
	INSERT INTO dbo.program_sso_resource (sso_resource_id, created_on, updated_on, sso_resource_cost, sso_resource_detail, sso_detail_id) VALUES (4, '2018-05-27 23:56:44', null, 200, 'Pliegos de cartulina', 3);
	set identity_insert dbo.program_sso_resource off;
	print 'program_sso_resource done';
end
