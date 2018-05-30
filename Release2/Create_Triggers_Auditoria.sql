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
--Trigger of AreasTable
/******************************************************************************
**  Name: TG_Areas(Audit)_InsertUpdate
**  Desc: Audit History for User table
** 
**  Called by: ssi
**
**  Author: Boris Medrano
**
**  Date: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/28/2018 Boris Medrano   Initial version
*******************************************************************************/
IF EXISTS (SELECT 1 FROM sys.triggers
    WHERE  NAME = 'TG_Areas(Audit)_InsertUpdate')
BEGIN
		DROP TRIGGER [dbo].[TG_Areas(Audit)_InsertUpdate]
		PRINT 'EL TRIGGER TG_Areas(Audit)_InsertUpdate SE ELIMINO '

END    
GO

CREATE TRIGGER [dbo].[TG_Areas(Audit)_InsertUpdate]
ON [dbo].[areas]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
  
  IF UPDATE(area_name)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'areas', 
           ColumnName   = 'area_name',
           ID1          = i.area_id, 
           Date         = @CurrDate, 
           OldValue     = d.[area_name], 
           NewValue     = i.[area_name],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.area_id = i.area_id)
    WHERE ISNULL(d.area_name, '') != ISNULL(i.area_name, '');
  END

  IF UPDATE(area_description)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'areas', 
           ColumnName   = 'area_description',
           ID1          = i.area_id, 
           Date         = @CurrDate, 
           OldValue     = d.[area_description], 
           NewValue     = i.[area_description],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.area_id = i.area_id)
    WHERE ISNULL(d.area_description, '') != ISNULL(i.area_description, '');
  END
  
END;
GO
--Trigger of ContractsTable
/******************************************************************************
**  Name: TG_Contracts(Audit)_InsertUpdate
**  Desc: Audit History for User table
** 
**  Called by: ssi
**
**  Author: Boris Medrano
**
**  Date: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/28/2018 Boris Medrano   Initial version
*******************************************************************************/
IF EXISTS (SELECT 1 FROM sys.triggers
    WHERE  NAME = 'TG_Contracts(Audit)_InsertUpdate')
	BEGIN
		DROP TRIGGER [dbo].[TG_Contracts(Audit)_InsertUpdate]
		PRINT 'EL TRIGGER TG_Contracts(Audit)_InsertUpdate SE ELIMINO '

	END    
GO
--Creando Trigger TG_Contracts(Audit)_InsertUpdate
CREATE TRIGGER [dbo].[TG_Contracts(Audit)_InsertUpdate]
ON [dbo].[contracts]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
  
  IF UPDATE(contract_code)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'contracts', 
           ColumnName   = 'contract_code',
           ID1          = i.contract_id, 
           Date         = @CurrDate, 
           OldValue     = d.[contract_code], 
           NewValue     = i.[contract_code],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.contract_id = i.contract_id)
    WHERE ISNULL(d.contract_code, '') != ISNULL(i.contract_code, '');
  END
  IF UPDATE(contract_city)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'contracts', 
           ColumnName   = 'contract_city',
           ID1          = i.contract_id, 
           Date         = @CurrDate, 
           OldValue     = d.[contract_city], 
           NewValue     = i.[contract_city],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.contract_id = i.contract_id)
    WHERE ISNULL(d.contract_city, '') != ISNULL(i.contract_city, '');
  END
 IF UPDATE(contract_type)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'contracts', 
           ColumnName   = 'contract_type',
           ID1          = i.contract_id, 
           Date         = @CurrDate, 
           OldValue     = d.[contract_type], 
           NewValue     = i.[contract_type],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.contract_id = i.contract_id)
    WHERE ISNULL(d.contract_type, '') != ISNULL(i.contract_type, '');
  END
 IF UPDATE(contract_date)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'contracts', 
           ColumnName   = 'contract_date',
           ID1          = i.contract_id, 
           Date         = @CurrDate, 
           OldValue     = d.[contract_date], 
           NewValue     = i.[contract_date],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.contract_id = i.contract_id)
    WHERE ISNULL(d.contract_date, '') != ISNULL(i.contract_date, '');
  END
  IF UPDATE(contract_salary)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'contracts', 
           ColumnName   = 'contract_salary',
           ID1          = i.contract_id, 
           Date         = @CurrDate, 
           OldValue     = d.[contract_salary], 
           NewValue     = i.[contract_salary],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.contract_id = i.contract_id)
    WHERE ISNULL(d.contract_salary, '') != ISNULL(i.contract_salary, '');
  END
 IF UPDATE(contract_description)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'contracts', 
           ColumnName   = 'contract_description',
           ID1          = i.contract_id, 
           Date         = @CurrDate, 
           OldValue     = d.[contract_description], 
           NewValue     = i.[contract_description],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.contract_id = i.contract_id)
    WHERE ISNULL(d.contract_description, '') != ISNULL(i.contract_description, '');
  END
 
  
END;
GO
--Trigger of DepartmentTable
/******************************************************************************
**  Name: TG_Department(Audit)_InsertUpdate
**  Desc: Audit History for User table
** 
**  Called by: ssi
**
**  Author: Boris Medrano
**
**  Date: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/28/2018 Boris Medrano   Initial version
*******************************************************************************/
IF EXISTS (SELECT 1 FROM sys.triggers
    WHERE  NAME = 'TG_Department(Audit)_InsertUpdate')
BEGIN
		DROP TRIGGER [dbo].[TG_Department(Audit)_InsertUpdate]
		PRINT 'EL TRIGGER TG_Department(Audit)_InsertUpdate SE ELIMINO '

END    
GO
CREATE TRIGGER [dbo].[TG_Department(Audit)_InsertUpdate]
ON [dbo].[department]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
  
  IF UPDATE(department_description)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'department', 
           ColumnName   = 'department_description',
           ID1          = i.department_id, 
           Date         = @CurrDate, 
           OldValue     = d.[department_description], 
           NewValue     = i.[department_description],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.department_id = i.department_id)
    WHERE ISNULL(d.department_description, '') != ISNULL(i.department_description, '');
  END
  IF UPDATE(department_name)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'department', 
           ColumnName   = 'department_name',
           ID1          = i.department_id, 
           Date         = @CurrDate, 
           OldValue     = d.[department_name], 
           NewValue     = i.[department_name],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.department_id = i.department_id)
    WHERE ISNULL(d.department_name, '') != ISNULL(i.department_name, '');
  END
  
END;
GO
--Trigger of FunctionsTable
/******************************************************************************
**  Name: TG_Functions(Audit)_InsertUpdate
**  Desc: Audit History for User table
** 
**  Called by: ssi
**
**  Author: Boris Medrano
**
**  Date: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/28/2018 Boris Medrano   Initial version
*******************************************************************************/
IF EXISTS (SELECT 1 FROM sys.triggers
    WHERE  NAME = 'TG_Functions(Audit)_InsertUpdate')
BEGIN
		DROP TRIGGER [dbo].[TG_Functions(Audit)_InsertUpdate]
		PRINT 'EL TRIGGER TG_Functions(Audit)_InsertUpdate SE ELIMINO '

END    
GO
CREATE TRIGGER [dbo].[TG_Functions(Audit)_InsertUpdate]
ON [dbo].[functions]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
  
  IF UPDATE(func_description)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'functions', 
           ColumnName   = 'func_description',
           ID1          = i.func_id, 
           Date         = @CurrDate, 
           OldValue     = d.[func_description], 
           NewValue     = i.[func_description],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.func_id = i.func_id)
    WHERE ISNULL(d.func_description, '') != ISNULL(i.func_description, '');
  END
  IF UPDATE(func_name)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'functions', 
           ColumnName   = 'func_name',
           ID1          = i.func_id, 
           Date         = @CurrDate, 
           OldValue     = d.[func_name], 
           NewValue     = i.[func_name],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.func_id = i.func_id)
    WHERE ISNULL(d.func_name, '') != ISNULL(i.func_name, '');
  END

   IF UPDATE(position_position_id)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'functions', 
           ColumnName   = 'position_position_id',
           ID1          = i.func_id, 
           Date         = @CurrDate, 
           OldValue     = d.[position_position_id], 
           NewValue     = i.[position_position_id],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.func_id = i.func_id)
    WHERE ISNULL(d.position_position_id, '') != ISNULL(i.position_position_id, '');
  END

  
END;
GO
--Trigger of PersonalsTable
/******************************************************************************
**  Name: TG_Personals(Audit)_InsertUpdate
**  Desc: Audit History for User table
** 
**  Called by: ssi
**
**  Author: Boris Medrano
**
**  Date: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/28/2018 Boris Medrano   Initial version
*******************************************************************************/
IF EXISTS (SELECT 1 FROM sys.triggers
    WHERE  NAME = 'TG_Personals(Audit)_InsertUpdate')
BEGIN
		DROP TRIGGER [dbo].[TG_Personals(Audit)_InsertUpdate]
		PRINT 'EL TRIGGER TG_Personals(Audit)_InsertUpdate SE ELIMINO '

END    
GO
CREATE TRIGGER [dbo].[TG_Personals(Audit)_InsertUpdate]
ON [dbo].[personals]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
  
  IF UPDATE(personal_active)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'personal', 
           ColumnName   = 'personal_active',
           ID1          = i.personal_id, 
           Date         = @CurrDate, 
           OldValue     = d.[personal_active], 
           NewValue     = i.[personal_active],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.personal_id = i.personal_id)
    WHERE ISNULL(d.personal_active, '') != ISNULL(i.personal_active, '');
  END
   
  IF UPDATE(personal_direction)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'personal', 
           ColumnName   = 'personal_direction',
           ID1          = i.personal_id, 
           Date         = @CurrDate, 
           OldValue     = d.[personal_direction], 
           NewValue     = i.[personal_direction],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.personal_id = i.personal_id)
    WHERE ISNULL(d.personal_direction, '') != ISNULL(i.personal_direction, '');
  END
  IF UPDATE(personal_cellphone)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'personal', 
           ColumnName   = 'personal_cellphone',
           ID1          = i.personal_id, 
           Date         = @CurrDate, 
           OldValue     = d.[personal_cellphone], 
           NewValue     = i.[personal_cellphone],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.personal_id = i.personal_id)
    WHERE ISNULL(d.personal_cellphone, '') != ISNULL(i.personal_cellphone, '');
  END
  IF UPDATE(personal_email)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'personal', 
           ColumnName   = 'personal_email',
           ID1          = i.personal_id, 
           Date         = @CurrDate, 
           OldValue     = d.[personal_email], 
           NewValue     = i.[personal_email],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.personal_id = i.personal_id)
    WHERE ISNULL(d.personal_email, '') != ISNULL(i.personal_email, '');
  END
  IF UPDATE(personal_last_name)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'personal', 
           ColumnName   = 'personal_last_name',
           ID1          = i.personal_id, 
           Date         = @CurrDate, 
           OldValue     = d.[personal_last_name], 
           NewValue     = i.[personal_last_name],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.personal_id = i.personal_id)
    WHERE ISNULL(d.personal_last_name, '') != ISNULL(i.personal_last_name, '');
  END
   IF UPDATE(personal_name)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'personal', 
           ColumnName   = 'personal_name',
           ID1          = i.personal_id, 
           Date         = @CurrDate, 
           OldValue     = d.[personal_name], 
           NewValue     = i.[personal_name],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.personal_id = i.personal_id)
    WHERE ISNULL(d.personal_name, '') != ISNULL(i.personal_name, '');
  END

   IF UPDATE(personal_telephone)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'personal', 
           ColumnName   = 'personal_telephone',
           ID1          = i.personal_id, 
           Date         = @CurrDate, 
           OldValue     = d.[personal_telephone], 
           NewValue     = i.[personal_telephone],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.personal_id = i.personal_id)
    WHERE ISNULL(d.personal_telephone, '') != ISNULL(i.personal_telephone, '');
  END
  IF UPDATE(area_area_id)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'personal', 
           ColumnName   = 'area_area_id',
           ID1          = i.personal_id, 
           Date         = @CurrDate, 
           OldValue     = d.[area_area_id], 
           NewValue     = i.[area_area_id],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.personal_id = i.personal_id)
    WHERE ISNULL(d.area_area_id, '') != ISNULL(i.area_area_id, '');
  END
   
END;
GO
--Trigger of PositionTable
/******************************************************************************
**  Name: TG_Position(Audit)_InsertUpdate
**  Desc: Audit History for User table
** 
**  Called by: ssi
**
**  Author: Boris Medrano
**
**  Date: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/28/2018 Boris Medrano   Initial version
*******************************************************************************/
IF EXISTS (SELECT 1 FROM sys.triggers
    WHERE  NAME = 'TG_Position(Audit)_InsertUpdate')
BEGIN
		DROP TRIGGER [dbo].[TG_Position(Audit)_InsertUpdate]
		PRINT 'EL TRIGGER TG_Position(Audit)_InsertUpdate SE ELIMINO '

END    
GO
CREATE TRIGGER [dbo].[TG_Position(Audit)_InsertUpdate]
ON [dbo].[position]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
  
  IF UPDATE(position_description)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'position', 
           ColumnName   = 'position_description',
           ID1          = i.position_id, 
           Date         = @CurrDate, 
           OldValue     = d.[position_description], 
           NewValue     = i.[position_description],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.position_id = i.position_id)
    WHERE ISNULL(d.position_description, '') != ISNULL(i.position_description, '');
  END
  IF UPDATE(position_name)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'position', 
           ColumnName   = 'position_name',
           ID1          = i.position_id, 
           Date         = @CurrDate, 
           OldValue     = d.[position_name], 
           NewValue     = i.[position_name],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.position_id = i.position_id)
    WHERE ISNULL(d.position_name, '') != ISNULL(i.position_name, '');
  END
  IF UPDATE(position_level)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'position', 
           ColumnName   = 'position_level',
           ID1          = i.position_id, 
           Date         = @CurrDate, 
           OldValue     = d.[position_level], 
           NewValue     = i.[position_level],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.position_id = i.position_id)
    WHERE ISNULL(d.position_level, '') != ISNULL(i.position_level, '');
  END
  IF UPDATE(parent_position_position_id)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'position', 
           ColumnName   = 'parent_position_position_id',
           ID1          = i.position_id, 
           Date         = @CurrDate, 
           OldValue     = d.[parent_position_position_id], 
           NewValue     = i.[parent_position_position_id],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.position_id = i.position_id)
    WHERE ISNULL(d.parent_position_position_id, '') != ISNULL(i.parent_position_position_id, '');
  END
END;
GO
--Trigger of RequirementsTable
/******************************************************************************
**  Name: TG_Requirements(Audit)_InsertUpdate
**  Desc: Audit History for User table
** 
**  Called by: ssi
**
**  Author: Boris Medrano
**
**  Date: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/28/2018 Boris Medrano   Initial version
*******************************************************************************/
IF EXISTS (SELECT 1 FROM sys.triggers
    WHERE  NAME = 'TG_Requirements(Audit)_InsertUpdate')
BEGIN
		DROP TRIGGER [dbo].[TG_Requirements(Audit)_InsertUpdate]
		PRINT 'EL TRIGGER TG_Requirements(Audit)_InsertUpdate SE ELIMINO1 '

END    
GO
CREATE TRIGGER [dbo].[TG_Requirements(Audit)_InsertUpdate]
ON [dbo].[requirements]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
  
  IF UPDATE(requiriment_description)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'requirements', 
           ColumnName   = 'requiriment_description',
           ID1          = i.requiriment_id, 
           Date         = @CurrDate, 
           OldValue     = d.[requiriment_description], 
           NewValue     = i.[requiriment_description],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.requiriment_id = i.requiriment_id)
    WHERE ISNULL(d.requiriment_description, '') != ISNULL(i.requiriment_description, '');
  END
  IF UPDATE(requiriment_name)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'requirements', 
           ColumnName   = 'requiriment_name',
           ID1          = i.requiriment_id, 
           Date         = @CurrDate, 
           OldValue     = d.[requiriment_name], 
           NewValue     = i.[requiriment_name],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.requiriment_id = i.requiriment_id)
    WHERE ISNULL(d.requiriment_name, '') != ISNULL(i.requiriment_name, '');
  END

   IF UPDATE(position_position_id)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'requirements', 
           ColumnName   = 'position_position_id',
           ID1          = i.requiriment_id, 
           Date         = @CurrDate, 
           OldValue     = d.[position_position_id], 
           NewValue     = i.[position_position_id],
           ModifiedBy   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.requiriment_id = i.requiriment_id)
    WHERE ISNULL(d.position_position_id, '') != ISNULL(i.position_position_id, '');
  END
END;
GO
IF EXISTS (SELECT 1 FROM sys.triggers
    WHERE  NAME = 'TG_Program_sso_activities(Audit)_InsertUpdate')
BEGIN
		DROP TRIGGER [TG_Program_sso_activities(Audit)_InsertUpdate]
		PRINT 'EL TRIGGER TG_Program_sso_activities(Audit)_InsertUpdate SE ELIMINO '

END
GO

--Trigger of Program_sso_activities Table
/******************************************************************************
**  Name: TG_Program_sso(Audit)_InsertUpdate
**  Desc: Audit History for program_sso_activities table
**
**  Called by: ssi
**
**  Author: Patsy Vanessa Alcocer Iriarte
**
**  Date: 05/29/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/29/2018 Vanessa Alcocer   Initial version
*******************************************************************************/
IF EXISTS (SELECT 1 FROM sys.triggers
    WHERE  NAME = 'TG_Program_sso_activities(Audit)_InsertUpdate')
BEGIN
		DROP TRIGGER [dbo].[TG_Program_sso_activities(Audit)_InsertUpdate]
		PRINT 'EL TRIGGER TG_Requirements(Audit)_InsertUpdate SE ELIMINO '

END    
GO
CREATE TRIGGER [dbo].[TG_Program_sso_activities(Audit)_InsertUpdate]
ON [dbo].[program_sso_activities]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1
    RETURN

  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  DECLARE @CurrDate DATETIME = GETUTCDATE();

  IF UPDATE(sso_detail_activities)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'program_sso_activities',
           ColumnName   = 'sso_detail_activities',
           ID1          = i.sso_detail_id,
           Date         = @CurrDate,
           OldValue     = d.sso_detail_activities,
           NewValue     = i.[sso_detail_activities],
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_detail_id = i.sso_detail_id)
    WHERE ISNULL(d.sso_detail_activities, '') != ISNULL(i.sso_detail_activities, '');
  END

  IF UPDATE(sso_detail_goal)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'program_sso_activities',
           ColumnName   = 'sso_detail_goal',
           ID1          = i.sso_detail_id,
           Date         = @CurrDate,
           OldValue     = d.[sso_detail_goal],
           NewValue     = i.[sso_detail_goal],
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_detail_id = i.sso_detail_id)
    WHERE ISNULL(d.sso_detail_goal, '') != ISNULL(i.sso_detail_goal, '');
  END

   IF UPDATE(so_detail_number)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'program_sso_activities',
           ColumnName   = 'sso_detail_number',
           ID1          = i.sso_detail_id,
           Date         = @CurrDate,
           OldValue     = d.[so_detail_number],
           NewValue     = i.[so_detail_number],
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_detail_id = i.sso_detail_id)
    WHERE ISNULL(d.so_detail_number, '') != ISNULL(i.so_detail_number, '');
  END

    IF UPDATE(sso_detail_time)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'program_sso_activities',
           ColumnName   = 'sso_detail_time',
           ID1          = i.sso_detail_id,
           Date         = @CurrDate,
           OldValue     = d.sso_detail_time,
           NewValue     = i.[sso_detail_time],
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_detail_id = i.sso_detail_id)
    WHERE ISNULL(d.sso_detail_time, '') != ISNULL(i.sso_detail_time, '');
  END

       IF UPDATE(soo_detail_type)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'program_sso_activities',
           ColumnName   = 'soo_detail_type',
           ID1          = i.sso_detail_id,
           Date         = @CurrDate,
           OldValue     = d.soo_detail_type,
           NewValue     = i.[soo_detail_type],
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_detail_id = i.sso_detail_id)
    WHERE ISNULL(d.soo_detail_type, '') != ISNULL(i.soo_detail_type, '');
  END

END;
GO
IF EXISTS (SELECT 1 FROM sys.triggers
    WHERE  NAME = 'TG_Program_sso(Audit)_InsertUpdate')
BEGIN
		DROP TRIGGER [TG_Program_sso(Audit)_InsertUpdate]
		PRINT 'EL TRIGGER TG_Program_sso(Audit)_InsertUpdate SE ELIMINO '

END
GO

--Trigger of Program_sso Table
/******************************************************************************
**  Name: TG_Program_sso(Audit)_InsertUpdate
**  Desc: Audit History for program_sso table
**
**  Called by: ssi
**
**  Author: Patsy Vanessa Alcocer Iriarte
**
**  Date: 05/29/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/28/2018 Vanessa Alcocer   Initial version
*******************************************************************************/
CREATE TRIGGER [dbo].[TG_Program_sso(Audit)_InsertUpdate]
ON [dbo].[program_sso]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1
    RETURN

  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  DECLARE @CurrDate DATETIME = GETUTCDATE();

  IF UPDATE(sso_execution_time)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'program_sso',
           ColumnName   = 'sso_execution_time',
           ID1          = i.sso_id,
           Date         = @CurrDate,
           OldValue     = d.sso_execution_time,
           NewValue     = i.[sso_execution_time],
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_id = i.sso_id)
    WHERE ISNULL(d.sso_execution_time, '') != ISNULL(i.sso_execution_time, '');
  END

  IF UPDATE(sso_goal)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'program_sso',
           ColumnName   = 'sso_goal',
           ID1          = i.sso_id,
           Date         = @CurrDate,
           OldValue     = d.[sso_goal],
           NewValue     = i.[sso_goal],
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_id = i.sso_id)
    WHERE ISNULL(d.sso_goal, '') != ISNULL(i.sso_goal, '');
  END

    IF UPDATE(sso_indicator)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'program_sso',
           ColumnName   = 'sso_indicator',
           ID1          = i.sso_id,
           Date         = @CurrDate,
           OldValue     = d.sso_indicator,
           NewValue     = i.[sso_indicator],
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_id = i.sso_id)
    WHERE ISNULL(d.sso_indicator, '') != ISNULL(i.sso_indicator, '');
  END

    IF UPDATE(sso_objetive)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'program_sso',
           ColumnName   = 'sso_objetive',
           ID1          = i.sso_id,
           Date         = @CurrDate,
           OldValue     = d.sso_objetive,
           NewValue     = i.[sso_objetive],
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_id = i.sso_id)
    WHERE ISNULL(d.sso_objetive, '') != ISNULL(i.sso_objetive, '');
  END

      IF UPDATE(sso_responsable)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'program_sso',
           ColumnName   = 'sso_responsable',
           ID1          = i.sso_id,
           Date         = @CurrDate,
           OldValue     = d.sso_responsable,
           NewValue     = i.[sso_responsable],
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_id = i.sso_id)
    WHERE ISNULL(d.sso_responsable, '') != ISNULL(i.sso_responsable, '');
  END

        IF UPDATE(sso_total_cost)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'program_sso',
           ColumnName   = 'sso_total_cost',
           ID1          = i.sso_id,
           Date         = @CurrDate,
           OldValue     = d.sso_total_cost,
           NewValue     = i.[sso_total_cost],
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_id = i.sso_id)
    WHERE ISNULL(d.sso_total_cost, '') != ISNULL(i.sso_total_cost, '');
  END

END;
GO
IF EXISTS (SELECT 1 FROM sys.triggers
    WHERE  NAME = 'TG_Program_sso_resource(Audit)_InsertUpdate')
BEGIN
		DROP TRIGGER [TG_Program_sso_resource(Audit)_InsertUpdate]
		PRINT 'EL TRIGGER TG_Program_sso_resource(Audit)_InsertUpdate SE ELIMINO '

END
GO

--Trigger of Program_sso_resource Table
/******************************************************************************
**  Name: TG_Program_sso_resource(Audit)_InsertUpdate
**  Desc: Audit History for program_sso_resource table
**
**  Called by: ssi
**
**  Author: Patsy Vanessa Alcocer Iriarte
**
**  Date: 05/29/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/29/2018 Vanessa Alcocer   Initial version
*******************************************************************************/
CREATE TRIGGER [dbo].[TG_Program_sso_resource(Audit)_InsertUpdate]
ON [dbo].[program_sso_resource]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1
    RETURN

  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  DECLARE @CurrDate DATETIME = GETUTCDATE();

  IF UPDATE(sso_resource_cost)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'program_sso_resource',
           ColumnName   = 'sso_resource_cost',
           ID1          = i.sso_resource_id,
           Date         = @CurrDate,
           OldValue     = d.sso_resource_cost,
           NewValue     = i.[sso_resource_cost],
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_resource_id = i.sso_resource_id)
    WHERE ISNULL(d.sso_resource_cost, '') != ISNULL(i.sso_resource_cost, '');
  END

  IF UPDATE(sso_resource_detail)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'program_sso_resource',
           ColumnName   = 'sso_resource_detail',
           ID1          = i.sso_resource_id,
           Date         = @CurrDate,
           OldValue     = d.[sso_resource_detail],
           NewValue     = i.[sso_resource_detail],
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_detail_id = i.sso_detail_id)
    WHERE ISNULL(d.sso_resource_detail, '') != ISNULL(i.sso_resource_detail, '');
  END

END;
GO
IF EXISTS (SELECT 1 FROM sys.triggers
    WHERE  NAME = 'TG_Program_sso_trainer(Audit)_InsertUpdate')
BEGIN
		DROP TRIGGER [TG_Program_sso_trainer(Audit)_InsertUpdate]
		PRINT 'EL TRIGGER TG_Program_sso_trainer(Audit)_InsertUpdate SE ELIMINO '

END
GO

--Trigger of Program_sso_trainer Table
/******************************************************************************
**  Name: TG_Program_sso_trainer(Audit)_InsertUpdate
**  Desc: Audit History for program_sso_trainer table
**
**  Called by: ssi
**
**  Author: Patsy Vanessa Alcocer Iriarte
**
**  Date: 05/29/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/29/2018 Vanessa Alcocer   Initial version
*******************************************************************************/
CREATE TRIGGER [dbo].[TG_Program_sso_trainer(Audit)_InsertUpdate]
ON [dbo].[program_sso_trainer]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1
    RETURN

  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  DECLARE @CurrDate DATETIME = GETUTCDATE();

  IF UPDATE(sso_trainer_skills)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'program_sso_trainer',
           ColumnName   = 'sso_trainer_skills',
           ID1          = i.sso_trainer_id,
           Date         = @CurrDate,
           OldValue     = d.sso_trainer_skills,
           NewValue     = i.[sso_trainer_skills],
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_trainer_id = i.sso_trainer_id)
    WHERE ISNULL(d.sso_trainer_skills, '') != ISNULL(i.sso_trainer_skills, '');
  END

  IF UPDATE(sso_trainer_ci)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'program_sso_trainer',
           ColumnName   = 'sso_trainer_ci',
           ID1          = i.sso_trainer_id,
           Date         = @CurrDate,
           OldValue     = d.[sso_trainer_ci],
           NewValue     = i.[sso_trainer_ci],
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_trainer_id = i.sso_trainer_id)
    WHERE ISNULL(d.sso_trainer_ci, '') != ISNULL(i.sso_trainer_ci, '');
  END

    IF UPDATE(sso_trainer_name)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'program_sso_trainer',
           ColumnName   = 'sso_trainer_name',
           ID1          = i.sso_trainer_id,
           Date         = @CurrDate,
           OldValue     = d.[sso_trainer_name],
           NewValue     = i.[sso_trainer_name],
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_trainer_id = i.sso_trainer_id)
    WHERE ISNULL(d.sso_trainer_name, '') != ISNULL(i.sso_trainer_name, '');
  END

      IF UPDATE(sso_trainer_specialty)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'program_sso_trainer',
           ColumnName   = 'sso_trainer_specialty',
           ID1          = i.sso_trainer_id,
           Date         = @CurrDate,
           OldValue     = d.[sso_trainer_specialty],
           NewValue     = i.[sso_trainer_specialty],
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_trainer_id = i.sso_trainer_id)
    WHERE ISNULL(d.sso_trainer_specialty, '') != ISNULL(i.sso_trainer_specialty, '');
  END

END;
GO
IF EXISTS (SELECT 1 FROM sys.triggers
    WHERE  NAME = 'TG_Roles(Audit)_InsertUpdate')
BEGIN
		DROP TRIGGER [dbo].[TG_Roles(Audit)_InsertUpdate]
		PRINT 'EL TRIGGER TG_Roles(Audit)_InsertUpdate SE ELIMINO '

END
GO

--Trigger of roles Table
/******************************************************************************
**  Name: TG_Roles(Audit)_InsertUpdate
**  Desc: Audit History for roles table
**
**  Called by: ssi
**
**  Author: Patsy Vanessa Alcocer Iriarte
**
**  Date: 05/29/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/29/2018 Vanessa Alcocer   Initial version
*******************************************************************************/
CREATE TRIGGER [dbo].[TG_Roles(Audit)_InsertUpdate]
ON [dbo].[roles]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1
    RETURN

  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  DECLARE @CurrDate DATETIME = GETUTCDATE();

  IF UPDATE(role_name)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'roles',
           ColumnName   = 'role_name',
           ID1          = i.role_id,
           Date         = @CurrDate,
           OldValue     = d.role_name,
           NewValue     = i.[role_name],
           ModifiedBy   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.role_id = i.role_id)
    WHERE ISNULL(d.role_name, '') != ISNULL(i.role_name, '');
  END
END;
GO