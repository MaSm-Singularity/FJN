create procedure spGetNextLV2
as
begin
	declare @fileKey nvarchar(50)
		   ,@fileName nvarchar(200)  = null
		   ,@fileType nvarchar(50)

	--1* chave a processar
	select top 1 @fileKey = efi.FILE_KEY
	  from ETL_FILE_INSTANCES efi
	 where efi.ID_FILE_STATUS in (1,2,5)
	 order by efi.CREATE_DATE asc

	--todos os ficheiros presentes?
	declare @cnt int
	select @cnt=count(*)
	from ETL_FCT ef
	join ETL_FCT_DIM efd on efd.ID_ETL_FCT = ef.ID_ETL_FCT
	join ETL_DIM ed on ed.ID_ETL_DIM = efd.ID_ETL_DIM
	left join ETL_FILE_INSTANCES efi_f on efi_f.FILE_NAME = ef.DSC_FILE
	left join ETL_FILE_INSTANCES efi_d on efi_d.FILE_NAME = ed.DSC_FILE
	where efi_d.ID_ETL_FLE_INSTANCES is null and efi_f.ID_ETL_FLE_INSTANCES is null
	  and ef.DSC_FCT = (
		select top 1 efi.FILE_NAME
		from ETL_FILE_INSTANCES efi
		where efi.FILE_TYPE = 'F'
		  and efi.ID_FILE_STATUS not in (4)
		order by efi.ID_ETL_FLE_INSTANCES)

	if @cnt = 0
	begin -- todos os ficheiros presentes
	    --vai selecionar o primeiro
		select @fileKey = @fileKey
			  ,@fileName = efi.FILE_NAME
			  ,@fileType = efi.FILE_TYPE
		 from (
			select efi_f.FILE_NAME FILE_NAME
				  ,'F' FILE_TYPE
			from ETL_FILE_INSTANCES efi_f 
			where efi_f.FILE_KEY = @fileKey
			  and efi_f.ID_FILE_STATUS = 2
			union all
			select efi_d.FILE_NAME
				  ,'D'
			from ETL_FILE_INSTANCES efi_d 
			where efi_d.FILE_KEY = @fileKey
			  and efi_d.ID_FILE_STATUS = 2)efi
		order by efi.FILE_TYPE
		        ,efi.FILE_NAME
	end
	
	if @fileName is null
	begin
		select @fileKey = ''
			  ,@fileName = ''
			  ,@fileType = ''
	end
	else
	begin
		update ETL_FILE_INSTANCES
		   set ID_FILE_STATUS = 5
		 where FILE_KEY = @fileKey
		   and FILE_NAME = @fileName
		   and ID_FILE_STATUS = 2
	end
end