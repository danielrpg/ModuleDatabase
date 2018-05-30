-- ADD Init Data to TABLE Migration
/******************************************************************************
**  Name: Migration
**  Desc: Adding Init Data to Table Migration for DataWharehouse
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

USE ssid
GO

SET NOCOUNT ON;
GO

PRINT 'Adding init data to the Migration table....';
GO

IF EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'ETL.Migration') 
		       AND type in (N'U'))
BEGIN
	
	IF (SELECT COUNT(*) FROM ETL.Migration) > 0
	BEGIN	
		PRINT 'Table Migration have data loaded';
	END
	ELSE
	BEGIN
		PRINT 'Loading...';
		INSERT INTO ETL.Migration(TableName, LatestChange)
		VALUES('Area',0)
		,('EventIncident',0)
		,('FactIncident',0)
		,('Personal',0)
		,('Position',0)
	END
END
ELSE 
BEGIN
	PRINT 'Table Migration NOT exists into the database';
END
GO

PRINT 'Adding init data end';
GO