--====================================
--  Create database trigger template
--====================================

--Trigger of roles Table
/******************************************************************************
**  Name: TG_Roles(Audit)_InsertUpdate
**  Desc: Audit History for roles table
**
**  Called by: ssi
**
**  Author: Patsy Vanessa Alcocer Iriarte
**
**  Date: 05/29/2018
*******************************************************************************
**                            Change History
*******************************************************************************
**   Date:     Author:                            Description:
** --------   --------        ---------------------------------------------------
** 05/29/2018 Vanessa Alcocer   Initial version
*******************************************************************************/
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
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'roles',
           ColumnName   = 'role_name',
           ID1          = i.role_id,
           Date         = @CurrDate,
           OldValue     = d.role_name,
           NewValue     = i.[role_name],
           ModifiedBy   = i.ModifiedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.role_id = i.role_id)
    WHERE ISNULL(d.role_name, '') != ISNULL(i.role_name, '');
  END
END;



