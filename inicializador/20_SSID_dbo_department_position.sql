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
