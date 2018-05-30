-- DELETE Program_sso_trainer stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_delete_program_sso_trainer]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_delete_program_sso_trainer]
END
GO
/******************************************************************************
**  Name: sp_delete_program_sso_trainer
**  Desc: delete an Program_sso_trainer
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
CREATE PROCEDURE [dbo].[sp_delete_program_sso_trainer](
    @sso_trainer_id BIGINT
   ,@result BIT OUTPUT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN 
    
    DELETE FROM [dbo].[program_sso_trainer]
    WHERE sso_trainer_id = @sso_trainer_id;

    SET @result = 1;
    
    RETURN @result; 
END
GO
