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
CREATE TRIGGER [dbo].[TG_Equipment(Audit)_InsertUpdate]
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
           ModifiedBy   = i.ModifiedBy 
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
           ModifiedBy   = i.ModifiedBy
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
           ModifiedBy   = i.ModifiedBy
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.equipament_id = i.equipament_id)
    WHERE ISNULL(d.equipament_description, '') != ISNULL(i.equipament_description, '');
  END
END;
