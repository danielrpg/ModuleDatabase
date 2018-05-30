-- Create Position stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_create_position]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_create_position]
END
GO
-- Create Position CRUD PROCEDURES
/******************************************************************************
**  Table Name: Position
**  Desc: Table for [dbo].[sp_create_position]
** 
**  Called by: SSI
**
**  Author: Ivan Misericordia Eulate
**
**  Date: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/27/2018 Ivan Misericordia Eulate   Initial version
*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_create_position](
				@position_description VARCHAR(800)
			   ,@position_level INT
			   ,@positon_name VARCHAR(300)
			   ,@parent_position_position_id BIGINT
)
AS 
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

    INSERT INTO [dbo].[position](position_description
								,position_level
								,position_name
								,parent_position_position_id
								,created_on)
    VALUES ( @position_description
			,@position_level
			,@positon_name
			,@parent_position_position_id
			,GETDATE());

  SELECT @@IDENTITY AS position_id;
END