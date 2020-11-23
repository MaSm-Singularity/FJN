CREATE     PROCEDURE [dbo].[spStgLaGetWorkL2]
AS
BEGIN
    SET NOCOUNT ON

	declare @i int = 0

	select @i = count(*) from ETL_INPUT_FILES where L1Status in ('I','R')
	if @i > 0
		goto noResults

	declare c1 cursor for
	select fileKey,fileName from (select * from ETL_INPUT_FILES a1
	 cross apply dbo.fnSplitFullName(FullFileName) a2) a
	 where a.fileType = 'F'
	 order by fileKey asc

	declare @fileKey varchar(50),@fileName varchar(600)
	declare @queueAvail int = 10 - (select count(*) from ETL_INPUT_FILES where L1Status = 'R' or L2Status = 'R')
	if @queueAvail < 0 set @queueAvail = 0

	open c1
	fetch next from c1 into @fileKey,@fileName

	while @@FETCH_STATUS = 0
	begin
		declare @cnt int = 0
	
		select @cnt = count(*) from (
			select c.DSC_FILE
			  from ETL_FCT a
			  join ETL_FCT_DIM b on a.ID_ETL_FCT = b.ID_ETL_FCT
			  join ETL_DIM c on b.ID_ETL_DIM = c.ID_ETL_DIM
			 where a.DSC_FILE = @fileName
			union all
			select @filename
		  except
			select b.fileName from ETL_INPUT_FILES a
			 cross apply dbo.fnSplitFullName(FullFileName) b
			 where a.L1Status = 'F'
			   and a.L1RunStatus = 'Succeeded'
			   and b.fileKey = @fileKey)x

		if @cnt = 0
		begin
			declare @ids table(id bigint)

			if (select count(*) from ETL_INPUT_FILES where L2Status = 'R') = 0
			begin
				update top(@queueAvail) a
				   set L2Status = 'R'
				output inserted.id into @ids
				  from ETL_INPUT_FILES a
				 outer apply dbo.fnSplitFullName(FullFileName) b
				 where a.L2Status = 'I'
				   and b.fileKey = @fileKey
				   and b.fileType = 'D'

				if (select count(*) from ETL_INPUT_FILES where L2Status = 'R') = 0
					and (select count(*)
					       from ETL_INPUT_FILES a
						  outer apply dbo.fnSplitFullName(FullFileName) b
						  where b.fileKey = @fileKey
						    and b.fileType = 'D'
							and a.L2Status <> 'F') = 0
					update top(1) a
						set L2Status = 'R'
					output inserted.id into @ids
						from ETL_INPUT_FILES a
						outer apply dbo.fnSplitFullName(FullFileName) b
						where a.L2Status = 'I'
						and b.fileKey = @fileKey
						and b.fileType = 'F'
			end

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

			close c1
			deallocate c1
			return
		end
		fetch next from c1 into @fileKey,@fileName
	end

	close c1
	deallocate c1

noResults:
	SELECT top 0 a.id RowId,		
		b.fileKey fileKey,
		a.FullFileName fullFileName,
		b.fileName fileName,
		b.fileExtension fileExtension,
		b.fileType fileType,
		b.fileDestinationTemplate fileDestinationTemplate,
		b.targetTableName targetTableName
	from ETL_INPUT_FILES a
	outer apply dbo.fnSplitFullName(FullFileName) b
end