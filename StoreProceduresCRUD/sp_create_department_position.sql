-- Create department_position stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_create_department_position]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_create_department_position]
END
GO
-- Create department_position CRUD PROCEDURES
/******************************************************************************
**  Table Name: department_position
**  Desc: Table for sp_create_department_position
** 
**  Called by: ssi
**
**  Author: Ivan Misericordia Eulate
**
**  Date: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/28/2018 Ivan Misericordia Eulate   Initial version
*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_create_department_position](
				@department_id BIGINT
			   ,@position_id BIGINT
)
AS 
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

    INSERT INTO [dbo].[department_position](
					department_id
				   ,position_id)
    VALUES ( @department_id
			,@position_id);

  SELECT @@IDENTITY AS department_position_id;
END