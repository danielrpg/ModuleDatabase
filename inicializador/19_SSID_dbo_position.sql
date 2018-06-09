print 'insert data into the position table';
if(select count(*) from dbo.position)=0
begin
	set identity_insert dbo.position on;
	INSERT INTO dbo.position (position_id, created_on, updated_on, position_description, position_level, position_name, parent_position_position_id) VALUES ( 2, '2018-05-27 23:56:43', '2018-05-27 23:56:43', 'Gerente general.', 0, 'Gerente general', null);
	INSERT INTO dbo.position (position_id, created_on, updated_on, position_description, position_level, position_name, parent_position_position_id) VALUES (11, '2018-05-27 23:56:43', '2018-05-27 23:56:43', 'Administrador de obra.', 1, 'Administrador de obra', 2);
	INSERT INTO dbo.position (position_id, created_on, updated_on, position_description, position_level, position_name, parent_position_position_id) VALUES (12, '2018-05-27 23:56:43', '2018-05-27 23:56:44', 'Operarios.', 2, 'Operarios', 11);
	INSERT INTO dbo.position (position_id, created_on, updated_on, position_description, position_level, position_name, parent_position_position_id) VALUES (13, '2018-05-27 23:56:43', '2018-05-27 23:56:43', 'Capataz.', 2, 'Capataz', 11);
	INSERT INTO dbo.position (position_id, created_on, updated_on, position_description, position_level, position_name, parent_position_position_id) VALUES (14, '2018-05-27 23:56:43', '2018-05-27 23:56:44', 'Vigilantes.', 2, 'Vigilantes', 11);
	INSERT INTO dbo.position (position_id, created_on, updated_on, position_description, position_level, position_name, parent_position_position_id) VALUES (15, '2018-05-27 23:56:43', '2018-05-27 23:56:43', 'Jefe de obras.', 2, 'Jefe de obras', 11);
	INSERT INTO dbo.position (position_id, created_on, updated_on, position_description, position_level, position_name, parent_position_position_id) VALUES (16, '2018-05-27 23:56:43', '2018-05-27 23:56:43', 'Bodeguero de obras.', 2, 'Bodeguero de obras', 11);
	INSERT INTO dbo.position (position_id, created_on, updated_on, position_description, position_level, position_name, parent_position_position_id) VALUES (60, '2018-05-27 23:56:44', '2018-05-27 23:56:44', 'Jefe de vivienda.', 1, 'Jefe de vivienda', 2);
	INSERT INTO dbo.position (position_id, created_on, updated_on, position_description, position_level, position_name, parent_position_position_id) VALUES (69, '2018-05-27 23:56:44', '2018-05-27 23:56:44', 'Asesor contable.', 1, 'Asesor contable', 2);
	INSERT INTO dbo.position (position_id, created_on, updated_on, position_description, position_level, position_name, parent_position_position_id) VALUES (79, '2018-05-27 23:56:44', '2018-05-27 23:56:44', 'Jefe de departamento técnico.', 1, 'Jefe de departamento técnico', 2);
	INSERT INTO dbo.position (position_id, created_on, updated_on, position_description, position_level, position_name, parent_position_position_id) VALUES (81, '2018-05-27 23:56:44', '2018-05-27 23:56:44', 'Jefe de administración.', 1, 'Jefe de administración', 2);
	INSERT INTO dbo.position (position_id, created_on, updated_on, position_description, position_level, position_name, parent_position_position_id) VALUES (82, '2018-05-27 23:56:44', '2018-05-27 23:56:44', 'Secretaria.', 2, 'Secretaria', 81);
	INSERT INTO dbo.position (position_id, created_on, updated_on, position_description, position_level, position_name, parent_position_position_id) VALUES (83, '2018-05-27 23:56:44', '2018-05-27 23:56:44', 'Mecánico.', 2, 'Mecánico', 81);
	INSERT INTO dbo.position (position_id, created_on, updated_on, position_description, position_level, position_name, parent_position_position_id) VALUES (84, '2018-05-27 23:56:44', '2018-05-27 23:56:44', 'Jefe de bodega.', 2, 'Jefe de bodega', 81);
	set identity_insert dbo.position off;
	print'position done';
end
