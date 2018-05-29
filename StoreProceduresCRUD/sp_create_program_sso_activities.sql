-- Create Program_sso_activities stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_create_program_sso_activities]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_create_program_sso_activities]
END
GO
/******************************************************************************
**  Name: sp_create_program_sso_activities
**  Desc: Inserts an new Program_sso_activities
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
CREATE PROCEDURE [dbo].[sp_create_program_sso_activities]
(
	 @detail_activities VARCHAR(250)
	,@detail_goal VARCHAR(200)
	,@detail_number INT
	,@detail_time VARCHAR(250)
	,@detail_type VARCHAR(250)
	,@result BIT OUTPUT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO [dbo].[program_sso_activities](
			 sso_detail_activities
			,sso_detail_goal
			,so_detail_number
			,sso_detail_time
			,soo_detail_type)
	VALUES ( @detail_activities
			,@detail_goal
			,@detail_number
			,@detail_time
			,@detail_type);
	SET @result = 1;
    RETURN @result; 
	PRINT 'Procedure [dbo].[sp_create_program_sso_activities] created';
END

