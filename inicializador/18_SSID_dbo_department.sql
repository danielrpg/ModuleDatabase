print 'insert data into the department table';
if(select count(*) from dbo.department)=0
begin
	set identity_insert dbo.department on;
	INSERT INTO dbo.department (department_id, created_on, updated_on, department_description, department_name) VALUES (1, '2018-05-27 23:56:43', null, 'El departamento de dirección general agrupa los cargos relacionados con gerencia.', 'Dirección General');
	INSERT INTO dbo.department (department_id, created_on, updated_on, department_description, department_name) VALUES (10, '2018-05-27 23:56:43', null, 'El departamento de dirección general agrupa los cargos relacionados con operaciones.', 'Departamento técnico');
	INSERT INTO dbo.department (department_id, created_on, updated_on, department_description, department_name) VALUES (59, '2018-05-27 23:56:44', null, 'El departamento comercial agrupa los cargos relacionados con las ventas de la empresa.', 'Departamento comercial');
	INSERT INTO dbo.department (department_id, created_on, updated_on, department_description, department_name) VALUES (68, '2018-05-27 23:56:44', null, 'El departamento financiero agrupa los cargos encargados de las finanzas de la empresa.', 'Departamento financiero');
	INSERT INTO dbo.department (department_id, created_on, updated_on, department_description, department_name) VALUES (77, '2018-05-27 23:56:44', null, 'El departamento de recursos humanos agrupa los cargos encargados del personal.', 'Departamento de recursos humanos');
	set identity_insert dbo.department off;
	print 'department done';
end
