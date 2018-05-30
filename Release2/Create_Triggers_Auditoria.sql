--Trigger of Incident_detail
/******************************************************************************
**  Name: TG_IncidentDetail(Audit)_InsertUpdate
**  Desc: Audit History for Incident detail table
** 
**  Called by: ssi
**
**  Author: Christian Tola
**
**  Date: 05/26/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/26/2018 Christian Tola   Initial version
*******************************************************************************/
IF EXISTS (SELECT 1
				FROM sys.triggers
				WHERE name = 'TG_IncidentDetail(Audit)_InsertUpdate')
BEGIN
 DROP TRIGGER [dbo].[TG_IncidentDetail(Audit)_InsertUpdate];
 PRINT 'El TRIGGER [dbo].[TG_IncidentDetail(Audit)_InsertUpdate] fue eliminado';
END
GO
PRINT 'Creando TRIGGER [dbo].[TG_IncidentDetail(Audit)_InsertUpdate]...';
GO
CREATE TRIGGER [dbo].[TG_IncidentDetail(Audit)_InsertUpdate]
ON [dbo].[Incident_detail]
FOR INSERT, UPDATE
AS
BEGIN
	IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
	RETURN
 
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
 
	DECLARE @CurrDate DATETIME = GETUTCDATE();
  
	IF UPDATE(incident_detail_status)
	BEGIN
	INSERT INTO dbo.AuditHistory(TableName, 
									ColumnName, 
									ID, 
									Date, 
									OldValue, 
									NewValue,
									ModifiedBy) 
	SELECT TableName    = 'Incident_detail', 
			ColumnName   = 'incident_detail_status',
			ID1          = i.incident_detail_id, 
			Date         = @CurrDate, 
			OldValue     = d.[incident_detail_status], 
			NewValue     = i.[incident_detail_status],
			ModifiedBy   = i.modified_by 
	FROM deleted d 
	FULL OUTER JOIN inserted i ON (d.incident_detail_id = i.incident_detail_id)
	WHERE ISNULL(d.incident_detail_status, '') != ISNULL(i.incident_detail_status, '');
	END
	IF UPDATE(incident_detail_name)
	BEGIN
	INSERT INTO dbo.AuditHistory(TableName, 
									ColumnName, 
									ID,
									Date,
									OldValue, 
									NewValue,
									ModifiedBy) 
	SELECT TableName    = 'Incident_detail', 
			ColumnName   = 'incident_detail_name',
			ID1          = i.incident_detail_id, 
			Date         = @CurrDate, 
			OldValue     = d.[incident_detail_name], 
			NewValue     = i.[incident_detail_name],
			ModifiedBy   = i.modified_by 
	FROM deleted d 
	FULL OUTER JOIN inserted i ON (d.incident_detail_id = i.incident_detail_id)
	WHERE ISNULL(d.incident_detail_name, '') != ISNULL(i.incident_detail_name, '');
	END
	IF UPDATE(incident_detail_description)
	BEGIN
	INSERT INTO dbo.AuditHistory(TableName, 
									ColumnName, 
									ID,
									Date,
									OldValue, 
									NewValue,
									ModifiedBy) 
	SELECT TableName    = 'Incident_detail', 
			ColumnName   = 'incident_detail_description',
			ID1          = i.incident_detail_id, 
			Date         = @CurrDate, 
			OldValue     = d.[incident_detail_description], 
			NewValue     = i.[incident_detail_description],
			ModifiedBy   = i.modified_by 
	FROM deleted d 
	FULL OUTER JOIN inserted i ON (d.incident_detail_id = i.incident_detail_id)
	WHERE ISNULL(d.incident_detail_description, '') != ISNULL(i.incident_detail_description, '');
	END
END;
GO
PRINT '[dbo].[TG_IncidentDetail(Audit)_InsertUpdate] ha sido creado';
GO
--Trigger of IncidentTable
/******************************************************************************
**  Name: TG_IncidentType(Audit)_InsertUpdate
**  Desc: Audit History for Incident table
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
IF EXISTS (SELECT 1
				FROM sys.triggers
				WHERE name = 'TG_IncidentType(Audit)_InsertUpdate')
BEGIN
 DROP TRIGGER [dbo].[TG_IncidentType(Audit)_InsertUpdate];
 PRINT 'El TRIGGER [dbo].[TG_IncidentType(Audit)_InsertUpdate] fue eliminado';
END
GO
PRINT 'Creando TRIGGER [dbo].[TG_IncidentType(Audit)_InsertUpdate]...';
GO
CREATE TRIGGER [dbo].[TG_IncidentType(Audit)_InsertUpdate]
ON [dbo].[Incident_type]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
  
  IF UPDATE(incident_type_name)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Incident_type', 
           ColumnName   = 'incident_type_name',
           ID1          = i.incident_type_id, 
           Date         = @CurrDate, 
           OldValue     = d.[incident_type_name], 
           NewValue     = i.[incident_type_name],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.incident_type_id = i.incident_type_id)
    WHERE ISNULL(d.incident_type_name, '') != ISNULL(i.incident_type_name, '');
  END
  IF UPDATE(incident_type_description)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID,
                                 Date,
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Incident_type', 
           ColumnName   = 'incident_type_description',
           ID1          = i.incident_type_id, 
           Date         = @CurrDate, 
           OldValue     = d.[incident_type_description], 
           NewValue     = i.[incident_type_description],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.incident_type_id = i.incident_type_id)
    WHERE ISNULL(d.incident_type_description, '') != ISNULL(i.incident_type_description, '');
  END
  IF UPDATE(incident_type_type)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID,
                                 Date,
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Incident_type', 
           ColumnName   = 'incident_type_type',
           ID1          = i.incident_type_id, 
           Date         = @CurrDate, 
           OldValue     = d.[incident_type_type], 
           NewValue     = i.[incident_type_type],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.incident_type_id = i.incident_type_id)
    WHERE ISNULL(d.incident_type_type, '') != ISNULL(i.incident_type_type, '');
  END
  IF UPDATE(incident_type_subtype)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID,
                                 Date,
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Incident_type', 
           ColumnName   = 'incident_type_subtype',
           ID1          = i.incident_type_id, 
           Date         = @CurrDate, 
           OldValue     = d.[incident_type_subtype], 
           NewValue     = i.[incident_type_subtype],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.incident_type_id = i.incident_type_id)
    WHERE ISNULL(d.incident_type_subtype, '') != ISNULL(i.incident_type_subtype, '');
  END
END;
GO
PRINT '[dbo].[TG_IncidentType(Audit)_InsertUpdate] ha sido creado';
GO
--Trigger of Incident
/******************************************************************************
**  Name: TG_IncidentDetail(Audit)_InsertUpdate
**  Desc: Audit History for Incident table
** 
**  Called by: ssi
**
**  Author: Christian Tola
**
**  Date: 05/26/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/26/2018 Christian Tola   Initial version
*******************************************************************************/
IF EXISTS (SELECT 1
				FROM sys.triggers
				WHERE name = 'TG_Incident(Audit)_InsertUpdate')
BEGIN
 DROP TRIGGER [dbo].[TG_Incident(Audit)_InsertUpdate];
 PRINT 'El TRIGGER [dbo].[TG_Incident(Audit)_InsertUpdate] fue eliminado';
END
GO
PRINT 'Creando TRIGGER [dbo].[TG_Incident(Audit)_InsertUpdate]...';
GO
CREATE TRIGGER [dbo].[TG_Incident(Audit)_InsertUpdate]
ON [dbo].[Incident]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
  
  IF UPDATE(incident_code)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Incident', 
           ColumnName   = 'incident_code',
           ID1          = i.incident_id, 
           Date         = @CurrDate, 
           OldValue     = d.[incident_code], 
           NewValue     = i.[incident_code],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.incident_id = i.incident_id)
    WHERE ISNULL(d.incident_code, '') != ISNULL(i.incident_code, '');
  END
  IF UPDATE(incident_number)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID,
                                 Date,
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Incident', 
           ColumnName   = 'incident_number',
           ID1          = i.incident_id, 
           Date         = @CurrDate, 
           OldValue     = d.[incident_number], 
           NewValue     = i.[incident_number],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.incident_id = i.incident_id)
    WHERE ISNULL(d.incident_number, '') != ISNULL(i.incident_number, '');
  END
  IF UPDATE(incident_registered_date)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID,
                                 Date,
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Incident', 
           ColumnName   = 'incident_registered_date',
           ID1          = i.incident_id, 
           Date         = @CurrDate, 
           OldValue     = d.[incident_registered_date], 
           NewValue     = i.[incident_registered_date],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.incident_id = i.incident_id)
    WHERE ISNULL(d.incident_registered_date, '') != ISNULL(i.incident_registered_date, '');
  END
  IF UPDATE(incident_severity)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID,
                                 Date,
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Incident', 
           ColumnName   = 'incident_area',
           ID1          = i.incident_id, 
           Date         = @CurrDate, 
           OldValue     = d.[incident_severity], 
           NewValue     = i.[incident_severity],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.incident_id = i.incident_id)
    WHERE ISNULL(d.incident_severity, '') != ISNULL(i.incident_severity, '');
  END
  IF UPDATE(incident_reincident)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID,
                                 Date,
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Incident', 
           ColumnName   = 'incident_reincident',
           ID1          = i.incident_id,
           Date         = @CurrDate,
           OldValue     = d.[incident_reincident], 
           NewValue     = i.[incident_reincident],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.incident_id = i.incident_id)
    WHERE ISNULL(d.incident_reincident, '') != ISNULL(i.incident_reincident, '');
  END
  IF UPDATE(incident_treatment)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID,
                                 Date,
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Incident', 
           ColumnName   = 'incident_treatment',
           ID1          = i.incident_id,
           Date         = @CurrDate,
           OldValue     = d.[incident_treatment], 
           NewValue     = i.[incident_treatment],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.incident_id = i.incident_id)
    WHERE ISNULL(d.incident_treatment, '') != ISNULL(i.incident_treatment, '');
  END
END;
GO
PRINT '[dbo].[TG_Incident(Audit)_InsertUpdate] ha sido creado';
GO
--Trigger of IncidentTable
/******************************************************************************
**  Name: TG_User(Audit)_InsertUpdate
**  Desc: Audit History for User table
** 
**  Called by: ssi
**
**  Author: Christian Tola
**
**  Date: 05/26/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/26/2018 Christian Tola   Initial version
*******************************************************************************/
IF EXISTS (SELECT 1
				FROM sys.triggers
				WHERE name = 'TG_User(Audit)_InsertUpdate')
BEGIN
 DROP TRIGGER [dbo].[TG_User(Audit)_InsertUpdate];
 PRINT 'El TRIGGER [dbo].[TG_User(Audit)_InsertUpdate] fue eliminado';
END
GO
PRINT 'Creando TRIGGER [dbo].[TG_User(Audit)_InsertUpdate]...';
GO
CREATE TRIGGER [dbo].[TG_User(Audit)_InsertUpdate]
ON [dbo].[users]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
  
  IF UPDATE(user_name)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'user', 
           ColumnName   = 'user_name',
           ID1          = i.user_id, 
           Date         = @CurrDate, 
           OldValue     = d.[user_name], 
           NewValue     = i.[user_name],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.user_id = i.user_id)
    WHERE ISNULL(d.user_name, '') != ISNULL(i.user_name, '');
  END
  IF UPDATE(user_password)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID,
                                 Date,
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'user', 
           ColumnName   = 'user_password',
           ID1          = i.user_id, 
           Date         = @CurrDate, 
           OldValue     = d.[user_password], 
           NewValue     = i.[user_password],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.user_id = i.user_id)
    WHERE ISNULL(d.user_password, '') != ISNULL(i.user_password, '');
  END
  IF UPDATE(user_active)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID,
                                 Date,
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'user', 
           ColumnName   = 'user_active',
           ID1          = i.user_id, 
           Date         = @CurrDate, 
           OldValue     = d.[user_active], 
           NewValue     = i.[user_active],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.user_id = i.user_id)
    WHERE ISNULL(d.user_active, '') != ISNULL(i.user_active, '');
  END
END;
GO
PRINT '[dbo].[TG_User(Audit)_InsertUpdate] ha sido creado';
GO
--Trigger of Equipaments table
/******************************************************************************
**  Name: TG_Equipment(Audit)_InsertUpdate
**  Desc: Audit History for equipaments table
** 
**  Called by: ssi
**
**  Author: Christian Tola
**
**  Date: 05/26/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/26/2018 Christian Tola   Initial version
*******************************************************************************/
IF EXISTS (SELECT 1
				FROM sys.triggers
				WHERE name = 'TG_Equipament(Audit)_InsertUpdate')
BEGIN
 DROP TRIGGER [dbo].[TG_Equipament(Audit)_InsertUpdate];
 PRINT 'El TRIGGER [dbo].[TG_Equipament(Audit)_InsertUpdate] fue eliminado';
END
GO
PRINT 'Creando TRIGGER [dbo].[TG_Equipament(Audit)_InsertUpdate]...';
GO
CREATE TRIGGER [dbo].[TG_Equipament(Audit)_InsertUpdate]
ON [dbo].[Equipaments]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
  
  IF UPDATE(equipament_name)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Equipaments', 
           ColumnName   = 'equipament_name',
           ID1          = i.equipament_id, 
           Date         = @CurrDate, 
           OldValue     = d.[equipament_name], 
           NewValue     = i.[equipament_name],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.equipament_id = i.equipament_id)
    WHERE ISNULL(d.equipament_name, '') != ISNULL(i.equipament_name, '');
  END
  IF UPDATE(equipament_type)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID,
                                 Date,
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Equipaments', 
           ColumnName   = 'equipament_type',
           ID1          = i.equipament_id,
           Date         = @CurrDate,
           OldValue     = d.[equipament_type], 
           NewValue     = i.[equipament_type],
           ModifiedBy   = i.modified_by
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.equipament_id = i.equipament_id)
    WHERE ISNULL(d.equipament_type, '') != ISNULL(i.equipament_type, '');
  END
  IF UPDATE(equipament_description)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID,
                                 Date,
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Equipaments', 
           ColumnName   = 'equipament_description',
           ID1          = i.equipament_id,
           Date         = @CurrDate,
           OldValue     = d.[equipament_description], 
           NewValue     = i.[equipament_description],
           ModifiedBy   = i.modified_by
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.equipament_id = i.equipament_id)
    WHERE ISNULL(d.equipament_description, '') != ISNULL(i.equipament_description, '');
  END
END;
GO
PRINT '[dbo].[TG_Equipament(Audit)_InsertUpdate] ha sido creado';
GO