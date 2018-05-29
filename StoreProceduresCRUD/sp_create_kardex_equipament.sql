-- Create Kardex_equipaments CRUD PROCEDURES
/******************************************************************************
**  Table Name: Kardex_equipaments
**  Desc: Table for sp_create_kardex_equipament
** 
**  Called by: ssi
**
**  Author: Ivan Misericordia Eulate
**
**  Date: 05/27/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/27/2018 Ivan Misericordia Eulate   Initial version
*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_create_kardex_equipament](
				@balance_kardex INT
			   ,@entry_kardex INT
			   ,@outlay_kardex INT
			   ,@date_kardex DATETIME
			   ,@result BIT OUTPUT
)
AS 
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

    INSERT INTO [dbo].[kardex_equipaments](
						  balance_kardex
						 ,entry_kardex
						 ,outlay_kardex
						 ,date_kardex
						 ,created_on)
    VALUES (  @balance_kardex
			 ,@entry_kardex
			 ,@outlay_kardex
			 ,@date_kardex
			 ,GETDATE());

    SET @result = 1;

    RETURN @result; 
END