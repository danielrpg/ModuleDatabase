-- Drop User CRUD PROCEDURES
/******************************************************************************
**  Table Name: users
**  Desc: Table for sp_edit_user
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