CREATE     PROCEDURE [stg].[spStgDelete_D_1]
(
    @FileKey nvarchar(50),
	@FileName nvarchar(200)
)
AS
BEGIN
    SET NOCOUNT ON

	declare c1 cursor for
		select id from stg.tbl_D_1
		 where [FileKey] = @FileKey
		   and [FileName] = @FileName

	declare @id bigint
	       ,@cnt int = 0

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

		delete from stg.tbl_D_1
		 where id = @id

		fetch next from c1 into @id
	end

	commit transaction

	close c1
	deallocate c1

END
