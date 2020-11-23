
CREATE   PROCEDURE [stg].[spCheckinFile]
(
	--Inputs
    @fileFullName nvarchar(2000),

	--Outputs
	@fileKey nvarchar(50) output,
	@fileName nvarchar(2000) output,
	@fileExtension nvarchar(50) output,
	@fileType nvarchar(50) output,
	@fileDestinationTemplate int output,
	@targetTableName nvarchar(50) output
	
)
AS
BEGIN
    SET NOCOUNT ON

	declare @i1 int = (select charindex(N'_', @fileFullName))----get the first '_'
	declare @i2 int = (select charindex(N'.', @fileFullName))----get the first '.'
	declare @i3 int = (select charindex('_', @fileFullName, (charindex('_', @fileFullName, (charindex('_', @fileFullName, 1))+1))+1)) --get '_' 3º position 
	declare @i4 int = (select charindex('_', @fileFullName, (charindex('_', @fileFullName, 1))+1)) --get '_' 2º position 
	
	declare @fileNameFact nvarchar(100)
	declare @fileNameDim nvarchar(100)
	declare @fileNameOther nvarchar(100)

	SELECT	@fileNameFact=(substring(@fileFullName,@i1+1,@i2-1-@i1)),
			@fileNameDim=(substring(@fileFullName,@i3+1,@i2-1-@i3)),
			@fileNameOther=(substring(@fileFullName,@i4+1,@i2-1-@i4)),
			@fileKey=(substring(@fileFullName,1,@i1-1))
	print @fileNameFact
	print @fileNameDim
	print @fileNameOther
	print @fileKey
	

	declare @fileWildcard_F int =(select count(1) from [dbo].[ETL_FCT] as ref where ref.DSC_FILE = @fileNameFact)
	declare @fileWildcard_D int =(select count(1) from [dbo].[ETL_DIM] as ref where ref.DSC_FILE = @fileNameDim)
	declare @fileWildcard_O int =(select count(1) from [dbo].[ETL_OTHER] as ref where ref.DSC_FILE = @fileNameOther)
		

	if @fileWildcard_D = 1
		begin
			(select @fileExtension = [DSC_FILE_EXTENSION],
					@fileDestinationTemplate = CD_TEMPLATE,
					@fileName = [DSC_FILE],
					@fileType = 'D',
					@targetTableName = [DSC_DIM]
				from [dbo].[ETL_DIM] as ref where ref.DSC_FILE = @fileNameDim)
		end
	else if @fileWildcard_F = 1
		begin
			(select @fileExtension = [DSC_FILE_EXTENSION],
					@fileDestinationTemplate = CD_TEMPLATE,
					@fileName = [DSC_FILE],
					@fileType = 'F',
					@targetTableName = [DSC_FCT]
				from [dbo].[ETL_FCT] as ref where ref.DSC_FILE = @fileNameFact)
		end
	else if @fileWildcard_O = 1
		begin
			(select @fileExtension = [DSC_FILE_EXTENSION],
					@fileDestinationTemplate = CD_TEMPLATE,
					@fileName = [DSC_FILE],
					@fileType = 'O',
					@targetTableName = ''
				from [dbo].[ETL_OTHER] as ref where ref.DSC_FILE = @fileNameOther)
		end
	else
		begin
			(select @fileExtension = 'UNK',
					@fileType = 'UNK',
					@fileDestinationTemplate = -1 )
		end


	--select count(*)
	--  from ETL_FILE_INSTANCES efi
	-- where efi.FILE_NAME = @fileName
	--   and efi.FILE_KEY = @fileKey
	--   and efi.FILE_TYPE = @fileType
	--print 'ROWCOUNT'
	--print @@ROWCOUNT 
	--if @@ROWCOUNT > 0
	--begin
	--	select @fileExtension = 'DUP',
	--				@fileType = 'DUP',
	--				@fileDestinationTemplate = -1

	--	insert into ETL_FILE_INSTANCES (FILE_KEY,FILE_NAME,FILE_TYPE,ID_FILE_STATUS,PROCESSED_DATE)
	--	values (@fileKey,@fileName,@fileType,4,GETDATE())
	--end
	--else
	--begin
	--	insert into ETL_FILE_INSTANCES (FILE_KEY,FILE_NAME,FILE_TYPE,ID_FILE_STATUS)
	--	values (@fileKey,@fileName,@fileType,1)


	--end
END



