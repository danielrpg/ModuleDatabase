IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_create_personal]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_create_personal]
END
GO

-- Drop User CRUD PROCEDURES
/******************************************************************************
**  Table Name: personals
**  Desc: Table for sp_create_personal
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

CREATE PROCEDURE [dbo].[sp_create_personal](
    @personal_name VARCHAR(100)
   ,@personal_last_name VARCHAR(100)
   ,@personal_email VARCHAR(200)
   ,@personal_direction VARCHAR(200)
   ,@personal_cellphone VARCHAR(100)
   ,@personal_telephone VARCHAR(100)
   ,@personal_active INT
   ,@result BIT OUTPUT
)
AS 
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

    INSERT INTO [dbo].[personals]
    (personal_name, personal_last_name, personal_email, personal_direction
    , personal_cellphone, personal_telephone ,personal_active, created_on)
    VALUES (@personal_name, @personal_last_name, @personal_email, @personal_direction
           , @personal_cellphone, @personal_telephone ,@personal_active, GETDATE());

    SET @result = @@IDENTITY;

    RETURN @result; 
END