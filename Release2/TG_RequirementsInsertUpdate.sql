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
IF EXISTS (SELECT * FROM sys.triggers
    WHERE  NAME = 'TG_Requirements(Audit)_InsertUpdate')
BEGIN
		DROP TRIGGER [dbo].[TG_Requirements(Audit)_InsertUpdate]
		PRINT 'EL TRIGGER TG_Requirements(Audit)_InsertUpdate SE ELIMINO '

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
  
  IF UPDATE(requirement_description)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'requirements', 
           ColumnName   = 'requirement_description',
           ID1          = i.requirements_id, 
           Date         = @CurrDate, 
           OldValue     = d.[requirement_description], 
           NewValue     = i.[requirement_description],
           ModifiedBy   = i.ModifiedBy 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.requirements_id = i.requirements_id)
    WHERE ISNULL(d.requirement_description, '') != ISNULL(i.requirement_description, '');
  END
  IF UPDATE(requirement_name)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName, 
                                 ColumnName, 
                                 ID, 
                                 Date, 
                                 OldValue, 
                                 NewValue,
								 ModifiedBy) 
    SELECT TableName    = 'requirements', 
           ColumnName   = 'requirement_name',
           ID1          = i.requirements_id, 
           Date         = @CurrDate, 
           OldValue     = d.[requirement_name], 
           NewValue     = i.[requirement_name],
           ModifiedBy   = i.ModifiedBy 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.requirements_id = i.requirements_id)
    WHERE ISNULL(d.requirement_name, '') != ISNULL(i.requirement_name, '');
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
           ID1          = i.requirements_id, 
           Date         = @CurrDate, 
           OldValue     = d.[position_position_id], 
           NewValue     = i.[position_position_id],
           ModifiedBy   = i.ModifiedBy 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.requirements_id = i.requirements_id)
    WHERE ISNULL(d.position_position_id, '') != ISNULL(i.position_position_id, '');
  END

  
END;
