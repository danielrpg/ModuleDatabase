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
** ALTER Equipaments Added Audit columns
*******************************************************************************/
IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'CreatedBy'
				AND object_id = OBJECT_ID(N'[dbo].[Equipaments]'))
	BEGIN
		ALTER TABLE [dbo].[Equipaments] ADD CreatedBy INT NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'CreatedDate'
				AND object_id = OBJECT_ID(N'[dbo].[Equipaments]'))
	BEGIN
		ALTER TABLE [dbo].[Equipaments] ADD CreatedDate DATETIME NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'ModifiedBy'
				AND object_id = OBJECT_ID(N'[dbo].[Equipaments]'))
	BEGIN
		ALTER TABLE [dbo].[Equipaments] ADD ModifiedBy INT NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'ModifiedDate'
				AND object_id = OBJECT_ID(N'[dbo].[Equipaments]'))
	BEGIN
		ALTER TABLE [dbo].[Equipaments] ADD ModifiedDate DATETIME NOT NULL
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


/******************************************************************************
** ALTER contracts Added Audit columns
modified:BORIS MEDRANO
*******************************************************************************/
IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'CreatedBy'
				AND object_id = OBJECT_ID(N'[dbo].[contracts]'))
	BEGIN
		ALTER TABLE [dbo].[contracts] ADD CreatedBy INT NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'CreatedDate'
				AND object_id = OBJECT_ID(N'[dbo].[contracts]'))
	BEGIN
		ALTER TABLE [dbo].[contracts] ADD CreatedDate DATETIME NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'ModifiedBy'
				AND object_id = OBJECT_ID(N'[dbo].[contracts]'))
	BEGIN
		ALTER TABLE [dbo].[contracts] ADD ModifiedBy INT NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'ModifiedDate'
				AND object_id = OBJECT_ID(N'[dbo].[contracts]'))
	BEGIN
		ALTER TABLE [dbo].[contracts] ADD ModifiedDate DATETIME NOT NULL
	END
GO
/******************************************************************************
** ALTER department Added Audit columns
modified:BORIS MEDRANO
*******************************************************************************/
IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'CreatedBy'
				AND object_id = OBJECT_ID(N'[dbo].[department]'))
	BEGIN
		ALTER TABLE [dbo].[department] ADD CreatedBy INT NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'CreatedDate'
				AND object_id = OBJECT_ID(N'[dbo].[department]'))
	BEGIN
		ALTER TABLE [dbo].[department] ADD CreatedDate DATETIME NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'ModifiedBy'
				AND object_id = OBJECT_ID(N'[dbo].[department]'))
	BEGIN
		ALTER TABLE [dbo].[department] ADD ModifiedBy INT NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'ModifiedDate'
				AND object_id = OBJECT_ID(N'[dbo].[department]'))
	BEGIN
		ALTER TABLE [dbo].[department] ADD ModifiedDate DATETIME NOT NULL
	END
GO
/******************************************************************************
** ALTER position Added Audit columns
modified:BORIS MEDRANO
*******************************************************************************/
IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'CreatedBy'
				AND object_id = OBJECT_ID(N'[dbo].[position]'))
	BEGIN
		ALTER TABLE [dbo].[position] ADD CreatedBy INT NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'CreatedDate'
				AND object_id = OBJECT_ID(N'[dbo].[position]'))
	BEGIN
		ALTER TABLE [dbo].[position] ADD CreatedDate DATETIME NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'ModifiedBy'
				AND object_id = OBJECT_ID(N'[dbo].[position]'))
	BEGIN
		ALTER TABLE [dbo].[position] ADD ModifiedBy INT NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'ModifiedDate'
				AND object_id = OBJECT_ID(N'[dbo].[position]'))
	BEGIN
		ALTER TABLE [dbo].[position] ADD ModifiedDate DATETIME NOT NULL
	END
GO
/******************************************************************************
** ALTER functions Added Audit columns
modified:BORIS MEDRANO
*******************************************************************************/
IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'CreatedBy'
				AND object_id = OBJECT_ID(N'[dbo].[functions]'))
	BEGIN
		ALTER TABLE [dbo].[functions] ADD CreatedBy INT NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'CreatedDate'
				AND object_id = OBJECT_ID(N'[dbo].[functions]'))
	BEGIN
		ALTER TABLE [dbo].[functions] ADD CreatedDate DATETIME NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'ModifiedBy'
				AND object_id = OBJECT_ID(N'[dbo].[functions]'))
	BEGIN
		ALTER TABLE [dbo].[functions] ADD ModifiedBy INT NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'ModifiedDate'
				AND object_id = OBJECT_ID(N'[dbo].[functions]'))
	BEGIN
		ALTER TABLE [dbo].[functions] ADD ModifiedDate DATETIME NOT NULL
	END
GO
/******************************************************************************
** ALTER requirements Added Audit columns
modified:BORIS MEDRANO
*******************************************************************************/
IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'CreatedBy'
				AND object_id = OBJECT_ID(N'[dbo].[requirements]'))
	BEGIN
		ALTER TABLE [dbo].[requirements] ADD CreatedBy INT NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'CreatedDate'
				AND object_id = OBJECT_ID(N'[dbo].[requirements]'))
	BEGIN
		ALTER TABLE [dbo].[requirements] ADD CreatedDate DATETIME NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'ModifiedBy'
				AND object_id = OBJECT_ID(N'[dbo].[requirements]'))
	BEGIN
		ALTER TABLE [dbo].[requirements] ADD ModifiedBy INT NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'ModifiedDate'
				AND object_id = OBJECT_ID(N'[dbo].[requirements]'))
	BEGIN
		ALTER TABLE [dbo].[requirements] ADD ModifiedDate DATETIME NOT NULL
	END
GO
/******************************************************************************
** ALTER areas Added Audit columns
modified:BORIS MEDRANO
*******************************************************************************/
IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'CreatedBy'
				AND object_id = OBJECT_ID(N'[dbo].[areas]'))
	BEGIN
		ALTER TABLE [dbo].[areas] ADD CreatedBy INT NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'CreatedDate'
				AND object_id = OBJECT_ID(N'[dbo].[areas]'))
	BEGIN
		ALTER TABLE [dbo].[areas] ADD CreatedDate DATETIME NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'ModifiedBy'
				AND object_id = OBJECT_ID(N'[dbo].[areas]'))
	BEGIN
		ALTER TABLE [dbo].[areas] ADD ModifiedBy INT NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'ModifiedDate'
				AND object_id = OBJECT_ID(N'[dbo].[areas]'))
	BEGIN
		ALTER TABLE [dbo].[areas] ADD ModifiedDate DATETIME NOT NULL
	END
GO
/******************************************************************************
** ALTER personals Added Audit columns
modified:BORIS MEDRANO
*******************************************************************************/
IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'CreatedBy'
				AND object_id = OBJECT_ID(N'[dbo].[personals]'))
	BEGIN
		ALTER TABLE [dbo].[personals] ADD CreatedBy INT NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'CreatedDate'
				AND object_id = OBJECT_ID(N'[dbo].[personals]'))
	BEGIN
		ALTER TABLE [dbo].[personals] ADD CreatedDate DATETIME NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'ModifiedBy'
				AND object_id = OBJECT_ID(N'[dbo].[personals]'))
	BEGIN
		ALTER TABLE [dbo].[personals] ADD ModifiedBy INT NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'ModifiedDate'
				AND object_id = OBJECT_ID(N'[dbo].[personals]'))
	BEGIN
		ALTER TABLE [dbo].[personals] ADD ModifiedDate DATETIME NOT NULL
	END
GO

/******************************************************************************
** ALTER program_sso Added Audit columns
*******************************************************************************/
IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'CreatedBy'
				AND object_id = OBJECT_ID(N'[dbo].[program_sso]'))
	BEGIN
		ALTER TABLE [dbo].[program_sso] ADD CreatedBy INT NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'CreatedDate'
				AND object_id = OBJECT_ID(N'[dbo].[program_sso]'))
	BEGIN
		ALTER TABLE [dbo].[program_sso] ADD CreatedDate DATETIME NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'ModifiedBy'
				AND object_id = OBJECT_ID(N'[dbo].[program_sso]'))
	BEGIN
		ALTER TABLE [dbo].[program_sso] ADD ModifiedBy INT NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'ModifiedDate'
				AND object_id = OBJECT_ID(N'[dbo].[program_sso]'))
	BEGIN
		ALTER TABLE [dbo].[program_sso] ADD ModifiedDate DATETIME NOT NULL
	END
GO

/******************************************************************************
** ALTER program_sso_activities Added Audit columns
*******************************************************************************/
IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'CreatedBy'
				AND object_id = OBJECT_ID(N'[dbo].[program_sso_activities]'))
	BEGIN
		ALTER TABLE [dbo].[program_sso_activities] ADD CreatedBy INT NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'CreatedDate'
				AND object_id = OBJECT_ID(N'[dbo].[program_sso_activities]'))
	BEGIN
		ALTER TABLE [dbo].[program_sso_activities] ADD CreatedDate DATETIME NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'ModifiedBy'
				AND object_id = OBJECT_ID(N'[dbo].[program_sso_activities]'))
	BEGIN
		ALTER TABLE [dbo].[program_sso_activities] ADD ModifiedBy INT NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'ModifiedDate'
				AND object_id = OBJECT_ID(N'[dbo].[program_sso_activities]'))
	BEGIN
		ALTER TABLE [dbo].[program_sso_activities] ADD ModifiedDate DATETIME NOT NULL
	END
GO

/******************************************************************************
** ALTER program_sso_resource Added Audit columns
*******************************************************************************/
IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'CreatedBy'
				AND object_id = OBJECT_ID(N'[dbo].[program_sso_resource]'))
	BEGINt_
		ALTER TABLE [dbo].[program_sso_resource] ADD CreatedBy INT NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'CreatedDate'
				AND object_id = OBJECT_ID(N'[dbo].[program_sso_resource]'))
	BEGIN
		ALTER TABLE [dbo].[program_sso_resource] ADD CreatedDate DATETIME NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'ModifiedBy'
				AND object_id = OBJECT_ID(N'[dbo].[program_sso_resource]'))
	BEGIN
		ALTER TABLE [dbo].[program_sso_resource] ADD ModifiedBy INT NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'ModifiedDate'
				AND object_id = OBJECT_ID(N'[dbo].[program_sso_resource]'))
	BEGIN
		ALTER TABLE [dbo].[program_sso_resource] ADD ModifiedDate DATETIME NOT NULL
	END
GO

/******************************************************************************
** ALTER program_sso_trainer Added Audit columns
*******************************************************************************/
IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'CreatedBy'
				AND object_id = OBJECT_ID(N'[dbo].[program_sso_trainer]'))
	BEGIN
		ALTER TABLE [dbo].[program_sso_trainer] ADD CreatedBy INT NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'CreatedDate'
				AND object_id = OBJECT_ID(N'[dbo].[program_sso_trainer]'))
	BEGIN
		ALTER TABLE [dbo].[program_sso_trainer] ADD CreatedDate DATETIME NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'ModifiedBy'
				AND object_id = OBJECT_ID(N'[dbo].[program_sso_trainer]'))
	BEGIN
		ALTER TABLE [dbo].[program_sso_trainer] ADD ModifiedBy INT NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'ModifiedDate'
				AND object_id = OBJECT_ID(N'[dbo].[program_sso_trainer]'))
	BEGIN
		ALTER TABLE [dbo].[program_sso_trainer] ADD ModifiedDate DATETIME NOT NULL
	END
GO

/******************************************************************************
** ALTER roles Added Audit columns
*******************************************************************************/
IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'CreatedBy'
				AND object_id = OBJECT_ID(N'[dbo].[roles]'))
	BEGIN
		ALTER TABLE [dbo].[roles] ADD CreatedBy INT NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'CreatedDate'
				AND object_id = OBJECT_ID(N'[dbo].[roles]'))
	BEGIN
		ALTER TABLE [dbo].[roles] ADD CreatedDate DATETIME NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'ModifiedBy'
				AND object_id = OBJECT_ID(N'[dbo].[roles]'))
	BEGIN
		ALTER TABLE [dbo].[roles] ADD ModifiedBy INT NOT NULL
	END
GO

IF NOT EXISTS (SELECT 1
				FROM sys.columns
				WHERE Name = 'ModifiedDate'
				AND object_id = OBJECT_ID(N'[dbo].[roles]'))
	BEGIN
		ALTER TABLE [dbo].[roles] ADD ModifiedDate DATETIME NOT NULL
	END
GO




