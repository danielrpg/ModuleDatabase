-- Create Program_sso stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_create_program_sso]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_create_program_sso]
END
GO
/******************************************************************************
**  Name: sp_create_program_sso
**  Desc: Inserts an new Program_sso
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
CREATE PROCEDURE [dbo].[sp_create_program_sso]
(
	 @execution_time VARCHAR(250)
	,@goal VARCHAR(250)
	,@indicator VARCHAR(250)
	,@objetive VARCHAR(250)
	,@responsable VARCHAR(250)
	,@total_cost FLOAT
	,@result BIT OUTPUT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO [dbo].[program_sso](
			 sso_execution_time
			,sso_goal
			,sso_indicator
			,sso_objetive
			,sso_responsable
			,sso_total_cost)
	VALUES ( @execution_time
			,@goal
			,@indicator
			,@objetive
			,@responsable
			,@total_cost);
	SET @result = 1;
    RETURN @result; 
	PRINT 'Procedure [dbo].[sp_create_program_sso] created';
END

