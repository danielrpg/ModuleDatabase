print 'insert data into the equipament table';
if(select count(*) from dbo.equipaments)=0
begin
	set identity_insert dbo.equipaments on;
	INSERT INTO dbo.equipaments (equipament_id, created_on, updated_on, equipament_description, equipament_image, equipament_name, equipament_type) VALUES (1, '2018-01-28 08:13:25', null, 'Casco tipo Jokey', 0x, 'Helmmet', 1);
	INSERT INTO dbo.equipaments (equipament_id, created_on, updated_on, equipament_description, equipament_image, equipament_name, equipament_type) VALUES (2, '2018-02-28 11:13:25', null, 'Taladro electrico portatil bosch', 0x, 'Electric Drill', 2);
	INSERT INTO dbo.equipaments (equipament_id, created_on, updated_on, equipament_description, equipament_image, equipament_name, equipament_type) VALUES (3, '2018-03-28 15:13:25', null, 'Casco tipo Jokey de ala Ancha', 0x, 'Helmmet2', 1);
	INSERT INTO dbo.equipaments (equipament_id, created_on, updated_on, equipament_description, equipament_image, equipament_name, equipament_type) VALUES (4, '2018-04-28 16:13:25', null, 'Taladro electrico de banca bosch', 0x, 'Drill', 2);
	INSERT INTO dbo.equipaments (equipament_id, created_on, updated_on, equipament_description, equipament_image, equipament_name, equipament_type) VALUES (5, '2018-05-28 09:13:25', null, 'CUERDA SISAL', 0x, 'rope', 1);
	INSERT INTO dbo.equipaments (equipament_id, created_on, updated_on, equipament_description, equipament_image, equipament_name, equipament_type) VALUES (6, '2018-05-28 15:13:25', null, 'EXTENSIBLE INDUSTRIAL IP-55', 0x, 'rope', 1);
	INSERT INTO dbo.equipaments (equipament_id, created_on, updated_on, equipament_description, equipament_image, equipament_name, equipament_type) VALUES (7, '2018-05-28 15:13:25', null, 'ALCOTANA 5931-A', 0x, 'rope', 1);
	INSERT INTO dbo.equipaments (equipament_id, created_on, updated_on, equipament_description, equipament_image, equipament_name, equipament_type) VALUES (8, '2018-05-28 15:13:25', null, 'ALICATE ARANDELA 4411J0', 0x, 'alicate', 1);
	INSERT INTO dbo.equipaments (equipament_id, created_on, updated_on, equipament_description, equipament_image, equipament_name, equipament_type) VALUES (9, '2018-05-28 15:13:25', null, 'ALICATE ARANDELA 4411J1', 0x, 'alicate', 1);
	INSERT INTO dbo.equipaments (equipament_id, created_on, updated_on, equipament_description, equipament_image, equipament_name, equipament_type) VALUES (10, '2018-05-28 15:13:25', null, 'ALICATE ARANDELA 4411J2', 0x, 'alicate', 1);
	INSERT INTO dbo.equipaments (equipament_id, created_on, updated_on, equipament_description, equipament_image, equipament_name, equipament_type) VALUES (11, '2018-05-28 15:13:25', null, 'ALICATE ARANDELA 4411J3', 0x, 'alicate', 1);
	INSERT INTO dbo.equipaments (equipament_id, created_on, updated_on, equipament_description, equipament_image, equipament_name, equipament_type) VALUES (12, '2018-05-28 15:13:25', null, 'ALICATE ARANDELA 4411J4', 0x, 'alicate', 1);
	INSERT INTO dbo.equipaments (equipament_id, created_on, updated_on, equipament_description, equipament_image, equipament_name, equipament_type) VALUES (13, '2018-05-28 15:13:25', null, 'ALICATE ARANDELA EXT 4611A0', 0x, 'alicate', 1);
	INSERT INTO dbo.equipaments (equipament_id, created_on, updated_on, equipament_description, equipament_image, equipament_name, equipament_type) VALUES (14, '2018-05-28 15:13:25', null, 'ALICATE ARANDELA EXT 4611A3', 0x, 'alicate', 1);
	INSERT INTO dbo.equipaments (equipament_id, created_on, updated_on, equipament_description, equipament_image, equipament_name, equipament_type) VALUES (15, '2018-05-28 15:13:25', null, 'ALICATE ARANDELA EXT 4611A4', 0x, 'alicate', 1);
	set identity_insert dbo.equipaments off;
	print 'equipament done';
end
