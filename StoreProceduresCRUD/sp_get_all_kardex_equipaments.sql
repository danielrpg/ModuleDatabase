-- GET Equipament stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_get_all_kardex_equipaments]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_get_all_kardex_equipaments]
END
GO
-- Kardex_equipaments CRUD PROCEDURES
/******************************************************************************
**  Table Name: Kardex_equipaments
**  Desc: Table for sp_get_all_kardex_equipaments
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

CREATE PROCEDURE [dbo].[sp_get_all_kardex_equipaments](
	@kardex_id BIGINT = null
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    SELECT kardex.equipament_kardex_id
		  ,kardex.date_kardex
		  ,kardex.entry_kardex
		  ,kardex.outlay_kardex
		  ,kardex.balance_kardex
		  ,kardex.equipament_id
	FROM [dbo].[kardex_equipaments] as kardex
	WHERE kardex.equipament_kardex_id = ISNULL(@kardex_id, kardex.equipament_kardex_id);
END
GO