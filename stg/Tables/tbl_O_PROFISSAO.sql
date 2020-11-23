CREATE TABLE [stg].[tbl_O_PROFISSAO] (
    [id]                     BIGINT          IDENTITY (1, 1) NOT NULL,
    [FileKey]                NVARCHAR (50)   NOT NULL,
    [FileName]               NVARCHAR (200)  NOT NULL,
    [prof_2d_cod]            NVARCHAR (4000) NULL,
    [prof_2d]                NVARCHAR (4000) NULL,
    [prof_3d_cod]            NVARCHAR (4000) NULL,
    [prof_3d]                NVARCHAR (4000) NULL,
    [prof_bf_cod]            NVARCHAR (4000) NULL,
    [prof_bf]                NVARCHAR (4000) NULL,
    [prof_bf_descricao]      NVARCHAR (4000) NULL,
    [prof_bf_tarefas]        NVARCHAR (4000) NULL,
    [prof_relacionadas]      NVARCHAR (4000) NULL,
    [work_styles]            NVARCHAR (4000) NULL,
    [technology_skills]      NVARCHAR (4000) NULL,
    [autoridade_competente1] NVARCHAR (4000) NULL,
    [link1]                  NVARCHAR (4000) NULL,
    [autoridade_competente2] NVARCHAR (4000) NULL,
    [link2]                  NVARCHAR (4000) NULL,
    [asset]                  NVARCHAR (4000) NULL,
    [visual_bg]              NVARCHAR (4000) NULL,
    CONSTRAINT [PK_tbl_O_PROFISSOES] PRIMARY KEY CLUSTERED ([id] ASC)
);

