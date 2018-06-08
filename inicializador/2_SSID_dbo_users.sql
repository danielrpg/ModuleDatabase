print 'insert data into the users table';
if(select count(*) from dbo.users)=0
begin
	set identity_insert dbo.users on;
	INSERT INTO dbo.users (user_id, created_on, updated_on, user_password, user_active, user_name) VALUES (1, '2018-05-27 23:56:43', null, '$2a$10$XURPShQNCsLjp1ESc2laoObo9QZDhxz73hJPaEv7/cBha4pk0AgP.', 1, 'admin');
	set identity_insert dbo.users off;
	print 'users table done';			
end
