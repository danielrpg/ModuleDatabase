USE [SSID]
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[sp_update_incident_type]') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
	BEGIN
		DROP PROCEDURE sp_update_incident_type
		PRINT 'Store procedure deteled -  sp_update_incident_type';
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
	,@incident_sub_type varchar(50)
    ,@incident_type varchar(50)
    ,@incident_type_description varchar(max)
    ,@incident_type_name varchar(50)    
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE [dbo].[incident_type]
   SET [incident_type_subtype] = @incident_sub_type
      ,[incident_type_type] = @incident_type
      ,[incident_type_description] = @incident_type_description
      ,[incident_type_name] = @incident_type_name
 WHERE [incident_type_id] = @incident_type_id
END
GO
PRINT 'Store procedure Created! -  sp_update_incident_type';
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[sp_update_incident_detail]') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
	BEGIN
		DROP PROCEDURE sp_update_incident_detail
		PRINT 'Store procedure deteled -  sp_update_incident_detail';
	END
GO

--Creacion del store procedure
/******************************************************************************
**  Name: sp_update_incident_detail
**  Desc:  SP for update incident detail
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

CREATE PROCEDURE [dbo].[sp_update_incident_detail]
(
	@incident_detail_id bigint
	,@incident_detail_name varchar(50)
    ,@incident_detail_status varchar(15)
    ,@incident_detail_description varchar(200)   
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE [dbo].[incident_detail]
   SET [incident_detail_name] = @incident_detail_name
      ,[incident_detail_status] = @incident_detail_status
      ,[incident_detail_description] = @incident_detail_description
	WHERE [incident_detail_id] = @incident_detail_id
END
GO
PRINT 'Store procedure Created! -  sp_update_incident_detail';
GO


IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[sp_update_incident]') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
	BEGIN
		DROP PROCEDURE sp_update_incident
		PRINT 'Store procedure deteled -  sp_update_incident';
	END
GO

--Creacion del store procedure
/******************************************************************************
**  Name: sp_update_incident
**  Desc:  SP for update incident
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

CREATE PROCEDURE [dbo].[sp_update_incident]
(	@incident_id bigint
	,@incident_code varchar(10)
    ,@incident_registered_date datetime
    ,@incident_number int
    ,@incident_reincident bit
    ,@incident_reported_by varchar(100)
    ,@incident_severity varchar(100)
    ,@incident_treatment bit
    ,@incident_detail_id bigint
    ,@incident_type_id bigint
	,@personal_id bigint
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE [dbo].[incident]
   SET [incident_code] = @incident_code
      ,[incident_registered_date] = @incident_registered_date
      ,[incident_number] = @incident_number
      ,[incident_reincident] = @incident_reincident
      ,[incident_reported_by] = @incident_reported_by
      ,[incident_severity] = @incident_severity
      ,[incident_treatment] = @incident_treatment
      ,[incident_detail_id] = @incident_detail_id
      ,[incident_type_id] = @incident_type_id
      ,[personal_id] = @personal_id
 WHERE [incident_id] = @incident_id

	SELECT @@IDENTITY AS incident_id;
END
GO
PRINT 'Store procedure Created! -  sp_update_incident';
GO


IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_personal_by_id]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_personal_by_id]
	PRINT 'Store procedure deteled -  [sp_personal_by_id]';
END
GO
-- Personal CRUD PROCEDURES
/******************************************************************************
**  Table Name: personal
**  Desc: Table for sp_personal_by_id
** 
**  Called by: ssi
**
**  Author: Gilmer Daniel Fernandez Pinto
**
**  Date: 05/26/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/26/2018 Gilmer Daniel Fernandez Pinto   Initial version
*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_personal_by_id]
(
    @personal_id BIGINT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
   SELECT [personal_id]
      ,[created_on]
      ,[updated_on]
      ,[personal_active]
      ,[personal_direction]
      ,[personal_cellphone]
      ,[personal_email]
      ,[personal_last_name]
      ,[personal_name]
    --  ,[personal_photo]
      ,[personal_telephone]
      ,[area_area_id]
     -- ,[assign_equipament_assign_id]
  FROM [dbo].[personals] as p
    WHERE p.personal_id = @personal_id

END
GO
PRINT 'Store procedure Created! -  [sp_personal_by_id]';
GO


IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[sp_get_incident_type]') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
	BEGIN
		DROP PROCEDURE sp_get_incident_type
		PRINT 'Store procedure deteled -  sp_get_incident_type';
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
      ,[incident_type_name]
      ,[incident_type_description]
      ,[incident_type_type]
      ,[incident_type_subtype]
  FROM [dbo].[incident_type]
  WHERE [incident_type_id] = ISNULL(@incident_type_id,[incident_type_id]) 
END
GO
PRINT 'Store procedure Created! -  sp_get_incident_type';
GO


IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[sp_get_incident_detail]') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
	BEGIN
		DROP PROCEDURE sp_get_incident_detail
		PRINT 'Store procedure deteled -  sp_get_incident_detail';
	END
GO

--Creacion del store procedure
/******************************************************************************
**  Name: sp_get_incident_detail
**  Desc:  SP for get incident detail
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

CREATE PROCEDURE [dbo].[sp_get_incident_detail]
(
	@incident_detail_id bigint = NULL   
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	SELECT [incident_detail_id]
      ,[incident_detail_status]
      ,[incident_detail_name]
      ,[incident_detail_description]
	FROM [dbo].[incident_detail]
	WHERE [incident_detail_id] = ISNULL(@incident_detail_id, [incident_detail_id])
END
GO
PRINT 'Store procedure Created -  sp_get_incident_detail';
GO


IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[sp_get_incident]') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
	BEGIN
		DROP PROCEDURE sp_get_incident
		PRINT 'Store procedure deteled -  sp_get_incident';
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
      ,[incident_code]
      ,[incident_number]
      ,[incident_registered_date]
      ,[incident_reincident]
      ,[incident_treatment]
      ,[incident_severity]
      ,[incident_reported_by]
      ,[incident_detail_id]
      ,[incident_type_id]
      ,[personal_id]
  FROM [dbo].[incident]
  WHERE [incident_id] = ISNULL(@incident_id, [incident_id])
END
GO
PRINT 'Store procedure Created! -  sp_get_incident';
GO


IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_get_all_users]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_get_all_users]
	PRINT 'Store procedure deteled -  [sp_get_all_users]';
END
GO
-- Drop User CRUD PROCEDURES
/******************************************************************************
**  Table Name: users
**  Desc: Table for sp_get_all_users
** 
**  Called by: ssi
**
**  Author: Gilmer Daniel Fernandez Pinto
**
**  Date: 05/26/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/26/2018 Gilmer Daniel Fernandez Pinto   Initial version
*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_get_all_users]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    SELECT [user_id]
		,[created_on]
		,[updated_on]
		,[user_password]
		,[user_active]
		,[user_name]
	FROM [dbo].[users]
END
GO
PRINT 'Store procedure Created -  [sp_get_all_users]';
GO


-- GET Program_sso_trainer stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_get_all_program_sso_trainer]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_get_all_program_sso_trainer]
	PRINT 'Store procedure deteled -  [sp_get_all_program_sso_trainer]';
END
GO
/******************************************************************************
**  Name: sp_get_all_program_sso_trainer
**  Desc: Table for sp_get_all_program_sso_trainer
** 
**  Called by: ssi
**
**  Author: Ivan Misericordia E.
**
**  Date: 28/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 28/05/2018 Ivan Misericordia E.   Initial version
*******************************************************************************/
CREATE PROCEDURE [dbo].[sp_get_all_program_sso_trainer]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN 
    
    SELECT [sso_trainer_id]
		,[created_on]
		,[updated_on]
		,[sso_trainer_skills]
		,[sso_trainer_ci]
		,[sso_trainer_image]
		,[sso_trainer_name]
		,[sso_trainer_specialty]
	FROM [dbo].[program_sso_trainer]
	 
END
GO
PRINT 'Store procedure Created! -  [sp_get_all_program_sso_trainer]';
GO


-- GET Program_sso_resource stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_get_all_program_sso_resource]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_get_all_program_sso_resource]
	PRINT 'Store procedure deteled -  [sp_get_all_program_sso_resource]';
END
GO
/******************************************************************************
**  Name: sp_get_all_program_sso_resource
**  Desc: Table for sp_get_all_program_sso_resource
** 
**  Called by: ssi
**
**  Author: Ivan Misericordia E.
**
**  Date: 28/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 28/05/2018 Ivan Misericordia E.   Initial version
*******************************************************************************/
CREATE PROCEDURE [dbo].[sp_get_all_program_sso_resource]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN 
    
    SELECT [sso_resource_id]
      ,[created_on]
      ,[updated_on]
      ,[sso_resource_cost]
      ,[sso_resource_detail]
      ,[sso_detail_id]
  FROM [dbo].[program_sso_resource]
	 
END
GO
PRINT 'Store procedure Created! -  [sp_get_all_program_sso_resource]';
GO


-- GET Program_sso_activities stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_get_all_program_sso_activities]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_get_all_program_sso_activities]
	PRINT 'Store procedure deteled -  [sp_get_all_program_sso_activities]';
END
GO
/******************************************************************************
**  Name: sp_get_all_program_sso_activities
**  Desc: Table for sp_get_all_program_sso_activities
** 
**  Called by: ssi
**
**  Author: Ivan Misericordia E.
**
**  Date: 28/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 28/05/2018 Ivan Misericordia E.   Initial version
*******************************************************************************/
CREATE PROCEDURE [dbo].[sp_get_all_program_sso_activities]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN 
    
    SELECT [sso_detail_id]
      ,[created_on]
      ,[updated_on]
      ,[sso_detail_activities]
      ,[sso_detail_goal]
      ,[so_detail_number]
      ,[sso_detail_time]
      ,[soo_detail_type]
      ,[sso_id]
      ,[sso_trainer_id]
  FROM [dbo].[program_sso_activities]
	 
END
GO
PRINT 'Store procedure Created! -  [sp_get_all_program_sso_activities]';
GO


-- GET Program_sso stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_get_all_program_sso]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_get_all_program_sso]
	PRINT 'Store procedure deteled -  [sp_get_all_program_sso]';
END
GO
/******************************************************************************
**  Name: sp_get_all_program_sso
**  Desc: Table for sp_get_all_program_sso
** 
**  Called by: ssi
**
**  Author: Ivan Misericordia E.
**
**  Date: 28/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 28/05/2018 Ivan Misericordia E.   Initial version
*******************************************************************************/
CREATE PROCEDURE [dbo].[sp_get_all_program_sso]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN 
    
    SELECT [sso_id]
      ,[created_on]
      ,[updated_on]
      ,[sso_execution_time]
      ,[sso_goal]
      ,[sso_indicator]
      ,[sso_objetive]
      ,[sso_responsable]
      ,[sso_total_cost]
  FROM [dbo].[program_sso]
	 
END
GO
PRINT 'Store procedure Created! -  [sp_get_all_program_sso]';
GO


IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_get_all_personal]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_get_all_personal]
	PRINT 'Store procedure deteled -  [sp_get_all_personal]';
END
GO
-- Personal CRUD PROCEDURES
/******************************************************************************
**  Table Name: personal
**  Desc: Table for sp_get_all_personal
** 
**  Called by: ssi
**
**  Author: Gilmer Daniel Fernandez Pinto
**
**  Date: 05/26/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/26/2018 Gilmer Daniel Fernandez Pinto   Initial version
*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_get_all_personal]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    SELECT [personal_id]
      ,[created_on]
      ,[updated_on]
      ,[personal_active]
      ,[personal_direction]
      ,[personal_cellphone]
      ,[personal_email]
      ,[personal_last_name]
      ,[personal_name]
    --  ,[personal_photo]
      ,[personal_telephone]
      ,[area_area_id]
     -- ,[assign_equipament_assign_id]
  FROM [dbo].[personals]
END
GO
PRINT 'Store procedure Created! -  [sp_get_all_personal]';
GO


-- GET Equipament stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_get_all_kardex_equipaments]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_get_all_kardex_equipaments]
	PRINT 'Store procedure deteled -  [sp_get_all_kardex_equipaments]';
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
PRINT 'Store procedure Created! -  [sp_get_all_kardex_equipaments]';
GO


-- UPDATE Equipament stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_get_all_inventory]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_get_all_inventory]
	PRINT 'Store procedure deteled -  [sp_get_all_inventory]';
END
GO
-- Inventory CRUD PROCEDURES
/******************************************************************************
**  Table Name: Inventory
**  Desc: Table for sp_get_all_inventory
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

CREATE PROCEDURE [dbo].[sp_get_all_inventory](
	@inventory_id BIGINT = null
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    SELECT inventory_id
		  ,inventory.active_assignament
		  ,inventory.status_assignament
		  ,inventory.date_assignament
		  ,inventory.equipament_id
		  ,inventory.personal_id
	FROM [dbo].[inventory] AS inventory
	WHERE inventory.inventory_id = ISNULL(@inventory_id, inventory.inventory_id);
END
GO
PRINT 'Store procedure Created! -  [sp_get_all_inventory]';
GO


IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_get_all_functions]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_get_all_functions]
	PRINT 'Store procedure deteled -  [sp_get_all_functions]';
END
GO

-- Functions CRUD PROCEDURES
/******************************************************************************
**  Table Name: functions
**  Desc: Table for sp_get_all_functions
** 
**  Called by: ssi
**
**  Author: Boris Gonzalo Medrano Guzman
**
**  Date: 05/29/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/29/2018 Boris Gonzalo Medrano Guzman   Initial version
*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_get_all_functions]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    SELECT [func_id]
      ,[created_on]
      ,[updated_on]
      ,[func_description]
      ,[func_name]
      ,[position_position_id]
  FROM [dbo].[functions]
END
GO
PRINT 'Store procedure deteled -  [sp_get_all_functions]';
GO


-- Create Equipament stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_create_equipament]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_create_equipament]
	PRINT 'Store procedure deteled -  [sp_create_equipament]';
END
GO
-- Create Equipament CRUD PROCEDURES
/******************************************************************************
**  Table Name: Equipaments
**  Desc: Table for sp_create_equipament
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

CREATE PROCEDURE [dbo].[sp_create_equipament](
				@equipament_name VARCHAR(50)
			   ,@equipament_type INT
			   ,@equipament_description VARCHAR(200)
			   ,@equipament_image VARBINARY(MAX)
)
AS 
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

    INSERT INTO [dbo].[equipaments](equipament_name
								  ,equipament_type
								  ,equipament_description
								  ,equipament_image
								  ,created_on)
    VALUES ( @equipament_name
			,@equipament_type
			,@equipament_description
			,@equipament_image
			,GETDATE());

  SELECT @@IDENTITY AS equipament_id;
END
GO
PRINT 'Store procedure Created! -  [sp_create_equipament]';
GO


--GET Equipaments store procedure
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_get_all_equipament]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_get_all_equipament]
	PRINT 'Store procedure deteled -  [sp_get_all_equipament]';
END
GO
-- Equipments CRUD PROCEDURES
/******************************************************************************
**  Table Name: Equipaments
**  Desc: Table for sp_get_all_equipament
** 
**  Called by: ssi
**
**  Author: Ivan Misericordia Eulate
**
**  Date: 05/26/2018

*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/26/2018 Ivan Misericordia Eulate   Initial version
*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_get_all_equipament](
	@equipament_id BIGINT = null
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    SELECT   equi.equipament_id
			,equi.equipament_name
			,equi.equipament_type
			,equi.equipament_description
			,equi.equipament_image 
	FROM [dbo].[equipaments] as equi
	WHERE equi.equipament_id = ISNULL(@equipament_id, equi.equipament_id);
END
GO
PRINT 'Store procedure Created! -  [sp_get_all_equipament]';
GO


IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_get_all_departments]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_get_all_departments]
	PRINT 'Store procedure deteled -  [sp_get_all_departments]';
END
GO

-- Personal CRUD PROCEDURES
/******************************************************************************
**  Table Name: equipaments
**  Desc: Table for sp_get_all_department
** 
**  Called by: ssi
**
**  Author: Gilmer Daniel Fernandez Pinto
**
**  Date: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/28/2018 Gilmer Daniel Fernandez Pinto   Initial version
*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_get_all_departments]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    SELECT [department_id]
      ,[created_on]
      ,[updated_on]
      ,[department_description]
      ,[department_name]
  FROM [dbo].[department]
END
GO
PRINT 'Store procedure Created! -  [sp_get_all_departments]';
GO


IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_get_all_contracts]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_get_all_contracts]
	PRINT 'Store procedure deteled -  [sp_get_all_contracts]';
END
GO
-- Personal CRUD PROCEDURES
/******************************************************************************
**  Table Name: contracts
**  Desc: Table for sp_get_all_contracts
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

CREATE PROCEDURE [dbo].[sp_get_all_contracts]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    SELECT  [contract_id]
      ,[created_on]
      ,[updated_on]
      ,[contract_city]
      ,[contract_code]
      ,[contract_date]
      ,[contract_description]
      ,[contract_salary]
      ,[contract_type]
  FROM [dbo].[contracts]
END
GO
PRINT 'Store procedure Created! -  [sp_get_all_contracts]';
GO


IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_get_all_areas]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_get_all_areas]
	PRINT 'Store procedure deteled -  [sp_get_all_areas]';
END
GO
-- Area CRUD PROCEDURES
/******************************************************************************
**  Table Name: areas
**  Desc: Table for sp_get_all_areas
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

CREATE PROCEDURE [dbo].[sp_get_all_areas]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    SELECT [area_id]
      ,[created_on]
      ,[updated_on]
      ,[area_description]
      ,[area_name]
  FROM [dbo].[areas]
END
GO
PRINT 'Store procedure Created! -  [sp_get_all_areas]';
GO


IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_edit_user]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_edit_user]
	PRINT 'Store procedure deteled -  [sp_edit_user]';
END
GO

-- Drop User CRUD PROCEDURES
/******************************************************************************
**  Table Name: User
**  Desc: Table for sp_edit_user
** 
**  Called by: ssi
**
**  Author: Gilmer Daniel Fernandez Pinto
**
**  Date: 05/26/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/26/2018 Gilmer Daniel Fernandez Pinto   Initial version
*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_edit_user](
    @user_id INT
   ,@user_name VARCHAR(100) 
   ,@user_password VARCHAR(200)
   ,@user_active INT
)
AS 
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

    UPDATE [dbo].[users]
    SET user_name      = @user_name
        ,user_password = @user_password
        ,user_active   = @user_active
        ,updated_on    =  GETDATE()
    WHERE user_id = @user_id;

    SELECT [user_id]
      ,[created_on]
      ,[updated_on]
      ,[user_password]
      ,[user_active]
      ,[user_name]
  FROM [dbo].[users]
    WHERE user_id = @user_id;

END
GO
PRINT 'Store procedure Created! -  [sp_edit_user]';
GO

-- UPDATE Program_sso_trainer stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_edit_program_sso_trainer]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_edit_program_sso_trainer]
	PRINT 'Store procedure deteled -  [sp_edit_program_sso_trainer]';
END
GO
/******************************************************************************
**  Name: sp_edit_program_sso_trainer
**  Desc: Update an Program_sso_trainer
** 
**  Called by: ssi
**
**  Author: Ivan Misericordia E.
**
**  Date: 28/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 28/05/2018 Ivan Misericordia E.   Initial version
*******************************************************************************/
CREATE PROCEDURE [dbo].[sp_edit_program_sso_trainer]
(
	 @sso_trainer_id BIGINT
	,@trainer_skills VARCHAR(250)
	,@trainer_ci VARCHAR(10)
	,@trainer_image VARBINARY(MAX)
	,@trainer_name VARCHAR(100)
	,@trainer_specialty VARCHAR(255)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE [dbo].[program_sso_trainer]
	SET		 sso_trainer_skills = @trainer_skills
			,sso_trainer_ci = @trainer_ci
			,sso_trainer_image = @trainer_image
			,sso_trainer_name = @trainer_name
			,sso_trainer_specialty = @trainer_specialty
	WHERE sso_trainer_id = @sso_trainer_id;

	SELECT [sso_trainer_id]
	      ,[created_on]
	      ,[updated_on]
	      ,[sso_trainer_skills]
	      ,[sso_trainer_ci]
	      ,[sso_trainer_image]
	      ,[sso_trainer_name]
	      ,[sso_trainer_specialty]
	  FROM [dbo].[program_sso_trainer]
	WHERE sso_trainer_id = @sso_trainer_id;

	PRINT 'Procedure [dbo].[sp_edit_program_sso_trainer] created';
END
GO

-- UPDATE Program_sso_resource stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_edit_program_sso_resource]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_edit_program_sso_resource]
	PRINT 'Store procedure deteled -  [sp_edit_program_sso_resource]';
END
GO
/******************************************************************************
**  Name: sp_edit_program_sso_resource
**  Desc: Update an Program_sso_resource
** 
**  Called by: ssi
**
**  Author: Ivan Misericordia E.
**
**  Date: 28/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 28/05/2018 Ivan Misericordia E.   Initial version
*******************************************************************************/
CREATE PROCEDURE [dbo].[sp_edit_program_sso_resource]
(
	 @sso_resource_id BIGINT
	,@resource_cost FLOAT
	,@resource_detail VARCHAR(250)
	
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE [dbo].[program_sso_resource]
	SET		 sso_resource_cost = @resource_cost
			,sso_resource_detail = @resource_detail
	WHERE sso_resource_id = @sso_resource_id;

	SELECT  [sso_resource_id]
	      ,[created_on]
	      ,[updated_on]
	      ,[sso_resource_cost]
	      ,[sso_resource_detail]
	      ,[sso_detail_id]
	  FROM [dbo].[program_sso_resource]
	WHERE sso_resource_id = @sso_resource_id;

	PRINT 'Procedure [dbo].[sp_edit_program_sso_resource] created';
END
GO

-- UPDATE Program_sso_activities stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_edit_program_sso_activities]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_edit_program_sso_activities]
	PRINT 'Store procedure deteled -  [sp_edit_program_sso_activities]';
END
GO
/******************************************************************************
**  Name: sp_edit_program_sso_activities
**  Desc: Update an Program_sso_activities
** 
**  Called by: ssi
**
**  Author: Ivan Misericordia E.
**
**  Date: 28/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 28/05/2018 Ivan Misericordia E.   Initial version
*******************************************************************************/
CREATE PROCEDURE [dbo].[sp_edit_program_sso_activities]
(
	 @sso_detail_id BIGINT
	,@detail_activities VARCHAR(250)
	,@detail_goal VARCHAR(200)
	,@detail_number INT
	,@detail_time VARCHAR(250)
	,@detail_type VARCHAR(250)
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE [dbo].[program_sso_activities]
	SET		 sso_detail_activities = @detail_activities
			,sso_detail_goal = @detail_goal
			,so_detail_number = @detail_number
			,sso_detail_time = @detail_time
			,soo_detail_type = @detail_type
	WHERE sso_detail_id = @sso_detail_id;

	SELECT [sso_detail_id]
	      ,[created_on]
	      ,[updated_on]
	      ,[sso_detail_activities]
	      ,[sso_detail_goal]
	      ,[so_detail_number]
	      ,[sso_detail_time]
	      ,[soo_detail_type]
	      ,[sso_id]
	      ,[sso_trainer_id]
	  FROM [dbo].[program_sso_activities]
	WHERE sso_detail_id = @sso_detail_id;

	PRINT 'Procedure [dbo].[sp_edit_program_sso_activities] created';
END
GO

-- UPDATE Program_sso stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_edit_program_sso]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_edit_program_sso]
	PRINT 'Store procedure deteled -  [sp_edit_program_sso]';
END
GO
/******************************************************************************
**  Name: sp_edit_program_sso
**  Desc: Update an Program_sso
** 
**  Called by: ssi
**
**  Author: Ivan Misericordia E.
**
**  Date: 28/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 28/05/2018 Ivan Misericordia E.   Initial version
*******************************************************************************/
CREATE PROCEDURE [dbo].[sp_edit_program_sso]
(
	 @sso_id BIGINT
	,@execution_time VARCHAR(250)
	,@goal VARCHAR(250)
	,@indicator VARCHAR(250)
	,@objetive VARCHAR(250)
	,@responsable VARCHAR(250)
	,@total_cost FLOAT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	UPDATE [dbo].[program_sso]
	SET		 sso_execution_time = @execution_time
			,sso_goal = @goal
			,sso_indicator = @indicator
			,sso_objetive = @objetive
			,sso_responsable = @responsable
			,sso_total_cost = @total_cost
	WHERE sso_id = @sso_id;

	SELECT  [sso_id]
	      ,[created_on]
	      ,[updated_on]
	      ,[sso_execution_time]
	      ,[sso_goal]
	      ,[sso_indicator]
	      ,[sso_objetive]
	      ,[sso_responsable]
	      ,[sso_total_cost]
	  FROM [dbo].[program_sso]
	WHERE sso_id = @sso_id;

	PRINT 'Procedure [dbo].[sp_edit_program_sso] created';
END
GO


IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_edit_personal]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_edit_personal]
	PRINT 'Store procedure deteled -  [sp_edit_personal]';
END
GO
-- Drop User CRUD PROCEDURES
/******************************************************************************
**  Table Name: personal
**  Desc: Table for sp_edit_personal
** 
**  Called by: ssi
**
**  Author: Gilmer Daniel Fernandez Pinto
**
**  Date: 05/26/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/26/2018 Gilmer Daniel Fernandez Pinto   Initial version
*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_edit_personal](
    @personal_id INT
   ,@personal_name VARCHAR(100)
   ,@personal_last_name VARCHAR(100)
   ,@personal_email VARCHAR(200)
   ,@personal_direction VARCHAR(200)
   ,@personal_cellphone VARCHAR(100)
   ,@personal_telephone VARCHAR(100)
   ,@personal_active INT
)
AS 
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

    UPDATE [dbo].[personals]
    SET personal_name       = @personal_name
        ,personal_last_name = @personal_last_name
        ,personal_email     = @personal_email
        ,personal_direction = @personal_direction
        ,personal_cellphone = @personal_cellphone
        ,personal_telephone = @personal_telephone
        ,personal_active    = @personal_active
        ,updated_on    =  GETDATE()
    WHERE personal_id = @personal_id;

    SELECT  [personal_id]
      ,[created_on]
      ,[updated_on]
      ,[personal_active]
      ,[personal_direction]
      ,[personal_cellphone]
      ,[personal_email]
      ,[personal_last_name]
      ,[personal_name]
    --  ,[personal_photo]
      ,[personal_telephone]
      ,[area_area_id]
  --    ,[assign_equipament_assign_id]
  FROM [dbo].[personals]
    WHERE personal_id = @personal_id;
END
GO
PRINT 'Store procedure Created! -  [sp_edit_personal]';
GO


-- UPDATE Kardex_equipament stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_edit_kardex_equipament]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_edit_kardex_equipament]
	PRINT 'Store procedure deteled -  [sp_edit_kardex_equipament]';
END
GO
-- Update Kardex_equipaments CRUD PROCEDURES
/******************************************************************************
**  Table Name: Kardex_equipaments
**  Desc: Table for sp_edit_kardex_equipament
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

CREATE PROCEDURE [dbo].[sp_edit_kardex_equipament](
			    @kardex_id INT
			   ,@balance_kardex INT
			   ,@entry_kardex INT
			   ,@outlay_kardex INT
			   ,@date_kardex DATETIME
)
AS 
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

    UPDATE [dbo].[kardex_equipaments]
    SET		balance_kardex = @balance_kardex
		   ,entry_kardex = @entry_kardex
		   ,outlay_kardex = @outlay_kardex
		   ,date_kardex = @date_kardex
	       ,created_on = GETDATE()
    WHERE equipament_kardex_id = @kardex_id;

   SELECT  [equipament_kardex_id]
	      ,[created_on]
	      ,[updated_on]
	      ,[balance_kardex]
	      ,[date_kardex]
	      ,[entry_kardex]
	      ,[outlay_kardex]
	     -- ,[equipament_equipament_id]
	  FROM [dbo].[kardex_equipaments]
    WHERE equipament_kardex_id = @kardex_id;

	SELECT @@IDENTITY AS kardex_id;

END
GO
PRINT 'Store procedure Created! -  [sp_edit_kardex_equipament]';
GO


-- UPDATE Inventory stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_edit_inventory]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_edit_inventory]
	PRINT 'Store procedure deteled -  [sp_edit_inventory]';
END
GO
-- Update Inventory CRUD PROCEDURES
/******************************************************************************
**  Table Name: Inventory
**  Desc: Table for sp_edit_inventory
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

CREATE PROCEDURE [dbo].[sp_edit_inventory](
			    @inventory_id INT
			   ,@active_asignament BIT
			   ,@status_asignament VARCHAR(50)
			   ,@date_asignament DATETIME
)
AS 
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

    UPDATE [dbo].[Inventory]
    SET		active_assignament = @active_asignament
		   ,status_assignament = @status_asignament
		   ,date_assignament = @date_asignament
	       ,created_on = GETDATE()
    WHERE inventory_id = @inventory_id;

    SELECT  [inventory_id]
	      ,[created_on]
	      ,[updated_on]
	     -- ,[active_asignament]
	     -- ,[date_asignament]
	     -- ,[status_asignament]
	     -- ,[equipament_equipament_id]
	     -- ,[personal_personal_id]
    FROM [dbo].[inventory]
    WHERE inventory_id = @inventory_id;
	SELECT @@IDENTITY AS inventory_id;
END
GO
PRINT 'Store procedure Created! -  [sp_edit_inventory]';
GO


IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_edit_functions]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_edit_functions]
	PRINT 'Store procedure deteled -  [sp_edit_functions]';
END
GO

-- Functions CRUD PROCEDURES
/******************************************************************************
**  Table Name: functions
**  Desc: Table for sp_edit_functions
** 
**  Called by: ssi
**
**  Author: Boris Gonzalo Medrano Guzman
**
**  Date: 05/29/2018
*******************************************************************************
**                          Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/29/2018 Boris Gonzalo Medrano Guzman   Initial version
*******************************************************************************/
CREATE PROCEDURE [dbo].[sp_edit_functions](
    @func_id INT
   ,@func_name VARCHAR(50)
   ,@func_description VARCHAR(100)
   ,@position_position_id INT
)
AS 
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    UPDATE [dbo].[functions]
    SET func_name  = @func_name
        ,func_description  = @func_description
        ,position_position_id = @position_position_id
        ,updated_on    =  GETDATE()
    WHERE func_id = @func_id;

    SELECT  [func_id]
      ,[created_on]
      ,[updated_on]
      ,[func_description]
      ,[func_name]
      ,[position_position_id]
  FROM [dbo].[functions]
  WHERE func_id = @func_id;
END
GO
PRINT 'Store procedure Created! -  [sp_edit_functions]';
GO


-- UPDATE Equipament stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_edit_equipament]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_edit_equipament]
	PRINT 'Store procedure deteled -  [sp_edit_equipament]';
END
GO
-- Update Equipament CRUD PROCEDURES
/******************************************************************************
**  Table Name: Equipaments
**  Desc: Table for sp_edit_equipament
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
** --------   --------        -------------------------------------------------
** 05/27/2018 Ivan Misericordia Eulate   Initial version
*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_edit_equipament](
			    @equipament_id INT
			   ,@equipament_name VARCHAR(50)
			   ,@equipament_type INT
			   ,@equipament_description VARCHAR(200)
			   ,@equipament_image VARBINARY(MAX)
)
AS 
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

    UPDATE [dbo].[equipaments]
    SET equipament_name = @equipament_name
	   ,equipament_type = @equipament_type
	   ,equipament_description = @equipament_description
	   ,equipament_image = @equipament_image
	   ,created_on = GETDATE()
    WHERE equipament_id = @equipament_id;

    SELECT [equipament_id]
      ,[created_on]
      ,[updated_on]
      ,[equipament_description]
      ,[equipament_image]
      ,[equipament_name]
      ,[equipament_type]
    --  ,[assign_equipament_assign_id]
  FROM [dbo].[equipaments]
    WHERE equipament_id = @equipament_id;

	SELECT @@IDENTITY AS equipament_id;

END
GO
PRINT 'Store procedure Created! -  [sp_edit_equipament]';
GO


IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_edit_department]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_edit_department]
	PRINT 'Store procedure deteled -  [sp_edit_department]';
END
GO
-- Drop DEPARTMENT CRUD PROCEDURES
/******************************************************************************
**  Table Name: contract
**  Desc: Table for sp_edit_department
**
**  Called by: ssi
**
**  Author: Gilmer Daniel Fernandez Pinto
**
**  Date: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/28/2018 Gilmer Daniel Fernandez Pinto   Initial version
*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_edit_department](
    @department_id INT
   ,@department_description VARCHAR(100)
   ,@department_name VARCHAR(50)
)
AS 
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

    UPDATE [dbo].[department]
    SET department_name         = @department_name
        ,department_description = @department_description 
        ,updated_on             = GETDATE()
    WHERE department_id         = @department_id;

    SELECT  [department_id]
      ,[created_on]
      ,[updated_on]
      ,[department_description]
      ,[department_name]
    FROM [dbo].[department]
    WHERE department_id = @department_id;

END
GO
PRINT 'Store procedure Created! -  [sp_edit_department]';
GO


IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_edit_contract]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_edit_contract]
	PRINT 'Store procedure deteled -  [sp_edit_contract]';
END
GO
-- Drop User CRUD PROCEDURES
/******************************************************************************
**  Table Name: contract
**  Desc: Table for sp_edit_contract
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

CREATE PROCEDURE [dbo].[sp_edit_contract](
    @contract_id INT
   ,@contract_code VARCHAR(50)
   ,@contract_city VARCHAR(100)
   ,@contract_type VARCHAR(100)
   ,@contract_date DATETIME
   ,@contract_salary FLOAT
   ,@contract_description VARCHAR(100)
)
AS 
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

    UPDATE [dbo].[contracts]
    SET contract_code       = @contract_code
        ,contract_city      = @contract_city
        ,contract_type      = @contract_type
        ,contract_date      = @contract_date
        ,contract_salary    = @contract_salary
        ,contract_description = @contract_description
        ,updated_on    =  GETDATE()
    WHERE contract_id = @contract_id;

    SELECT  [contract_id]
      ,[created_on]
      ,[updated_on]
      ,[contract_city]
      ,[contract_code]
      ,[contract_date]
      ,[contract_description]
      ,[contract_salary]
      ,[contract_type]
  FROM [dbo].[contracts]
    WHERE contract_id = @contract_id;

END
GO
PRINT 'Store procedure Created! -  [sp_edit_contract]';
GO


IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_edit_area]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_edit_area]
	PRINT 'Store procedure deteled -  [sp_edit_area]';
END
GO
-- Drop AREA CRUD PROCEDURES
/******************************************************************************
**  Table Name: AREA
**  Desc: Table for sp_edit_area
** 
**  Called by: ssi
**
**  Author: Gilmer Daniel Fernandez Pinto
**
**  Date: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/28/2018 Gilmer Daniel Fernandez Pinto   Initial version
*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_edit_area](
    @area_id INT
   ,@area_description VARCHAR(200)
   ,@area_name VARCHAR(50)
   
)
AS 
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

    UPDATE [dbo].[areas]
    SET  area_description = @area_description
        ,area_name        = @area_name
        ,updated_on       = GETDATE()
    WHERE area_id         = @area_id;

    SELECT  [area_id]
      ,[created_on]
      ,[updated_on]
      ,[area_description]
      ,[area_name]
    FROM [dbo].[areas]
    WHERE area_id = @area_id;

END
GO
PRINT 'Store procedure Created! -  [sp_edit_area]';
GO


IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_delete_user]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_delete_user]
	PRINT 'Store procedure deteled -  [sp_delete_user]';
END
GO

-- Drop User CRUD PROCEDURES
/******************************************************************************
**  Table Name: users
**  Desc: Table for sp_delete_user
** 
**  Called by: ssi
**
**  Author: Gilmer Daniel Fernandez Pinto
**
**  Date: 05/26/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/26/2018 Gilmer Daniel Fernandez Pinto   Initial version
*******************************************************************************/
CREATE PROCEDURE [dbo].[sp_delete_user](
    @user_id INT
   ,@result BIT OUTPUT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN 
    
    DELETE FROM [dbo].[users]
    WHERE user_id = @user_id;

    SET @result = 1;
    
    SELECT @result; 
END
GO
PRINT 'Store procedure Created -  [sp_delete_user]';
GO


-- DELETE Program_sso_trainer stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_delete_program_sso_trainer]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_delete_program_sso_trainer]
	PRINT 'Store procedure deteled -  [sp_delete_program_sso_trainer]';
END
GO
/******************************************************************************
**  Name: sp_delete_program_sso_trainer
**  Desc: delete an Program_sso_trainer
** 
**  Called by: ssi
**
**  Author: Ivan Misericordia E.
**
**  Date: 28/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 28/05/2018 Ivan Misericordia E.   Initial version
*******************************************************************************/
CREATE PROCEDURE [dbo].[sp_delete_program_sso_trainer](
    @sso_trainer_id BIGINT
   ,@result BIT OUTPUT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN 
    
    DELETE FROM [dbo].[program_sso_trainer]
    WHERE sso_trainer_id = @sso_trainer_id;

    SET @result = 1;
    
    SELECT @result; 
END
GO
PRINT 'Store procedure Created! -  [sp_delete_program_sso_trainer]';
GO


-- DELETE Program_sso_resource stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_delete_program_sso_resource]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_delete_program_sso_resource]
	PRINT 'Store procedure deteled -  [sp_delete_program_sso_resource]';
END
GO
/******************************************************************************
**  Name: sp_delete_program_sso_resource
**  Desc: delete an Program_sso_resource
** 
**  Called by: ssi
**
**  Author: Ivan Misericordia E.
**
**  Date: 28/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 28/05/2018 Ivan Misericordia E.   Initial version
*******************************************************************************/
CREATE PROCEDURE [dbo].[sp_delete_program_sso_resource](
    @sso_resouce_id BIGINT
   ,@result BIT OUTPUT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN 
    
    DELETE FROM [dbo].[program_sso_resource]
    WHERE sso_resource_id = @sso_resouce_id;

    SET @result = 1;
    
    SELECT @result; 
END
GO
PRINT 'Store procedure Created! -  [sp_delete_program_sso_resource]';
GO


-- DELETE Program_sso_activities stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_delete_program_sso_activities]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_delete_program_sso_activities]
	PRINT 'Store procedure deteled -  [sp_delete_program_sso_activities]';
END
GO
/******************************************************************************
**  Name: sp_delete_program_sso_activities
**  Desc: delete an Program_sso_activities
** 
**  Called by: ssi
**
**  Author: Ivan Misericordia E.
**
**  Date: 28/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 28/05/2018 Ivan Misericordia E.   Initial version
*******************************************************************************/
CREATE PROCEDURE [dbo].[sp_delete_program_sso_activities](
    @sso_detail_id BIGINT
   ,@result BIT OUTPUT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN 
    
    DELETE FROM [dbo].[program_sso_activities]
    WHERE sso_detail_id = @sso_detail_id;

    SET @result = 1;
    
    SELECT @result; 
END
GO
PRINT 'Store procedure Created! -  [sp_delete_program_sso_activities]';
GO

-- DELETE Program_sso stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_delete_program_sso]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_delete_program_sso]
	PRINT 'Store procedure deteled -  [sp_delete_program_sso]';
END
GO
/******************************************************************************
**  Name: sp_delete_program_sso
**  Desc: delete an Program_sso
** 
**  Called by: ssi
**
**  Author: Ivan Misericordia E.
**
**  Date: 28/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 28/05/2018 Ivan Misericordia E.   Initial version
*******************************************************************************/
CREATE PROCEDURE [dbo].[sp_delete_program_sso](
    @sso_id BIGINT
   ,@result BIT OUTPUT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN 
    
    DELETE FROM [dbo].[program_sso]
    WHERE sso_id = @sso_id;

    SET @result = 1;
    
    SELECT @result; 
END
GO
PRINT 'Store procedure Created! -  [sp_delete_program_sso]';
GO


IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_delete_personal]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_delete_personal]
	PRINT 'Store procedure deteled -  [sp_delete_personal]';
END
GO

-- Drop User CRUD PROCEDURES
/******************************************************************************
**  Table Name: personals
**  Desc: Table for sp_delete_personals
** 
**  Called by: ssi
**
**  Author: Gilmer Daniel Fernandez Pinto
**
**  Date: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/28/2018 Gilmer Daniel Fernandez Pinto   Initial version
*******************************************************************************/
CREATE PROCEDURE [dbo].[sp_delete_personal](
    @personal_id INT
   ,@result BIT OUTPUT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN 
    
    DELETE FROM [dbo].[personals]
    WHERE personal_id = @personal_id;

    SET @result = 1;
    
    SELECT @result; 
END
GO
PRINT 'Store procedure Created! -  [sp_delete_personal]';
GO


IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[sp_delete_incident_type]') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
	BEGIN
		DROP PROCEDURE sp_delete_incident_type
		PRINT 'Store procedure deteled -  sp_delete_incident_type';
	END
GO

--Creacion del store procedure
/******************************************************************************
**  Name: sp_delete_incident_type
**  Desc:  SP for delete incident type
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
CREATE PROCEDURE [dbo].[sp_delete_incident_type]
(
	@incident_type_id bigint 
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	DELETE FROM [dbo].[incident_type]
  WHERE [incident_type_id] = @incident_type_id 
END
GO
PRINT 'Store procedure Created! -  sp_delete_incident_type';
GO


IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[sp_delete_incident_detail]') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
	BEGIN
		DROP PROCEDURE sp_delete_incident_detail
		PRINT 'Store procedure deteled -  sp_delete_incident_detail';
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
PRINT 'Store procedure Created -  sp_delete_incident_detail';
GO


IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[sp_delete_incident]') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
	BEGIN
		DROP PROCEDURE sp_delete_incident
		PRINT 'Store procedure deteled -  sp_delete_incident';
	END
GO

--Creacion del store procedure
/******************************************************************************
**  Name: sp_delete_incident
**  Desc:  SP for delete incident
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

CREATE PROCEDURE [dbo].[sp_delete_incident]
(	
	@incident_id bigint
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

  DELETE FROM [dbo].[incident]
  WHERE [incident_id] = @incident_id
END
GO
PRINT 'Store procedure Created! -  sp_delete_incident';
GO


IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_delete_functions]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_delete_functions]
	PRINT 'Store procedure deteled -  [sp_delete_functions]';
END
GO

-- Drop functions CRUD PROCEDURES

/******************************************************************************

**  Table Name: functions

**  Desc: Table for sp_delete_functions

** 

**  Called by: ssi

**

**  Author: Boris Gonzalo Medrano Guzman

**

**  Date: 05/29/2018

*******************************************************************************

**                            Change History

*******************************************************************************

**   Date:     Author:                            Description:

** --------   --------        ---------------------------------------------------

** 05/29/2018 Boris Gonzalo Medrano Guzman   Initial version

*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_delete_functions](

    @func_id INT

   ,@result BIT OUTPUT

)

AS

SET XACT_ABORT ON;

SET NOCOUNT ON;

BEGIN 

    

    DELETE FROM [dbo].[functions]

    WHERE func_id = @func_id


    SET @result = 1;

    
    SELECT @result; 

END
GO
PRINT 'Store procedure Created! -  [sp_delete_functions]';
GO


-- DELETE Equipament stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_delete_equipament]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_delete_equipament]
	PRINT 'Store procedure deteled -  [sp_delete_equipament]';
END
GO
-- Drop Equipament CRUD PROCEDURES
/******************************************************************************
**  Table Name: Equipaments
**  Desc: delete an equipament
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
CREATE PROCEDURE [dbo].[sp_delete_equipament](
    @equipament_id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN 
    
    DELETE FROM [dbo].[equipaments]
    WHERE equipament_id = @equipament_id;
END
GO
PRINT 'Store procedure Created! -  [sp_delete_equipament]';
GO


IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_delete_department]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_delete_department]
	PRINT 'Store procedure deteled -  [sp_delete_department]';
END
GO
-- Drop User CRUD PROCEDURES
/******************************************************************************
**  Table Name: department
**  Desc: Table for sp_delete_department
** 
**  Called by: ssi
**
**  Author: Gilmer Daniel Fernandez Pinto
**
**  Date: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/28/2018 Gilmer Daniel Fernandez Pinto   Initial version
*******************************************************************************/
CREATE PROCEDURE [dbo].[sp_delete_department](
    @department_id INT
   ,@result BIT OUTPUT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN 
    
    DELETE FROM [dbo].[department]
    WHERE department_id = @department_id;

    SET @result = 1;
    
    SELECT @result; 
END
GO
PRINT 'Store procedure Created! -  [sp_delete_department]';
GO


IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_delete_department]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_delete_department]
	PRINT 'Store procedure deteled -  [sp_delete_department]';
END
GO
-- Drop User CRUD PROCEDURES
/******************************************************************************
**  Table Name: department
**  Desc: Table for sp_delete_department
** 
**  Called by: ssi
**
**  Author: Gilmer Daniel Fernandez Pinto
**
**  Date: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/28/2018 Gilmer Daniel Fernandez Pinto   Initial version
*******************************************************************************/
CREATE PROCEDURE [dbo].[sp_delete_department](
    @department_id INT
   ,@result BIT OUTPUT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN 
    
    DELETE FROM [dbo].[department_position]
    WHERE department_id = @department_id

    DELETE FROM [dbo].[department]
    WHERE department_id = @department_id;

    SET @result = 1;
    
    SELECT @result; 
END
GO
PRINT 'Store procedure Created! -  [sp_delete_department]';
GO


IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_delete_contract]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_delete_contract]
	PRINT 'Store procedure deteled -  [sp_delete_contract]';
END
GO

-- Drop User CRUD PROCEDURES
/******************************************************************************
**  Table Name: contract
**  Desc: Table for sp_delete_contract
** 
**  Called by: ssi
**
**  Author: Gilmer Daniel Fernandez Pinto
**
**  Date: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/28/2018 Gilmer Daniel Fernandez Pinto   Initial version
*******************************************************************************/
CREATE PROCEDURE [dbo].[sp_delete_contract](
    @contract_id INT
   ,@result BIT OUTPUT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN 
    
    DELETE FROM [dbo].[contracts]
    WHERE contract_id = @contract_id;

    SET @result = 1;
    
    SELECT @result; 
END
GO
PRINT 'Store procedure Created! -  [sp_delete_contract]';
GO


IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_delete_area]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_delete_area]
	PRINT 'Store procedure deteled -  [sp_delete_area]';
END
GO

-- Drop AREA CRUD PROCEDURES
/******************************************************************************
**  Table Name: area
**  Desc: Table for sp_delete_area
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
CREATE PROCEDURE [dbo].[sp_delete_area](
    @area_id INT
   ,@result BIT OUTPUT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN 
    
    DELETE FROM [dbo].[areas]
    WHERE area_id = @area_id;

    SET @result = 1;
    
    SELECT @result; 
END
GO
PRINT 'Store procedure Created! -  [sp_delete_area]';
GO


IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_create_user]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_create_user]
	PRINT 'Store procedure deteled -  [sp_create_user]';
END
GO
-- Drop User CRUD PROCEDURES
/******************************************************************************
**  Table Name: users
**  Desc: Table for sp_crete_user
** 
**  Called by: ssi
**
**  Author: Gilmer Daniel Fernandez Pinto
**
**  Date: 05/26/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/26/2018 Gilmer Daniel Fernandez Pinto   Initial version
*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_create_user](
    @user_name VARCHAR(100)
   ,@user_password VARCHAR(200)
   ,@user_active INT
   ,@result BIT OUTPUT
)
AS 
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

    INSERT INTO [dbo].[users]
    (user_name, user_password, user_active, created_on)
    VALUES (@user_name, @user_password, @user_active, GETDATE());

    SET @result = @@IDENTITY;

    SELECT @result; 
END
GO
PRINT 'Store procedure Created! -  [sp_create_user]';
GO


-- Create Program_sso_trainer stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_create_program_sso_trainer]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_create_program_sso_trainer]
	PRINT 'Store procedure deteled -  [sp_create_program_sso_trainer]';
END
GO
/******************************************************************************
**  Name: sp_create_program_sso_trainer
**  Desc: Inserts an new Program_sso_trainer
** 
**  Called by: ssi
**
**  Author: Ivan Misericordia E.
**
**  Date: 28/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 28/05/2018 Ivan Misericordia E.   Initial version
*******************************************************************************/
CREATE PROCEDURE [dbo].[sp_create_program_sso_trainer]
(
	 @trainer_skills VARCHAR(250)
	,@trainer_ci VARCHAR(10)
	,@trainer_image VARBINARY(MAX)
	,@trainer_name VARCHAR(100)
	,@trainer_specialty VARCHAR(255)
	,@result BIT OUTPUT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO [dbo].[program_sso_trainer](
			 sso_trainer_skills
			,sso_trainer_ci
			,sso_trainer_image
			,sso_trainer_name
			,sso_trainer_specialty)
	VALUES ( @trainer_skills
			,@trainer_ci
			,@trainer_image
			,@trainer_name
			,@trainer_specialty);
	SET @result = 1;
    SELECT @result; 
END
GO
PRINT 'Procedure [dbo].[sp_create_program_sso_trainer] created';
GO

-- Create Program_sso_resource stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_create_program_sso_resource]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_create_program_sso_resource]
	PRINT 'Store procedure deteled -  [sp_create_program_sso_resource]';
END
GO
/******************************************************************************
**  Name: sp_create_program_sso_resource
**  Desc: Inserts an new Program_sso_resource
** 
**  Called by: ssi
**
**  Author: Ivan Misericordia E.
**
**  Date: 28/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 28/05/2018 Ivan Misericordia E.   Initial version
*******************************************************************************/
CREATE PROCEDURE [dbo].[sp_create_program_sso_resource]
(
	 @resource_cost FLOAT
	,@resource_detail VARCHAR(200)
	,@result BIT OUTPUT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO [dbo].[program_sso_resource](
			 sso_resource_cost
			,sso_resource_detail)
	VALUES ( @resource_cost
			,@resource_detail);
	SET @result = 1;
    SELECT @result; 
END
GO
PRINT 'Procedure [dbo].[sp_create_program_sso_resource] created';
GO

-- Create Program_sso_activities stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_create_program_sso_activities]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_create_program_sso_activities]
	PRINT 'Store procedure deteled -  [sp_create_program_sso_activities]';
END
GO
/******************************************************************************
**  Name: sp_create_program_sso_activities
**  Desc: Inserts an new Program_sso_activities
** 
**  Called by: ssi
**
**  Author: Ivan Misericordia E.
**
**  Date: 28/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 28/05/2018 Ivan Misericordia E.   Initial version
*******************************************************************************/
CREATE PROCEDURE [dbo].[sp_create_program_sso_activities]
(
	 @detail_activities VARCHAR(250)
	,@detail_goal VARCHAR(200)
	,@detail_number INT
	,@detail_time VARCHAR(250)
	,@detail_type VARCHAR(250)
	,@result BIT OUTPUT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO [dbo].[program_sso_activities](
			 sso_detail_activities
			,sso_detail_goal
			,so_detail_number
			,sso_detail_time
			,soo_detail_type)
	VALUES ( @detail_activities
			,@detail_goal
			,@detail_number
			,@detail_time
			,@detail_type);
	SET @result = 1;
    SELECT @result; 
END
GO
PRINT 'Procedure [dbo].[sp_create_program_sso_activities] created';
GO


-- Create Program_sso stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_create_program_sso]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_create_program_sso]
	PRINT 'Store procedure deteled -  [sp_create_program_sso]';
END
GO
/******************************************************************************
**  Name: sp_create_program_sso
**  Desc: Inserts an new Program_sso
** 
**  Called by: ssi
**
**  Author: Ivan Misericordia E.
**
**  Date: 28/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 28/05/2018 Ivan Misericordia E.   Initial version
*******************************************************************************/
CREATE PROCEDURE [dbo].[sp_create_program_sso]
(
	 @execution_time VARCHAR(250)
	,@goal VARCHAR(250)
	,@indicator VARCHAR(250)
	,@objetive VARCHAR(250)
	,@responsable VARCHAR(250)
	,@total_cost FLOAT
	,@result BIT OUTPUT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO [dbo].[program_sso](
			 sso_execution_time
			,sso_goal
			,sso_indicator
			,sso_objetive
			,sso_responsable
			,sso_total_cost)
	VALUES ( @execution_time
			,@goal
			,@indicator
			,@objetive
			,@responsable
			,@total_cost);
	SET @result = 1;
    SELECT @result; 
END
GO
PRINT 'Procedure [dbo].[sp_create_program_sso] created';
GO


IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_create_personal]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_create_personal]
	PRINT 'Store procedure deteled -  [sp_create_personal]';
END
GO

-- Drop User CRUD PROCEDURES
/******************************************************************************
**  Table Name: personals
**  Desc: Table for sp_create_personal
** 
**  Called by: ssi
**
**  Author: Gilmer Daniel Fernandez Pinto
**
**  Date: 05/26/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/26/2018 Gilmer Daniel Fernandez Pinto   Initial version
*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_create_personal](
    @personal_name VARCHAR(100)
   ,@personal_last_name VARCHAR(100)
   ,@personal_email VARCHAR(200)
   ,@personal_direction VARCHAR(200)
   ,@personal_cellphone VARCHAR(100)
   ,@personal_telephone VARCHAR(100)
   ,@personal_active INT
   ,@result BIT OUTPUT
)
AS 
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

    INSERT INTO [dbo].[personals]
    (personal_name, personal_last_name, personal_email, personal_direction
    , personal_cellphone, personal_telephone ,personal_active, created_on)
    VALUES (@personal_name, @personal_last_name, @personal_email, @personal_direction
           , @personal_cellphone, @personal_telephone ,@personal_active, GETDATE());

    SET @result = @@IDENTITY;

    SELECT @result; 
END
GO
PRINT 'Store procedure Created! -  [sp_create_personal]';
GO


-- CREATE Kardex_equipament stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_create_kardex_equipament]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_create_kardex_equipament]
	PRINT 'Store procedure deteled -  [sp_create_kardex_equipament]';
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
PRINT 'Store procedure Created! -  [sp_create_kardex_equipament]';
GO


-- UPDATE Inventory stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_create_inventory]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_create_inventory]
	PRINT 'Store procedure deteled -  [sp_create_inventory]';
END
GO
-- Create Inventory CRUD PROCEDURES
/******************************************************************************
**  Table Name: Inventory
**  Desc: Table for sp_create_inventory
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

CREATE PROCEDURE [dbo].[sp_create_inventory](
				@active_asignament BIT
			   ,@status_asignament VARCHAR(50)
			   ,@date_asignament DATETIME
			   ,@equipament_id BIGINT
			   ,@personal_id BIGINT
)
AS 
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

    INSERT INTO [dbo].[inventory](
			    active_assignament
			   ,status_assignament
			   ,date_assignament
			   ,created_on
			   ,equipament_id
			   ,personal_id)
    VALUES ( 
				@active_asignament
			   ,@status_asignament
			   ,@date_asignament
			   ,GETDATE()
			   ,@equipament_id
			   ,@personal_id);

	SELECT @@IDENTITY AS inventory_id;
END
GO
PRINT 'Store procedure Created! -  [sp_create_inventory]';
GO


IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[sp_create_incident_type]') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
	BEGIN
		DROP PROCEDURE sp_create_incident_type
		PRINT 'Store procedure deteled -  sp_create_incident_type';
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
	@incident_type_subtype varchar(50)
    ,@incident_type_type varchar(50)
    ,@incident_type_description varchar(max)
    ,@incident_type_name varchar(50)    
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO [dbo].[incident_type]
           ([incident_type_name]
           ,[incident_type_description]
           ,[incident_type_type]
           ,[incident_type_subtype])
     VALUES
           (@incident_type_name
		   ,@incident_type_description
           ,@incident_type_type
           ,@incident_type_subtype)

	SELECT @@IDENTITY AS incident_type_id;
END
GO
PRINT 'Store procedure Created! -  sp_create_incident_type';
GO


IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[sp_create_incident_detail]') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
	BEGIN
		DROP PROCEDURE sp_create_incident_detail
		PRINT 'Store procedure deteled -  sp_create_incident_detail';
	END
GO

--Creacion del store procedure
/******************************************************************************
**  Name: sp_create_incident_detail
**  Desc:  SP for insert incident detail
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

CREATE PROCEDURE [dbo].[sp_create_incident_detail]
(
	@incident_detail_status varchar(15)
    ,@incident_detail_name varchar(50)
    ,@incident_detail_description varchar(200)  
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

	INSERT INTO [dbo].[incident_detail]
           ([incident_detail_status]
           ,[incident_detail_name]
           ,[incident_detail_description])
     VALUES
           (@incident_detail_status
           ,@incident_detail_name
           ,@incident_detail_description)

	SELECT @@IDENTITY AS incident_detail_id;
END
GO
PRINT 'Store procedure Created! -  sp_create_incident_detail';
GO


IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[sp_create_incident]') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
	BEGIN
		DROP PROCEDURE sp_create_incident
		PRINT 'Store procedure deteled -  sp_create_incident';
	END
GO

--Creacion del store procedure
/******************************************************************************
**  Name: sp_create_incident
**  Desc:  SP for insert incident
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

CREATE PROCEDURE [dbo].[sp_create_incident]
(	
	@incident_code varchar(10)
    ,@incident_number int
    ,@incident_registered_date datetime
    ,@incident_reincident bit
    ,@incident_treatment bit
    ,@incident_severity varchar(100)
    ,@incident_reported_by varchar(100)
    ,@incident_detail_id bigint
    ,@incident_type_id bigint
    ,@personal_id bigint
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

INSERT INTO [dbo].[incident]
           ([incident_code]
           ,[incident_number]
           ,[incident_registered_date]
           ,[incident_reincident]
           ,[incident_treatment]
           ,[incident_severity]
           ,[incident_reported_by]
           ,[incident_detail_id]
           ,[incident_type_id]
           ,[personal_id])
     VALUES
           (@incident_code 
           ,@incident_number 
           ,@incident_registered_date
           ,@incident_reincident 
           ,@incident_treatment 
           ,@incident_severity 
           ,@incident_reported_by 
           ,@incident_detail_id 
           ,@incident_type_id 
           ,@personal_id)

	SELECT @@IDENTITY AS incident_id;
END
GO
PRINT 'Store procedure Created! -  sp_create_incident';
GO


IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_create_functions]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_create_functions]
	PRINT 'Store procedure deteled -  [sp_create_functions]';
END
GO

-- Functions CRUD PROCEDURES

/******************************************************************************

**  Table Name: functions

**  Desc: Table for sp_create_functions

** 

**  Called by: ssi

**

**  Author: Boris Gonzalo Medrano Guzman

**

**  Date: 05/29/2018

*******************************************************************************

**                            Change History

*******************************************************************************

**   Date:     Author:                            Description:

** --------   --------        ---------------------------------------------------

** 05/29/2018 Boris Gonzalo Medrano Guzman   Initial version

*******************************************************************************/



CREATE PROCEDURE [dbo].[sp_create_functions](

    @func_name VARCHAR(50)
   ,@func_description VARCHAR(100)
   ,@position_position_id INT

   ,@result BIT OUTPUT  --resultado

)

AS 

SET XACT_ABORT ON;

SET NOCOUNT ON;

BEGIN



    INSERT INTO [dbo].[functions]

    (func_name, func_description,position_position_id, created_on)

    VALUES (@func_name, @func_description,@position_position_id,GETDATE());



    SET @result = @@IDENTITY;



    SELECT @result; 

END
GO
PRINT 'Store procedure Created! -  [sp_create_functions]';
GO


-- Create Equipament stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_create_equipament]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_create_equipament]
	PRINT 'Store procedure deteled -  [sp_create_equipament]';
END
GO
-- Create Equipament CRUD PROCEDURES
/******************************************************************************
**  Table Name: Equipaments
**  Desc: Table for sp_create_equipament
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

CREATE PROCEDURE [dbo].[sp_create_equipament](
				@equipament_name VARCHAR(50)
			   ,@equipament_type INT
			   ,@equipament_description VARCHAR(200)
			   ,@equipament_image VARBINARY(MAX)
)
AS 
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

    INSERT INTO [dbo].[equipaments](equipament_name
								  ,equipament_type
								  ,equipament_description
								  ,equipament_image
								  ,created_on)
    VALUES ( @equipament_name
			,@equipament_type
			,@equipament_description
			,@equipament_image
			,GETDATE());

  SELECT @@IDENTITY AS equipament_id;
END
GO
PRINT 'Store procedure Created! -  [sp_create_equipament]';
GO


IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_create_department]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_create_department]
	PRINT 'Store procedure deteled -  [sp_create_department]';
END
GO

-- Drop User CRUD PROCEDURES
/******************************************************************************
**  Table Name: department
**  Desc: Table for sp_create_department
** 
**  Called by: ssi
**
**  Author: Gilmer Daniel Fernandez Pinto
**
**  Date: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/28/2018 Gilmer Daniel Fernandez Pinto   Initial version
*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_create_department](
    @department_description VARCHAR(100)
   ,@department_name VARCHAR(50)
   ,@result BIT OUTPUT  --resultado
)
AS 
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

    INSERT INTO [dbo].[department]
    (department_description, department_name, created_on)
    VALUES (@department_description, @department_name, GETDATE());

    SET @result = @@IDENTITY;

    SELECT @result; 
END
GO
PRINT 'Store procedure Created! -  [sp_create_department]';
GO


IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_create_contract]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_create_contract]
	PRINT 'Store procedure deteled -  [sp_create_contract]';
END
GO


-- Drop User CRUD PROCEDURES
/******************************************************************************
**  Table Name: contract
**  Desc: Table for sp_create_contract
** 
**  Called by: ssi
**
**  Author: Gilmer Daniel Fernandez Pinto
**
**  Date: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/28/2018 Gilmer Daniel Fernandez Pinto   Initial version
*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_create_contract](
    @contract_code VARCHAR(50)
   ,@contract_city VARCHAR(100)
   ,@contract_type VARCHAR(100)
   ,@contract_date DATETIME
   ,@contract_salary FLOAT
   ,@contract_description VARCHAR(100)
   ,@result BIT OUTPUT  --resultado
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

    SET @result = @@IDENTITY;

    SELECT @result; 
END
GO
PRINT 'Store procedure Created! -  [sp_create_contract]';
GO


IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_create_area]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_create_area]
	PRINT 'Store procedure deteled -  [sp_create_area]';
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

    SELECT @result; 
END
GO
<<<<<<< HEAD
PRINT 'Store procedure Created! -  [sp_create_area]';
=======

-- Create Position stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_create_position]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_create_position]
	PRINT 'Drop procedure: [dbo].[sp_create_position]';
END
GO
-- Create Position CRUD PROCEDURES
/******************************************************************************
**  Table Name: Position
**  Desc: Table for [dbo].[sp_create_position]
** 
**  Called by: SSI
**
**  Author: Ivan Misericordia Eulate
**
**  Date: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/27/2018 Ivan Misericordia Eulate   Initial version
*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_create_position](
				@position_description VARCHAR(800)
			   ,@position_level INT
			   ,@positon_name VARCHAR(300)
			   ,@parent_position_position_id BIGINT
)
AS 
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

    INSERT INTO [dbo].[position](position_description
								,position_level
								,position_name
								,parent_position_position_id
								,created_on)
    VALUES ( @position_description
			,@position_level
			,@positon_name
			,@parent_position_position_id
			,GETDATE());

  SELECT @@IDENTITY AS position_id;
END
GO

-- DELETE position stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_delete_position]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_delete_position]
	PRINT 'Drop procedure: [dbo].[sp_delete_position]';
END
GO
-- Drop position CRUD PROCEDURES
/******************************************************************************
**  Table Name: position
**  Desc: delete an position
** 
**  Called by: ssi
**
**  Author: Ivan Misericordia Eulate
**
**  Date: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/28/2018 Ivan Misericordia Eulate   Initial version
*******************************************************************************/
CREATE PROCEDURE [dbo].[sp_delete_position](
    @position_id INT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN 
    
    DELETE FROM [dbo].[position]
    WHERE position_id = @position_id;
END
GO

-- UPDATE position stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_edit_position]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_edit_position]
	PRINT 'Drop procedure: [dbo].[sp_edit_position]';
END
GO
-- UPDATE position CRUD PROCEDURES
/******************************************************************************
**  Table Name: position
**  Desc: Table for [dbo].[sp_edit_position]
** 
**  Called by: ssi
**
**  Author: Ivan Misericordia Eulate
**
**  Date: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/28/2018 Ivan Misericordia Eulate   Initial version
*******************************************************************************/
CREATE PROCEDURE [dbo].[sp_edit_position](
			    @position_id BIGINT
			   ,@position_description VARCHAR(800)
			   ,@position_level INT
			   ,@position_name VARCHAR(300)
			   ,@parent_position_position_id BIGINT
)
AS 
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
	UPDATE [dbo].[position]
	SET 
       [position_description] = @position_description
      ,[position_level] = @position_level
      ,[position_name] = @position_name
      ,[parent_position_position_id] = @parent_position_position_id
	  ,[created_on] = GETDATE()
	WHERE [position_id] = @position_id;

	SELECT [position_id]
      ,[created_on]
      ,[updated_on]
      ,[position_description]
      ,[position_level]
      ,[position_name]
      ,[parent_position_position_id]
	FROM [dbo].[position]
	WHERE [position_id] = @position_id;

  SELECT @@IDENTITY AS position_id;
END
GO

--GET positions store procedure
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_get_all_position]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_get_all_position]
	PRINT 'Drop procedure: [dbo].[sp_get_all_position]';
END
GO
-- Equipments CRUD PROCEDURES
/******************************************************************************
**  Table Name: position
**  Desc: Table for sp_get_all_position
** 
**  Called by: ssi
**
**  Author: Ivan Misericordia Eulate
**
**  Date: 05/28/2018

*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/28/2018 Ivan Misericordia Eulate   Initial version
*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_get_all_position](
	@position_id BIGINT = null
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    SELECT   position_id
			,position_name
			,position_level
			,position_description
			,parent_position_position_id 
	FROM [dbo].[position] as posi
	WHERE posi.position_id = ISNULL(@position_id, posi.position_id);
END
GO

-- Create department_position stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_create_department_position]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_create_department_position]
	PRINT 'Drop procedure: [dbo].[sp_create_department_position]';
END
GO
-- Create department_position CRUD PROCEDURES
/******************************************************************************
**  Table Name: department_position
**  Desc: Table for sp_create_department_position
** 
**  Called by: ssi
**
**  Author: Ivan Misericordia Eulate
**
**  Date: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/28/2018 Ivan Misericordia Eulate   Initial version
*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_create_department_position](
				@department_id BIGINT
			   ,@position_id BIGINT
)
AS 
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

    INSERT INTO [dbo].[department_position](
					department_id
				   ,position_id)
    VALUES ( @department_id
			,@position_id);

  SELECT @@IDENTITY AS department_position_id;
END
GO

-- DELETE department_position stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_delete_department_position]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_delete_department_position]
	PRINT 'Drop procedure: [dbo].[sp_delete_department_position]';
END
GO
-- Drop department_position CRUD PROCEDURES
/******************************************************************************
**  Table Name: department_position
**  Desc: delete an department_position
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
CREATE PROCEDURE [dbo].[sp_delete_department_position](
    @department_id BIGINT
   ,@position_id BIGINT
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN 
    
    DELETE FROM [dbo].[department_position]
    WHERE department_id = @department_id AND
		  position_id = @position_id;
END
GO

-- UPDATE department_position stored procedure.
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_edit_department_position]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_edit_department_position]
	PRINT 'Drop procedure: [dbo].[sp_edit_department_position]';
END
GO
-- Update Equipament CRUD PROCEDURES
/******************************************************************************
**  Table Name: department_position
**  Desc: Table for sp_edit_department_position
** 
**  Called by: ssi
**
**  Author: Ivan Misericordia Eulate
**
**  Date: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        -------------------------------------------------
** 05/28/2018 Ivan Misericordia Eulate   Initial version
*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_edit_department_position](
			    @department_id BIGINT
			   ,@position_id BIGINT
)
AS 
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN

    UPDATE [dbo].[department_position]
     SET [department_id] = @department_id
		,[position_id] = @position_id
	 WHERE [department_id]=@department_id

    SELECT [department_id]
		  ,[position_id]
	FROM [dbo].[department_position]
	WHERE [department_id]=@department_id

	SELECT @@IDENTITY AS department_position_id;

END
>>>>>>> 1385d2f76b2a3153a00c28ccf331a786c335203d
GO

--GET department_position store procedure
IF EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[sp_get_all_department_position]') 
		AND type in (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[sp_get_all_department_position]
	PRINT 'Drop procedure: [dbo].[sp_get_all_department_position]';
END
GO
-- department_position CRUD PROCEDURES
/******************************************************************************
**  Table Name: Equipaments
**  Desc: Table for sp_get_all_department_position
** 
**  Called by: ssi
**
**  Author: Ivan Misericordia Eulate
**
**  Date: 05/26/2018

*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/26/2018 Ivan Misericordia Eulate   Initial version
*******************************************************************************/

CREATE PROCEDURE [dbo].[sp_get_all_department_position](
	@department_id BIGINT = null
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    SELECT   department_id
			,position_id 
	FROM [dbo].[department_position] as de_po
	WHERE de_po.department_id = ISNULL(@department_id, de_po.department_id);
END
GO




