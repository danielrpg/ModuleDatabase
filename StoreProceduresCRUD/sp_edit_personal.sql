IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_edit_personal]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_edit_personal]
END
GO
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
   ,@personal_name VARCHAR(100)
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
    SET personal_name       = @personal_name
        ,personal_last_name = @personal_last_name
        ,personal_email     = @personal_email
        ,personal_direction = @personal_direction
        ,personal_cellphone = @personal_cellphone
        ,personal_telephone = @personal_telephone
        ,personal_active    = @personal_active
        ,updated_on    =  GETDATE()
    WHERE personal_id = @personal_id;

    SELECT  [personal_id]
      ,[created_on]
      ,[updated_on]
      ,[personal_active]
      ,[personal_direction]
      ,[personal_cellphone]
      ,[personal_email]
      ,[personal_last_name]
      ,[personal_name]
      ,[personal_photo]
      ,[personal_telephone]
      ,[area_area_id]
      ,[assign_equipament_assign_id]
  FROM [dbo].[personals]
    WHERE personal_id = @personal_id;

END
GO
