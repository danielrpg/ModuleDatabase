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
IF EXISTS (SELECT * FROM sys.triggers
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
           ModifiedBy   = i.ModifiedBy 
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
           ModifiedBy   = i.ModifiedBy 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.department_id = i.department_id)
    WHERE ISNULL(d.department_name, '') != ISNULL(i.department_name, '');
  END
  
END;
