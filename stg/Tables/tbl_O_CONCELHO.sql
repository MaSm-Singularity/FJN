CREATE TABLE [stg].[tbl_O_CONCELHO] (
    [id]           BIGINT         IDENTITY (1, 1) NOT NULL,
    [FileKey]      NVARCHAR (MAX) NULL,
    [FileName]     NVARCHAR (MAX) NULL,
    [nuts_ii_cod]  NVARCHAR (MAX) NULL,
    [nuts_iii_cod] NVARCHAR (MAX) NULL,
    [concelho_cod] NVARCHAR (MAX) NULL,
    [concelho]     NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_tbl_O_CONCELHO] PRIMARY KEY CLUSTERED ([id] ASC)
);

