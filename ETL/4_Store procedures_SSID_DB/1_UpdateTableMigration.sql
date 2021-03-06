IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'ETL.UpdateTableMigration') AND OBJECTPROPERTY(ID, N'ISPROCEDURE') = 1)
BEGIN
	DROP PROCEDURE ETL.UpdateTableMigration
	PRINT 'Store procedure Deleted -  ETL.UpdateTableMigration';
END
GO

/******************************************************************************
**  Name: UpdateTableMigration
**  Desc: Updates Table Migration with latest Rowversion used 
**  Called By: ETL SQL Job
**
**  Author: Jesus David Piérola Alvarado
**
**  Created: 27/05/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**  Date:       Author:						Description:
**  --------    --------					----------------------------------
**  27/05/2018  Jesus David Piérola Alvarado Release 3.0 - DW
******************************************************************************/
CREATE PROCEDURE ETL.UpdateTableMigration
(
	@tableName VARCHAR(50),
	@current     BIGINT
)
AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	UPDATE ETL.Migration
	SET LatestChange = @current
	WHERE TableName = @tableName;
END
GO
PRINT 'Creating store procedure UpdateTableMigration';
GO