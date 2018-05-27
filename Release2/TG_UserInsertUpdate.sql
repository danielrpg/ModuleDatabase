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
CREATE TRIGGER [dbo].[TG_User(Audit)_InsertUpdate]
ON [dbo].[user]
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
           ModifiedBy   = i.ModifiedBy 
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
           ModifiedBy   = i.ModifiedBy 
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
           ModifiedBy   = i.ModifiedBy 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.user_id = i.user_id)
    WHERE ISNULL(d.user_active, '') != ISNULL(i.user_active, '');
  END
END;
