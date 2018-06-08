USE SSID2
GO
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
		       WHERE object_id = OBJECT_ID(N'dbo.audithistory') 
		       AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[audithistory]
	(
		audit_id BIGINT IDENTITY(1,1) NOT NULL CONSTRAINT [PK_AuditHistory] PRIMARY KEY,
		[table_name]		 VARCHAR(50) NULL,
		[column_name]	 VARCHAR(50) NULL,
		[id]             VARCHAR(50) NULL,
		[date]           DATETIME NULL,
		[old_value]       VARCHAR(MAX) NULL,
		[new_value]       VARCHAR(MAX) NULL,
		[modified_date]   DATETIME NOT NULL,
		[modified_by]     VARCHAR(50)
	);

	ALTER TABLE [dbo].[audithistory] ADD CONSTRAINT [DF_AuditHistory_ModifiedDate]  DEFAULT (GETUTCDATE()) FOR [modified_date]
		
	PRINT 'Table AuditHistory created!';
END
ELSE 
BEGIN
	PRINT 'Table AuditHistory already exists into the database';
END
GO
