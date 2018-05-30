-- CREATE Kardex_equipament stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_create_kardex_equipament]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_create_kardex_equipament]
END
GO
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
			   ,@equipament_id BIGINT
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
						 ,created_on
						 ,equipament_id)
    VALUES (  @balance_kardex
			 ,@entry_kardex
			 ,@outlay_kardex
			 ,@date_kardex
			 ,GETDATE()
			 ,@equipament_id);
	SELECT @@IDENTITY AS kardex_id;
END
GO