CREATE   PROCEDURE [stg].[spStgDelete_Dims]
(
	--Inputs
    @FileKey nvarchar(50),
	@FileName nvarchar(200),
	@FileDestinationTemplate int


)
AS
BEGIN
    SET NOCOUNT ON

	declare @tableName nvarchar(50) = (select concat('stg.tbl_D_',@FileDestinationTemplate))
	declare @query nvarchar(500) = 'select id from ' + @tableName +' where [FileKey] = '''+@FileKey+''' and [FileName] = '''+@FileName+''''
	declare @sqlCursorStatment varchar(1000) = 'Declare c1 CURSOR for '+@query
	
	declare @id bigint
	       ,@cnt int = 0
	declare @sqlDeleteStatment nvarchar(1000) = 'Delete from '+@tableName +' where id = @P1'

	exec (@sqlCursorStatment)

	open c1

	fetch next from c1 into @id
	
	begin transaction

	while @@FETCH_STATUS = 0
	begin
		if @cnt >= 10000
		begin
			select @cnt = 0
			commit transaction
			begin transaction
		end
		select @cnt = @cnt + 1

		exec sp_executesql @sqlDeleteStatment,N'@P1 int',@id

		fetch next from c1 into @id
	end

	commit transaction

	close c1
	deallocate c1

END
