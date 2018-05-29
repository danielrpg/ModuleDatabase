IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[sp_create_incident_type]') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
	BEGIN
		DROP PROCEDURE sp_create_incident_type
		PRINT 'SE HA ELIMINADO EL SP sp_create_incident_type';
	END
GO

--Creacion del store procedure
/******************************************************************************
**  Name: sp_create_incident_type
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

CREATE PROCEDURE [dbo].[sp_create_incident_type]
(
	@incident_sub_type varchar(255)
    ,@incident_type varchar(255)
    ,@incident_type_description varchar(255)
    ,@incident_type_name varchar(255)    
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO [dbo].[incident_type]
           ([incident_sub_type]
           ,[incident_type]
           ,[incident_type_description]
           ,[incident_type_name])
     VALUES
           (@incident_sub_type
           ,@incident_type
           ,@incident_type_description
           ,@incident_type_name)

	SELECT @@IDENTITY AS incident_type_id;
END
GO