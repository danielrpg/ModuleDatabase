print 'insert data into the user_role';
if(select count(*) from dbo.user_role)=0
begin
	INSERT INTO dbo.user_role (user_id, role_id) VALUES (1, 1);
	print 'user_role table done';
end
-- End Users
