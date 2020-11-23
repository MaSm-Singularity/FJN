CREATE PROCEDURE [dbo].[spStgLaGetWorkApi]
AS
BEGIN
    SET NOCOUNT ON
	select distinct DSC_FILE from [dbo].[ETL_FCT] where CD_TEMPLATE=100
	order by DSC_FILE asc
END
