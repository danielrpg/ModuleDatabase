CREATE PROCEDURE [dbo].[sp_delete_user](
    @user_id INT
   ,@result BIT OUTPUT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN 
    
    DELETE FROM [dbo].[users]
    WHERE user_id = @user_id;

    SET @result = 1;
    
    RETURN @result; 
END