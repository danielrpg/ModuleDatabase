IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_create_area]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_create_area]
END
GO


-- Drop AREA CRUD PROCEDURES
/******************************************************************************
**  Table Name: area
**  Desc: Table for sp_create_area
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

CREATE PROCEDURE [dbo].[sp_create_area](
    @area_name VARCHAR(50)
   ,@area_description VARCHAR(100)
   ,@result BIT OUTPUT  --resultado
)
AS 
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

    INSERT INTO [dbo].[areas]
    (area_name, area_description, created_on)
    VALUES (@area_name, @area_description, GETDATE());

    SET @result = @@IDENTITY;

    RETURN @result; 
END
GO