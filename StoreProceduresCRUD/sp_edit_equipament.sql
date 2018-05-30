-- UPDATE Equipament stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_edit_equipament]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_edit_equipament]
END
GO
-- Update Equipament CRUD PROCEDURES
/******************************************************************************
**  Table Name: Equipaments
**  Desc: Table for sp_edit_equipament
** 
**  Called by: ssi
**
**  Author: Ivan Misericordia Eulate
**
**  Date: 05/27/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        -------------------------------------------------
** 05/27/2018 Ivan Misericordia Eulate   Initial version
*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_edit_equipament](
			    @equipament_id INT
			   ,@equipament_name VARCHAR(50)
			   ,@equipament_type INT
			   ,@equipament_description VARCHAR(200)
			   ,@equipament_image VARBINARY(MAX)
)
AS 
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

    UPDATE [dbo].[equipaments]
    SET equipament_name = @equipament_name
	   ,equipament_type = @equipament_type
	   ,equipament_description = @equipament_description
	   ,equipament_image = @equipament_image
	   ,created_on = GETDATE()
    WHERE equipament_id = @equipament_id;

    SELECT [equipament_id]
      ,[created_on]
      ,[updated_on]
      ,[equipament_description]
      ,[equipament_image]
      ,[equipament_name]
      ,[equipament_type]
      ,[assign_equipament_assign_id]
  FROM [dbo].[equipaments]
    WHERE equipament_id = @equipament_id;

	SELECT @@IDENTITY AS equipament_id;

END
GO
