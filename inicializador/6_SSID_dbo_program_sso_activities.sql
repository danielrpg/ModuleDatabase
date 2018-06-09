print 'insert data into the program_sso_activities table';
if(select count(*) from program_sso_activities)=0
begin
	set identity_insert program_sso_activities on;
	INSERT INTO program_sso_activities (sso_detail_id, created_on, updated_on, sso_detail_activities, sso_detail_goal, so_detail_number, sso_detail_time, soo_detail_type, sso_id, sso_trainer_id) VALUES (1,'2018-05-27 23:56:44', null, 'Identificar los riesgos a los que estan expuestos los empleados', 'Los empleados identifique por su cuenta los riesgos en sus areas de trabajo', 20, '3 días', 'Capacitación', 1, 1);
	INSERT INTO program_sso_activities (sso_detail_id, created_on, updated_on, sso_detail_activities, sso_detail_goal, so_detail_number, sso_detail_time, soo_detail_type, sso_id, sso_trainer_id) VALUES (2,'2018-05-27 23:56:44', null, 'Identificar nuevas normas', 'Los empleados deben estar actualizados con las nuevas normas', 20, '1 día', 'Capacitación', null, null);
	INSERT INTO program_sso_activities (sso_detail_id, created_on, updated_on, sso_detail_activities, sso_detail_goal, so_detail_number, sso_detail_time, soo_detail_type, sso_id, sso_trainer_id) VALUES (3,'2018-05-27 23:56:44', null, 'Identificar acciones a tomar en caso de accidentes', 'Los empleados deben estar conscientes de las acciones que deben ejecutar frente a un accidente', 20, '2 día', 'Capacitación', null, null);
	set identity_insert program_sso_activities off;
	print 'program_sso_activities done';
end
