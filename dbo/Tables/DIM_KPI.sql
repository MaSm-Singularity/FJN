CREATE TABLE [dbo].[DIM_KPI] (
    [ID_DIM_KPI]       INT           NULL,
    [CD_KPI]           VARCHAR (100) NULL,
    [DSC_KPI]          VARCHAR (200) NULL,
    [DSC_KPI_CURTA]    VARCHAR (50)  NULL,
    [DSC_KPI_PBI]      VARCHAR (50)  NULL,
    [AGG_TIPO]         VARCHAR (10)  NULL,
    [CD_TIPO_EVOLUCAO] VARCHAR (50)  NULL,
    [FREQUENCIA]       VARCHAR (50)  NULL,
    [DSC_UNIDADE]      VARCHAR (20)  NULL,
    [FONTE]            VARCHAR (200) NULL,
    [TIPO_KPI]         VARCHAR (10)  NULL,
    [CALC_KPI]         INT           NULL,
    [MEDIDA_KPI]       VARCHAR (50)  NULL
);

