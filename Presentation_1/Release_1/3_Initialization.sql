-- Data initialization
/******************************************************************************
**  DataBase: ssidb
**  Desc: Initialization of basic data
** 
**  Called by: ssi
**
**  Author: Ivan Misericordia Eulate
**
**  Date: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/28/2018 Ivan Misericordia Eulate   Initial version
** 05/29/2018 Franz A. Lopez Choque		  Update schema version
*******************************************************************************/
use SSID;
set xact_abort on;
set nocount on;

BEGIN TRANSACTION;

print 'insert data into the roles table';
if(select count(*) from dbo.roles)=0
begin
	set identity_insert dbo.roles on;
	INSERT INTO dbo.roles(role_id, created_on , updated_on, role_name) VALUES (1, '2018-05-27 22:18:59', '2018-05-27 22:18:59', 'ROLE_ADMIN');
	INSERT INTO dbo.roles(role_id, created_on, updated_on, role_name) VALUES (2, '2018-05-27 22:18:59', '2018-05-27 22:18:59', 'ROLE_USER');
	set identity_insert dbo.roles off;
	print 'roles table done';
end

print 'insert data into the users table';
if(select count(*) from dbo.users)=0
begin
	set identity_insert dbo.users on;
	INSERT INTO dbo.users (user_id, created_on, updated_on, user_password, user_active, user_name) VALUES (1, '2018-05-27 23:56:43', null, '$2a$10$XURPShQNCsLjp1ESc2laoObo9QZDhxz73hJPaEv7/cBha4pk0AgP.', 1, 'admin');
	set identity_insert dbo.users off;
	print 'users table done';			
end

print 'insert data into the user_role';
if(select count(*) from dbo.user_role)=0
begin
	INSERT INTO dbo.user_role (user_id, role_id) VALUES (1, 1);
	print 'user_role table done';
end

-- PROGRAMA SSO
print 'insert data into the program_sso table';
if(select count(*) from dbo.program_sso)=0
begin
	set identity_insert dbo.program_sso on;
	INSERT INTO dbo.program_sso (sso_id, created_on, updated_on, sso_execution_time, sso_goal, sso_indicator, sso_objetive, sso_responsable, sso_total_cost) 
		VALUES (1, '2018-05-27 23:56:44', null, '2 semanas', 'Mejorar los conocimientos de los empleados en seguridad industrial', 'Mejora en uso de material de seguridad', 'Capacitar a todos los trabajadores', 'Pedro Fernandez', 500.5);
	INSERT INTO dbo.program_sso (sso_id, created_on, updated_on, sso_execution_time, sso_goal, sso_indicator, sso_objetive, sso_responsable, sso_total_cost) 
		VALUES (2, '2018-05-27 23:56:44', null, '3 semanas', 'Actualizar normas en seguridad industrial', 'Mejora en actualizacion de normas', 'Capacitar a todos los trabajadores', 'Jorge Eduardo', 300.5);
	INSERT INTO dbo.program_sso (sso_id, created_on, updated_on, sso_execution_time, sso_goal, sso_indicator, sso_objetive, sso_responsable, sso_total_cost) 
		VALUES (3, '2018-05-27 23:56:44', null, '1 semana', 'Conocer accionar frente a un accidente', 'Incrementar el conocimiento sobre accidentes', 'Capacitar a todos los trabajadores', 'Olga Mercado', 100.5);
	INSERT INTO dbo.program_sso (sso_id, created_on, updated_on, sso_execution_time, sso_goal, sso_indicator, sso_objetive, sso_responsable, sso_total_cost) 
		VALUES (4, '2018-05-27 23:56:44', null, '2 semanas', 'Mejorar los conocimientos de los empleados en seguridad industrial', 'Mejora en uso de material de seguridad', 'Capacitar a todos los trabajadores', 'Angela Perez', 500.5);
	INSERT INTO dbo.program_sso (sso_id, created_on, updated_on, sso_execution_time, sso_goal, sso_indicator, sso_objetive, sso_responsable, sso_total_cost) 
		VALUES (5, '2018-05-27 23:56:44', null, '3 semanas', 'Incrementar el conocimiento sobre peligros maquinarios', 'Mejora del uso de maquinarias', 'Capacitar a todos los trabajadores', 'Maria Fanola', 540.5);
	set identity_insert dbo.program_sso off;
	print 'program_sso done';
end

print 'insert data into the program_sso_trainer table';
if(select count(*) from dbo.program_sso_trainer)=0
begin
	set identity_insert dbo.program_sso_trainer on;
	INSERT INTO dbo.program_sso_trainer (sso_trainer_id, created_on, updated_on, sso_trainer_skills, sso_trainer_ci, sso_trainer_image, sso_trainer_name, sso_trainer_specialty) 
		VALUES (1, '20120618 10:34:09 AM', null, 'Experto en seguridad industrial', '123456789', null, 'Juan Perez', 'Ing. Industrial');
	INSERT INTO dbo.program_sso_trainer (sso_trainer_id, created_on, updated_on, sso_trainer_skills, sso_trainer_ci, sso_trainer_image, sso_trainer_name, sso_trainer_specialty) 
		VALUES (2, '2018-05-27 23:56:44', null, 'Experto en Accidentes maquinarios', '343423456', null, 'Gabriel Moreno', 'Ing. Industrial');
	INSERT INTO dbo.program_sso_trainer (sso_trainer_id, created_on, updated_on, sso_trainer_skills, sso_trainer_ci, sso_trainer_image, sso_trainer_name, sso_trainer_specialty) 
		VALUES (3, '2018-05-27 23:56:44', null, 'Experto en Accidentes con Maquinaria pesada', '545454545', null, 'Rafael Terrazas', 'Ing. Industrial');
	INSERT INTO dbo.program_sso_trainer (sso_trainer_id, created_on, updated_on, sso_trainer_skills, sso_trainer_ci, sso_trainer_image, sso_trainer_name, sso_trainer_specialty) 
		VALUES (4, '2018-05-27 23:56:44', null, 'Experto ambiental en industrias', '323123434', null, 'Nicolas Marquez', 'Ing. Ambiental');
	INSERT INTO dbo.program_sso_trainer (sso_trainer_id, created_on, updated_on, sso_trainer_skills, sso_trainer_ci, sso_trainer_image, sso_trainer_name, sso_trainer_specialty) 
		VALUES (5, '2018-05-27 23:56:44', null, 'Experto en salud ocupacional', '678987678', null, 'Florinda Mesa', 'Medico');
	INSERT INTO dbo.program_sso_trainer (sso_trainer_id, created_on, updated_on, sso_trainer_skills, sso_trainer_ci, sso_trainer_image, sso_trainer_name, sso_trainer_specialty) 
		VALUES (6, '2018-05-27 23:56:44', null, 'Experto en accidentes', '567876567', null, 'Fernando Flores', 'Ing. Industrial');
	INSERT INTO dbo.program_sso_trainer (sso_trainer_id, created_on, updated_on, sso_trainer_skills, sso_trainer_ci, sso_trainer_image, sso_trainer_name, sso_trainer_specialty) 
		VALUES (7, '2018-05-27 23:56:44', null, 'Experto ambiental en industrias', '6767676767', null, 'Karina Marasi', 'Ing. Industrial');
	set identity_insert dbo.program_sso_trainer off;
	print 'program_sso_trainer done';
end

print 'insert data into the program_sso_activities table';
if(select count(*) from program_sso_activities)=0
begin
	set identity_insert program_sso_activities on;
	INSERT INTO program_sso_activities (sso_detail_id, created_on, updated_on, sso_detail_activities, sso_detail_goal, so_detail_number, sso_detail_time, soo_detail_type, sso_id, sso_trainer_id) 
		VALUES (134,'2018-05-27 23:56:44', null, 'Identificar los riesgos a los que estan expuestos los empleados', 'Los empleados identifique por su cuenta los riesgos en sus areas de trabajo', 20, '3 días', 'Capacitación', 1, 1);
	INSERT INTO program_sso_activities (sso_detail_id, created_on, updated_on, sso_detail_activities, sso_detail_goal, so_detail_number, sso_detail_time, soo_detail_type, sso_id, sso_trainer_id) 
		VALUES (135,'2018-05-27 23:56:44', null, 'Identificar nuevas normas', 'Los empleados deben estar actualizados con las nuevas normas', 20, '1 día', 'Capacitación', null, null);
	INSERT INTO program_sso_activities (sso_detail_id, created_on, updated_on, sso_detail_activities, sso_detail_goal, so_detail_number, sso_detail_time, soo_detail_type, sso_id, sso_trainer_id) 
		VALUES (136,'2018-05-27 23:56:44', null, 'Identificar acciones a tomar en caso de accidentes', 'Los empleados deben estar conscientes de las acciones que deben ejecutar frente a un accidente', 20, '2 día', 'Capacitación', null, null);
	set identity_insert program_sso_activities off;
	print 'program_sso_activities done';
end

print 'insert data into the program_sso_resource table';
if(select count(*) from dbo.program_sso_resource)=0
begin
	set identity_insert dbo.program_sso_resource on;
	INSERT INTO dbo.program_sso_resource (sso_resource_id, created_on, updated_on, sso_resource_cost, sso_resource_detail, sso_detail_id) 
		VALUES (1, '2018-05-27 23:56:44', null, 200, 'Hojas tamaño carta', 134);
	INSERT INTO dbo.program_sso_resource (sso_resource_id, created_on, updated_on, sso_resource_cost, sso_resource_detail, sso_detail_id) 
		VALUES (2, '2018-05-27 23:56:44', null, 300, 'Pliegos de cartulina', 135);
	INSERT INTO dbo.program_sso_resource (sso_resource_id, created_on, updated_on, sso_resource_cost, sso_resource_detail, sso_detail_id) 
		VALUES (3, '2018-05-27 23:56:44', null, 100, 'Marcadores', 136);
	INSERT INTO dbo.program_sso_resource (sso_resource_id, created_on, updated_on, sso_resource_cost, sso_resource_detail, sso_detail_id) 
		VALUES (4, '2018-05-27 23:56:44', null, 200, 'Pliegos de cartulina', 136);
	set identity_insert dbo.program_sso_resource off;
	print 'program_sso_resource done';
end

print 'insert data into the area table';
if(select count(*) from dbo.areas)=0
begin
	set identity_insert dbo.areas on;
	INSERT INTO dbo.areas (area_id, created_on, updated_on, area_description, area_name) 
		VALUES (1, '2018-05-27 23:56:43', null, 'Diseños de casas, habitaciones, otros ambientes.', 'Diseño');
	INSERT INTO dbo.areas (area_id, created_on, updated_on, area_description, area_name) 
		VALUES (2, '2018-05-27 23:56:43', null, 'Remodelaciones de ambientes de casas, habitaciones, etc.', 'Remodelaciones');
	INSERT INTO dbo.areas (area_id, created_on, updated_on, area_description, area_name) 
		VALUES (3, '2018-05-27 23:56:43', null, 'Ampliaciones de habitaciones, espacios recreativos, cocinas, areas comunes, etc.', 'Ampliaciones');
	INSERT INTO dbo.areas (area_id, created_on, updated_on, area_description, area_name) 
		VALUES (4, '2018-05-27 23:56:43', null, 'Trabajos en metal para adaptación de Galpones  y Carpintería metálica para puertas, barandas, otros.', 'Galpones  y Carpintería metálica');
	INSERT INTO dbo.areas (area_id, created_on, updated_on, area_description, area_name) 
		VALUES (5, '2018-05-27 23:56:43', null, 'Instalaciones hídricas para ambientes como cocinas, baños, lavandería, duchas, piscinas, jardines, etc.', 'Instalaciones hídricas');
	INSERT INTO dbo.areas (area_id, created_on, updated_on, area_description, area_name) 
		VALUES (6, '2018-05-27 23:56:43', null, 'Instalaciones eléctricas en los diferentes ambientes donde se trabaje.', 'Instalaciones eléctricas');
	INSERT INTO dbo.areas (area_id, created_on, updated_on, area_description, area_name) 
		VALUES (7, '2018-05-27 23:56:43', null, 'Trabajos relacionados a la obra gruesa en la construcción, como ser estructura en las edificaciones, muros, pisos, pavimentos, techado, etc.', 'Obra gruesa');
	INSERT INTO dbo.areas (area_id, created_on, updated_on, area_description, area_name) 
		VALUES (8, '2018-05-27 23:56:43', null, 'Trabajos relacionados a la obra fina en la construcción, como ser revoque de paredes, cielo raso, cerámica, etc. para puertas, barandas, otros.', 'Obra fina');
	set identity_insert dbo.areas off;
	print 'areas table done';
end

print 'insert data into the personal table';
if(select count(*) from dbo.personals)=0
begin
	set identity_insert dbo.personals on;
	INSERT INTO dbo.personals(personal_id,[personal_name],[personal_last_name],[personal_email],[personal_direction],[personal_cellphone],[personal_telephone],[personal_active],[personal_birthdate],[created_on],[updated_on],[area_area_id]) VALUES (1,'Jhon','Royal','jhon@gmail.com','av.villazon','796586','432145',1,null,'2018-05-27 23:56:43',null,4);
	INSERT INTO dbo.personals(personal_id,[personal_name],[personal_last_name],[personal_email],[personal_direction],[personal_cellphone],[personal_telephone],[personal_active],[personal_birthdate],[created_on],[updated_on],[area_area_id]) VALUES (2,'Jhon','peck','jhondoe@gmail.com','av.mariscal','795981','4495215',1,null,'2018-05-27 23:56:43',null,5);
	INSERT INTO dbo.personals(personal_id,[personal_name],[personal_last_name],[personal_email],[personal_direction],[personal_cellphone],[personal_telephone],[personal_active],[personal_birthdate],[created_on],[updated_on],[area_area_id]) VALUES (3,'Jhon','doe','jhonny@gmail.com','av.rivero','726586','4471515',1,null,'2018-05-27 23:56:43',null,6);
	set identity_insert dbo.personals oFF;
	print 'personals done';
end

print 'insert data into the equipament table';
if(select count(*) from dbo.equipaments)=0
begin
	set identity_insert dbo.equipaments on;
	INSERT INTO dbo.equipaments (equipament_id, created_on, updated_on, equipament_description, equipament_image, equipament_name, equipament_type) 
		VALUES (1, '2018-05-28 15:13:25', null, 'Casco tipo Jokey', 0x, 'Helmmet', 1);
	INSERT INTO dbo.equipaments (equipament_id, created_on, updated_on, equipament_description, equipament_image, equipament_name, equipament_type) 
		VALUES (2, '2018-05-28 15:13:25', null, 'Taladro electrico portatil bosch', 0x, 'Electric Drill', 2);
	INSERT INTO dbo.equipaments (equipament_id, created_on, updated_on, equipament_description, equipament_image, equipament_name, equipament_type) 
		VALUES (3, '2018-05-28 15:13:25', null, 'Casco tipo Jokey de ala Ancha', 0x, 'Helmmet2', 1);
	INSERT INTO dbo.equipaments (equipament_id, created_on, updated_on, equipament_description, equipament_image, equipament_name, equipament_type) 
		VALUES (4, '2018-05-28 15:13:25', null, 'Taladro electrico de banca bosch', 0x, 'Drill', 2);
	set identity_insert dbo.equipaments off;
	print 'equipament done';
end

print 'insert data into the kardex_equipaments table';
if(select count(*) from dbo.kardex_equipaments)=0
begin
	set identity_insert dbo.kardex_equipaments on;
	INSERT INTO dbo.kardex_equipaments (equipament_kardex_id, created_on, updated_on, balance_kardex, date_kardex, entry_kardex, outlay_kardex, equipament_id)
		VALUES (1, '2018-05-28 15:13:25', null, 15, '2018-05-28 15:13:25', 15, 0, 1);
	INSERT INTO dbo.kardex_equipaments (equipament_kardex_id, created_on, updated_on, balance_kardex, date_kardex, entry_kardex, outlay_kardex, equipament_id)
		VALUES (2, '2018-05-28 15:13:25', null, 10, '2018-05-28 15:13:25', 0, 5, 2);
	INSERT INTO dbo.kardex_equipaments (equipament_kardex_id, created_on, updated_on, balance_kardex, date_kardex, entry_kardex, outlay_kardex, equipament_id)
		VALUES (3, '2018-05-28 15:13:25', null, 15, '2018-05-28 15:13:25', 15, 0, 3);
	INSERT INTO dbo.kardex_equipaments (equipament_kardex_id, created_on, updated_on, balance_kardex, date_kardex, entry_kardex, outlay_kardex, equipament_id)
		VALUES (4, '2018-05-28 15:13:25', null, 10, '2018-05-28 15:13:25', 0, 0, 4);
	set identity_insert dbo.kardex_equipaments off;
	print 'kardex done';
end 

print 'insert data into the inventory table';
if(select count(*) from dbo.inventory)=0
begin
	set identity_insert dbo.inventory on;
	INSERT INTO dbo.inventory (inventory_id, created_on, updated_on, active_assignament, date_assignament, status_assignament, equipament_id, personal_id) VALUES (1, '2018-05-28 16:20:04', null, 1, '2018-05-28 16:20:30', 'bueno', 1, 1);
	INSERT INTO dbo.inventory (inventory_id, created_on, updated_on, active_assignament, date_assignament, status_assignament, equipament_id, personal_id) VALUES (2, '2018-05-28 16:21:40', null, 1, '2017-05-28 16:21:50', 'nuevo', 2, 2);
	INSERT INTO dbo.inventory (inventory_id, created_on, updated_on, active_assignament, date_assignament, status_assignament, equipament_id, personal_id) VALUES (4, '2016-05-28 16:22:33', null, 0, '2017-05-28 16:22:46', 'malo', 2, 2);
	set identity_insert dbo.inventory off;
	print 'inventory done';
end

print 'insert data into the history_area_personal table';
if(select count(*) from dbo.history_area_personal)=0
begin
	set identity_insert dbo.[history_area_personal] on;
	INSERT INTO [dbo].[history_area_personal]([hap_id],[created_on],[updated_on],[hap_datea_fin],[hap_date_ini],[hap_status],[personal_personal_id]) VALUES(1,'2018-05-27 23:56:43',null,null ,null,1,1);
	INSERT INTO [dbo].[history_area_personal]([hap_id],[created_on],[updated_on],[hap_datea_fin],[hap_date_ini],[hap_status],[personal_personal_id]) VALUES(2,'2016-05-28 16:22:33',null,null ,null,1,2);
	INSERT INTO [dbo].[history_area_personal]([hap_id],[created_on],[updated_on],[hap_datea_fin],[hap_date_ini],[hap_status],[personal_personal_id]) VALUES(3,'2015-05-27 23:56:43',null,null ,null,1,3);
	set identity_insert dbo.[history_area_personal] off;
end
-- End SSO

-- Inicident
print 'insert data into the incident_type table';
if(select count(*) from dbo.incident_type)=0
begin
	set identity_insert dbo.incident_type on;
	INSERT INTO dbo.incident_type (incident_type_id, incident_type_name, incident_type_description, incident_type_type, incident_type_subtype) VALUES (137, 'accidente', 'Este es el registro de accidentes', '','');
	INSERT INTO dbo.incident_type (incident_type_id, incident_type_name, incident_type_description, incident_type_type, incident_type_subtype) VALUES (138, 'enfermedad', 'Enfermedad muy contagiosa', '', 'gripe');
	INSERT INTO dbo.incident_type (incident_type_id, incident_type_name, incident_type_description, incident_type_type, incident_type_subtype) VALUES (139, 'incidente', 'Perdida de material', '', '');
	set identity_insert dbo.incident_type off;
	print 'inident_typr done';
end

print 'insert data into the incident_detail table';
if(select count(*) from dbo.incident_detail)=0
begin
	set identity_insert dbo.incident_detail on;
	INSERT INTO dbo.incident_detail (incident_detail_id, incident_detail_status, incident_detail_name, incident_detail_description) VALUES (141, 'entregado', '', 'En fecha 02 de Mayo el Ingeniero se accidente');
	INSERT INTO dbo.incident_detail (incident_detail_id, incident_detail_status, incident_detail_name, incident_detail_description) VALUES (143, 'pendiente', '', 'En fecha 02 de Mayo el cortador Gonzales tenia gripe');
	INSERT INTO dbo.incident_detail (incident_detail_id, incident_detail_status, incident_detail_name, incident_detail_description) VALUES (145, 'reportado', '', 'En fecha 24 de Abril el Licenciado Maldonado reporto que el piso del sector 7 estaba mojado');
	set identity_insert dbo.incident_detail off;
	print 'incident_detail done';
end

print 'insert data into the incident table';
if(select count(*) from dbo.incident)=0
begin
	set identity_insert dbo.incident on;
	INSERT INTO dbo.incident (incident_id, incident_code, incident_registered_date, incident_number, incident_reincident, incident_reported_by, incident_severity, incident_treatment, incident_detail_id, incident_type_id, personal_id)
		VALUES (140, 'ACC-01', '2018-05-27 23:56:44', 0, 0, 'admin', 'alta', 0, 141, 137,1);
	INSERT INTO dbo.incident (incident_id, incident_code, incident_registered_date, incident_number, incident_reincident, incident_reported_by, incident_severity, incident_treatment, incident_detail_id, incident_type_id, personal_id)
		VALUES (142, 'ENF-01', '2018-05-27 23:56:44', 0, 0, 'admin', 'baja', 0, 143, 138,2);
	INSERT INTO dbo.incident (incident_id, incident_code, incident_registered_date, incident_number, incident_reincident, incident_reported_by, incident_severity, incident_treatment, incident_detail_id, incident_type_id, personal_id)
		VALUES (144, 'INC-01', '2018-05-27 23:56:44', 0, 0, 'admin', 'media', 0, 145, 139,3);
	set identity_insert dbo.incident off;
	print 'incident done';
end
-- End Insident

print 'insert data into the contracts table';
if(select count(*) from dbo.contracts)=0
begin
	set identity_insert dbo.contracts on;
	INSERT INTO dbo.contracts (contract_id, created_on, updated_on, contract_city, contract_code, contract_date, contract_description, contract_salary, contract_type) VALUES (1, '2018-05-27 23:56:44', null, 'Cbba', '001', '2018-05-27 23:56:44', 'Contrato de pasantia universitaria', 1000, 'Semestral');
	INSERT INTO dbo.contracts (contract_id, created_on, updated_on, contract_city, contract_code, contract_date, contract_description, contract_salary, contract_type) VALUES (2, '2018-05-27 23:56:44', null, 'cbba', '002', '2018-05-27 23:56:44', 'contrato para evalucion de personal externo', 3500.5, 'Indefinido');
	set identity_insert dbo.contracts off;
	print 'contracts done';
end

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

print 'insert data into the department_position table';
if(select count(*) from dbo.department_position)=0
begin
	
	INSERT INTO dbo.department_position (department_id, position_id) VALUES (1, 2);
	INSERT INTO dbo.department_position (department_id, position_id) VALUES (10, 11);
	INSERT INTO dbo.department_position (department_id, position_id) VALUES (10, 12);
	INSERT INTO dbo.department_position (department_id, position_id) VALUES (10, 13);
	INSERT INTO dbo.department_position (department_id, position_id) VALUES (10, 14);
	INSERT INTO dbo.department_position (department_id, position_id) VALUES (10, 15);
	INSERT INTO dbo.department_position (department_id, position_id) VALUES (10, 16);
	INSERT INTO dbo.department_position (department_id, position_id) VALUES (59, 60);
	INSERT INTO dbo.department_position (department_id, position_id) VALUES (68, 69);
	INSERT INTO dbo.department_position (department_id, position_id) VALUES (77, 79);
	INSERT INTO dbo.department_position (department_id, position_id) VALUES (77, 81);
	INSERT INTO dbo.department_position (department_id, position_id) VALUES (77, 82);
	INSERT INTO dbo.department_position (department_id, position_id) VALUES (77, 83);
	INSERT INTO dbo.department_position (department_id, position_id) VALUES (77, 84);	
	print 'department_position done';
end

print 'insert data into the requeriments table';
if(select count(*) from dbo.requirements)=0
begin
	set identity_insert dbo.requirements on;
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (3, '2018-05-27 23:56:43', null, 'Titulo en Administrador de empresas', 'Administrador de empresas', 2);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (4, '2018-05-27 23:56:43', null, 'Formación académica en Administrador de empresas', 'Formación académica', 2);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (5, '2018-05-27 23:56:43', null, 'Más de 3 años de experiencia  en cargos similares de Jefatura dentro el área de mantenimiento, fiscalización de obras y administración de proyectos.', 'Experiencia', 2);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (17, '2018-05-27 23:56:44', null, 'Titulo en Administrador de empresas', 'Administrador de empresas', 11);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (18, '2018-05-27 23:56:44', null, 'Formación académica en Administrador de empresas', 'Formación académica', 11);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (19, '2018-05-27 23:56:44', null, 'Más de 3 años de experiencia  en cargos similares de Jefatura dentro el área de mantenimiento, fiscalización de obras y administración de proyectos.', 'Experiencia', 11);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (24, '2018-05-27 23:56:44', null, 'Titulo en Administrador de empresas', 'Administrador de empresas', 15);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (25, '2018-05-27 23:56:44', null, 'Formación académica en Administrador de empresas', 'Formación académica', 15);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (26, '2018-05-27 23:56:44', null, 'Más de 3 años de experiencia  en cargos similares de Jefatura dentro el área de mantenimiento, fiscalización de obras y administración de proyectos.', 'Experiencia', 15);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (31, '2018-05-27 23:56:44', null, 'Titulo en Administrador de empresas', 'Administrador de empresas', 13);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (32, '2018-05-27 23:56:44', null, 'Formación académica en Administrador de empresas', 'Formación académica', 13);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (33, '2018-05-27 23:56:44', null, 'Más de 3 años de experiencia  en cargos similares de Jefatura dentro el área de mantenimiento, fiscalización de obras y administración de proyectos.', 'Experiencia', 13);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (38, '2018-05-27 23:56:44', null, 'Titulo en Administrador de empresas', 'Administrador de empresas', 16);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (39, '2018-05-27 23:56:44', null, 'Formación académica en Administrador de empresas', 'Formación académica', 16);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (40, '2018-05-27 23:56:44', null, 'Más de 3 años de experiencia  en cargos similares de Jefatura dentro el área de mantenimiento, fiscalización de obras y administración de proyectos.', 'Experiencia', 16);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (45, '2018-05-27 23:56:44', null, 'Titulo en Administrador de empresas', 'Administrador de empresas', 12);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (46, '2018-05-27 23:56:44', null, 'Formación académica en Administrador de empresas', 'Formación académica', 12);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (47, '2018-05-27 23:56:44', null, 'Más de 3 años de experiencia  en cargos similares de Jefatura dentro el área de mantenimiento, fiscalización de obras y administración de proyectos.', 'Experiencia', 12);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (52, '2018-05-27 23:56:44', null, 'Titulo en Administrador de empresas', 'Administrador de empresas', 14);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (53, '2018-05-27 23:56:44', null, 'Formación académica en Administrador de empresas', 'Formación académica', 14);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (54, '2018-05-27 23:56:44', null, 'Más de 3 años de experiencia  en cargos similares de Jefatura dentro el área de mantenimiento, fiscalización de obras y administración de proyectos.', 'Experiencia', 14);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (61, '2018-05-27 23:56:44', null, 'Titulo en Administrador de empresas', 'Administrador de empresas', 60);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (62, '2018-05-27 23:56:44', null, 'Formación académica en Administrador de empresas', 'Formación académica', 60);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (63, '2018-05-27 23:56:44', null, 'Más de 3 años de experiencia  en cargos similares de Jefatura dentro el área de mantenimiento, fiscalización de obras y administración de proyectos.', 'Experiencia', 60);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (70, '2018-05-27 23:56:44', null, 'Titulo en Administrador de empresas', 'Administrador de empresas', 69);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (71, '2018-05-27 23:56:44', null, 'Formación académica en Administrador de empresas', 'Formación académica', 69);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (72, '2018-05-27 23:56:44', null, 'Más de 3 años de experiencia  en cargos similares de Jefatura dentro el área de mantenimiento, fiscalización de obras y administración de proyectos.', 'Experiencia', 69);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (85, '2018-05-27 23:56:44', null, 'Titulo en Administrador de empresas', 'Administrador de empresas', 81);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (86, '2018-05-27 23:56:44', null, 'Formación académica en Administrador de empresas', 'Formación académica', 81);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (87, '2018-05-27 23:56:44', null, 'Más de 3 años de experiencia  en cargos similares de Jefatura dentro el área de mantenimiento, fiscalización de obras y administración de proyectos.', 'Experiencia', 81);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (92, '2018-05-27 23:56:44', null, 'Titulo en Administrador de empresas', 'Administrador de empresas', 79);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (93, '2018-05-27 23:56:44', null, 'Formación académica en Administrador de empresas', 'Formación académica', 79);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (94, '2018-05-27 23:56:44', null, 'Más de 3 años de experiencia  en cargos similares de Jefatura dentro el área de mantenimiento, fiscalización de obras y administración de proyectos.', 'Experiencia', 79);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (99, '2018-05-27 23:56:44', null, 'Titulo en Administrador de empresas', 'Administrador de empresas', 82);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (100, '2018-05-27 23:56:44', null, 'Formación académica en Administrador de empresas', 'Formación académica', 82);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (101, '2018-05-27 23:56:44', null, 'Más de 3 años de experiencia  en cargos similares de Jefatura dentro el área de mantenimiento, fiscalización de obras y administración de proyectos.', 'Experiencia', 82);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (106, '2018-05-27 23:56:44', null, 'Titulo en Administrador de empresas', 'Administrador de empresas', 83);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (107, '2018-05-27 23:56:44', null, 'Formación académica en Administrador de empresas', 'Formación académica', 83);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (108, '2018-05-27 23:56:44', null, 'Más de 3 años de experiencia  en cargos similares de Jefatura dentro el área de mantenimiento, fiscalización de obras y administración de proyectos.', 'Experiencia', 83);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (127, '2018-05-27 23:56:44', null, 'Titulo en Administrador de empresas', 'Administrador de empresas', 84);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (128, '2018-05-27 23:56:44', null, 'Formación académica en Administrador de empresas', 'Formación académica', 84);
	INSERT INTO dbo.requirements (requiriment_id, created_on, updated_on, requiriment_description, requiriment_name, position_position_id) VALUES (129, '2018-05-27 23:56:44', null, 'Más de 3 años de experiencia  en cargos similares de Jefatura dentro el área de mantenimiento, fiscalización de obras y administración de proyectos.', 'Experiencia', 84);
	set identity_insert dbo.requirements off;
	print 'requeriments done';
end

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

print 'insert data into the personal_position_contract table';
if(select count(*) from dbo.[personal_position_contract])=0
begin
	set identity_insert dbo.[personal_position_contract] on;
	INSERT INTO [dbo].[personal_position_contract]([pers_pos_contract_id],[created_on],[updated_on],[pers_pos_contract_end_date],[pers_pos_contract_init_date],[pers_pos_contract_status],[pers_pos_contract_turno],[contract_id],[personal_id],[position_id])VALUES(1,'2015-05-27 23:56:44',null,null,'2015-05-27 23:56:44',1,'dia',1,1,11);
	INSERT INTO [dbo].[personal_position_contract]([pers_pos_contract_id],[created_on],[updated_on],[pers_pos_contract_end_date],[pers_pos_contract_init_date],[pers_pos_contract_status],[pers_pos_contract_turno],[contract_id],[personal_id],[position_id]) VALUES(2,'2015-05-27 23:56:44',null,null,'2015-05-27 23:56:44',1,'dia',1,2,12);
	INSERT INTO [dbo].[personal_position_contract]([pers_pos_contract_id],[created_on],[updated_on],[pers_pos_contract_end_date],[pers_pos_contract_init_date],[pers_pos_contract_status],[pers_pos_contract_turno],[contract_id],[personal_id],[position_id]) VALUES(3,'2015-05-27 23:56:44',null,null,'2015-05-27 23:56:44',1,'dia',1,3,13);
	set identity_insert dbo.[personal_position_contract] off;
	print 'personal_position_contract done';
end

COMMIT TRANSACTION;

