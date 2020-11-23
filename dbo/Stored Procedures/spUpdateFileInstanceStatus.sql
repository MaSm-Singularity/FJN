CREATE   PROCEDURE [dbo].[spUpdateFileInstanceStatus]
(
	@fileKey nvarchar(50),
	@fileName nvarchar(2000),
	@fileType nvarchar(50),
	@oldStatus int,
	@newStatus int
)
AS
BEGIN
    SET NOCOUNT ON

	update ETL_FILE_INSTANCES
	   set ID_FILE_STATUS = @newStatus
	      ,ACCEPTED_DATE = getdate()
	 where FILE_KEY = @fileKey
	   and FILE_NAME = @fileName
	   and FILE_TYPE = @fileType
	   and ID_FILE_STATUS = @oldStatus
END
