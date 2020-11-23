CREATE PROCEDURE [stg].[spStgDeleteDemo]
(
    @key nvarchar(50)
)
AS
BEGIN
    SET NOCOUNT ON

	declare 
		@FileKey nvarchar(50),
		@FileName nvarchar(200),
		@variavel nvarchar(50),
		@ano nvarchar(50),
		@cnt int = 0

	declare c1 cursor for 
	select distinct [FileKey],[FileName],[variavel],[ano]
	  from stg.DEMO
	 where FileKey = @key

	open c1
	fetch next from c1
	 into @FileKey,@FileName,@variavel,@ano

	begin transaction 

	while @@FETCH_STATUS = 0
	begin
		select @cnt = @cnt + 1

		if @cnt > 5000
		begin
			select @cnt = 1
			commit transaction
			begin transaction
		end

		delete from stg.DEMO
		where [FileKey] = @FileKey
		  and [FileName] = @FileName
		  and [variavel] = @variavel
		  and [ano] = @ano

		fetch next from c1
		 into @FileKey,@FileName,@variavel,@ano
	end
	commit transaction

	close c1
	deallocate c1
END
