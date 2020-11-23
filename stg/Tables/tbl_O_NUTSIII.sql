CREATE TABLE [stg].[tbl_O_NUTSIII] (
    [id]           BIGINT          IDENTITY (1, 1) NOT NULL,
    [FileKey]      NVARCHAR (50)   NOT NULL,
    [FileName]     NVARCHAR (200)  NOT NULL,
    [nuts_ii_cod]  NVARCHAR (2000) NULL,
    [nuts_iii_cod] NVARCHAR (4000) NULL,
    [nuts_iii]     NVARCHAR (4000) NULL,
    CONSTRAINT [PK_tbl_O_NUTSIII] PRIMARY KEY CLUSTERED ([id] ASC)
);

