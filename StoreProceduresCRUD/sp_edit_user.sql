-- Drop User CRUD PROCEDURES
/******************************************************************************
**  Table Name: personal
**  Desc: Table for sp_edit_personal
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

CREATE PROCEDURE [dbo].[sp_edit_personal](
    @personal_id INT
    @personal_name VARCHAR(100)
   ,@personal_last_name VARCHAR(100)
   ,@personal_email VARCHAR(200)
   ,@personal_direction VARCHAR(200)
   ,@personal_cellphone VARCHAR(100)
   ,@personal_telephone VARCHAR(100)
   ,@personal_active INT
)
AS 
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

    UPDATE [dbo].[personals]
    SET user_name      = @user_name
        ,user_password = @user_password
        ,user_active   = @user_active
        ,updated_on    =  GETDATE()
    WHERE user_id = @user_id;

    SELECT *
    FROM [dbo].[personals]
    WHERE user_id = @user_id;

END