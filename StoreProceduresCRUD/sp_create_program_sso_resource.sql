-- Create Program_sso_resource stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_create_program_sso_resource]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_create_program_sso_resource]
END
GO
/******************************************************************************
**  Name: sp_create_program_sso_resource
**  Desc: Inserts an new Program_sso_resource
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
CREATE PROCEDURE [dbo].[sp_create_program_sso_resource]
(
	 @resource_cost FLOAT
	,@resource_detail VARCHAR(200)
	,@result BIT OUTPUT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO [dbo].[program_sso_resource](
			 sso_resource_cost
			,sso_resource_detail)
	VALUES ( @resource_cost
			,@resource_detail);
	SET @result = 1;
    RETURN @result; 
	PRINT 'Procedure [dbo].[sp_create_program_sso_resource] created';
END
GO

