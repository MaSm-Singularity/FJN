CREATE   PROCEDURE [stg].[spStgDelete_Facts_API]
(
	--Inputs
    @codKpi nvarchar(100)


)
AS
BEGIN
    SET NOCOUNT ON

	begin
			declare @sqlDeleteStatment nvarchar(1000) = 'Delete from [stg].[tbl_F_100] where FileName = '''+ @codKpi +''''
			
			exec sp_executesql @sqlDeleteStatment
	end

END
