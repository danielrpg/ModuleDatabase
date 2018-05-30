-- Creamos o usamos DB
-- Create Database SSI-D
/******************************************************************************
**  Name: SSID
**  Desc: Database for the project SSI group D
** 
**  Called by: SSI-D
**
**  Author: Jesus David Pierola Alvarado
**
**  Date: 28/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 28/05/2018 Jesus David Pierola Alvarado   Initial version
*******************************************************************************/
IF NOT EXISTS(
	SELECT *
	FROM sys.databases
	WHERE name = 'SSID')
BEGIN
	CREATE DATABASE [SSID]
END
GO

USE [SSID]
GO

-- Create Table Areas
/******************************************************************************
**  Table Name: Areas
**  Desc: Table for Areas
** 
**  Called by: ssi
**
**  Author: Daniel Fernandez
**
**  Date: 05/22/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/22/2018 Daniel Fernandez   Initial version
*******************************************************************************/

PRINT 'Creating the areas table....';
IF NOT EXISTS(SELECT 1
        FROM sys.objects
        WHERE Type = 'U'
        AND object_id = OBJECT_ID('dbo.areas'))  
BEGIN
    CREATE TABLE [dbo].[areas]
    (
        [area_id]          BIGINT CONSTRAINT PK_area PRIMARY KEY IDENTITY(1,1) NOT NULL
        ,[area_name]        VARCHAR(50) CONSTRAINT NN_AreaName NOT NULL
        ,[area_description] VARCHAR(MAX) CONSTRAINT NN_AreaDesc NOT NULL
		,[created_on] [datetime] NOT NULL DEFAULT GETDATE()
		,[updated_on] [datetime] NULL
    );
    PRINT 'Table area created!';
END    
ELSE 
BEGIN
	PRINT 'Table area already exists into the database';
END
GO

-- Create Table Personal
/******************************************************************************
**  Table Name: Personal
**  Desc: Table for Personal
** 
**  Called by: ssi
**
**  Author: Daniel Fernandez
**
**  Date: 05/22/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/22/2018 Daniel Fernandez   Initial version
*******************************************************************************/


PRINT 'Creating the personals table....';
IF NOT EXISTS(SELECT 1
        FROM sys.objects
        WHERE Type = 'U'
        AND object_id = OBJECT_ID('dbo.personals'))  
BEGIN
    CREATE TABLE [dbo].[personals]
    (
        [personal_id]        BIGINT CONSTRAINT PK_Personal PRIMARY KEY IDENTITY(1,1) NOT NULL
        ,[personal_name]      VARCHAR(100) CONSTRAINT NN_PersonalName NOT NULL
        ,[personal_last_name] VARCHAR(100) NULL
        ,[personal_email]     VARCHAR(100) CONSTRAINT NN_PersonalEmail NOT NULL
        ,[personal_direction] VARCHAR(200) CONSTRAINT NN_Direction NOT NULL
        ,[personal_cellphone] VARCHAR(50) NULL
        ,[personal_telephone] VARCHAR(50) NULL
        ,[personal_active]    BIT CONSTRAINT NN_Active NOT NULL
        ,[personal_birthdate] VARCHAR(50) NULL
		,[created_on] [datetime] NOT NULL DEFAULT GETDATE()
		,[updated_on] [datetime] NULL
        ,[area_area_id]       BIGINT CONSTRAINT NN_AreaId NOT NULL 
            
    );
PRINT 'Table personals created!';
END    
ELSE 
BEGIN
	PRINT 'Table personals already exists into the database';
END
GO

-- Create Foreign key personal_area
/******************************************************************************
**  Table Name: FK_personal_area
**  Desc: Table for personal_area
** 
**  Called by: ssi
**
**  Author: Daniel Fernandez
**
**  Date: 05/22/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/22/2018 Daniel Fernandez   Initial version
*******************************************************************************/

PRINT 'Creating the Foreign key personal_area ....';
IF NOT EXISTS(SELECT 1
            FROM sys.foreign_keys
            WHERE object_id = OBJECT_ID('FK_pers_area')
            AND parent_object_id = OBJECT_ID('dbo.personals')
)
BEGIN
    ALTER TABLE dbo.personals
    ADD CONSTRAINT FK_pers_area 
    FOREIGN KEY(area_area_id)
    REFERENCES areas(area_id);

    PRINT 'Foreign key created';
END
ELSE
BEGIN
    PRINT 'Foreign key already exist';
END
GO

-- Create Table HistoryAreaPersonal
/******************************************************************************
**  Table Name: history_area_personal
**  Desc: Table for history_area_personal
** 
**  Called by: ssi
**
**  Author: Jesus David Pierola Alvarado
**
**  Date: 29/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 29/05/2018 Jesus David Pierola Alvarado   Initial version
*******************************************************************************/

PRINT 'Creating the history_area_personal table....';
IF NOT EXISTS(SELECT 1
        FROM sys.objects
        WHERE Type = 'U'
        AND object_id = OBJECT_ID('dbo.history_area_personal'))  
BEGIN
	CREATE TABLE [dbo].[history_area_personal](
		[hap_id] [bigint] NOT NULL IDENTITY(1,1) CONSTRAINT PK_History_Area_Pers PRIMARY KEY
		,[created_on] [datetime] NOT NULL
		,[updated_on] [datetime] NULL
		,[hap_datea_fin] [datetime] NULL
		,[hap_date_ini] [datetime] NULL
		,[hap_status] [bit] NULL
		,[personal_personal_id] [bigint] NOT NULL
	);
	PRINT 'Table history_area_personal created!';
END    
ELSE 
BEGIN
	PRINT 'Table history_area_personal already exists into the database';
END
GO

-- Create Foreign key history_area_personal with Personal
/******************************************************************************
**  Table Name: FK_personal_history_area
**  Desc: Table for history_area_personal
** 
**  Called by: ssi
**
**  Author: Jesus David Pierola Alvarado
**
**  Date: 29/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 29/05/2018 Jesus David Pierola Alvarado   Initial version
*******************************************************************************/

PRINT 'Creating the Foreign key FK_personal_history_area ....';
IF NOT EXISTS(SELECT 1
            FROM sys.foreign_keys
            WHERE object_id = OBJECT_ID('FK_personal_history_area')
            AND parent_object_id = OBJECT_ID('dbo.history_area_personal')
)
BEGIN
    ALTER TABLE [dbo].[history_area_personal]  WITH CHECK ADD  
	CONSTRAINT FK_personal_history_area FOREIGN KEY([personal_personal_id])
	REFERENCES [dbo].[personals] ([personal_id])
	
	ALTER TABLE [dbo].[history_area_personal] CHECK CONSTRAINT FK_personal_history_area

    PRINT 'Foreign key FK_personal_history_area created';
END
ELSE
BEGIN
    PRINT 'Foreign key FK_personal_history_area already exist';
END
GO

-- Create Table Incident_type
/******************************************************************************
**  Table Name: Incident_type
**  Desc: Table for Incident_type
** 
**  Called by: ssi
**
**  Author: Christian Tola
**
**  Date: 05/21/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/21/2018 Christian Tola   Initial version
*******************************************************************************/
PRINT 'Creating the incident_type table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[incident_type]') 
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[incident_type](
		[incident_type_id] BIGINT IDENTITY(1,1) NOT NULL
		,[incident_type_name] VARCHAR(50) CONSTRAINT NN_IncidentTypeName NOT NULL
		,[incident_type_description] VARCHAR(MAX) CONSTRAINT NN_IncidentTypeDesc NOT NULL
		,[incident_type_type] VARCHAR(50) CONSTRAINT NN_IncidentType NOT NULL
		,[incident_type_subtype] VARCHAR(50) CONSTRAINT NN_IncidentTypeSubType NOT NULL
	,CONSTRAINT [PK_IncidentType] PRIMARY KEY
	(
		[incident_type_id] ASC
	));

	PRINT 'Table Incident_type created!';
END
ELSE 
BEGIN
	PRINT 'Table Incident_type already exists into the database';
END
GO

-- Create Table Incident_detail
/******************************************************************************
**  Table Name: Incident_detail
**  Desc: Table for Incident_detail
** 
**  Called by: ssi
**
**  Author: Christian Tola
**
**  Date: 05/21/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/21/2018 Christian Tola   Initial version
*******************************************************************************/
PRINT 'Creating the Incident_detail table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[incident_detail]') 
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[incident_detail](
		[incident_detail_id] BIGINT IDENTITY(1,1) NOT NULL
		,[incident_detail_status] VARCHAR(15) CONSTRAINT NN_IncidentDetailStatus NOT NULL
		,[incident_detail_name] VARCHAR(50) CONSTRAINT NN_IncidentDetailName NOT NULL
		,[incident_detail_description] VARCHAR(200) CONSTRAINT NN_IncidentDetailDescription NOT NULL
		,CONSTRAINT [PK_IncidentDetail] PRIMARY KEY
		(
			[incident_detail_id] ASC
		)
	);

	PRINT 'Table Incident_detail created!';
END
ELSE 
BEGIN
	PRINT 'Table Incident_detail already exists into the database';
END
GO

-- Create Table Incident
/******************************************************************************
**  Table Name: Incident
**  Desc: Table for Incident
** 
**  Called by: ssi
**
**  Author: Christian Tola
**
**  Date: 05/21/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/21/2018 Christian Tola   Initial version
*******************************************************************************/
PRINT 'Creating the Incident table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[incident]') 
		       AND type in (N'U'))
 BEGIN
	CREATE TABLE [dbo].[incident](
		[incident_id] BIGINT IDENTITY(1,1) NOT NULL
		,[incident_code] VARCHAR(10) CONSTRAINT NN_IncidentCode NOT NULL
		,[incident_number] INT CONSTRAINT NN_IncidentNumber NOT NULL
		,[incident_registered_date] DATETIME CONSTRAINT NN_IncidentRegisteredDate NOT NULL
		,[incident_reincident] BIT CONSTRAINT NN_IncidentReincident NOT NULL
		,[incident_treatment] BIT NULL
		,[incident_severity] VARCHAR(100) NULL
		,[incident_reported_by] VARCHAR(100) CONSTRAINT NN_IncidentReportedBy NOT NULL
		,[incident_detail_id] BIGINT NOT NULL
		,[incident_type_id] BIGINT NOT NULL
		,[personal_id] BIGINT NOT NULL
		CONSTRAINT [PK_Incident] PRIMARY KEY
	(
		[incident_id] ASC
	));

	PRINT 'Table Incident created!';
END
ELSE 
BEGIN
	PRINT 'Table Incident already exists into the database';
END
GO

-- Create Foreign key Incident_Incident_Type
/******************************************************************************
**  Constraint Name: Incident_Incident_Type
**  Desc: Constraint for Foreign Key between Incident and Incident_Type
** 
**  Called by: ssi
**
**  Author: Christian Tola
**
**  Date: 05/22/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/22/2018 Christian Tola   Initial version
*******************************************************************************/

PRINT 'Creating the Foreign key Incident_Incident_Type ....';
IF NOT EXISTS(SELECT 1
            FROM sys.foreign_keys
            WHERE object_id = OBJECT_ID('FK_Inc_IncType')
            AND parent_object_id = OBJECT_ID('dbo.Incident'))
BEGIN
    ALTER TABLE dbo.incident 
    ADD CONSTRAINT FK_Inc_IncType
    FOREIGN KEY(incident_type_id)
    REFERENCES incident_type(incident_type_id);

    PRINT 'Foreign key created';
END
ELSE
BEGIN
    PRINT 'Foreign key already exist';
END
GO
-- Create Foreign key Incident_Incident_Detail
/******************************************************************************
**  Constraint Name: Incident_Incident_Detail
**  Desc: Constraint for Foreign Key between Incident and Incident_Detail
** 
**  Called by: ssi
**
**  Author: Christian Tola
**
**  Date: 05/22/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/22/2018 Christian Tola   Initial version
*******************************************************************************/

PRINT 'Creating the Foreign key Incident_Incident_Detail ....';
IF NOT EXISTS(SELECT 1
            FROM sys.foreign_keys
            WHERE object_id = OBJECT_ID('FK_Inc_IncDetail')
            AND parent_object_id = OBJECT_ID('dbo.Incident'))
BEGIN
    ALTER TABLE dbo.incident 
    ADD CONSTRAINT FK_Inc_IncDetail
    FOREIGN KEY(incident_detail_id)
    REFERENCES incident_detail(incident_detail_id);

    PRINT 'Foreign key created';
END
ELSE
BEGIN
    PRINT 'Foreign key already exist';
END
GO
-- Create Foreign key Incident-Personals
/******************************************************************************
**  Constraint Name: Incident-Personal
**  Desc: Constraint for Foreign Key between Incident and Personals
** 
**  Called by: ssi
**
**  Author: Jesús David Piérola Alvarado
**
**  Date: 28/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                      Description:
** --------   --------						-----------------------------------
** 28/05/2018 Jesús David Piérola Alvarado  Initial version
*******************************************************************************/

PRINT 'Creating the Foreign key Incident-Personals....';
IF NOT EXISTS(SELECT 1
            FROM sys.foreign_keys
            WHERE object_id = OBJECT_ID('FK_Incide_Personal')
            AND parent_object_id = OBJECT_ID('dbo.Incident'))
BEGIN
    ALTER TABLE dbo.incident 
    ADD CONSTRAINT FK_Incide_Personal
    FOREIGN KEY(personal_id)
    REFERENCES personals(personal_id);

    PRINT 'Foreign key created';
END
ELSE
BEGIN
    PRINT 'Foreign key already exist';
END
GO

-- Create Table user
/******************************************************************************
**  Table Name: user
**  Desc: Table for user
** 
**  Called by: ssi
**
**  Author: Daniel Fernandez
**
**  Date: 05/22/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/22/2018 Daniel Fernandez   Initial version
*******************************************************************************/

PRINT 'Creating the users table....';
IF NOT EXISTS(SELECT 1
        FROM sys.objects
        WHERE Type = 'U'
        AND object_id = OBJECT_ID('dbo.users'))  
BEGIN
    CREATE TABLE [dbo].[users]
    (
        [user_id]       BIGINT CONSTRAINT PK_UserId PRIMARY KEY IDENTITY(1,1) NOT NULL
        ,[user_name]     VARCHAR(50) CONSTRAINT NN_UserName NOT NULL
        ,[user_password] VARCHAR(100) CONSTRAINT NN_UserPassword NOT NULL
        ,[user_active]   BIT CONSTRAINT NN_UserActive NOT NULL
		,[created_on] [datetime] NOT NULL DEFAULT GETDATE()
		,[updated_on] [datetime] NULL
        --,[personal_id]   INT CONSTRAINT NN_PersonalId NOT NULL 
    );
    PRINT 'Table user created!';
END    
ELSE 
BEGIN
	PRINT 'Table user already exists into the database';
END
GO

-- Create Table roles
/******************************************************************************
**  Table Name: Roles
**  Desc: Table for Roles
** 
**  Called by: ssi
**
**  Author: Daniel Fernandez
**
**  Date: 05/22/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/22/2018 Daniel Fernandez   Initial version
*******************************************************************************/

PRINT 'Creating the role table....';
IF NOT EXISTS(SELECT 1
        FROM sys.objects
        WHERE Type = 'U'
        AND object_id = OBJECT_ID('dbo.roles'))  
BEGIN
    CREATE TABLE [dbo].[roles]
    (
        [role_id]   BIGINT CONSTRAINT PK_Role PRIMARY KEY IDENTITY(1,1) NOT NULL
        ,[role_name] VARCHAR(100) CONSTRAINT NN_RoleName NOT NULL
		,[created_on] [datetime] NOT NULL DEFAULT GETDATE()
		,[updated_on] [datetime] NULL
    );
        PRINT 'Table roles created!';
END    
ELSE 
BEGIN
	PRINT 'Table roles already exists into the database';
END
GO

PRINT 'Creating the user_role table....';
IF NOT EXISTS(SELECT 1
        FROM sys.objects
        WHERE Type = 'U'
        AND object_id = OBJECT_ID('dbo.user_role'))  
BEGIN

    CREATE TABLE [dbo].[user_role]
    (
        [role_id]      BIGINT CONSTRAINT NN_RoleId NOT NULL ,
        [user_id]      BIGINT CONSTRAINT NN_UserId NOT NULL ,
        CONSTRAINT PK_UserRole PRIMARY KEY ([role_id], [user_id])

    );
        PRINT 'Table user_role created!';
END    
ELSE 
BEGIN
	PRINT 'Table user_role already exists into the database';
END
GO

-- Create Foreign key user_personal
/******************************************************************************
**  Table Name: FK_user_personal
**  Desc: Table for user_personal
** 
**  Called by: ssi
**
**  Author: Daniel Fernandez
**
**  Date: 05/22/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/22/2018 Daniel Fernandez   Initial version
*******************************************************************************/
--PRINT 'Creating the Forengn key user personal ....';
--IF NOT EXISTS(SELECT 1
--            FROM sys.foreign_keys
--            WHERE object_id = OBJECT_ID('FK_user_per')
--            AND parent_object_id = OBJECT_ID('dbo.user'))
--    BEGIN
--        ALTER TABLE [dbo].[user] 
--        ADD CONSTRAINT FK_user_per 
--        FOREIGN KEY(personal_id)
--        REFERENCES personal(personal_id);
        
--        PRINT 'Foreign key created';
--    END
--ELSE
--    BEGIN
--        PRINT 'Foreign key already exist';
--    END
--	GO

-- Create Foreign key user_role
/******************************************************************************
**  Table Name: FK_user_role
**  Desc: Table for user_role
** 
**  Called by: ssi
**
**  Author: Daniel Fernandez
**
**  Date: 05/22/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/22/2018 Daniel Fernandez   Initial version
*******************************************************************************/
PRINT 'Creating the Forengn key user role ....';
IF NOT EXISTS(SELECT 1
            FROM sys.foreign_keys
            WHERE object_id = OBJECT_ID('FK_role_userr')
            AND parent_object_id = OBJECT_ID('dbo.user_role'))
BEGIN
    ALTER TABLE dbo.user_role 
    ADD CONSTRAINT FK_role_userr 
    FOREIGN KEY(role_id)
    REFERENCES dbo.roles(role_id);
        
    PRINT 'Foreign key created';
END
ELSE
BEGIN
    PRINT 'Foreign key already exist';
END
GO

-- Create Foreign key role_user
/******************************************************************************
**  Table Name: FK_role_user
**  Desc: Table for role_user
** 
**  Called by: ssi
**
**  Author: Daniel Fernandez
**
**  Date: 05/22/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/22/2018 Daniel Fernandez   Initial version
*******************************************************************************/

PRINT 'Creating the Forengn key role user ....';
IF NOT EXISTS(SELECT *
            FROM sys.foreign_keys
            WHERE object_id = OBJECT_ID('FK_role_useru')
            AND parent_object_id = OBJECT_ID('dbo.user_role'))
BEGIN
        
    ALTER TABLE dbo.user_role 
    ADD CONSTRAINT FK_role_useru 
    FOREIGN KEY([user_id])
    REFERENCES [dbo].[users]([user_id]);

    PRINT 'Foreign key created';
END
ELSE
BEGIN
    PRINT 'Foreign key already exist';
END
GO

-- Create Table Equipments
/******************************************************************************
**  Table Name: Equipments
**  Desc: Table for Equipments
** 
**  Called by: SSI-D
**
**  Author: Ivan Misericordia E.
**
**  Date: 05/21/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/21/2018 Ivan Misericordia E.   Initial version
*******************************************************************************/
PRINT 'Creating the Equipments table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[equipaments]') 
		       AND type in (N'U'))
 BEGIN
	CREATE TABLE [dbo].[equipaments](
		[equipament_id][bigint] IDENTITY(1,1) not null
		,[equipament_name][varchar](50) CONSTRAINT NN_EquipmentName not null
		,[equipament_type][int] CONSTRAINT NN_EquipmentType not null
		,[equipament_description][varchar](200) CONSTRAINT NN_EquipmentDescription null
		,[equipament_image][varbinary](max)  null
		,[created_on] [datetime] NOT NULL DEFAULT GETDATE()
		,[updated_on] [datetime] NULL
		,CONSTRAINT [PK_Equipament] PRIMARY KEY
		(
			[equipament_id] ASC
		)
	);

	PRINT 'Table Equipment created!';
END
ELSE 
BEGIN
	PRINT 'Table Equipment already exists into the database';
END
GO

-- Create Table Kardex_equipments
/******************************************************************************
**  Table Name: Kardex_equipments
**  Desc: Table for Kardex_equipments
** 
**  Called by: ssi
**
**  Author: Ivan Misericordia E.
**
**  Date: 05/21/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/21/2018 Ivan Misericordia E.   Initial version
*******************************************************************************/
PRINT 'Creating the Kardex_equipments table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[Kardex_equipaments]') 
		       AND type in (N'U'))
 BEGIN
	CREATE TABLE [dbo].[kardex_equipaments](
		[equipament_kardex_id][bigint] IDENTITY(1,1) not null
		,[date_kardex][datetime] CONSTRAINT NN_DateKardex not null
		,[entry_kardex][int] CONSTRAINT NN_EntryKardex not null
		,[outlay_kardex][int] CONSTRAINT NN_OutlayKardex not null
		,[balance_kardex][int] CONSTRAINT NN_BalanceKardex not null
		,[created_on] [datetime] NOT NULL DEFAULT GETDATE()
		,[updated_on] [datetime] NULL
		,[equipament_id][bigint] not null
		,CONSTRAINT [PK_equipament_kardex] PRIMARY KEY
		(
			[equipament_kardex_id] ASC
		)
	);

	PRINT 'Table Kardex_equipaments created!';
 END
 ELSE 
BEGIN
	PRINT 'Table Kardex_equipaments already exists into the database';
END
GO

-- Create Table Inventory
/******************************************************************************
**  Table Name: Inventory
**  Desc: Table for Inventory
** 
**  Called by: SSI-D
**
**  Author: Ivan Misericordia E.
**
**  Date: 05/21/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/21/2018 Ivan Misericordia E.   Initial version
*******************************************************************************/
PRINT 'Creating the Inventory table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[inventory]') 
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[inventory](
		[inventory_id][bigint] IDENTITY(1,1) not null
		,[active_assignament][bit] CONSTRAINT NN_ActiveAssigment not null
		,[date_assignament][datetime] CONSTRAINT NN_DateAssigmnet not null
		,[status_assignament][varchar](50) CONSTRAINT NN_StatusAssigment not null
		,[created_on] [datetime] NOT NULL DEFAULT GETDATE()
		,[updated_on] [datetime] NULL
		,[equipament_id][bigint] not null
		,[personal_id][bigint] not null
		,CONSTRAINT [PK_inventory] PRIMARY KEY
		(
			[inventory_id] ASC
		)
	);

	PRINT 'Table Inventory created!';
END
ELSE 
BEGIN
	PRINT 'Table Inventory already exists into the database';
END
GO

-- Define the relationship between Kardex_equipment and Equipment.
/******************************************************************************
**  Table Name: FK_kardex_equipment
**  Desc: Foreing key for kardex_equipment
** 
**  Called by: SSI-D
**
**  Author: Ivan Misericordia E.
**
**  Date: 05/21/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/21/2018 Ivan Misericordia E.   Initial version
*******************************************************************************/
PRINT 'Creating FK_kardex_equipament to Kardex_equipament';
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_kardex_equipament]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Kardex_equipaments]'))
BEGIN
	ALTER TABLE [dbo].[kardex_equipaments]  WITH CHECK ADD  
			CONSTRAINT FK_kardex_equipament FOREIGN KEY([equipament_id])
	REFERENCES [dbo].[equipaments] ([equipament_id]);
			
	ALTER TABLE [dbo].[kardex_equipaments] CHECK 
			CONSTRAINT FK_kardex_equipament;
			
	PRINT 'FK_kardex_equipaments one ....';
END
ELSE
BEGIN
	PRINT 'Foreing key: FK_kardex_equipaments already exists into the database';
END
GO

-- Define the relationship between Inventory and Equipment.
/******************************************************************************
**  Table Name: FK_inventory_equiapment
**  Desc: Foreing key for Inventory
** 
**  Called by: SSI-D
**
**  Author: Ivan Misericordia E.
**
**  Date: 05/21/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/21/2018 Ivan Misericordia E.   Initial version
*******************************************************************************/
PRINT 'Creating FK_inventory_equipament to Inventory';
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_inventory_equipament]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Inventory]'))
BEGIN
	ALTER TABLE [dbo].[inventory]  WITH CHECK ADD  
			CONSTRAINT [FK_inventory_equipament] FOREIGN KEY([equipament_id])
	REFERENCES [dbo].[equipaments] ([equipament_id]);

	ALTER TABLE [dbo].[inventory] CHECK 
			CONSTRAINT [FK_inventory_equipament];
			
	PRINT 'FK_inventory_equipament done ....';
END
ELSE
BEGIN
	PRINT 'Foreing key: FK_inventory_equipament already exists into the database';
END
GO

-- Define the relationship between Inventory and Personal.
/******************************************************************************
**  Table Name: FK_inventory_personal
**  Desc: Foreing key for Inventory
** 
**  Called by: SSI-D
**
**  Author: Ivan Misericordia E.
**
**  Date: 05/21/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/21/2018 Ivan Misericordia E.   Initial version
*******************************************************************************/
PRINT 'Creating FK_inventory_personal to Inventory';
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_inventory_personal]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Inventory]'))
BEGIN
	ALTER TABLE [dbo].[inventory]  WITH CHECK ADD  
			CONSTRAINT [FK_inventory_personal] FOREIGN KEY([personal_id])
	REFERENCES [dbo].[personals] ([personal_id]);
			
	ALTER TABLE [dbo].[inventory] CHECK 
			CONSTRAINT [FK_inventory_personal];
			
	PRINT 'FK_inventory_personal done ....';
END
ELSE
BEGIN
	PRINT 'Foreing key: FK_inventory_personal already exists into the database';
END
GO

-- Create Table program_sso_trainer
/******************************************************************************
**  Table Name: program_sso_trainer
**  Desc: Table for program_sso_trainer
** 
**  Called by: ssi
**
**  Author: Marcos Bustos
**
**  Date: 05/21/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/21/2018 Marcos Bustos   Initial version
*******************************************************************************/
PRINT 'Creating the program_sso_trainer table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[program_sso_trainer]') 
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[program_sso_trainer](
		[sso_trainer_id] [BIGINT] IDENTITY(1,1) NOT NULL
		,[created_on] DATETIME NOT NULL
		,[updated_on] DATETIME NULL
		,[sso_trainer_skills] [varchar](255) NULL
		,[sso_trainer_ci] [varchar](10) NULL
		,[sso_trainer_image] [varbinary](max) NULL
		,[sso_trainer_name] [varchar](100) NULL
		,[sso_trainer_specialty] [varchar](255) NULL
		, CONSTRAINT [PK_ProgSSOTrainer] PRIMARY KEY
		(
			sso_trainer_id ASC
		)
	);
	PRINT 'Table program_sso_trainer created!';
END
ELSE 
BEGIN
	PRINT 'Table program_sso_trainer already exists into the database';
END
GO


-- Create Table program_sso
/******************************************************************************
**  Table Name: program_sso
**  Desc: Table for program_sso
** 
**  Called by: ssi
**
**  Author: Marcos Bustos
**
**  Date: 05/21/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/21/2018 Marcos Bustos   Initial version
*******************************************************************************/
PRINT 'Creating the program_sso table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[program_sso]') 
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[program_sso](
		[sso_id] [bigint] IDENTITY(1,1) NOT NULL
		,[created_on] DATETIME NOT NULL
		,[updated_on] DATETIME NULL
		,[sso_execution_time] [varchar](250) NULL
		,[sso_goal] [varchar](250) NULL
		,[sso_indicator] [varchar](250) NULL
		,[sso_objetive] [varchar](250) NULL
		,[sso_responsable] [varchar](250) NULL
		,[sso_total_cost] [float] NULL
		, CONSTRAINT [PK_program_sso] PRIMARY KEY
		(
			sso_id ASC
		)
	);
	PRINT 'Table program_sso created!';
END
ELSE 
BEGIN
	PRINT 'Table program_sso already exists into the database';
END
GO

-- Create Table program_sso_activities
/******************************************************************************
**  Table Name: program_sso_activities
**  Desc: Table for program_sso_activities
** 
**  Called by: ssid
**
**  Author: Jesus David Pierola Alvarado
**
**  Date: 29/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 29/05/2018 Jesus David Pierola Alvarado   Initial version
*******************************************************************************/
PRINT 'Creating the program_sso_activities table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[program_sso_activities]') 
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[program_sso_activities](
		[sso_detail_id] [bigint] IDENTITY(1,1) NOT NULL,
		[created_on] [datetime] NOT NULL,
		[updated_on] [datetime] NULL,
		[sso_detail_activities] [varchar](250) NULL,
		[sso_detail_goal] [varchar](200) NULL,
		[so_detail_number] [int] NULL,
		[sso_detail_time] [varchar](255) NULL,
		[soo_detail_type] [varchar](250) NULL,
		[sso_id] [bigint] NULL,
		[sso_trainer_id] [bigint] NULL,
	CONSTRAINT PK_program_sso_activ PRIMARY KEY CLUSTERED 
	(
		[sso_detail_id] ASC
	));
	
	PRINT 'Table program_sso_activities created!';
END
ELSE 
BEGIN
	PRINT 'Table program_sso already exists into the database';
END
GO

-- Define the relationship between SSO_activities and SSO_Trainer
/******************************************************************************
**  Name: FK_sso_activ_trainer
**  Desc: Foreing key for SSO_trainer
** 
**  Called by: SSI-D
**
**  Author: Jesus David Pierola Alvarado
**
**  Date: 29/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------						------------------------------------
** 29/05/2018 Jesus David Piérola Alvarado   Initial version
*******************************************************************************/
PRINT 'Creating FK_sso_activ_trainer to program_sso_activities';
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
			   WHERE object_id = OBJECT_ID(N'[dbo].[FK_sso_activ_trainer]')
			   AND parent_object_id = OBJECT_ID(N'[dbo].[program_sso_activities]')
	   )
BEGIN
	ALTER TABLE [dbo].[program_sso_activities]  WITH CHECK ADD  
	CONSTRAINT FK_sso_activ_trainer FOREIGN KEY([sso_trainer_id])
	REFERENCES [dbo].[program_sso_trainer] ([sso_trainer_id])

	ALTER TABLE [dbo].[program_sso_activities] CHECK CONSTRAINT FK_sso_activ_trainer

	PRINT 'FK_sso_activ_trainer done ....';
END
ELSE
BEGIN
	PRINT 'Foreing key: FK_sso_activ_trainer already exists into the database';
END
GO

-- Define the relationship between SSO_activities and program_SSO
/******************************************************************************
**  Name: FK_sso_activ_programsso
**  Desc: Foreing key for SSO_program
** 
**  Called by: SSI-D
**
**  Author: Jesus David Pierola Alvarado
**
**  Date: 29/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------						------------------------------------
** 29/05/2018 Jesus David Piérola Alvarado   Initial version
*******************************************************************************/
PRINT 'Creating FK_sso_activ_programsso to program_sso_activities';
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
			   WHERE object_id = OBJECT_ID(N'[dbo].[FK_sso_activ_programsso]')
			   AND parent_object_id = OBJECT_ID(N'[dbo].[program_sso_activities]')
	   )
BEGIN
	ALTER TABLE [dbo].[program_sso_activities]  WITH CHECK ADD  
	CONSTRAINT FK_sso_activ_programsso FOREIGN KEY([sso_id])
	REFERENCES [dbo].[program_sso] ([sso_id])

	ALTER TABLE [dbo].[program_sso_activities] CHECK CONSTRAINT FK_sso_activ_programsso

	PRINT 'FK_sso_activ_programsso done ....';
END
ELSE
BEGIN
	PRINT 'Foreing key: FK_sso_activ_programsso already exists into the database';
END
GO


-- Create Table program_sso_resource
/******************************************************************************
**  Table Name: program_sso_resource
**  Desc: Table for program_sso_resource
** 
**  Called by: SSI-D
**
**  Author: Jesus David Pierola Alvarado
**
**  Date: 29/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------						------------------------------------
** 29/05/2018 Jesus David Piérola Alvarado   Initial version
*******************************************************************************/
PRINT 'Creating the program_sso_resource table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[program_sso_resource]') 
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[program_sso_resource](
		[sso_resource_id] [bigint] IDENTITY(1,1) NOT NULL,
		[created_on] [datetime] NOT NULL,
		[updated_on] [datetime] NULL,
		[sso_resource_cost] [float] NULL,
		[sso_resource_detail] [varchar](200) NULL,
		[sso_detail_id] [bigint] NOT NULL,
	CONSTRAINT PK_program_sso_res PRIMARY KEY CLUSTERED 
	(
		[sso_resource_id] ASC
	));
END
GO

-- Define the relationship between SSO_resource and sso_activities
/******************************************************************************
**  Name: FK_sso_resource_activi
**  Desc: Foreing key for SSO_activiies
** 
**  Called by: SSI-D
**
**  Author: Jesus David Pierola Alvarado
**
**  Date: 29/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------						------------------------------------
** 29/05/2018 Jesus David Piérola Alvarado   Initial version
*******************************************************************************/
PRINT 'Creating FK_sso_resource_activi to program_sso_resource';
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
			   WHERE object_id = OBJECT_ID(N'[dbo].[FK_sso_resource_activi]')
			   AND parent_object_id = OBJECT_ID(N'[dbo].[program_sso_resource]')
	   )
BEGIN
	ALTER TABLE [dbo].[program_sso_resource]  WITH CHECK ADD  
	CONSTRAINT FK_sso_resource_activi FOREIGN KEY([sso_detail_id])
	REFERENCES [dbo].[program_sso_activities] ([sso_detail_id])

	ALTER TABLE [dbo].[program_sso_resource] CHECK CONSTRAINT FK_sso_resource_activi
	PRINT 'FK_sso_resource_activi done ....';
END
ELSE
BEGIN
	PRINT 'Foreing key: FK_sso_resource_activi already exists into the database';
END
GO

-- Create Table detail_personal_sso
/******************************************************************************
**  Table Name: detail_personal_sso
**  Desc: Table for detail_personal_sso
** 
**  Called by: ssi
**
**  Author: Jesus David Piérola Alvarado
**
**  Date: 29/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------						------------------------------------
** 29/05/2018 Jesus David Piérola Alvarado   Initial version
*******************************************************************************/
PRINT 'Creating the detail_personal_sso table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[detail_personal_sso]') 
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[detail_personal_sso](
		[sso_detail_id] [bigint] NOT NULL
		,[personal_id] [bigint] NOT NULL
	, CONSTRAINT [PK_DetailPersonSso] PRIMARY KEY
	(
		[sso_detail_id] ASC,
		[personal_id] ASC
	));
	PRINT 'Table detail_personal_sso created!';
END
ELSE 
BEGIN
	PRINT 'Table detail_personal_sso already exists into the database';
END
GO


-- Define the relationship between detailSSO and Personal
/******************************************************************************
**  Name: FK_sso_detail_personal
**  Desc: Foreing key for SSO_Detail
** 
**  Called by: SSI-D
**
**  Author: Jesus David Pierola Alvarado
**
**  Date: 29/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------						------------------------------------
** 29/05/2018 Jesus David Piérola Alvarado   Initial version
*******************************************************************************/
PRINT 'Creating FK_sso_detail_personal to detail_personal_sso';
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_sso_detail_personal]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[detail_personal_sso]'))
BEGIN
	ALTER TABLE [dbo].[detail_personal_sso]  WITH CHECK ADD  
	CONSTRAINT FK_sso_detail_personal FOREIGN KEY([personal_id])
	REFERENCES [dbo].[personals] ([personal_id])

	ALTER TABLE [dbo].[detail_personal_sso] CHECK CONSTRAINT FK_sso_detail_personal

	PRINT 'FK_sso_detail_personal done ....';
END
ELSE
BEGIN
	PRINT 'Foreing key: FK_sso_detail_personal already exists into the database';
END
GO

-- Define the relationship between detailSSO and SSOActivities
/******************************************************************************
**  Name: FK_detail_SSO_activities
**  Desc: Foreing key for SSO_Detail
** 
**  Called by: SSI-D
**
**  Author: Jesus David Pierola Alvarado
**
**  Date: 29/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------						------------------------------------
** 29/05/2018 Jesus David Piérola Alvarado   Initial version
*******************************************************************************/
PRINT 'Creating FK_detail_SSO_activities to detail_personal_sso';
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
			   WHERE object_id = OBJECT_ID(N'[dbo].[FK_detail_SSO_activities]')
			   AND parent_object_id = OBJECT_ID(N'[dbo].[detail_personal_sso]'))
BEGIN
	ALTER TABLE [dbo].[detail_personal_sso]  WITH CHECK ADD  
	CONSTRAINT FK_detail_SSO_activities FOREIGN KEY([sso_detail_id])
	REFERENCES [dbo].[program_sso_activities] ([sso_detail_id])
	
	ALTER TABLE [dbo].[detail_personal_sso] CHECK CONSTRAINT FK_detail_SSO_activities

	PRINT 'FK_detail_SSO_activities done ....';
END
ELSE
BEGIN
	PRINT 'Foreing key: FK_detail_SSO_activities already exists into the database';
END
GO


-- Create Table Department
/******************************************************************************
**  Table Name: Department
**  Desc: Table for Department
** 
**  Called by: SSI-D
**
**  Author: Jesus David Pierola Alvarado
**
**  Date: 22/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 22/05/2018 Jesus David Pierola Alvarado   Initial version
*******************************************************************************/
PRINT 'Creating the Department table....';
IF NOT EXISTS(SELECT * FROM sys.objects WHERE Type = 'U' AND object_id = OBJECT_ID('dbo.department'))
BEGIN
	CREATE TABLE department(
		department_id BIGINT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Department PRIMARY KEY
		,created_on DATETIME CONSTRAINT NN_DepCreated NOT NULL
		,updated_on DATETIME
		,department_name VARCHAR(50) CONSTRAINT NN_DepName NOT NULL
		,department_description VARCHAR(100)
	);

	PRINT 'Table Department created!';
END
GO

-- Create Table Position
/******************************************************************************
**  Table Name: Position
**  Desc: Table for Position
** 
**  Called by: SSI-D
**
**  Author: Jesus David Pierola Alvarado
**
**  Date: 22/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 22/05/2018 Jesus David Pierola Alvarado   Initial version
*******************************************************************************/
PRINT 'Creating the Position table....';
IF NOT EXISTS(SELECT * FROM sys.objects WHERE Type = 'U' AND object_id = OBJECT_ID('dbo.position'))
BEGIN
	CREATE TABLE [dbo].[position](
		[position_id] BIGINT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Position PRIMARY KEY
		,[created_on] [datetime] NOT NULL
		,[updated_on] [datetime] NULL
		,[position_description] [varchar](800) NULL
		,[position_level] [int] NULL
		,[position_name] [varchar](300) NULL
		,[parent_position_position_id] [bigint] NULL
	);

	PRINT 'Table Position created!';
END
ELSE
BEGIN
	PRINT 'Table Position already exists'
END
GO

-- Define the relationship between Position and Position parent
/******************************************************************************
**  Name: FK_Position_Position
**  Desc: Foreing key for Position
** 
**  Called by: SSI-D
**
**  Author: Jesus David Pierola Alvarado
**
**  Date: 22/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------						------------------------------------
** 22/05/2018 Jesus David Piérola Alvarado   Initial version
*******************************************************************************/
PRINT 'Creating FK_Position_Position to position';
IF NOT EXISTS(SELECT * 
				FROM sys.foreign_keys 
				WHERE object_id = OBJECT_ID('FK_Position_Position') 
AND parent_object_id = OBJECT_ID('dbo.position'))
BEGIN
	ALTER TABLE position ADD CONSTRAINT FK_Position_Position
	FOREIGN KEY(parent_position_position_id) REFERENCES position(position_id)

	ALTER TABLE dbo.position CHECK CONSTRAINT FK_Position_Position

	PRINT 'FK_Position_Position done ....';
END
ELSE
BEGIN
	PRINT 'Foreing key: FK_Position_Position already exists into the database';
END
GO

-- Create Table department_position
/******************************************************************************
**  Name: department_position
**  Desc: Table for department_position
** 
**  Called by: SSI-D
**
**  Author: Jesus David Pierola Alvarado
**
**  Date: 22/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 22/05/2018 Jesus David Pierola Alvarado   Initial version
*******************************************************************************/
PRINT 'Creating the department_position table....';
IF NOT EXISTS(SELECT * 
				FROM sys.objects 
				WHERE Type = 'U' 
				AND object_id = OBJECT_ID('dbo.department_position'))
BEGIN
	CREATE TABLE dbo.department_position(
		department_id BIGINT NOT NULL
		,position_id BIGINT NOT NULL
		,CONSTRAINT PK_Depart_Position PRIMARY KEY CLUSTERED 
		(
			department_id ASC,
			position_id ASC
		)
	);
	PRINT 'Table department_position created!';
END
ELSE 
BEGIN
	PRINT 'Table department_position already exists into the database';
END
GO

-- Define the relationship between DepartmentPosition and Position
/******************************************************************************
**  Name: FK_DepPos_Position
**  Desc: Foreing key for DepartmentPosition
** 
**  Called by: SSI-D
**
**  Author: Jesus David Pierola Alvarado
**
**  Date: 22/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------						------------------------------------
** 22/05/2018 Jesus David Piérola Alvarado   Initial version
*******************************************************************************/
PRINT 'Creating FK_DepPos_Position to department_position';
IF NOT EXISTS(SELECT * 
				FROM sys.foreign_keys 
				WHERE object_id = OBJECT_ID('FK_DepPos_Position') 
				AND parent_object_id = OBJECT_ID('dbo.department_position'))
BEGIN
	ALTER TABLE dbo.department_position WITH CHECK ADD CONSTRAINT FK_DepPos_Position FOREIGN KEY(position_id)
	REFERENCES dbo.position (position_id)
	
	ALTER TABLE dbo.department_position CHECK CONSTRAINT FK_DepPos_Position

	PRINT 'FK_DepPos_Position done ....';
END
ELSE
BEGIN
	PRINT 'Foreing key: FK_DepPos_Position already exists into the database';
END
GO

-- Define the relationship between DepartmentPosition and Department
/******************************************************************************
**  Name: FK_DepPos_Department
**  Desc: Foreing key for DepartmentPosition
** 
**  Called by: SSI-D
**
**  Author: Jesus David Pierola Alvarado
**
**  Date: 22/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------						------------------------------------
** 22/05/2018 Jesus David Piérola Alvarado   Initial version
*******************************************************************************/
PRINT 'Creating FK_DepPos_Department to department_position';
IF NOT EXISTS(SELECT * 
				FROM sys.foreign_keys 
				WHERE object_id = OBJECT_ID('FK_DepPos_Department') 
				AND parent_object_id = OBJECT_ID('dbo.department_position'))
BEGIN
	ALTER TABLE dbo.department_position WITH CHECK ADD CONSTRAINT FK_DepPos_Department FOREIGN KEY(department_id)
	REFERENCES dbo.department (department_id)

	ALTER TABLE dbo.department_position CHECK CONSTRAINT FK_DepPos_Department

	PRINT 'FK_DepPos_Department done ....';
END
ELSE
BEGIN
	PRINT 'Foreing key: FK_DepPos_Department already exists into the database';
END
GO

-- Create Table Contracts
/******************************************************************************
**  Table Name: Contract
**  Desc: Table for Contracts
**
**  Author: Boris Medrano
**
**  Date: 05/22/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/22/2018 Boris Medrano   Initial version
*******************************************************************************/
PRINT 'Creating the Contracts table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[contracts]') 
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[contracts](
		[contract_id] [bigint] NOT NULL IDENTITY(1,1),
		[created_on] [datetime] NOT NULL,
		[updated_on] [datetime] NULL,
		[contract_city] [varchar](100) NULL,
		[contract_code] [varchar](50) NULL,
		[contract_date] [datetime] NULL,
		[contract_description] [varchar](100) NULL,
		[contract_salary] [float] NULL,
		[contract_type] [varchar](100) NULL
	,CONSTRAINT [PK_contract_id] PRIMARY KEY
	(
		[contract_id] ASC
	));

	PRINT 'Table Contracts created!';
END
 ELSE 
	BEGIN
		PRINT 'Table Contracts already exists into the database';
	END
GO

-- Create Table personal_position_contract
/******************************************************************************
**  Table Name: personal_position_contract
**  Desc: Table for personal_position_contract
** 
**  Called by: SSI-D
**
**  Author: Jesus David Pierola Alvarado
**
**  Date: 22/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 22/05/2018 Jesus David Pierola Alvarado   Initial version
*******************************************************************************/
PRINT 'Creating the personal_position_contract table....';
IF NOT EXISTS(SELECT * 
				FROM sys.objects 
				WHERE Type = 'U' 
				AND object_id = OBJECT_ID('dbo.personal_position_contract'))
BEGIN
	CREATE TABLE dbo.personal_position_contract(
		[pers_pos_contract_id] [bigint] NOT NULL IDENTITY(1,1) CONSTRAINT PK_Per_Pos_Cont PRIMARY KEY
		,[created_on] [datetime] NOT NULL
		,[updated_on] [datetime] NULL
		,[pers_pos_contract_end_date] [datetime] NULL
		,[pers_pos_contract_init_date] [datetime] NULL
		,[pers_pos_contract_status] [bit] NULL
		,[pers_pos_contract_turno] [varchar](255) NULL
		,[contract_id] [bigint] NULL
		,[personal_id] [bigint] NOT NULL
		,[position_id] [bigint] NOT NULL);

	PRINT 'Table personal_position_contract created!';
END
ELSE
BEGIN
	PRINT 'Table personal_position_contract already exist.';
END
GO

-- Define the relationship between personal_position_contract and Position
/******************************************************************************
**  Name: FK_PersPosContr_Position
**  Desc: Foreing key for personal_position_contract
** 
**  Called by: SSI-D
**
**  Author: Jesus David Pierola Alvarado
**
**  Date: 22/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------						------------------------------------
** 22/05/2018 Jesus David Piérola Alvarado   Initial version
*******************************************************************************/
PRINT 'Creating FK_PersPosContr_Position to personal_position_contract';
IF NOT EXISTS(SELECT * 
				FROM sys.foreign_keys 
				WHERE object_id = OBJECT_ID('FK_PersPosContr_Position') 
				AND parent_object_id = OBJECT_ID('dbo.personal_position_contract'))
BEGIN
	ALTER TABLE dbo.personal_position_contract  WITH CHECK ADD  
	CONSTRAINT FK_PersPosContr_Position FOREIGN KEY(position_id)
	REFERENCES dbo.position (position_id)

	ALTER TABLE dbo.personal_position_contract CHECK CONSTRAINT FK_PersPosContr_Position

	PRINT 'FK_PersPosContr_Position done ....';
END
ELSE
BEGIN
	PRINT 'Foreing key: FK_PersPosContr_Position already exists into the database';
END
GO

-- Define the relationship between personal_position_contract and Personal
/******************************************************************************
**  Name: FK_PersPosContr_Personal
**  Desc: Foreing key for personal_position_contract
** 
**  Called by: SSI-D
**
**  Author: Jesus David Pierola Alvarado
**
**  Date: 22/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------						------------------------------------
** 22/05/2018 Jesus David Piérola Alvarado   Initial version
*******************************************************************************/
PRINT 'Creating FK_PersPosContr_Personal to personal_position_contract';
IF NOT EXISTS(SELECT * 
				FROM sys.foreign_keys 
				WHERE object_id = OBJECT_ID('FK_PersPosContr_Personal') 
				AND parent_object_id = OBJECT_ID('dbo.personal_position_contract'))
BEGIN
	ALTER TABLE dbo.personal_position_contract WITH CHECK ADD  
	CONSTRAINT FK_PersPosContr_Personal FOREIGN KEY([personal_id])
	REFERENCES dbo.personals (personal_id)

	ALTER TABLE dbo.personal_position_contract CHECK CONSTRAINT FK_PersPosContr_Personal

	PRINT 'FK_PersPosContr_Personal done ....';
END
ELSE
BEGIN
	PRINT 'Foreing key: FK_PersPosContr_Personal already exists into the database';
END
GO

-- Define the relationship between personal_position_contract and Contract
/******************************************************************************
**  Name: FK_PersPosContr_Contract
**  Desc: Foreing key for personal_position_contract
** 
**  Called by: SSI-D
**
**  Author: Jesus David Pierola Alvarado
**
**  Date: 22/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------						------------------------------------
** 22/05/2018 Jesus David Piérola Alvarado   Initial version
*******************************************************************************/
PRINT 'Creating FK_PersPosContr_Contract to personal_position_contract';
IF NOT EXISTS(SELECT * 
				FROM sys.foreign_keys 
				WHERE object_id = OBJECT_ID('FK_PersPosContr_Contract') 
				AND parent_object_id = OBJECT_ID('dbo.personal_position_contract'))
BEGIN
	ALTER TABLE dbo.personal_position_contract WITH CHECK ADD  
	CONSTRAINT FK_PersPosContr_Contract FOREIGN KEY([contract_id])
	REFERENCES dbo.contracts (contract_id)

	ALTER TABLE dbo.personal_position_contract CHECK CONSTRAINT FK_PersPosContr_Contract

	PRINT 'FK_PersPosContr_Contract done ....';
END
ELSE
BEGIN
	PRINT 'Foreing key: FK_PersPosContr_Contract already exists into the database';
END
GO


-- Create Table Functions
/******************************************************************************
**  Table Name: Functions
**  Desc: Table for Functions
**
**  Author: Boris Medrano
**
**  Date: 05/22/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/22/2018 Boris Medrano   Initial version
*******************************************************************************/
PRINT 'Creating the Functions table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[functions]') 
		       AND type in (N'U'))
 BEGIN
	CREATE TABLE [dbo].[functions](
		[func_id] [bigint] IDENTITY(1,1) NOT NULL,
		[created_on] [datetime] NOT NULL,
		[updated_on] [datetime] NULL,
		[func_description] [varchar](200) NULL,
		[func_name] [varchar](50) NULL,
		[position_position_id] [bigint] NOT NULL
	,CONSTRAINT [PK_function] PRIMARY KEY
	(
		[func_id] ASC
	));

	PRINT 'Table Functions created!';
END
ELSE 
BEGIN
	PRINT 'Table Functions already exists into the database';
END
GO

-- Create Foreign key FK_position_id_functions
/******************************************************************************
**  Name: functions
**  Desc: Table for functions
**
**  Author: Boris Medrano
**
**  Date: 05/22/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/22/2018 Boris Medrano   Initial version
*******************************************************************************/

PRINT 'Creating the Forengn key FK_position_id_functions ....';
IF NOT EXISTS(SELECT 1
            FROM sys.foreign_keys
            WHERE object_id = OBJECT_ID('FK_position_id_functions')
            AND parent_object_id = OBJECT_ID('dbo.functions'))
BEGIN
    ALTER TABLE dbo.functions 
    ADD CONSTRAINT FK_position_id_functions 
    FOREIGN KEY(position_position_id)
    REFERENCES dbo.position(position_id);

    PRINT 'Foreign key created';
END
ELSE
BEGIN
    PRINT 'Foreign key already exist';
END
GO

-- Create Table Requeriments
/******************************************************************************
**  Table Name: Requeriments
**  Desc: Table for Requeriments
**
**  Author: Boris Medrano
**
**  Date: 05/22/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/22/2018 Boris Medrano   Initial version
*******************************************************************************/
PRINT 'Creating the requirements table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[requirements]') 
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[requirements](
		[requiriment_id] [bigint] IDENTITY(1,1) NOT NULL,
		[created_on] [datetime] NOT NULL,
		[updated_on] [datetime] NULL,
		[requiriment_description] [varchar](200) NULL,
		[requiriment_name] [varchar](50) NULL,
		[position_position_id] [bigint] NOT NULL
	,CONSTRAINT [PK_requirement] PRIMARY KEY
	(
		[requiriment_id] ASC
	));

	PRINT 'Table requirements created!';
END
ELSE 
BEGIN
	PRINT 'Table requirements already exists into the database';
END
GO

-- Create Foreign key FK_position_id_requirements
/******************************************************************************
**  Table Name: requirements
**  Desc: Table for requirements
** 
**  Author: Boris Medrano
**
**  Date: 05/22/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/22/2018 Boris Medrano   Initial version
*******************************************************************************/

PRINT 'Creating the Foreign key FK_position_id_requirements ....';
IF NOT EXISTS(SELECT 1
            FROM sys.foreign_keys
            WHERE object_id = OBJECT_ID('FK_position_id_requirements')
            AND parent_object_id = OBJECT_ID('dbo.requirements'))
BEGIN
    ALTER TABLE dbo.requirements 
    ADD CONSTRAINT FK_position_id_requirements 
    FOREIGN KEY(position_position_id)
    REFERENCES dbo.position(position_id);

    PRINT 'Foreign key created';
END
ELSE
BEGIN
    PRINT 'Foreign key already exist';
END
GO


--************************************************--
-- Tablas sin relaciones
--************************************************--

-- Create Table enterprise
/******************************************************************************
**  Table Name: enterprise
**  Desc: Table for enterprise
** 
**  Called by: SSI-D
**
**  Author: Jesus David Pierola Alvarado
**
**  Date: 29/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 29/05/2018 Jesus David Pierola Alvarado   Initial version
*******************************************************************************/
PRINT 'Creating the enterprise table....';
IF NOT EXISTS(SELECT * 
				FROM sys.objects 
				WHERE Type = 'U' 
				AND object_id = OBJECT_ID('dbo.enterprise'))
BEGIN
	CREATE TABLE [dbo].[enterprise](
		[enterprise_id] [bigint] IDENTITY(1,1) NOT NULL,
		[created_on] [datetime] NOT NULL,
		[updated_on] [datetime] NULL,
		[enterprise_description] [varchar](50) NULL,
		[enterprise_name] [varchar](50) NULL,
	CONSTRAINT PK_enterprise PRIMARY KEY CLUSTERED 
	(
		[enterprise_id] ASC
	));

	PRINT 'Table enterprise created!';
END
ELSE
BEGIN
	PRINT 'Table enterprise already exist.';
END
GO

-- Create Table risk_iperc
/******************************************************************************
**  Table Name: risk_iperc
**  Desc: Table for risk_iperc
** 
**  Called by: SSI-D
**
**  Author: Jesus David Pierola Alvarado
**
**  Date: 29/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 29/05/2018 Jesus David Pierola Alvarado   Initial version
*******************************************************************************/
PRINT 'Creating the risk_iperc table....';
IF NOT EXISTS(SELECT * 
				FROM sys.objects 
				WHERE Type = 'U' 
				AND object_id = OBJECT_ID('dbo.risk_iperc'))
BEGIN
	CREATE TABLE [dbo].[risk_iperc](
		[risk_iperc_id] [bigint] IDENTITY(1,1) NOT NULL,
		[created_on] [datetime] NOT NULL,
		[updated_on] [datetime] NULL,
		[risk_iperc_area] [varchar](50) NULL,
		[risk_iperc_date] [datetime] NULL,
		[risk_iperc_goal] [varchar](50) NULL,
		[risk_iperc_resp] [varchar](50) NULL,
		[enterprise_id] [bigint] NOT NULL,
	CONSTRAINT PK_risk_iperk PRIMARY KEY CLUSTERED 
	(
		[risk_iperc_id] ASC
	));

	PRINT 'Table risk_iperc created!';
END
ELSE
BEGIN
	PRINT 'Table risk_iperc already exist.';
END
GO

-- Define the relationship between enterprise and risk_iperc
/******************************************************************************
**  Name: FK_enterprise_risk_iperc
**  Desc: Foreing key for risk_iperc
** 
**  Called by: SSI-D
**
**  Author: Jesus David Pierola Alvarado
**
**  Date: 29/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------						------------------------------------
** 29/05/2018 Jesus David Piérola Alvarado   Initial version
*******************************************************************************/
PRINT 'Creating FK_enterprise_risk_iperc to risk_iperc';
IF NOT EXISTS(SELECT * 
				FROM sys.foreign_keys 
				WHERE object_id = OBJECT_ID('FK_enterprise_risk_iperc') 
				AND parent_object_id = OBJECT_ID('dbo.risk_iperc'))
BEGIN
	ALTER TABLE [dbo].[risk_iperc]  WITH CHECK ADD  
	CONSTRAINT FK_enterprise_risk_iperc FOREIGN KEY([enterprise_id])
	REFERENCES [dbo].[enterprise] ([enterprise_id])

	ALTER TABLE [dbo].[risk_iperc] CHECK CONSTRAINT FK_enterprise_risk_iperc

	PRINT 'FK_enterprise_risk_iperc done ....';
END
ELSE
BEGIN
	PRINT 'Foreing key: FK_enterprise_risk_iperc already exists into the database';
END
GO

-- Create Table risk_iperc_detail
/******************************************************************************
**  Table Name: risk_iperc_detail
**  Desc: Table for risk_iperc_detail
** 
**  Called by: SSI-D
**
**  Author: Jesus David Pierola Alvarado
**
**  Date: 29/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 29/05/2018 Jesus David Pierola Alvarado   Initial version
*******************************************************************************/
PRINT 'Creating the risk_iperc_detail table....';
IF NOT EXISTS(SELECT * 
				FROM sys.objects 
				WHERE Type = 'U' 
				AND object_id = OBJECT_ID('dbo.risk_iperc_detail'))
BEGIN
	CREATE TABLE [dbo].[risk_iperc_detail](
		[risk_iperc_det_id] [bigint] IDENTITY(1,1) NOT NULL,
		[created_on] [datetime] NOT NULL,
		[updated_on] [datetime] NULL,
		[risk_iperc_det_ide_act] [varchar](50) NULL,
		[risk_iperc_det_ide_acti] [varchar](50) NULL,
		[risk_iperc_det_ide_cond] [varchar](50) NULL,
		[risk_iperc_det_ide_cons] [varchar](50) NULL,
		[risk_iperc_det_eva_adm] [varchar](50) NULL,
		[risk_iperc_det_eva_ing] [varchar](50) NULL,
		[risk_iperc_det_eva_insp] [varchar](50) NULL,
		[risk_iperc_det_ide_dan] [varchar](50) NULL,
		[risk_iperc_det_eva_c] [int] NULL,
		[risk_iperc_det_eva_desc] [varchar](200) NULL,
		[risk_iperc_det_eva_e] [int] NULL,
		[risk_iperc_det_eva_lev] [varchar](50) NULL,
		[risk_iperc_det_eva_p] [int] NULL,
		[risk_iperc_det_eva_type] [varchar](10) NULL,
		[risk_iperc_det_eva_val] [int] NULL,
		[risk_iperc_det_ide_risk] [varchar](50) NULL,
		[risk_iperc_id] [bigint] NULL,
	CONSTRAINT PK_risk_iperc_detail PRIMARY KEY CLUSTERED
	(
		[risk_iperc_det_id] ASC
	));

	PRINT 'Table risk_iperc_detail created!';
END
ELSE
BEGIN
	PRINT 'Table risk_iperc_detail already exist.';
END
GO

-- Define the relationship between risk_iperc_detail and risk_iperc
/******************************************************************************
**  Name: FK_risk_iperc_detail
**  Desc: Foreing key for risk_iperc_detail
** 
**  Called by: SSI-D
**
**  Author: Jesus David Pierola Alvarado
**
**  Date: 29/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------						------------------------------------
** 29/05/2018 Jesus David Piérola Alvarado   Initial version
*******************************************************************************/
PRINT 'Creating FK_risk_iperc_detail to risk_iperc';
IF NOT EXISTS(SELECT * 
				FROM sys.foreign_keys 
				WHERE object_id = OBJECT_ID('FK_risk_iperc_detail') 
				AND parent_object_id = OBJECT_ID('dbo.risk_iperc_detail'))
BEGIN
	ALTER TABLE [dbo].[risk_iperc_detail]  WITH CHECK ADD  
	CONSTRAINT FK_risk_iperc_detail FOREIGN KEY([risk_iperc_id])
	REFERENCES [dbo].[risk_iperc] ([risk_iperc_id])

	ALTER TABLE [dbo].[risk_iperc_detail] CHECK CONSTRAINT FK_risk_iperc_detail

	PRINT 'FK_risk_iperc_detail done ....';
END
ELSE
BEGIN
	PRINT 'Foreing key: FK_risk_iperc_detail already exists into the database';
END
GO


-- Create Table causing_agents
/******************************************************************************
**  Table Name: causing_agents
**  Desc: Table for causing_agents
** 
**  Called by: SSI-D
**
**  Author: Jesus David Pierola Alvarado
**
**  Date: 29/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 29/05/2018 Jesus David Pierola Alvarado   Initial version
*******************************************************************************/
PRINT 'Creating the causing_agents table....';
IF NOT EXISTS(SELECT * 
				FROM sys.objects 
				WHERE Type = 'U' 
				AND object_id = OBJECT_ID('dbo.causing_agents'))
BEGIN
	CREATE TABLE [dbo].[causing_agents](
		[ausing_agent_id] [bigint] IDENTITY(1,1) NOT NULL,
		[created_on] [datetime] NOT NULL,
		[updated_on] [datetime] NULL,
		[ausing_agent_name] [varchar](255) NULL,
	CONSTRAINT PK_Causing_Agent PRIMARY KEY CLUSTERED 
	(
		[ausing_agent_id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	);

	PRINT 'Table causing_agents created!';
END
ELSE
BEGIN
	PRINT 'Table causing_agents already exist.';
END
GO

-- Create Table accident_types
/******************************************************************************
**  Table Name: accident_types
**  Desc: Table for accident_types
** 
**  Called by: SSI-D
**
**  Author: Jesus David Pierola Alvarado
**
**  Date: 29/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 29/05/2018 Jesus David Pierola Alvarado   Initial version
*******************************************************************************/
PRINT 'Creating the accident_types table....';
IF NOT EXISTS(SELECT * 
				FROM sys.objects 
				WHERE Type = 'U' 
				AND object_id = OBJECT_ID('dbo.accident_types'))
BEGIN
	CREATE TABLE [dbo].[accident_types](
		[accident_type_id] [bigint] IDENTITY(1,1) NOT NULL,
		[created_on] [datetime] NOT NULL,
		[updated_on] [datetime] NULL,
		[accident_type_name] [varchar](255) NULL,
	CONSTRAINT PK_accident_type PRIMARY KEY CLUSTERED 
	(
		[accident_type_id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	);

	PRINT 'Table accident_types created!';
END
ELSE
BEGIN
	PRINT 'Table accident_types already exist.';
END
GO

-- Create Table accidents
/******************************************************************************
**  Table Name: accidents
**  Desc: Table for accidents
** 
**  Called by: SSI-D
**
**  Author: Jesus David Pierola Alvarado
**
**  Date: 29/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 29/05/2018 Jesus David Pierola Alvarado   Initial version
*******************************************************************************/
PRINT 'Creating the accidents table....';
IF NOT EXISTS(SELECT * 
				FROM sys.objects 
				WHERE Type = 'U' 
				AND object_id = OBJECT_ID('dbo.accidents'))
BEGIN
	CREATE TABLE [dbo].[accidents](
		[accident_id] [bigint] IDENTITY(1,1) NOT NULL,
		[created_on] [datetime] NOT NULL,
		[updated_on] [datetime] NULL,
		[bajamedica] [bigint] NULL,
		[date_at] [datetime] NULL,
		[description] [varchar](255) NULL,
		[lugaratencion] [varchar](255) NULL,
		[personal] [varbinary](255) NULL,
		[report_by] [varbinary](255) NULL,
		[accident_type_accident_type_id] [bigint] NULL,
		[causing_agent_ausing_agent_id] [bigint] NULL,
	CONSTRAINT PK_accident PRIMARY KEY CLUSTERED 
	(
		[accident_id] ASC
	));

	PRINT 'Table accidents created!';
END
ELSE
BEGIN
	PRINT 'Table accidents already exist.';
END
GO

-- Define the relationship between accidents and causing_agents
/******************************************************************************
**  Name: FK_accident_causing
**  Desc: Foreing key for accident
** 
**  Called by: SSI-D
**
**  Author: Jesus David Pierola Alvarado
**
**  Date: 29/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------						------------------------------------
** 29/05/2018 Jesus David Piérola Alvarado   Initial version
*******************************************************************************/
PRINT 'Creating FK_accident_causing to accidents';
IF NOT EXISTS(SELECT * 
				FROM sys.foreign_keys 
				WHERE object_id = OBJECT_ID('FK_accident_causing') 
				AND parent_object_id = OBJECT_ID('dbo.accidents'))
BEGIN
	ALTER TABLE [dbo].[accidents]  WITH CHECK ADD  
	CONSTRAINT FK_accident_causing FOREIGN KEY([causing_agent_ausing_agent_id])
	REFERENCES [dbo].[causing_agents] ([ausing_agent_id])

	ALTER TABLE [dbo].[accidents] CHECK CONSTRAINT FK_accident_causing

	PRINT 'FK_accident_causing done ....';
END
ELSE
BEGIN
	PRINT 'Foreing key: FK_accident_causing already exists into the database';
END
GO

-- Define the relationship between accidents and accident_type
/******************************************************************************
**  Name: FK_accident_type
**  Desc: Foreing key for accident
** 
**  Called by: SSI-D
**
**  Author: Jesus David Pierola Alvarado
**
**  Date: 29/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------						------------------------------------
** 29/05/2018 Jesus David Piérola Alvarado   Initial version
*******************************************************************************/
PRINT 'Creating FK_accident_type to accidents';
IF NOT EXISTS(SELECT * 
				FROM sys.foreign_keys 
				WHERE object_id = OBJECT_ID('FK_accident_type') 
				AND parent_object_id = OBJECT_ID('dbo.accidents'))
BEGIN
	ALTER TABLE [dbo].[accidents]  WITH CHECK ADD  
	CONSTRAINT FK_accident_type FOREIGN KEY([accident_type_accident_type_id])
	REFERENCES [dbo].[accident_types] ([accident_type_id])

	ALTER TABLE [dbo].[accidents] CHECK CONSTRAINT FK_accident_type

	PRINT 'FK_accident_type done ....';
END
ELSE
BEGIN
	PRINT 'Foreing key: FK_accident_type already exists into the database';
END
GO