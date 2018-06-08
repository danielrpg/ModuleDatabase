-- Inicident
        -- incident_type_id, -- 4
        -- incident_type_name, -- accidente
        -- incident_type_description, --
        -- incident_type_type, -- accidente de personal, daños a la propiedad/equipos, Medio ambiente, Fatalidad
        -- incident_type_subtype) -- forma del accidente, tipo de lesion, parte del cuerpo lesionada, Agente causante
print 'insert data into the incident_type table';
if(select count(*) from dbo.incident_type)=0
begin
	set identity_insert dbo.incident_type on;
	INSERT INTO dbo.incident_type (incident_type_id, incident_type_name, incident_type_description, incident_type_type, incident_type_subtype) VALUES (1, 'accidente', 'este es el registro de accidentes', '','');
	INSERT INTO dbo.incident_type (incident_type_id, incident_type_name, incident_type_description, incident_type_type, incident_type_subtype) VALUES (2, 'enfermedad', 'enfermedad muy contagiosa', '', 'gripe');
	INSERT INTO dbo.incident_type (incident_type_id, incident_type_name, incident_type_description, incident_type_type, incident_type_subtype) VALUES (3, 'incidente', 'perdida de material', '', '');
	INSERT INTO dbo.incident_type (incident_type_id, incident_type_name, incident_type_description, incident_type_type, incident_type_subtype) VALUES (4, 'accidente', 'caida de persona a nivel', 'accidente de personal', 'forma del accidente')
	INSERT INTO dbo.incident_type (incident_type_id, incident_type_name, incident_type_description, incident_type_type, incident_type_subtype) VALUES (5, 'accidente', 'caida de persona a altura', 'accidente de personal', 'forma del accidente')
	INSERT INTO dbo.incident_type (incident_type_id, incident_type_name, incident_type_description, incident_type_type, incident_type_subtype) VALUES (6, 'accidente', 'caida de persona al agua', 'accidente de personal', 'forma del accidente')
	INSERT INTO dbo.incident_type (incident_type_id, incident_type_name, incident_type_description, incident_type_type, incident_type_subtype) VALUES (7, 'accidente', 'derrumbe o desplome de instalaciones', 'accidente de personal', 'forma del accidente')
	INSERT INTO dbo.incident_type (incident_type_id, incident_type_name, incident_type_description, incident_type_type, incident_type_subtype) VALUES (8, 'accidente', 'caida de objetos', 'accidente de personal', 'forma del accidente')
	INSERT INTO dbo.incident_type (incident_type_id, incident_type_name, incident_type_description, incident_type_type, incident_type_subtype) VALUES (9, 'accidente', 'cisada sobre objetos', 'accidente de personal', 'forma del accidente')
	INSERT INTO dbo.incident_type (incident_type_id, incident_type_name, incident_type_description, incident_type_type, incident_type_subtype) VALUES (10, 'accidente', 'choque contra objetos', 'accidente de personal', 'forma del accidente')
	INSERT INTO dbo.incident_type (incident_type_id, incident_type_name, incident_type_description, incident_type_type, incident_type_subtype) VALUES (11, 'accidente', 'golpes por objetos', 'accidente de personal', 'forma del accidente')
	INSERT INTO dbo.incident_type (incident_type_id, incident_type_name, incident_type_description, incident_type_type, incident_type_subtype) VALUES (12, 'accidente', 'apricionamiento o atrapamiento', 'accidente de personal', 'forma del accidente')
	INSERT INTO dbo.incident_type (incident_type_id, incident_type_name, incident_type_description, incident_type_type, incident_type_subtype) VALUES (13, 'accidente', 'Esfuerzos fisicos excesivos', 'accidente de personal', 'forma del accidente')
	INSERT INTO dbo.incident_type (incident_type_id, incident_type_name, incident_type_description, incident_type_type, incident_type_subtype) VALUES (14, 'accidente', 'falsos movimientos', 'accidente de personal', 'forma del accidente')
	INSERT INTO dbo.incident_type (incident_type_id, incident_type_name, incident_type_description, incident_type_type, incident_type_subtype) VALUES (15, 'accidente', 'exposicion al frio', 'accidente de personal', 'forma del accidente')
	INSERT INTO dbo.incident_type (incident_type_id, incident_type_name, incident_type_description, incident_type_type, incident_type_subtype) VALUES (16, 'accidente', 'expocicion al calor', 'accidente de personal', 'forma del accidente')
	set identity_insert dbo.incident_type off;
	print 'inident_type done';
end
