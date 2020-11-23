CREATE TABLE [stg].[tbl_F_2] (
    [id]        BIGINT         IDENTITY (1, 1) NOT NULL,
    [FileKey]   NVARCHAR (50)  NOT NULL,
    [FileName]  NVARCHAR (200) NOT NULL,
    [ano]       NVARCHAR (200) NULL,
    [prof_bf]   NVARCHAR (200) NULL,
    [prof_bf_2] NVARCHAR (200) NULL,
    [valor]     NVARCHAR (200) NULL,
    CONSTRAINT [PK_tbl_F_2] PRIMARY KEY CLUSTERED ([id] ASC)
);

