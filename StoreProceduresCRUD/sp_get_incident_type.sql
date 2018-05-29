IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[sp_get_incident_type]') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
	BEGIN
		DROP PROCEDURE sp_get_incident_type
		PRINT 'SE HA ELIMINADO EL SP sp_get_incident_type';
	END
GO

--Creacion del store procedure
/******************************************************************************
**  Name: sp_get_incident_type
**  Desc:  SP for GET incident type
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


CREATE PROCEDURE [dbo].[sp_get_incident_type]
(
	@incident_type_id bigint = NULL    
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	SELECT [incident_type_id]
      ,[incident_sub_type]
      ,[incident_type]
      ,[incident_type_description]
      ,[incident_type_name]
  FROM [dbo].[incident_type]
  WHERE [incident_type_id] = ISNULL(@incident_type_id,[incident_type_id]) 
END
GO