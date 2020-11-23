CREATE TABLE [stg].[tbl_F_4] (
    [id]                          BIGINT         IDENTITY (1, 1) NOT NULL,
    [FileKey]                     NVARCHAR (50)  NOT NULL,
    [FileName]                    NVARCHAR (200) NOT NULL,
    [prof_bf]                     NVARCHAR (200) NULL,
    [prof_bf_2]                   NVARCHAR (200) NULL,
    [competencias_onet_agr]       NVARCHAR (200) NULL,
    [competencias_onet_detalhada] NVARCHAR (200) NULL,
    [valor]                       NVARCHAR (200) NULL
);

