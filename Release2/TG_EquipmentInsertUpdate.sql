--Trigger of Equipment table
/******************************************************************************
**  Name: TG_Equipment(Audit)_InsertUpdate
**  Desc: Audit History for equipment table
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
CREATE TRIGGER [dbo].[TG_Equipment(Audit)_InsertUpdate]
ON [dbo].[Equipment]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1 
    RETURN
 
  SET NOCOUNT ON;
  SET XACT_ABORT ON;
 
  DECLARE @CurrDate DATETIME = GETUTCDATE();
  
  IF UPDATE(equipment_name)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Equipment', 
           ColumnName   = 'equipment_name',
           ID1          = i.equipment_id, 
           Date         = @CurrDate, 
           OldValue     = d.[equipment_name], 
           NewValue     = i.[equipment_name],
           ModifiedBy   = i.ModifiedBy 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.equipment_id = i.equipment_id)
    WHERE ISNULL(d.equipment_name, '') != ISNULL(i.equipment_name, '');
  END
  IF UPDATE(equipment_type)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID,
                                 Date,
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Equipment', 
           ColumnName   = 'equipment_type',
           ID1          = i.equipment_id,
           Date         = @CurrDate,
           OldValue     = d.[equipment_type], 
           NewValue     = i.[equipment_type],
           ModifiedBy   = i.ModifiedBy
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.equipment_id = i.equipment_id)
    WHERE ISNULL(d.equipment_type, '') != ISNULL(i.equipment_type, '');
  END
  IF UPDATE(equipment_description)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID,
                                 Date,
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'Equipment', 
           ColumnName   = 'equipment_description',
           ID1          = i.equipment_id,
           Date         = @CurrDate,
           OldValue     = d.[equipment_description], 
           NewValue     = i.[equipment_description],
           ModifiedBy   = i.ModifiedBy
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.equipment_id = i.equipment_id)
    WHERE ISNULL(d.equipment_description, '') != ISNULL(i.equipment_description, '');
  END
END;
