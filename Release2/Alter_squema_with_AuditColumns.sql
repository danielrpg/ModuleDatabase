USE ssidev;
GO
/******************************************************************************
** ALTER Incident_type Added Audit columns
*******************************************************************************/
IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'CreatedBy'
				AND object_id = OBJECT_ID(N'[dbo].[Incident_type]'))
	BEGIN
		ALTER TABLE [dbo].[Incident_type] ADD CreatedBy INT NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'CreatedDate'
				AND object_id = OBJECT_ID(N'[dbo].[Incident_type]'))
	BEGIN
		ALTER TABLE [dbo].[Incident_type] ADD CreatedDate DATETIME NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'ModifiedBy'
				AND object_id = OBJECT_ID(N'[dbo].[Incident_type]'))
	BEGIN
		ALTER TABLE [dbo].[Incident_type] ADD ModifiedBy INT NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'ModifiedDate'
				AND object_id = OBJECT_ID(N'[dbo].[Incident_type]'))
	BEGIN
		ALTER TABLE [dbo].[Incident_type] ADD ModifiedDate DATETIME NOT NULL
	END
GO

/******************************************************************************
** ALTER Incident Added Audit columns
*******************************************************************************/
IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'CreatedBy'
				AND object_id = OBJECT_ID(N'[dbo].[Incident]'))
	BEGIN
		ALTER TABLE [dbo].[Incident] ADD CreatedBy INT NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'CreatedDate'
				AND object_id = OBJECT_ID(N'[dbo].[Incident]'))
	BEGIN
		ALTER TABLE [dbo].[Incident] ADD CreatedDate DATETIME NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'ModifiedBy'
				AND object_id = OBJECT_ID(N'[dbo].[Incident]'))
	BEGIN
		ALTER TABLE [dbo].[Incident] ADD ModifiedBy INT NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'ModifiedDate'
				AND object_id = OBJECT_ID(N'[dbo].[Incident]'))
	BEGIN
		ALTER TABLE [dbo].[Incident] ADD ModifiedDate DATETIME NOT NULL
	END
GO

/******************************************************************************
** ALTER Incident_detail Added Audit columns
*******************************************************************************/
IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'CreatedBy'
				AND object_id = OBJECT_ID(N'[dbo].[Incident_detail]'))
	BEGIN
		ALTER TABLE [dbo].[Incident_detail] ADD CreatedBy INT NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'CreatedDate'
				AND object_id = OBJECT_ID(N'[dbo].[Incident_detail]'))
	BEGIN
		ALTER TABLE [dbo].[Incident_detail] ADD CreatedDate DATETIME NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'ModifiedBy'
				AND object_id = OBJECT_ID(N'[dbo].[Incident_detail]'))
	BEGIN
		ALTER TABLE [dbo].[Incident_detail] ADD ModifiedBy INT NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'ModifiedDate'
				AND object_id = OBJECT_ID(N'[dbo].[Incident_detail]'))
	BEGIN
		ALTER TABLE [dbo].[Incident_detail] ADD ModifiedDate DATETIME NOT NULL
	END
GO

/******************************************************************************
** ALTER Equipment Added Audit columns
*******************************************************************************/
IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'CreatedBy'
				AND object_id = OBJECT_ID(N'[dbo].[Equipment]'))
	BEGIN
		ALTER TABLE [dbo].[Equipment] ADD CreatedBy INT NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'CreatedDate'
				AND object_id = OBJECT_ID(N'[dbo].[Equipment]'))
	BEGIN
		ALTER TABLE [dbo].[Equipment] ADD CreatedDate DATETIME NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'ModifiedBy'
				AND object_id = OBJECT_ID(N'[dbo].[Equipment]'))
	BEGIN
		ALTER TABLE [dbo].[Equipment] ADD ModifiedBy INT NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'ModifiedDate'
				AND object_id = OBJECT_ID(N'[dbo].[Equipment]'))
	BEGIN
		ALTER TABLE [dbo].[Equipment] ADD ModifiedDate DATETIME NOT NULL
	END
GO

/******************************************************************************
** ALTER User Added Audit columns
*******************************************************************************/
IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'CreatedBy'
				AND object_id = OBJECT_ID(N'[dbo].[User]'))
	BEGIN
		ALTER TABLE [dbo].[User] ADD CreatedBy INT NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'CreatedDate'
				AND object_id = OBJECT_ID(N'[dbo].[User]'))
	BEGIN
		ALTER TABLE [dbo].[User] ADD CreatedDate DATETIME NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'ModifiedBy'
				AND object_id = OBJECT_ID(N'[dbo].[User]'))
	BEGIN
		ALTER TABLE [dbo].[User] ADD ModifiedBy INT NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'ModifiedDate'
				AND object_id = OBJECT_ID(N'[dbo].[User]'))
	BEGIN
		ALTER TABLE [dbo].[User] ADD ModifiedDate DATETIME NOT NULL
	END
GO
