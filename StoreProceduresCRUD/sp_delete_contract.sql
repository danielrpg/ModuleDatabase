IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_delete_contract]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_delete_contract]
END
GO

-- Drop User CRUD PROCEDURES
/******************************************************************************
**  Table Name: contract
**  Desc: Table for sp_delete_contract
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
CREATE PROCEDURE [dbo].[sp_delete_contract](
    @contract_id INT
   ,@result BIT OUTPUT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN 
    
    DELETE FROM [dbo].[contracts]
    WHERE contract_id = @contract_id;

    SET @result = 1;
    
    RETURN @result; 
END
GO
