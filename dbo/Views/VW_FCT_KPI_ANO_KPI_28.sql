
CREATE VIEW [dbo].[VW_FCT_KPI_ANO_KPI_28]
AS
select [ID_DIM_KPI], cd_ano
from [dbo].[FCT_KPI_ANO]
where id_dim_kpi=28
group by  [ID_DIM_KPI], cd_ano;
