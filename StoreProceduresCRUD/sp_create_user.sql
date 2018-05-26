CREATE PROCEDURE [dbo].[sp_create_user](
    @user_name VARCHAR(100)
   ,@user_password VARCHAR(200)
   ,@user_active INT
   ,@result BIT OUTPUT
)
AS 
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

    INSERT INTO [dbo].[users]
    (user_name, user_password, user_active, created_on)
    VALUES (@user_name, @user_password, @user_active, GETDATE());

    SET @result = 1;

    RETURN @result; 
END