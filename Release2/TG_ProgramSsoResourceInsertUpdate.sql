--====================================
--  Create database trigger template
--====================================

--Trigger of Program_sso_resource Table
/******************************************************************************
**  Name: TG_Program_sso_resource(Audit)_InsertUpdate
**  Desc: Audit History for program_sso_resource table
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
CREATE TRIGGER [dbo].[TG_Program_sso_resource(Audit)_InsertUpdate]
ON [dbo].[program_sso_resource]
FOR INSERT, UPDATE
AS
BEGIN
  IF TRIGGER_NESTLEVEL(@@ProcID) > 1
    RETURN

  SET NOCOUNT ON;
  SET XACT_ABORT ON;

  DECLARE @CurrDate DATETIME = GETUTCDATE();

  IF UPDATE(sso_resource_cost)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'program_sso_resource',
           ColumnName   = 'sso_resource_cost',
           ID1          = i.sso_resource_id,
           Date         = @CurrDate,
           OldValue     = d.sso_resource_cost,
           NewValue     = i.[sso_resource_cost],
           ModifiedBy   = i.ModifiedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_resource_id = i.sso_resource_id)
    WHERE ISNULL(d.sso_resource_cost, '') != ISNULL(i.sso_resource_cost, '');
  END

  IF UPDATE(sso_resource_detail)
  BEGIN
    INSERT INTO dbo.AuditHistory(TableName,
                                 ColumnName,
                                 ID,
                                 Date,
                                 OldValue,
                                 NewValue,
								 ModifiedBy)
    SELECT TableName    = 'program_sso_resource',
           ColumnName   = 'sso_resource_detail',
           ID1          = i.sso_resource_id,
           Date         = @CurrDate,
           OldValue     = d.[sso_resource_detail],
           NewValue     = i.[sso_resource_detail],
           ModifiedBy   = i.ModifiedBy
    FROM deleted d
    FULL OUTER JOIN inserted i ON (d.sso_detail_id = i.sso_detail_id)
    WHERE ISNULL(d.sso_resource_detail, '') != ISNULL(i.sso_resource_detail, '');
  END

END;



