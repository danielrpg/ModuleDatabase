CREATE PROCEDURE [dbo].[sp_edit_user](
    @user_id INT
   ,@user_name VARCHAR(100) 
   ,@user_password VARCHAR(200)
   ,@user_active INT
)
AS 
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

    UPDATE [dbo].[users]
    SET user_name      = @user_name
        ,user_password = @user_password
        ,user_active   = @user_active
        ,updated_on    =  GETDATE()
    WHERE user_id = @user_id;

    SELECT *
    FROM [dbo].[users]
    WHERE user_id = @user_id;

END