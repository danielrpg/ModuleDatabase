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

