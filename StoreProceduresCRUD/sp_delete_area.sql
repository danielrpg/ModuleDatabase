IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_delete_area]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_delete_area]
END
GO

-- Drop AREA CRUD PROCEDURES
/******************************************************************************
**  Table Name: area
**  Desc: Table for sp_delete_area
** 
**  Called by: ssi
**
**  Author: Gilmer Daniel Fernandez Pinto
**
**  Date: 05/29/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/29/2018 Gilmer Daniel Fernandez Pinto   Initial version
*******************************************************************************/
CREATE PROCEDURE [dbo].[sp_delete_area](
    @area_id INT
   ,@result BIT OUTPUT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN 
    
    DELETE FROM [dbo].[areas]
    WHERE area_id = @area_id;

    SET @result = 1;
    
    RETURN @result; 
END
GO