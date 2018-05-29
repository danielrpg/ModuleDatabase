IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[sp_update_incident_type]') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
	BEGIN
		DROP PROCEDURE sp_update_incident_type
		PRINT 'SE HA ELIMINADO EL SP sp_update_incident_type';
	END
GO

--Creacion del store procedure
/******************************************************************************
**  Name: sp_update_incident_type
**  Desc:  SP for insert incident type
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

CREATE PROCEDURE [dbo].[sp_update_incident_type]
(
	@incident_type_id bigint
	,@incident_sub_type varchar(255)
    ,@incident_type varchar(255)
    ,@incident_type_description varchar(255)
    ,@incident_type_name varchar(255)    
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE [dbo].[incident_type]
   SET [incident_sub_type] = @incident_sub_type
      ,[incident_type] = @incident_type
      ,[incident_type_description] = @incident_type_description
      ,[incident_type_name] = @incident_type_name
 WHERE [incident_type_id] = @incident_type_id
END
GO