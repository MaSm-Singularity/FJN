CREATE PROCEDURE [stg].[spDeleteFCT_TCO_2_delete]
(
	@FileKey nvarchar(50)
)
AS
BEGIN
    SET NOCOUNT ON
	--proceder ao delete de todos os factos  de anos da kpi FileName com chave FileKey
	--ex:

	--delete from ...
	-- where cnt in (select distinct ano from stg.tbl_F_1 where FileName = 'TCO' and FileKey = @FileKey)

	--testes!!!!
	truncate table stg.testes
END
