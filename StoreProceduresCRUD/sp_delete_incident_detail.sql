IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[sp_delete_incident_detail]') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
	BEGIN
		DROP PROCEDURE sp_delete_incident_detail
		PRINT 'SE HA ELIMINADO EL SP sp_delete_incident_detail';
	END
GO

--Creacion del store procedure
/******************************************************************************
**  Name: sp_delete_incident_detail
**  Desc:  SP for delete incident detail
**  Called by: SSI
**
**  Author: Marcos Bustos
**
**  Date: 28/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 28/05/2018 Marcos Bustos   Initial version
*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_delete_incident_detail]
(
	@incident_detail_id bigint  
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	DELETE FROM [dbo].[incident_detail]
	WHERE [incident_detail_id] = @incident_detail_id
END
GO
