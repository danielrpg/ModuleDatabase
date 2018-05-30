-- UPDATE Program_sso_resource stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_edit_program_sso_resource]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_edit_program_sso_resource]
END
GO
/******************************************************************************
**  Name: sp_edit_program_sso_resource
**  Desc: Update an Program_sso_resource
** 
**  Called by: ssi
**
**  Author: Ivan Misericordia E.
**
**  Date: 28/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 28/05/2018 Ivan Misericordia E.   Initial version
*******************************************************************************/
CREATE PROCEDURE [dbo].[sp_edit_program_sso_resource]
(
	 @sso_resource_id BIGINT
	,@resource_cost FLOAT
	,@resource_detail VARCHAR(250)
	
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE [dbo].[program_sso_resource]
	SET		 sso_resource_cost = @resource_cost
			,sso_resource_detail = @resource_detail
	WHERE sso_resource_id = @sso_resource_id;

	SELECT  [sso_resource_id]
	      ,[created_on]
	      ,[updated_on]
	      ,[sso_resource_cost]
	      ,[sso_resource_detail]
	      ,[sso_detail_id]
	  FROM [dbo].[program_sso_resource]
	WHERE sso_resource_id = @sso_resource_id;

	PRINT 'Procedure [dbo].[sp_edit_program_sso_resource] created';
END
GO
