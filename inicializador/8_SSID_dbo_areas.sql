print 'insert data into the area table';
if(select count(*) from dbo.areas)=0
begin
	set identity_insert dbo.areas on;
	INSERT INTO dbo.areas (area_id, created_on, updated_on, area_description, area_name) VALUES (1, '2018-05-27 23:56:43', null, 'Diseños de casas, habitaciones, otros ambientes.', 'Diseño');
	INSERT INTO dbo.areas (area_id, created_on, updated_on, area_description, area_name) VALUES (2, '2018-05-27 23:56:43', null, 'Remodelaciones de ambientes de casas, habitaciones, etc.', 'Remodelaciones');
	INSERT INTO dbo.areas (area_id, created_on, updated_on, area_description, area_name) VALUES (3, '2018-05-27 23:56:43', null, 'Ampliaciones de habitaciones, espacios recreativos, cocinas, areas comunes, etc.', 'Ampliaciones');
	INSERT INTO dbo.areas (area_id, created_on, updated_on, area_description, area_name) VALUES (4, '2018-05-27 23:56:43', null, 'Trabajos en metal para adaptación de Galpones  y Carpintería metálica para puertas, barandas, otros.', 'Galpones  y Carpintería metálica');
	INSERT INTO dbo.areas (area_id, created_on, updated_on, area_description, area_name) VALUES (5, '2018-05-27 23:56:43', null, 'Instalaciones hídricas para ambientes como cocinas, baños, lavandería, duchas, piscinas, jardines, etc.', 'Instalaciones hídricas');
	INSERT INTO dbo.areas (area_id, created_on, updated_on, area_description, area_name) VALUES (6, '2018-05-27 23:56:43', null, 'Instalaciones eléctricas en los diferentes ambientes donde se trabaje.', 'Instalaciones eléctricas');
	INSERT INTO dbo.areas (area_id, created_on, updated_on, area_description, area_name) VALUES (7, '2018-05-27 23:56:43', null, 'Trabajos relacionados a la obra gruesa en la construcción, como ser estructura en las edificaciones, muros, pisos, pavimentos, techado, etc.', 'Obra gruesa');
	INSERT INTO dbo.areas (area_id, created_on, updated_on, area_description, area_name) VALUES (8, '2018-05-27 23:56:43', null, 'Trabajos relacionados a la obra fina en la construcción, como ser revoque de paredes, cielo raso, cerámica, etc. para puertas, barandas, otros.', 'Obra fina');
	set identity_insert dbo.areas off;
	print 'areas table done';
end
