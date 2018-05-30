-- UPDATE Program_sso_trainer stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_edit_program_sso_trainer]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_edit_program_sso_trainer]
END
GO
/******************************************************************************
**  Name: sp_edit_program_sso_trainer
**  Desc: Update an Program_sso_trainer
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
CREATE PROCEDURE [dbo].[sp_edit_program_sso_trainer]
(
	 @sso_trainer_id BIGINT
	,@trainer_skills VARCHAR(250)
	,@trainer_ci VARCHAR(10)
	,@trainer_image VARBINARY(MAX)
	,@trainer_name VARCHAR(100)
	,@trainer_specialty VARCHAR(255)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE [dbo].[program_sso_trainer]
	SET		 sso_trainer_skills = @trainer_skills
			,sso_trainer_ci = @trainer_ci
			,sso_trainer_image = @trainer_image
			,sso_trainer_name = @trainer_name
			,sso_trainer_specialty = @trainer_specialty
	WHERE sso_trainer_id = @sso_trainer_id;

	SELECT [sso_trainer_id]
	      ,[created_on]
	      ,[updated_on]
	      ,[sso_trainer_skills]
	      ,[sso_trainer_ci]
	      ,[sso_trainer_image]
	      ,[sso_trainer_name]
	      ,[sso_trainer_specialty]
	  FROM [dbo].[program_sso_trainer]
	WHERE sso_trainer_id = @sso_trainer_id;

	PRINT 'Procedure [dbo].[sp_edit_program_sso_trainer] created';
END
GO
