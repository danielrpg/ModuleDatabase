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
IF EXISTS (SELECT * FROM sys.triggers
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
           ModifiedBy   = i.ModifiedBy 
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
           ModifiedBy   = i.ModifiedBy 
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
           ModifiedBy   = i.ModifiedBy 
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
           ModifiedBy   = i.ModifiedBy 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.position_id = i.position_id)
    WHERE ISNULL(d.parent_position_position_id, '') != ISNULL(i.parent_position_position_id, '');
  END
END;
