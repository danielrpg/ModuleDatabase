IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_create_user]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_create_user]
END
GO
-- Drop User CRUD PROCEDURES
/******************************************************************************
**  Table Name: users
**  Desc: Table for sp_crete_user
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

    SET @result = @@IDENTITY;

    RETURN @result; 
END