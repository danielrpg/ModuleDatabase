IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_create_department]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_create_department]
END
GO

-- Drop User CRUD PROCEDURES
/******************************************************************************
**  Table Name: department
**  Desc: Table for sp_create_department
** 
**  Called by: ssi
**
**  Author: Gilmer Daniel Fernandez Pinto
**
**  Date: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/28/2018 Gilmer Daniel Fernandez Pinto   Initial version
*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_create_department](
    @department_description VARCHAR(100)
   ,@department_name VARCHAR(50)
   ,@result BIT OUTPUT  --resultado
)
AS 
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

    INSERT INTO [dbo].[department]
    (department_description, department_name, created_on)
    VALUES (@department_description, @department_name, GETDATE());

    SET @result = @@IDENTITY;

    RETURN @result; 
END
