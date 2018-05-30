-- Drop User CRUD PROCEDURES
/******************************************************************************
**  Table Name: users
**  Desc: Table for sp_delete_user
** 
**  Called by: ssi
**
**  Author: Gilmer Daniel Fernandez Pinto
**
**  Date: 05/26/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/26/2018 Gilmer Daniel Fernandez Pinto   Initial version
*******************************************************************************/
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
GO
