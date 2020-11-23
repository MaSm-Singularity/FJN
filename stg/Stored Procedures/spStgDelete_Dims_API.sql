CREATE   PROCEDURE [stg].[spStgDelete_Dims_API]
(
	--Inputs
    @cod_kpi nvarchar(2000)


)
AS
BEGIN
    SET NOCOUNT ON

	begin
			
				declare @sqlDeleteStatment nvarchar(1000) = '
				delete from [stg].[tbl_D_2]
				where filename in(
					select c.DSC_FILE
					from ETL_FCT a
					join ETL_FCT_DIM b on a.ID_ETL_FCT = b.ID_ETL_FCT
					join ETL_DIM c on b.ID_ETL_DIM = c.ID_ETL_DIM
					where a.DSC_FILE = '''+ @cod_kpi +''')'
			
				exec sp_executesql @sqlDeleteStatment
	end

END
