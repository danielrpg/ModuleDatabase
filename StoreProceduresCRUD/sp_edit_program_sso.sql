-- UPDATE Program_sso stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_edit_program_sso]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_edit_program_sso]
END
GO
/******************************************************************************
**  Name: sp_edit_program_sso
**  Desc: Update an Program_sso
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
CREATE PROCEDURE [dbo].[sp_edit_program_sso]
(
	 @sso_id BIGINT
	,@execution_time VARCHAR(250)
	,@goal VARCHAR(250)
	,@indicator VARCHAR(250)
	,@objetive VARCHAR(250)
	,@responsable VARCHAR(250)
	,@total_cost FLOAT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE [dbo].[program_sso]
	SET		 sso_execution_time = @execution_time
			,sso_goal = @goal
			,sso_indicator = @indicator
			,sso_objetive = @objetive
			,sso_responsable = @responsable
			,sso_total_cost = @total_cost
	WHERE sso_id = @sso_id;

	SELECT  [sso_id]
	      ,[created_on]
	      ,[updated_on]
	      ,[sso_execution_time]
	      ,[sso_goal]
	      ,[sso_indicator]
	      ,[sso_objetive]
	      ,[sso_responsable]
	      ,[sso_total_cost]
	  FROM [dbo].[program_sso]
	WHERE sso_id = @sso_id;

	PRINT 'Procedure [dbo].[sp_edit_program_sso] created';
END
GO
