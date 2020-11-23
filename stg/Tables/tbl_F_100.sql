CREATE TABLE [stg].[tbl_F_100] (
    [id]        BIGINT         IDENTITY (1, 1) NOT NULL,
    [FileKey]   NVARCHAR (50)  NOT NULL,
    [FileName]  NVARCHAR (200) NOT NULL,
    [ano]       NVARCHAR (200) NULL,
    [trimestre] NVARCHAR (200) NULL,
    [geocod]    NVARCHAR (200) NULL,
    [dim_3]     NVARCHAR (200) NULL,
    [dim_4]     NVARCHAR (200) NULL,
    [dim_5]     NVARCHAR (200) NULL,
    [valor]     NVARCHAR (200) NULL,
    CONSTRAINT [PK_tbl_F_100] PRIMARY KEY CLUSTERED ([id] ASC)
);

