-- Create Program_sso_trainer stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_create_program_sso_trainer]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_create_program_sso_trainer]
END
GO
/******************************************************************************
**  Name: sp_create_program_sso_trainer
**  Desc: Inserts an new Program_sso_trainer
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
CREATE PROCEDURE [dbo].[sp_create_program_sso_trainer]
(
	 @trainer_skills VARCHAR(250)
	,@trainer_ci VARCHAR(10)
	,@trainer_image VARBINARY(MAX)
	,@trainer_name VARCHAR(100)
	,@trainer_specialty VARCHAR(255)
	,@result BIT OUTPUT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO [dbo].[program_sso_trainer](
			 sso_trainer_skills
			,sso_trainer_ci
			,sso_trainer_image
			,sso_trainer_name
			,sso_trainer_specialty)
	VALUES ( @trainer_skills
			,@trainer_ci
			,@trainer_image
			,@trainer_name
			,@trainer_specialty);
	SET @result = 1;
    RETURN @result; 
	PRINT 'Procedure [dbo].[sp_create_program_sso_trainer] created';
END
GO
