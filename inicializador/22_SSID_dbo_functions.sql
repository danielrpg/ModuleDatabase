print 'insert data into the functions table';
if(select count(*) from dbo.functions)=0
begin
	set identity_insert dbo.functions on;
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (6, '2018-05-27 23:56:43', null, 'Debe encargarse de Genenciar la empresa de la mejor manera posible', 'Genenciar la empresa', 2);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (7, '2018-05-27 23:56:43', null, 'Debe encargarse de la Administración de todos los recursos de la empresa', 'Administración de recursos', 2);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (8, '2018-05-27 23:56:43', null, 'Formulación de proyectos de Ingeniería Civil de alta calidad, resistentes y seguros para los usuarios finales', 'Formulación de Proyectos', 2);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (9, '2018-05-27 23:56:43', null, 'Establecer programas en la ejecución de obras enfocados al mejor aprovechamiento de los recursos', 'Establecer programas', 2);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (20, '2018-05-27 23:56:44', null, 'Debe encargarse de Genenciar la empresa de la mejor manera posible', 'Genenciar la empresa', 11);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (21, '2018-05-27 23:56:44', null, 'Debe encargarse de la Administración de todos los recursos de la empresa', 'Administración de recursos', 11);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (22, '2018-05-27 23:56:44', null, 'Formulación de proyectos de Ingeniería Civil de alta calidad, resistentes y seguros para los usuarios finales', 'Formulación de Proyectos', 11);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (23, '2018-05-27 23:56:44', null, 'Establecer programas en la ejecución de obras enfocados al mejor aprovechamiento de los recursos', 'Establecer programas', 11);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (27, '2018-05-27 23:56:44', null, 'Debe encargarse de Genenciar la empresa de la mejor manera posible', 'Genenciar la empresa', 15);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (28, '2018-05-27 23:56:44', null, 'Debe encargarse de la Administración de todos los recursos de la empresa', 'Administración de recursos', 15);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (29, '2018-05-27 23:56:44', null, 'Formulación de proyectos de Ingeniería Civil de alta calidad, resistentes y seguros para los usuarios finales', 'Formulación de Proyectos', 15);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (30, '2018-05-27 23:56:44', null, 'Establecer programas en la ejecución de obras enfocados al mejor aprovechamiento de los recursos', 'Establecer programas', 15);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (34, '2018-05-27 23:56:44', null, 'Debe encargarse de Genenciar la empresa de la mejor manera posible', 'Genenciar la empresa', 13);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (35, '2018-05-27 23:56:44', null, 'Debe encargarse de la Administración de todos los recursos de la empresa', 'Administración de recursos', 13);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (36, '2018-05-27 23:56:44', null, 'Formulación de proyectos de Ingeniería Civil de alta calidad, resistentes y seguros para los usuarios finales', 'Formulación de Proyectos', 13);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (37, '2018-05-27 23:56:44', null, 'Establecer programas en la ejecución de obras enfocados al mejor aprovechamiento de los recursos', 'Establecer programas', 13);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (41, '2018-05-27 23:56:44', null, 'Debe encargarse de Genenciar la empresa de la mejor manera posible', 'Genenciar la empresa', 16);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (42, '2018-05-27 23:56:44', null, 'Debe encargarse de la Administración de todos los recursos de la empresa', 'Administración de recursos', 16);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (43, '2018-05-27 23:56:44', null, 'Formulación de proyectos de Ingeniería Civil de alta calidad, resistentes y seguros para los usuarios finales', 'Formulación de Proyectos', 16);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (44, '2018-05-27 23:56:44', null, 'Establecer programas en la ejecución de obras enfocados al mejor aprovechamiento de los recursos', 'Establecer programas', 16);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (48, '2018-05-27 23:56:44', null, 'Debe encargarse de Genenciar la empresa de la mejor manera posible', 'Genenciar la empresa', 12);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (49, '2018-05-27 23:56:44', null, 'Debe encargarse de la Administración de todos los recursos de la empresa', 'Administración de recursos', 12);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (50, '2018-05-27 23:56:44', null, 'Formulación de proyectos de Ingeniería Civil de alta calidad, resistentes y seguros para los usuarios finales', 'Formulación de Proyectos', 12);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (51, '2018-05-27 23:56:44', null, 'Establecer programas en la ejecución de obras enfocados al mejor aprovechamiento de los recursos', 'Establecer programas', 12);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (55, '2018-05-27 23:56:44', null, 'Debe encargarse de Genenciar la empresa de la mejor manera posible', 'Genenciar la empresa', 14);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (56, '2018-05-27 23:56:44', null, 'Debe encargarse de la Administración de todos los recursos de la empresa', 'Administración de recursos', 14);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (57, '2018-05-27 23:56:44', null, 'Formulación de proyectos de Ingeniería Civil de alta calidad, resistentes y seguros para los usuarios finales', 'Formulación de Proyectos', 14);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (58, '2018-05-27 23:56:44', null, 'Establecer programas en la ejecución de obras enfocados al mejor aprovechamiento de los recursos', 'Establecer programas', 14);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (64, '2018-05-27 23:56:44', null, 'Debe encargarse de Genenciar la empresa de la mejor manera posible', 'Genenciar la empresa', 60);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (65, '2018-05-27 23:56:44', null, 'Debe encargarse de la Administración de todos los recursos de la empresa', 'Administración de recursos', 60);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (66, '2018-05-27 23:56:44', null, 'Formulación de proyectos de Ingeniería Civil de alta calidad, resistentes y seguros para los usuarios finales', 'Formulación de Proyectos', 60);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (67, '2018-05-27 23:56:44', null, 'Establecer programas en la ejecución de obras enfocados al mejor aprovechamiento de los recursos', 'Establecer programas', 60);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (73, '2018-05-27 23:56:44', null, 'Debe encargarse de Genenciar la empresa de la mejor manera posible', 'Genenciar la empresa', 69);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (74, '2018-05-27 23:56:44', null, 'Debe encargarse de la Administración de todos los recursos de la empresa', 'Administración de recursos', 69);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (75, '2018-05-27 23:56:44', null, 'Formulación de proyectos de Ingeniería Civil de alta calidad, resistentes y seguros para los usuarios finales', 'Formulación de Proyectos', 69);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (76, '2018-05-27 23:56:44', null, 'Establecer programas en la ejecución de obras enfocados al mejor aprovechamiento de los recursos', 'Establecer programas', 69);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (88, '2018-05-27 23:56:44', null, 'Debe encargarse de Genenciar la empresa de la mejor manera posible', 'Genenciar la empresa', 81);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (89, '2018-05-27 23:56:44', null, 'Debe encargarse de la Administración de todos los recursos de la empresa', 'Administración de recursos', 81);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (90, '2018-05-27 23:56:44', null, 'Formulación de proyectos de Ingeniería Civil de alta calidad, resistentes y seguros para los usuarios finales', 'Formulación de Proyectos', 81);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (91, '2018-05-27 23:56:44', null, 'Establecer programas en la ejecución de obras enfocados al mejor aprovechamiento de los recursos', 'Establecer programas', 81);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (95, '2018-05-27 23:56:44', null, 'Debe encargarse de Genenciar la empresa de la mejor manera posible', 'Genenciar la empresa', 79);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (96, '2018-05-27 23:56:44', null, 'Debe encargarse de la Administración de todos los recursos de la empresa', 'Administración de recursos', 79);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (97, '2018-05-27 23:56:44', null, 'Formulación de proyectos de Ingeniería Civil de alta calidad, resistentes y seguros para los usuarios finales', 'Formulación de Proyectos', 79);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (98, '2018-05-27 23:56:44', null, 'Establecer programas en la ejecución de obras enfocados al mejor aprovechamiento de los recursos', 'Establecer programas', 79);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (102, '2018-05-27 23:56:44', null, 'Debe encargarse de Genenciar la empresa de la mejor manera posible', 'Genenciar la empresa', 82);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (103, '2018-05-27 23:56:44', null, 'Debe encargarse de la Administración de todos los recursos de la empresa', 'Administración de recursos', 82);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (104, '2018-05-27 23:56:44', null, 'Formulación de proyectos de Ingeniería Civil de alta calidad, resistentes y seguros para los usuarios finales', 'Formulación de Proyectos', 82);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (105, '2018-05-27 23:56:44', null, 'Establecer programas en la ejecución de obras enfocados al mejor aprovechamiento de los recursos', 'Establecer programas', 82);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (109, '2018-05-27 23:56:44', null, 'Debe encargarse de Genenciar la empresa de la mejor manera posible', 'Genenciar la empresa', 83);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (110, '2018-05-27 23:56:44', null, 'Debe encargarse de la Administración de todos los recursos de la empresa', 'Administración de recursos', 83);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (111, '2018-05-27 23:56:44', null, 'Formulación de proyectos de Ingeniería Civil de alta calidad, resistentes y seguros para los usuarios finales', 'Formulación de Proyectos', 83);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (112, '2018-05-27 23:56:44', null, 'Establecer programas en la ejecución de obras enfocados al mejor aprovechamiento de los recursos', 'Establecer programas', 83);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (130, '2018-05-27 23:56:44', null, 'Debe encargarse de Genenciar la empresa de la mejor manera posible', 'Genenciar la empresa', 84);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (131, '2018-05-27 23:56:44', null, 'Debe encargarse de la Administración de todos los recursos de la empresa', 'Administración de recursos', 84);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (132, '2018-05-27 23:56:44', null, 'Formulación de proyectos de Ingeniería Civil de alta calidad, resistentes y seguros para los usuarios finales', 'Formulación de Proyectos', 84);
	INSERT INTO dbo.functions (func_id, created_on, updated_on, func_description, func_name, position_position_id) VALUES (133, '2018-05-27 23:56:44', null, 'Establecer programas en la ejecución de obras enfocados al mejor aprovechamiento de los recursos', 'Establecer programas', 84);
	set identity_insert dbo.functions off;
	print 'functions done';
end