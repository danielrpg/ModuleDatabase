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
           ModifiedBy   = i.ModifiedBy 
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
           ModifiedBy   = i.ModifiedBy 
    FROM deleted d 
    FULL OUTER JOIN inserted i ON (d.area_id = i.area_id)
    WHERE ISNULL(d.area_description, '') != ISNULL(i.area_description, '');
  END
  
END;
