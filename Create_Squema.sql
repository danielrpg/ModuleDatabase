USE ssidev;
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
PRINT 'Creating the Incident_type table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[Incident_type]') 
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[Incident_type]([incident_type_id] INT IDENTITY(1,1) NOT NULL
										,[incident_type_name] VARCHAR(50) CONSTRAINT NN_IncidentTypeName NOT NULL
										,[incident_type_description] VARCHAR(50) CONSTRAINT NN_IncidentTypeDesc NOT NULL
										,[incident_type_type] VARCHAR(50) CONSTRAINT NN_IncidentType NOT NULL
										,[incident_type_subtype] VARCHAR(50) CONSTRAINT NN_IncidentTypeSubType NOT NULL
										,[CreatedBy] INT         NOT NULL
									    ,[CreatedDate] DATETIME  NOT NULL
									    ,[ModifiedBy] DATETIME   NOT NULL
									    ,[ModifiedDate] DATETIME NOT NULL
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
		       WHERE object_id = OBJECT_ID(N'[dbo].[Incident_detail]') 
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[Incident_detail]([incident_detail_id] INT IDENTITY(1,1) NOT NULL
										,[incident_detail_status] BIT CONSTRAINT NN_IncidentDetailStatus NOT NULL
										,[incident_detail_name] VARCHAR(50) CONSTRAINT NN_IncidentDetailName NOT NULL
										,[incident_detail_description] VARCHAR(200) CONSTRAINT NN_IncidentDetailDescription NOT NULL
										,[CreatedBy] INT         NOT NULL
									    ,[CreatedDate] DATETIME  NOT NULL
									    ,[ModifiedBy] DATETIME   NOT NULL
									    ,[ModifiedDate] DATETIME NOT NULL
		 CONSTRAINT [PK_IncidentDetail] PRIMARY KEY
		(
			[incident_detail_id] ASC
		));

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
		       WHERE object_id = OBJECT_ID(N'[dbo].[Incident]') 
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[Incident]([incident_id] INT IDENTITY(1,1) NOT NULL
										,[incident_code] VARCHAR(10) CONSTRAINT NN_IncidentCode NOT NULL
										,[incident_number] INT CONSTRAINT NN_IncidentNumber NOT NULL
										,[incident_registered_date] DATETIME CONSTRAINT NN_IncidentRegisteredDate NOT NULL
										,[incident_area] VARCHAR(50) CONSTRAINT NN_IncidentArea NOT NULL
										,[incident_reincident] BIT CONSTRAINT NN_IncidentReincident NOT NULL
										,[incident_treatment] BIT CONSTRAINT NN_IncidentTreatment NOT NULL
										,[incident_type_id] INT
										,[CreatedBy] INT         NOT NULL
									    ,[CreatedDate] DATETIME  NOT NULL
									    ,[ModifiedBy] DATETIME   NOT NULL
									    ,[ModifiedDate] DATETIME NOT NULL
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
        ALTER TABLE dbo.Incident 
        ADD CONSTRAINT FK_Inc_IncType
        FOREIGN KEY(incident_type_id)
        REFERENCES Incident_Type(incident_type_id);

        PRINT 'Foreign key created';
    END
ELSE
    BEGIN
        PRINT 'Foreign key already exist';
    END
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
        ALTER TABLE dbo.Incident 
        ADD CONSTRAINT FK_Inc_IncDetail
        FOREIGN KEY(incident_detail_id)
        REFERENCES Incident_Type(incident_detail_id);

        PRINT 'Foreign key created';
    END
ELSE
    BEGIN
        PRINT 'Foreign key already exist';
    END



-- Create Table Area
/******************************************************************************
**  Table Name: Area
**  Desc: Table for Area
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

PRINT 'Creating the area table....';
IF NOT EXISTS(SELECT 1
        FROM sys.objects
        WHERE Type = 'U'
        AND object_id = OBJECT_ID('dbo.area'))  
    BEGIN

        CREATE TABLE [dbo].[area]
        (
            [area_id]          INT CONSTRAINT PK_area PRIMARY KEY IDENTITY(1,1) NOT NULL ,
            [area_name]        VARCHAR(50) CONSTRAINT NN_RoleName NOT NULL ,
            [area_description] VARCHAR(100) CONSTRAINT NN_RoleName NOT NULL
        );
        PRINT 'Table area created!';
    END    
ELSE 
	BEGIN
		PRINT 'Table area already exists into the database';
	END




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


PRINT 'Creating the personal table....';
IF NOT EXISTS(SELECT 1
        FROM sys.objects
        WHERE Type = 'U'
        AND object_id = OBJECT_ID('dbo.personal'))  
    BEGIN

        CREATE TABLE [dbo].[personal]
        (
            [personal_id]        INT CONSTRAINT PK_Personal PRIMARY KEY IDENTITY(1,1) NOT NULL,
            [personal_name]      VARCHAR(50) CONSTRAINT NN_PersonalName NOT NULL ,
            [personal_last_name]      VARCHAR(50) NULL ,
            [personal_email]     VARCHAR(50) CONSTRAINT NN_PersonalEmail NOT NULL ,
            [personal_direction] VARCHAR(50) CONSTRAINT NN_Direction NOT NULL ,
            [personal_cellphone] VARCHAR(50) NULL ,
            [personal_telephone] VARCHAR(50) NULL ,
            [personal_active]    BIT CONSTRAINT NN_Active NOT NULL ,
            [personal_birthdate]      VARCHAR(50) NULL ,
            [area_id]            INT CONSTRAINT NN_AreaId NOT NULL 
            
        );
    PRINT 'Table personal created!';
    END    
ELSE 
	BEGIN
		PRINT 'Table personal already exists into the database';
	END



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

PRINT 'Creating the user table....';
IF NOT EXISTS(SELECT 1
        FROM sys.objects
        WHERE Type = 'U'
        AND object_id = OBJECT_ID('dbo.user'))  
    BEGIN

        CREATE TABLE [dbo].[user]
        (
            [user_id]       INT CONSTRAINT PK_UserId PRIMARY KEY IDENTITY(1,1) NOT NULL ,
            [user_name]     VARCHAR(50) CONSTRAINT NN_UserName NOT NULL ,
            [user_password] VARCHAR(100) CONSTRAINT NN_UserPassword NOT NULL ,
            [user_active]   BIT CONSTRAINT NN_UserActive NOT NULL ,
            [personal_id]   INT CONSTRAINT NN_PersonalId NOT NULL 
        );
        PRINT 'Table user created!';
    END    
ELSE 
	BEGIN
		PRINT 'Table user already exists into the database';
	END


-- Create Table role
/******************************************************************************
**  Table Name: Role
**  Desc: Table for Role
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
        AND object_id = OBJECT_ID('dbo.role'))  
    BEGIN

        CREATE TABLE [dbo].[role]
        (
            [role_id]   INT CONSTRAINT PK_Role PRIMARY KEY IDENTITY(1,1) NOT NULL ,
            [role_name] VARCHAR(100) CONSTRAINT NN_RoleName NOT NULL
        );
            PRINT 'Table role created!';
    END    
ELSE 
	BEGIN
		PRINT 'Table role already exists into the database';
	END


PRINT 'Creating the user_role table....';
IF NOT EXISTS(SELECT 1
        FROM sys.objects
        WHERE Type = 'U'
        AND object_id = OBJECT_ID('dbo.user_role'))  
    BEGIN

        CREATE TABLE [dbo].[user_role]
        (
            [role_id]      INT CONSTRAINT NN_RoleId NOT NULL ,
            [user_id]      INT CONSTRAINT NN_UserId NOT NULL ,
            CONSTRAINT PK_UserRole PRIMARY KEY (role_id, user_id)

        );
            PRINT 'Table user_role created!';
    END    
ELSE 
	BEGIN
		PRINT 'Table user_role already exists into the database';
	END


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

PRINT 'Creating the Forengn key personal_area ....';
IF NOT EXISTS(SELECT 1
            FROM sys.foreign_keys
            WHERE object_id = OBJECT_ID('FK_pers_area')
            AND parent_object_id = OBJECT_ID('dbo.personal'))
    BEGIN
        ALTER TABLE dbo.personal 
        ADD CONSTRAINT FK_pers_area 
        FOREIGN KEY(area_id)
        REFERENCES area(area_id);

        PRINT 'Foreign key created';
    END
ELSE
    BEGIN
        PRINT 'Foreign key already exist';
    END


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
PRINT 'Creating the Forengn key user personal ....';
IF NOT EXISTS(SELECT 1
            FROM sys.foreign_keys
            WHERE object_id = OBJECT_ID('FK_user_per')
            AND parent_object_id = OBJECT_ID('dbo.user'))
    BEGIN
        ALTER TABLE [dbo].[user] 
        ADD CONSTRAINT FK_user_per 
        FOREIGN KEY(personal_id)
        REFERENCES personal(personal_id);
        
        PRINT 'Foreign key created';
    END
ELSE
    BEGIN
        PRINT 'Foreign key already exist';
    END


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
        REFERENCES dbo.role(role_id);
        
        PRINT 'Foreign key created';
    END
ELSE
    BEGIN
        PRINT 'Foreign key already exist';
    END


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
        FOREIGN KEY(user_id)
        REFERENCES [dbo].[user](user_id);

        PRINT 'Foreign key created';
    END
ELSE
    BEGIN
        PRINT 'Foreign key already exist';
    END

GO

-- Create Table Equipment
/******************************************************************************
**  Table Name: Equipment
**  Desc: Table for Equipment
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
PRINT 'Creating the Equipment table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[Equipment]') 
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[Equipment](
						 [equipment_id][int] IDENTITY not null
						,[equipment_name][varchar](50) CONSTRAINT NN_EquipmentName not null
						,[equipment_type][int] CONSTRAINT NN_EquipmentType not null
						,[equipment_description][varchar](200) CONSTRAINT NN_EquipmentDescription null
						,[equipment_image][varbinary](max) CONSTRAINT NN_EquipmentImage not null
			,CONSTRAINT [PK_Equipment] PRIMARY KEY
			(
				[equipment_id] ASC
			)
		);

			PRINT 'Table Equipment created!';
 END
 ELSE 
	BEGIN
		PRINT 'Table Equipment already exists into the database';
	END

-- Create Table Kardex_equipment
/******************************************************************************
**  Table Name: Kardex_equipment
**  Desc: Table for Kardex_equipment
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
PRINT 'Creating the Kardex_equipment table....';

IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'[dbo].[Kardex_equipment]') 
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[Kardex_equipment](
						 [equipment_kardex_id][int] IDENTITY not null
						,[date_kardex][datetime] CONSTRAINT NN_DateKardex not null
						,[entry_kardex][int] CONSTRAINT NN_EntryKardex not null
						,[outlay_kardex][int] CONSTRAINT NN_OutlayKardex not null
						,[balance_kardex][int] CONSTRAINT NN_BalanceKardex not null
						,[equipment_id][int] not null
			,CONSTRAINT [PK_equipment_kardex] PRIMARY KEY
			(
				[equipment_kardex_id] ASC
			)
		);

			PRINT 'Table Kardex_equipments created!';
 END
 ELSE 
	BEGIN
		PRINT 'Table Kardex_equipment already exists into the database';
	END

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
		       WHERE object_id = OBJECT_ID(N'[dbo].[Inventory]') 
		       AND type in (N'U'))
 BEGIN
		CREATE TABLE [dbo].[Inventory](
						 [inventory_id][int] IDENTITY not null
						,[active_assigment][bit] CONSTRAINT NN_ActiveAssigment not null
						,[date_assigment][datetime] CONSTRAINT NN_DateAssigmnet not null
						,[status_assigment][varchar](50) CONSTRAINT NN_StatusAssigment not null
						,[equipment_id][int] not null
						,[personal_id][int] not null
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
PRINT 'Creating FK_kardex_equipment to Kardex_equipment';
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_kardex_equipment]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Kardex_equipment]'))
	   BEGIN
			ALTER TABLE [dbo].[Kardex_equipment]  WITH CHECK ADD  
				   CONSTRAINT [FK_kardex_equipment] FOREIGN KEY([equipment_id])
			REFERENCES [dbo].[equipment] ([equipment_id]);
			
			ALTER TABLE [dbo].[Kardex_equipment] CHECK 
				   CONSTRAINT [FK_kardex_equipment];
			
			PRINT 'FK_kardex_equipment done ....';
	   END
ELSE
	BEGIN
		PRINT 'Foreing key: FK_kardex_equipment already exists into the database';
	END

-- Define the relationship between Inventory and Equipment.
/******************************************************************************
**  Table Name: FK_inventory_equipment
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
PRINT 'Creating FK_inventory_equipment to Inventory';
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_inventory_equipment]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[Inventory]'))
	   BEGIN
			ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  
				   CONSTRAINT [FK_inventory_equipment] FOREIGN KEY([equipment_id])
			REFERENCES [dbo].[equipment] ([equipment_id]);

			ALTER TABLE [dbo].[Inventory] CHECK 
				   CONSTRAINT [FK_inventory_equipment];
			
			PRINT 'FK_inventory_equipment done ....';
	   END
ELSE
	BEGIN
		PRINT 'Foreing key: FK_inventory_equipment already exists into the database';
	END

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
			ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  
				   CONSTRAINT [FK_inventory_personal] FOREIGN KEY([personal_id])
			REFERENCES [dbo].[Personal] ([personal_id]);
			
			ALTER TABLE [dbo].[Inventory] CHECK 
				   CONSTRAINT [FK_inventory_personal];
			
			PRINT 'FK_inventory_personal done ....';
	   END
ELSE
	BEGIN
		PRINT 'Foreing key: FK_inventory_personal already exists into the database';
	END
