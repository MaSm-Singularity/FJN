CREATE TABLE [dbo].[DIM_PROFISSAO_INE] (
    [ID_DIM_PROFISSAO_INE]               INT            NULL,
    [CD_PROFISSAO_INE]                   INT            NULL,
    [DSC_PROFISSAO_INE]                  VARCHAR (300)  NULL,
    [CD_PROF_3D_INE]                     INT            NULL,
    [DSC_PROF_3D_INE]                    VARCHAR (300)  NULL,
    [DSC_PROF_BF_DETALHADA_INE]          VARCHAR (750)  NULL,
    [DSC_PROF_BF_TAREFAS_INE]            VARCHAR (1000) NULL,
    [DSC_PROF_BF_NOMES_ALTERNATIVOS_INE] VARCHAR (300)  NULL,
    [DSC_PROF_REG_RELACIONADA_INE]       VARCHAR (2000) NULL,
    [URL_PROF_REG_RELACIONADA_INE]       VARCHAR (5000) NULL,
    [FL_BF_INE]                          BIT            NULL
);

