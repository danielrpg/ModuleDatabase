IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[sp_get_incident]') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
	BEGIN
		DROP PROCEDURE sp_get_incident
		PRINT 'SE HA ELIMINADO EL SP sp_get_incident';
	END
GO

--Creacion del store procedure
/******************************************************************************
**  Name: sp_get_incident
**  Desc:  SP for get incident
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

CREATE PROCEDURE [dbo].[sp_get_incident]
(	
	@incident_id bigint = NULL
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	SELECT [incident_id]
      ,[code]
      ,[date_at]
      ,[incident_number]
      ,[recurrence]
      ,[reincident]
      ,[reported_by]
      ,[severity]
      ,[treatment]
      ,[incident_detail_id]
      ,[incident_type_id]
      ,[personal_id]
  FROM [dbo].[incident]
  WHERE [incident_id] = ISNULL(@incident_id, [incident_id])
END
GO