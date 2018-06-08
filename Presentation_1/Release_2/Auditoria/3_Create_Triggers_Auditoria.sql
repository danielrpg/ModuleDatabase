USE SSID2
GO

--Trigger of Incident_detail
/******************************************************************************
**  Name: TG_IncidentDetail(Audit)_InsertUpdate
**  Desc: Audit History for Incident detail table
** 
**  Called by: ssi
**
**  Author: Christian Tola
**
**  date: 05/26/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   date:     Author:                            Description:
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
	INSERT INTO dbo.AuditHistory(table_name, 
									column_name, 
									id, 
									date, 
									old_value, 
									new_value,
									modified_by) 
	SELECT table_name    = 'Incident_detail', 
			column_name   = 'incident_detail_status',
			ID1          = i.incident_detail_id, 
			date         = @CurrDate, 
			old_value     = d.[incident_detail_status], 
			new_value     = i.[incident_detail_status],
			modified_by   = i.modified_by 
	FROM deleted d 
	FULL OUTER JOIN inserted i ON (d.incident_detail_id = i.incident_detail_id)
	WHERE ISNULL(d.incident_detail_status, '') != ISNULL(i.incident_detail_status, '');
	END
	IF UPDATE(incident_detail_name)
	BEGIN
	INSERT INTO dbo.AuditHistory(table_name, 
									column_name, 
									id,
									date,
									old_value, 
									new_value,
									modified_by) 
	SELECT table_name    = 'Incident_detail', 
			column_name   = 'incident_detail_name',
			ID1          = i.incident_detail_id, 
			date         = @CurrDate, 
			old_value     = d.[incident_detail_name], 
			new_value     = i.[incident_detail_name],
			modified_by   = i.modified_by 
	FROM deleted d 
	FULL OUTER JOIN inserted i ON (d.incident_detail_id = i.incident_detail_id)
	WHERE ISNULL(d.incident_detail_name, '') != ISNULL(i.incident_detail_name, '');
	END
	IF UPDATE(incident_detail_description)
	BEGIN
	INSERT INTO dbo.AuditHistory(table_name, 
									column_name, 
									id,
									date,
									old_value, 
									new_value,
									modified_by) 
	SELECT table_name    = 'Incident_detail', 
			column_name   = 'incident_detail_description',
			ID1          = i.incident_detail_id, 
			date         = @CurrDate, 
			old_value     = d.[incident_detail_description], 
			new_value     = i.[incident_detail_description],
			modified_by   = i.modified_by 
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
**  date: 05/21/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   date:     Author:                            Description:
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
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id, 
                                 date, 
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'Incident_type', 
           column_name   = 'incident_type_name',
           ID1          = i.incident_type_id, 
           date         = @CurrDate, 
           old_value     = d.[incident_type_name], 
           new_value     = i.[incident_type_name],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.incident_type_id = i.incident_type_id)
    WHERE ISNULL(d.incident_type_name, '') != ISNULL(i.incident_type_name, '');
  END
  IF UPDATE(incident_type_description)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id,
                                 date,
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'Incident_type', 
           column_name   = 'incident_type_description',
           ID1          = i.incident_type_id, 
           date         = @CurrDate, 
           old_value     = d.[incident_type_description], 
           new_value     = i.[incident_type_description],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.incident_type_id = i.incident_type_id)
    WHERE ISNULL(d.incident_type_description, '') != ISNULL(i.incident_type_description, '');
  END
  IF UPDATE(incident_type_type)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id,
                                 date,
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'Incident_type', 
           column_name   = 'incident_type_type',
           ID1          = i.incident_type_id, 
           date         = @CurrDate, 
           old_value     = d.[incident_type_type], 
           new_value     = i.[incident_type_type],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.incident_type_id = i.incident_type_id)
    WHERE ISNULL(d.incident_type_type, '') != ISNULL(i.incident_type_type, '');
  END
  IF UPDATE(incident_type_subtype)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id,
                                 date,
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'Incident_type', 
           column_name   = 'incident_type_subtype',
           ID1          = i.incident_type_id, 
           date         = @CurrDate, 
           old_value     = d.[incident_type_subtype], 
           new_value     = i.[incident_type_subtype],
           modified_by   = i.modified_by 
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
**  date: 05/26/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   date:     Author:                            Description:
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
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id, 
                                 date, 
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'Incident', 
           column_name   = 'incident_code',
           ID1          = i.incident_id, 
           date         = @CurrDate, 
           old_value     = d.[incident_code], 
           new_value     = i.[incident_code],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.incident_id = i.incident_id)
    WHERE ISNULL(d.incident_code, '') != ISNULL(i.incident_code, '');
  END
  IF UPDATE(incident_number)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id,
                                 date,
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'Incident', 
           column_name   = 'incident_number',
           ID1          = i.incident_id, 
           date         = @CurrDate, 
           old_value     = d.[incident_number], 
           new_value     = i.[incident_number],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.incident_id = i.incident_id)
    WHERE ISNULL(d.incident_number, '') != ISNULL(i.incident_number, '');
  END
  IF UPDATE(incident_registered_date)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id,
                                 date,
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'Incident', 
           column_name   = 'incident_registered_date',
           ID1          = i.incident_id, 
           date         = @CurrDate, 
           old_value     = d.[incident_registered_date], 
           new_value     = i.[incident_registered_date],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.incident_id = i.incident_id)
    WHERE ISNULL(d.incident_registered_date, '') != ISNULL(i.incident_registered_date, '');
  END
  IF UPDATE(incident_severity)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id,
                                 date,
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'Incident', 
           column_name   = 'incident_area',
           ID1          = i.incident_id, 
           date         = @CurrDate, 
           old_value     = d.[incident_severity], 
           new_value     = i.[incident_severity],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.incident_id = i.incident_id)
    WHERE ISNULL(d.incident_severity, '') != ISNULL(i.incident_severity, '');
  END
  IF UPDATE(incident_reincident)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id,
                                 date,
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'Incident', 
           column_name   = 'incident_reincident',
           ID1          = i.incident_id,
           date         = @CurrDate,
           old_value     = d.[incident_reincident], 
           new_value     = i.[incident_reincident],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.incident_id = i.incident_id)
    WHERE ISNULL(d.incident_reincident, '') != ISNULL(i.incident_reincident, '');
  END
  IF UPDATE(incident_treatment)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id,
                                 date,
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'Incident', 
           column_name   = 'incident_treatment',
           ID1          = i.incident_id,
           date         = @CurrDate,
           old_value     = d.[incident_treatment], 
           new_value     = i.[incident_treatment],
           modified_by   = i.modified_by 
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
**  date: 05/26/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   date:     Author:                            Description:
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
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id, 
                                 date, 
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'user', 
           column_name   = 'user_name',
           ID1          = i.user_id, 
           date         = @CurrDate, 
           old_value     = d.[user_name], 
           new_value     = i.[user_name],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.user_id = i.user_id)
    WHERE ISNULL(d.user_name, '') != ISNULL(i.user_name, '');
  END
  IF UPDATE(user_password)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id,
                                 date,
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'user', 
           column_name   = 'user_password',
           ID1          = i.user_id, 
           date         = @CurrDate, 
           old_value     = d.[user_password], 
           new_value     = i.[user_password],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.user_id = i.user_id)
    WHERE ISNULL(d.user_password, '') != ISNULL(i.user_password, '');
  END
  IF UPDATE(user_active)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id,
                                 date,
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'user', 
           column_name   = 'user_active',
           ID1          = i.user_id, 
           date         = @CurrDate, 
           old_value     = d.[user_active], 
           new_value     = i.[user_active],
           modified_by   = i.modified_by 
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
**  date: 05/26/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   date:     Author:                            Description:
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
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id, 
                                 date, 
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'Equipaments', 
           column_name   = 'equipament_name',
           ID1          = i.equipament_id, 
           date         = @CurrDate, 
           old_value     = d.[equipament_name], 
           new_value     = i.[equipament_name],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.equipament_id = i.equipament_id)
    WHERE ISNULL(d.equipament_name, '') != ISNULL(i.equipament_name, '');
  END
  IF UPDATE(equipament_type)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id,
                                 date,
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'Equipaments', 
           column_name   = 'equipament_type',
           ID1          = i.equipament_id,
           date         = @CurrDate,
           old_value     = d.[equipament_type], 
           new_value     = i.[equipament_type],
           modified_by   = i.modified_by
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.equipament_id = i.equipament_id)
    WHERE ISNULL(d.equipament_type, '') != ISNULL(i.equipament_type, '');
  END
  IF UPDATE(equipament_description)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id,
                                 date,
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'Equipaments', 
           column_name   = 'equipament_description',
           ID1          = i.equipament_id,
           date         = @CurrDate,
           old_value     = d.[equipament_description], 
           new_value     = i.[equipament_description],
           modified_by   = i.modified_by
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
**  date: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   date:     Author:                            Description:
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
PRINT 'Creando TRIGGER [dbo].[TG_Areas(Audit)_InsertUpdate]...';
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
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id, 
                                 date, 
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'areas', 
           column_name   = 'area_name',
           ID1          = i.area_id, 
           date         = @CurrDate, 
           old_value     = d.[area_name], 
           new_value     = i.[area_name],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.area_id = i.area_id)
    WHERE ISNULL(d.area_name, '') != ISNULL(i.area_name, '');
  END

  IF UPDATE(area_description)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id, 
                                 date, 
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'areas', 
           column_name   = 'area_description',
           ID1          = i.area_id, 
           date         = @CurrDate, 
           old_value     = d.[area_description], 
           new_value     = i.[area_description],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.area_id = i.area_id)
    WHERE ISNULL(d.area_description, '') != ISNULL(i.area_description, '');
  END
  
END;
GO
PRINT '[dbo].[TG_Areas(Audit)_InsertUpdate] ha sido creado';
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
**  date: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   date:     Author:                            Description:
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
PRINT 'Creando TRIGGER [dbo].[TG_Contracts(Audit)_InsertUpdate]...';
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
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id, 
                                 date, 
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'contracts', 
           column_name   = 'contract_code',
           ID1          = i.contract_id, 
           date         = @CurrDate, 
           old_value     = d.[contract_code], 
           new_value     = i.[contract_code],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.contract_id = i.contract_id)
    WHERE ISNULL(d.contract_code, '') != ISNULL(i.contract_code, '');
  END
  IF UPDATE(contract_city)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id, 
                                 date, 
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'contracts', 
           column_name   = 'contract_city',
           ID1          = i.contract_id, 
           date         = @CurrDate, 
           old_value     = d.[contract_city], 
           new_value     = i.[contract_city],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.contract_id = i.contract_id)
    WHERE ISNULL(d.contract_city, '') != ISNULL(i.contract_city, '');
  END
 IF UPDATE(contract_type)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id, 
                                 date, 
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'contracts', 
           column_name   = 'contract_type',
           ID1          = i.contract_id, 
           date         = @CurrDate, 
           old_value     = d.[contract_type], 
           new_value     = i.[contract_type],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.contract_id = i.contract_id)
    WHERE ISNULL(d.contract_type, '') != ISNULL(i.contract_type, '');
  END
 IF UPDATE(contract_date)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id, 
                                 date, 
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'contracts', 
           column_name   = 'contract_date',
           ID1          = i.contract_id, 
           date         = @CurrDate, 
           old_value     = d.[contract_date], 
           new_value     = i.[contract_date],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.contract_id = i.contract_id)
    WHERE ISNULL(d.contract_date, '') != ISNULL(i.contract_date, '');
  END
  IF UPDATE(contract_salary)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id, 
                                 date, 
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'contracts', 
           column_name   = 'contract_salary',
           ID1          = i.contract_id, 
           date         = @CurrDate, 
           old_value     = d.[contract_salary], 
           new_value     = i.[contract_salary],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.contract_id = i.contract_id)
    WHERE ISNULL(d.contract_salary, '') != ISNULL(i.contract_salary, '');
  END
 IF UPDATE(contract_description)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id, 
                                 date, 
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'contracts', 
           column_name   = 'contract_description',
           ID1          = i.contract_id, 
           date         = @CurrDate, 
           old_value     = d.[contract_description], 
           new_value     = i.[contract_description],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.contract_id = i.contract_id)
    WHERE ISNULL(d.contract_description, '') != ISNULL(i.contract_description, '');
  END
 
  
END;
GO
PRINT '[dbo].[TG_Contracts(Audit)_InsertUpdate] ha sido creado';
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
**  date: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   date:     Author:                            Description:
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
PRINT 'Creando TRIGGER [dbo].[TG_Department(Audit)_InsertUpdate]...';
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
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id, 
                                 date, 
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'department', 
           column_name   = 'department_description',
           ID1          = i.department_id, 
           date         = @CurrDate, 
           old_value     = d.[department_description], 
           new_value     = i.[department_description],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.department_id = i.department_id)
    WHERE ISNULL(d.department_description, '') != ISNULL(i.department_description, '');
  END
  IF UPDATE(department_name)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id, 
                                 date, 
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'department', 
           column_name   = 'department_name',
           ID1          = i.department_id, 
           date         = @CurrDate, 
           old_value     = d.[department_name], 
           new_value     = i.[department_name],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.department_id = i.department_id)
    WHERE ISNULL(d.department_name, '') != ISNULL(i.department_name, '');
  END
  
END;
GO
PRINT '[dbo].[TG_Department(Audit)_InsertUpdate] ha sido creado';
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
**  date: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   date:     Author:                            Description:
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
PRINT 'Creando TRIGGER [dbo].[TG_Functions(Audit)_InsertUpdate]...';
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
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id, 
                                 date, 
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'functions', 
           column_name   = 'func_description',
           ID1          = i.func_id, 
           date         = @CurrDate, 
           old_value     = d.[func_description], 
           new_value     = i.[func_description],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.func_id = i.func_id)
    WHERE ISNULL(d.func_description, '') != ISNULL(i.func_description, '');
  END
  IF UPDATE(func_name)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id, 
                                 date, 
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'functions', 
           column_name   = 'func_name',
           ID1          = i.func_id, 
           date         = @CurrDate, 
           old_value     = d.[func_name], 
           new_value     = i.[func_name],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.func_id = i.func_id)
    WHERE ISNULL(d.func_name, '') != ISNULL(i.func_name, '');
  END

   IF UPDATE(position_position_id)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id, 
                                 date, 
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'functions', 
           column_name   = 'position_position_id',
           ID1          = i.func_id, 
           date         = @CurrDate, 
           old_value     = d.[position_position_id], 
           new_value     = i.[position_position_id],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.func_id = i.func_id)
    WHERE ISNULL(d.position_position_id, '') != ISNULL(i.position_position_id, '');
  END

  
END;
GO
PRINT '[dbo].[TG_Functions(Audit)_InsertUpdate] ha sido creado';
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
**  date: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   date:     Author:                            Description:
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
PRINT 'Creando TRIGGER [dbo].[TG_Personals(Audit)_InsertUpdate]...';
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
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id, 
                                 date, 
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'personal', 
           column_name   = 'personal_active',
           ID1          = i.personal_id, 
           date         = @CurrDate, 
           old_value     = d.[personal_active], 
           new_value     = i.[personal_active],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.personal_id = i.personal_id)
    WHERE ISNULL(d.personal_active, '') != ISNULL(i.personal_active, '');
  END
   
  IF UPDATE(personal_direction)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id, 
                                 date, 
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'personal', 
           column_name   = 'personal_direction',
           ID1          = i.personal_id, 
           date         = @CurrDate, 
           old_value     = d.[personal_direction], 
           new_value     = i.[personal_direction],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.personal_id = i.personal_id)
    WHERE ISNULL(d.personal_direction, '') != ISNULL(i.personal_direction, '');
  END
  IF UPDATE(personal_cellphone)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id, 
                                 date, 
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'personal', 
           column_name   = 'personal_cellphone',
           ID1          = i.personal_id, 
           date         = @CurrDate, 
           old_value     = d.[personal_cellphone], 
           new_value     = i.[personal_cellphone],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.personal_id = i.personal_id)
    WHERE ISNULL(d.personal_cellphone, '') != ISNULL(i.personal_cellphone, '');
  END
  IF UPDATE(personal_email)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id, 
                                 date, 
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'personal', 
           column_name   = 'personal_email',
           ID1          = i.personal_id, 
           date         = @CurrDate, 
           old_value     = d.[personal_email], 
           new_value     = i.[personal_email],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.personal_id = i.personal_id)
    WHERE ISNULL(d.personal_email, '') != ISNULL(i.personal_email, '');
  END
  IF UPDATE(personal_last_name)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id, 
                                 date, 
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'personal', 
           column_name   = 'personal_last_name',
           ID1          = i.personal_id, 
           date         = @CurrDate, 
           old_value     = d.[personal_last_name], 
           new_value     = i.[personal_last_name],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.personal_id = i.personal_id)
    WHERE ISNULL(d.personal_last_name, '') != ISNULL(i.personal_last_name, '');
  END
   IF UPDATE(personal_name)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id, 
                                 date, 
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'personal', 
           column_name   = 'personal_name',
           ID1          = i.personal_id, 
           date         = @CurrDate, 
           old_value     = d.[personal_name], 
           new_value     = i.[personal_name],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.personal_id = i.personal_id)
    WHERE ISNULL(d.personal_name, '') != ISNULL(i.personal_name, '');
  END

   IF UPDATE(personal_telephone)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id, 
                                 date, 
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'personal', 
           column_name   = 'personal_telephone',
           ID1          = i.personal_id, 
           date         = @CurrDate, 
           old_value     = d.[personal_telephone], 
           new_value     = i.[personal_telephone],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.personal_id = i.personal_id)
    WHERE ISNULL(d.personal_telephone, '') != ISNULL(i.personal_telephone, '');
  END
  IF UPDATE(area_area_id)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id, 
                                 date, 
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'personal', 
           column_name   = 'area_area_id',
           ID1          = i.personal_id, 
           date         = @CurrDate, 
           old_value     = d.[area_area_id], 
           new_value     = i.[area_area_id],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.personal_id = i.personal_id)
    WHERE ISNULL(d.area_area_id, '') != ISNULL(i.area_area_id, '');
  END
   
END;
GO
PRINT '[dbo].[TG_Personals(Audit)_InsertUpdate] ha sido creado';
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
**  date: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   date:     Author:                            Description:
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
PRINT 'Creando TRIGGER [dbo].[TG_Position(Audit)_InsertUpdate]...';
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
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id, 
                                 date, 
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'position', 
           column_name   = 'position_description',
           ID1          = i.position_id, 
           date         = @CurrDate, 
           old_value     = d.[position_description], 
           new_value     = i.[position_description],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.position_id = i.position_id)
    WHERE ISNULL(d.position_description, '') != ISNULL(i.position_description, '');
  END
  IF UPDATE(position_name)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id, 
                                 date, 
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'position', 
           column_name   = 'position_name',
           ID1          = i.position_id, 
           date         = @CurrDate, 
           old_value     = d.[position_name], 
           new_value     = i.[position_name],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.position_id = i.position_id)
    WHERE ISNULL(d.position_name, '') != ISNULL(i.position_name, '');
  END
  IF UPDATE(position_level)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id, 
                                 date, 
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'position', 
           column_name   = 'position_level',
           ID1          = i.position_id, 
           date         = @CurrDate, 
           old_value     = d.[position_level], 
           new_value     = i.[position_level],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.position_id = i.position_id)
    WHERE ISNULL(d.position_level, '') != ISNULL(i.position_level, '');
  END
  IF UPDATE(parent_position_position_id)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id, 
                                 date, 
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'position', 
           column_name   = 'parent_position_position_id',
           ID1          = i.position_id, 
           date         = @CurrDate, 
           old_value     = d.[parent_position_position_id], 
           new_value     = i.[parent_position_position_id],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.position_id = i.position_id)
    WHERE ISNULL(d.parent_position_position_id, '') != ISNULL(i.parent_position_position_id, '');
  END
END;
GO
PRINT '[dbo].[TG_Position(Audit)_InsertUpdate] ha sido creado';
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
**  date: 05/28/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   date:     Author:                            Description:
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
PRINT 'Creando TRIGGER [dbo].[TG_Requirements(Audit)_InsertUpdate]...';
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
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id, 
                                 date, 
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'requirements', 
           column_name   = 'requiriment_description',
           ID1          = i.requiriment_id, 
           date         = @CurrDate, 
           old_value     = d.[requiriment_description], 
           new_value     = i.[requiriment_description],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.requiriment_id = i.requiriment_id)
    WHERE ISNULL(d.requiriment_description, '') != ISNULL(i.requiriment_description, '');
  END
  IF UPDATE(requiriment_name)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id, 
                                 date, 
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'requirements', 
           column_name   = 'requiriment_name',
           ID1          = i.requiriment_id, 
           date         = @CurrDate, 
           old_value     = d.[requiriment_name], 
           new_value     = i.[requiriment_name],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.requiriment_id = i.requiriment_id)
    WHERE ISNULL(d.requiriment_name, '') != ISNULL(i.requiriment_name, '');
  END

   IF UPDATE(position_position_id)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name, 
                                 column_name, 
                                 id, 
                                 date, 
                                 old_value, 
                                 new_value,
								 modified_by) 
    SELECT table_name    = 'requirements', 
           column_name   = 'position_position_id',
           ID1          = i.requiriment_id, 
           date         = @CurrDate, 
           old_value     = d.[position_position_id], 
           new_value     = i.[position_position_id],
           modified_by   = i.modified_by 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.requiriment_id = i.requiriment_id)
    WHERE ISNULL(d.position_position_id, '') != ISNULL(i.position_position_id, '');
  END
END;
GO
PRINT '[dbo].[TG_Requirements(Audit)_InsertUpdate] ha sido creado';
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
**  date: 05/29/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/29/2018 Vanessa Alcocer   Initial version
*******************************************************************************/
IF EXISTS (SELECT 1 FROM sys.triggers
    WHERE  NAME = 'TG_Program_sso_activities(Audit)_InsertUpdate')
BEGIN
		DROP TRIGGER [dbo].[TG_Program_sso_activities(Audit)_InsertUpdate]
		PRINT 'EL TRIGGER TG_Program_sso_activities(Audit)_InsertUpdate SE ELIMINO '

END    
GO
PRINT 'Creando TRIGGER [dbo].[TG_Program_sso_activities(Audit)_InsertUpdate]...';
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
    INSERT INTO dbo.AuditHistory(table_name,
                                 column_name,
                                 id,
                                 date,
                                 old_value,
                                 new_value,
								 modified_by)
    SELECT table_name    = 'program_sso_activities',
           column_name   = 'sso_detail_activities',
           ID1          = i.sso_detail_id,
           date         = @CurrDate,
           old_value     = d.sso_detail_activities,
           new_value     = i.[sso_detail_activities],
           modified_by   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_detail_id = i.sso_detail_id)
    WHERE ISNULL(d.sso_detail_activities, '') != ISNULL(i.sso_detail_activities, '');
  END

  IF UPDATE(sso_detail_goal)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name,
                                 column_name,
                                 id,
                                 date,
                                 old_value,
                                 new_value,
								 modified_by)
    SELECT table_name    = 'program_sso_activities',
           column_name   = 'sso_detail_goal',
           ID1          = i.sso_detail_id,
           date         = @CurrDate,
           old_value     = d.[sso_detail_goal],
           new_value     = i.[sso_detail_goal],
           modified_by   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_detail_id = i.sso_detail_id)
    WHERE ISNULL(d.sso_detail_goal, '') != ISNULL(i.sso_detail_goal, '');
  END

   IF UPDATE(so_detail_number)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name,
                                 column_name,
                                 id,
                                 date,
                                 old_value,
                                 new_value,
								 modified_by)
    SELECT table_name    = 'program_sso_activities',
           column_name   = 'sso_detail_number',
           ID1          = i.sso_detail_id,
           date         = @CurrDate,
           old_value     = d.[so_detail_number],
           new_value     = i.[so_detail_number],
           modified_by   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_detail_id = i.sso_detail_id)
    WHERE ISNULL(d.so_detail_number, '') != ISNULL(i.so_detail_number, '');
  END

    IF UPDATE(sso_detail_time)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name,
                                 column_name,
                                 id,
                                 date,
                                 old_value,
                                 new_value,
								 modified_by)
    SELECT table_name    = 'program_sso_activities',
           column_name   = 'sso_detail_time',
           ID1          = i.sso_detail_id,
           date         = @CurrDate,
           old_value     = d.sso_detail_time,
           new_value     = i.[sso_detail_time],
           modified_by   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_detail_id = i.sso_detail_id)
    WHERE ISNULL(d.sso_detail_time, '') != ISNULL(i.sso_detail_time, '');
  END

       IF UPDATE(soo_detail_type)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name,
                                 column_name,
                                 id,
                                 date,
                                 old_value,
                                 new_value,
								 modified_by)
    SELECT table_name    = 'program_sso_activities',
           column_name   = 'soo_detail_type',
           ID1          = i.sso_detail_id,
           date         = @CurrDate,
           old_value     = d.soo_detail_type,
           new_value     = i.[soo_detail_type],
           modified_by   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_detail_id = i.sso_detail_id)
    WHERE ISNULL(d.soo_detail_type, '') != ISNULL(i.soo_detail_type, '');
  END

END;
GO
PRINT '[dbo].[TG_Program_sso_activities(Audit)_InsertUpdate] ha sido creado';
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
**  date: 05/29/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/28/2018 Vanessa Alcocer   Initial version
*******************************************************************************/
IF EXISTS (SELECT 1 FROM sys.triggers
    WHERE  NAME = 'TG_Program_sso(Audit)_InsertUpdate')
BEGIN
		DROP TRIGGER [dbo].[TG_Program_sso(Audit)_InsertUpdate]
		PRINT 'EL TRIGGER TG_Program_sso(Audit)_InsertUpdate SE ELIMINO '

END

GO
PRINT 'Creando TRIGGER [dbo].[TG_Program_sso(Audit)_InsertUpdate]...';
GO
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
    INSERT INTO dbo.AuditHistory(table_name,
                                 column_name,
                                 id,
                                 date,
                                 old_value,
                                 new_value,
								 modified_by)
    SELECT table_name    = 'program_sso',
           column_name   = 'sso_execution_time',
           ID1          = i.sso_id,
           date         = @CurrDate,
           old_value     = d.sso_execution_time,
           new_value     = i.[sso_execution_time],
           modified_by   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_id = i.sso_id)
    WHERE ISNULL(d.sso_execution_time, '') != ISNULL(i.sso_execution_time, '');
  END

  IF UPDATE(sso_goal)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name,
                                 column_name,
                                 id,
                                 date,
                                 old_value,
                                 new_value,
								 modified_by)
    SELECT table_name    = 'program_sso',
           column_name   = 'sso_goal',
           ID1          = i.sso_id,
           date         = @CurrDate,
           old_value     = d.[sso_goal],
           new_value     = i.[sso_goal],
           modified_by   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_id = i.sso_id)
    WHERE ISNULL(d.sso_goal, '') != ISNULL(i.sso_goal, '');
  END

    IF UPDATE(sso_indicator)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name,
                                 column_name,
                                 id,
                                 date,
                                 old_value,
                                 new_value,
								 modified_by)
    SELECT table_name    = 'program_sso',
           column_name   = 'sso_indicator',
           ID1          = i.sso_id,
           date         = @CurrDate,
           old_value     = d.sso_indicator,
           new_value     = i.[sso_indicator],
           modified_by   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_id = i.sso_id)
    WHERE ISNULL(d.sso_indicator, '') != ISNULL(i.sso_indicator, '');
  END

    IF UPDATE(sso_objetive)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name,
                                 column_name,
                                 id,
                                 date,
                                 old_value,
                                 new_value,
								 modified_by)
    SELECT table_name    = 'program_sso',
           column_name   = 'sso_objetive',
           ID1          = i.sso_id,
           date         = @CurrDate,
           old_value     = d.sso_objetive,
           new_value     = i.[sso_objetive],
           modified_by   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_id = i.sso_id)
    WHERE ISNULL(d.sso_objetive, '') != ISNULL(i.sso_objetive, '');
  END

      IF UPDATE(sso_responsable)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name,
                                 column_name,
                                 id,
                                 date,
                                 old_value,
                                 new_value,
								 modified_by)
    SELECT table_name    = 'program_sso',
           column_name   = 'sso_responsable',
           ID1          = i.sso_id,
           date         = @CurrDate,
           old_value     = d.sso_responsable,
           new_value     = i.[sso_responsable],
           modified_by   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_id = i.sso_id)
    WHERE ISNULL(d.sso_responsable, '') != ISNULL(i.sso_responsable, '');
  END

        IF UPDATE(sso_total_cost)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name,
                                 column_name,
                                 id,
                                 date,
                                 old_value,
                                 new_value,
								 modified_by)
    SELECT table_name    = 'program_sso',
           column_name   = 'sso_total_cost',
           ID1          = i.sso_id,
           date         = @CurrDate,
           old_value     = d.sso_total_cost,
           new_value     = i.[sso_total_cost],
           modified_by   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_id = i.sso_id)
    WHERE ISNULL(d.sso_total_cost, '') != ISNULL(i.sso_total_cost, '');
  END

END;
GO
PRINT '[dbo].[TG_Program_sso(Audit)_InsertUpdate] ha sido creado';
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
**  date: 05/29/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/29/2018 Vanessa Alcocer   Initial version
*******************************************************************************/
IF EXISTS (SELECT 1 FROM sys.triggers
    WHERE  NAME = 'TG_Program_sso_resource(Audit)_InsertUpdate')
BEGIN
		DROP TRIGGER [dbo].[TG_Program_sso_resource(Audit)_InsertUpdate]
		PRINT 'EL TRIGGER TG_Program_sso_resource(Audit)_InsertUpdate SE ELIMINO '

END

GO
PRINT 'Creando TRIGGER [dbo].[TG_Program_sso_resource(Audit)_InsertUpdate]...';
GO
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
    INSERT INTO dbo.AuditHistory(table_name,
                                 column_name,
                                 id,
                                 date,
                                 old_value,
                                 new_value,
								 modified_by)
    SELECT table_name    = 'program_sso_resource',
           column_name   = 'sso_resource_cost',
           ID1          = i.sso_resource_id,
           date         = @CurrDate,
           old_value     = d.sso_resource_cost,
           new_value     = i.[sso_resource_cost],
           modified_by   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_resource_id = i.sso_resource_id)
    WHERE ISNULL(d.sso_resource_cost, '') != ISNULL(i.sso_resource_cost, '');
  END

  IF UPDATE(sso_resource_detail)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name,
                                 column_name,
                                 id,
                                 date,
                                 old_value,
                                 new_value,
								 modified_by)
    SELECT table_name    = 'program_sso_resource',
           column_name   = 'sso_resource_detail',
           ID1          = i.sso_resource_id,
           date         = @CurrDate,
           old_value     = d.[sso_resource_detail],
           new_value     = i.[sso_resource_detail],
           modified_by   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_detail_id = i.sso_detail_id)
    WHERE ISNULL(d.sso_resource_detail, '') != ISNULL(i.sso_resource_detail, '');
  END

END;
GO
PRINT '[dbo].[TG_Program_sso_resource(Audit)_InsertUpdate] ha sido creado';
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
**  date: 05/29/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/29/2018 Vanessa Alcocer   Initial version
*******************************************************************************/
IF EXISTS (SELECT 1 FROM sys.triggers
    WHERE  NAME = 'TG_Program_sso_trainer(Audit)_InsertUpdate')
BEGIN
		DROP TRIGGER [dbo].[TG_Program_sso_trainer(Audit)_InsertUpdate]
		PRINT 'EL TRIGGER TG_Program_sso_trainer(Audit)_InsertUpdate SE ELIMINO '

END

GO
PRINT 'Creando TRIGGER [dbo].[TG_Program_sso_trainer(Audit)_InsertUpdate]...';
GO

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
    INSERT INTO dbo.AuditHistory(table_name,
                                 column_name,
                                 id,
                                 date,
                                 old_value,
                                 new_value,
								 modified_by)
    SELECT table_name    = 'program_sso_trainer',
           column_name   = 'sso_trainer_skills',
           ID1          = i.sso_trainer_id,
           date         = @CurrDate,
           old_value     = d.sso_trainer_skills,
           new_value     = i.[sso_trainer_skills],
           modified_by   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_trainer_id = i.sso_trainer_id)
    WHERE ISNULL(d.sso_trainer_skills, '') != ISNULL(i.sso_trainer_skills, '');
  END

  IF UPDATE(sso_trainer_ci)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name,
                                 column_name,
                                 id,
                                 date,
                                 old_value,
                                 new_value,
								 modified_by)
    SELECT table_name    = 'program_sso_trainer',
           column_name   = 'sso_trainer_ci',
           ID1          = i.sso_trainer_id,
           date         = @CurrDate,
           old_value     = d.[sso_trainer_ci],
           new_value     = i.[sso_trainer_ci],
           modified_by   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_trainer_id = i.sso_trainer_id)
    WHERE ISNULL(d.sso_trainer_ci, '') != ISNULL(i.sso_trainer_ci, '');
  END

    IF UPDATE(sso_trainer_name)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name,
                                 column_name,
                                 id,
                                 date,
                                 old_value,
                                 new_value,
								 modified_by)
    SELECT table_name    = 'program_sso_trainer',
           column_name   = 'sso_trainer_name',
           ID1          = i.sso_trainer_id,
           date         = @CurrDate,
           old_value     = d.[sso_trainer_name],
           new_value     = i.[sso_trainer_name],
           modified_by   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_trainer_id = i.sso_trainer_id)
    WHERE ISNULL(d.sso_trainer_name, '') != ISNULL(i.sso_trainer_name, '');
  END

      IF UPDATE(sso_trainer_specialty)
  BEGIN
    INSERT INTO dbo.AuditHistory(table_name,
                                 column_name,
                                 id,
                                 date,
                                 old_value,
                                 new_value,
								 modified_by)
    SELECT table_name    = 'program_sso_trainer',
           column_name   = 'sso_trainer_specialty',
           ID1          = i.sso_trainer_id,
           date         = @CurrDate,
           old_value     = d.[sso_trainer_specialty],
           new_value     = i.[sso_trainer_specialty],
           modified_by   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_trainer_id = i.sso_trainer_id)
    WHERE ISNULL(d.sso_trainer_specialty, '') != ISNULL(i.sso_trainer_specialty, '');
  END

END;
GO
PRINT '[dbo].[TG_Program_sso_trainer(Audit)_InsertUpdate] ha sido creado';
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
**  date: 05/29/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/29/2018 Vanessa Alcocer   Initial version
*******************************************************************************/

IF EXISTS (SELECT 1 FROM sys.triggers
    WHERE  NAME = 'TG_Roles(Audit)_InsertUpdate')
BEGIN
		DROP TRIGGER [dbo].[TG_Roles(Audit)_InsertUpdate]
		PRINT 'EL TRIGGER TG_Roles(Audit)_InsertUpdate SE ELIMINO '

END

GO
PRINT 'Creando TRIGGER [dbo].[TG_Roles(Audit)_InsertUpdate]...';
GO
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
    INSERT INTO dbo.AuditHistory(table_name,
                                 column_name,
                                 id,
                                 date,
                                 old_value,
                                 new_value,
								 modified_by)
    SELECT table_name    = 'roles',
           column_name   = 'role_name',
           ID1          = i.role_id,
           date         = @CurrDate,
           old_value     = d.role_name,
           new_value     = i.[role_name],
           modified_by   = i.modified_by
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.role_id = i.role_id)
    WHERE ISNULL(d.role_name, '') != ISNULL(i.role_name, '');
  END
END;
GO
PRINT '[dbo].[TG_Roles(Audit)_InsertUpdate] ha sido creado';
GO