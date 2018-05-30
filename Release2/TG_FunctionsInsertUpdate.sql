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
IF EXISTS (SELECT * FROM sys.triggers
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
           ModifiedBy   = i.ModifiedBy 
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
           ModifiedBy   = i.ModifiedBy 
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
           ModifiedBy   = i.ModifiedBy 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.func_id = i.func_id)
    WHERE ISNULL(d.position_position_id, '') != ISNULL(i.position_position_id, '');
  END

  
END;
