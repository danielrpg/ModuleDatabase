-- UPDATE position stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_edit_position]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_edit_position]
END
GO
-- UPDATE position CRUD PROCEDURES
/******************************************************************************
**  Table Name: position
**  Desc: Table for [dbo].[sp_edit_position]
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
CREATE PROCEDURE [dbo].[sp_edit_position](
			    @position_id BIGINT
			   ,@position_description VARCHAR(800)
			   ,@position_level INT
			   ,@position_name VARCHAR(300)
			   ,@parent_position_position_id BIGINT
)
AS 
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE [dbo].[position]
	SET 
       [position_description] = @position_description
      ,[position_level] = @position_level
      ,[position_name] = @position_name
      ,[parent_position_position_id] = @parent_position_position_id
	  ,[created_on] = GETDATE()
	WHERE [position_id] = @position_id;

	SELECT [position_id]
      ,[created_on]
      ,[updated_on]
      ,[position_description]
      ,[position_level]
      ,[position_name]
      ,[parent_position_position_id]
	FROM [dbo].[position]
	WHERE [position_id] = @position_id;

  SELECT @@IDENTITY AS position_id;
END
GO


