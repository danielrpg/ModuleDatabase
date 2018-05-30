IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_edit_department]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_edit_department]
END
GO
-- Drop DEPARTMENT CRUD PROCEDURES
/******************************************************************************
**  Table Name: contract
**  Desc: Table for sp_edit_department
**
**  Called by: ssi
**
**  Author: Gilmer Daniel Fernandez Pinto
**
**  Date: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/28/2018 Gilmer Daniel Fernandez Pinto   Initial version
*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_edit_department](
    @department_id INT
   ,@department_description VARCHAR(100)
   ,@department_name VARCHAR(50)
)
AS 
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

    UPDATE [dbo].[department]
    SET department_name         = @department_name
        ,department_description = @department_description 
        ,updated_on             = GETDATE()
    WHERE department_id         = @department_id;

    SELECT  [department_id]
      ,[created_on]
      ,[updated_on]
      ,[department_description]
      ,[department_name]
    FROM [dbo].[department]
    WHERE department_id = @department_id;

END
GO
