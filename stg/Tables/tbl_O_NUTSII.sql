CREATE TABLE [stg].[tbl_O_NUTSII] (
    [id]          BIGINT          IDENTITY (1, 1) NOT NULL,
    [FileKey]     NVARCHAR (50)   NOT NULL,
    [FileName]    NVARCHAR (200)  NOT NULL,
    [nuts_ii_cod] NVARCHAR (2000) NULL,
    [nuts_ii]     NVARCHAR (4000) NULL,
    CONSTRAINT [PK_tbl_O_NUTSII] PRIMARY KEY CLUSTERED ([id] ASC)
);

