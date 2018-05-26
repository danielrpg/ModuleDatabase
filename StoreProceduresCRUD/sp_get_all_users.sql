CREATE PROCEDURE [dbo].[sp_get_all_users]
AS
SET XACT_ABORT ON;
SET NOCOUNT ON;
BEGIN
    SELECT * FROM [dbo].[users];
END