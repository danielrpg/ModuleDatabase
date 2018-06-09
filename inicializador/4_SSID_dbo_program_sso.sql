-- PROGRAMA SSO
print 'insert data into the program_sso table';
if(select count(*) from dbo.program_sso)=0
begin
	set identity_insert dbo.program_sso on;
	INSERT INTO dbo.program_sso (sso_id, created_on, updated_on, sso_execution_time, sso_goal, sso_indicator, sso_objetive, sso_responsable, sso_total_cost) VALUES (1, '2018-05-27 23:56:44', null, '2 semanas', 'Mejorar los conocimientos de los empleados en seguridad industrial', 'Mejora en uso de material de seguridad', 'Capacitar a todos los trabajadores', 'Pedro Fernandez', 500.5);
	INSERT INTO dbo.program_sso (sso_id, created_on, updated_on, sso_execution_time, sso_goal, sso_indicator, sso_objetive, sso_responsable, sso_total_cost) VALUES (2, '2018-05-27 23:56:44', null, '3 semanas', 'Actualizar normas en seguridad industrial', 'Mejora en actualizacion de normas', 'Capacitar a todos los trabajadores', 'Jorge Eduardo', 300.5);
	INSERT INTO dbo.program_sso (sso_id, created_on, updated_on, sso_execution_time, sso_goal, sso_indicator, sso_objetive, sso_responsable, sso_total_cost) VALUES (3, '2018-05-27 23:56:44', null, '1 semana', 'Conocer accionar frente a un accidente', 'Incrementar el conocimiento sobre accidentes', 'Capacitar a todos los trabajadores', 'Olga Mercado', 100.5);
	INSERT INTO dbo.program_sso (sso_id, created_on, updated_on, sso_execution_time, sso_goal, sso_indicator, sso_objetive, sso_responsable, sso_total_cost) VALUES (4, '2018-05-27 23:56:44', null, '2 semanas', 'Mejorar los conocimientos de los empleados en seguridad industrial', 'Mejora en uso de material de seguridad', 'Capacitar a todos los trabajadores', 'Angela Perez', 500.5);
	INSERT INTO dbo.program_sso (sso_id, created_on, updated_on, sso_execution_time, sso_goal, sso_indicator, sso_objetive, sso_responsable, sso_total_cost) VALUES (5, '2018-05-27 23:56:44', null, '3 semanas', 'Incrementar el conocimiento sobre peligros maquinarios', 'Mejora del uso de maquinarias', 'Capacitar a todos los trabajadores', 'Maria Fanola', 540.5);
	set identity_insert dbo.program_sso off;
	print 'program_sso done';
end
