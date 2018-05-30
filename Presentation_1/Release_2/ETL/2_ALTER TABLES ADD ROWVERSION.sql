-- ALTER TABLES Rowversion

-- ALTER TABLEs
/******************************************************************************
**  Desc: Add row Rowversion timestamp, for all tables
** 
**  Called by: SSI-D
**
**  Author: Jesús David Piérola Alvarado
**
**  Date: 26/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 26/05/2018 Jesús David Piérola Alvarado   Release 3.0 - DW
*******************************************************************************/

-- Generar todos los alter tables de las tablas
SELECT 'PRINT ''Alter tables for add Rowversion timestamp in ' + name + ' table....''; 
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE Name = ''Rowversion'' AND object_id = OBJECT_ID(N''dbo.' + name + 
''')) 
BEGIN 
	ALTER TABLE dbo.' + name + ' ADD [Rowversion] [timestamp] NOT NULL; 
	PRINT ''Table altered....''; 
END 
GO
'
FROM sys.all_objects
WHERE TYPE = 'U' and schema_id = 1
GO

PRINT 'Alter tables for add Rowversion timestamp in accident_types table....'; 
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE Name = 'Rowversion' AND object_id = OBJECT_ID(N'dbo.accident_types')) 
BEGIN 
	ALTER TABLE dbo.accident_types ADD [Rowversion] [timestamp] NOT NULL; 
	PRINT 'Table altered....'; 
END 
GO

PRINT 'Alter tables for add Rowversion timestamp in accidents table....'; 
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE Name = 'Rowversion' AND object_id = OBJECT_ID(N'dbo.accidents')) 
BEGIN 
	ALTER TABLE dbo.accidents ADD [Rowversion] [timestamp] NOT NULL; 
	PRINT 'Table altered....'; 
END 
GO

PRINT 'Alter tables for add Rowversion timestamp in areas table....'; 
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE Name = 'Rowversion' AND object_id = OBJECT_ID(N'dbo.areas')) 
BEGIN 
	ALTER TABLE dbo.areas ADD [Rowversion] [timestamp] NOT NULL; 
	PRINT 'Table altered....'; 
END 
GO

--Tabla eliminada
--PRINT 'Alter tables for add Rowversion timestamp in assign_equipament table....'; 
--IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE Name = 'Rowversion' AND object_id = OBJECT_ID(N'dbo.assign_equipament')) 
--BEGIN 
--	ALTER TABLE dbo.assign_equipament ADD [Rowversion] [timestamp] NOT NULL; 
--	PRINT 'Table altered....'; 
--END 
--GO

PRINT 'Alter tables for add Rowversion timestamp in causing_agents table....'; 
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE Name = 'Rowversion' AND object_id = OBJECT_ID(N'dbo.causing_agents')) 
BEGIN 
	ALTER TABLE dbo.causing_agents ADD [Rowversion] [timestamp] NOT NULL; 
	PRINT 'Table altered....'; 
END 
GO

PRINT 'Alter tables for add Rowversion timestamp in contracts table....'; 
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE Name = 'Rowversion' AND object_id = OBJECT_ID(N'dbo.contracts')) 
BEGIN 
	ALTER TABLE dbo.contracts ADD [Rowversion] [timestamp] NOT NULL; 
	PRINT 'Table altered....'; 
END 
GO

PRINT 'Alter tables for add Rowversion timestamp in department table....'; 
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE Name = 'Rowversion' AND object_id = OBJECT_ID(N'dbo.department')) 
BEGIN 
	ALTER TABLE dbo.department ADD [Rowversion] [timestamp] NOT NULL; 
	PRINT 'Table altered....'; 
END 
GO

PRINT 'Alter tables for add Rowversion timestamp in department_position table....'; 
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE Name = 'Rowversion' AND object_id = OBJECT_ID(N'dbo.department_position')) 
BEGIN 
	ALTER TABLE dbo.department_position ADD [Rowversion] [timestamp] NOT NULL; 
	PRINT 'Table altered....'; 
END 
GO

PRINT 'Alter tables for add Rowversion timestamp in detail_personal_sso table....'; 
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE Name = 'Rowversion' AND object_id = OBJECT_ID(N'dbo.detail_personal_sso')) 
BEGIN 
	ALTER TABLE dbo.detail_personal_sso ADD [Rowversion] [timestamp] NOT NULL; 
	PRINT 'Table altered....'; 
END 
GO

PRINT 'Alter tables for add Rowversion timestamp in enterprise table....'; 
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE Name = 'Rowversion' AND object_id = OBJECT_ID(N'dbo.enterprise')) 
BEGIN 
	ALTER TABLE dbo.enterprise ADD [Rowversion] [timestamp] NOT NULL; 
	PRINT 'Table altered....'; 
END 
GO

PRINT 'Alter tables for add Rowversion timestamp in equipaments table....'; 
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE Name = 'Rowversion' AND object_id = OBJECT_ID(N'dbo.equipaments')) 
BEGIN 
	ALTER TABLE dbo.equipaments ADD [Rowversion] [timestamp] NOT NULL; 
	PRINT 'Table altered....'; 
END 
GO

PRINT 'Alter tables for add Rowversion timestamp in functions table....'; 
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE Name = 'Rowversion' AND object_id = OBJECT_ID(N'dbo.functions')) 
BEGIN 
	ALTER TABLE dbo.functions ADD [Rowversion] [timestamp] NOT NULL; 
	PRINT 'Table altered....'; 
END 
GO

PRINT 'Alter tables for add Rowversion timestamp in history_area_personal table....'; 
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE Name = 'Rowversion' AND object_id = OBJECT_ID(N'dbo.history_area_personal')) 
BEGIN 
	ALTER TABLE dbo.history_area_personal ADD [Rowversion] [timestamp] NOT NULL; 
	PRINT 'Table altered....'; 
END 
GO

PRINT 'Alter tables for add Rowversion timestamp in incident table....'; 
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE Name = 'Rowversion' AND object_id = OBJECT_ID(N'dbo.incident')) 
BEGIN 
	ALTER TABLE dbo.incident ADD [Rowversion] [timestamp] NOT NULL; 
	PRINT 'Table altered....'; 
END 
GO

PRINT 'Alter tables for add Rowversion timestamp in incident_detail table....'; 
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE Name = 'Rowversion' AND object_id = OBJECT_ID(N'dbo.incident_detail')) 
BEGIN 
	ALTER TABLE dbo.incident_detail ADD [Rowversion] [timestamp] NOT NULL; 
	PRINT 'Table altered....'; 
END 
GO

PRINT 'Alter tables for add Rowversion timestamp in incident_type table....'; 
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE Name = 'Rowversion' AND object_id = OBJECT_ID(N'dbo.incident_type')) 
BEGIN 
	ALTER TABLE dbo.incident_type ADD [Rowversion] [timestamp] NOT NULL; 
	PRINT 'Table altered....'; 
END 
GO

PRINT 'Alter tables for add Rowversion timestamp in inventory table....'; 
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE Name = 'Rowversion' AND object_id = OBJECT_ID(N'dbo.inventory')) 
BEGIN 
	ALTER TABLE dbo.inventory ADD [Rowversion] [timestamp] NOT NULL; 
	PRINT 'Table altered....'; 
END 
GO

PRINT 'Alter tables for add Rowversion timestamp in kardex_equipaments table....'; 
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE Name = 'Rowversion' AND object_id = OBJECT_ID(N'dbo.kardex_equipaments')) 
BEGIN 
	ALTER TABLE dbo.kardex_equipaments ADD [Rowversion] [timestamp] NOT NULL; 
	PRINT 'Table altered....'; 
END 
GO

PRINT 'Alter tables for add Rowversion timestamp in personal_position_contract table....'; 
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE Name = 'Rowversion' AND object_id = OBJECT_ID(N'dbo.personal_position_contract')) 
BEGIN 
	ALTER TABLE dbo.personal_position_contract ADD [Rowversion] [timestamp] NOT NULL; 
	PRINT 'Table altered....'; 
END 
GO

PRINT 'Alter tables for add Rowversion timestamp in personals table....'; 
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE Name = 'Rowversion' AND object_id = OBJECT_ID(N'dbo.personals')) 
BEGIN 
	ALTER TABLE dbo.personals ADD [Rowversion] [timestamp] NOT NULL; 
	PRINT 'Table altered....'; 
END 
GO

PRINT 'Alter tables for add Rowversion timestamp in position table....'; 
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE Name = 'Rowversion' AND object_id = OBJECT_ID(N'dbo.position')) 
BEGIN 
	ALTER TABLE dbo.position ADD [Rowversion] [timestamp] NOT NULL; 
	PRINT 'Table altered....'; 
END 
GO

PRINT 'Alter tables for add Rowversion timestamp in program_sso table....'; 
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE Name = 'Rowversion' AND object_id = OBJECT_ID(N'dbo.program_sso')) 
BEGIN 
	ALTER TABLE dbo.program_sso ADD [Rowversion] [timestamp] NOT NULL; 
	PRINT 'Table altered....'; 
END 
GO

PRINT 'Alter tables for add Rowversion timestamp in program_sso_activities table....'; 
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE Name = 'Rowversion' AND object_id = OBJECT_ID(N'dbo.program_sso_activities')) 
BEGIN 
	ALTER TABLE dbo.program_sso_activities ADD [Rowversion] [timestamp] NOT NULL; 
	PRINT 'Table altered....'; 
END 
GO

PRINT 'Alter tables for add Rowversion timestamp in program_sso_resource table....'; 
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE Name = 'Rowversion' AND object_id = OBJECT_ID(N'dbo.program_sso_resource')) 
BEGIN 
	ALTER TABLE dbo.program_sso_resource ADD [Rowversion] [timestamp] NOT NULL; 
	PRINT 'Table altered....'; 
END 
GO

PRINT 'Alter tables for add Rowversion timestamp in program_sso_trainer table....'; 
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE Name = 'Rowversion' AND object_id = OBJECT_ID(N'dbo.program_sso_trainer')) 
BEGIN 
	ALTER TABLE dbo.program_sso_trainer ADD [Rowversion] [timestamp] NOT NULL; 
	PRINT 'Table altered....'; 
END 
GO

PRINT 'Alter tables for add Rowversion timestamp in requirements table....'; 
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE Name = 'Rowversion' AND object_id = OBJECT_ID(N'dbo.requirements')) 
BEGIN 
	ALTER TABLE dbo.requirements ADD [Rowversion] [timestamp] NOT NULL; 
	PRINT 'Table altered....'; 
END 
GO

PRINT 'Alter tables for add Rowversion timestamp in risk_iperc table....'; 
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE Name = 'Rowversion' AND object_id = OBJECT_ID(N'dbo.risk_iperc')) 
BEGIN 
	ALTER TABLE dbo.risk_iperc ADD [Rowversion] [timestamp] NOT NULL; 
	PRINT 'Table altered....'; 
END 
GO

PRINT 'Alter tables for add Rowversion timestamp in risk_iperc_detail table....'; 
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE Name = 'Rowversion' AND object_id = OBJECT_ID(N'dbo.risk_iperc_detail')) 
BEGIN 
	ALTER TABLE dbo.risk_iperc_detail ADD [Rowversion] [timestamp] NOT NULL; 
	PRINT 'Table altered....'; 
END 
GO

PRINT 'Alter tables for add Rowversion timestamp in roles table....'; 
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE Name = 'Rowversion' AND object_id = OBJECT_ID(N'dbo.roles')) 
BEGIN 
	ALTER TABLE dbo.roles ADD [Rowversion] [timestamp] NOT NULL; 
	PRINT 'Table altered....'; 
END 
GO

PRINT 'Alter tables for add Rowversion timestamp in user_role table....'; 
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE Name = 'Rowversion' AND object_id = OBJECT_ID(N'dbo.user_role')) 
BEGIN 
	ALTER TABLE dbo.user_role ADD [Rowversion] [timestamp] NOT NULL; 
	PRINT 'Table altered....'; 
END 
GO

PRINT 'Alter tables for add Rowversion timestamp in users table....'; 
IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE Name = 'Rowversion' AND object_id = OBJECT_ID(N'dbo.users')) 
BEGIN 
	ALTER TABLE dbo.users ADD [Rowversion] [timestamp] NOT NULL; 
	PRINT 'Table altered....'; 
END 
GO
