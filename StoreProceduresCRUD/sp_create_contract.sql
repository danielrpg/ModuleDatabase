-- Drop User CRUD PROCEDURES
/******************************************************************************
**  Table Name: contract
**  Desc: Table for sp_create_contract
** 
**  Called by: ssi
**
**  Author: Gilmer Daniel Fernandez Pinto
**
**  Date: 05/27/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/27/2018 Gilmer Daniel Fernandez Pinto   Initial version
*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_create_contract](
    @contract_code VARCHAR(50)
   ,@contract_city VARCHAR(100)
   ,@contract_type VARCHAR(100)
   ,@contract_date DATETIME
   ,@contract_salary FLOAT
   ,@contract_description VARCHAR(100)
   ,@result BIT OUTPUT
)
AS 
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

    INSERT INTO [dbo].[contracts]
    (contract_code, contract_city, contract_type, contract_date
    , contract_salary, contract_description, created_on)
    VALUES (@contract_code, @contract_city, @contract_type, @contract_date
           , @contract_salary, @contract_description ,GETDATE());

    SET @result = 1;

    RETURN @result; 
END