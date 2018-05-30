-- Create Table AuditHistory
/******************************************************************************
**  Table Name: AuditHistory
**  Desc: Table for AuditHistory
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
PRINT 'Creating the AuditHistory table....';
IF NOT EXISTS (SELECT 1 FROM sys.objects 
		       WHERE object_id = OBJECT_ID(N'dbo.AuditHistory') 
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[AuditHistory]
	(
		[AuditHistoryId] INT IDENTITY(1,1) NOT NULL CONSTRAINT [PK_AuditHistory] PRIMARY KEY,
		[TableName]		 VARCHAR(50) NULL,
		[ColumnName]	 VARCHAR(50) NULL,
		[ID]             VARCHAR(50) NULL,
		[Date]           DATETIME NULL,
		[Oldvalue]       VARCHAR(MAX) NULL,
		[NewValue]       VARCHAR(MAX) NULL,
		[ModifiedDate]   DATETIME NOT NULL,
		[ModifiedBy]     VARCHAR(50)
	);

	ALTER TABLE [dbo].[AuditHistory] ADD CONSTRAINT [DF_AuditHistory_ModifiedDate]  DEFAULT (GETUTCDATE()) FOR [ModifiedDate]
		
	PRINT 'Table AuditHistory created!';
END
ELSE 
BEGIN
	PRINT 'Table AuditHistory already exists into the database';
END
GO
