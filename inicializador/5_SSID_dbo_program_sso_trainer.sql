print 'insert data into the program_sso_trainer table';
if(select count(*) from dbo.program_sso_trainer)=0
begin
	set identity_insert dbo.program_sso_trainer on;
	INSERT INTO dbo.program_sso_trainer (sso_trainer_id, created_on, updated_on, sso_trainer_skills, sso_trainer_ci, sso_trainer_image, sso_trainer_name, sso_trainer_specialty) VALUES (1, '20120618 10:34:09 AM', null, 'Experto en seguridad industrial', '123456789', null, 'Juan Perez', 'Ing. Industrial');
	INSERT INTO dbo.program_sso_trainer (sso_trainer_id, created_on, updated_on, sso_trainer_skills, sso_trainer_ci, sso_trainer_image, sso_trainer_name, sso_trainer_specialty) VALUES (2, '2018-05-27 23:56:44', null, 'Experto en Accidentes maquinarios', '343423456', null, 'Gabriel Moreno', 'Ing. Industrial');
	INSERT INTO dbo.program_sso_trainer (sso_trainer_id, created_on, updated_on, sso_trainer_skills, sso_trainer_ci, sso_trainer_image, sso_trainer_name, sso_trainer_specialty) VALUES (3, '2018-05-27 23:56:44', null, 'Experto en Accidentes con Maquinaria pesada', '545454545', null, 'Rafael Terrazas', 'Ing. Industrial');
	INSERT INTO dbo.program_sso_trainer (sso_trainer_id, created_on, updated_on, sso_trainer_skills, sso_trainer_ci, sso_trainer_image, sso_trainer_name, sso_trainer_specialty) VALUES (4, '2018-05-27 23:56:44', null, 'Experto ambiental en industrias', '323123434', null, 'Nicolas Marquez', 'Ing. Ambiental');
	INSERT INTO dbo.program_sso_trainer (sso_trainer_id, created_on, updated_on, sso_trainer_skills, sso_trainer_ci, sso_trainer_image, sso_trainer_name, sso_trainer_specialty) VALUES (5, '2018-05-27 23:56:44', null, 'Experto en salud ocupacional', '678987678', null, 'Florinda Mesa', 'Medico');
	INSERT INTO dbo.program_sso_trainer (sso_trainer_id, created_on, updated_on, sso_trainer_skills, sso_trainer_ci, sso_trainer_image, sso_trainer_name, sso_trainer_specialty) VALUES (6, '2018-05-27 23:56:44', null, 'Experto en accidentes', '567876567', null, 'Fernando Flores', 'Ing. Industrial');
	INSERT INTO dbo.program_sso_trainer (sso_trainer_id, created_on, updated_on, sso_trainer_skills, sso_trainer_ci, sso_trainer_image, sso_trainer_name, sso_trainer_specialty) VALUES (7, '2018-05-27 23:56:44', null, 'Experto ambiental en industrias', '6767676767', null, 'Karina Marasi', 'Ing. Industrial');
	set identity_insert dbo.program_sso_trainer off;
	print 'program_sso_trainer done';
end

