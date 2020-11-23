CREATE PROCEDURE [stg].[spDeleteFCT_8]
(
	 @FileKey nvarchar(50)
	,@FileName nvarchar(200)
)
AS
BEGIN
    SET NOCOUNT ON

	declare @idKpi int = (select ID_DIM_KPI from ETL_FCT where DSC_FILE = @FileName)

	delete 
	  from FCT_KPI_ANO
	 where ID_DIM_KPI = @idKpi
	   and CD_ANO in (select distinct ano 
	                    from stg.tbl_F_8
					   where FileName = @FileName 
					     and FileKey = @FileKey 
						 and ano is not null)

	delete 
	  from FCT_KPI_TRIMESTRE
	 where ID_DIM_KPI = @idKpi
	   and CD_ANO_TRIMESTRE in (select distinct ano+'Q'+trimestre 
	                              from stg.tbl_F_8
							 	 where FileName = @FileName 
							 	   and FileKey = @FileKey 
								   and ano is not null 
								   and trimestre is not null)

	delete 
	  from FCT_KPI_MES
	 where ID_DIM_KPI = @idKpi
	   and CD_ANO_MES in (select distinct ano+'M'+right('0'+cast(mes as varchar(50)),2) 
	                        from stg.tbl_F_8
						   where FileName = @FileName 
						     and FileKey = @FileKey 
							 and ano is not null 
							 and mes is not null)

	--descomentar quando os ficheiros sem dimensºao temporal forem unicos
	--delete 
	--  from FCT_KPI
	-- where ID_DIM_KPI = @idKpi

	--testes!!!!
	truncate table stg.testes
END
