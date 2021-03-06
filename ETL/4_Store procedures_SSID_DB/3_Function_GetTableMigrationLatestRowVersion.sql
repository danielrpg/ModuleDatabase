-- Creacion de Funcion
IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[ETL].[GetTableMigrationLatestRowVersion]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
	DROP FUNCTION [ETL].GetTableMigrationLatestRowVersion
	PRINT ('Function Deleted -  GetTableMigrationLatestRowVersion')
END
GO
/******************************************************************************
**  Name: GetTableMigrationLatestRowVersion
**  Desc: Get Latest row version of table Migration
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
** --------   --------                      -----------------------------------
** 27/05/2018 Jesús David Piérola Alvarado   Release 3.0 - DW
*******************************************************************************/

CREATE FUNCTION [ETL].[GetTableMigrationLatestRowVersion] 
(
	@table VARCHAR(50)
)
RETURNS BIGINT
AS
BEGIN
	DECLARE @last BIGINT;

	SELECT @last = LatestChange
	FROM [ETL].[Migration]
	WHERE TableName = @table;

  RETURN @last;
END
GO
PRINT 'Creating function GetTableMigrationLatestRowVersion';
GO