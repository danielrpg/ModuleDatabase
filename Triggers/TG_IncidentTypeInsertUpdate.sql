--Trigger of Incident_type Table
/******************************************************************************
**  Name: TG_Incident_type(Audit)_InsertUpdate
**  Desc: Audit History for Incident_type table
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
CREATE TRIGGER [dbo].[TG_Incident_type(Audit)_InsertUpdate]
ON [dbo].[Incident_type]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
  --incident_type_name
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
           ModifiedBy   = i.ModifiedBy          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.incident_type_id = i.incident_type_id)
    WHERE ISNULL(d.incident_type_name, '') != ISNULL(i.incident_type_name, '');
  END
  --incident_type_description
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
           ModifiedBy   = i.ModifiedBy          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.incident_type_id = i.incident_type_id)
    WHERE ISNULL(d.incident_type_description, '') != ISNULL(i.incident_type_description, '');
  END
  --incident_type_type
  IF UPDATE(incident_type_type)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Incident', 
           ColumnName   = 'incident_type_type',
           ID1          = i.incident_type_id, 
           Date         = @CurrDate, 
           OldValue     = d.[incident_type_type], 
           NewValue     = i.[incident_type_type],
           ModifiedBy   = i.ModifiedBy          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.incident_type_id = i.incident_type_id)
    WHERE ISNULL(d.incident_type_type, '') != ISNULL(i.incident_type_type, '');
  END
  --incident_type_subtype
  IF UPDATE(incident_type_subtype)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Incident', 
           ColumnName   = 'incident_type_type',
           ID1          = i.incident_type_id, 
           Date         = @CurrDate, 
           OldValue     = d.[incident_type_subtype], 
           NewValue     = i.[incident_type_subtype],
           ModifiedBy   = i.ModifiedBy          
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.incident_type_id = i.incident_type_id)
    WHERE ISNULL(d.incident_type_subtype, '') != ISNULL(i.incident_type_subtype, '');
  END
END;
