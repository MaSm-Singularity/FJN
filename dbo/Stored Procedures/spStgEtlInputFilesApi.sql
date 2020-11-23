
CREATE PROCEDURE [dbo].[spStgEtlInputFilesApi]
(
    -- Add the parameters for the stored procedure here
    @runID nvarchar(2000),
	@codKpi nvarchar(100),
	@fileKey nvarchar(100),
	@externalCode nvarchar(100)

)
AS
BEGIN
    SET NOCOUNT ON
	
	declare @count_dims int = 0
	declare @count_fcts int	= 0
	
	select @count_dims = count(*) 
		from (
			select c.DSC_FILE
			  from ETL_FCT a
			  join ETL_FCT_DIM b on a.ID_ETL_FCT = b.ID_ETL_FCT
			  join ETL_DIM c on b.ID_ETL_DIM = c.ID_ETL_DIM
			 where a.DSC_FILE =@codKpi
		  except
			select distinct FileName from [stg].[tbl_D_2]
			where filekey=@fileKey
			)dim
	
	select @count_fcts = count(*) from (
								select distinct FileName
								from [stg].[tbl_F_100] 
								where filekey=@fileKey 
								and FILENAME =@codKpi
			)fct
	
	--print 'DIMS:'
	--print @count_dims
	--print 'FCT:'
	--print @count_fcts

	
	if (@count_dims=0 and @count_fcts=1)
		begin
				declare @sqlInsertStatment nvarchar(4000) = N'INSERT INTO [dbo].[ETL_INPUT_FILES]
															([RecordDate],[FileId],[FullFileName],[ModDate]
															,[L1Status],[L1RunID],[L1RunStatus]
															,[L2Status],[L2RunID],[L2RunStatus])
															select GETUTCDATE() as [RecordDate],''http_request'' as [FileId],concat('''+ @fileKey +''',''_API-INE_REQ-HTTP_'',c.DSC_FILE,''.json'') as [FullFileName],GETUTCDATE() as [ModDate]
																,''F'' as [L1Status], '''+ @runID +''' as [L1RunID],''Succeeded'' as [L1RunStatus]
																,''I'' as [L2Status], null as [L2RunID], null as [L2RunStatus]
																			  from ETL_FCT a
																			  join ETL_FCT_DIM b on a.ID_ETL_FCT = b.ID_ETL_FCT
																			  join ETL_DIM c on b.ID_ETL_DIM = c.ID_ETL_DIM
																			 where a.DSC_FILE = '''+ @codKpi +'''
																union 
															select GETUTCDATE() as [RecordDate],''http_request'' as [FileId],concat('''+ @fileKey +''',''_'','''+ @codKpi +''',''.json'') as [FullFileName],GETUTCDATE() as [ModDate]
															,''F'' as [L1Status], '''+ @runID +''' as [L1RunID],''Succeeded'' as [L1RunStatus]
															,''I'' as [L2Status], null as [L2RunID], null as [L2RunStatus]
															'
				--print @sqlInsertStatment
				exec sp_executesql @sqlInsertStatment
		end
	else
		begin
			RAISERROR ('As tabelas de stg não foram totalmente carregadas ou as tabelas de parametros do modelo não estão corretas', -- Message text.
               16, -- Severity.
               1 -- State.
               );
		end

		
END
