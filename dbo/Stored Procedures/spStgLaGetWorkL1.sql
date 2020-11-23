CREATE   PROCEDURE [dbo].[spStgLaGetWorkL1]
AS
BEGIN
    SET NOCOUNT ON

	declare @ids table(id bigint)

	declare @cnt int = 10 - (select count(*) from ETL_INPUT_FILES where L1Status = 'R' or L2Status = 'R')
	if @cnt < 0 set @cnt = 0

	 update top(@cnt) ETL_INPUT_FILES
	    set L1Status = 'R'
	 output inserted.id into @ids
	  where L1Status = 'I'

    SELECT a.id RowId,		
	       b.fileKey fileKey,
		   a.FullFileName fullFileName,
		   b.fileName fileName,
		   b.fileExtension fileExtension,
		   b.fileType fileType,
		   b.fileDestinationTemplate fileDestinationTemplate,
		   b.targetTableName targetTableName
		from @ids i
		inner loop join ETL_INPUT_FILES a on a.id = i.id
		outer apply dbo.fnSplitFullName(FullFileName) b
END
