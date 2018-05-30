-- ADD TABLE Migration
/******************************************************************************
**  Name: Migration
**  Desc: Adding Table Migration for DataWharehouse
** 
**  Called by: SSI-D
**
**  Author: Jesús David Piérola Alvarado
**
**  Date: 27/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 27/05/2018 Jesús David Piérola Alvarado   Release 3.0 - DW
*******************************************************************************/

USE SSID
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'ETL')
BEGIN	
	EXEC('CREATE SCHEMA [ETL]');
	PRINT 'Schema ETL created!';
END
ELSE 
BEGIN
	PRINT 'Schema ETL already exists into the database';
END
GO


PRINT 'Creating the Migration table....';
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'ETL.Migration') 
		       AND type in (N'U'))
BEGIN
	CREATE TABLE ETL.Migration(
		IDMigration INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Migration PRIMARY KEY,
		TableName VARCHAR(50) NOT NULL,
		LatestChange BIGINT NOT NULL CONSTRAINT [DF_Migration]  DEFAULT ((0))
	);
		
	PRINT 'Table Migration created!';
END
ELSE 
BEGIN
	PRINT 'Table Migration already exists into the database';
END
GO